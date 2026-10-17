---
type: system
status: sprout
created: 2026-07-27
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Daily Workflow Standard]]"
trigger: A daily or weekly skill runs where a type plan note exists, or a new plan is created.
notes:
  - "[[00_Workflows Index]]"
  - "[[Plan Template]]"
  - "[[Plans-to-Create]]"
---
# Plan Review Cadence
Keep a `type: plan` note wired into daily and weekly execution so it does not become a write-once wish list.
## Use when
`/startday`, `/closeday`, or `/weekly-review` runs and `10_Areas/Life/Plans/` holds a `type: plan` note, or a new plan is being created ([[Plans-to-Create]]).
## Steps
1. `/startday`: when today matches a plan's cadence trigger, read its Current Progress and Implementation Status before writing today's plan. Do not invent priorities the plan contradicts.
2. `/closeday`: when a missed floor item traces to a plan's Systems section, note it. `/weekly-review` uses these to judge whether the plan needs a scope cut.
3. `/weekly-review`: for each `active` plan whose `review_cadence` includes weekly, append one dated line to Current Progress. If Implementation Status drifted, patch that section by heading.
4. Staleness: a plan with no new Current Progress entry for two review cycles is flagged in the weekly synthesis, the same bar as Never Miss Twice in [[10_Areas/Life/Plans/Fall 2026/Anti-Drift Rules|Anti-Drift Rules]].
5. Expiry: a plan past its end date and still `active` is set to `complete` or `archived` in that review.
6. Creation: follow [[Plans-to-Create]] with [[Plan Template]], and check the Done Conditions of [[Daily Workflow Standard]] before the plan counts as finished.
7. Cleanup: when a plan and its tracker are two files, or two notes both claim to be the current status, merge them before adding content to either.
## Do not
Do not rewrite Current Progress. Do not carry a staleness flag into a third cycle. Do not let a skill read a plan file by a hard-coded name; recheck the skill whenever the folder's file set changes.
## Done when
- Every active plan has a Current Progress entry newer than its `review_cadence`.
- No folder holds two notes tracking the same thing.
- A raised staleness flag is resolved, or the plan archived, before the next review.
