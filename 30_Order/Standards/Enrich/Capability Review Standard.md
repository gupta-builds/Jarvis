---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
  - review
system_kind: standard
family: capability-review
tier: 1
maps_to:
  - "[[30_Order/Templates/Capability/Weekly Synthesis Template|Weekly Synthesis Template]]"
used_by: []
gold_standard: "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W40]]"
notes:
  - "[[Review System]]"
  - "[[Review Standard]]"
  - "[[Weekly Synthesis Index]]"
  - "[[Log Standard]]"
---
# Capability Review Standard
==The Weekly Synthesis answers one question: what actually got built and learned this week, checked against the files, and what comes next.==
This is the standard for the weekly vault review written by `/weekly-review` into `60_Claude/30_Reviews/Weekly Synthesis/`. The skill is the feeder; its Step 6 template already fixes most headings. It is not the AI tools review ([[Review Standard]]). One note per ISO week, titled `Weekly Synthesis` plus the week (for example 2026-W40), as the existing notes are.
## Spec
```json
{
  "family": "capability-review",
  "tier": 1,
  "match": {"type": "review", "kind": "capability", "path": "^60_Claude/30_Reviews/Weekly Synthesis/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "review_kind", "week", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["What Was Built", "Three-Month Plan Status", "Enrichment and Drills", "Vault Health", "Suggested Links", "Cleanup Candidates", "Next Week Priorities", "Open Questions"],
  "optional_headings": ["Fall Execution Audit", "Promotion Candidates"],
  "legacy_match": [
    {"type": "review", "path": "^60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis . 2026-W\\d+\\.md$"}
  ]
}
```
## Headings
### What Was Built
Dated bullets of what changed, each naming the files. Pull from git, the session log, and recently modified notes, and open the file before claiming it exists.
### Three-Month Plan Status
Where the master plan stands against its dated milestones, with the number or file that proves each claim.
### Fall Execution Audit
Optional, and term-specific: the audit of the current term's floor commitments (internship floor, interview prep, classes, projects). Rename or drop it when the term plan changes.
### Enrichment and Drills
Concepts enriched, drills overdue by `next_drill`, and the state of the enrichment queue. State plainly when the loop has not run.
### Vault Health
Structural checks with counts: broken links, missing `next:`, stale boards, sync health.
### Suggested Links
Two or three links worth adding, each with the reason.
### Cleanup Candidates
Notes or folders worth tidying. Naming a candidate is not authorization to clean it ([[Review System]]).
### Promotion Candidates
Optional. Distilled notes stable and reused enough to propose for `10_Areas/` or `40_Resources/`.
### Next Week Priorities
A short ranked list, ending with the one thing that cannot slip.
### Open Questions
`- [ ]` tasks. They carry forward; two sightings in a row become an immediate action.
> [!WARNING]
> Two concurrent runs. `/weekly-review` fired from two machines for 2026-W41 and produced two non-overlapping drafts that had to be merged by hand. Check whether the week's note exists before writing, and extend it instead of creating a second.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| W17 headings: Concepts Enriched This Week, Overdue Drills, Unresolved Questions, Outputs Created, Synthesis Notes Created, Synthesis Candidates for Next Week | Fold into `Enrichment and Drills` and `Open Questions`; add the other required headings | judgment |
| W22 note with no `Fall Execution Audit` or `Promotion Candidates` | Leave the optional headings out | none |
| `type: evergreen` on a Weekly Synthesis | `type: review`, `review_kind: capability` | mechanical |
| No `updated` | Add it | mechanical |
| `Weekly Synthesis Index.md` and `Logs/Log Review.md` in the same folder | Not reviews: an index and a log. Give each its own family | judgment |
## Done Conditions
- One note exists for the ISO week, and every claim in it names a file, count, or log row.
- The required headings are present and none is empty.
- Open Questions carried from last week were resolved or kept, not dropped.
## Gold Standard Example
[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W40]]: all eight required headings plus both optional ones, and a Fall Execution Audit that names what slipped.
