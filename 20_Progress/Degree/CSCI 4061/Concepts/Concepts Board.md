---
type: index
status: seed
created: 2026-10-01
updated: 2026-10-01
tags:
  - moc
notes:
  - "[[CSCI 4061 Board]]"
next: "Populate C Refresher with the 10 concept notes plus the C Language board note, drawn from CSCI 2021"
---
# Concepts Board
## Purpose
Index for this course's cross-cutting concept layer, as distinct from the chronological [[20_Progress/Degree/CSCI 4061/Weekly/Weekly Board|Weekly Board]] and the per-chapter [[20_Progress/Degree/CSCI 4061/Textbook/Textbook Map|Textbook Map]]. Weekly and Textbook notes capture what a specific lecture or chapter said; concept notes here capture a single idea (a mechanism, an API family, a recurring trap) distilled across however many weeks actually touch it, per [[Concept Standard]].
## Map
[[20_Progress/Degree/CSCI 4061/Concepts/C Refresher/C Language|C Language]] is this folder's main hub: an advanced refresher on the C fundamentals CSCI 4061 assumes but does not re-teach, built from this course's own prerequisite, CSCI 2021. It summarizes and links out to ten concept notes under `C Refresher/` — pointers and memory, the compilation pipeline, structs, arrays, dynamic allocation, file I/O, and the other prerequisite material every systems-programming project in this course leans on without re-explaining. No 4061-specific concept notes (process lifecycle, signal taxonomy, the fd/system-file-table/inode chain) exist yet in this folder directly — that material currently lives inline inside the Weekly and Textbook notes themselves, and is a reasonable candidate to extract here once a concept recurs across three or more weeks, per [[Concept Standard]]'s creation-timing rule.
## Status
`C Refresher/` is the only populated subfolder as of 2026-10-01. `Weekly/`, `Labs/`, and `Projects/` subfolders exist under `Concepts/` but are empty — leftover scaffolding from an earlier template pass, not an active part of this course's note layout; the real Weekly, Labs, and Projects notes live one level up at `20_Progress/Degree/CSCI 4061/Weekly/`, `Labs/`, and `Projects/`.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 4061/Concepts"
WHERE type = "concept"
SORT file.name ASC
```
