---
type: evergreen
status: sprout
created: 2026-09-20
updated: 2026-09-20
tags:
  - system
  - standards
notes:
  - "[[Board or Main Template]]"
---
# Course Board Standard
==The course Board is the verified control center: it tells an agent what the course is, where the truth lives, what is due, and what remains uncertain.==
This standard governs the note made from `Board or Main Template.md`. The Board is not a diary, a copied syllabus dump, or a substitute for weekly, textbook, concept, assignment, or exam notes. It is the stable orientation layer from which every other course note can be found and checked.
## Non-negotiable source rule
Use the live syllabus, Canvas/learning-management pages, instructor announcements, and the local course source folder in that order of authority for time-sensitive course facts. Existing vault notes are useful continuity and style references, not proof when they conflict with a primary source. Every dated, graded, or policy-sensitive claim must have a source and a verification date somewhere in the Board.
If two authoritative sources disagree, preserve both claims with dates, mark the conflict, and ask the user which source should control. Never silently choose, merge, or infer a deadline, grade weight, prerequisite, policy, or meeting time.
## Frontmatter
Keep `type: class`, `input_kind: board`, `status`, `created`, `updated`, `area`, `tags`, and `next`. Use real wikilinks only. `next` contains the next unresolved verification or action, not a vague aspiration. Change `status` from `seed` only when the source, schedule, and course structure have been checked enough for the Board to guide downstream work.
## Source of Truth
Name the exact live sources used, the local source folder, the date checked, and what each source controls. Distinguish direct source facts from reasonable inferences and unresolved questions. Include enough path information that a future agent can reopen the source without guessing.
## Instructor & Logistics
Record instructor, TAs, lecture and discussion meetings, locations, office hours, communication channels, and section differences only when verified. Preserve unknowns explicitly. Do not convert a pattern in due dates into a confirmed meeting time without labeling it as an inference.
## Required Materials
List only materials explicitly required or clearly assigned. Separate required, recommended, and locally available material. Link the actual textbook note/map and local files when they exist; do not claim an unread PDF or a missing slide deck was used.
## Course Description / Prerequisites / Learning Objectives
Distill the catalog and syllabus into compact prose and testable abilities. Objectives must use verbs such as explain, implement, compare, derive, analyze, or write. Mark inferred prerequisites or outcomes as inferred and keep them separate from stated ones.
## Grading Breakdown
Transcribe weights, counts, submission rules, collaboration rules, late rules, and assessment format exactly enough to drive preparation. Cross-check that percentages and counts reconcile. Keep assessment-specific nuance here, then link out to the relevant Homework, Project, Discussion, or Exam notes instead of duplicating large workflows.
## Weekly Schedule
Map every week/date to reading, lecture, discussion, assignment, quiz, and exam events that are actually known. Use the schedule to seed weekly notes before lecture. Never fabricate a missing date to make the table look complete. When a schedule changes, update the Board and the affected note's `next` field.
## Resources
Link the course source folder, course Board, textbook map, weekly board, preparation note, active assignments, projects, and concept board. Check every link before writing it. Prefer path-qualified links when week/chapter names collide across courses.
## Verification Notes
Record what was directly checked, when it was checked, what remains uncertain, and what action would resolve it. A Board with unresolved questions is healthier than one that hides uncertainty.
## Update triggers
Update the Board when the syllabus, Canvas module, grading rule, deadline, source inventory, or course schedule changes; after a major assessment; and when post-lecture synthesis reveals a scope correction. Do not update it for every sentence added to a concept note.
## Done conditions
- The source hierarchy and local source folder are explicit.
- Course facts, dates, weights, counts, and policies are source-grounded and dated.
- The schedule accounts for every known teaching and assessment event.
- Unknowns and inferences are visible rather than silently resolved.
- Links to the course's note layers resolve and do not point to invented notes.
- `next` identifies the next concrete verification or production action.
