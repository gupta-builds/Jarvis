---
type: index
status: sprout
created: 2026-09-08
updated: 2026-10-02
tags:
  - moc
notes:
  - "[[CSCI 4061 Board]]"
next: "Live-capture Week 5 (IPC: shared memory, finish pipes) once its lectures happen"
---
# CSCI 4061 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4061 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
- [[Week - 1]] - captured and reconciled. Lec01 (9/8, course intro/OS framing) and Lec02 (9/10, `_start()`/memory layout/`fork`/`exec`/`wait`), synthesized against [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], both source-checked.
- [[Week - 2]] - captured and reconciled. Lec03 (9/15) and Lec04 (9/17), low-level I/O (`open`/`read`/`write`), file permissions, the fd-table/system-file-table/inode chain, `dup2`/redirection, and pipes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], now source-checked in Build 2.
- [[20_Progress/Degree/CSCI 4061/Weekly/Week - 3]] - captured and reconciled. Lec05 (9/22) and Lec06 (9/24), signals end-to-end plus an early preview of file systems/i-nodes. Cites [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]] and [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], both now source-checked in Build 2.
- [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4]] - captured and reconciled. Lec07 (9/29, file systems: i-nodes, directories, hard/symbolic links) and Lec08 (10/1, IPC: `pipe()`, descriptor-close semantics, FIFOs previewed early), synthesized against [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]] and the newly-landed [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter - 15]] (§15.1-15.2).
Each week follows [[Weekly Standard]], cross-referenced against the reading assignments in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]].
## Status
4 of 15 weeks fully captured and reconciled (Weeks 1-4) as of 2026-10-02. Weekly layer is **current** through Week 4; the earliest incomplete week is Week 5 (IPC: shared memory, §15.9 - that extension to [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter - 15]] has already landed on the textbook side, but no Week 5 weekly note exists yet since its lectures haven't happened). All seven landed chapter notes ([[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 1|Chapter - 1]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3|Chapter - 3]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 4|Chapter - 4]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 7|Chapter - 7]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8|Chapter - 8]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10|Chapter - 10]], [[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 15|Chapter - 15]]) are source-checked against the textbook PDF.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 4061/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
