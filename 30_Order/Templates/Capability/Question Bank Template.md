---
type: dashboard
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - dashboard
  - question-bank
dashboard_kind: question-bank
track: []
notes: []
---
# <% tp.file.title %>
## Open Questions
<!-- Unanswered questions for this track. Add them as question notes; this list is generated. -->
```dataview
TABLE question_status, created
FROM ""
WHERE type = "thought" AND contains(tags, "question") AND contains(track, this.track[0]) AND question_kind = "open" AND question_status != "resolved"
SORT created ASC
```
## Misconceptions
<!-- Wrong beliefs worth correcting. Each states the belief and why it is wrong. -->
```dataview
TABLE question_status, created
FROM ""
WHERE type = "thought" AND contains(tags, "question") AND contains(track, this.track[0]) AND question_kind = "misconception" AND question_status != "resolved"
SORT created ASC
```
## Oral Exam Prompts
<!-- Questions to answer cold in an interview or technical discussion. -->
```dataview
TABLE question_status, created
FROM ""
WHERE type = "thought" AND contains(tags, "question") AND contains(track, this.track[0]) AND question_kind = "oral-exam"
SORT created ASC
```
## Debugging Drills
<!-- A broken scenario to diagnose down to the root cause. -->
```dataview
TABLE question_status, created
FROM ""
WHERE type = "thought" AND contains(tags, "question") AND contains(track, this.track[0]) AND question_kind = "debugging"
SORT created ASC
```
## Build Prompts
<!-- Prompts that need something built to prove understanding. -->
```dataview
TABLE question_status, created
FROM ""
WHERE type = "thought" AND contains(tags, "question") AND contains(track, this.track[0]) AND question_kind = "build"
SORT created ASC
```
## Resolved Learnings
<!-- Questions that were answered, kept as reference and not for active review. -->
```dataview
TABLE question_kind, created
FROM ""
WHERE type = "thought" AND contains(tags, "question") AND contains(track, this.track[0]) AND question_status = "resolved"
SORT created DESC
```
