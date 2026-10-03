---
type: index
status: seed
created: 2026-09-15
updated: 2026-10-02
tags:
  - moc
notes:
  - "[[CSCI 4511W Board]]"
next: "Fill Week - 5.md once Ch 4 (Local Search) readings are assigned and Lecture 07 lands; also backfill Wednesday 9/30 (§3.6) into Week - 4.md once Lecture 07 exists"
---
# CSCI 4511W — Weekly Board
Index of this course's week-by-week synthesis notes. [[CSCI 4511W Board]] is the full syllabus, grading, and schedule source - this note tracks only the weekly-note layer as it fills in over the semester.
## Map
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week - 1]] — Intro lecture (9/9) PEAS vocabulary (Performance Measure, Environment, Actuators, Sensors, Vacuum World) plus Turing 1950 discussion (9/11); synthesis anchors on why rational agents are the engineering target and why that choice survives the nine objections Turing pre-empts. Each subsequent week follows [[Weekly Standard]], cross-referenced against [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]] and the full 15-week schedule in [[CSCI 4511W Board]].
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week - 2]] — Ch 2.1-2.4 (9/14): formal agent definitions, five environment property axes, three agent architecture types (Simple Reflex through Goal-Based; Utility-Based and Learning from textbook); Ch 3.1-3.2 (9/16): problem-solving process four-step flow, six-tuple search problem formulation, BestFirstSearch(problem, f) framework introduced via 8-puzzle; synthesis anchors on the agent architecture hierarchy and search formalism as two halves of the same design question.
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week - 3]] — Ch 3.3–3.4.4 (9/21–9/23): `BestFirstSearch(problem, f)` as the unified uninformed framework; BFS (f=0), DFS (f=-g), UCS (f=g), DLS, and IDDFS derived by changing only f; synthesis anchors on IDDFS as the practical winner for large memory-constrained spaces, and on UCS's late goal test as a correctness requirement rather than a performance choice.
[[20_Progress/Degree/CSCI 4511W/Weekly/Week - 4|Week - 4]] — Ch 3.5.1–3.5.2 (9/28): Greedy Best-First (f=h) and A* (f=g+h) derived from the same `BestFirstSearch` framework; admissibility (tree search) and consistency (graph search) as A*'s cost-optimality conditions, proved via contradiction on the priority queue; Wednesday 9/30 §3.6 heuristic construction is textbook-only pending Lecture 07.
## Status
4 of 15 weeks fully written as of 2026-10-02. Week numbering follows the Board note's Schedule table exactly — Monday/Wednesday are lecture days, Friday is the discussion section.
## Dataview
```dataview
TABLE status, updated
FROM "20_Progress/Degree/CSCI 4511W/Weekly"
WHERE type = "class" AND input_kind = "lecture"
SORT file.name ASC
```
