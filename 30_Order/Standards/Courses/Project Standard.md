---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-project
tier: 1
maps_to:
  - "[[Project Template]]"
used_by:
  - "[[Projects Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]"
notes:
  - "[[Lab Standard]]"
  - "[[Homework Standard]]"
  - "[[30_Order/Standards/Project Standard|Project Standard (20_Progress)]]"
---
# Project Standard
==A course project note records the real decision and the real mechanism, specific enough to rebuild the work from the note alone.==
This is the standard for a bounded, graded course project (`class_kind: project`): midterm, final, and multi-week builds. It is not the ongoing-project standard in [[30_Order/Standards/Project Standard|20_Progress Project Standard]], which tracks a live personal project. The real project is a small set of notes: the main note below, plus companions (the code walkthrough, oral-exam drills, a report, or one note per option).
## Spec
```json
{
  "family": "course-project",
  "tier": 1,
  "match": {"type": "class", "kind": "project", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {"project_role": "companion"}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list", "related": "list", "deadline": "date"},
  "headings": ["Overview", "Concept Links", "Work Log", "Post-Submit Reflection"],
  "optional_headings": ["Project Options", "Chosen Project", "Submission"],
  "legacy_match": [
    {"type": "class", "where": {"input_kind": "project"}, "absent": ["class_kind"]}
  ]
}
```
```json
{
  "family": "course-project-companion",
  "tier": 2,
  "match": {"type": "class", "kind": "project", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"project_role": "companion"}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "project_role", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": [],
  "optional_headings": [],
  "legacy_match": [
    {"type": "class", "path": "(Project - [0-9]+ (Code|Oral Exam Drills)|Final Project Report( - Revised)?|Maze Project Details|(Maze|AVL Tree|Red Black Tree|Multiway Search Tree|Heuristic Pathfinding|Network Flow) Project)\\.md$", "where": {"input_kind": "project"}, "absent": ["class_kind"]}
  ]
}
```
## Headings
### Frontmatter
`class_kind: project`, `status: seed` while building and `sprout` once Chosen Project and Concept Links are filled. `area` links the course Board; `deadline` only from a source; `related` (optional) lists the week and chapter notes, path-qualified because week numbers collide across courses. `tags: [class, project]`. A companion note adds `project_role: companion`, is not heading-checked, and links back to the main note.
> [!WARNING]
> A bare `[[Week - 11]]` in `related`. Verify which course's Week 11 it is.
### Overview
One to three sentences: what the deliverable requires and the shared scaffold or constraints every option builds from.
> [!WARNING]
> Restating the assignment title.
### Project Options
Optional, for assignments that offer a choice. One `###` per option: what it does, the techniques it uses, the starting files, and its references. Mark the chosen one `(chosen)`. Document the rejected options too: they make the choice legible later (CSCI 4041's Final Project documents Maze, Heuristic Pathfinding, and Network Flow).
### Chosen Project
Optional. The mechanism that makes the chosen work succeed: data model, parameters, invariants, algorithm flow, tests, and outputs, precise enough to rebuild without opening the code. Name the actual numbers and test data.
> [!WARNING]
> A summary that would describe any implementation of the algorithm.
### Concept Links
Verified links to the concept, week, and textbook notes the project actually used. Four to eight, matching what the mechanism discusses.
### Work Log
Dated, evidence-backed milestones and failures as they happen, never a plan written afterward.
### Submission
Optional. Submission method, required reviews, and what was actually submitted.
### Post-Submit Reflection
Written within a day or two of submitting: what failed first and what pattern would repeat on the next project. Two to four honest bullets.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: project` | `class_kind: project` | Mechanical |
| `tags: ["#class", "#Project"]` | `tags: [class, project]` | Mechanical |
| Code walkthrough, oral-exam drills, report, or option note (`Project - 1 Code`, `Project - 1 Oral Exam Drills`, `Final Project Report`, `AVL Tree Project`) | Add `project_role: companion` and a link to the main note | Mechanical |
| `Plan`, `Concepts used`, `Implementation` | `Chosen Project`, `Concept Links` | Judgment |
| `Project Options` and `Chosen Project` missing on a choice-based project | Add them from the assignment text | Judgment |
| Spec copy followed by an untouched template tail | Fill Work Log and Reflection or drop the tail | Judgment |
| Non-course notes typed project (`AIIS` club note, `HackerRank Practice Test Prompt`) | Retype as `reference` or move to the track | Judgment |
## Done Conditions
- Every option the assignment offered is documented when there was a choice.
- Chosen Project names real parameters, invariants, and test data.
- Concept Links resolve and were genuinely used.
- Post-Submit Reflection was written close to submission.
- The note passes [[Vault Lint]] for `course-project`.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]: Overview, Submission rules, Concept Links, Work Log, and Post-Submit Reflection around a copied spec. It still carries `input_kind`, hash tags, and no `Project Options`, which the Legacy Shapes table covers.
