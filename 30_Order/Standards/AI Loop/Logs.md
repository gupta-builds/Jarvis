---
type: system
status: sprout
created: 2026-10-15
updated: 2026-11-07
tags:
  - system
  - standards
  - logs
system_kind: standard
family: log
tier: 2
maps_to:
  - "[[AI Write Log Template]]"
  - "[[AI Tool Log Template]]"
used_by:
  - "[[Maintaining Logs]]"
  - "[[Tools Tracking]]"
gold_standard: "[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]"
notes:
  - "[[Memory Management]]"
---
# Logs
==A log is a real, ongoing, dateable stream of events with a named feeder. Before creating one, name who or what keeps it fed, then pick its shape from the stream it records.==
This Standard covers whether a log earns its own file, who feeds it, its header, its entry format, and when it rotates. It was two Standards, one for the policy and one for the shape; they are merged here. It is not what a session owes the logs it writes to ([[Memory Management]]) and not what a periodic review of a log contains ([[Review Standard]]). Logs hold dated events and are append-only, so only their header is measured, not their entries.
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/07_AI_Information/Session Logs/`, `60_Claude/30_Reviews/`, or beside the project it logs under `20_Progress/`. |
| File name | The stream it records (`Log`, `Intervention Ledger`, `Tool log`). Unique in the vault. |
| Kind | `type: system` with `system_kind: log`. A machine log carries no frontmatter and is outside the fit measure. |
| Status | `sprout` from the first save, `tree` once the feeder has run without a gap for a month, `archived` when retired. |
## Headings
The headings are not enforced. Only the header is measured.
### Header keys
- **Write:** `log_shape` (`narrative`, `row`, or `machine`), `feeder` (the mechanism that writes to the log without anyone remembering, or the person or agent who owns it), `order` (`newest-first` or `newest-last`), `scope` (one sentence on what belongs here and what goes elsewhere).
- **Length:** one line per key.
- **Never:** "manual, session discipline" without saying whose. A log with no mechanism and no named owner goes silent; `Write Log.md` sat silent for 21 days before it was retired.
- **Right:** `feeder: The person, at step 8 of each weekly review (the ten-minute setup review), by hand.`
- **Wrong:** `status: active`
### Narrative entries
- **Write:** heading `## [YYYY-MM-DD] tag | title` on one line, then bullets for what was created or changed, why it matters, open questions, and the next action if there is one. An entry states what was verified, not what another source reported.
- **Length:** a heading and three to six bullets.
- **Never:** `2026-10-15 - one long paragraph`. It is invisible to heading search and hard to scan. A correction is a new entry that names the one it corrects.
- **Right:** `## [2026-11-05] system | System layer repair pass`
- **Wrong:** None seen.
### Row entries
- **Write:** one row per use: `Date | Project | Skill/Command | What It Did | Outcome | Source`. `Outcome` is never blank: `clean`, `partial`, or `failed` with one clause of why. When no single command fits, `Skill/Command` is `ad-hoc` (none used) or `multiple` (name them in `What It Did`).
- **Length:** one row per use; a skill used twice in a session earns two rows.
- **Never:** a blank Outcome.
- **Right:** `| Date | Project | Skill/Command | What It Did | Outcome | Source |`
- **Wrong:** None seen.
### Machine entries
- **Write:** script output, `YYYY-MM-DD HH:MM:SS -0500  path  OK  detail`, written only by the sync scripts.
- **Length:** one line per run.
- **Never:** a hand edit.
- **Right:** `2026-09-20 06:04:34 -0500  hooks/  OK  hooks -> hooks/.claude_windows`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| A log earns a file only when it tracks a stream distinct enough from every existing log's actual scope. Ask whether a new entry could be mistaken for one that belongs in an existing log; if yes, extend the existing one | `Write Log.md` duplicated the heading format and subject of `Claude Kit/Log.md` and was never wired to anything | Reader |
| The header names the feeder, order, and scope | Without a feeder a log silently stops | Lint, check 1 |
| Entries are append-only; a correction is a new entry | A rewritten entry hides what was believed then | Reader |
| A log silent for longer than its stated cadence is investigated for root cause (a broken mechanism or a lapsed habit) and then fixed or retired | An ambiguous silent log misleads the next reader | Reader |
| A narrative log over about 100 KB rotates: entries older than the current month move unchanged to `Archive/YYYY-MM.md` beside the log, with a link in its first lines. No existing log is rewritten to comply | A log too long to open is not read | Reader |
| Use the shape of the stream: decisions are narrative, repeated uses are rows, script output is machine | An entry in the wrong shape cannot be scanned | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| A log with no frontmatter (`Claude Kit/Log.md`) | Add the header keys above; leave every entry untouched | Mechanical |
| Header prose naming feeder and order | Move the facts into `feeder`, `order`, `scope` | Mechanical |
| Log Review typed `evergreen`, `status: active`, no log keys | `type: system`, `system_kind: log`, the header keys | Mechanical |
| Tool log typed `dashboard` | `type: system`, `system_kind: log` | Mechanical |
| Entry `## date - title` or `## date -- title` | Leave it; write new entries in heading form | None |
| `Sync-Log-Archive-<date>.md` | Machine shape; not measured | None |
| `Session Logs/log.md` at 331 KB, with dead links in 29 entries | Rotate when the owner chooses; no rewrite | Judgment |
## Done Conditions
- The log's frontmatter names its feeder, order, and scope.
- Its entries match the format of its shape and none was hand-edited afterward.
- Before a new log is created, the check against every existing log's actual scope is recorded in one sentence somewhere findable.
- A log past 100 KB has a rotation plan, or has rotated.
- The note passes [[Vault Lint]] for the `log` family.
## Gold Standard Example
[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]] passes lint as a row log: a named human feeder, a stated order, and a one-sentence scope that says what goes elsewhere.
Measured 2026-11-07 with `--family log`: 4 notes, 1 passes.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Intervention Ledger (gold) | `20_Progress/Projects/AI Use/Conversations/` | Header complete | Nothing found |
| Log | `20_Progress/Projects/AI Use/Claude Kit/` | Dense dated entries naming what was verified | No frontmatter |
| log | `60_Claude/07_AI_Information/Session Logs/` | The narrative header; entries in heading form | 29 dead links, 2 `---`, 331 KB |
| Log Review | `60_Claude/30_Reviews/Weekly Synthesis/Logs/` | A log of log maintenance | Typed `evergreen`; no log keys |
