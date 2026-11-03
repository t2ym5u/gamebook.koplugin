local DIR = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])") or "./"
package.path = DIR .. "?.lua;" .. package.path

local Turns = require("turns")
local Votes = require("votes")
local Game  = require("game")

describe("gamebook multiplayer: the reader's turn", function()
    it("passes to the next player after every section, round the table", function()
        local t = Turns.new(3)
        assert.are.equal(1, t.current)
        assert.is_true(Turns.step(t)); assert.are.equal(2, t.current)
        assert.is_true(Turns.step(t)); assert.are.equal(3, t.current)
        assert.is_true(Turns.step(t)); assert.are.equal(1, t.current)
    end)

    it("every N sections", function()
        local t = Turns.new(2, 3)
        assert.is_false(Turns.step(t)); assert.is_false(Turns.step(t))
        assert.are.equal(1, Turns.left(t))
        assert.is_true(Turns.step(t)); assert.are.equal(2, t.current)
        assert.are.equal(3, Turns.left(t))
        Turns.step(t); Turns.setEvery(t, 1)      -- already past the new limit
        assert.are.equal(0, t.count)
    end)

    it("by hand, and when players leave", function()
        local t = Turns.new(4, 2)
        Turns.step(t); Turns.pass(t)
        assert.are.equal(2, t.current); assert.are.equal(0, t.count)
        Turns.pass(t); Turns.pass(t)
        Turns.resize(t, 3)
        assert.are.equal(1, t.current)
    end)

    it("restores a saved turn, rejects a broken one", function()
        local t = Turns.new(3, 2); Turns.pass(t); Turns.step(t)
        local r = Turns.restore(Turns.copy(t), 3, 2)
        assert.are.same(t, r)
        assert.are.equal(1, Turns.restore({ current = 5 }, 3, 2).current)   -- fewer players now
        assert.are.same(Turns.new(2, 1), Turns.restore("junk", 2, 1))
    end)
end)

describe("gamebook multiplayer: the vote", function()
    it("majority wins", function()
        local v = Votes.new("1:1")
        Votes.add(v, 1); Votes.add(v, 3); Votes.add(v, 3)
        assert.are.equal(3, Votes.total(v))
        assert.are.equal(3, (Votes.result(v, { 1, 2, 3 })))
    end)

    it("a tie leaves the tied choices to the reader", function()
        local v = Votes.new("1:1")
        Votes.add(v, 1); Votes.add(v, 2); Votes.add(v, 3); Votes.add(v, 2); Votes.add(v, 3)
        local win, pool = Votes.result(v, { 1, 2, 3 })
        assert.is_nil(win)
        assert.are.same({ 2, 3 }, pool)
    end)

    it("no vote: the reader decides among all the choices", function()
        local win, pool = Votes.result(Votes.new("k"), { 2, 4 })
        assert.is_nil(win)
        assert.are.same({ 2, 4 }, pool)
    end)

    it("a vote for a choice no longer allowed doesn't count", function()
        local v = Votes.new("k")
        Votes.add(v, 4); Votes.add(v, 4); Votes.add(v, 1)
        assert.are.equal(1, (Votes.result(v, { 1, 2 })))
    end)

    it("clear, and restore only on the same page", function()
        local v = Votes.new("3:7")
        Votes.add(v, 2)
        local back = Votes.restore(Votes.copy(v), "3:7")
        assert.are.equal(1, Votes.get(back, 2))
        assert.are.equal(0, Votes.total(Votes.restore(Votes.copy(v), "3:8")))
        Votes.clear(v)
        assert.are.equal(0, Votes.total(v))
    end)
end)

describe("gamebook multiplayer: a read-through", function()
    local STORY = {
        title = "T", sections = {
            [1] = { text = "a", choices = { { text = "left", to = 2 }, { text = "right", to = 3 } } },
            [2] = { text = "b", choices = { { text = "on", to = 3 } } },
            [3] = { text = "c", choices = { { text = "on", to = 4 }, { text = "back", to = 1 } } },
            [4] = { text = "end", ending = "win" },
        },
    }
    it("the table votes, the book moves on, the reader changes each section", function()
        local g = Game.new(STORY); g:start()
        local t = Turns.new(3)
        local function decide(votes_for)
            local s = g.s
            local v = Votes.new(s.section .. ":" .. s.steps)
            for _, id in ipairs(votes_for) do Votes.add(v, id) end
            local ids = {}
            for _, a in ipairs(g:actions()) do if a.enabled then ids[#ids + 1] = a end end
            local plain = {}
            for i, a in ipairs(ids) do plain[i] = a.index end
            local win = Votes.result(v, plain) or plain[1]  -- the reader picks the first
            for _, a in ipairs(ids) do
                if a.index == win then
                    assert.are.equal("moved", g:act(a).kind)
                    Turns.step(t)
                end
            end
        end
        decide({ 2, 2, 1 })          -- right, read by player 1
        assert.are.equal(3, g.s.section); assert.are.equal(2, t.current)
        decide({ 2, 1 })             -- tie: the reader picks "on"
        assert.are.equal(4, g.s.section); assert.are.equal(3, t.current)
        assert.is_true(g:isOver())
    end)
end)
