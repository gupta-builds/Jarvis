---
type: evergreen
status: seed
created: 2025-12-25
tags:
  - evergreen
notes:
  - "[[Elevator pitch]]"
  - "[[Mentor Details]]"
  - "[[Plan]]"
---
# The Move
```dataview
TABLE status, deadline, related_progress, next
FROM "20_Progress"
WHERE (type = "project" OR type = "brainstorm")
AND !contains(file.folder, "20_Progress/UROP")
SORT deadline ASC
```
