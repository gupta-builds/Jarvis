---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
  - review
system_kind: standard
family: capability-review
tier: 1
maps_to:
  - "[[Vault Weekly Synthesis Template]]"
used_by: []
gold_standard: "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W44|Weekly Synthesis 2026-W44]]"
notes:
  - "[[Review System]]"
  - "[[Review Standard]]"
  - "[[Weekly Synthesis Index]]"
  - "[[Logs]]"
---
# Capability Review Standard
==The Weekly Synthesis answers one question: what actually got built and learned this week, checked against the files, and what comes next.==
This is the Standard for the weekly vault review written by `/weekly-review` into `60_Claude/30_Reviews/Weekly Synthesis/`. It is not the AI tools review ([[Review Standard]]), not the weekly note that holds the owner's goals and fixes ([[Periodic Review Note Standard]]), and not an audit of one system ([[Audit Report Standard]]). The skill is the feeder; its template already fixes most headings.
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/30_Reviews/Weekly Synthesis/` |
| File name | `Weekly Synthesis` plus the ISO week (`2026-W44`). One note per week. |
| Kind | `type: review` with `review_kind: capability`, and `week: 2026-W44`. |
| Status | `sprout` while the run is open, `complete` once filed. |
## Headings
### Frontmatter
- **Write:** `type: review`, `review_kind: capability`, `status`, `created`, `updated`, `week`, `tags`, and `notes` linking the index, the active plan, and the weekly note.
- **Length:** one line per key.
- **Never:** a missing `review_kind` or `updated`. All seven existing notes lack both, so a query for reviews by kind misses them.
- **Right:** `week: 2026-W44`
- **Wrong:** None seen.
### What Was Built
- **Write:** bullets of what changed, each naming the files. Pull from git, the session log, and recently modified notes, and open the file before claiming it exists.
- **Length:** one bullet per area of work, plus one line for what was not built.
- **Never:** a claim taken from a note's own account of itself.
- **Right:** `Checked against file contents and commits, not against what the notes claim.`
- **Wrong:** None seen.
### Three-Month Plan Status
- **Write:** where the active plan stands against its dated milestones, with the number or file that proves each claim.
- **Length:** a table of the week's rows and two or three sentences.
- **Never:** a score on a paused plan.
- **Right:** `The plan is behind on every number it checks (applications, LeetCode, daily floor) and on track only for the mentor row.`
- **Wrong:** None seen.
### Fall Execution Audit
- **Write:** optional and term-specific: the audit of the current term's floor commitments (internship floor, interview prep, classes, projects). Rename or drop it when the term plan changes.
- **Length:** one bullet per commitment.
- **Never:** a status with no count or date.
- **Right:** `38 days with no net movement.`
- **Wrong:** None seen.
### Enrichment and Drills
- **Write:** concepts enriched, drills overdue by `next_drill`, and the state of the enrichment queue. State plainly when the loop has not run.
- **Length:** one short paragraph.
- **Never:** a fill-in when nothing ran.
- **Right:** `The same five notes carry the only dated`
- **Wrong:** None seen.
### Vault Health
- **Write:** structural checks with counts: broken links, missing `next:`, stale boards, sync health. Say what could not be checked and why.
- **Length:** one bullet per check; the largest section.
- **Never:** a check carried forward from last week as if re-run.
- **Right:** `I cannot read the Dell's Task Scheduler state from here, so "Jarvis-GitAutoSync disabled on the Dell" is carried from the 10-22 record, not re-verified.`
- **Wrong:** None seen.
### Suggested Links
- **Write:** two or three links worth adding, each with the reason.
- **Length:** two or three items.
- **Never:** a link with no reason.
- **Right:** `The two trackers for one job is still unresolved.`
- **Wrong:** None seen.
### Cleanup Candidates
- **Write:** notes or folders worth tidying. Naming a candidate is not authorization to clean it ([[Review System]]).
- **Length:** one item each, with how long it has been flagged.
- **Never:** a deletion done by the review.
- **Right:** `flagged every review since 2026-09-20, now six weeks.`
- **Wrong:** None seen.
### Promotion Candidates
- **Write:** optional. Distilled notes stable and reused enough to propose for `10_Areas/` or `40_Resources/`.
- **Length:** one line when there are none.
- **Never:** a candidate padded to fill the heading.
- **Right:** `None this week.`
- **Wrong:** None seen.
### Next Week Priorities
- **Write:** a short ranked list, ending with the one thing that cannot slip, and a line of what else is due.
- **Length:** three priorities plus one "Also due" line.
- **Never:** a priority with no reason it matters now.
- **Right:** `**Also due:** CSCI 4521 HW3 (11/3), MGMT 3015 pitch slides (11/4), the Nov 6 announcement`
- **Wrong:** None seen.
### Open Questions
- **Write:** `- [ ]` tasks. They carry forward; two sightings in a row become an immediate action.
- **Length:** one to three.
- **Never:** a numbered prose question. It cannot be ticked or carried.
- **Right:** None seen.
- **Wrong:** `1. **What specifically stops the cover letter?**`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The eight required headings appear in order and none is empty | The skill and the next review read sections by name | Lint, check 2 |
| One note per ISO week. Check whether the week's note exists before writing, and extend it | `/weekly-review` fired from two machines for 2026-W41 and produced two drafts merged by hand | Reader |
| Every claim names a file, count, or log row | An unchecked claim repeats a stale one | Reader |
| `review_kind: capability` and `updated` are set | A review is found by its kind | Lint, check 1 |
| No `---` in the body and no extra blank lines | Hygiene (check 5) fails every note today | Lint, check 5 |
| Carried Open Questions are resolved or kept, never dropped | Two sightings become an action | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| W17 headings: Concepts Enriched This Week, Overdue Drills, Unresolved Questions, Outputs Created, Synthesis Notes Created, Synthesis Candidates for Next Week | Fold into `Enrichment and Drills` and `Open Questions`; add the other required headings | Judgment |
| W22 note with no `Fall Execution Audit` or `Promotion Candidates` | Leave the optional headings out | None |
| No `review_kind` and no `updated` (all seven) | Add both | Mechanical |
| A `---` rule before the closing "Generated by" line | Remove it | Mechanical |
| Open Questions as a numbered prose list | `- [ ]` tasks | Judgment |
| `Weekly Synthesis Index.md` and `Logs/Log Review.md` in the same folder | Not reviews: an index and a log. Give each its own family | Judgment |
## Done Conditions
- One note exists for the ISO week, and every claim in it names a file, count, or log row.
- The required headings are present and none is empty.
- Open Questions carried from last week were resolved or kept, not dropped.
- The note passes [[Vault Lint]] for the `capability-review` family.
## Gold Standard Example
[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W44|Weekly Synthesis 2026-W44]]: all eight required headings plus Fall Execution Audit and Promotion Candidates, claims checked against files with counts, and honest "not verified" lines. It does not pass lint: no `review_kind` or `updated`, a `---` in the body, and extra blank lines.
Measured 2026-11-07 with `--family capability-review`: 7 notes, 0 pass. All seven fail on the missing `review_kind` and `updated`, the `---`, and blank lines. The skill's template, not each note, is what to fix.
