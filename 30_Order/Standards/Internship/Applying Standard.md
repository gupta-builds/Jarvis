---
type: system
status: sprout
created: 2026-09-04
updated: 2026-11-07
tags:
  - system
  - standards
  - internship
system_kind: standard
family: internship-applying
tier: 1
maps_to:
  - "[[Internship Applying Template]]"
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
This is the Standard for notes in `20_Progress/Internship/Applying/`, one per internship. It is not the Program note, which holds static research ([[Program Standard]]), and not the Tracker note, which holds the dated index ([[Internship Tracker Standard]]). `Now.md` and `_This Week.md` are views, not Applying notes. Only one Applying note exists, so nothing here has been checked against a real application.
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Internship/Applying/` |
| File name | The program's name, matching its Program note. Unique in the vault. |
| Kind | `type: project` with `project_kind: project`. |
| Status | `active` until an outcome lands, then `complete`. `stage` holds the funnel position: `Preparing`, `Applied`, then `Offer`, `Rejected`, or `Withdrawn`. |
## Headings
### Frontmatter
- **Write:** `project_kind: project`, `stage`, `status`, `program` and `tracker` (resolving from the day the note exists), `resume_version` and `cover_letter` (blank until the files are written), the date fields (blank until the real date), and `next`.
- **Length:** one line per key.
- **Never:** a stage word in `status`, or a path to a document that does not exist.
- **Right:** None yet.
- **Wrong:** `status: Withdrawn`
### Goal
- **Write:** what winning looks like for this program: a return offer, a specific team, a rung toward the roadmap.
- **Length:** one sentence.
- **Never:** a restatement of the Program note.
- **Right:** `Get an offer from Hudson River Trading's Sophomore Internship.`
- **Wrong:** None seen.
### Current State
- **Write:** stage, blocker, and what is awaited. Say whether a low response rate points at the resume and targeting, or responses without offers point at interview prep.
- **Length:** a short paragraph.
- **Never:** an undated status.
- **Right:** `Kept as the worked example of the Applying`
- **Wrong:** None seen.
### Interlinks
- **Write:** one line each for Contact, Job Detail, Networking, Job Description, and Fit.
- **Length:** five lines.
- **Never:** depth that lives on the linked note.
- **Right:** None yet.
- **Wrong:** None seen.
### Documents
- **Write:** one line each for the resume and the cover letter, naming what each leads with.
- **Length:** two lines.
- **Never:** a copy of the document.
- **Right:** None yet.
- **Wrong:** None seen.
### Next Action
- **Write:** the single next move, identical to `next:`.
- **Length:** one sentence.
- **Never:** a second move.
- **Right:** None yet.
- **Wrong:** None seen.
### Open Questions
- **Write:** real unknowns as `- [ ]` tasks.
- **Length:** one sentence each.
- **Never:** a question the note already answers.
- **Right:** `- [ ] None open; ineligibility is the closing fact`
- **Wrong:** None seen.
### Log
- **Write:** dated entries, one line per event.
- **Length:** one line per event; an active note gets an entry at least weekly.
- **Never:** an undated line, or a week of silence on an active note.
- **Right:** `- **2026-07-16:** Created note as the worked example of the new Applying pattern.`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The seven headings appear in order and none is empty | A skill and a reader find sections by name | Lint, check 2 |
| `stage`, `date_applied`, and the Tracker folder agree. A note and its Tracker that disagree are a bug | Two sources of truth drift apart | Reader |
| `program`, `tracker`, and every `contacts` entry resolve | A dead link makes the hub a dead end | Lint, check 1 |
| Documents fields are filled if and only if the files were written | A path to a missing file looks like a finished document | Reader |
| A Program note in `Ended/` has an Applying note | `Ended` means applied, so a missing note shows a skipped step | Reader |
| No active note goes a week without a Log entry | A silent active note is stale | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `status: Preparing`, `Applied`, `Offer`, `Rejected`, `Withdrawn` (2026-HRT-Sophomore) | `stage` takes that word; `status` becomes `active` or `complete` | Mechanical |
| No `project_kind`, `created`, `updated` | Add them | Mechanical |
| Archived note typed `project` with only a stub | Set `status: archived` | Judgment |
## Done Conditions
- `stage`, `date_applied`, and the Tracker folder agree.
- `program`, `tracker`, and every `contacts` entry resolve.
- Documents fields are filled if and only if the files were written.
- No active note has gone a week without a Log entry.
- The note passes [[Vault Lint]] for `internship-applying`.
## Gold Standard Example
None yet. The only Applying note is a withdrawn worked example; it does not pass lint. The first real application's note should be named here.
Measured 2026-11-07 with `--family internship-applying`: 1 note, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| 2026-HRT-Sophomore | `20_Progress/Internship/Applying/` | Goal, Current State, Next Action, Open Questions, Log | `stage`, `project_kind`, `created`, `updated`, `tracker`, `job_url`; `status: Withdrawn` |
