---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
  - internship
system_kind: standard
family: interview-prep
tier: 1
maps_to:
  - "[[Interview Prep Template]]"
used_by: []
gold_standard: "[[20_Progress/Internship/Preperation/Interviews/ABB Interview Prep]]"
notes:
  - "[[Applying Standard]]"
  - "[[Internship Pipeline]]"
---
# Interview Prep Standard
==An interview prep note turns one job description and your real projects into a spoken plan: what you will say, what you will be asked, and what you will ask.==
This is the content standard for per-company notes in `20_Progress/Internship/Preperation/Interviews/`, created at Pipeline step 8 when a program reaches a phone screen or onsite, and linked from the Applying note's `interview_note`. The generic question bank (`Interview Questions.md`) and the system design drill bank are separate reference notes; pull from the bank, do not copy it here.
## Spec
```json
{
  "family": "interview-prep",
  "tier": 1,
  "match": {"type": "project", "kind": "project", "path": "^20_Progress/Internship/Preperation/Interviews/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^20_Progress/Internship/Preperation/Interviews/(?!Interview Questions).*\\.md$"}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "project_kind", "status", "created", "updated", "tags", "company", "applying", "interview_date", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "applying": "text?", "interview_date": "text?", "next": "text?"},
  "headings": ["Interview Format", "Job Description Analysis", "Elevator Pitch", "Talking Points", "Questions to Prepare For", "Questions to Ask", "After the Interview"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`type: project`, `project_kind: project`, `status` `active` until the interview is done, then `complete`. `applying` links the Applying note.
### Interview Format
What the interviewer said the round will be: length, who, and what to prepare, in their words.
### Job Description Analysis
What the JD repeats and what the intern will actually do, each point mapped to something you built. Say plainly where there is no match.
### Elevator Pitch
The spoken version, under a minute, built on the same pillars as Talking Points.
### Talking Points
Two or three pillars, each backed by a real project: what it was, what you did, what happened. Specific enough that a vague answer would be obvious.
### Questions to Prepare For
Technical and behavioral questions you expect, with your answers in your own words. Link the question bank for the rest.
### Questions to Ask
Two or three real questions about the team's work. Skip questions the careers page answers.
### After the Interview
Written within a day: what was asked, what landed, what did not, and the follow-up sent.
> [!WARNING]
> Debrief notes written into the definition slot of a copied concept template. They disappear into a section nobody opens.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: concept` with `course`, `mastery (1/10)`, `topics` | `type: project`, `project_kind: project`; drop the course keys | mechanical |
| `## Interview` | `## Interview Format` | mechanical |
| Debrief under `## Definition` | Move to `## After the Interview` | judgment |
| `## MOC` and an empty `## Common mistakes` | Remove the links into `notes:`, fold any mistake into Talking Points | judgment |
| H1 copied from another note ("AI Data Analytics") | `Role - Company` | mechanical |
## Done Conditions
- Every heading holds real content from the posting and your projects.
- The Applying note's `interview_note` points here, and `applying` points back.
- `After the Interview` is written within a day of the round.
## Gold Standard Example
[[20_Progress/Internship/Preperation/Interviews/ABB Interview Prep]]: a thorough JD analysis, pitch, talking points, and prepared answers. It uses the older concept-template shape, which the Legacy Shapes table upgrades.
