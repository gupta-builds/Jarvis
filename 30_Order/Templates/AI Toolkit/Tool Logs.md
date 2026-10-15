---
type: dashboard
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - claude-code
  - tool-log
  - skill-use
notes:
  - "[[20_Progress/Projects/AI Use/Claude Kit/Toolkit/Claude Code]]"
next:
---
# Tool log
==Every row is one skill or command's use in one session, appended by its feeder and never hand-edited into a different shape.==
## Purpose
What this log records, which tools it covers, and the question it answers ("when was this skill last used, on what").
## Feeder and order
- **Feeder:** `/export-ai-session`, or a named owner.
- **Order:** newest last.
## Row shape
| Date | Project | Skill/Command | What It Did | Outcome | Source |
|---|---|---|---|---|---|
| YYYY-MM-DD | project name | `/skill-name`, agent name, `ad-hoc`, or `multiple` | one clause, concrete | clean, partial, or failed, with one clause of why if not clean | `[[raw session note]]` |
`Outcome` is never blank. `ad-hoc` means no registered skill ran. `multiple` means several ran, so name each in `What It Did`.
## Log
| Date | Project | Skill/Command | What It Did | Outcome | Source |
|---|---|---|---|---|---|
## Links
- [[30_Order/Standards/AI Loop/Logs|Logs]]
