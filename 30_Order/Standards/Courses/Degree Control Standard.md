---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-control
tier: 2
maps_to:
  - "[[Degree Control Template]]"
used_by:
  - "[[Course Production Workflow]]"
gold_standard: "[[20_Progress/Degree/UMN Board|UMN Board]]"
notes:
  - "[[Board Standard]]"
  - "[[Weekly Board Standard]]"
---
# Degree Control Standard
==Control notes hold the state of the whole degree term and point to course Boards; none of them holds course content.==
This is the standard for the notes at the root of `20_Progress/Degree/` that run the term: seven today (`class_kind: control`). Their shapes differ by role, so only the frontmatter is checked and the heading list is guidance. One course's own control note is [[Board Standard]].
## Spec
```json
{
  "family": "course-control",
  "tier": 2,
  "match": {"type": "class", "kind": "control", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|40_Resources/UMN/The Plan)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": [],
  "optional_headings": ["Purpose", "Map", "Status", "Links"],
  "legacy_match": [
    {"type": "index", "path": "^20_Progress/Degree/(UMN Board|Every Week|Course Production Board.*|_Courses/_Courses Board)\\.md$"},
    {"path": "^20_Progress/Degree/(Fall'26 Syllabus|Hit or Miss - Miss|Repetitive Things)\\.md$"},
    {"type": "class", "path": "^(40_Resources/UMN/Previous Classes|40_Resources/UMN/The Plan)/Spring'26 Syllabus\\.md$"}
  ]
}
```
## Headings
### Roles
Each control note has one role.

| Role | Note today | Holds |
|---|---|---|
| Degree board | `UMN Board` | How the Degree folder works, the map of course Boards, status |
| Calendar | `Every Week` | The master weekly calendar, a quick reference, and known gaps |
| Term syllabus | `Fall'26 Syllabus`, `Spring'26 Syllabus` | Classes, grading, and the path to graduation |
| Dispatch board | `Course Production Board` | Rules and prompts for sessions that produce course notes |
| Missed-work ledger | `Hit or Miss - Miss` | Missed assignments by course |
| Prompt library | `Repetitive Things` | Reusable prompts, including the textbook-extraction prompt |
| Track board | `_Courses Board` | The map of non-degree study tracks |
### Frontmatter
`class_kind: control`, `status`, `notes` (the course Boards and sibling control notes it points to), `next` (the single next action for the whole term). Every control note has frontmatter, including the ledger and the prompt library.
> [!WARNING]
> A control note with no frontmatter, such as `Hit or Miss - Miss`. It then appears in no query.
### Body
Short and dated. Link to a course's Board for any course fact instead of restating it. List known gaps and anomalies explicitly (a midterm date that disagrees across sources) and do not resolve them silently. The dispatch board states the rules that bind every session executing from it and marks each prompt as pending or dispatched. The prompt library names the workflow that uses each prompt.
> [!WARNING]
> Restating a course's grading or schedule here. It goes stale in one place and stays right in the other.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: index`, `tags: [moc]` | `type: class`, `class_kind: control`, `tags: [class, control]` | Mechanical |
| No frontmatter (`Hit or Miss - Miss`, `Repetitive Things`) | Add the frontmatter above | Mechanical |
| `Fall'26 Syllabus` typed `board` with `input_kind: board` | `class_kind: control` | Mechanical |
| `Spring'26 Syllabus` in both `The Plan` and `Previous Classes` | Keep one; the copy is a duplicate | Judgment |
## Done Conditions
- Each control note has frontmatter, one role, and a live `next`.
- No course fact is restated; each is a link to the course Board.
- Known gaps are listed, not resolved by guess.
- The note passes [[Vault Lint]] for `course-control`.
## Gold Standard Example
[[20_Progress/Degree/UMN Board|UMN Board]]: a map of every course Board with a status block. It is still typed `index`, which the Legacy Shapes table retypes.
