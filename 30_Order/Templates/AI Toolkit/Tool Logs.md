---
type: system
status: sprout
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - log
  - tool-log
system_kind: log
log_shape: row
feeder: /export-ai-session
order: newest-last
scope:
notes: []
---
# <% tp.file.title %>
<!-- One row per skill or command use. Outcome is clean, partial, or failed; Skill/Command may be ad-hoc or multiple. -->
| Date | Project | Skill/Command | What It Did | Outcome | Source |
|---|---|---|---|---|---|
