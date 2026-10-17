---
type: system
status: sprout
created: 2026-09-04
updated: 2026-10-16
tags:
  - system
  - standards
  - internship
system_kind: standard
family: internship-applying
tier: 1
maps_to:
  - "[[Applying Template]]"
used_by:
  - "[[Application Document Preparation]]"
gold_standard: none
notes:
  - "[[Internship Tracker Standard]]"
  - "[[Program Standard]]"
  - "[[Resume Alteration Standard]]"
  - "[[Cover Letter Alteration Standard]]"
  - "[[Internship Pipeline]]"
---
# Applying Standard
==An Applying note is the live hub for one application: its stage, its documents, its next move, and a dated log. It is created when preparation starts, not at submission.==
This is the content standard for notes in `20_Progress/Internship/Applying/`, one per internship. It is unexercised: no real application has an Applying note yet, so nothing here has been checked against a real example. The first real note should replace the empty Gold Standard Example. `Now.md` and `_This Week.md` are views, not Applying notes.
## Spec
```json
{
  "family": "internship-applying",
  "tier": 1,
  "match": {"type": "project", "kind": "project", "path": "^20_Progress/Internship/Applying/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^20_Progress/Internship/Applying/(?!Now|_This Week|Applications-to-Create).*\\.md$", "where": {"program": "*"}}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "project_kind", "status", "stage", "created", "updated", "tags", "program", "tracker", "company", "job_url", "date_applied", "date_response", "next_deadline", "resume_version", "cover_letter", "contacts", "interview_note", "related_progress", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "contacts": "list", "related_progress": "list", "date_applied": "text?", "date_response": "text?", "next_deadline": "text?", "resume_version": "text?", "cover_letter": "text?", "interview_note": "text?", "next": "text?"},
  "headings": ["Goal", "Current State", "Interlinks", "Documents", "Next Action", "Open Questions", "Log"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`type: project`, `project_kind: project`. `stage` is the single funnel position: `Preparing`, then `Applied`, then `Offer`, `Rejected`, or `Withdrawn`. `status` is `active` until an outcome lands, then `complete`. `program` and `tracker` resolve from the day the note exists. `resume_version` and `cover_letter` stay blank until the Tailor sequence has written the files, never a path to a file that does not exist.
### Stage changes
Each change is tied to an event, never changed for tidiness. `Preparing` is set at creation with `date_applied` blank. `Applied` is set at submission, in the same sitting as `date_applied`, the Tracker moving `Current/` to `Applied/`, the Program moving to `Ended/`, and a row in `Now.md`. The three outcomes are set when a result lands, with the Tracker moving to `Result/` and its `result` set to the same word. A note and its Tracker that disagree are a bug.
> [!WARNING]
> A Program note in `Ended/` with no Applying note. `Ended` means applied, so the note is discarded as evidence a step was skipped.
### Goal
One sentence naming what winning looks like for this program: a return offer, a specific team, a rung toward the roadmap.
### Current State
Stage, blocker, and what is awaited. Say whether a low response rate points at the resume and targeting, or responses without offers point at interview prep.
### Interlinks
One line each for Contact, Job Detail, Networking, Job Description, and Fit. Depth lives on the linked note; restating it here is a violation.
### Documents
One line each for the resume and the cover letter, naming what each leads with. Not a copy.
### Next Action
The single next move, identical to `next:`.
### Open Questions and Log
Open Questions are real unknowns as `- [ ]` tasks. The Log is dated, one line per event. An active note with no entry for a week is stale.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `status: Preparing`, `Applied`, `Offer`, `Rejected`, `Withdrawn` | `stage` takes that word; `status` becomes `active` or `complete` | mechanical |
| No `project_kind`, `created`, `updated` | Add them | mechanical |
| Archived note typed `project` with only a stub | Set `status: archived` | judgment |
## Done Conditions
- `stage`, `date_applied`, and the Tracker folder agree.
- `program`, `tracker`, and every `contacts` entry resolve.
- Documents fields are filled if and only if the files were written.
- No active note has gone a week without a Log entry.
## Gold Standard Example
None yet. Name the first real Applying note here.
