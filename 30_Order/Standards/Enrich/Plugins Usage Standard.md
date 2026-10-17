---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-16
tags:
  - system
  - standards
  - plugins
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Plugins Usage]]"
gold_standard: "[[00_Dashboard]]"
notes:
  - "[[40_Resources/Obsidian/Plugins/00 Plugin Reference Index|Plugin Reference Index]]"
  - "[[Jarvis Writing and Formatting]]"
  - "[[Decoration Standard]]"
---
# Plugins Usage Standard
==Pick the plugin by the job the line does, write the smallest syntax that does it, and check that it returns something real.==
This is the standard for plugin syntax inside a note: which plugin a given job belongs to, what each may not be used for, and how to verify the result. Plugin settings, installed state, and risks live in the [[40_Resources/Obsidian/Plugins/00 Plugin Reference Index|Plugin Reference Index]]. Never edit `.obsidian/`, plugin `data.json` files, or secrets from a note.
## Choose by job
| Job | Use | Not for |
|---|---|---|
| A list that must stay current from frontmatter, tags, or links | Dataview | A static table, or logic Dataview cannot express readably |
| A fixed registry someone browses and filters by eye | Bases (`.base` files in `60_Claude/44_Indexes/Bases/`) | Computed fields or joins |
| A real action with a date, priority, or recurrence | Tasks, `- [ ]` with the emoji format | Intentions such as "learn plugins" |
| One current move for a whole note | the `next:` key | A second place to keep the same step |
| Stage movement of items | Kanban | A second task database |
| Recall of understood, atomic knowledge | Spaced Repetition, `#cards` | Raw clippings, templates, archive |
| Layout of existing notes | Canvas | Anything a list shows better |
| Shapes, arrows, annotation of a figure | Excalidraw | A replacement for a text note |
| A field edited from inside the note | Meta Bind `INPUT[...]` | A button that runs a command or script without approval |
| Math and code | Latex Suite, fenced code with a language | Decoration |
Dataview answers questions about notes; Tasks answers questions about actions. Do not build a second action system in inline fields.
## Dataview rules
- Every `FROM` path exists today. Dead paths return nothing and look like an empty answer. [[Vault Lint]] finds 93 notes with at least one, among them `20_Progress/UROP`, `10_UMN`, `60_Claude/30_Source_Summaries`, and `60_Claude/10_Session_Logs`.
- Every field in `WHERE` or `TABLE` exists in at least three matching notes. If a query returns nonsense, fix the metadata before the query.
- Restrict `FROM` by folder. A vault-wide query is slow.
- Use DataviewJS only when plain Dataview cannot do it, with one sentence above the block. Never put a string-typed frontmatter value into `innerHTML`.
## Cards and Tasks
Cards follow [[Jarvis Writing and Formatting]]: separator `::`, multiline `?`, tag `#cards/<track>`, written after the concept is explained. Open questions are `- [ ]` tasks, not prose.
## Verify
Open the note in reading view, or run [[Vault Lint]] on its path: it reports `dead-dataview-from`. A query that returns nothing needs a reason in a line beside it.
## Done Conditions
- Each plugin block does a job from the table above.
- Every `FROM` path and queried field exists, checked in this edit.
- No DataviewJS block lacks its one-sentence explanation.
- No plugin setting, `data.json`, or secret was touched.
## Gold Standard Example
[[00_Dashboard]]: its Dataview blocks have no dead `FROM` path today and read real frontmatter, and the pattern breaks the moment a note's metadata drifts, which is the reason to keep the schema consistent. It still fails the dashboard family on vocabulary and hygiene, which the next touch fixes.
