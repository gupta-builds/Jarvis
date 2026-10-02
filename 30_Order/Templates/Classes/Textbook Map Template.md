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
This is the INDEX of every part/chapter the course covers, with links out to each chapter's own note — not chapter content itself. Individual chapter content uses [[Textbook Template]] and lives in its own `Chapter - N.md` note; this file only maps to those.
## Purpose
<!-- State which textbook(s) the course uses and how this map should be read. -->
## Map
<!-- Add one concise row or bullet per assigned section with a verified chapter link and due date/module. -->
## Status
<!-- Record which chapter notes exist, what is next, and any unresolved source or schedule gap. -->
## Dataview
<!-- Keep this query at the bottom. Replace the course folder path before using the template. -->
```dataview
TABLE status, next
FROM "<course folder path>/Textbook"
WHERE input_kind = "book"
SORT file.name ASC
```
