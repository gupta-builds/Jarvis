---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: dashboard
tier: 1
maps_to:
  - "[[For Dashboards]]"
used_by: []
gold_standard: "[[Capability Dashboard]]"
notes:
  - "[[MOC Standard]]"
  - "[[Field OS Standard]]"
  - "[[Jarvis Writing and Formatting]]"
---
# Dashboard Standard
==A dashboard answers a question with a live query, so every query must read a folder that exists today and must say what to do with its rows.==
This is the Standard for `type: dashboard` notes: query dashboards, boards (a query listing a folder), and habit boards. It exists because 55 Dataview `FROM` paths pointed at folders that were renamed or deleted (`10_UMN`, `60_Claude/30_Source_Summaries`, `60_Claude/50_Reviews`, `60_Claude/10_Session_Logs`), and Dataview shows a dead path as an empty table with no error, so nobody noticed. A note that explains a folder in prose is a MOC ([[MOC Standard]]). Capability dashboards are [[Field OS Standard]].
## Spec
```json
{
  "family": "dashboard",
  "tier": 1,
  "match": {"type": "dashboard", "kind": null, "path": "^(00_Dashboard\\.md$|60_Claude/(?!05_Clippings/)|10_Areas/|20_Progress/)", "where": {}, "where_not": {}},
  "status": ["active", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "dashboard_kind"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": [],
  "optional_headings": [],
  "legacy_match": [
    {"path": "^60_Claude/44_Indexes/[^/]+\\.md$"},
    {"path": "^60_Claude/([^/]+/)?[^/]*Board\\.md$"},
    {"path": "^10_Areas/Life/(Habits|Enumerate)/[^/]*Board\\.md$"}
  ]
}
```
## Headings
### Frontmatter
`type: dashboard`, `dashboard_kind` (`dashboard`, `board`, or `habit-board`), `status` (`active`, or `archived` once retired), dates, `tags`. A habit board keeps the plugin key `kanban-plugin: board` untouched.
> [!WARNING]
> Typing a query page `evergreen` or `index`. Sixteen of 21 dashboard-like pages are, so a type query for dashboards misses most of them.
### Sections
One `##` per question the page answers, named for the question ("Overdue Drills"). Under it, one sentence says what a row means and what to do about it, then one query. A page with no sentence is a report nobody acts on.
*Density:* one query per section; no static table that Dataview could generate.
### Queries
- Every `FROM` folder exists. Before saving, list each path; a missing folder returns no rows and no error.
- `FROM ""` is allowed only with a `WHERE type =` filter, because it scans the whole vault.
- Lists carry a `LIMIT`. Sort on a frontmatter key defined in [[Frontmatter Standard]].
- Filter on the vocabulary's `type` and `*_kind` values, not on tags a note may not have.
### Boards
A board lists one folder: its `FROM` is that folder and its sections are open items, recent items, and a short workflow line. A board whose body is only prose links is a MOC.
### Habit boards
Kanban lanes are the `##` headings (`Daily`, `Weekly`, `Paused`). Cards are checkboxes; a card that matches a daily floor row names it exactly.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` or `index` with a `dashboard` tag | `dashboard`, `dashboard_kind: dashboard` | mechanical |
| `type: evergreen`, `input_kind: board` in a `60_Claude` folder | `dashboard`, `dashboard_kind: board`, drop `input_kind` | mechanical |
| `tags: ["#dashboard"]` | `[dashboard]` | mechanical |
| `FROM "10_UMN"` | `20_Progress/Degree` or `40_Resources/UMN`, by what the query counts | judgment |
| `FROM` a deleted `30_Source_Summaries`, `50_Reviews`, `10_Session_Logs` | `10_Source_Summaries`, `30_Reviews`, `07_AI_Information/Session Logs` | mechanical, then verify |
| A board that is only prose links (`Plans Board`, `Claude Board`) | `index`, a MOC | judgment |
| `type: dashboard` Session Index and Tool Usage Rollup in `05_Clippings/AI Conversations` (57 notes) | `type: generated`, `gen_kind: index`, per [[Generated Output Standard]] | mechanical |
| `type: dashboard` that is a row log (`Tool log`) | `system`, `system_kind: log`, per [[Logs]] | judgment |
| `type: dashboard` that is a course board in `Previous Classes` | `class`, `class_kind: board` | judgment |
| `status: tree`, `sprout`, `retired` | `active` or `archived` | mechanical |
## Done Conditions
- Every `FROM` path was listed and exists, and the page shows rows or says why it is empty.
- Each section has its question, one sentence, and one query.
- The type is `dashboard` with a valid `dashboard_kind`.
- A retired board is `archived`, not left broken in place.
## Gold Standard Example
[[Capability Dashboard]]: one section per question, each with a sentence and a single query. It predates the new keys (`type: evergreen`), so it shows the section shape, not the frontmatter.
