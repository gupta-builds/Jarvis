---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-textbook-map
tier: 1
maps_to:
  - "[[Textbook Map Template]]"
used_by:
  - "[[Textbook Map Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]"
notes:
  - "[[Textbook Standard]]"
  - "[[Weekly Standard]]"
---
# Textbook Map Standard
==The textbook map is a navigation and coverage ledger, not a place to hide chapter summaries.==
This is the standard for the one map per course at `<Course>/Textbook/Textbook Map.md`. It answers which source sections belong to the course, which chapter notes exist, what is next, and where the schedule or the source is incomplete. Chapter content lives in the chapter notes of [[Textbook Standard]].
## Spec
```json
{
  "family": "course-textbook-map",
  "tier": 1,
  "match": {"type": "class", "kind": "textbook-map", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["Purpose", "Map", "Status"],
  "optional_headings": ["Dataview"],
  "legacy_match": [
    {"type": "class", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "textbook"}, "absent": ["class_kind"]},
    {"type": "index", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes)/.*Textbook Map\\.md$"}
  ]
}
```
## Headings
### Frontmatter
`class_kind: textbook-map`, `status`, `area` linking the course Board, `tags: [class, textbook]`, and `next` naming the next production step.
### Purpose
Name the authoritative textbook or source, its edition and local location, and the mapping rule used (chapter, module, week, or assignment). When a course uses several books or a standalone paper, distinguish them. Do not imply a local PDF is assigned unless the Board or syllabus confirms it.
> [!WARNING]
> Putting a chapter summary here instead of the mapping rule.
### Map
One row or bullet per assigned section: the source section, a path-qualified link to its chapter note, the week or lecture it supports, the verified reading date, and a status of `not started`, `prepared`, `captured`, `reconciled`, or `needs review`. A chapter that spans weeks keeps one canonical note. A section used by lecture but absent from the schedule is added as `source-discovered` and flagged for verification. Preserve source gaps.
*Density:* one entry per section, navigation only.
### Status
Coverage in a few lines: notes created, awaiting NotebookLM output, awaiting arrangement, awaiting lecture reconciliation, and unresolved source or schedule questions. It should make the next production step obvious.
### Dataview
Optional, at the bottom. Query the real course folder with `class_kind = "textbook"`. Never a guessed folder.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: textbook` | `class_kind: textbook-map` | Mechanical |
| `type: index` with `tags: [moc]` | `type: class`, `class_kind: textbook-map` | Mechanical |
| A `##` heading per book title or part (CSCI 4061, 4511W, 5304) | Rows inside `Map`, grouped by book | Judgment |
| `Standard`, `Chapter Notes`, `Methodology`, `Correction (date)` | Fold into `Purpose`, `Map`, or `Status`; dated corrections go in `Status` | Judgment |
| Dataview with `input_kind = "book"` | `class_kind = "textbook"` | Mechanical |
## Done Conditions
- Every assigned source section has one map entry with a verified link.
- Reading dates and unresolved gaps are visible.
- The map holds navigation and status only, with no duplicated chapter prose.
- The Dataview path, if present, is the real folder.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4521/Textbook/Textbook Map|Textbook Map]]: Purpose, a verified Map table with status per row, Status, and a Dataview. It still carries `type: index`, which the Legacy Shapes table rewrites.
