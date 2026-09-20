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
  - "[[Cross-Laptop Sync - Build 5 Findings]]"
next: "[[Appearance Theme and CSS Snippets]]"
---
# File Handling and Properties
==This vault runs Files & Links close to Obsidian's stock defaults: `.obsidian/app.json` is short because Obsidian only writes a key when its value differs from the built-in default, so a short file is itself the finding, not missing data.==
## What This Note Covers
[[Plugin Inventory and Configuration Map]] owns the core-plugin enabled/disabled table. This note covers the app-level settings sitting behind those plugins — `.obsidian/app.json` and `.obsidian/types.json` — which are not plugin-specific and are not documented anywhere else in the Plugins folder.
## Files and Links Settings
Read directly from `.obsidian/app.json`, cross-checked against Obsidian's own settings labels:
- **`promptDelete: true`** — *Confirm file deletion.* Every delete (note, folder, attachment) asks first instead of moving straight to `.trash`. With two AI editors (Claude Code, Cursor) and an agent-driven Obsidian MCP server all capable of deleting files, this is the one guard that forces a human-visible prompt in the Obsidian UI specifically — it does not apply to filesystem-level deletes done outside Obsidian.
- **`alwaysUpdateLinks: true`** — *Automatically update internal links.* Renaming or moving a note rewrites every `[[wikilink]]` that pointed to it, vault-wide, without asking. This is why [[Jarvis Writing and Formatting]] can safely tell agents to use wikilinks freely — a move does not silently break backlinks the way it would with plain relative Markdown links.
- **`showUnsupportedFiles: false`** — *Detect all file extensions.* Off means Obsidian only surfaces file types it natively understands in File Explorer, Quick Switcher, and linking. Off is the default; this vault never turned it on, so stray file types dropped into a folder (a `.docx`, a `.zip`) stay invisible to Obsidian rather than becoming linkable clutter.
- **`readableLineLength: true`** — caps line width in both edit and reading view instead of running text edge-to-edge on wide monitors.
- **`uriCallbacks: false`** — the `obsidian://` URI handler that lets external apps open or create notes by URL is off. Nothing outside Obsidian currently triggers vault actions this way.
## PDF Export Settings
`pdfExportSettings` in `app.json`: A4 page size, portrait, 65% downscale, filename included, zero margin. Minor — only matters when a note gets exported to PDF from inside Obsidian, which is not a used workflow today; recorded here so a future export doesn't have to rediscover the defaults.
## Ignore Filters Are A Third Exclusion Mechanism, Not A Performance Fix
`userIgnoreFilters` in `app.json` currently holds five paths as of 2026-09-20:
- `50_Archive/`
- `30_Order/System/excalidraw-mcp/node_modules/`
- `60_Claude/00_Inbox/copilot/`
- `30_Order/System/cursor-workflow/logs/` — added 2026-09-20
- `30_Order/System/claude-workflow/logs/` — added 2026-09-20
> [!NOTE]
> This setting is Obsidian's own **Files & Links → Excluded files** list — confirmed against community plugin documentation that reads and writes this exact `app.json` key, since Obsidian's own help site does not document it directly (open issue: [obsidianmd/obsidian-help#956](https://github.com/obsidianmd/obsidian-help/issues/956)).
> [!WARNING]
> **Corrected 2026-09-20 — this setting does not meaningfully help startup/launch performance, despite reading like it should.** Community reports (Obsidian forum feature-request thread on excluding files from all indexers, and the third-party "File Ignore" plugin's own stated reason for existing) consistently describe `userIgnoreFilters` as filtering what's *displayed* in File Explorer/Quick Switcher/search, without reliably stopping Obsidian from scanning or indexing the excluded files in the first place. The two log folders above were added for genuine UI decluttering value (they no longer clutter File Explorer or search results), not because it fixes slow launches. The mechanism that actually does exclude files from indexing in this vault is the dot-prefix convention already used for `.claude_windows`/`.claude_wsl`/`.cursor_windows`/`.cursor_wsl`/`.kiro_windows`/`.kiro_wsl` (confirmed in [[Cross-Laptop Sync - Build 4 Findings]] — these are hidden from Obsidian's sidebar specifically because of the leading dot, a more fundamental exclusion than `userIgnoreFilters`). Renaming the high-churn log folders to a dot-prefixed form would be the real fix, but that's a structural change touching every script that references those exact paths (`git-auto-sync.ps1`, the cursor-workflow sweep script, `.stignore`, `.gitignore`) — flagged here as the genuine next step, not done in this pass without checking every reference first.

It is a third, independent exclusion layer alongside `.gitignore` (git) and `.stignore` (Syncthing), and the three do not automatically agree with each other. `userIgnoreFilters` only hides a path from Obsidian's own File Explorer, Quick Switcher, search, and graph/backlink views — it has no effect on what git commits or what Syncthing transfers. A path can be excluded here and still sync via Syncthing, or vice versa; each of the three files needs to be checked on its own terms when auditing what actually leaves this machine, which is what the [[Cross-Laptop Sync - Build Roadmap|cross-laptop sync builds]] have been doing for `.stignore` specifically.
## Properties Type Registry
`.obsidian/types.json` assigns a UI type to every property name ever used in this vault's frontmatter. Per Obsidian's own Properties documentation: *"Once a property type is assigned to a property name, all properties with that name across your vault will use the same type"* — the registry is vault-wide, not per-note, and it grows automatically the first time a new frontmatter key appears in any note. There is no manual curation step; a stray typo'd key becomes a permanent registry entry the same as an intentional one.
Types in use here map onto three recognizable clusters:
- *Core frontmatter:* `type`, `status`, `created`, `updated`, `notes`, `next`, `track` — the canonical fields from [[Jarvis Writing and Formatting]], registered as `text`, `date`, or `multitext`.
- *Tasks query display flags:* every `TQ_show_*` and `TQ_*` key is a `checkbox`, written by the Tasks plugin's query-block editor, not by hand.
- *Learning and career tracking:* `mastery`, `mastery_score`, `drill_interval` (`number`); `last_drilled`, `next_drill`, `date_posted`, `date_applied`, `date_result` (`date`); `started_at`, `ended_at`, `exported_at` (`datetime`) — these back the spaced-repetition and internship-tracking dashboards documented in [[Spaced Repetition and Learning Loops]] and the career notes.
A type here only controls how the Properties side panel renders and edits that field — an icon, a date picker, a checkbox toggle. It does not constrain what Dataview or Tasks can query; a field typed `text` still works in a Dataview `WHERE` clause. Changing a type in the UI is safe and reversible; it never rewrites existing note content.
## Settings Confirmed At Obsidian's Factory Default
`app.json` only stores a key when its value differs from the built-in default, so absence is itself a confirmed value, not an undocumented gap. Three sync-relevant settings never appear in this vault's `app.json`, meaning they sit at Obsidian's shipped defaults:
- **New file location** — default (*"Vault folder"*, new notes with no explicit path land at the vault root). This vault never redirects new-note creation through this setting; folder placement instead comes from Templater's `folder_templates` and QuickAdd choices, not from a global default-location override.
- **Default location for new attachments** — default (*"Same folder as current file"*). Never redirected to a single `Attachments/` folder.
- **New link format** — default (*"Shortest path when possible"*), which is why `[[Note Name]]` resolves vault-wide instead of needing a full path, and is part of why [[Jarvis Writing and Formatting]] can rely on plain wikilinks.
This matters for Build 6: the Acer's freshly created basic vault shell will also start at these same Obsidian factory defaults, so none of these three settings can create a values-based conflict when `app.json` syncs over. The only risk is structural — if the Acer's vault has already had notes created before the real `app.json` arrives, its own `app.json` could contain *different* explicit values (not just defaults) that the incoming sync would then overwrite. Build 6 should confirm the Acer's `app.json` is still empty/default before pairing, not assume it.
## Suggestions
Verdicts, not just ideas — worth doing or not, for Anant specifically, not generic Obsidian advice:
- **Leave `promptDelete` on. Genuinely worth keeping, not a maybe.** Anant runs Claude Code, Cursor, and an MCP filesystem server against this vault, all three capable of issuing a delete. This one setting is the only point where a human sees a confirmation dialog before a note actually disappears from the UI's normal flow. The cost is one extra click per intentional delete; the benefit is catching an agent's mistake before it's silent. Keep it on.
- **The `showUnsupportedFiles: true` suggestion from before Build 6 is now moot — Build 6 already ran and used a different, better method.** [[Cross-Laptop Sync - Build 6 Findings]] confirms the Acer-vault audit was done with direct `Get-ChildItem`/`ls` commands against the real filesystem, not by toggling Obsidian's UI visibility setting. Flipping this setting has no proven performance or indexing cost (Obsidian's own docs don't document one either way, and the setting only governs File Explorer/Quick Switcher/linking visibility, not what gets scanned), so there's no harm in it, but there's also no live use case for it right now. Not worth doing proactively — revisit only if a future audit genuinely needs to *see* a stray non-Markdown file inside Obsidian's own UI rather than a terminal listing.
- **`userIgnoreFilters` is not a sync-safety mechanism and shouldn't be treated as one — this is a real, standing warning, not a one-time task.** All three of its current entries (`50_Archive/`, `excalidraw-mcp/node_modules/`, `60_Claude/00_Inbox/copilot/`) already have their own `.gitignore`/`.stignore` coverage from the cross-laptop sync builds. If a future path only gets added here and not to `.stignore`, it will still sync via Syncthing while staying invisible in Obsidian's own UI — a worse outcome than not excluding it at all, since it hides the problem rather than preventing it. Worth Anant remembering this the next time he wants to hide something in Obsidian's file list — that instinct alone doesn't stop it from leaving the machine.
## Sources
- [Obsidian Help — Properties](https://obsidian.md/help/Editing+and+formatting/Properties) — property type registry behavior, fetched 2026-09-19
- [Obsidian Help — Settings](https://obsidian.md/help/settings) and community documentation of Files & Links labels ("Automatically update internal links," "Confirm file deletion," "Detect all file extensions," "New file location," "Default location for new attachments," "New link format") — fetched 2026-09-19
- [obsidianmd/obsidian-help#956](https://github.com/obsidianmd/obsidian-help/issues/956) — confirms "Excluded files" (`userIgnoreFilters`) is real but undocumented by Obsidian itself
- Direct read of `.obsidian/app.json` and `.obsidian/types.json` — this session, 2026-09-19
