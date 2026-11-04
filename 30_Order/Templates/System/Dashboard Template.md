---
type: dashboard
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - dashboard
dashboard_kind: dashboard
notes: []
next:
---
# <% tp.file.title %>
<!-- One sentence: the question this page answers and who opens it. Rename each section below to the question it answers. -->
## Open Items
<!-- One sentence: what a row means and what to do about it. Point FROM at an existing folder, or keep FROM "" with a type filter. -->
```dataview
TABLE status, next, updated
FROM ""
WHERE type = "project" AND status = "active"
SORT updated DESC
LIMIT 20
```
## Recently Updated
<!-- One sentence: why the latest ten rows matter and what a stale one means. Sort on a frontmatter key from the Frontmatter Standard. -->
```dataview
TABLE type, status, updated
FROM ""
WHERE type = "project"
SORT updated DESC
LIMIT 10
```
