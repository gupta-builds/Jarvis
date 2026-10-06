---
type: index
status: active
created: 2026-09-15
updated: 2026-10-05
tags:
  - moc
notes:
  - "[[CSCI 4521 Board]]"
next: "Add protected Week 1–2 live capture and verify the unreadable Week 1–2 PDF decks before reconciling either week."
---
# CSCI 4521 — Weekly Board
## Purpose
Chronological index for the course’s weekly synthesis notes. Detailed notebook/deck evidence, protected live capture, textbook delta, open questions, and cards live in each week; [[CSCI 4521 Board]] remains the schedule and policy source.
## Map
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 1|Week 1]] — pre-lecture source notes cover Wage-table inspection and a normalized one-nearest-neighbor Seeds classifier; source capture is present, but live capture and Week 1 deck verification are pending.
- [[20_Progress/Degree/CSCI 4521/Weekly/Week - 2|Week 2]] — pre-lecture source notes cover leave-one-out and shuffled-split accuracy plus a $K$ scan for Seeds; live capture and the 1.2/1.3 deck verification are pending.
## Status
The weekly layer is behind reconciliation: Weeks 1–2 have source-grounded notebook preparation and textbook integration, not confirmed live-lecture capture. The earliest incomplete work is to add any protected Week 1 capture and verify the Week 1 PDF deck; do not infer either from the notebooks.
## Dataview
```dataview
TABLE status, next
FROM "20_Progress/Degree/CSCI 4521/Weekly"
WHERE input_kind = "lecture"
SORT file.name ASC
```
