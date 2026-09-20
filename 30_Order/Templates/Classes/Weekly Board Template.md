---
type: index
status: seed
created:
updated:
tags:
  - moc
notes:
next:
---
# Weekly Board
## Purpose
This indexes the weekly notes for [[Course Board]] — see that note for grading, schedule, and policy.
## Map
## Status
## Dataview
```dataview
TABLE status, next
FROM "<course folder path>/Weekly"
WHERE input_kind = "lecture"
SORT file.name ASC
```
