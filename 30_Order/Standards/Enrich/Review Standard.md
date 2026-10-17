---
type: system
status: sprout
created: 2026-08-11
updated: 2026-10-16
tags:
  - system
  - standards
  - review
system_kind: standard
family: ai-review
tier: 1
maps_to:
  - "[[30_Order/Templates/AI Toolkit/AI Weekly Review Template|AI Weekly Review Template]]"
  - "[[30_Order/Templates/AI Toolkit/AI Monthly Review Template|AI Monthly Review Template]]"
used_by: []
gold_standard: "[[60_Claude/30_Reviews/AI/Scheduled/Weekly/AI Tools Weekly Review — 2026-W34]]"
notes:
  - "[[Review System]]"
  - "[[Logs]]"
  - "[[60_Claude/30_Reviews/AI/Toolkit/Tool log|Tool log]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Log|Claude Kit Log]]"
  - "[[HUMAN_WRITING]]"
---
# Review Standard
==A review cites the actual log rows it read, from the Tool log, the Sync-Logs, and the Claude Kit Log. It never summarizes from memory or impression.==
This is the standard for the AI tools reviews in `60_Claude/30_Reviews/AI/Scheduled/{Weekly,Monthly}/`: how Claude Code, Cowork, and the sync layer are used, and whether anything captured is drifting. It is not the Capability Engine review ([[Capability Review Standard]]); do not reuse one template for the other's job. No cron job writes these. A person, or an agent explicitly asked, opens the template and works it against the real logs in the same session or shortly after the period.
## Spec
```json
{
  "family": "ai-review-weekly",
  "tier": 1,
  "match": {"type": "review", "kind": "weekly", "path": "^60_Claude/30_Reviews/AI/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "review_kind", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Period Covered", "Sources Reviewed", "What Ran This Period", "Sync & Capture Health", "Findings", "Decided Fixes", "Open Questions", "Next Period's Watch List"],
  "optional_headings": [],
  "legacy_match": [
    {"type": "evergreen", "path": "^60_Claude/30_Reviews/AI/Scheduled/Weekly/"}
  ]
}
```
```json
{
  "family": "ai-review-monthly",
  "tier": 1,
  "match": {"type": "review", "kind": "monthly", "path": "^60_Claude/30_Reviews/AI/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "review_kind", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Period Covered", "Sources Reviewed", "What Ran This Month", "Sync & Capture Health", "Tool Map Health Check", "Findings", "Decided Fixes", "Open Questions", "Next Month's Watch List"],
  "optional_headings": [],
  "legacy_match": [
    {"type": "evergreen", "path": "^60_Claude/30_Reviews/AI/Scheduled/Monthly/"}
  ]
}
```
## Headings
### Period Covered
The exact date range: a calendar week for Weekly, a calendar month for Monthly. A partial or rolling window is stated as such.
### Sources Reviewed
Name every log opened this pass: the Tool log, `Sync-Log.md` in `20_Progress/AI/Claude Code/.claude_windows/` and in `.claude_wsl/`, the Claude Kit Log (which absorbed `Write Log.md` on 2026-08-20), and any raw `AI Conversations/` notes the Tool log flags. Monthly adds the month's Weekly reviews and the Tool Map.
> [!WARNING]
> Listing a log that was not opened. "Sync-Log not reviewed this week" is honest; a claim about sync health with no citation is not.
### What Ran This Period
Skills, agents, and commands used, how often, on what, taken from Tool log rows and not re-derived from raw sessions. Monthly names this section `What Ran This Month` and adds a trend against last month. A table or short list.
*Density:* as long as the Tool log has rows. An empty Tool log for the period is a finding.
### Sync & Capture Health
Real counts: sync runs OK, failed, and skipped from the Sync-Logs, and whether capture produced a note for every real session (spot-check against `~/.claude/projects/` session counts).
> [!WARNING]
> "Sync looked fine" with no number.
### Tool Map Health Check
Monthly only. Anything stuck at `sandbox` or `tested-tools` for more than a full month is named here, not carried forward silently.
### Findings
Named problems, each citing the exact file or log row: a stale note, a tool unused since promotion, a sync gap, a session never captured. "Nothing to report" is a valid finding.
### Decided Fixes
Only items where the reviewer has 100% clarity. A fix is applied by hand or flagged for the next build session, never by an automated process this review triggers.
### Open Questions
Anything not 100% clear, as `- [ ]` tasks. They carry forward; deleting one unresolved is not allowed.
### Next Period's Watch List
What to check next time: a tool recently promoted, a sync leg recently changed, a capture gap recently fixed. Monthly names this `Next Month's Watch List`.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` | `type: review`, `review_kind: weekly` or `monthly` | mechanical |
| Citation of `_All-Projects-Sync-Log` (the file no longer exists) | Cite the two `Sync-Log.md` files by path in code | mechanical |
| Citation of `Write Log` | Cite the Claude Kit Log | mechanical |
| Sources as `- [ ]` boxes in a template | `- [x]` for opened, plain text for not opened | none |
## Done Conditions
- Every claim in Sync & Capture Health traces to a log row, cited by file and date.
- Decided Fixes holds only items with 100% clarity.
- No sentence could be pasted into a generic status report unchanged ([[HUMAN_WRITING]]).
## Gold Standard Example
[[60_Claude/30_Reviews/AI/Scheduled/Weekly/AI Tools Weekly Review — 2026-W34]]: the first real weekly review, notable for what it surfaced. The Tool log had been empty for nine days, and the one session reviewed used no nameable skill. It still cites the retired `_All-Projects-Sync-Log`, which the Legacy Shapes table rewrites.
