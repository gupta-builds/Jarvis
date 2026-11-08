---
type: system
status: sprout
created: 2026-08-11
updated: 2026-11-07
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
gold_standard: "[[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]]"
notes:
  - "[[Review System]]"
  - "[[Logs]]"
  - "[[60_Claude/30_Reviews/AI/Toolkit/Tool log|Tool log]]"
  - "[[20_Progress/Projects/AI Use/Claude Kit/Log|Claude Kit Log]]"
  - "[[HUMAN_WRITING]]"
---
# Review Standard
==A review cites the actual log rows it read, from the Tool log, the Sync-Logs, and the Claude Kit Log. It never summarizes from memory or impression.==
This is the Standard for the AI tools reviews in `60_Claude/30_Reviews/AI/`: how Claude Code, Cowork, and the sync layer are used, and whether anything captured is drifting. It is not the Capability Engine review ([[Capability Review Standard]]) and it is not a one-off audit ([[Audit Report Standard]]). No cron job writes these: a person, or an agent explicitly asked, works the template against the real logs.
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/30_Reviews/AI/Scheduled/Weekly/` and `Monthly/`, or a subfolder of `60_Claude/30_Reviews/AI/` for a layer review (`Conversations/`). |
| File name | `AI Tools Weekly Review` or `Monthly Review`, a separator, then the ISO week (`2026-W43`) or month. |
| Kind | `type: review` with `review_kind: weekly` or `monthly`. |
| Status | `seed` while sections hold placeholders, `sprout` once every section is written, `complete` when filed. |
## Headings
### Frontmatter
- **Write:** `type: review`, `review_kind`, `status`, dates, `tags`, `notes` linking the logs and protocols the review used, and `next`.
- **Length:** one line per key.
- **Never:** `type: evergreen` on a review. It is then missed by every review query.
- **Right:** `review_kind: monthly`
- **Wrong:** None seen.
### Period Covered
- **Write:** the exact date range: a calendar week for Weekly, a calendar month for Monthly. A partial or rolling window is stated as such.
- **Length:** one to three sentences.
- **Never:** a vague "last week".
- **Right:** `2026-10-19 (Monday) through 2026-10-25 (Sunday), ISO week 2026-W43, a complete calendar week.`
- **Wrong:** None seen.
### Sources Reviewed
- **Write:** every log opened this pass, as `- [x]` boxes, and the ones not opened as plain text with the reason. The Tool log, `Sync-Log.md` in `.claude_windows/` and `.claude_wsl/` under `20_Progress/AI/Claude Code/`, the Claude Kit Log, and any raw `AI Conversations/` note the Tool log flags. Monthly adds the month's Weekly reviews and the Tool Map.
- **Length:** one line per source.
- **Never:** a log listed that was not opened. "Sync-Log not reviewed this week" is honest; a claim about sync health with no citation is not.
- **Right:** `- [x] The 15 session notes in the six folders above`
- **Wrong:** None seen.
### What Ran This Period
- **Write:** skills, agents, and commands used, how often, on what, taken from Tool log rows and not re-derived from raw sessions. Monthly names this `What Ran This Month` and adds a trend against last month.
- **Length:** a table or short list, as long as the Tool log has rows. An empty Tool log for the period is a finding.
- **Never:** a placeholder left in the section.
- **Right:** `invoked no registered slash command`
- **Wrong:** `Pending (protocol step 7).`
### Sync & Capture Health
- **Write:** real counts: sync runs OK, failed, and skipped from the Sync-Logs, and whether capture produced a note for every real session (spot-check against `~/.claude/projects/` session counts).
- **Length:** three to six sentences with numbers.
- **Never:** "Sync looked fine" with no number.
- **Right:** `**1740 OK / 0 failed / 0 skipped**`
- **Wrong:** `Pending (protocol step 7).`
### Tool Map Health Check
- **Write:** monthly only. Anything stuck at `sandbox` or `tested-tools` for more than a full month, named here and not carried forward silently. If the Tool Map was not opened, say so.
- **Length:** one to three sentences.
- **Never:** a health claim about a map that was not opened.
- **Right:** `Not part of this layer. The Tool Map was not opened.`
- **Wrong:** None seen.
### Findings
- **Write:** named problems, each citing the exact file or log row: a stale note, a tool unused since promotion, a sync gap, a session never captured. "Nothing to report" is a valid finding.
- **Length:** one bullet per finding.
- **Never:** a finding with no file or row behind it.
- **Right:** `An empty log for nine days straight is itself the finding`
- **Wrong:** `Pending. The owner's first-failure notes and codes go here as written`
### Decided Fixes
- **Write:** only items where the reviewer has 100% clarity. A fix is applied by hand or flagged for the next build session, never by an automated process this review triggers.
- **Length:** one line per fix, or "None this pass".
- **Never:** a fix at less than full clarity.
- **Right:** `None this pass. Nothing above reached the 100% clarity the Standard requires`
- **Wrong:** None seen.
### Open Questions
- **Write:** anything not 100% clear, as `- [ ]` tasks. They carry forward.
- **Length:** one to three sentences each.
- **Never:** a deleted unresolved question, or a question written as a plain bullet.
- **Right:** `- [ ] Where do the 12 missing turns come from?`
- **Wrong:** `- Should [[20_Progress/AI/Claude Code/Write Log|Write Log.md]] keep being maintained as a separate file from`
### Next Period's Watch List
- **Write:** what to check next time: a tool recently promoted, a sync leg recently changed, a capture gap recently fixed. Monthly names this `Next Month's Watch List`.
- **Length:** two to four bullets.
- **Never:** a bare "Pending".
- **Right:** `- Whether Write Log.md gets a next entry, or stays silent for a second consecutive review period`
- **Wrong:** `Pending.`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The eight (weekly) or nine (monthly) headings appear in order and none is empty or a placeholder | A review is read by section | Lint, check 2 (empty only; a "Pending" line passes lint) |
| Every claim in Sync & Capture Health traces to a log row, cited by file and date | A review that summarizes from impression repeats the drift it should catch | Reader |
| Decided Fixes holds only items at 100% clarity | A review that finds a bug is not authorization to patch it | Reader |
| Open Questions carry forward as tasks | A deleted question hides a gap | Reader |
| `review_kind` is `weekly` or `monthly` | Reviews are found by kind | Lint, check 1 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` | `type: review`, `review_kind: weekly` or `monthly` | Mechanical |
| Citation of `_All-Projects-Sync-Log` (the file no longer exists) | Cite the two `Sync-Log.md` files by path in code | Mechanical |
| Citation of `Write Log` | Cite the Claude Kit Log | Mechanical |
| Sources as `- [ ]` boxes in a template | `- [x]` for opened, plain text for not opened | None |
| Open Questions as plain bullets (W34) | `- [ ]` tasks | Judgment |
## Done Conditions
- Every claim in Sync & Capture Health traces to a log row, cited by file and date.
- Decided Fixes holds only items with 100% clarity.
- No sentence could be pasted into a generic status report unchanged ([[HUMAN_WRITING]]).
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]] passes lint as a monthly review: all nine headings, a Tool Map check that says it did not open the map, and numbered findings that cite their sources.
Measured 2026-11-07: weekly 2 notes, 0 pass; monthly 1 note, 1 passes.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Conversation Loop Review (gold) | `60_Claude/30_Reviews/AI/Conversations/` | All nine headings, honest "not opened" | Nothing found |
| AI Tools Weekly Review - 2026-W43 | `60_Claude/30_Reviews/AI/Scheduled/Weekly/` | Counted frame, sample sheet | Five sections hold "Pending"; 3 extra blank lines |
