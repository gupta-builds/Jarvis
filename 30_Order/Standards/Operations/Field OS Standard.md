---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: field-os
tier: 1
maps_to:
  - "[[Field OS Template]]"
  - "[[Depth Ladder Template]]"
  - "[[Question Bank Template]]"
used_by: []
gold_standard: "[[AI Field OS]]"
notes:
  - "[[Dashboard Standard]]"
  - "[[Capability Dashboard]]"
  - "[[Frontmatter Standard]]"
---
# Field OS Standard
==A track has three pages with three jobs: the Field OS shows its state, the Depth Ladder says what to review at what depth, and the Question Bank holds what is still unknown.==
This is the Standard for the per-track capability pages in `60_Claude/44_Indexes/Field OS/`: five tracks (ai, systems, algorithms, career, trading), three pages each, 15 notes. They read the capability keys on concept notes (`track`, `mastery_level`, `next_drill`) and on question notes (`question_kind`, `question_status`). If the Capability Engine is retired, this Standard is archived with it. Other query pages are [[Dashboard Standard]].
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
## Headings
### Frontmatter
`type: dashboard`, `dashboard_kind` (`field-os`, `depth-ladder`, or `question-bank`), `track` (one of ai, systems, algorithms, career, trading), `status: active`, dates, `tags`, `notes` linking the other two pages.
> [!WARNING]
> A `track` missing from frontmatter while the queries hardcode the track name. Changing a page's track then means editing every query.
### Field OS
One section per signal: tracked concepts, overdue drills, recent progress, open questions, outputs, synthesis notes, then `Navigation` linking the ladder, the bank, and [[Capability Dashboard]]. Each is one query with a `type` filter.
### Depth Ladder
`Core Concepts`, `Compare and Discriminate` (a table of Concept A, Concept B, what to clarify), and the three refreshers are hand-picked lists. Only `Overdue Drills` and `All Tracked Concepts` are queries.
*Density:* every contrast row states the line between the pair.
> [!WARNING]
> Putting the track name in a heading ("All Tracked AI Concepts"). The same section in another track then differs by name and the spec cannot match it.
### Question Bank
One query per `question_kind` (open, misconception, oral-exam, debugging, build), plus `Resolved Learnings` for `question_status = "resolved"`. Add a question to the bank; promote it to its own note only if it blocks progress across sessions.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen`, `status: tree`, `tags: [dashboard, capability, field-os]` | `type: dashboard`, `status: active`, `dashboard_kind` set from the page, tags `[dashboard, field-os]` | mechanical |
| No `track` key | `track: [ai]` and so on, from the file name | mechanical |
| `## All Tracked AI Concepts` | `## All Tracked Concepts` | mechanical |
| `## Compare and Distinguish` (template stub) | `## Compare and Discriminate` | mechanical |
| Queries with a hardcoded track | `this.track[0]` in the `WHERE` | judgment, check in Obsidian |
## Done Conditions
- The three pages of a track exist, share a `track`, and link each other.
- Every query filters on `type`, and every `FROM` folder exists.
- Overdue Drills returns rows or the page says the track has no dated concepts.
## Gold Standard Example
[[AI Field OS]]: all seven sections, one query each, and a Navigation block linking its ladder and bank. It still has the old `type: evergreen` and no `track` key.
