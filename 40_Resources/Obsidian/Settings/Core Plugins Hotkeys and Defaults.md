---
type: evergreen
status: sprout
created: 2026-09-19
tags:
  - evergreen
  - system
  - obsidian
  - settings
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[00 Plugin Reference Index]]"
  - "[[Plugin Inventory and Configuration Map]]"
  - "[[Plugin Gaps Recommendations and Verification]]"
  - "[[File Handling and Properties]]"
next: "[[File Handling and Properties]]"
---
# Core Plugins Hotkeys and Defaults
==Seven custom hotkeys remain, all live== — the dead `calendar:show-calendar-view` binding (Alt+C, mapped to a plugin that was never installed) was removed 2026-09-20, once this note and [[Plugin Gaps Recommendations and Verification]] had both independently confirmed it did nothing.
## What This Note Covers
[[Plugin Inventory and Configuration Map]] lists which community plugins are installed. This note covers the two things neither it nor [[File Handling and Properties]] documents: which of Obsidian's own core (built-in) plugins are actually turned on, and every custom hotkey rebinding, read directly from `.obsidian/core-plugins.json` and `.obsidian/hotkeys.json`.
## Core Plugins — On, Off, and Why It Matters
Read directly from `.obsidian/core-plugins.json`. Off-by-default-and-still-off plugins aren't listed; only the choices worth explaining are:
- **`daily-notes: false`, `templates: false`** — both of Obsidian's own built-in periodic-note and templating systems are off. [[Templates Capture and Periodic Notes]] confirms why: the community Templater plugin replaced both, since it supports the folder-template and per-type logic the core versions can't.
- **`sync: false`** — Obsidian Sync (the official paid subscription sync service) was never turned on. This vault uses Syncthing instead, per [[Cross-Laptop Sync - Build Roadmap]] — not an oversight, the deliberate alternative this entire build sequence exists to implement.
- **`publish: true`** — on, but per [[Plugin Gaps Recommendations and Verification]]'s own resolution, no `.obsidian/publish.json` exists anywhere in the vault, so this reads as a default-on core toggle with no live publish site behind it, not active use.
- **`bases: true`** — on, and genuinely in use, not just enabled: `60_Claude/44_Indexes/Bases/` holds five real `.base` files (Capability Registry, Knowledge Enrichment Registry, Ops Reports, Output Pipeline, Question Triage), per the same tracker note. Bases and [[Dataview and Dashboards]] run alongside each other today, not as a pending either/or choice.
- **`zk-prefixer: false`, `audio-recorder: false`, `webviewer: false`** — off, consistent with this vault's actual workflow: no Zettelkasten ID-prefixing convention, no voice-note capture, no in-app web browsing.
## Custom Hotkeys
Every rebinding in `.obsidian/hotkeys.json`, seven total as of 2026-09-20 (`calendar:show-calendar-view` removed — see below):
- `Alt+B` — `backlink:open`
- `Alt+W` — `workspace:close-others`
- `obsidian-excalidraw-plugin:save` — bound to an **empty modifier list**, meaning this hotkey was explicitly cleared by hand at some point, not simply never configured. Excalidraw drawings save through Obsidian's own note-save path regardless, so this most likely just means saves happen on the normal auto-save cadence instead of an instant manual trigger — a minor workflow friction, not a data-loss risk. Left as-is; not worth a dedicated session to chase further.
- `Mod+Shift+E` — `file-explorer:open`
- `Alt+V` — `editor:insert-codeblock`
- `Alt+F` — `omnisearch:show-modal`
- `Alt+Q` — `quickadd:runQuickAdd`
- `Alt+M` — `excalibrain:excalibrain-open-hover` — a live binding, consistent with Build 3's finding that Excalibrain is actually installed, correcting an earlier tracker error that assumed it was missing.
## Calendar Hotkey — Removed
`calendar:show-calendar-view` (Alt+C) was a dead binding: no `calendar` entry ever existed in `.obsidian/community-plugins.json`, confirmed directly against the file, matching [[Plugin Gaps Recommendations and Verification]]'s independent resolution of the same question. Removed from `.obsidian/hotkeys.json` 2026-09-20 rather than left in place, since a batch of other real `data.json`/`hotkeys.json` changes was already happening in the same approved pass. Installing the Calendar plugin instead of just removing the dead key was considered and rejected — [[Plugin Gaps Recommendations and Verification]]'s Optional table lists it as worth adding only if daily/weekly Periodic Notes navigation becomes a felt need, which it isn't yet.
## Cross-Laptop Sync Note
[[Cross-Laptop Sync - Build 6 Findings]] confirms `core-plugins.json` collided directly with the Acer's factory-default copy during pairing (the Acer's default had Obsidian's own Sync service turned on, which the Dell had deliberately disabled) — the Dell's real file won, by design, no `.stignore` entry needed. `hotkeys.json` never collided at all, since the Acer's fresh install never created one. Both confirmed syncing correctly.
## Sources
- Direct read of `.obsidian/core-plugins.json`, `.obsidian/hotkeys.json`, `.obsidian/community-plugins.json` — this session, 2026-09-19 and 2026-09-20
- [[Plugin Gaps Recommendations and Verification]] — prior open questions this note resolves or sharpens
- [[Cross-Laptop Sync - Build 3 Findings]] — Excalibrain installed-not-missing correction, cross-referenced here
