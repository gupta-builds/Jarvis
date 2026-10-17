---
type: class
class_kind: subboard
status: seed
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - class
  - subboard
notes: []
next:
---
# <% tp.file.title %>
## Purpose
<!-- Name the course Board this index serves, the layer it indexes, and what belongs in the notes it points to. -->
## Map
<!-- One entry per item: a real link and one sentence on what it covers and how it connects to the previous one. -->
## Status
<!-- Ahead, current, behind, or blocked; the earliest incomplete item and the exact missing source or action. -->
## Dataview
<!-- Optional. Replace the folder path with the course's real folder and check that the query returns rows. -->
```dataview
TABLE status, next
FROM "<course folder path>/Weekly"
WHERE class_kind = "week" OR input_kind = "lecture"
SORT file.name ASC
```
