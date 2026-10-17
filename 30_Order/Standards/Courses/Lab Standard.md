---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-lab
tier: 1
maps_to:
  - "[[Lab Template]]"
used_by:
  - "[[Lab Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4061/Labs/Lab - 3|Lab - 3]]"
notes:
  - "[[Weekly Standard]]"
  - "[[Concept Standard]]"
---
# Lab Standard
==A lab note's real value is its error log: Problem, Fix, Why, Evidence. The same class of error costs an hour the first time and should cost a minute the second.==
This is the standard for a lab note at `<Course>/Labs/Lab - N.md`. A lab is usually low-stakes on its own, so the write-up is not proof that the work happened. It is a personal debugging reference that gets faster to consult each week.
## Spec
```json
{
  "family": "course-lab",
  "tier": 1,
  "match": {"type": "class", "kind": "lab", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list", "deadline": "date"},
  "headings": ["Goal", "Procedure / key steps", "Results", "Errors + fixes"],
  "optional_headings": ["Flashcards"],
  "legacy_match": [
    {"type": "class", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "lab"}, "absent": ["class_kind"]}
  ]
}
```
## Headings
### Frontmatter
`class_kind: lab`, `status: seed` (labs rarely need to mature past it), `area` linking the course Board and the week the lab paired with, optional `deadline` only when sourced, `tags: [class, lab]`, and `next`.
### Goal
What the lab was trying to accomplish, in your own words, not the assignment title. Separate the required behavior from your chosen implementation.
*Density:* one sentence.
> [!WARNING]
> Copying the assignment title as the goal.
### Procedure / key steps
The real sequence, compressed to the decision points: which flag, which config, which command. Enough that redoing the lab from this note alone would work. Record commands, interfaces, and tests from the prompt, starter files, and actual run output.
> [!WARNING]
> A procedure so compressed it skips the decisions that were the point of the lab.
### Results
What actually came out: a number, a passing test suite, a working build, stated plainly. Never claim tests passed without observed output.
*Density:* short and factual.
### Errors + fixes
==The centerpiece.== One entry per real error, however small: *Problem:* the symptom and the smallest reproduction. *Fix:* the change that resolved it. *Why:* the mechanism, so the next error of this class is recognized. *Evidence:* the test or output that proves the fix.
> [!WARNING]
> Recording the fix without the Why. "Added a semicolon" does not help when the same class of error returns in a different form.
### Flashcards
Optional. Only for a reusable debugging pattern, on `#cards/<course-slug>`. After the lab, carry durable discoveries to the week and concept notes. Do not force cards out of mechanical setup.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: lab` | `class_kind: lab` | Mechanical |
| `tags: ["#class", "#Lab"]` | `tags: [class, lab]` | Mechanical |
| Entries with Problem and Fix but no Why or Evidence | Add Why and Evidence from the run output | Judgment |
| Extra `Sources and scope` section | Fold into Goal | Judgment |
| Extra `Practice for Project 2 and exams` section | Link to the concept or exam material; keep one line here | Judgment |
## Done Conditions
- The procedure is detailed enough to redo the lab from the note.
- Every real error has Problem, Fix, Why, and Evidence.
- The goal is in your own words, and results come from observed output.
- Durable discoveries were propagated to the week and concept notes.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4061/Labs/Lab - 3|Lab - 3]]: all four required headings, with a substantive error log and observed results.
