---
type: system
status: sprout
created: 2026-07-27
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: plan
tier: 1
maps_to:
  - "[[Plan Template]]"
used_by:
  - "[[Plan Review Cadence]]"
gold_standard: "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]"
notes:
  - "[[Plans-to-Create]]"
  - "[[HUMAN_WRITING]]"
---
# Daily Workflow Standard
==A plan is a note a skill rereads on a schedule; without a stated cadence and a verified status it is a wish list with frontmatter.==
This is the Standard for `type: plan` notes in `10_Areas/Life/Plans/`. The file keeps its old name until it is renamed Plan Standard. It keeps a plan wired into `/startday`, `/closeday`, and `/weekly-review`. It does not cover the daily or weekly note; those are [[Daily Note Standard]] and [[Periodic Review Note Standard]].
## Spec
```json
{
  "family": "plan",
  "tier": 1,
  "match": {"type": "plan", "kind": null, "path": "^10_Areas/Life/Plans/", "where": {}, "where_not": {}},
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "review_cadence"],
  "key_types": {"created": "date", "updated": "date", "deadline": "date", "tags": "list", "notes": "list"},
  "headings": ["Goal", "Timeframe", "Systems", "Implementation Status", "Current Progress", "Update Protocol"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`type: plan`, `status` (a plan starts `active`), `review_cadence` in plain words naming a real skill or review, `deadline` only when an external date exists, `next` when a concrete next step exists.
> [!WARNING]
> An empty `review_cadence`. No skill can check the plan for staleness, so it drops out of daily and weekly automation, as the July 2026 Summer plans did.
### Goal
One or two sentences and one metric that proves it was hit.
*Density:* a single outcome with a number or a done-condition in it.
> [!WARNING]
> A goal stated as an identity ("be a builder who ships"). That belongs in a strategic note such as [[Summer Grind]], not in a plan.
### Timeframe
Start date, end date, and the reason the end date is real. Add a week or phase table for anything longer than two weeks.
*Density:* dates, not seasons.
### Systems
The goal broken into checkable tracks. Each has a cadence and a done-definition that answers "did this happen today".
> [!WARNING]
> A list of project names with no mechanism. "Ship TradingView" is a category; "review Cursor's Streamlit build against the locked UI spec" is a system.
### Implementation Status
What is built, verified against a real file, commit, or tracker, never against memory of intent. If it cannot be verified now, write "unverified" and say what would verify it.
### Current Progress
Append-only. One dated line per review, short and factual.
> [!WARNING]
> Rewriting this section. Deleting old entries erases the history that shows whether the plan is drifting.
### Update Protocol
Which skill touches the note, on what cadence, and what happens after two missed reviews in a row. Name a real command (`/closeday`, `/weekly-review`), not "review periodically".
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `status: seed`, or no `status` | `active` | mechanical |
| A `type: plan` note with no `review_cadence` | Add it, taken from the note's Update Protocol | judgment |
| Numbered sections ("1. Strategic summary", "2. Two-track model") as in `LeetCode & CSCI 4041` | The summary becomes Goal and Timeframe, the tracks become Systems, any log becomes Current Progress | judgment |
| A plan and its tracker as two files | One file, per [[Plans-to-Create]] | judgment |
| `type: evergreen` operating rules inside a plan folder (Anti-Drift Rules, Weekly Rhythm) | Not plans. Keep as notes linked from the plan, or fold into Systems | judgment, decide per note |
| `type: plan` outside `Plans/` (`Today - 2026-06-03` in `30_Reviews`) | Retype as the daily note it is | judgment |
| End date passed and `status: active` | `complete` or `archived` at the next weekly review | mechanical, with a check |
## Done Conditions
- Every spec heading holds real content, and `review_cadence` names a real skill or review.
- Implementation Status was checked against a live file or commit.
- Current Progress has a dated entry within the stated cadence and is only appended to.
- The plan is linked from [[Plans Board]], and no other note in the folder tracks the same thing.
- A plan past its end date is closed, not left `active`.
## Gold Standard Example
[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]: a Goal with one metric, a dated Timeframe, Systems with done-definitions, a verified Implementation Status, a dated Current Progress log, and an Update Protocol that names the skills. It fails only the blank-line check (14 extra blank lines), so it is one cleanup from fitting.
