---
type: brainstorm
status: tree
created: 2025-12-26
tags:
  - brainstorm
next: "[[MOC]]"
---
# Inbox Dashboard Examples
## Thoughts
```dataview
TABLE created, thought_kind, status, related_progress, next
FROM "00_Inbox" 
WHERE type = "thought"
AND !contains(file.folder, "00_Inbox/Headway/Enumerate")
SORT file.mtime ASC
```
## Brainstorming
```dataview
TABLE created, status, related_progress, next
FROM "00_Inbox" 
WHERE type = "brainstorm"
AND !contains(file.folder, "00_Inbox/Headway/Enumerate")
SORT file.mtime ASC
```
## Inbox Dashboard: List View(Needs processing). 
```dataview
LIST FROM "00_Inbox"
WHERE type != "kanban"
SORT created DESC
```
- [ ] Sample task 1: status symbol=`space` status name='Todo' 📅 2025-12-21
- [ ] not done
- [ ] due today
- [ ] sort by ⏫