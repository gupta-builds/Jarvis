---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-homework
tier: 1
maps_to:
  - "[[Homework Template]]"
used_by:
  - "[[Homework Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing 1 - Learn the Tools|Writing 1 - Learn the Tools]]"
notes:
  - "[[Project Template]]"
  - "[[Discussion Template]]"
  - "[[Concept Standard]]"
---
# Homework Standard
==A homework note is a reproducible record of the task, the reasoning attempted, the evidence from tests or feedback, and the mistake pattern to carry forward.==
This is the standard for a bounded individual deliverable: a problem set, coding or written assignment, journal entry, short quiz record, or writing assignment. A multi-week artifact with choices uses the project kit, and a discussion reading uses the discussion kit.
## Spec
```json
{
  "family": "course-homework",
  "tier": 1,
  "match": {"type": "class", "kind": "homework", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list", "deadline": "date"},
  "headings": ["Overview", "Requirements", "Work log", "Concepts used"],
  "optional_headings": ["Post-submit reflection"],
  "legacy_match": [
    {"type": "class", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "homework"}, "absent": ["class_kind"]},
    {"type": "input", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {"input_kind": "homework"}}
  ]
}
```
## Headings
### Frontmatter
`class_kind: homework`, `status`, `area` linking the course Board, `deadline` only when sourced, `tags: [class, homework]`, and `next`. Never mark an assignment `complete` because a file exists; complete means the deliverables were submitted or the note records what remains.
### Overview
One to three sentences: what must be produced, for whom, and why. Due date and submission location only when verified. For a problem set, distinguish the written and coding parts and any separate code-review window; the review deadline is not the submission deadline.
### Requirements
The prompt and rubric as a checklist: every deliverable, format, question, proof or test requirement, citation constraint, collaboration rule, and submission step, in the instructor's wording where it affects grading. Split `Must submit`, `Must demonstrate`, and `Must not do` when it prevents confusion. Record the course's collaboration and tool rules here.
> [!WARNING]
> Turning an implied quality expectation into a published requirement. Label estimates as estimates.
### Work log
Attempts in order, but mechanism-rich: what was tried, what happened, the evidence (test output, grader comment, counterexample), the diagnosis, and the next action. For code, name the function and the test; for writing, the thesis, outline, citations, and the feedback that changed them. When submitted, add a `### Submission` with the timestamp, destination, commit or file identifier, and any receipt, never a credential.
> [!WARNING]
> Claiming a test passed without running it, or pasting a large solution when a short explanation and a link will do.
### Concepts used
Concepts actually used or deliberately practiced, each with a line on its role ("A* uses this admissibility condition"). Create or update the concept note through [[Concept Standard]] when the work exposes a reusable mechanism.
### Post-submit reflection
Optional until feedback exists, then filled. The first failure, the underlying pattern, the evidence that revealed it, and the one behavior or test to add next time. Name the kind: knowledge gap, misread requirement, implementation bug, time management, or submission process.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: homework` | `class_kind: homework` | Mechanical |
| `type: input` with `input_kind: homework` | `type: class`, `class_kind: homework` | Judgment |
| `Scoring and Assignment Information` (MATH problem sets) | `Overview` | Judgment |
| Numbered question headings (`## 1.` to `## 14.`, HIST and MATH) | `###` question headings under `Work log` | Judgment |
| `Solutions`, `Written answers`, `Handwritten answers`, `Coding reasoning` | `###` sections under `Work log` | Judgment |
| `Files`, `Files to submit`, `Submission checklist`, `Submission` | `### Submission` under `Work log`, deliverables into `Requirements` | Judgment |
| `Sources and scope`, `Background` | `Overview` or a `###` under `Work log` | Judgment |
| `tags: ["#class", "#Homework"]` | `tags: [class, homework]` | Mechanical |
## Done Conditions
- Requirements are a complete checklist with the rules and secondary deadlines separated.
- Work log entries carry evidence, diagnosis, and a fix or next step.
- Concepts link to real notes and reflect actual use.
- Submission and reflection are recorded once they exist.
- No unsupported claim of passing tests, meeting a rubric, or receiving credit.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4511W/Assignments/Written/Writing 1 - Learn the Tools|Writing 1 - Learn the Tools]]: Overview, Requirements, a work log with decisions, concepts used, and a reflection.
