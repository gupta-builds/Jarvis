---
type: index
status: seed
created:
updated:
tags:
  - moc
notes: []
next:
---
# <% tp.file.title %>
## Purpose
<!-- Name the course Board this index serves and what belongs in weekly notes instead. -->
This indexes the weekly notes for this course; link the finished note to the course Board for grading, schedule, and policy.
## Map
<!-- Add one sentence per completed week explaining what it covered and how it connects to the prior week. -->
## Status
<!-- State whether the weekly-note layer is current, behind, or awaiting lecture capture. -->
## Dataview
<!-- Keep the live query at the bottom. Replace the course folder path before using the template. -->
```dataview
TABLE status, next
FROM "<course folder path>/Weekly"
WHERE input_kind = "lecture"
SORT file.name ASC
```
