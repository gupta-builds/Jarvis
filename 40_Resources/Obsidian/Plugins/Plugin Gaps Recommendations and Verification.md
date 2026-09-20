---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-09-20
tags:
  - evergreen
  - system
  - obsidian
  - plugins
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
---
# Plugin Gaps Recommendations and Verification

This is the action register for plugin gaps, risks, optional additions, and unresolved settings.

Do not scatter recommendations across the plugin docs. Link here and keep one canonical list.

## High Impact / Low Risk

### QuickAdd capture menu

**Resolved 2026-09-20.** Two of the six proposed choices (Inbox thought, Flashcard candidate) are built and live, exact field values in [[QuickAdd Capture Menu]]. The other four are Template-type and still blocked on `30_Order/Templates/` only having `MOC.md` — building them is the next step once real templates exist for source clipping, source summary, concept note, and project note.

### Tasks dashboard conventions

Current state: resolved 2026-09-19, documented in [[Tasks Kanban and Project Tracking]]. `00_Dashboard`'s "Today's Priorities" block keeps its Dataview `TASK` block — checked against the live query, its filter is `file.day = date(today)`, a page-metadata property Dataview reads directly and the Tasks query language has no equivalent for. Tasks query examples for due-soon/in-progress/priority views were already added to that note.

### Spaced Repetition effective config

**Resolved 2026-09-20 — this was a real bug, not just a cadence question.** `data.json` held a dead legacy top-level config layer alongside the real nested `settings` block; the plugin only ever reads the nested one (confirmed from `main.js` source), which had `#flashcards`/bold-clozes-off, not the `#cards`/bold-clozes-on every real card in this vault assumed. Every `#cards` card was invisible to review. Fixed by correcting the nested settings to match the vault's actual convention and deleting the dead legacy keys. Full detail in [[Spaced Repetition and Learning Loops]]. Cadence/card-quality adoption (add cards only after distillation, connect `last_drilled`/`next_drill`) remains a behavioral practice, not a settings gap.

### Excalidraw visual templates

**Partially resolved 2026-09-20.** The `templateFilePath` typo (`10_Area` vs `10_Areas`) is fixed — the single-default-template mechanism now works correctly, it just has no file at that path yet. Building the two proposed templates themselves (system architecture map, course concept/PDF annotation map) stays deliberately deferred: the vault has zero real Excalidraw drawings to justify a template yet, per [[Excalidraw Diagrams and Annotation]]'s Verified Open State. Build the first real drawing before templating an unused workflow.

## High Impact / Needs Decision

### Local REST API security

Current state: secure port `27124`, insecure port `27123`, insecure server enabled. Researched 2026-09-18 and documented in [[AI Automation and Local Interfaces]]: `27123` still requires the API key — the gap is transport encryption (no TLS), not authentication. The plugin's own README frames it as a fallback for MCP clients that cannot trust the locally generated CA, not a general convenience. Whether `27123`'s default binding is localhost-only or LAN-reachable was not found in official docs and remains unverified.

Decision needed: whether the insecure server should remain enabled and which local tools need it.

### Omnisearch and Text Extractor

**Resolved 2026-09-20 — user decision, implemented.** Text Extractor (`scambier/obsidian-text-extractor`, v0.7.0) installed for real — not the unrelated Microsoft PowerToys "Text Extractor" screen-OCR utility the user also has, see the explicit distinction in [[Omnisearch and Retrieval]]. Omnisearch's `PDFIndexing`, `officeIndexing`, and `imagesIndexing` are now `true`; `aiImageIndexing` stays `false` (a further, separate privacy step beyond local OCR, not part of the user's stated decision). Full mechanism, install method, and the unmaintained-repo caveat documented in [[Omnisearch and Retrieval]].

### Copilot autonomous tools

Current state: Copilot autonomous agent mode and saved memory are enabled.

Decision needed: whether Copilot can make vault edits, or whether it should stay as human-facing Q&A with citations.

### Obsidian Git auto-push

**Resolved 2026-09-20.** This was a real collision, not just a theoretical cadence question: the plugin's own auto-push (was every 121 min) and auto-pull (was every 120 min, plus on every Obsidian boot) ran completely uncoordinated with the new cross-laptop `Jarvis-GitAutoSync` scheduled task. Worse, `mergeStrategy: "ours"` meant an automatic pull hitting a real conflict would silently discard the incoming side. Fixed: auto-push and auto-pull both disabled (`0`), auto-pull-on-boot off, merge strategy corrected to `"none"` (real conflict markers, no silent data loss). Auto-commit (local only, no push/pull) stays on — it's complementary to the scheduled script, not competing with it. Full detail in [[Git Recovery and Vault Safety]].

## Optional

| Option | Why consider it | Do not add unless |
|---|---|---|
| Text Extractor | Helps Omnisearch index PDFs/images. | **Installed 2026-09-20** — see [[Omnisearch and Retrieval]]. |
| Calendar | Better visual Periodic Notes navigation. | Daily/weekly review navigation becomes painful. |
| Recent Edits | Better edit-trail review than Recent Files. | **Installed and in real use** — `data.json` holds a live 7-day edit history with dozens of real entries and external-vs-in-app edit-source tracking. Wired into Lazy Plugin Loader 2026-09-20 (was installed but not activated in either `community-plugins.json` or the loader — see [[Plugin Inventory and Configuration Map]]). |
| Excalibrain | Visual graph-style concept exploration. | Existing Excalibrain references are intentional. |
| Commander | Command/ribbon customization. | **Installed, not yet configured** — no `data.json` exists yet (never opened/customized). Wired into Lazy Plugin Loader 2026-09-20 so it activates; actual ribbon/command customization is still a zero-config install. |

## Risk Register

| Risk | Current evidence | Mitigation |
|---|---|---|
| DataviewJS and HTML enabled | Dataview settings allow both. | Prefer plain Dataview; document any JS near the block. |
| Local REST API insecure server | `enableInsecureServer` is true. | Review need; do not call REST endpoints without approval. |
| Copilot autonomous tools | Copilot autonomous agent mode is enabled. | Vault notes beat Copilot memory; no unapproved parallel writes. |
| Obsidian Git auto-push | **Resolved 2026-09-20** — auto-push/pull disabled, merge strategy fixed. See [[Git Recovery and Vault Safety]]. | No longer a live risk; still check status before broad edits as general practice. |
| Dirty worktree | Vault often has unrelated changes. | Preserve unrelated changes and log meaningful edits. |
| QuickAdd AI providers | Provider config exists. | Configure non-AI capture first; do not expose credentials. |
| Excalidraw AI | AI enabled. | Do not expose credentials; keep text source of truth. |
| Theme/snippet coupling | AnuPpuccin, Style Settings, and snippets are active. | Keep Markdown semantic. |

## Needs Verification

- Effective plugin enabled state after Lazy Plugin Loader completes startup. — *mechanism now documented in [[Plugin Inventory and Configuration Map]]: `instant`-startup plugins are the only ones that persist to `community-plugins.json`; `short`/`long` plugins activate live via a non-persisting `enablePlugin()` call and never appear in that file.*
- Whether Local REST API's insecure port `27123` binds to localhost only or is LAN-reachable — *resolved 2026-09-19: the plugin's server binds to a "Binding Host" setting whose documented default is `127.0.0.1` ("Setting this to `0.0.0.0` allows access from other devices on the network" — [Local REST API installation/configuration reference](https://deepwiki.com/coddingtonbear/obsidian-local-rest-api/1.1-installation-and-configuration)). This vault's `data.json` has no `bindingHost` override, so both the secure (`27124`) and insecure (`27123`) servers are running on the plugin's default, localhost-only. The `27123` risk is still transport encryption, not network exposure — see [[AI Automation and Local Interfaces]].*
- `lazy-plugins` data.json references four plugins not yet in this vault's Community Plugins inventory table: `lean-terminal`, `homepage`, `obsidian-meta-bind-plugin`, `multi-column-markdown` — *resolved 2026-09-19: all four researched and given a home in [[Plugin Inventory and Configuration Map]]'s Community Plugins table, plus a workflow section each — [[AI Automation and Local Interfaces]] (Lean Terminal), [[Search Linking and Navigation]] (Homepage), [[Appearance Code Math and Reading Experience]] (Multi-Column Markdown), [[Dataview and Dashboards]] (Meta Bind).*
- Lazy Plugin Loader references `excalibrain`, but no matching plugin folder was found. — *correction, 2026-09-19: this was wrong. `.obsidian/plugins/excalibrain/` contains `main.js`, `manifest.json` (v0.2.18), and `styles.css` — a fully installed plugin, not a missing one. The earlier claim was never checked directly against the filesystem. See [[Plugin Inventory and Configuration Map]].*
- `workspaces-plus` exists but has no readable manifest. — *resolved 2026-09-19: the folder holds only three `.bak` files (`app.json.bak`, `appearance.json.bak`, `workspaces.json.bak`) — no `manifest.json`, no `main.js`. This is not an installed plugin; it is leftover settings-backup files sitting in a folder that happens to be named after one. Answers the "was Workspaces Plus intentionally removed" question below: functionally, yes — nothing here can activate.*
- Whether `60_Claude/7_AI_Information` should get a Templater folder template. — *resolved 2026-09-19: no. That folder (`60_Claude/07_AI_Information/`) holds system/operating docs — `AI_CONTEXT.md`, `Vault Rules — Complete AI Ruleset.md`, `Jarvis OS — North Star.md` — not evergreen knowledge notes, so the existing `For Evergreen.md` template that other folder-template entries use would be the wrong shape here. No template is the correct state, not a gap.*
- **Resolved 2026-09-20.** The 2026-09-19 finding undercounted the bug: checking template-file existence (not just folder existence) found that **four of the six entries** also pointed at a nonexistent `30_Order/Templates/Metadata/` folder — the real folder is `Frontmatter/`. Combined with the already-known dead `10_UMN`/`60_Claude/30_Source_Summaries` folder aliases, effectively all six entries were broken before this fix. All six corrected in `.obsidian/plugins/templater-obsidian/data.json` (Node-script edit + strict JSON + BOM validation, per this vault's `.obsidian/` edit workaround), and the mapping table rewritten with real verified paths in [[Templates Capture and Periodic Notes]]. The `10_Areas/UMN` entry is now correctly pointed but stays dormant — that folder doesn't exist in-vault yet.
- Whether QuickAdd should be configured with capture choices. — *how-to now documented in [[QuickAdd Capture Menu]] (2026-09-19); the yes/no decision itself is still open.*
- Whether Recent Files and File Explorer++ overlap in function. — *resolved 2026-09-19 in [[Search Linking and Navigation]]: no overlap, checked against both plugins' READMEs. Recent Files is time-based (recently opened); File Explorer++ is structure-based (pin/hide filters), no recency concept. Keep both.*
- Whether Omnisearch should enable PDF/image/Office indexing, likely with Text Extractor. — *tradeoffs researched 2026-09-19: confirmed current state directly in `.obsidian/plugins/omnisearch/data.json` — `PDFIndexing`, `officeIndexing`, `imagesIndexing`, and `aiImageIndexing` are all `false`. Text Extractor ([scambier/obsidian-text-extractor](https://github.com/scambier/obsidian-text-extractor)) is the plugin Omnisearch expects for this: OCR runs locally via Tesseract.js (no file content leaves the device), but it needs an internet connection once to download language files, does not work on mobile at all (falls back to cached JSON extracted elsewhere), and PDF extraction specifically is described by the plugin's own docs as frequently failing. The decision itself is still open — mobile-unusable and PDF-unreliable are real costs against searchable PDFs/screenshots as a benefit.*
- Whether Excalidraw auto-export should be enabled. — *mechanism researched 2026-09-19: it creates a PNG and/or SVG copy of a drawing on every save, with an optional keep-in-sync mode so the exported file (not the `.excalidraw.md` source) is what gets embedded elsewhere — configurable per-file via an `excalidraw-autoexport: none|both|png|svg` frontmatter override ([Excalidraw plugin README](https://github.com/zsviczian/obsidian-excalidraw-plugin)). The tradeoff: every save writes an extra file next to the drawing, which is more Syncthing/git churn per diagram. The enable/disable decision itself is still open.*
- Whether Local REST API insecure server should remain enabled. — *tradeoff now documented in [[AI Automation and Local Interfaces]] (2026-09-18); the decision itself is still open.*
- Preferred Tasks date conventions for coursework vs projects. — *syntax documented 2026-09-19: 📅 due, ⏳ scheduled, 🛫 start (all manual), plus automatic ➕ created / ✅ done / ❌ cancelled, all in `YYYY-MM-DD` format ([Tasks — Dates](https://publish.obsidian.md/tasks/Getting+Started/Dates)). The official guidance is explicitly against over-engineering: "you don't have to use all available dates... don't over-engineer your task management." Coursework vs project split is still a preference decision, not a syntax gap.*
- Preferred Tasks priority scale for coursework vs projects. — *syntax documented 2026-09-19: six levels, 🔺 Highest, ⏫ High, 🔼 Medium, no marker = default, 🔽 Low, ⏬ Lowest — tasks with no priority marker rank above tasks explicitly marked Low, by design, so low-effort filtering doesn't require marking everything ([Tasks — Priority](https://publish.obsidian.md/tasks/Getting+Started/Priority)). Coursework vs project scale is still a preference decision, not a syntax gap.*
- **New correction, 2026-09-20:** [[Templates Capture and Periodic Notes]]'s Periodic Notes Review Flow table was entirely wrong when checked against `.obsidian/plugins/periodic-notes/data.json` directly — real folders are `10_Areas/Life/Enumerate/{Daily,Weekly,Monthly,Yearly}` (not `60_Claude/50_Reviews/`, which doesn't exist), real templates are `30_Order/Templates/Enumerate/Better *.md` (not `Headway Templates/`), and Yearly is enabled (was documented as disabled). This is the mechanism `/startday`/`/closeday` actually use. Note rewritten with verified values.
- Preferred Kanban lane names for future project boards.
- Whether Calendar is installed or only referenced by old hotkeys. — *resolved 2026-09-19, acted on 2026-09-20: no `calendar` folder exists under `.obsidian/plugins/`. The dead `calendar:show-calendar-view` binding (`Alt+C`) has been removed from `hotkeys.json` — see [[Core Plugins Hotkeys and Defaults]].*
- Whether Excalibrain is intentionally absent or partially removed. — *resolved 2026-09-19: not absent. See the corrected `excalibrain` entry above — the plugin is fully installed and configured `long` in Lazy Plugin Loader.*
- Whether Publish is actively used and what should be publishable. — *checked 2026-09-19: `core-plugins.json` has `publish: true`, but no `.obsidian/publish.json` (the file Obsidian writes once a publish site is configured) exists anywhere in the vault. No evidence of active use — reads as a default-on core toggle, not a live publish workflow. Still needs the user's own confirmation.*
- Whether Bases should complement Dataview or remain experimental. — *resolved 2026-09-19: not experimental. `60_Claude/44_Indexes/Bases/` holds five real `.base` files (Capability Registry, Knowledge Enrichment Registry, Ops Reports, Output Pipeline, Question Triage) alongside `core-plugins.json`'s `bases: true`. Bases and Dataview are both in active use today, not a pending choice between them.*
- Whether Workspaces Plus was intentionally removed. — *resolved 2026-09-19: see the corrected `workspaces-plus` entry above. No manifest, no main.js, only stale `.bak` files — nothing here can run as a plugin regardless of intent.*

## Verification Checklist

Before changing plugin settings:

- Read the relevant reference doc in this folder.
- Check the current plugin setting in Obsidian UI, not just `data.json`.
- Decide whether the change affects secrets, automation, Git, or broad appearance.
- Back up or record the old setting if the user asks for a change.
- Change only the setting the user approved.
- Log the change in `60_Claude/10_Session_Logs/log.md`.

## Recommendation Rule

A plugin recommendation is valid only if it improves one of these:

- capture speed
- retrieval reliability
- review quality
- linking clarity
- task visibility
- visual understanding
- automation safety
- backup/recovery confidence

Otherwise, skip it.

## Sources

- [Obsidian Help - Core plugins](https://help.obsidian.md/plugins)
- [QuickAdd docs](https://quickadd.obsidian.guide/docs/)
- [Tasks User Guide](https://publish.obsidian.md/tasks/)
- [Spaced Repetition README](https://github.com/st3v3nmw/obsidian-spaced-repetition)
- [Omnisearch docs](https://publish.obsidian.md/omnisearch/Index)
- [Excalidraw plugin README](https://github.com/zsviczian/obsidian-excalidraw-plugin)
- [Local REST API README](https://github.com/coddingtonbear/obsidian-local-rest-api)
- [Local REST API installation/configuration reference](https://deepwiki.com/coddingtonbear/obsidian-local-rest-api/1.1-installation-and-configuration) — Binding Host default and `0.0.0.0` LAN-exposure behavior
- [Copilot docs](https://www.obsidiancopilot.com/en/docs)
- [Obsidian Git docs](https://publish.obsidian.md/git-doc/Features)
- [Tasks — Dates](https://publish.obsidian.md/tasks/Getting+Started/Dates)
- [Tasks — Priority](https://publish.obsidian.md/tasks/Getting+Started/Priority)
- [Text Extractor plugin](https://github.com/scambier/obsidian-text-extractor) — OCR mechanism, mobile limitation, local-only processing, fetched 2026-09-19
- Direct read of `.obsidian/plugins/templater-obsidian/data.json` and `.obsidian/plugins/omnisearch/data.json` — this session, 2026-09-19
