---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-subboard
tier: 1
maps_to:
  - "[[Weekly Board Template]]"
used_by:
  - "[[Weekly Board Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Concepts/Concepts Board|Concepts Board]]"
notes:
  - "[[Weekly Standard]]"
  - "[[Board Standard]]"
  - "[[MOC Standard]]"
---
# Weekly Board Standard
==A sub-board is a course layer's index and freshness check: it points to the notes of that layer and never replaces them.==
This is the standard for the index of one layer inside a course (`class_kind: subboard`): the Weekly Board, Concepts Board, Project Board, and Readings Log. They are small maps with the shape of a MOC ([[MOC Standard]]), but they live in the course and are typed `class` so they stay with the course notes. The course's single control note is [[Board Standard]]; the content of a week is [[Weekly Standard]].
## Spec
```json
{
  "family": "course-subboard",
  "tier": 1,
  "match": {"type": "class", "kind": "subboard", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Purpose", "Map", "Status"],
  "optional_headings": ["Dataview", "Links"],
  "legacy_match": [
    {"type": "index", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/.*(Weekly Board|Concepts Board|Concept Board|Project - [0-9]+ Board|Readings Log)\\.md$"}
  ]
}
```
## Headings
### Frontmatter
`class_kind: subboard`, `tags: [class, subboard]`. `notes` starts with the course [[Board Standard|Board]], then the layer's own entry points. `next` names the earliest incomplete item and the exact missing source or action. A sub-board typed `index` is claimed by the `moc` family; retype it to `class` when the course is touched.
### Purpose
Name the course Board this index serves, the layer it indexes, and what belongs in the notes it points to instead.
*Density:* two sentences.
### Map
One entry per item, in order, each a real link plus one sentence on what it covers and how it connects to the previous item. For the Weekly Board, one entry per expected week, including holidays, exams, split weeks (keep names like `Week - 1 & 2`), and weeks awaiting capture. Do not write a second lecture summary here.
> [!WARNING]
> A bare list of links. A link with no sentence is a Dataview query written by hand.
### Status
Whether the layer is ahead, current, behind, or blocked; the earliest incomplete item; and the exact missing source or action. A weekly layer is `current` only when each recent week has its lecture capture reconciled against the textbook and sources, not because a stub exists. Take each week's state from its own lifecycle: pre-lecture scaffold, live capture pending, captured, reconciled, review-ready.
### Dataview
Optional, at the bottom. Replace the folder path with the course's real folder and check that the query returns the intended notes. During migration filter on both keys, for example `WHERE class_kind = "week" OR input_kind = "lecture"`.
> [!WARNING]
> A `FROM` path to a folder that moved. The table then renders empty and looks like a layer with no notes.
### Links
Optional. Adjacent folders and notes that did not fit the Map.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: index`, `tags: [moc]` | `type: class`, `class_kind: subboard`, `tags: [class, subboard]` | Mechanical |
| No `Purpose` heading (Weekly Boards of CSCI 4061, 4511W, 4521, 5304) | Add `Purpose` | Judgment |
| `Task Status`, `Deadline and Logistics`, `Final Submission Checklist` on a Project Board | Fold into `Status`, keep the checklist as a task list under it | Judgment |
| Dataview filtering `input_kind = "lecture"` only | Add `OR class_kind = "week"` | Mechanical |
| Textbook Map typed `index` | Governed by [[Textbook Map Standard]] | None |
| Empty board (0 words) | Fill from the Template or delete after confirming nothing links to it | Judgment |
## Done Conditions
- Every expected item appears once and links to a real note with a useful sentence.
- Missing capture, source, and reconciliation work are visible in Status.
- The board never duplicates detailed content from the notes it indexes.
- Its Dataview query, if present, points at the correct folder and returns rows.
- The note passes [[Vault Lint]] for `course-subboard`.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Concepts/Concepts Board|Concepts Board]]: Purpose, Map, Status, and Dataview in order. It is still typed `index`, which the Legacy Shapes table retypes.
