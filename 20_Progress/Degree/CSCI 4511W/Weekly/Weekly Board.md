---
type: index
status: seed
created: 2026-09-15
updated: 2026-10-13
tags:
  - moc
notes:
  - "[[CSCI 4511W Board]]"
next: "Reconcile available Lecture 07 into Week 4; write Week 5 from Lectures 08-09 and Week 6 from Lecture 10"
---
# CSCI 4511W — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4511W Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week 1]] connects the September 9 PEAS capture, Chapter 1 background, and September 11 Turing reading. The October 13 source check distinguishes imitation from rational action, repairs misleading claims, inventories all 20 Chapter 1 exercises, and adds eight closed-note questions. Missing classroom capture remains explicit.
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week - 2]] — Ch 2.1-2.4 (9/14): formal agent definitions, five environment property axes, three agent architecture types (Simple Reflex through Goal-Based; Utility-Based and Learning from textbook); Ch 3.1-3.2 (9/16): problem-solving process four-step flow, six-tuple search problem formulation, BestFirstSearch(problem, f) framework introduced via 8-puzzle; synthesis anchors on the agent architecture hierarchy and search formalism as two halves of the same design question.
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week - 3]] — Ch 3.3–3.4.4 (9/21–9/23): `BestFirstSearch(problem, f)` as the unified uninformed framework; BFS (f=0), DFS (f=-g), UCS (f=g), DLS, and IDDFS derived by changing only f; synthesis anchors on IDDFS as the practical winner for large memory-constrained spaces, and on UCS's late goal test as a correctness requirement rather than a performance choice.
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 4|Week 4]] covers the September 28 greedy/A* unit and its textbook connection. Lecture 07, September 30, is now available for heuristic-construction and A* analysis reconciliation.
## Status
Four weekly notes exist as of October 13. Week 1 was source-checked and repaired this session; no mastery result is recorded. Lecture 07 is now available for Week 4 reconciliation. Lectures 08-09 and Lecture 10 are available for the missing Week 5 and Week 6 notes. See [[20_Progress/Degree/CSCI 4511W/Preparation|Preparation]] for the verified source inventory and quiz coverage. Week numbering follows the Board schedule; a file's existence is not evidence that every source has been reconciled.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 4511W/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
