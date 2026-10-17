---
type: system
status: sprout
created: 2026-09-20
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-preparation
tier: 1
maps_to:
  - "[[Preparation Template]]"
used_by:
  - "[[Preparation Workflow]]"
gold_standard: "[[20_Progress/Degree/CSCI 5304/Preparation|CSCI 5304 Preparation]]"
notes:
  - "[[Board Standard]]"
  - "[[Exam Standard]]"
---
# Preparation Standard
==A preparation note turns the course's grading structure and schedule into recurring behaviors, each with a trigger, a time budget, and a visible definition of done.==
This is the standard for the one operating note of a course (`class_kind: preparation`). The Board records verified course facts; Preparation says how those facts change the week. It is not a motivational essay and does not repeat the Board's schedule. Six of seven preparation notes already share the headings below, so they are the contract.
## Spec
```json
{
  "family": "course-preparation",
  "tier": 1,
  "match": {"type": "class", "kind": "preparation", "path": "^(20_Progress/Degree|40_Resources/UMN/Previous Classes|10_Areas/Notes)/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "area", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "area": "list", "deadline": "date?"},
  "headings": ["Where the Points Actually Are", "Cheapest Points", "The Real Traps", "Study Cadence", "Weekly Study Plan", "Open Question"],
  "optional_headings": ["Must-Do Habits", "Common Mistakes / Traps", "Professor-Specific Notes", "Week-by-Week Instructions"],
  "legacy_match": [
    {"type": "class", "where": {"input_kind": "preparation"}, "absent": ["class_kind"]}
  ]
}
```
## Headings
### Frontmatter
`class_kind: preparation`, `status: seed` until the grading structure is verified, then `sprout`. `area` links the course Board. `tags: [class, preparation]`. Link every high-leverage claim to the Board or an assessment note, and label estimated hours as estimates.
### Where the Points Actually Are
Rank assessments by verified weight, frequency, difficulty, and failure cost, and show the arithmetic. Include hidden deadlines such as code reviews, discussion participation, and note limits. Never generalize one assessment's rules to another.
> [!WARNING]
> Ranking by intuition. A heavy-feeling assignment worth 5% outranks a quiz series worth 30%.
### Cheapest Points
The credit that costs the least effort per point: attendance, surveys, easy quizzes, extra credit.
### The Real Traps
Course-specific failure modes sourced from the Board, assignment prompts, lecture corrections, and grading feedback. Rule collisions, missing secondary deadlines, likely misreadings.
### Study Cadence
A realistic recurring week from the actual meeting and due-date schedule: pre-lecture reading, live lecture capture, discussion, assignment work, textbook and concept notes, review, flashcards, buffer. Each habit has a trigger and a done condition.
### Weekly Study Plan
The plan for the weeks ahead, anchored to dates. Before a major assessment, a backward plan instead of "study more".
### Open Question
What is still unverified, and the source that would settle it.
### Optional headings
`Must-Do Habits` and `Common Mistakes / Traps` when the course needs a longer list than Cadence and Traps hold; `Professor-Specific Notes` labeled `Verified`, `Observed repeatedly`, `Inferred`, or `Ask`; `Week-by-Week Instructions` when a project or lab needs an instructional map.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: preparation` | `class_kind: preparation` | Mechanical |
| `tags: ["#class"]` | `tags: [class, preparation]` | Mechanical |
| Old Standard names: `Grading Leverage`, `Time Budget` | `Where the Points Actually Are`, `Study Cadence` | Mechanical |
| `Must-Do Habits` as a required section | Keep as an optional heading | None |
| Personal preparation syllabus (Technical Interview `Preparation & Sources`) | Governed by [[Self-Study Track Standard]]; keep as a track companion | Judgment |
| Empty `Preperation.md` copies | Delete or fill after confirming nothing links to them | Judgment |
## Done Conditions
- Priority follows verified grading leverage, not intuition.
- Habits have triggers and done conditions, and estimates are labeled.
- Traps and professor-specific facts are sourced.
- The note produces observable action, not encouragement.
- The note passes [[Vault Lint]] for `course-preparation`.
## Gold Standard Example
[[20_Progress/Degree/CSCI 5304/Preparation|CSCI 5304 Preparation]]: all six headings in order. It still carries `input_kind` and a hash tag, which the Legacy Shapes table maps.
