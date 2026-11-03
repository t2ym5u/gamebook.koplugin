-- ---------------------------------------------------------------------------
-- votes.lua — the table's vote on a gamebook choice (pure Lua, no UI).
--
-- Hands are counted on the screen: one tap on a choice = one more vote for
-- it. The majority wins; a tie, or no vote at all, leaves the decision to
-- the reader (among the tied choices, or all of them).
-- ---------------------------------------------------------------------------

local Votes = {}

-- key: identifies the decision being voted on (the section and step), so
-- a saved tally never applies to another page.
function Votes.new(key)
    return { key = key, counts = {} }
end

function Votes.add(v, choice)
    v.counts[choice] = (v.counts[choice] or 0) + 1
end

function Votes.get(v, choice)
    return v.counts[choice] or 0
end

function Votes.total(v)
    local n = 0
    for _k, c in pairs(v.counts) do n = n + c end
    return n
end

function Votes.clear(v)
    v.counts = {}
end

-- choices: the list of choice ids still allowed. Returns the winning id, or
-- nil plus the list the reader picks from (tied ones, or every choice when
-- nobody voted).
function Votes.result(v, choices)
    local best, tied = 0, {}
    for _i, id in ipairs(choices) do
        local c = Votes.get(v, id)
        if c > best then
            best, tied = c, { id }
        elseif c == best and c > 0 then
            tied[#tied + 1] = id
        end
    end
    if best == 0 then
        local all = {}
        for i, id in ipairs(choices) do all[i] = id end
        return nil, all
    end
    if #tied == 1 then return tied[1] end
    return nil, tied
end

-- A saved tally, if it is still about `key`.
function Votes.restore(saved, key)
    if type(saved) ~= "table" or saved.key ~= key or type(saved.counts) ~= "table" then
        return Votes.new(key)
    end
    local v = Votes.new(key)
    for id, c in pairs(saved.counts) do
        if type(c) == "number" and c > 0 then v.counts[id] = math.floor(c) end
    end
    return v
end

function Votes.copy(v)
    local c = Votes.new(v.key)
    for id, n in pairs(v.counts) do c.counts[id] = n end
    return c
end

return Votes
