---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Board Standard]]"
trigger: A course is added, its syllabus or modules page changes, or a schedule, grading, or source correction lands.
notes:
  - "[[Board or Main Template]]"
  - "[[Course Production Workflow]]"
---
# Board Workflow
Keep the course Board true, because every other course note links back to it.
## Use when
A course is first added, the syllabus or modules page changes, or a major schedule, grading, or source correction affects downstream notes.
## Steps
1. Read [[Board Standard]]. Search for an existing Board before creating one from [[Board or Main Template]].
2. Identify the live syllabus and learning-management source, the local course source folder, the textbook, the schedule, the staff, the grading, and the known unknowns.
3. Fill the Board from the authoritative sources in order of authority. Keep verified facts, dated observations, inferences, and questions apart.
4. Reconcile grading weights and counts, and map every assessment type to its course workflow and template.
5. Link the textbook map, weekly board, preparation note, source folder, active assignments and projects, and concept board, each only after checking it exists.
6. Put the live status in `Current State`, replacing the old block.
7. Set `next` to the earliest concrete verification or production action.
8. Inspect the weekly, exam, homework, project, and preparation notes for claims the change made stale.
9. Run [[Vault Lint]] on the path.
## Done when
- The source authority and check date are explicit.
- Schedule, grading, and policy are reconciled, not guessed.
- Unknowns stay visible and actionable.
- The downstream links are real.
