---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
  - logs
notes:
  - "[[Log Standard]]"
  - "[[30_Order/Templates/AI Toolkit/Tool Logs|Tool Logs template]]"
  - "[[Maintaining Logs]]"
  - "[[Memory Management]]"
---
# Logs
==Pick the log's shape from the stream it records, then write its feeder, owner, and order into its header.==
This is the shape standard for the AI-toolkit logs in this vault. It does not decide whether a log should exist, or how to avoid a silent one: that is [[Log Standard]], read it first. This Standard covers the three shapes a log takes once it earns a file, and the per-entry format of each.
## Maps To
- Template: [[30_Order/Templates/AI Toolkit/Tool Logs|Tool Logs]] (row logs only). Narrative and machine logs have no template yet.
## Used By Workflow
- [[Maintaining Logs]]
## The three shapes
| Shape | Live example | Entry format | Fed by |
|---|---|---|---|
| Narrative | `Session Logs/log.md`, `20_Progress/Projects/AI Use/Claude Kit/Log.md` | `## [YYYY-MM-DD] tag \| title`, then bullets | a human or agent, at session end ([[Memory Management]]) |
| Row | `60_Claude/30_Reviews/AI/Toolkit/Tool log.md` | one table row: `Date \| Project \| Skill/Command \| What It Did \| Outcome \| Source` | the `/export-ai-session` skill |
| Machine | `Sync-Log.md` in `20_Progress/AI/Claude Code/.claude_windows/` and `.claude_wsl/` | `YYYY-MM-DD HH:MM:SS -0500  path  OK  detail` | the sync scripts |
Use the shape of the stream, not the shape you prefer. Decisions and reasoning are narrative. Repeated uses of a thing are rows. Script output is machine.
## Header every log carries
- **Feeder:** the mechanism that writes to it, or the named owner if none exists ([[Log Standard]]).
- **Order:** newest first or newest last, stated. Both exist today: `Claude Kit/Log.md` is newest first, `Session Logs/log.md` newest last.
- **Scope:** one sentence on what belongs here and what goes elsewhere.
## Per-shape rules
### Narrative
Entries are append-only. A correction is a new entry that names the one it corrects. State what was verified, not what was reported.
### Row
One row per skill or command use in a session. A skill used twice in one session earns two rows. `Outcome` is never blank: write `clean`, `partial`, or `failed` with one clause of why. When no single command fits, `Skill/Command` is `ad-hoc` (none used) or `multiple` (name them all in `What It Did`). `Source` links the raw session note.
### Machine
Never hand-edited. Old lines move to `Sync-Log-Archive-<date>.md` by `rotate-sync-logs.ps1`; nothing is deleted.
> [!WARNING]
> Hand-editing a row or machine log into a different shape. The Tool log exists because its rows stay uniform, and a review that cites a hand-edited row is citing nothing.
## Known gaps
- `Review Standard`, `Log Standard`, and the AI review templates cite `_All-Projects-Sync-Log`, which no longer exists. Point them at the two `Sync-Log.md` files.
- `Tool log.md` says it is filed under `.../AI/Tools/` but lives at `.../AI/Toolkit/`. Correct the body text.
- `Write Log.md` is retired but still sits in `20_Progress/AI/Claude Code/`. It is the negative example in [[Log Standard]].
- `/export-ai-session` asks for confirmation before writing, so it cannot run on a schedule. Row logs therefore depend on a named human running it.
## Done Conditions
- The log's header names its feeder or owner, its order, and its scope.
- Its entries match the format of its shape.
- No entry was hand-edited after it was written.
- A silent log was investigated per [[Log Standard]], not left.
## Gold Standard Example
`20_Progress/Projects/AI Use/Claude Kit/Log.md` for narrative, and `60_Claude/30_Reviews/AI/Toolkit/Tool log.md` for row, which defines the `ad-hoc` and `multiple` rule from its first real use.
