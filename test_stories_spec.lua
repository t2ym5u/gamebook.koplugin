-- Validates every bundled story: the structure the engine needs, plus a
-- condition-aware walk (validate.lua) proving every section and every ending
-- can be reached and no reachable state is a dead end.
local DIR = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])") or "./"
package.path = DIR .. "?.lua;" .. package.path

local Validate = require("validate")

local function storyFiles()
    local out = {}
    local p = io.popen('ls "' .. DIR .. 'stories"')
    for name in p:lines() do
        if name:match("%.lua$") then out[#out + 1] = name end
    end
    p:close()
    table.sort(out)
    return out
end

local function words(s)
    local n = 0
    for _ in s:gmatch("%S+") do n = n + 1 end
    return n
end

local function ulen(s)
    local _, n = s:gsub("[^\128-\191]", "")
    return n
end

local BANNED = { "hitler", "staline", "stalin", "pol pot", "mussolini", "ben laden", "bin laden" }

describe("bundled stories", function()
    local files = storyFiles()

    it("six per language", function()
        local per = {}
        for _, f in ipairs(files) do
            local st = dofile(DIR .. "stories/" .. f)
            per[st.lang] = (per[st.lang] or 0) + 1
        end
        assert.are.equal(6, per.fr)
        assert.are.equal(6, per.en)
    end)

    for _, f in ipairs(files) do
        describe(f, function()
            local story = dofile(DIR .. "stories/" .. f)

            it("passes the full validation", function()
                local errs, info = Validate.full(story, 1000000)
                assert.are.same({}, errs)
                assert.is_true(info.sections >= 60 and info.sections <= 120, "60-120 sections")
                assert.is_true(info.endings >= 2, "2+ endings")
                assert.is_true(info.wins >= 1, "a win")
                assert.is_true(info.fights >= 2, "2+ fights")
            end)

            it("is numbered 1..N and fits the screen", function()
                local n = 0
                for _ in pairs(story.sections) do n = n + 1 end
                for i = 1, n do assert.is_table(story.sections[i], "section " .. i) end
                assert.is_true(ulen(story.title) <= 28)
                for id, sec in pairs(story.sections) do
                    assert.is_true(words(sec.text) <= 130, "section " .. id .. " is too long")
                    assert.is_true(#(sec.choices or {}) <= 4, "section " .. id .. " has too many choices")
                    for _, ch in ipairs(sec.choices or {}) do
                        assert.is_true(ulen(ch.text) <= 60, "choice too long in " .. id)
                    end
                end
                for _, name in pairs(story.items or {}) do assert.is_true(ulen(name) <= 26, name) end
            end)

            it("keeps clear of excluded figures", function()
                local all = { story.title, story.blurb or "" }
                for _, sec in pairs(story.sections) do
                    all[#all + 1] = sec.text
                    for _, ch in ipairs(sec.choices or {}) do all[#all + 1] = ch.text end
                end
                local text = table.concat(all, "\n"):lower()
                for _, b in ipairs(BANNED) do assert.is_nil(text:find(b, 1, true), b) end
            end)
        end)
    end
end)

describe("validator", function()
    it("catches a missing target, an unreachable section and a dead end", function()
        local story = { title = "t", items = { key = "Key" }, sections = {
            [1] = { text = "a", choices = { { text = "x", to = 2 }, { text = "y", to = 9 } } },
            [2] = { text = "b", ending = "win" },
        } }
        local errs = Validate.structure(story)
        assert.is_true(#errs == 1 and errs[1]:find("missing section 9") ~= nil)

        story.sections[1].choices[2] = { text = "door", to = 3, need = "key" }
        story.sections[3] = { text = "c", ending = "death" }
        story.sections[4] = { text = "orphan", choices = { { text = "z", to = 2 } } }
        local e2 = table.concat((Validate.full(story)), "\n")
        assert.is_truthy(e2:find("section 3 can never be reached"))
        assert.is_truthy(e2:find("section 4 can never be reached"))

        local stuck = { title = "t", items = { key = "Key" }, sections = {
            [1] = { text = "a", choices = { { text = "door", to = 2, need = "key" } } },
            [2] = { text = "b", ending = "win" },
        } }
        assert.is_truthy(table.concat((Validate.full(stuck)), "\n"):find("every choice blocked"))
    end)

    it("refuses stats without a sheet and a luck test written as a number", function()
        local story = { title = "t", sections = {
            [1] = { text = "a", fight = { name = "Rat", skill = 5, stamina = 3, win = 2 } },
            [2] = { text = "b", ending = "win" },
        } }
        assert.is_truthy(table.concat((Validate.structure(story)), "\n"):find("no sheet"))
    end)
end)
