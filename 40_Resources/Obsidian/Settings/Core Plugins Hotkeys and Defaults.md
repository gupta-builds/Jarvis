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
==One of this vault's eight custom hotkeys is bound to a plugin that isn't installed== — `.obsidian/hotkeys.json` still maps Alt+C to `calendar:show-calendar-view`, but `calendar` never appears in `.obsidian/community-plugins.json`. [[Plugin Gaps Recommendations and Verification]] already resolved this the same way; this note's direct `hotkeys.json` read is corroborating evidence, not a new finding.
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
Every rebinding in `.obsidian/hotkeys.json`, eight total:
- `Alt+B` — `backlink:open`
- `Alt+C` — `calendar:show-calendar-view`. **Dead binding** — no `calendar` entry exists in `.obsidian/community-plugins.json`. Pressing Alt+C does nothing, matching [[Plugin Gaps Recommendations and Verification]]'s existing resolution: only referenced, never installed.
- `Alt+W` — `workspace:close-others`
- `obsidian-excalidraw-plugin:save` — bound to an **empty modifier list**, meaning this hotkey was explicitly cleared by hand at some point, not simply never configured. Excalidraw's save now falls back to whatever default (if any) the plugin itself assigns.
- `Mod+Shift+E` — `file-explorer:open`
- `Alt+V` — `editor:insert-codeblock`
- `Alt+F` — `omnisearch:show-modal`
- `Alt+Q` — `quickadd:runQuickAdd`
- `Alt+M` — `excalibrain:excalibrain-open-hover` — a live binding, consistent with Build 3's finding that Excalibrain is actually installed, correcting an earlier tracker error that assumed it was missing.
## Suggestions
- **Removing the dead `calendar:show-calendar-view` hotkey is genuinely low-value to do right now — correct but not worth Anant's time yet.** It does nothing when pressed and hurts nothing by existing. The honest verdict: batch this into whatever future session next gets explicit permission to edit `hotkeys.json` for another reason, rather than spending a dedicated approval round on a dead keybinding alone. Installing Calendar instead is a separate, real decision (already tracked in [[Plugin Gaps Recommendations and Verification]]'s Optional table) that depends on whether periodic-note navigation is actually a felt need — it isn't clearly one yet, per that same tracker.
- **Re-checking the cleared `obsidian-excalidraw-plugin:save` binding is worth five minutes, not more.** Excalidraw drawings save as `.excalidraw.md` files through Obsidian's own note-save path, so losing an explicit save hotkey most likely just means saves happen on Obsidian's normal auto-save cadence instead of an instant manual trigger — a minor workflow friction if true, not a data-loss risk. Worth confirming next time Excalidraw is open, not worth a dedicated session.
- **Resolved by Build 6, not still open.** [[Cross-Laptop Sync - Build 6 Findings]] confirms `core-plugins.json` collided directly with the Acer's factory-default copy during pairing (the Acer's default had Obsidian's own Sync service turned on, which the Dell had deliberately disabled) — the Dell's real file won, by design, and no `.stignore` entry was needed for either file. `hotkeys.json` never collided at all, since the Acer's fresh install never created one. Both are confirmed synced correctly now, not a remaining risk.
## Sources
- Direct read of `.obsidian/core-plugins.json`, `.obsidian/hotkeys.json`, `.obsidian/community-plugins.json` — this session, 2026-09-19
- [[Plugin Gaps Recommendations and Verification]] — prior open questions this note resolves or sharpens
- [[Cross-Laptop Sync - Build 3 Findings]] — Excalibrain installed-not-missing correction, cross-referenced here
