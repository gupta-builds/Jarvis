---
type: system
status: sprout
created: 2026-07-27
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: plan
tier: 1
maps_to:
  - "[[Standing Plan Template]]"
used_by:
  - "[[Plan Review Cadence]]"
gold_standard: "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]"
notes:
  - "[[Plans-to-Create]]"
  - "[[HUMAN_WRITING]]"
---
# Plan Standard
==A plan is a note a skill rereads on a schedule; without a stated cadence and a verified status it is a wish list with frontmatter.==
This is the Standard for `type: plan` notes in `10_Areas/Life/Plans/`. It keeps a plan wired into `/startday`, `/closeday`, and `/weekly-review`. It is not the daily note ([[Daily Note Standard]]), not the weekly, monthly, or yearly note ([[Periodic Review Note Standard]]), and not a project's own plan, which is a `project_kind: plan` note ([[Spec and Plan Standard]]).
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

| Item | Rule |
|---|---|
| Allowed folders | `10_Areas/Life/Plans/`, in a subfolder for the term (`Fall 2026/`). |
| File name | The plan's subject. A term may sit in the file name; a heading never names one. |
| Kind | `type: plan`, no kind key. |
| Status | `active` from the first save. `paused` when work stops with a reason. `complete` or `archived` at the first weekly review after the end date. |
## Headings
### Frontmatter
- **Write:** `type: plan`, `status`, `review_cadence` in plain words naming a real skill or review, `deadline` only when an external date exists, `next` when a concrete next step exists.
- **Length:** one line per key; `review_cadence` is one line.
- **Never:** an empty `review_cadence`. No skill can check the plan for staleness, so it drops out of daily and weekly automation, as the July 2026 Summer plans did.
- **Right:** `review_cadence: weekly via /weekly-review (sets next week's One Hard Thing); daily via /startday and /closeday (sets and checks the day's 80/20 split)`
- **Wrong:** None seen.
### Goal
- **Write:** the outcome and one metric that proves it was hit.
- **Length:** one or two sentences.
- **Never:** an identity ("be a builder who ships"). That belongs in a strategic note such as [[Summer Grind]].
- **Right:** `Land a real Summer 2027 software engineering or AI/ML internship offer, proven by moving off zero applications sent`
- **Wrong:** None seen.
### Timeframe
- **Write:** start date, end date, and the reason the end date is real. Add a week or phase table for anything longer than two weeks.
- **Length:** a few dated lines plus the table.
- **Never:** seasons instead of dates.
- **Right:** `Start Day: 2026-09-01 (already underway).`
- **Wrong:** None seen.
### Systems
- **Write:** the goal broken into checkable tracks. Each has a cadence and a done-definition that answers "did this happen today".
- **Length:** one table row per track.
- **Never:** a list of project names with no mechanism. "Ship TradingView" is a category.
- **Right:** `Every track needs a cadence and a done-definition checkable on any given day.`
- **Wrong:** None seen.
### Implementation Status
- **Write:** what is built, checked against a real file, commit, or tracker count, never against memory of intent. If it cannot be checked now, write "unverified" and what would verify it.
- **Length:** a dated line, then one bullet per track.
- **Never:** a claim older than the code or folder it describes.
- **Right:** `Verified against real files as of 2026-09-07. Nothing here is rounded up.`
- **Wrong:** None seen.
### Current Progress
- **Write:** one dated line per review, short and factual. Append only.
- **Length:** one to three sentences per line.
- **Never:** a rewritten or deleted old entry. It erases the history that shows whether the plan is drifting.
- **Right:** `- **2026-09-15**: Full postmortem against real files, not the plan's own claims.`
- **Wrong:** None seen.
### Update Protocol
- **Write:** which skill touches the note, on what cadence, and what happens after two missed reviews in a row. Name a real command.
- **Length:** two to four sentences.
- **Never:** "review periodically".
- **Right:** `If two Sundays pass with no edit to Current Progress, that's a Never Miss Twice trigger per [[Anti-Drift Rules]]`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `review_cadence` is filled | A plan with no cadence leaves the automation | Lint, check 1 |
| The six headings appear in order, none empty | `/startday` patches the plan by section name | Lint, check 2 |
| Headings never name a term ("Fall Daily Floor") | A skill that patches by name stops finding it next term | Reader |
| Implementation Status is checked against a live file or count | A plan checked against itself always passes | Reader |
| Current Progress is only appended to | Deleted entries hide drift | Reader |
| A plan past its end date is `complete` or `archived` | An `active` plan nobody reads still shows on the dashboard | Reader |
| One file per plan; a tracker is a section, not a second file | Two files for one plan disagree within a week | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `status: seed`, or no `status` | `active` | Mechanical |
| A `type: plan` note with no `review_cadence` (LeetCode & CSCI 4041, ML Fundamentals, LeetCode & CodePath) | Add it, taken from the note's Update Protocol | Judgment |
| Numbered sections ("1. Strategic summary", "2. Two-track model") | The summary becomes Goal and Timeframe, the tracks become Systems, any log becomes Current Progress | Judgment |
| A plan and its tracker as two files | One file, per [[Plans-to-Create]] | Judgment |
| `type: evergreen` operating rules inside a plan folder (Anti-Drift Rules, Weekly Rhythm) | Not plans. Keep as notes linked from the plan, or fold into Systems | Judgment |
| `type: plan` outside `Plans/` (`Today - 2026-06-03` in `30_Reviews`) | Retype as the daily note it is | Judgment |
| End date passed and `status: active` (Final Month Plan, ended 2026-09-01) | `complete` or `archived` at the next weekly review | Mechanical, with a check |
## Done Conditions
- Every spec heading holds real content, and `review_cadence` names a real skill or review.
- Implementation Status was checked against a live file or commit.
- Current Progress has a dated entry within the stated cadence and is only appended to.
- The plan is linked from [[Plans Board]], and no other note in the folder tracks the same thing.
- A plan past its end date is closed, not left `active`.
- The note passes [[Vault Lint]] for the `plan` family.
## Gold Standard Example
[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]: a Goal with one metric, a dated Timeframe, Systems with done-definitions, a verified Implementation Status, a dated Current Progress log, and an Update Protocol that names the skills. It does not pass lint: 13 extra blank lines and 2 dead body links. A passing plan exists, but it is out of date, so it is not the gold.
Measured 2026-11-07 with `--family plan`: 6 notes, 1 passes.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Fall 2026 Plan (gold) | `10_Areas/Life/Plans/Fall 2026/` | All six sections, dated and verified | Blank-line cleanup; two dead links |
| Final Month Plan (Jul 28 - Sep 1) | `10_Areas/Life/Plans/Summer 2026/` | Passes lint | Still `active` after its end date |
| LeetCode & CodePath | `10_Areas/Life/Plans/Fall 2026/` | Real content | `review_cadence`, the six headings, blank lines |
| LeetCode & CSCI 4041 | `10_Areas/Life/Plans/Summer 2026/` | Real content | `review_cadence` and the six headings |
