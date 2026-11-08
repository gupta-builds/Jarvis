---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: field-os
tier: 1
maps_to:
  - "[[Capability Field OS Template]]"
  - "[[Capability Depth Ladder Template]]"
  - "[[Capability Question Bank Template]]"
used_by: []
gold_standard: "[[AI Field OS]]"
notes:
  - "[[Dashboard Standard]]"
  - "[[Capability Dashboard]]"
  - "[[Frontmatter Standard]]"
---
# Field OS Standard
==A track has three pages with three jobs: the Field OS shows its state, the Depth Ladder says what to review at what depth, and the Question Bank holds what is still unknown.==
This is the Standard for the per-track capability pages in `60_Claude/44_Indexes/Field OS/`: five tracks (ai, systems, algorithms, career, trading), three pages each, 15 notes. They read the capability keys on concept notes (`track`, `mastery_level`, `next_drill`) and on question notes (`question_kind`, `question_status`). Other query pages are [[Dashboard Standard]]. If the Capability Engine is retired, this Standard is archived with it.
## Spec
```json
{
  "family": "field-os",
  "tier": 1,
  "match": {"type": "dashboard", "kind": "field-os", "path": "^60_Claude/44_Indexes/Field OS/", "where": {}, "where_not": {}},
  "status": ["active", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "dashboard_kind", "track"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "track": "list", "notes": "list"},
  "headings": ["Capability Summary", "Overdue Drills", "Recent Progress", "Open Questions", "Outputs Produced", "Synthesis Notes", "Navigation"],
  "optional_headings": [],
  "legacy_match": [{"path": "^60_Claude/44_Indexes/Field OS/[^/]*Field OS\\.md$"}]
}
```
```json
{
  "family": "depth-ladder",
  "tier": 1,
  "match": {"type": "dashboard", "kind": "depth-ladder", "path": "^60_Claude/44_Indexes/Field OS/", "where": {}, "where_not": {}},
  "status": ["active", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "dashboard_kind", "track"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "track": "list", "notes": "list"},
  "headings": ["Core Concepts", "Compare and Discriminate", "30-Minute Refresher", "2-Hour Technical Refresher", "Deep Relearning Pass", "Overdue Drills", "All Tracked Concepts"],
  "optional_headings": [],
  "legacy_match": [{"path": "^60_Claude/44_Indexes/Field OS/[^/]*Depth Ladder\\.md$"}]
}
```
```json
{
  "family": "question-bank",
  "tier": 1,
  "match": {"type": "dashboard", "kind": "question-bank", "path": "^60_Claude/44_Indexes/Field OS/", "where": {}, "where_not": {}},
  "status": ["active", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "dashboard_kind", "track"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "track": "list", "notes": "list"},
  "headings": ["Open Questions", "Misconceptions", "Oral Exam Prompts", "Debugging Drills", "Build Prompts", "Resolved Learnings"],
  "optional_headings": [],
  "legacy_match": [{"path": "^60_Claude/44_Indexes/Field OS/[^/]*Question Bank\\.md$"}]
}
```

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/44_Indexes/Field OS/` |
| File name | The track plus the page: `AI Field OS`, `AI Depth Ladder`, `AI Question Bank`. |
| Kind | `type: dashboard` with `dashboard_kind: field-os`, `depth-ladder`, or `question-bank`. |
| Status | `active`; `archived` with the Capability Engine. |
## Headings
### Frontmatter
- **Write:** `type: dashboard`, `dashboard_kind`, `track` (one of ai, systems, algorithms, career, trading), `status: active`, dates, `tags`, and `notes` linking the other two pages.
- **Length:** one line per key.
- **Never:** a `track` missing from frontmatter while the queries hardcode the track name. Changing a page's track then means editing every query.
- **Right:** `- "[[AI Depth Ladder]]"`
- **Wrong:** `status: tree`
### Field OS page sections
- **Write:** `Capability Summary`, `Overdue Drills`, `Recent Progress`, `Open Questions`, `Outputs Produced`, `Synthesis Notes`, then `Navigation` linking the ladder, the bank, and [[Capability Dashboard]]. Each is one query with a `type` filter.
- **Length:** one short sentence if needed and one query per section.
- **Never:** a hardcoded track in the `WHERE`; use `this.track[0]`.
- **Right:** `SORT next_drill ASC`
- **Wrong:** `WHERE type = "concept" AND contains(track, "ai") AND next_drill AND next_drill < date(today)`
### Depth Ladder page sections
- **Write:** `Core Concepts`, `Compare and Discriminate` (a table of Concept A, Concept B, what to clarify), and the three refreshers as hand-picked lists. Only `Overdue Drills` and `All Tracked Concepts` are queries.
- **Length:** a list or table per section.
- **Never:** the track name in a heading ("All Tracked AI Concepts"). The same section in another track then differs by name and the Spec cannot match it.
- **Right:** `| Prompt engineering | Agent orchestration | Prompt engineering shapes a single completion; agent orchestration chains multiple completions with tool use and state. |`
- **Wrong:** `## All Tracked AI Concepts`
### Question Bank page sections
- **Write:** one query per `question_kind` (open, misconception, oral-exam, debugging, build), plus `Resolved Learnings` for `question_status = "resolved"`. A question is added to the bank and promoted to its own note only if it blocks progress across sessions.
- **Length:** one sentence and one query per section.
- **Never:** a separate note for every question.
- **Right:** `Wrong beliefs worth correcting. Each entry should state the incorrect belief and why it's wrong.`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The three pages of a track exist, share a `track`, and link each other | Each page covers one of three jobs | Reader |
| Every query filters on `type`, and every `FROM` folder exists | `FROM ""` scans the whole vault, and a dead path shows nothing | Lint, check 3 (`dead-dataview-from`) |
| The page's headings match its kind's Spec | A track name in a heading breaks the match | Lint, check 2 |
| Overdue Drills returns rows or the page says the track has no dated concepts | An empty table looks like a broken query | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen`, `status: tree`, `tags: [dashboard, capability, field-os]` (all 15) | `type: dashboard`, `status: active`, `dashboard_kind` set from the page, tags `[dashboard, field-os]` | Mechanical |
| No `track` key | `track: [ai]` and so on, from the file name | Mechanical |
| `## All Tracked AI Concepts` | `## All Tracked Concepts` | Mechanical |
| `## Compare and Distinguish` (template stub) | `## Compare and Discriminate` | Mechanical |
| Queries with a hardcoded track | `this.track[0]` in the `WHERE` | Judgment, check in Obsidian |
## Done Conditions
- The three pages of a track exist, share a `track`, and link each other.
- Every query filters on `type`, and every `FROM` folder exists.
- Overdue Drills returns rows or the page says the track has no dated concepts.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[AI Field OS]]: seven sections, one query each, and a Navigation block linking its ladder and bank. It does not pass lint: `type: evergreen`, `status: tree`, no `dashboard_kind` or `track`, and 15 extra blank lines.
Measured 2026-11-07: Field OS 5 notes, Depth Ladder 5, Question Bank 5; none pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| AI Field OS (gold) | `60_Claude/44_Indexes/Field OS/` | Seven sections, one query each | Type, status, `dashboard_kind`, `track` |
| AI Depth Ladder | `60_Claude/44_Indexes/Field OS/` | A contrast table that states each line | Same keys, and the heading `All Tracked AI Concepts` |
| AI Question Bank | `60_Claude/44_Indexes/Field OS/` | One query per question kind | Same keys |
