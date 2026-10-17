---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Project Standard]]"
trigger: A plan, spec, or meeting brief is ready to become active work the dashboard tracks.
notes:
  - "[[Spec and Plan Standard]]"
  - "[[Project Note Template]]"
  - "[[00_Workflows Index]]"
---
# Brief to Progress
Turn the thinking behind a project into a live project note with an honest state and one next move.
## Use when
A plan or spec in `40_Project_Briefs/` or `20_Progress/`, or a brief that produced a project, is ready to become tracked execution.
## Steps
1. Confirm the thinking exists as a plan or spec note ([[Spec and Plan Standard]]). A transcript brief alone is not enough.
2. Search `20_Progress/` for an existing project note and extend it. Do not create a second one.
3. Create the note in its home (`Projects/`, `Internship/`, or `Mentorship Program/`) from [[Project Note Template]]. Read [[Project Standard]] first.
4. Write the Goal in one sentence and the Current State from real files or commits, dated.
5. Set `next` and copy it into Next Action. A note without `next` is invisible to the dashboard.
6. Link the plan or spec in `related_progress`, and link the project from the plan.
7. Append the first Log entry and run [[Vault Lint]] on the path.
8. As work proceeds, update Current State, `next`, and the Log. At the end set `status` to `complete` or `archived` and `next: none`.
## Do not
Do not put the plan inside the project note, leave `next` empty on an active project, or move a finished project to `50_Archive/` yourself.
## Done when
- The project note exists with a live `next` equal to Next Action.
- It links its plan or spec and is linked back.
- Lint reports it fits the `project` family, and the session log records it.
