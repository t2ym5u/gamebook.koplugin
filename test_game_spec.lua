local DIR = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])") or "./"
package.path = DIR .. "?.lua;" .. package.path

local Game = require("game")

-- Dice from a script: each call takes the next face.
local function dice(list)
    local i = 0
    return function()
        i = i + 1
        return list[i] or 3
    end
end

local STORY = {
    title = "Test", sheet = true, start_gold = 2, start_items = { "lamp" },
    items = { lamp = "Lamp", key = "Key" },
    sections = {
        [1] = { text = "start", choices = {
            { text = "room", to = 2 },
            { text = "door", to = 3, need = "key" },
            { text = "pay", to = 4, cost = 3 },
            { text = "secret", to = 5, flag = "secret", hide = true },
        } },
        [2] = { text = "room", gain = "key", gold = 2, set = "secret", stamina = -1,
                choices = { { text = "back", to = 1 } } },
        [3] = { text = "fight", fight = { enemies = { { name = "Rat", skill = 1, stamina = 4 },
                                                      { name = "Bat", skill = 1, stamina = 2 } }, win = 6, flee = 1 } },
        [4] = { text = "luck", test = { stat = "luck", win = 6, lose = 7 } },
        [5] = { text = "roll", roll = { dice = 1, outcomes = { { upto = 3, to = 6 }, { upto = 6, to = 7 } } } },
        [6] = { text = "won", ending = "win" },
        [7] = { text = "dead", ending = "death" },
    },
}

describe("gamebook engine", function()
    it("rolls the character sheet and starts with gold and items", function()
        local g = Game.new(STORY, { rng = dice({ 3, 4, 5, 2 }) })
        g:start()
        assert.are.same({ skill = 9, stamina = 21, luck = 8 }, g.s.stats)
        assert.are.equal(2, g.s.gold)
        assert.is_true(g:hasItem("lamp"))
    end)

    it("greys out unmet choices, hides hidden ones, applies effects once", function()
        local g = Game.new(STORY, { rng = dice({ 3, 4, 5, 2 }) })
        g:start()
        local acts = g:actions()
        assert.are.equal(3, #acts) -- the secret one is hidden
        assert.is_false(acts[2].enabled)
        assert.are.equal("need", acts[2].reason)
        assert.are.equal("gold", acts[3].reason)
        g:act(acts[1])
        assert.is_true(g:hasItem("key"))
        assert.are.equal(4, g.s.gold)
        assert.are.equal(20, g.s.stats.stamina)
        g:act(g:actions()[1]) -- back to 1
        g:act(g:actions()[1]) -- room again: no second reward
        assert.are.equal(4, g.s.gold)
        assert.are.equal(20, g.s.stats.stamina)
        g:act(g:actions()[1])
        acts = g:actions()
        assert.are.equal(4, #acts)
        assert.is_true(acts[2].enabled and acts[3].enabled and acts[4].enabled)
        g:act(acts[3])        -- pay 3 gold
        assert.are.equal(1, g.s.gold)
        assert.are.equal(4, g.s.section)
    end)

    it("fights several enemies in turn and wins", function()
        -- skill 9 / stamina 21 / luck 8, then each round: my 2 dice, their 2 dice.
        local g = Game.new(STORY, { rng = dice({ 3, 4, 5, 2,  6,6, 1,1,  6,6, 1,1,  6,6, 1,1,  6,6, 1,1 }) })
        g:start()
        g.s.items[#g.s.items + 1] = "key"
        g:act(g:actions()[2])
        assert.are.equal(3, g.s.section)
        local r = g:act(g:actions()[1])
        assert.are.equal("enemy", r.hit)
        r = g:act(g:actions()[1])
        assert.are.equal("Rat", r.defeated)
        assert.are.equal("Bat", r.next_enemy)
        r = g:act(g:actions()[1])
        assert.is_true(r.won)
        assert.are.equal("continue", g:actions()[1].kind)
        g:act(g:actions()[1])
        assert.are.equal("win", g.s.over)
        assert.are.same({}, g:actions())
    end)

    it("dies when stamina runs out in a fight", function()
        local g = Game.new(STORY, { rng = dice({ 1, 1, 1, 1 }) }) -- skill 7, stamina 14
        g:start()
        g.s.items[#g.s.items + 1] = "key"
        g:act(g:actions()[2])
        g.s.stats.stamina = 2
        g.rng = dice({ 1, 1, 6, 6 })
        local r = g:act(g:actions()[1])
        assert.is_true(r.dead)
        assert.are.equal("death", g.s.over)
    end)

    it("fleeing costs stamina; luck tests cost luck", function()
        local g = Game.new(STORY, { rng = dice({ 3, 4, 5, 2 }) })
        g:start()
        g.s.items[#g.s.items + 1] = "key"
        g:act(g:actions()[2])
        g:act(g:actions()[2]) -- flee
        assert.are.equal(19, g.s.stats.stamina)
        g:act(g:actions()[1])
        assert.are.equal(1, g.s.section)
        g.s.gold = 5
        g:act(g:actions()[3])
        g.rng = dice({ 4, 4 }) -- 8 <= luck 8
        local r = g:act(g:actions()[1])
        assert.is_true(r.ok)
        assert.are.equal(7, g.s.stats.luck)
        g:act(g:actions()[1])
        assert.are.equal("win", g.s.over)
    end)

    it("goes back step by step, even after death, and serializes", function()
        local g = Game.new(STORY, { rng = dice({ 3, 4, 5, 2 }) })
        g:start()
        g.s.gold = 5
        g:act(g:actions()[3])
        g.rng = dice({ 6, 6 })
        g:act(g:actions()[1])
        g:act(g:actions()[1])
        assert.are.equal("death", g.s.over)
        assert.is_true(g:goBack())   -- before "Continue"
        assert.is_nil(g.s.over)
        assert.is_true(g:goBack())   -- before the test
        assert.are.equal(8, g.s.stats.luck)
        assert.is_true(g:goBack())   -- before paying
        assert.are.equal(5, g.s.gold)
        assert.are.equal(1, g.s.section)
        local g2 = Game.new(STORY)
        assert.is_true(g2:load(g:serialize()))
        assert.are.same(g:serialize(), g2:serialize())
        assert.is_false(g2:load({ section = 99 }))
    end)

    it("plays every bundled story to an ending with random choices", function()
        local p = io.popen('ls "' .. DIR .. 'stories"')
        local files = {}
        for name in p:lines() do if name:match("%.lua$") then files[#files + 1] = name end end
        p:close()
        math.randomseed(42)
        for _, f in ipairs(files) do
            local story = dofile(DIR .. "stories/" .. f)
            local endings = {}
            for _ = 1, 300 do
                local g = Game.new(story)
                g:start()
                local steps = 0
                while not g:isOver() do
                    local acts = {}
                    for _, a in ipairs(g:actions()) do if a.enabled then acts[#acts + 1] = a end end
                    assert.is_true(#acts > 0, f .. ": stuck at section " .. g.s.section)
                    g:act(acts[math.random(#acts)])
                    steps = steps + 1
                    assert.is_true(steps < 5000, f .. ": no end in sight")
                end
                endings[g.s.over] = true
            end
            assert.is_true(endings.death or endings["end"], f .. ": random play never loses")
        end
    end)
end)
