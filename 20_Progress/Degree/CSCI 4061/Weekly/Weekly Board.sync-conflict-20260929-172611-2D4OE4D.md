---
type: index
status: sprout
created: 2026-09-08
updated: 2026-09-29
tags:
  - moc
notes:
  - "[[CSCI 4061 Board]]"
next: "Live-capture Week 4's real lectures (9/29, 10/1) once they happen - all six chapter notes are now source-checked, so no textbook-side gap remains"
---
# CSCI 4061 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4061 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
- [[Week - 1]] - captured and reconciled. Lec01 (9/8, course intro/OS framing) and Lec02 (9/10, `_start()`/memory layout/`fork`/`exec`/`wait`), synthesized against [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], both source-checked.
- [[Week - 2]] - captured and reconciled. Lec03 (9/15) and Lec04 (9/17), low-level I/O (`open`/`read`/`write`), file permissions, the fd-table/system-file-table/inode chain, `dup2`/redirection, and pipes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], now source-checked in Build 2.
- [[20_Progress/Degree/CSCI 4061/Weekly/Week - 3]] - captured and reconciled. Lec05 (9/22) and Lec06 (9/24), signals end-to-end plus an early preview of file systems/i-nodes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], both now source-checked in Build 2.
- [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4]] - **pre-lecture scaffold only**, built 2026-09-29 before that week's lectures (9/29, 10/1) happen. No `Lec07`/`Lec08` exists in the source folder yet. Fill the real `## Lecture` capture live once class happens, per [[Weekly Standard]]'s lifecycle rule.
Each week follows [[Weekly Standard]], cross-referenced against the reading assignments in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]].
## Status
4 of 15 weeks now have notes as of 2026-09-29 - Weeks 1-3 captured and reconciled, Week 4 a pre-lecture scaffold awaiting real lecture. The weekly layer is **current, not ahead**: it tracks exactly through the last lecture that has actually happened (9/24), with Week 4 honestly marked incomplete rather than backfilled. The earliest real gap is Week 4's live lecture capture, due once 9/29's and 10/1's lectures happen. The textbook-side gap flagged after Build 1 is now closed: all six landed chapter notes ([[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]]) are source-checked against the textbook PDF as of Build 2 (2026-09-29) - the "provisional" language in Weeks 2-3's own Connections sections is now stale and should be read as resolved.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 4061/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
