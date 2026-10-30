-- ---------------------------------------------------------------------------
-- validate.lua — checks a story table (pure Lua, no UI).
--
-- Two levels:
--   Validate.structure(story) — what the engine needs to run it at all: every
--     target exists, each section has exactly one kind of exit, items are
--     declared, dice sections only in stories with a character sheet.
--     The screen runs this on every story it loads, so a typo in a reader's
--     own story is reported instead of crashing mid-adventure.
--   Validate.full(story) — structure, plus: every section can be reached,
--     every ending can be reached, and no reachable state is a dead end
--     (all choices blocked and no ending). That walk follows item, flag and
--     gold conditions exactly; dice may go either way.
-- Both return errors (list of strings) and info (counts).
-- ---------------------------------------------------------------------------

local Validate = {}

local function list(v)
    if v == nil then return {} end
    if type(v) == "table" then return v end
    return { v }
end

local EXITS   = { "choices", "fight", "test", "roll", "ending" }
local ENDINGS = { win = true, death = true, ["end"] = true }

-- Every section id a section can lead to, with the conditions of each edge.
local function edges(sec)
    local out = {}
    if sec.choices then
        for _, ch in ipairs(sec.choices) do out[#out + 1] = { to = ch.to, ch = ch } end
    elseif sec.fight then
        out[#out + 1] = { to = sec.fight.win }
        if sec.fight.flee then out[#out + 1] = { to = sec.fight.flee } end
    elseif sec.test then
        out[#out + 1] = { to = sec.test.win }
        out[#out + 1] = { to = sec.test.lose }
    elseif sec.roll then
        for _, o in ipairs(sec.roll.outcomes or {}) do out[#out + 1] = { to = o.to } end
    end
    return out
end
Validate.edges = edges

function Validate.structure(story)
    local errs, info = {}, { sections = 0, endings = 0, wins = 0, fights = 0, tests = 0 }
    local function err(fmt, ...) errs[#errs + 1] = string.format(fmt, ...) end

    if type(story) ~= "table" then return { "story is not a table" }, info end
    if type(story.title) ~= "string" or story.title == "" then err("missing title") end
    if type(story.sections) ~= "table" then
        err("missing sections")
        return errs, info
    end
    local sections = story.sections
    local start = story.start or 1
    if not sections[start] then err("start section %s does not exist", tostring(start)) end

    local items = story.items or {}
    for _, it in ipairs(list(story.start_items)) do
        if not items[it] then err("start item '%s' is not declared in items", tostring(it)) end
    end

    for id, sec in pairs(sections) do
        info.sections = info.sections + 1
        if type(id) ~= "number" then err("section key %s is not a number", tostring(id)) end
        if type(sec) ~= "table" then
            err("section %s is not a table", tostring(id))
        else
            if type(sec.text) ~= "string" or sec.text == "" then err("section %s has no text", tostring(id)) end
            local n = 0
            for _, k in ipairs(EXITS) do if sec[k] ~= nil then n = n + 1 end end
            if n ~= 1 then err("section %s must have exactly one of choices/fight/test/roll/ending (has %d)", tostring(id), n) end
            if sec.ending ~= nil then
                if not ENDINGS[sec.ending] then err("section %s: ending must be win, death or end", tostring(id)) end
                info.endings = info.endings + 1
                if sec.ending == "win" then info.wins = info.wins + 1 end
            end
            if sec.choices and #sec.choices == 0 then err("section %s has an empty choices list", tostring(id)) end
            for i, ch in ipairs(sec.choices or {}) do
                if type(ch.text) ~= "string" or ch.text == "" then err("section %s choice %d has no text", tostring(id), i) end
                for _, it in ipairs(list(ch.need)) do
                    if not items[it] then err("section %s choice %d needs undeclared item '%s'", tostring(id), i, tostring(it)) end
                end
                for _, it in ipairs(list(ch.without)) do
                    if not items[it] then err("section %s choice %d: undeclared item '%s'", tostring(id), i, tostring(it)) end
                end
                if ch.cost ~= nil and (type(ch.cost) ~= "number" or ch.cost < 0) then
                    err("section %s choice %d: bad cost", tostring(id), i)
                end
            end
            for _, it in ipairs(list(sec.gain)) do
                if not items[it] then err("section %s gains undeclared item '%s'", tostring(id), tostring(it)) end
            end
            for _, it in ipairs(list(sec.lose)) do
                if not items[it] then err("section %s loses undeclared item '%s'", tostring(id), tostring(it)) end
            end
            if sec.fight then
                info.fights = info.fights + 1
                local en = sec.fight.enemies or { sec.fight }
                for _, e in ipairs(en) do
                    if type(e.name) ~= "string" or type(e.skill) ~= "number" or type(e.stamina) ~= "number" or e.stamina <= 0 then
                        err("section %s: each enemy needs name, skill and stamina > 0", tostring(id))
                    end
                end
            end
            if sec.test then info.tests = info.tests + 1 end
            if sec.luck ~= nil and type(sec.luck) ~= "number" then
                err("section %s: luck is a number (use test = { stat = \"luck\" } for a luck test)", tostring(id))
            end
            if sec.test and sec.test.stat and sec.test.stat ~= "skill" and sec.test.stat ~= "stamina" and sec.test.stat ~= "luck" then
                err("section %s: test stat must be skill, stamina or luck", tostring(id))
            end
            if sec.roll then
                local o = sec.roll.outcomes
                if type(o) ~= "table" or #o == 0 then
                    err("section %s: roll needs outcomes", tostring(id))
                else
                    local maxv = 6 * (sec.roll.dice or 1)
                    if o[#o].upto < maxv then err("section %s: last roll outcome must cover %d", tostring(id), maxv) end
                end
            end
            if (sec.fight or sec.test or sec.skill or sec.stamina or sec.luck) and not story.sheet then
                err("section %s uses stats but the story has no sheet", tostring(id))
            end
            for _, e in ipairs(edges(sec)) do
                if type(e.to) ~= "number" or not sections[e.to] then
                    err("section %s leads to missing section %s", tostring(id), tostring(e.to))
                end
            end
        end
    end
    return errs, info
end

-- ---------------------------------------------------------------------------
-- Condition-aware walk
--
-- State = section + items + flags + gold + which effect sections were
-- visited (effects apply once). Stats are left out: a fight, a test or a roll
-- may go any way.
-- ---------------------------------------------------------------------------

local function hasEffects(sec)
    return sec.gain or sec.lose or sec.set or sec.unset or sec.gold
end

-- Sections that lie on a cycle: only those can be entered twice, so only
-- their "visited" bit can change what happens (effects apply once).
local function cyclic(sections)
    local index, low, onstack, stack, out = {}, {}, {}, {}, {}
    local counter = 0
    local function strong(v)
        counter = counter + 1
        index[v], low[v] = counter, counter
        stack[#stack + 1] = v
        onstack[v] = true
        for _, e in ipairs(edges(sections[v])) do
            local w = e.to
            if sections[w] then
                if not index[w] then
                    strong(w)
                    low[v] = math.min(low[v], low[w])
                elseif onstack[w] then
                    low[v] = math.min(low[v], index[w])
                end
                if w == v then out[v] = true end
            end
        end
        if low[v] == index[v] then
            local comp = {}
            repeat
                local w = table.remove(stack)
                onstack[w] = nil
                comp[#comp + 1] = w
            until w == v
            if #comp > 1 then for _, w in ipairs(comp) do out[w] = true end end
        end
    end
    for id in pairs(sections) do
        if not index[id] then strong(id) end
    end
    return out
end

local function keyOf(st)
    local it = {}
    for k in pairs(st.items) do it[#it + 1] = k end
    table.sort(it)
    local fl = {}
    for k in pairs(st.flags) do fl[#fl + 1] = k end
    table.sort(fl)
    local vi = {}
    for k in pairs(st.visited) do vi[#vi + 1] = k end
    table.sort(vi)
    return st.section .. "|" .. table.concat(it, ",") .. "|" .. table.concat(fl, ",")
        .. "|" .. st.gold .. "|" .. table.concat(vi, ",")
end

local function cloneState(st)
    local n = { section = st.section, gold = st.gold, items = {}, flags = {}, visited = {} }
    for k in pairs(st.items) do n.items[k] = true end
    for k in pairs(st.flags) do n.flags[k] = true end
    for k in pairs(st.visited) do n.visited[k] = true end
    return n
end

local function enter(story, st, id, loops)
    st.section = id
    local sec = story.sections[id]
    if hasEffects(sec) and not st.visited[id] then
        -- Off a cycle the section can't come back, so there's no need to
        -- remember it (keeps the state count down).
        if loops[id] then st.visited[id] = true end
        for _, it in ipairs(list(sec.gain)) do st.items[it] = true end
        for _, it in ipairs(list(sec.lose)) do st.items[it] = nil end
        for _, f in ipairs(list(sec.set)) do st.flags[f] = true end
        for _, f in ipairs(list(sec.unset)) do st.flags[f] = nil end
        if sec.gold then st.gold = math.max(0, st.gold + sec.gold) end
    end
end

local function allowed(st, ch)
    for _, it in ipairs(list(ch.need)) do if not st.items[it] then return false end end
    for _, it in ipairs(list(ch.without)) do if st.items[it] then return false end end
    for _, f in ipairs(list(ch.flag)) do if not st.flags[f] then return false end end
    for _, f in ipairs(list(ch.noflag)) do if st.flags[f] then return false end end
    if ch.cost and st.gold < ch.cost then return false end
    return true
end

function Validate.full(story, max_states)
    local errs, info = Validate.structure(story)
    if #errs > 0 then return errs, info end
    max_states = max_states or 300000
    local sections = story.sections

    -- 1. Plain graph: from each section, an ending must be reachable.
    local rev = {}
    for id, sec in pairs(sections) do
        for _, e in ipairs(edges(sec)) do
            rev[e.to] = rev[e.to] or {}
            rev[e.to][#rev[e.to] + 1] = id
        end
    end
    local can_end, queue = {}, {}
    for id, sec in pairs(sections) do
        if sec.ending then can_end[id] = true; queue[#queue + 1] = id end
    end
    local qi = 1
    while qi <= #queue do
        local id = queue[qi]; qi = qi + 1
        for _, p in ipairs(rev[id] or {}) do
            if not can_end[p] then can_end[p] = true; queue[#queue + 1] = p end
        end
    end
    for id in pairs(sections) do
        if not can_end[id] then errs[#errs + 1] = string.format("no ending can be reached from section %d", id) end
    end

    -- 2. State walk with conditions.
    local st0 = { section = story.start or 1, gold = story.start_gold or 0, items = {}, flags = {}, visited = {} }
    for _, it in ipairs(list(story.start_items)) do st0.items[it] = true end
    local loops = cyclic(sections)
    -- A looped section whose effects can be applied twice with the same
    -- result (it only sets flags / gives items that nothing ever unsets or
    -- takes back, and gives no gold) doesn't need its "visited" bit: the
    -- state is the same either way, and leaving it out keeps hub-and-wings
    -- stories from blowing up the state count.
    local lost, unset = {}, {}
    for _, sec in pairs(sections) do
        for _, it in ipairs(list(sec.lose)) do lost[it] = true end
        for _, f in ipairs(list(sec.unset)) do unset[f] = true end
    end
    for id in pairs(loops) do
        local sec = sections[id]
        local idem = not sec.gold and not sec.lose and not sec.unset
        for _, it in ipairs(list(sec.gain)) do if lost[it] then idem = false end end
        for _, f in ipairs(list(sec.set)) do if unset[f] then idem = false end end
        if idem then loops[id] = nil end
    end
    enter(story, st0, st0.section, loops)
    local seen, reached = { [keyOf(st0)] = true }, { [st0.section] = true }
    local stack, count, stuck = { st0 }, 1, {}
    while #stack > 0 do
        local st = table.remove(stack)
        local sec = sections[st.section]
        if not sec.ending then
            local moved = false
            for _, e in ipairs(edges(sec)) do
                if not e.ch or allowed(st, e.ch) then
                    moved = true
                    local n = cloneState(st)
                    if e.ch and e.ch.cost then n.gold = n.gold - e.ch.cost end
                    enter(story, n, e.to, loops)
                    reached[e.to] = true
                    local k = keyOf(n)
                    if not seen[k] then
                        seen[k] = true
                        count = count + 1
                        if count > max_states then
                            errs[#errs + 1] = "too many states to check (simplify loops that give items/gold)"
                            return errs, info
                        end
                        stack[#stack + 1] = n
                    end
                end
            end
            if not moved and not stuck[st.section] then
                stuck[st.section] = true
                errs[#errs + 1] = string.format("section %d can be reached with every choice blocked", st.section)
            end
        end
    end
    info.states = count
    for id, sec in pairs(sections) do
        if not reached[id] then
            errs[#errs + 1] = string.format("section %d can never be reached%s", id, sec.ending and " (ending)" or "")
        end
    end
    return errs, info
end

return Validate
