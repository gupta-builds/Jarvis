---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-21
tags:
  - system
  - standards
  - internship
system_kind: standard
family: interview-prep
tier: 1
maps_to:
  - "[[Internship Interview Prep Template]]"
used_by: []
gold_standard: "[[20_Progress/Internship/Preperation/Interviews/ABB Interview Prep]]"
notes:
  - "[[Applying Standard]]"
  - "[[Internship Tracker Standard]]"
  - "[[Internship Pipeline]]"
---
# Interview Prep Standard
==An interview prep note turns one job description and your real projects into a spoken plan: what you will say, what you will be asked, and what you will ask.==
This is the Standard for per-company notes in `20_Progress/Internship/Preperation/Interviews/`, made when an interview is booked and linked from the Applying note's `interview_note`. An agent drafts the job description analysis and the questions to expect; Anant writes the pitch, the talking points and every answer himself, so no claim in them is invented. It is not the generic question bank (`Interview Questions.md`) or the system design drill bank: pull from the bank, do not copy it here. Prep notes are private: the ignore rule is pending. Only one prep note exists and it is in the old shape, so its lines below are Wrong examples and the Right lines are its real content.
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Internship/Preperation/Interviews/` (the folder name is spelled as it exists). |
| File name | `Company Interview Prep` (`ABB Interview Prep`). The title line is `Role - Company`. |
| Kind | `type: project` with `project_kind: project`. |
| Status | `active` until the interview is done, then `complete`. |
## Headings
Paths in the Right and Wrong lines start at `20_Progress/Internship/Preperation/Interviews/`.
### Frontmatter
- **Write:** `project_kind: project`, `applying` (links the Applying note), `company`, `interview_date`, `next`.
- **Length:** one line per key.
- **Never:** course keys (`course`, `mastery (1/10)`, `topics`). A prep note copied from the concept template carries them.
- **Right:** None yet.
- **Wrong:** `mastery (1/10): 0` (`ABB Interview Prep.md`)
### Interview Format
- **Write:** what the interviewer said the round will be: length, who, and what to prepare, in their words. Also update the Tracker's `Interview Steps`.
- **Length:** two to four sentences.
- **Never:** the heading `Interview`, or a verdict on how it went.
- **Right:** `- In this first interview, please prepare a short intro about yourself and present relevant experiences in AI for about 15-20min.` (`ABB Interview Prep.md`)
- **Wrong:** `## Interview` (`ABB Interview Prep.md`)
### Job Description Analysis
- **Write:** what the job description repeats and what the intern will actually do, each point mapped to something you built. Say plainly where there is no match. An agent may draft this.
- **Length:** a repeated-themes list and a duties list.
- **Never:** a job description pasted without mapping.
- **Right:** `- apply **Generative AI techniques**` (`ABB Interview Prep.md`)
- **Wrong:** None seen.
### Elevator Pitch
- **Write:** the spoken version, built on the same pillars as Talking Points. Anant writes it.
- **Length:** under a minute spoken; four short paragraphs.
- **Never:** a pitch that names no project.
- **Right:** `Hi, my name is Anant and I’m a Computer Science student at the University of Minnesota` (`ABB Interview Prep.md`)
- **Wrong:** None seen.
### Talking Points
- **Write:** two or three pillars, each backed by a real project: what it was, what you did, what happened.
- **Length:** three pillars, a short sub-list each.
- **Never:** a pillar without a project.
- **Right:** `1. Pillar 1 - Data pipelines: From BOOM research.` (`ABB Interview Prep.md`)
- **Wrong:** None seen.
### Questions to Prepare For
- **Write:** technical and behavioral questions you expect, with your answers in your own words. An agent may list the questions; link the question bank for the rest.
- **Length:** one answer of a short paragraph per question.
- **Never:** an unanswered question.
- **Right:** `- [ ] Why ABB?` (`ABB Interview Prep.md`)
- **Wrong:** `- [ ] What motivates you?` (`ABB Interview Prep.md`)
### Questions to Ask
- **Write:** two or three real questions about the team's work. Skip questions the careers page answers.
- **Length:** two or three.
- **Never:** a question the careers page answers.
- **Right:** `- What kinds of datasets does the team typically work with when developing AI solutions for robotics?` (`ABB Interview Prep.md`)
- **Wrong:** None seen.
### After the Interview
- **Write:** written within a day: what was asked, what landed, what did not, and the follow-up sent.
- **Length:** a short block.
- **Never:** debrief notes written into the definition slot of a copied concept template, where nobody opens them.
- **Right:** None yet.
- **Wrong:** `- Overall the interview went well. I impressed the interviewer by talking about AI in a very technical manner.` (`ABB Interview Prep.md`)
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The seven headings appear in order and none is empty | The prep is read in order before the call | Lint, check 2 |
| `type: project`, `project_kind: project`, no course keys | A prep note is work in flight, not a study note | Lint, check 1 |
| The Applying note's `interview_note` points here, and `applying` points back | The two notes must reach each other | Lint, check 3 (when set) |
| The pitch, talking points and answers are Anant's own words; an agent drafts only the analysis and the question list | A claim an agent invented is a claim Anant must defend | Reader |
| `After the Interview` is written within a day | A debrief written later is memory, not record | Reader |
| The title line is `Role - Company` | A copied H1 ("AI Data Analytics") hides which company | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: concept` with `course`, `mastery (1/10)`, `topics` | `type: project`, `project_kind: project`; drop the course keys | Mechanical |
| `## Interview` | `## Interview Format` | Mechanical |
| Debrief under `## Definition` | Move to `## After the Interview` | Judgment |
| `## MOC` and an empty `## Common mistakes` | Remove the links into `notes:`, fold any mistake into Talking Points | Judgment |
| H1 copied from another note ("AI Data Analytics") | `Role - Company` | Mechanical |
## Done Conditions
- Every heading holds real content from the posting and your projects.
- The Applying note's `interview_note` points here, and `applying` points back.
- `After the Interview` is written within a day of the round.
- The note passes [[Vault Lint]] for `interview-prep`.
## Gold Standard Example
[[20_Progress/Internship/Preperation/Interviews/ABB Interview Prep]]: a thorough job description analysis, a four-paragraph pitch, three talking-point pillars and prepared answers. It does not pass lint and is not in this family: it is typed `concept`, with `course`, `mastery (1/10)` and `topics`.
Measured 2026-11-21 with `--family interview-prep`: 0 notes. ABB Interview Prep matches `technical-concept` instead.
