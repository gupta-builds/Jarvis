---
type: project
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: []
project_kind: prompt
task:
model:
---
# <% tp.file.title %>
## Why This Exists
<!-- The evidence behind the task, with a path or commit. Say what was verified and what is assumed. -->
## Hard Rules
<!-- Scope limits, one line each: what stays untouched, what must stay green, what is out of scope. -->
## Implementation Order
<!-- Numbered steps with the files touched, in the order to do them. -->
## Report Back
<!-- What the agent must report: files changed, commands run with output, anything it could not do. -->
