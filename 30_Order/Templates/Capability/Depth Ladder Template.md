---
type: dashboard
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - dashboard
  - depth-ladder
dashboard_kind: depth-ladder
track: []
notes: []
---
# <% tp.file.title %>
## Core Concepts
<!-- The load-bearing ideas of this track as a hand-picked list of links. -->
## Compare and Discriminate
<!-- Pairs that are easy to confuse. Each row states the line between them. -->
| Concept A | Concept B | What to clarify |
| --- | --- | --- |
## 30-Minute Refresher
<!-- A numbered reading order that restores the track in thirty minutes. -->
## 2-Hour Technical Refresher
<!-- A numbered reading order for a full technical pass. -->
## Deep Relearning Pass
<!-- Where to start and the order to work through the track's concept notes. -->
## Overdue Drills
<!-- Concepts whose next_drill has passed. -->
```dataview
TABLE mastery_level, difficulty, next_drill, drill_interval
FROM ""
WHERE type = "concept" AND contains(track, this.track[0]) AND next_drill AND next_drill < date(today)
SORT next_drill ASC
```
## All Tracked Concepts
<!-- Every concept in this track, for a full audit. -->
```dataview
TABLE mastery_level, difficulty, status, next_drill
FROM ""
WHERE type = "concept" AND contains(track, this.track[0])
SORT file.name ASC
```
