---
type: review
status: sprout
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - review
  - audit
review_kind: audit
notes: []
---
# <% tp.file.title %>
## Summary
<!-- What was audited, the date, and the verdict in two or three sentences. -->
## Scope
<!-- Optional: the systems covered and what was left out, when the audit spans several. -->
## Findings
<!-- One ### per finding: a claim stated plainly, then the count, file, or log row that proves it. -->
## Priority Queue
<!-- Ordered next actions, each tied to the finding it answers. Mark owner-only decisions. -->
## What Changed
<!-- Optional: files the audit changed, and what it deliberately left alone. -->
## Open Questions
<!-- Anything the audit could not settle, as - [ ] tasks. -->
