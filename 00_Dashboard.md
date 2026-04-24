---
type: evergreen
status: tree
created: 2026-04-23
tags:
  - evergreen
  - dashboard
notes:
  - "[[CLAUDE.md]]"
  - "[[Random]]"
  - "[[30_Order/Templates/MOC]]"
---
# Jarvis — AI-Powered PKM

## Quick Capture
> Use `Ctrl+Shift+I` (QuickAdd) to capture thoughts instantly.

## Active Classes
```dataview
TABLE WITHOUT ID
  file.link AS "Class",
  length(file.inlinks) AS "Notes"
FROM "10_UMN"
WHERE contains(file.name, "Board")
SORT file.name ASC
```

## Active Projects
```dataview
TABLE status, deadline, next
FROM "20_Progress"
WHERE type = "project" AND status != "archived"
SORT status ASC, file.mtime DESC
LIMIT 10
```

## Recent Claude Outputs
```dataview
TABLE created, status, type
FROM "60_Claude"
WHERE !contains(file.folder, "60_Claude/60_Indexes")
SORT file.mtime DESC
LIMIT 8
```

## Unprocessed Clippings
```dataview
LIST
FROM "60_Claude/05_Clippings"
WHERE !contains(file.name, "board")
SORT file.ctime DESC
LIMIT 10
```

## Flashcard Review Queue
```dataview
LIST
FROM #cards
WHERE !contains(file.folder, "30_Order/Templates")
SORT file.mtime DESC
LIMIT 10
```

## Orphan Notes (no backlinks)
```dataview
LIST
FROM "40_Resources" OR "60_Claude/20_Distilled_Notes"
WHERE length(file.inlinks) = 0
SORT file.mtime DESC
LIMIT 8
```

## Weekly Review
```dataview
TABLE file.ctime AS "Created"
FROM "60_Claude/50_Reviews/Weekly"
SORT file.name DESC
LIMIT 4
```
