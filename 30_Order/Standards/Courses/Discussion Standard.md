---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-discussion
tier: 1
maps_to:
  - "[[Discussion Template]]"
used_by:
  - "[[Discussion Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 4511W/Discussion/Discussion 1 — Turing 1950|Discussion 1]]"
notes:
  - "[[Weekly Standard]]"
  - "[[Homework Standard]]"
---
# Discussion Standard
==A discussion note keeps the reasoning that changed during the conversation (claims, evidence, objections, decisions), not a transcript of who spoke.==
This is the standard for a note on one discussion section, paper discussion, or reading conversation (`class_kind: discussion`). It matters most in reading-based and writing-intensive courses, where the interpretation and questions are not in the lecture or the textbook.
## Spec
```json
{
  "family": "course-discussion",
  "tier": 1,
  "match": {"type": "class", "kind": "discussion", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list"},
  "headings": ["Pre-work", "Notes", "Action items"],
  "optional_headings": ["Primary-source check and review distinctions", "Flashcards"],
  "legacy_match": [
    {"type": "class", "where": {"input_kind": "discussion"}, "absent": ["class_kind"]}
  ]
}
```
## Headings
### Frontmatter
`class_kind: discussion`, `status: seed`, `tags: [class, discussion]`. `area` links the course Board and the week, reading, or assignment it belongs to. Record the date and section in the title or Pre-work. `next` names one concrete follow-up.
### Pre-work
What had to be read or prepared, as links, and the questions that were live before the discussion. Name the source of the discussion material: personal notes, a permitted transcript, a handout, or an instructor clarification. If pre-work was not available, say so.
> [!WARNING]
> Inventing a preparation task from the topic, or presenting an agent's reconstruction as something said in the room.
### Notes
Organized by claim or question, not by minute. For each point: the claim, the evidence or example, an objection or limit, the correction if one happened, and the consequence for a concept, assignment, or paper. Separate `Instructor clarification`, `Student interpretation`, and `Unresolved` when their authority differs. Attribute a speaker only when it matters and is verified.
*Density:* reasoning and corrections, quoted sparingly.
### Action items
Task checkboxes only for real work the discussion created, each with a done condition. When done, check it and record the change in the note it touched.
### Primary-source check and review distinctions
Optional. Where the discussion sharpened what a reading says versus what a student believed it said.
### Flashcards
Optional. Only for a distinction worth recalling, on `#cards/<course-slug>`.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: discussion` | `class_kind: discussion` | Mechanical |
| `tags: ["#class", "#Discussion"]` | `tags: [class, discussion]` | Mechanical |
| Reply-thread variant (`The Prompt`, `Student's reply`, `My Response`; HIST 1103 `Assignment - N`) | Put the prompt, the reply, and the response as `###` sections under `Notes` | Judgment |
| One note holding many discussions (`Small Group Assignments`) | Keep as is until a discussion is reused; new discussions get their own note | Judgment |
| Discussion with no `Pre-work` | Add it from the assigned reading | Judgment |
## Done Conditions
- Pre-work is linked and the real task is clear.
- Notes hold reasoning, evidence, objections, and corrections.
- Unresolved questions are explicit and actionable.
- Durable claims were carried to the concept, weekly, or writing note, with a link back.
- The note passes [[Vault Lint]] for `course-discussion`.
## Gold Standard Example
[[20_Progress/Degree/CSCI 4511W/Discussion/Discussion 1 — Turing 1950|Discussion 1]] (the Turing 1950 discussion): Pre-work, Notes, a primary-source check, Flashcards, and Action items. It still uses `input_kind` and hash tags, which the Legacy Shapes table maps.
