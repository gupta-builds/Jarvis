---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: dashboard
tier: 1
maps_to:
  - "[[Dashboard Template]]"
used_by: []
gold_standard: "[[Capability Dashboard]]"
notes:
  - "[[MOC Standard]]"
  - "[[Field OS Standard]]"
  - "[[Jarvis Writing and Formatting]]"
---
# Dashboard Standard
==A dashboard answers a question with a live query, so every query must read a folder that exists today and must say what to do with its rows.==
This is the Standard for `type: dashboard` notes: query dashboards, boards (a query listing a folder), and habit boards. It is not a MOC, which explains a folder in prose ([[MOC Standard]]), and it is not a per-track capability page ([[Field OS Standard]]). It exists because Dataview shows a dead `FROM` path as an empty table with no error, so renamed or deleted folders went unnoticed.
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
  "optional_headings": ["Open Items", "Recently Updated"],
  "legacy_match": [
    {"path": "^60_Claude/44_Indexes/[^/]+\\.md$"},
    {"path": "^60_Claude/([^/]+/)?[^/]*Board\\.md$"},
    {"path": "^10_Areas/Life/(Habits|Enumerate)/[^/]*Board\\.md$"}
  ]
}
```

| Item | Rule |
|---|---|
| Allowed folders | `00_Dashboard.md`, anywhere under `60_Claude/` except `05_Clippings/`, `10_Areas/`, or `20_Progress/`. |
| File name | The question or the folder plus `Dashboard` or `Board` (`Capability Dashboard`). Unique in the vault. |
| Kind | `type: dashboard` with `dashboard_kind`: `dashboard`, `board`, or `habit-board`. |
| Status | `active`, or `archived` once retired. A retired board is archived, not left broken in place. |
## Headings
The headings are not enforced: one `##` per question the page answers.
### Frontmatter
- **Write:** `type: dashboard`, `dashboard_kind`, `status`, dates, `tags`. A habit board keeps the plugin key `kanban-plugin: board` untouched.
- **Length:** one line per key.
- **Never:** a query page typed `evergreen` or `index`. Ten of the 96 are, and none of the 96 has `dashboard_kind`, so a type query misses most of them.
- **Right:** `type: dashboard`
- **Wrong:** `type: evergreen`
### Sections
- **Write:** one `##` per question the page answers, named for the question. Under it, one sentence says what a row means and what to do about it, then one query.
- **Length:** one sentence and one query per section.
- **Never:** a section with no sentence. It is a report nobody acts on. A static table that Dataview could generate is also out.
- **Right:** `How many concepts sit at each mastery level.`
- **Wrong:** None seen.
### Queries
- **Write:** every `FROM` folder exists. Lists carry a `LIMIT`. Sort on a frontmatter key defined in [[Frontmatter Standard]]. Filter on the vocabulary's `type` and `*_kind` values, not on tags a note may not have. `FROM ""` only with a `WHERE type =` filter.
- **Length:** one query per section.
- **Never:** a `FROM` path to a folder that was renamed or deleted.
- **Right:** `WHERE type = "concept" AND track AND mastery_level`
- **Wrong:** `FROM "10_UMN"`
### Boards
- **Write:** a board lists one folder: its `FROM` is that folder, and its sections are open items, recent items, and a short workflow line.
- **Length:** two or three sections.
- **Never:** a board whose body is only prose links. That is a MOC.
- **Right:** None yet.
- **Wrong:** None seen.
### Habit boards
- **Write:** Kanban lanes are the `##` headings (`Daily`, `Weekly`, `Paused`). Cards are checkboxes; a card that matches a daily floor row names it exactly.
- **Length:** one card per habit.
- **Never:** a lane named for a term.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `type: dashboard`, `dashboard_kind`, and a status of `active` or `archived` | The vocabulary has no `tree` or `sprout` for a dashboard | Lint, check 1 |
| Every `FROM` folder exists; list each path before saving | A dead path returns no rows and no error | Lint, check 3 (`dead-dataview-from`) |
| `FROM ""` appears only with a `WHERE type =` filter | It scans the whole vault | Reader |
| Lists carry a `LIMIT` | An unbounded list slows the page | Reader |
| A retired board is `archived` | A broken board left in place misleads | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` or `index` with a `dashboard` tag (10 notes) | `dashboard`, `dashboard_kind: dashboard` | Mechanical |
| `type: dashboard` with no `dashboard_kind` (all 86) | Add the kind | Mechanical |
| `type: evergreen`, `input_kind: board` in a `60_Claude` folder | `dashboard`, `dashboard_kind: board`, drop `input_kind` | Mechanical |
| `tags: ["#dashboard"]` | `[dashboard]` | Mechanical |
| `FROM "10_UMN"` | `20_Progress/Degree` or `40_Resources/UMN`, by what the query counts | Judgment |
| `FROM` a deleted `30_Source_Summaries`, `50_Reviews`, `10_Session_Logs` | `10_Source_Summaries`, `30_Reviews`, `07_AI_Information/Session Logs` | Mechanical, then verify |
| A board that is only prose links (`Plans Board`, `Claude Board`) | `index`, a MOC | Judgment |
| `type: dashboard` Session Index and Tool Usage Rollup in `05_Clippings/AI Conversations` | `type: generated`, `gen_kind: index`, per [[Generated Output Standard]] | Mechanical |
| `type: dashboard` that is a row log (`Tool log`) | `system`, `system_kind: log`, per [[Logs]] | Judgment |
| `type: dashboard` that is a course board in `Previous Classes` | `class`, `class_kind: board` | Judgment |
| `status: tree`, `sprout`, `retired` | `active` or `archived` | Mechanical |
## Done Conditions
- Every `FROM` path was listed and exists, and the page shows rows or says why it is empty.
- Each section has its question, one sentence, and one query.
- The type is `dashboard` with a valid `dashboard_kind`.
- A retired board is `archived`, not left broken in place.
- The note passes [[Vault Lint]] for the `dashboard` family.
## Gold Standard Example
[[Capability Dashboard]]: one section per question, each with a sentence and a single query. It does not pass lint: it is typed `evergreen` with `status: tree` and has no `dashboard_kind`.
Measured 2026-11-07 with `--family dashboard`: 96 notes, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Capability Dashboard (gold) | `60_Claude/44_Indexes/` | Question, sentence, query per section | `type`, `status`, `dashboard_kind` |
| Internship - Dashboard | `10_Areas/Career/Internships/Tracker/` | Live queries | `dashboard_kind`, one dead link, one dead `FROM` |
| Habit Scorecard Board | `10_Areas/Life/Habits/` | A habit board | `dashboard_kind`, blank lines |
