---
type: dashboard
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - dashboard
  - field-os
dashboard_kind: field-os
track: []
notes: []
---
# <% tp.file.title %>
## Capability Summary
<!-- Set track in the frontmatter first; every query below reads it. -->
```dataview
TABLE length(rows) AS "Tracked Concepts"
FROM ""
WHERE type = "concept" AND contains(track, this.track[0])
GROUP BY "Track"
```
## Overdue Drills
<!-- Concepts whose next_drill has passed. Review these first. -->
```dataview
TABLE mastery_level, difficulty, next_drill, drill_interval
FROM ""
WHERE type = "concept" AND contains(track, this.track[0]) AND next_drill AND next_drill < date(today)
SORT next_drill ASC
```
## Recent Progress
<!-- The ten concepts of this track updated most recently. -->
```dataview
TABLE mastery_level, status, updated
FROM ""
WHERE type = "concept" AND contains(track, this.track[0])
SORT updated DESC
LIMIT 10
```
## Open Questions
<!-- Unresolved questions for this track. Add questions to the Question Bank, not here. -->
```dataview
TABLE question_kind, question_status, created
FROM ""
WHERE type = "thought" AND contains(tags, "question") AND contains(track, this.track[0]) AND question_status != "resolved"
SORT created ASC
```
## Outputs Produced
<!-- Deliverables built from this track's concepts. -->
```dataview
TABLE output_kind, status, source_concepts
FROM ""
WHERE type = "output" AND contains(track, this.track[0])
SORT created DESC
```
## Synthesis Notes
<!-- Notes that bridge this track with another. -->
```dataview
TABLE concepts, tracks, status
FROM ""
WHERE contains(tags, "synthesis") AND contains(tracks, this.track[0])
SORT updated DESC
```
## Navigation
<!-- Link this track's Depth Ladder and Question Bank, and the Capability Dashboard. -->
