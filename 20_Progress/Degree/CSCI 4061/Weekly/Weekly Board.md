---
type: index
status: seed
created: 2026-09-08
updated: 2026-10-01
tags:
  - moc
notes:
  - "[[CSCI 4061 Board]]"
next: "Live-capture Week 4 (Lec07 9/29, Lec08 10/1) once both lectures have actually happened, per the pre-lecture scaffold already sitting in Week - 4"
---
# CSCI 4061 — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4061 Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
[[20_Progress/Degree/CSCI 4061/Weekly/Week - 1|Week - 1]] (System calls, `fork`/`exec`/`wait`, memory layout) through [[20_Progress/Degree/CSCI 4061/Weekly/Week - 3|Week - 3]] (signals, `sigaction`, i-nodes/file systems) are fully captured and source-checked against both lecture and [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]'s chapter notes - each carries a complete Lecture section, Textbook integration, lecture-to-textbook synthesis, and a flashcard deck. [[20_Progress/Degree/CSCI 4061/Weekly/Week - 4|Week - 4]] is a deliberate pre-lecture scaffold only (file systems continued, IPC pipes) - its own `## Lecture` section is explicitly marked as inferred from the syllabus, not yet lecture-verified, and stays that way until the real 9/29/10/1 lectures are live-captured into it. Each week follows [[Weekly Standard]], cross-referenced against the reading assignments in [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]].
## Status
3 of 15 weeks fully captured and reconciled (Weeks 1-3) as of 2026-10-01; Week 4 is scaffolded but not yet lecture-verified. Weekly layer is **current** through Week 3, the earliest incomplete week is Week 4, and the exact missing action is live-capturing its two lectures once they happen. Week numbering follows the Board note's Schedule table directly - that table already holds the real reading and due-date pairing per week.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 4061/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
