# Changelog

## [1.1.5] - 2026-11-12

### Changed
- Picks up game-common 1.16.0: games for two readers (new Two readers
  category) and the shared Start / Join dialog.

## [1.1.4] - 2026-11-09

### Fixed
- A language tried once in the game's Language menu no longer sticks for
  good: the game follows KOReader's language (French when KOReader is in
  French), and a language picked in the game holds until KOReader's language
  changes. A language picked with an earlier version is forgotten once.

## [1.1.3] - 2026-11-04

### Fixed
- A game no longer crashes when an outdated plugin is installed alongside:
  shared modules left behind by an older plugin are replaced by this
  plugin's own copy instead of being used as they are.

## [1.1.2] - 2026-11-04

### Changed
- Uses less memory: the game loads when you open it, not when KOReader
  starts, so it no longer takes memory or startup time while unplayed.

## [1.1.1] - 2026-11-03

### Changed
- Picks up game-common 1.11.0: the shared on-screen keyboard (where used)
  gives every key the same letter size, and the no-repeat history helper.

## [1.1.0] - 2026-11-02

### Added
- Multiplayer mode: also listed as "Gamebooks · multiplayer" under Tools →
  Games → Party & quiz, and switchable in the game (menu → Mode). One player
  reads aloud — "Reader: Alice" heads the page — and the book passes to the
  next player after every section, or every 2, 3 or 5 sections (Reader
  changes); Next reader passes it by hand. At a choice the table votes: the
  reader taps an option once per raised hand, Decide takes the majority, and
  a tie (or no vote) lets the reader decide. Vote can be turned off. Dice
  results say who rolled. The table's adventures are saved apart from the
  solo ones.
- Separate multiplayer rules (Rules opens the rules of the mode played, with
  a button to read the other mode's).

## [1.0.1] - 2026-11-02

### Changed
- Listed under **Tools → Games**, grouped by category, instead of its own
  entry in the Tools menu (game-common 1.9.1).

## [1.0.0] - 2026-10-30

### Added
- First release: a gamebook engine with numbered sections, choices as big
  buttons, an optional character sheet (Skill, Stamina, Luck), gold,
  inventory, flags, conditional choices, two-dice combat, skill and luck
  tests and die rolls.
- Twelve bundled stories, six in French (Le Stagiaire du Temps, Le Fantôme du
  Mont, La Baguette Stellaire, Le Vélo maudit du Tour, Le Sourire volé du
  Louvre, Le Soufflé du Roi-Soleil) and six in English (The Tea-Stained
  Timeline, The Ravens of the Tower, The Jolly Rocket, Cleopatra's Cat,
  Around the World by Balloon, The Dragon Who Can't Sleep).
- Automatic save per story, bookmarks, and a Forgiving mode with Back.
- Stories in a documented Lua format, loaded from the plugin's `stories/`
  folder and from `koreader/data/gamebook/`; broken stories are listed with
  their errors instead of crashing.
- Interface in English, French, Spanish and German.
