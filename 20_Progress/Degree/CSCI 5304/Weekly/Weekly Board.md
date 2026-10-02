---
type: index
status: seed
created: 2026-09-08
updated: 2026-09-28
tags:
  - moc
notes:
  - "[[CSCI 5304 Board]]"
next: "Fill Week - 1.md after Lecture 1 (Thu 9/10) and Lecture 2-3 (Tue 9/15) are both done"
---
# CSCI 5304 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 5304 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
`Week - 1.md` exists as an untouched template scaffold, not real content yet, and is being skipped on purpose - nothing real was captured for Week 1's own synthesis. `Week - 2.md` and `Week - 3.md` don't exist yet as of 2026-09-28, but their build is staged and ready: [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]] holds the real transcript manifest plus the filled Notebook and Codex prompts needed to build both, per the repeatable workflow now recorded in [[CSCI 5304 Board]]. Each week from here follows [[Weekly Standard]]: lecture captured section by section, textbook integration stating only the delta, and the required lecture-to-textbook synthesis section.
## Status
0 of 15 weeks written as of 2026-09-28 - Weeks 2 and 3 are staged (prompts written, not yet run) rather than written. Week numbering should follow the Board note's Weekly Schedule table exactly - that table already resolved the syllabus's own date inconsistencies, so build week files against it rather than re-deriving dates from scratch.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 5304/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
