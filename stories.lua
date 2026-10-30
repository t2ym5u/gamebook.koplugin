-- ---------------------------------------------------------------------------
-- stories.lua — finds and loads story files (no UI).
--
-- Stories come from the plugin's own stories/ folder and from the reader's
-- koreader/data/gamebook/ folder. Listing reads each file once for its title
-- and language and keeps only that, so six or sixty stories cost the same
-- memory until one is opened.
-- ---------------------------------------------------------------------------

local Validate = require("validate")

local Stories = {}

local function getLfs()
    local ok, lfs = pcall(require, "libs/libkoreader-lfs")
    if ok and lfs then return lfs end
    ok, lfs = pcall(require, "lfs")
    if ok then return lfs end
    return nil
end

local function luaFiles(dir)
    local out = {}
    local lfs = getLfs()
    if not lfs or lfs.attributes(dir, "mode") ~= "directory" then return out end
    for name in lfs.dir(dir) do
        if name:match("%.lua$") and not name:match("^%.") then out[#out + 1] = name end
    end
    table.sort(out)
    return out
end

-- Runs a story file in an empty environment: a story is data, and a file
-- someone downloaded has no business calling os.execute.
function Stories.load(path)
    local chunk, err = loadfile(path)
    if not chunk then return nil, err end
    if setfenv then
        setfenv(chunk, {})
    end
    local ok, story = pcall(chunk)
    if not ok then return nil, story end
    if type(story) ~= "table" then return nil, "the file does not return a table" end
    return story
end

-- dirs: list of { dir = "/path/", source = "builtin"|"user" }.
-- Returns a list of entries { key, path, title, blurb, lang, author,
-- sections, errors } sorted builtin first, then by title.
function Stories.scan(dirs)
    local list = {}
    for _, d in ipairs(dirs) do
        for _, name in ipairs(luaFiles(d.dir)) do
            local path = d.dir .. name
            local e = { key = d.source .. "/" .. name:gsub("%.lua$", ""), path = path,
                        source = d.source, title = name:gsub("%.lua$", "") }
            local story, err = Stories.load(path)
            if not story then
                e.errors = { tostring(err) }
            else
                local errs, info = Validate.structure(story)
                e.title    = type(story.title) == "string" and story.title or e.title
                e.blurb    = story.blurb
                e.lang     = story.lang
                e.author   = story.author
                e.sections = info.sections
                if #errs > 0 then e.errors = errs end
            end
            list[#list + 1] = e
        end
    end
    table.sort(list, function(a, b)
        if a.source ~= b.source then return a.source == "builtin" end
        return a.title < b.title
    end)
    return list
end

-- Entries for one content language (stories without a lang show everywhere).
function Stories.forLang(list, lang)
    local out = {}
    for _, e in ipairs(list) do
        if not e.lang or e.lang == lang then out[#out + 1] = e end
    end
    return out
end

return Stories
