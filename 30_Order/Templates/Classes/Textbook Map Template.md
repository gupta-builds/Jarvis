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
# Textbook Map
This is the INDEX of every part/chapter the course covers, with links out to each chapter's own note — not chapter content itself. Individual chapter content uses [[Textbook Template]] and lives in its own `Chapter - N.md` note; this file only maps to those.
## Purpose
## Map
## Status
## Dataview
```dataview
TABLE status, next
FROM "<course folder path>/Textbook"
WHERE input_kind = "book"
SORT file.name ASC
```
