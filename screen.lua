local _dir = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])") or "./"

local Blitbuffer      = require("ffi/blitbuffer")
local ConfirmBox      = require("ui/widget/confirmbox")
local DataStorage     = require("datastorage")
local Device          = require("device")
local Font            = require("ui/font")
local FrameContainer  = require("ui/widget/container/framecontainer")
local Geom            = require("ui/geometry")
local GestureRange    = require("ui/gesturerange")
local HorizontalGroup = require("ui/widget/horizontalgroup")
local HorizontalSpan  = require("ui/widget/horizontalspan")
local InputContainer  = require("ui/widget/container/inputcontainer")
local ScrollTextWidget = require("ui/widget/scrolltextwidget")
local Size            = require("ui/size")
local TextBoxWidget   = require("ui/widget/textboxwidget")
local TextWidget      = require("ui/widget/textwidget")
local UIManager       = require("ui/uimanager")
local VerticalGroup   = require("ui/widget/verticalgroup")
local VerticalSpan    = require("ui/widget/verticalspan")
local _               = require("i18n")
local T               = require("ffi/util").template

local ButtonDialog = require("ui/widget/buttondialog")
local MenuHelper   = require("menu_helper")
local Party        = require("party")
local ScreenBase   = require("screen_base")

local function lrequire(name)
    local key = _dir .. name
    if not package.loaded[key] then
        package.loaded[key] = assert(loadfile(_dir .. name .. ".lua"))()
    end
    return package.loaded[key]
end

local Game    = lrequire("game")
local Stories = lrequire("stories")
local Turns   = lrequire("turns")
local Votes   = lrequire("votes")

local DeviceScreen = Device.screen

local MAX_BOOKMARKS = 5

local RULES_EN = [[
Gamebooks — Rules

Read the section, then tap what you do next. A greyed-out choice needs something you don't have yet: an item, a clue you haven't found, or gold (gold is spent when you take the choice).

Character sheet (in most stories): Skill, Stamina and Luck are rolled when the adventure starts. Tap Sheet to see them with your gold and items.

Fight: each round you and the enemy roll two dice and add your Skill. The higher total wounds the other for 2 Stamina; a tie wounds nobody. Bring the enemy's Stamina to 0 to win. Some fights let you flee, for 2 Stamina.

Test your Skill: roll two dice; at or under your Skill succeeds. Test your Luck: the same with Luck, and every test uses up 1 Luck point.

Stamina at 0 is death. Then — or at any ending — Start again rolls a new character and goes back to the first section.

Your progress is saved automatically, separately for each story. Forgiving mode (menu) adds a Back button that undoes the last step, even a death, and lets you return to your bookmarks.

Write your own stories: see README.md of the plugin. Put them in koreader/data/gamebook/.
]]

local RULES_FR = [[
Livres-jeux — Règles

Lisez le paragraphe, puis touchez ce que vous faites ensuite. Un choix grisé demande quelque chose que vous n'avez pas encore : un objet, un indice pas encore trouvé, ou de l'or (dépensé quand vous prenez ce choix).

Feuille d'aventure (dans la plupart des histoires) : Habileté, Endurance et Chance sont tirées au début de l'aventure. Touchez Feuille pour les voir avec votre or et vos objets.

Combat : à chaque assaut, vous et l'adversaire lancez deux dés et ajoutez votre Habileté. Le plus haut total blesse l'autre de 2 points d'Endurance ; une égalité ne blesse personne. Amenez l'Endurance de l'adversaire à 0 pour gagner. Certains combats permettent de fuir, pour 2 points d'Endurance.

Tentez votre Habileté : lancez deux dés ; un total inférieur ou égal à votre Habileté réussit. Tentez votre Chance : pareil avec la Chance, et chaque tentative coûte 1 point de Chance.

Endurance à 0 : c'est la mort. Alors — ou à n'importe quelle fin — Recommencer tire un nouveau personnage et revient au premier paragraphe.

La progression est sauvegardée automatiquement, séparément pour chaque histoire. Le mode indulgent (menu) ajoute un bouton Retour qui annule le dernier pas, même une mort, et permet de revenir à vos signets.

Écrivez vos propres histoires : voir le README.md de l'extension. Placez-les dans koreader/data/gamebook/.
]]

local RULES_PARTY_EN = [[
Gamebooks · multiplayer — Rules

Setup: lay the reader in the middle of the table and pick a story. In the menu: Players (2 to 8) and Player names, Reader changes (after every section, or every 2, 3 or 5 sections) and Vote (on or off). The whole table plays one hero together.

Who does what: one player is the reader — the heading over the text shows who ("§ 12 · Reader: Alice"). The reader reads the section aloud and handles the reader. When the story moves on to a new section, the book passes to the next player round the table (or after 2, 3 or 5 sections). Next reader, in the menu, passes it at once.

Choosing: when a section offers several ways on and Vote is on, everyone raises a hand for the option they want, and the reader taps that option once per hand — each tap is one vote, shown under it. Then Decide: the option with the most votes is taken. A tie, or no vote at all, lets the reader decide among the tied options (or all of them). Clear votes starts the count again. With Vote off, or when there is only one way on, a tap takes the choice at once. A greyed-out choice needs an item, a clue or gold you don't have yet.

Dice: in most stories the hero has Skill, Stamina and Luck (Sheet shows them with the gold and items). The reader rolls for the table, and the line above the buttons says who rolled. Fight: each round you and the enemy roll two dice and add Skill; the higher total wounds the other for 2 Stamina, a tie wounds nobody; some fights let you flee for 2 Stamina. Test your Skill or Luck: two dice at or under it succeed, and each Luck test uses up 1 Luck.

The end: there are no scores — the table wins or loses together. Stamina at 0 is death; at any ending Start again rolls a new hero and goes back to the first section. Forgiving mode adds Back (undo the last step) and bookmarks. The table's adventures are saved apart from your solo ones.
]]

local RULES_PARTY_FR = [[
Livres-jeux · à plusieurs — Règles

Mise en place : posez la liseuse au milieu de la table et choisissez une histoire. Dans le menu : Joueurs (2 à 8) et Noms des joueurs, Changement de lecteur (après chaque paragraphe, ou tous les 2, 3 ou 5 paragraphes) et Vote (actif ou non). Toute la table joue ensemble un seul héros.

Qui fait quoi : un joueur est le lecteur — le titre au-dessus du texte indique qui (« § 12 · Lecteur : Alice »). Le lecteur lit le paragraphe à voix haute et tient la liseuse. Quand l'histoire passe à un nouveau paragraphe, le livre passe au joueur suivant autour de la table (ou après 2, 3 ou 5 paragraphes). Lecteur suivant, dans le menu, le fait passer tout de suite.

Choisir : quand un paragraphe propose plusieurs suites et que le Vote est actif, chacun lève la main pour l'option qu'il veut, et le lecteur touche cette option une fois par main levée — chaque appui compte une voix, affichée dessous. Puis Décider : l'option qui a le plus de voix l'emporte. En cas d'égalité, ou sans aucune voix, le lecteur décide parmi les options à égalité (ou toutes). Effacer les votes recommence le compte. Sans le vote, ou quand il n'y a qu'une suite, un appui prend le choix aussitôt. Un choix grisé demande un objet, un indice ou de l'or que vous n'avez pas encore.

Les dés : dans la plupart des histoires, le héros a Habileté, Endurance et Chance (Feuille les montre avec l'or et les objets). Le lecteur lance pour la table, et la ligne au-dessus des boutons dit qui a lancé. Combat : à chaque assaut, vous et l'adversaire lancez deux dés et ajoutez l'Habileté ; le plus haut total blesse l'autre de 2 points d'Endurance, une égalité ne blesse personne ; certains combats permettent de fuir pour 2 points d'Endurance. Tentez votre Habileté ou votre Chance : deux dés inférieurs ou égaux réussissent, et chaque tentative de Chance coûte 1 point de Chance.

La fin : pas de score — la table gagne ou perd ensemble. Endurance à 0 : c'est la mort ; à n'importe quelle fin, Recommencer tire un nouveau héros et revient au premier paragraphe. Le mode indulgent ajoute Retour (annuler le dernier pas) et les signets. Les aventures de la table sont sauvegardées à part des vôtres.
]]

local STAT_LABELS = {
    skill   = _("Skill"),
    stamina = _("Stamina"),
    luck    = _("Luck"),
}

-- ---------------------------------------------------------------------------
-- Text sizing
--
-- Font:getFace() scales its size by the screen DPI; sizes derived from pixel
-- dimensions are divided back first.
-- ---------------------------------------------------------------------------

local DPI_SCALE = DeviceScreen:scaleBySize(1000) / 1000

local function pxFace(px, name)
    return Font:getFace(name or "cfont", math.max(8, math.floor(px / DPI_SCALE)))
end

-- ---------------------------------------------------------------------------
-- ChoiceButton — a full-width framed button whose label wraps over as many
-- lines as it needs (a KOReader Button stops at two and then shrinks the
-- font, which would make long choices unreadable on e-ink).
-- ---------------------------------------------------------------------------

local ChoiceButton = InputContainer:extend{
    text     = "",
    width    = nil,
    face     = nil,
    enabled  = true,
    bold     = false,
    title    = nil,
    title_face = nil,
    plain    = false,  -- no frame: a banner, not a button
    callback = nil,
}

function ChoiceButton:init()
    local pad    = Size.padding.large
    local border = self.enabled and Size.border.thick or Size.border.thin
    local inner  = self.width - 2 * (pad + border)
    local color = self.enabled and Blitbuffer.COLOR_BLACK or Blitbuffer.COLOR_DARK_GRAY
    self.label = TextBoxWidget:new{
        text      = self.text,
        face      = self.face,
        width     = inner,
        alignment = "center",
        bold      = self.bold,
        fgcolor   = color,
    }
    -- An optional bold heading line (the story list: title over blurb).
    if self.title then
        self.label = VerticalGroup:new{ align = "center",
            TextBoxWidget:new{ text = self.title, face = self.title_face or self.face, width = inner,
                               alignment = "center", bold = true, fgcolor = color },
            VerticalSpan:new{ width = Size.span.vertical_default },
            self.label,
        }
    end
    if self.plain then border = 0 end
    self[1] = FrameContainer:new{
        bordersize = border,
        radius     = Size.radius.button,
        padding    = pad,
        margin     = 0,
        color      = self.enabled and Blitbuffer.COLOR_BLACK or Blitbuffer.COLOR_GRAY,
        self.label,
    }
    self.dimen = Geom:new{ w = self.width, h = self[1]:getSize().h }
    self.ges_events = {
        Tap = { GestureRange:new{ ges = "tap", range = function() return self.dimen end } },
    }
end

function ChoiceButton:getSize()
    return self[1]:getSize()
end

function ChoiceButton:onTap()
    if self.enabled and self.callback then self.callback() end
    return true
end

-- ---------------------------------------------------------------------------
-- GamebookScreen
-- ---------------------------------------------------------------------------

local GamebookScreen = ScreenBase:extend{}

function GamebookScreen:init()
    local p = self.plugin
    self.lang      = p:getLang({ "fr", "en" })
    self.forgiving = p:getSetting("forgiving", false)
    self.party     = p.launch_mode == "party"
    self:scanStories()
    self:loadSaves()
    ScreenBase.init(self)
end

-- Solo and multiplayer adventures are saved apart (a table's game doesn't
-- move the bookmark of the one you read alone).
function GamebookScreen:stateKey()
    return self.party and "party_state" or nil
end

function GamebookScreen:loadSaves()
    local p = self.plugin
    local saved = p:loadState(self:stateKey()) or {}
    self.saves     = type(saved.games) == "table" and saved.games or {}
    self.bookmarks = type(saved.bookmarks) == "table" and saved.bookmarks or {}
    self.game, self.story, self.current, self.page = nil, nil, nil, nil
    if self.party then
        self.players = Party.loadPlayers(p, Party.loadCount(p))
        self.turns = Turns.restore(saved.turns, #self.players, p:getSetting("party_every", 1))
        self.vote_on = p:getSetting("party_vote", true)
        self.saved_votes = saved.votes
        self.roller = saved.roller
    end
    self.phase = "library"
    if saved.current and saved.phase == "play" then
        self:openStory(saved.current, true)
    end
end

function GamebookScreen:storyDirs()
    return {
        { dir = _dir .. "stories/", source = "builtin" },
        { dir = DataStorage:getDataDir() .. "/gamebook/", source = "user" },
    }
end

function GamebookScreen:scanStories()
    self.all_stories = Stories.scan(self:storyDirs())
end

function GamebookScreen:entryFor(key)
    for _i, e in ipairs(self.all_stories) do
        if e.key == key then return e end
    end
end

function GamebookScreen:serializeState()
    if self.game and self.current then
        self.saves[self.current] = self.game:serialize()
    end
    local t = {
        current   = self.current,
        phase     = self.phase,
        games     = self.saves,
        bookmarks = self.bookmarks,
    }
    if self.party then
        t.turns  = Turns.copy(self.turns)
        t.votes  = self.votes and Votes.copy(self.votes) or nil
        t.roller = self.roller
    end
    return t
end

function GamebookScreen:save()
    self.plugin:saveState(self:serializeState(), self:stateKey())
end

-- ScreenBase's version saves under the solo key.
function GamebookScreen:closeScreen()
    if not self.party then return ScreenBase.closeScreen(self) end
    self:save()
    self.plugin:onScreenClosed()
    UIManager:close(self)
    UIManager:setDirty(nil, "full")
end

-- ---------------------------------------------------------------------------
-- Stories
-- ---------------------------------------------------------------------------

-- Opens a story, resuming its saved adventure when there is one.
-- quiet: restoring at start-up, so failures fall back to the library silently.
function GamebookScreen:openStory(key, quiet)
    local e = self:entryFor(key)
    if not e then return false end
    if e.errors then
        if not quiet then self:showStoryErrors(e) end
        return false
    end
    local story = Stories.load(e.path)
    if not story then return false end
    if self.game and self.current then
        self.saves[self.current] = self.game:serialize()
    end
    self.story   = story
    self.current = key
    self.game    = Game.new(story)
    if not self.game:load(self.saves[key]) then
        self.game:start()
    end
    self.phase = "play"
    return true
end

-- A full page of text inside the game screen (the character sheet, a
-- story's errors), closed by the action bar's Close. KOReader's TextViewer
-- would do, but its Find/Close buttons don't follow the game's language.
function GamebookScreen:showPage(title, text)
    self.page = { title = title, text = text }
    self:rebuild()
end

function GamebookScreen:closePage()
    self.page = nil
    self:rebuild()
end

function GamebookScreen:showStoryErrors(e)
    self:showPage(e.title, T(_("This story can't be played:\n\n%1"), table.concat(e.errors, "\n")))
end

function GamebookScreen:onPickStory(key)
    if self:openStory(key) then
        self:save()
        self:rebuild()
    end
end

function GamebookScreen:onLibrary()
    self.page = nil
    if self.game and self.current then
        self.saves[self.current] = self.game:serialize()
    end
    self:scanStories()
    self.phase = "library"
    self:save()
    self:rebuild()
end

-- ---------------------------------------------------------------------------
-- Game actions
-- ---------------------------------------------------------------------------

function GamebookScreen:rebuild()
    self:buildLayout()
    UIManager:setDirty(self, function() return "ui", self.dimen end)
end

-- "New game": a fresh character and the first section of the same story.
function GamebookScreen:onNewGame()
    self.page = nil
    if self.phase ~= "play" or not self.game then
        return self:onLibrary()
    end
    local function restart()
        self.game:start()
        self:save()
        self:rebuild()
    end
    if self.game:isOver() or (self.game.s.steps or 0) <= 1 then
        restart()
    else
        UIManager:show(ConfirmBox:new{
            text        = _("Start this adventure again from the beginning?"),
            ok_text     = _("Start again"),
            ok_callback = restart,
        })
    end
end

function GamebookScreen:onAction(a)
    local reader = self.party and self:readerName()
    local r = self.game:act(a)
    if not r then return end
    if self.party then
        if r.kind == "moved" then
            -- A new section: a new reader (every N sections), a new vote.
            self.roller = nil
            self.votes = nil
            Turns.step(self.turns)
        else
            self.roller = reader
        end
    end
    self:save()
    self:rebuild()
end

-- ---------------------------------------------------------------------------
-- Multiplayer: the reader and the vote
-- ---------------------------------------------------------------------------

function GamebookScreen:readerName()
    return self.players[self.turns.current] or Party.defaultName(self.turns.current)
end

function GamebookScreen:onNextReader()
    Turns.pass(self.turns)
    self:save()
    self:rebuild()
end

-- The choices the table can vote on here (none when a vote makes no sense:
-- vote off, a fight, a single way on).
function GamebookScreen:votableChoices()
    if not (self.party and self.vote_on and self.game and not self.game:isOver()) then return nil end
    local ids = {}
    for _i, a in ipairs(self.game:actions()) do
        if a.kind == "choice" and a.enabled then ids[#ids + 1] = a.index end
    end
    if #ids < 2 then return nil end
    return ids
end

-- The tally of this very page (section and step), restored or new.
function GamebookScreen:currentVotes()
    local s = self.game.s
    local key = s.section .. ":" .. (s.steps or 0)
    if not self.votes or self.votes.key ~= key then
        self.votes = Votes.restore(self.saved_votes, key)
        self.saved_votes = nil
    end
    return self.votes
end

function GamebookScreen:addVote(index)
    Votes.add(self:currentVotes(), index)
    self:save()
    self:rebuild()
end

function GamebookScreen:clearVotes()
    Votes.clear(self:currentVotes())
    self:save()
    self:rebuild()
end

function GamebookScreen:choiceAction(index)
    for _i, a in ipairs(self.game:actions()) do
        if a.kind == "choice" and a.index == index then return a end
    end
end

-- Majority wins; on a tie (or with no vote) the reader picks.
function GamebookScreen:onDecide()
    local ids = self:votableChoices()
    if not ids then return end
    local win, pool = Votes.result(self:currentVotes(), ids)
    if win then return self:onAction(self:choiceAction(win)) end
    local dlg
    local rows = {}
    for _i, id in ipairs(pool) do
        local a = self:choiceAction(id)
        rows[#rows + 1] = { { text = a.text, callback = function()
            UIManager:close(dlg)
            self:onAction(a)
        end } }
    end
    local total = Votes.total(self:currentVotes())
    dlg = ButtonDialog:new{
        title       = T(total > 0 and _("Tie: %1 decides") or _("%1 decides"), self:readerName()),
        title_align = "center",
        buttons     = rows,
    }
    UIManager:show(dlg)
end

function GamebookScreen:onBack()
    if self.forgiving and self.game and self.game:goBack() then
        self:save()
        self:rebuild()
    end
end

function GamebookScreen:isRoundOver()
    if self.page then return false end
    return self.phase == "play" and self.game ~= nil and self.game:isOver()
end

function GamebookScreen:getRoundOverButtons()
    local row = { { text = _("Start again"), callback = function() self:onNewGame() end } }
    if self.forgiving and self.game and self.game:canGoBack() then
        row[#row + 1] = { text = _("Back"), callback = function() self:onBack() end }
    end
    return row
end

-- ---------------------------------------------------------------------------
-- Settings and dialogs
-- ---------------------------------------------------------------------------

function GamebookScreen:openLangMenu()
    MenuHelper.openPickerMenu{
        title      = _("Language"),
        items      = { { id = "fr", text = "Français" }, { id = "en", text = "English" } },
        current_id = self.lang,
        parent     = self,
        on_select  = function(lang)
            self.lang = lang
            self.plugin:setLang(lang)
            local e = self.current and self:entryFor(self.current)
            if not (e and (not e.lang or e.lang == lang)) then
                self.phase = "library"
            end
            self:save()
            self:rebuild()
        end,
    }
end

function GamebookScreen:toggleForgiving()
    self.forgiving = not self.forgiving
    self.plugin:saveSetting("forgiving", self.forgiving)
    self:rebuild()
end

function GamebookScreen:sheetText()
    local g, s = self.game, self.game.s
    local lines = {}
    if s.stats then
        for _i, k in ipairs(Game.STATS) do
            lines[#lines + 1] = T(_("%1: %2 / %3"), STAT_LABELS[k], s.stats[k], s.max[k])
        end
        lines[#lines + 1] = ""
    end
    lines[#lines + 1] = T(_("Gold: %1"), s.gold)
    lines[#lines + 1] = ""
    lines[#lines + 1] = _("Inventory:")
    if #s.items == 0 then
        lines[#lines + 1] = "  " .. _("(nothing)")
    else
        for _i, it in ipairs(s.items) do lines[#lines + 1] = "  • " .. g:itemName(it) end
    end
    local visited = 0
    for _k in pairs(s.visited) do visited = visited + 1 end
    lines[#lines + 1] = ""
    lines[#lines + 1] = T(_("Sections read: %1"), visited)
    return table.concat(lines, "\n")
end

function GamebookScreen:showSheet()
    if not self.game then return end
    self:showPage(_("Character sheet"), self:sheetText())
end

function GamebookScreen:addBookmark()
    if not self.game then return end
    local list = self.bookmarks[self.current] or {}
    local sec = self.game.s.section
    for i, b in ipairs(list) do
        if b.section == sec then table.remove(list, i) break end
    end
    table.insert(list, 1, { section = sec, state = self.game:serialize(), time = os.time() })
    while #list > MAX_BOOKMARKS do table.remove(list) end
    list[1].state.history = {}
    self.bookmarks[self.current] = list
    self:save()
    self:updateStatus(T(_("Bookmark added: § %1."), sec))
end

function GamebookScreen:openBookmarks()
    local list = self.bookmarks[self.current] or {}
    if #list == 0 then
        self:showMessage(_("No bookmarks yet: open the menu and tap Add bookmark."))
        return
    end
    local items = {}
    for i, b in ipairs(list) do
        items[#items + 1] = { id = i, text = T(_("§ %1 — %2"), b.section, os.date("%Y-%m-%d %H:%M", b.time)) }
    end
    MenuHelper.openPickerMenu{
        title     = _("Bookmarks"),
        items     = items,
        parent    = self,
        on_select = function(i)
            if not self.forgiving then
                self:showMessage(_("Turn on Forgiving mode to return to a bookmark."))
                return
            end
            -- Jumping to a bookmark is itself a step Back can undo.
            local b = list[i]
            self.game:_pushHistory()
            local hist = self.game.s.history
            self.game:load(b.state)
            self.game.s.history = hist
            self:save()
            self:rebuild()
        end,
    }
end

local function everyLabel(n)
    return n == 1 and _("Every section") or T(_("Every %1 sections"), n)
end

function GamebookScreen:openEveryMenu()
    local items = {}
    for _i, n in ipairs(Turns.EVERY_CHOICES) do items[#items + 1] = { id = n, text = everyLabel(n) } end
    MenuHelper.openPickerMenu{
        title = _("Reader changes"), items = items, current_id = self.turns.every, parent = self,
        on_select = function(n)
            Turns.setEvery(self.turns, n)
            self.plugin:saveSetting("party_every", n)
            self:save()
            self:rebuild()
        end,
    }
end

function GamebookScreen:setPlayerCount(n)
    self.players = Party.loadPlayers(self.plugin, n)
    Turns.resize(self.turns, n)
    self:save()
    self:rebuild()
end

function GamebookScreen:openModeMenu()
    MenuHelper.openPickerMenu{
        title      = _("Mode"),
        items      = { { id = "solo", text = _("Solo") }, { id = "party", text = _("Multiplayer") } },
        current_id = self.party and "party" or "solo",
        parent     = self,
        on_select  = function(mode)
            if (mode == "party") == self.party then return end
            self:save()
            self.plugin.launch_mode = mode
            self.party = mode == "party"
            self:loadSaves()
            self:save()
            self:rebuild()
        end,
    }
end

function GamebookScreen:menuItems()
    local items = {
        { text = _("New game"), callback = function() self:onNewGame() end },
    }
    local e = self.current and self:entryFor(self.current)
    items[#items + 1] = {
        text = T(_("Story: %1"), (self.phase == "play" and e) and e.title or "—"),
        callback = function() self:onLibrary() end,
    }
    items[#items + 1] = { text = T(_("Language: %1"), self.lang:upper()), callback = function() self:openLangMenu() end }
    if self.party then
        local p = self.plugin
        items[#items + 1] = { text = T(_("Players: %1"), #self.players), callback = function()
            Party.pickCount(p, function(n) self:setPlayerCount(n) end, self)
        end }
        items[#items + 1] = { text = _("Player names"), callback = function()
            Party.editPlayers(p, self.players, function() self:rebuild() end, self)
        end }
        items[#items + 1] = { text = T(_("Reader changes: %1"), everyLabel(self.turns.every)),
                              callback = function() self:openEveryMenu() end }
        items[#items + 1] = { text = T(_("Vote: %1"), self.vote_on and _("On") or _("Off")), callback = function()
            self.vote_on = not self.vote_on
            p:saveSetting("party_vote", self.vote_on)
            self:rebuild()
        end }
    end
    items[#items + 1] = {
        text = T(_("Forgiving mode: %1"), self.forgiving and _("On") or _("Off")),
        callback = function() self:toggleForgiving() end,
    }
    items[#items + 1] = { text = T(_("Mode: %1"), self.party and _("Multiplayer") or _("Solo")),
                          callback = function() self:openModeMenu() end }
    if self.party and self.phase == "play" then
        items[#items + 1] = { text = _("Next reader"), callback = function() self:onNextReader() end }
    end
    if self.phase == "play" then
        items[#items + 1] = { text = _("Character sheet"), callback = function() self:showSheet() end }
        items[#items + 1] = { text = _("Add bookmark"), callback = function() self:addBookmark() end }
        items[#items + 1] = { text = _("Bookmarks"), callback = function() self:openBookmarks() end }
    end
    items[#items + 1] = self:makeModeRulesButtonConfig({ solo = { RULES_EN, RULES_FR }, party = { RULES_PARTY_EN, RULES_PARTY_FR } })
    return items
end

-- ---------------------------------------------------------------------------
-- Wording
-- ---------------------------------------------------------------------------

function GamebookScreen:reasonText(a)
    if a.reason == "need" then
        return T(_("needs: %1"), self.game:itemName(a.what))
    elseif a.reason == "without" then
        return T(_("not with: %1"), self.game:itemName(a.what))
    elseif a.reason == "gold" then
        return T(_("needs %1 gold"), a.what)
    end
    return _("not possible yet")
end

function GamebookScreen:actionText(a)
    local s = self.game.s
    if a.kind == "choice" then
        if a.enabled then return a.text end
        return a.text .. "\n(" .. self:reasonText(a) .. ")"
    elseif a.kind == "continue" then
        return _("Continue")
    elseif a.kind == "attack" then
        return _("Attack")
    elseif a.kind == "flee" then
        return T(_("Flee (−%1 Stamina)"), Game.FLEE_WOUND)
    elseif a.kind == "test" then
        if a.stat == "luck" then
            return T(_("Test your Luck (2 dice ≤ %1)"), s.stats.luck)
        end
        return T(_("Test your %1 (2 dice ≤ %2)"), STAT_LABELS[a.stat], s.stats[a.stat])
    elseif a.kind == "roll" then
        return a.dice == 2 and _("Roll two dice") or _("Roll the die")
    end
    return "?"
end

-- The line above the buttons: what the dice just said, or the fight status.
function GamebookScreen:resultText()
    local g, s = self.game, self.game.s
    local r = s.result
    local lines = {}
    if r then
        if r.kind == "test" then
            lines[#lines + 1] = T(r.ok and _("You rolled %1 (≤ %2): success!") or _("You rolled %1 (> %2): failure."),
                r.roll, r.target)
        elseif r.kind == "roll" then
            lines[#lines + 1] = T(_("You rolled %1."), r.roll)
        elseif r.kind == "flee" then
            lines[#lines + 1] = _("You run for it!")
        elseif r.kind == "round" then
            local who = r.hit == "enemy" and T(_("you wound %1."), r.enemy)
                or r.hit == "me" and T(_("%1 wounds you."), r.enemy)
                or _("nobody is hurt.")
            lines[#lines + 1] = T(_("Round %1: you %2, %3 %4 — %5"), r.round, r.mine, r.enemy, r.theirs, who)
            if r.won then
                lines[#lines + 1] = _("You win the fight!")
            elseif r.next_enemy then
                lines[#lines + 1] = T(_("%1 is beaten. Next: %2!"), r.defeated, r.next_enemy)
            end
        end
    end
    if s.fight then
        local e = g:enemies()[s.fight.enemy]
        lines[#lines + 1] = T(_("%1 — Skill %2 · Stamina %3"), e.name, e.skill, s.fight.stamina)
    end
    if r and self.party and self.roller then
        table.insert(lines, 1, T(_("Rolled by %1"), self.roller))
    end
    if #lines == 0 then return nil end
    return table.concat(lines, "\n")
end

function GamebookScreen:endingText()
    local over = self.game.s.over
    if over == "win" then return _("THE END — You won!") end
    if over == "death" then return _("Your adventure ends here.") end
    return _("THE END")
end

function GamebookScreen:updateStatus(msg)
    if msg then return ScreenBase.updateStatus(self, msg) end
    if self.phase ~= "play" or not self.game then
        local n = #Stories.forLang(self.all_stories, self.lang)
        return ScreenBase.updateStatus(self, T(_("Stories: %1"), n))
    end
    local s = self.game.s
    local parts = {}
    if s.stats then
        parts[#parts + 1] = T(_("Skill %1"), s.stats.skill)
        parts[#parts + 1] = T(_("Stamina %1/%2"), s.stats.stamina, s.max.stamina)
        parts[#parts + 1] = T(_("Luck %1"), s.stats.luck)
    end
    parts[#parts + 1] = T(_("Gold %1"), s.gold)
    ScreenBase.updateStatus(self, self:joinStatus((table.unpack or unpack)(parts)))
end

-- ---------------------------------------------------------------------------
-- Layout
-- ---------------------------------------------------------------------------

function GamebookScreen:buildControls()
    self.status_text:setMaxWidth(self:getControlsWidth())
    local row = {}
    if self.page then
        row[1] = { text = _("Close"), callback = function() self:closePage() end }
    elseif self.phase == "play" and self:votableChoices() then
        -- The vote: the choices count the hands, the bar closes it.
        row[#row + 1] = { text = _("Sheet"), callback = function() self:showSheet() end }
        if self.forgiving then
            row[#row + 1] = { text = _("Back"), enabled = self.game:canGoBack(),
                              callback = function() self:onBack() end }
        end
        row[#row + 1] = { text = _("Clear votes"), enabled = Votes.total(self:currentVotes()) > 0,
                          callback = function() self:clearVotes() end }
        row[#row + 1] = { text = _("Decide"), callback = function() self:onDecide() end }
    elseif self.phase == "play" then
        row[#row + 1] = { text = _("Sheet"), callback = function() self:showSheet() end }
        if self.forgiving then
            row[#row + 1] = { text = _("Back"), enabled = self.game:canGoBack(),
                              callback = function() self:onBack() end }
        end
        row[#row + 1] = { text = _("Stories"), callback = function() self:onLibrary() end }
    end
    local group = VerticalGroup:new{ align = "center", self.status_text }
    if #row > 0 or self:isRoundOver() then
        group[#group + 1] = VerticalSpan:new{ width = Size.span.vertical_large }
        group[#group + 1] = self:buildActionBar(row)
    else
        self.action_bar = nil
    end
    return group
end

-- Biggest body font that lets `text` fit in w × h; below the smallest size
-- the text scrolls instead.
local BODY_SIZES = { 23, 21, 19, 18, 17, 16, 15, 14 }

local function fitBody(text, w, h, base)
    for _i, size in ipairs(BODY_SIZES) do
        local px = math.floor(size * base)
        local tb = TextBoxWidget:new{ text = text, face = pxFace(px), width = w, alignment = "left" }
        if tb:getSize().h <= h then return tb end
        tb:free()
    end
    return ScrollTextWidget:new{
        text  = text,
        face  = pxFace(math.floor(BODY_SIZES[#BODY_SIZES] * base)),
        width = w,
        height = h,
    }
end

-- Choice buttons, stacked with a small gap.
function GamebookScreen:buildButtons(specs, w, px)
    local group = VerticalGroup:new{ align = "center" }
    for i, sp in ipairs(specs) do
        if i > 1 then group[#group + 1] = VerticalSpan:new{ width = Size.span.vertical_large } end
        group[#group + 1] = ChoiceButton:new{
            text     = sp.text,
            width    = w,
            face     = pxFace(px),
            enabled  = sp.enabled ~= false,
            bold     = sp.bold,
            title    = sp.title,
            plain    = sp.plain,
            title_face = sp.title and pxFace(math.floor(px * 1.2), "tfont"),
            callback = sp.callback,
        }
    end
    return group
end

function GamebookScreen:buildLayout()
    local title
    if self.phase == "play" and self.story then
        title = self.story.title
    else
        title = _("Gamebooks")
    end
    local title_bar = self:buildTitleBar(title, function() return self:menuItems() end)
    local controls = self:buildControls()
    local bw, bh = self:getBoardBudget(title_bar, controls)
    -- Fonts follow the short side of the screen: 758 px wide on a Kobo Aura,
    -- 1080 on the reference render.
    local base = math.min(DeviceScreen:getWidth(), DeviceScreen:getHeight()) / 758 * 1.15
    local content
    -- The story list has no side controls worth a column (only its count):
    -- in landscape it takes the whole width, in two columns, with the
    -- status line under it as in portrait.
    local wide_library = self:isLandscape() and not self.page and not (self.phase == "play" and self.game)
    if wide_library then
        bw = self.dimen.w - 2 * self:getGutter()
        bh = self.dimen.h - title_bar:getSize().h - controls:getSize().h - 3 * self:getGutter()
    end
    if self.page then
        content = self:buildPage(bw, bh, base)
    elseif self.phase == "play" and self.game then
        content = self:buildPlay(bw, bh, base)
    else
        content = self:buildLibrary(bw, bh, base)
    end
    if self:isLandscape() and not wide_library then
        self:buildLandscapeLayout(title_bar, HorizontalGroup:new{
            align = "center",
            content,
            HorizontalSpan:new{ width = self:getGutter() },
            controls,
        })
    else
        self:buildPortraitLayout(title_bar, content,
            VerticalGroup:new{ align = "center", controls, VerticalSpan:new{ width = self:getGutter() } })
    end
    self[1] = self.layout
    self:updateStatus()
end

function GamebookScreen:buildPage(bw, bh, base)
    local gap = Size.span.vertical_large
    local heading = TextWidget:new{
        text = self.page.title, face = pxFace(math.floor(24 * base), "tfont"), max_width = bw,
    }
    local body = fitBody(self.page.text, bw, bh - heading:getSize().h - 2 * gap, base)
    return VerticalGroup:new{ align = "center", heading, VerticalSpan:new{ width = gap * 2 }, body,
        VerticalSpan:new{ width = math.max(0, bh - heading:getSize().h - 2 * gap - body:getSize().h) } }
end

function GamebookScreen:buildLibrary(bw, bh, base)
    local list = Stories.forLang(self.all_stories, self.lang)
    local specs = {}
    for _i, e in ipairs(list) do
        local lines = { e.blurb }
        local save = self.saves[e.key]
        if e.errors then
            lines[#lines + 1] = _("(has errors — tap for details)")
        elseif save and save.over then
            lines[#lines + 1] = _("(finished)")
        elseif save then
            lines[#lines + 1] = T(_("(in progress — § %1)"), save.section)
        end
        specs[#specs + 1] = {
            title = e.title,
            text = table.concat(lines, "\n"),
            callback = function()
                if e.errors then self:showStoryErrors(e) else self:onPickStory(e.key) end
            end,
        }
    end
    local heading = TextWidget:new{
        text = _("Choose a story"), face = pxFace(math.floor(26 * base), "tfont"), max_width = bw,
    }
    if #specs == 0 then
        return VerticalGroup:new{ align = "center", heading,
            VerticalSpan:new{ width = Size.span.vertical_large },
            TextBoxWidget:new{ text = _("No stories found for this language."), face = pxFace(math.floor(18 * base)),
                               width = bw, alignment = "center" } }
    end
    local avail = bh - heading:getSize().h - Size.span.vertical_large * 2
    local buttons
    local columns = self:isLandscape() and #specs > 3 and 2 or 1
    local function build(px)
        if columns == 1 then return self:buildButtons(specs, bw, px) end
        local gap = Size.span.horizontal_default * 2
        local cw = math.floor((bw - gap) / 2)
        local half = math.ceil(#specs / 2)
        local left, right = {}, {}
        for i, sp in ipairs(specs) do
            if i <= half then left[#left + 1] = sp else right[#right + 1] = sp end
        end
        return HorizontalGroup:new{ align = "top", self:buildButtons(left, cw, px),
            HorizontalSpan:new{ width = gap }, self:buildButtons(right, cw, px) }
    end
    for _i, size in ipairs({ 21, 20, 19, 18, 17, 16, 15, 14, 13, 12 }) do
        if buttons then buttons:free() end
        buttons = build(math.floor(size * base))
        if buttons:getSize().h <= avail then break end
    end
    return VerticalGroup:new{ align = "center", heading,
        VerticalSpan:new{ width = Size.span.vertical_large * 2 }, buttons }
end

function GamebookScreen:buildPlay(bw, bh, base)
    local g, s = self.game, self.game.s
    local sec = g:section()

    -- Buttons first: the text gets whatever height they leave.
    local specs = {}
    if s.over then
        specs[1] = { text = self:endingText(), bold = true, enabled = true, plain = true }
    else
        local voting = self:votableChoices() and self:currentVotes()
        for _i, a in ipairs(g:actions()) do
            local text, cb = self:actionText(a), function() self:onAction(a) end
            if voting and a.kind == "choice" and a.enabled then
                local n = Votes.get(voting, a.index)
                if n > 0 then text = text .. "\n" .. T(_("Votes: %1"), n) end
                cb = function() self:addVote(a.index) end
            end
            specs[#specs + 1] = {
                text = text, enabled = a.enabled,
                bold = a.kind ~= "choice",
                callback = cb,
            }
        end
    end
    local gap = Size.span.vertical_large
    -- Multiplayer: who reads, where the whole table sees it (the status
    -- line is full with the character sheet already).
    local head_text = T(_("§ %1"), s.section)
    if self.party then head_text = self:joinStatus(head_text, T(_("Reader: %1"), self:readerName())) end
    local header = TextWidget:new{
        text = head_text, face = pxFace(math.floor(22 * base), "tfont"), max_width = bw,
    }
    local result_text = self:resultText()
    local result
    if result_text then
        result = TextBoxWidget:new{
            text = result_text, face = pxFace(math.floor(18 * base), "cfont"), width = bw,
            alignment = "center", bold = true,
        }
    end
    local buttons
    -- Choices read at the body's size; they only shrink when many long
    -- ones would take more than half the page.
    local choice_px = { 23, 22, 21, 20, 19, 18, 17 }
    for _i, size in ipairs(choice_px) do
        if buttons then buttons:free() end
        buttons = self:buildButtons(specs, bw, math.floor(size * base))
        if buttons:getSize().h <= bh * 0.5 then break end
    end
    local fixed = header:getSize().h + gap + buttons:getSize().h + gap * 2
    if result then fixed = fixed + result:getSize().h + gap end
    local body = fitBody(sec.text, bw, math.max(bh - fixed, math.floor(bh * 0.2)), base)

    -- The page is anchored like a book's: text from the top, the buttons at
    -- the bottom, nearest the reader's thumbs.
    local filler = math.max(gap * 2, bh - fixed - body:getSize().h + gap * 2)
    local group = VerticalGroup:new{ align = "center", header, VerticalSpan:new{ width = gap }, body,
        VerticalSpan:new{ width = filler } }
    if result then
        group[#group + 1] = result
        group[#group + 1] = VerticalSpan:new{ width = gap }
    end
    group[#group + 1] = buttons
    return group
end

return GamebookScreen
