---
type: index
status: seed
created: 2026-09-08
updated: 2026-10-02
tags:
  - moc
notes:
  - "[[CSCI 5304 Board]]"
next: "Build Week - 5 once Lecture 10 (Householder) and Lecture 11 actually land a transcript"
---
# CSCI 5304 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 5304 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
`Week - 1.md` exists as an untouched template scaffold, not real content yet, and is being skipped on purpose - nothing real was captured for Week 1's own synthesis. `Week - 2.md`, `Week - 3.md`, and `Week - 4.md` are now all written in full, per [[Weekly Standard]]: lecture captured section by section, textbook integration stating only the delta, and the required lecture-to-textbook synthesis section. Week 3 and Week 4 both carry an explicit, labeled gap rather than inventing content: Thursday 9/24's scheduled Lectures 6-7 session has no transcript anywhere in the source folder, and that content actually surfaced later, out of its printed slot, inside Week 4 instead. Week 4 also carries a still-open gap of its own: Lecture 10 (Householder Triangularization) has not been taught as of 2026-10-01, so Week 5 can't be built yet.
## Status
3 of 15 weeks written as of 2026-10-02 (Weeks 2, 3, 4) - Week 1 is skipped on purpose. Week numbering follows the Board note's Weekly Schedule table exactly - that table already resolved the syllabus's own date inconsistencies, so build week files against it rather than re-deriving dates from scratch. Two real schedule anomalies confirmed this pass, same pattern as Quiz #1: Quiz #2 did not happen in class either (take-home, SVD-focused, announced 9/29 for Thu 10/1), and Homework #2 had not been assigned as of 10/1 despite the printed 10/7 due date - both logged in [[20_Progress/Degree/CSCI 5304/Weekly/Week - 4|Week - 4]] and should be cross-checked against [[CSCI 5304 Board]]'s own schedule-anomaly section.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 5304/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
