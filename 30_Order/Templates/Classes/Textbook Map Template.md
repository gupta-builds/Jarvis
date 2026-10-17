---
type: class
class_kind: textbook-map
status: seed
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - class
  - textbook
area:
next:
---
# <% tp.file.title %>
## Purpose
<!-- The authoritative textbook, its edition and local file, and the mapping rule used. -->
## Map
<!-- One row per assigned section: source, chapter note link, week, verified date, status. -->
## Status
<!-- Coverage in a few lines and the next production step. -->
## Dataview
<!-- Optional. Query the real course folder with class_kind = "textbook". -->
```dataview
TABLE status, next
FROM "<course folder path>/Textbook"
WHERE class_kind = "textbook"
SORT file.name ASC
```
