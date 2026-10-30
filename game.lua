-- ---------------------------------------------------------------------------
-- game.lua — the gamebook engine (pure Lua, no UI).
--
-- A Game walks one story (see README.md for the story format): it applies a
-- section's effects when the reader enters it, lists what can be done there
-- (choices, a fight round, a luck test, a die roll), and resolves those.
--
-- Every random draw goes through self.rng (a function returning an integer
-- 1..6), so specs can script the dice.
-- ---------------------------------------------------------------------------

local Game = {}
Game.__index = Game

Game.MAX_HISTORY = 40 -- "Back" steps kept in forgiving mode
Game.WOUND       = 2  -- stamina lost by the loser of a combat round
Game.FLEE_WOUND  = 2  -- stamina lost when running away

local STATS = { "skill", "stamina", "luck" }
Game.STATS = STATS

local function list(v)
    if v == nil then return {} end
    if type(v) == "table" then return v end
    return { v }
end
Game.list = list

local function copy(v)
    if type(v) ~= "table" then return v end
    local t = {}
    for k, x in pairs(v) do t[k] = copy(x) end
    return t
end
Game.copy = copy

local function defaultRng()
    return math.random(6)
end

-- story: the loaded story table. opts.rng: optional d6 function.
function Game.new(story, opts)
    opts = opts or {}
    local self = setmetatable({}, Game)
    self.story = story
    self.rng   = opts.rng or defaultRng
    return self
end

function Game:d6(n)
    local s = 0
    for _ = 1, n or 1 do s = s + self.rng() end
    return s
end

-- ---------------------------------------------------------------------------
-- State
-- ---------------------------------------------------------------------------

-- A fresh adventure: roll the character (when the story has a sheet), give
-- the starting gold and items, enter the first section.
function Game:start()
    local st = self.story
    local s = {
        section = st.start or 1,
        gold    = st.start_gold or 0,
        items   = {},
        flags   = {},
        visited = {},
        stats   = nil,
        max     = nil,
        history = {},
        result  = nil,  -- text of the last dice outcome, shown above the actions
        fight   = nil,  -- { enemy = i, stamina = n, log = text }
        pending = nil,  -- section to go to on "Continue" after a test/fight
        over    = nil,  -- "win" | "death" | "end"
        steps   = 0,
    }
    for _, it in ipairs(list(st.start_items)) do s.items[#s.items + 1] = it end
    if st.sheet then
        s.stats = {
            skill   = self:d6(1) + 6,
            stamina = self:d6(2) + 12,
            luck    = self:d6(1) + 6,
        }
        s.max = copy(s.stats)
    end
    self.s = s
    self:_enter(s.section)
end

function Game:serialize()
    return copy(self.s)
end

-- Returns false when the saved state doesn't fit this story (edited file).
function Game:load(state)
    if type(state) ~= "table" or type(state.section) ~= "number" then return false end
    if not self.story.sections[state.section] then return false end
    self.s = copy(state)
    self.s.history = self.s.history or {}
    self.s.items   = self.s.items or {}
    self.s.flags   = self.s.flags or {}
    self.s.visited = self.s.visited or {}
    return true
end

function Game:section()
    return self.story.sections[self.s.section]
end

function Game:hasItem(id)
    for _, it in ipairs(self.s.items) do
        if it == id then return true end
    end
    return false
end

function Game:itemName(id)
    local names = self.story.items or {}
    return names[id] or id
end

function Game:addItem(id)
    if not self:hasItem(id) then self.s.items[#self.s.items + 1] = id end
end

function Game:removeItem(id)
    for i, it in ipairs(self.s.items) do
        if it == id then table.remove(self.s.items, i) return end
    end
end

function Game:isOver()
    return self.s.over ~= nil
end

-- ---------------------------------------------------------------------------
-- Entering a section
-- ---------------------------------------------------------------------------

local function bump(self, stat, delta)
    local s = self.s
    if not s.stats or not delta then return end
    s.stats[stat] = math.min(s.max[stat], s.stats[stat] + delta)
    if s.stats[stat] < 0 then s.stats[stat] = 0 end
end

-- Effects apply the first time a section is entered only, so a loop back
-- through a treasure room doesn't hand out its gold twice.
function Game:_applyEffects(sec)
    local s = self.s
    for _, it in ipairs(list(sec.gain)) do self:addItem(it) end
    for _, it in ipairs(list(sec.lose)) do self:removeItem(it) end
    for _, f in ipairs(list(sec.set)) do s.flags[f] = true end
    for _, f in ipairs(list(sec.unset)) do s.flags[f] = nil end
    if sec.gold then s.gold = math.max(0, s.gold + sec.gold) end
    for _, stat in ipairs(STATS) do bump(self, stat, sec[stat]) end
end

function Game:_enter(id)
    local s   = self.s
    local sec = self.story.sections[id]
    s.section = id
    s.fight   = nil
    s.pending = nil
    s.steps   = (s.steps or 0) + 1
    if not s.visited[id] then
        s.visited[id] = true
        self:_applyEffects(sec)
    end
    if sec.ending then
        s.over = sec.ending
        return
    end
    if s.stats and s.stats.stamina <= 0 then
        s.over = "death"
        return
    end
    if sec.fight then
        local enemies = self:enemies(sec)
        s.fight = { enemy = 1, stamina = enemies[1].stamina, round = 0 }
    end
end

-- The list of enemies of a fight section (one enemy may be written inline).
function Game:enemies(sec)
    sec = sec or self:section()
    local f = sec.fight
    if not f then return {} end
    if f.enemies then return f.enemies end
    return { { name = f.name, skill = f.skill, stamina = f.stamina } }
end

-- Before moving on: remember where we were, for "Back" in forgiving mode.
function Game:_pushHistory()
    local snap = copy(self.s)
    snap.history = nil
    local h = self.s.history
    h[#h + 1] = snap
    while #h > Game.MAX_HISTORY do table.remove(h, 1) end
end

function Game:canGoBack()
    return #self.s.history > 0
end

function Game:goBack()
    local h = self.s.history
    if #h == 0 then return false end
    local snap = table.remove(h)
    snap.history = h
    self.s = snap
    return true
end

-- ---------------------------------------------------------------------------
-- Conditions
-- ---------------------------------------------------------------------------

-- Returns ok, reason. reason lists what is missing, for a greyed-out choice.
function Game:choiceAllowed(ch)
    local s = self.s
    for _, it in ipairs(list(ch.need)) do
        if not self:hasItem(it) then return false, "need", it end
    end
    for _, it in ipairs(list(ch.without)) do
        if self:hasItem(it) then return false, "without", it end
    end
    for _, f in ipairs(list(ch.flag)) do
        if not s.flags[f] then return false, "flag", f end
    end
    for _, f in ipairs(list(ch.noflag)) do
        if s.flags[f] then return false, "noflag", f end
    end
    if ch.cost and s.gold < ch.cost then return false, "gold", ch.cost end
    return true
end

-- ---------------------------------------------------------------------------
-- Actions
--
-- Everything the reader can do at this point, as a list of
--   { kind = "choice"|"attack"|"flee"|"test"|"roll"|"continue",
--     index = n (choice), text = story text (choice), enabled = bool,
--     reason, what (why a choice is greyed), hidden = bool }
-- The screen turns each into a button; act(i) performs one.
-- ---------------------------------------------------------------------------

function Game:actions()
    local s = self.s
    if s.over then return {} end
    if s.pending then return { { kind = "continue", enabled = true } } end
    local sec = self:section()
    if sec.fight then
        local acts = { { kind = "attack", enabled = true } }
        if sec.fight.flee then acts[2] = { kind = "flee", enabled = true } end
        return acts
    end
    if sec.test then return { { kind = "test", enabled = true, stat = sec.test.stat or "skill" } } end
    if sec.roll then return { { kind = "roll", enabled = true, dice = sec.roll.dice or 1 } } end
    local acts = {}
    for i, ch in ipairs(sec.choices or {}) do
        local ok, reason, what = self:choiceAllowed(ch)
        if ok or not ch.hide then
            acts[#acts + 1] = { kind = "choice", index = i, text = ch.text, enabled = ok,
                                reason = reason, what = what }
        end
    end
    return acts
end

-- Goes to section `to`, keeping a Back step first.
function Game:goTo(to)
    self:_pushHistory()
    self.s.result = nil
    self:_enter(to)
end

-- The result of a dice action, as data the screen words:
--   { kind = "test"|"roll"|"round"|"flee", ... }
-- Returns nil if the action is unknown or disabled.
function Game:act(a)
    local s   = self.s
    local sec = self:section()
    if s.over or not a or a.enabled == false then return nil end

    if a.kind == "continue" then
        local to = s.pending
        self:goTo(to)
        return { kind = "moved" }

    elseif a.kind == "choice" then
        local ch = sec.choices[a.index]
        if not ch or not self:choiceAllowed(ch) then return nil end
        self:_pushHistory()
        if ch.cost then s.gold = s.gold - ch.cost end
        s.result = nil
        self:_enter(ch.to)
        return { kind = "moved" }

    elseif a.kind == "test" then
        -- Roll 2d6 at or under the stat. Testing your luck uses some up.
        self:_pushHistory()
        local stat = sec.test.stat or "skill"
        local roll = self:d6(2)
        local target = s.stats[stat]
        local ok = roll <= target
        if stat == "luck" then s.stats.luck = math.max(0, target - 1) end
        s.pending = ok and sec.test.win or sec.test.lose
        s.result = { kind = "test", stat = stat, roll = roll, target = target, ok = ok }
        return s.result

    elseif a.kind == "roll" then
        self:_pushHistory()
        local roll = self:d6(sec.roll.dice or 1)
        for _, o in ipairs(sec.roll.outcomes) do
            if roll <= o.upto then
                s.pending = o.to
                break
            end
        end
        local last = sec.roll.outcomes[#sec.roll.outcomes]
        s.pending = s.pending or last.to
        s.result = { kind = "roll", roll = roll }
        return s.result

    elseif a.kind == "attack" then
        return self:_fightRound(sec)

    elseif a.kind == "flee" then
        self:_pushHistory()
        s.stats.stamina = math.max(0, s.stats.stamina - Game.FLEE_WOUND)
        s.fight = nil
        if s.stats.stamina <= 0 then
            s.over = "death"
            s.result = { kind = "flee", dead = true }
            return s.result
        end
        s.pending = sec.fight.flee
        s.result = { kind = "flee" }
        return s.result
    end
    return nil
end

-- One combat round: both sides roll 2d6 + skill, the lower one is wounded.
function Game:_fightRound(sec)
    local s = self.s
    local f = s.fight
    if not f then return nil end
    -- A whole fight is one Back step: only its first round is remembered.
    if f.round == 0 then self:_pushHistory() end
    local enemies = self:enemies(sec)
    local e = enemies[f.enemy]
    local mine   = self:d6(2) + s.stats.skill
    local theirs = self:d6(2) + e.skill
    f.round = f.round + 1
    local r = { kind = "round", mine = mine, theirs = theirs, enemy = e.name, round = f.round }
    if mine > theirs then
        f.stamina = math.max(0, f.stamina - Game.WOUND)
        r.hit = "enemy"
    elseif theirs > mine then
        s.stats.stamina = math.max(0, s.stats.stamina - Game.WOUND)
        r.hit = "me"
    else
        r.hit = "none"
    end
    if s.stats.stamina <= 0 then
        s.over = "death"
        r.dead = true
    elseif f.stamina <= 0 then
        r.defeated = e.name
        if f.enemy < #enemies then
            f.enemy = f.enemy + 1
            f.stamina = enemies[f.enemy].stamina
            f.round = f.round -- keep counting: same fight
            r.next_enemy = enemies[f.enemy].name
        else
            s.fight = nil
            s.pending = sec.fight.win
            r.won = true
        end
    end
    s.result = r
    return r
end

return Game
