---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - standards
  - logs
system_kind: standard
family: log
tier: 2
maps_to:
  - "[[30_Order/Templates/AI Toolkit/Write Logs|Write Logs]]"
  - "[[30_Order/Templates/AI Toolkit/Tool Logs|Tool Logs]]"
used_by:
  - "[[Maintaining Logs]]"
  - "[[Tools Tracking]]"
gold_standard: "[[20_Progress/Projects/AI Use/Claude Kit/Log]]"
notes:
  - "[[Log Standard]]"
  - "[[Memory Management]]"
---
# Logs
==Pick the log's shape from the stream it records, then write its feeder, order, and scope into its frontmatter.==
This Standard fixes the shape and entry format of a log once it has earned a file. Whether a log should exist at all is [[Log Standard]]; what a session owes the logs it writes to is [[Memory Management]]. Logs hold dated events and are append-only, so only their header is measured, not their entries.
## Spec
```json
{
  "family": "log",
  "tier": 2,
  "match": {"type": "system", "kind": "log", "path": "^(60_Claude|20_Progress)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "system_kind", "log_shape", "feeder", "order", "scope"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": [],
  "legacy_match": [
    {"path": "^60_Claude/07_AI_Information/Session Logs/log\\.md$"},
    {"path": "^20_Progress/Projects/AI Use/Claude Kit/Log\\.md$"},
    {"path": "^60_Claude/30_Reviews/AI/Toolkit/Tool log\\.md$"},
    {"path": "^60_Claude/30_Reviews/Weekly Synthesis/Logs/Log Review\\.md$"}
  ]
}
```
## Headings
### Header keys
`log_shape` is `narrative`, `row`, or `machine`. `feeder` names the mechanism that writes to the log, or the person or agent who owns it ([[Log Standard]]). `order` is `newest-first` or `newest-last`; both exist today. `scope` is one sentence on what belongs here and what goes elsewhere.
### The three shapes
| Shape | Live example | Entry format | Fed by |
|---|---|---|---|
| narrative | `Session Logs/log.md`, `Claude Kit/Log.md` | `## [YYYY-MM-DD] tag \| title`, then bullets | a person or agent at session end |
| row | `60_Claude/30_Reviews/AI/Toolkit/Tool log.md` | one table row: `Date \| Project \| Skill/Command \| What It Did \| Outcome \| Source` | `/export-ai-session` |
| machine | `Sync-Log.md` in `.claude_windows/` and `.claude_wsl/` | `YYYY-MM-DD HH:MM:SS -0500  path  OK  detail` | the sync scripts |
Use the shape of the stream: decisions and reasoning are narrative, repeated uses of a thing are rows, script output is machine. A machine log is never hand-edited, carries no frontmatter, and is outside the fit measure.
### Narrative entries
Heading `## [YYYY-MM-DD] tag | title` on one line, then bullets for what was created or changed, why it matters, open questions, and the next action if there is one. Entries are append-only. A correction is a new entry that names the one it corrects. An entry states what was verified, not what another source reported.
> [!WARNING]
> Entries written as `2026-10-15 - one long paragraph`. They are invisible to heading search and hard to scan. Old entries stay as written; new ones use the heading form.
### Row entries
One row per skill or command use; a skill used twice in a session earns two rows. `Outcome` is never blank: write `clean`, `partial`, or `failed` with one clause of why. When no single command fits, `Skill/Command` is `ad-hoc` (none used) or `multiple` (name them in `What It Did`). `Source` links the raw session note.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| A log with no frontmatter (`log.md`, `Claude Kit/Log.md`) | Add the header keys above; leave every entry untouched | mechanical |
| Header prose naming feeder and order | Move the facts into `feeder`, `order`, `scope` | mechanical |
| Tool log typed `dashboard`, or `evergreen` for Log Review | `type: system`, `system_kind: log` | mechanical |
| Entry `## date - title` or `## date -- title` | Leave it; write new entries in heading form | none |
| `Sync-Log-Archive-<date>.md` | Machine shape; not measured | none |
## Done Conditions
- The log's frontmatter names its feeder, order, and scope.
- Its entries match the format of its shape and none was hand-edited afterward.
- A silent log was investigated per [[Log Standard]], not left.
## Gold Standard Example
[[20_Progress/Projects/AI Use/Claude Kit/Log]] for narrative: dense dated entries that name what was verified. [[60_Claude/30_Reviews/AI/Toolkit/Tool log]] for row, which defines `ad-hoc` and `multiple` from its first real use.
