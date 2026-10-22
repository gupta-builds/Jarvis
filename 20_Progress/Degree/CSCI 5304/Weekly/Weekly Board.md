---
type: index
status: seed
created: 2026-09-08
updated: 2026-10-02
tags:
  - moc
notes:
  - "[[CSCI 5304 Board]]"
next: "Resolve the real midterm-date conflict logged in Week - 7 before building exam-specific practice material; build Week - 8 once a real post-10/20 lecture transcript lands"
---
# CSCI 5304 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 5304 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
`Week - 1.md` exists as an untouched template scaffold, not real content yet, and is being skipped on purpose - nothing real was captured for Week 1's own synthesis. `Week - 2.md` through `Week - 7.md` are now all written in full, per [[Weekly Standard]]: lecture captured section by section, textbook integration stating only the delta, and the required lecture-to-textbook synthesis section. Week 3 and Week 4 each carry an explicit, labeled gap rather than inventing content: Thursday 9/24's scheduled Lectures 6-7 session has no transcript anywhere in the source folder, and that content actually surfaced later, out of its printed slot, inside Week 4 instead. [[20_Progress/Degree/CSCI 5304/Weekly/Week - 5|Week - 5]] covers Lecture 10 (Householder, across 10/6 and 10/8) and Lecture 11 (Least Squares, 10/8). [[20_Progress/Degree/CSCI 5304/Weekly/Week - 6|Week - 6]] covers Lecture 12 (Conditioning, 10/13) and logs the professor's own live confirmation that the midterm's scope stops at Lecture 11. [[20_Progress/Degree/CSCI 5304/Weekly/Week - 7|Week - 7]] covers the 10/20 session, which is an exam-review Q&A day with no new lecture content - it carries this course's single most important open item, a real three-way conflict over the actual midterm date (10/15 per the 10/13 transcript, 10/20 per the Board's current user-sourced correction, 10/22 per the 10/20 transcript's own anticipation of a still-upcoming exam).
## Status
7 of 15 weeks written as of 2026-10-22 (Weeks 2-7) - Week 1 is skipped on purpose. Week numbering follows the Board note's Weekly Schedule table exactly - that table already resolved the syllabus's own date inconsistencies, so build week files against it rather than re-deriving dates from scratch. Real schedule anomalies logged this pass: Lecture 12's own session (10/13) included a live professor confirmation that the semester's internal date tracking had drifted about a week behind since early term - a first-hand instance of the same pattern [[CSCI 5304 Board]] already logs three times. **The earliest incomplete item is resolving the real midterm date** (see [[20_Progress/Degree/CSCI 5304/Weekly/Week - 7|Week - 7]]'s WARNING) - do not build Week - 8 or any midterm-specific practice material until that's settled, since it determines which week's content the exam actually tested.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 5304/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
