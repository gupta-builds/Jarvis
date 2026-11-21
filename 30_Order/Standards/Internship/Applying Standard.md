---
type: system
status: sprout
created: 2026-09-04
updated: 2026-11-21
tags:
  - system
  - standards
  - internship
system_kind: standard
family: internship-applying
tier: 1
maps_to:
  - "[[Internship Applying Template]]"
used_by: []
gold_standard: none
notes:
  - "[[Internship Tracker Standard]]"
  - "[[Program Standard]]"
  - "[[Internship Pipeline]]"
  - "[[Internship Promotion Agents]]"
  - "[[Internship Apply Lane]]"
---
# Applying Standard
==An Applying note is the live hub for one tier 1 or tier 2 application: its stage, its documents, its next move, and a dated log. It is created when preparation starts, not at submission.==
This is the Standard for notes in `20_Progress/Internship/Applying/`, one per application. Tier 3 applications have no Applying note; their Tracker is the only record. It is not the Program note, which holds static research ([[Program Standard]]), and not the Tracker, which is the dated record ([[Internship Tracker Standard]]). `Now`, the Apply Queue, Follow-ups, the Deadline Map and Loop Status sit in the same folder but are views and generated notes, not Applying notes. Applying notes are private: the ignore rule is pending. Only one Applying note exists, so nothing here has been checked against a real application.
## Spec
```json
{
  "family": "internship-applying",
  "tier": 1,
  "match": {"type": "project", "kind": "project", "path": "^20_Progress/Internship/Applying/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^20_Progress/Internship/Applying/(?!Now|_This Week|Applications-to-Create).*\\.md$", "where": {"program": "*"}}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "project_kind", "status", "stage", "created", "updated", "tags", "program", "tracker", "company", "job_url", "date_applied", "date_response", "next_deadline", "resume_version", "cover_letter", "contacts", "interview_note", "related_progress", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "contacts": "list", "related_progress": "list", "tracker": "text?", "date_applied": "text?", "date_response": "text?", "next_deadline": "text?", "resume_version": "text?", "cover_letter": "text?", "interview_note": "text?", "next": "text?"},
  "headings": ["Goal", "Current State", "Interlinks", "Documents", "Next Action", "Open Questions", "Log"],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Internship/Applying/` |
| File name | The dossier's file name, matching its Program note. Unique in the vault. |
| Kind | `type: project` with `project_kind: project`. |
| Status | `active` until an outcome lands, then `complete`. `stage` holds the funnel position: `Preparing`, `awaiting-approval`, `approved`, `Applied`, then `Offer`, `Rejected` or `Withdrawn`. |
## Headings
Paths in the Right and Wrong lines start at `20_Progress/Internship/Applying/`.
### Frontmatter
- **Write:** `project_kind: project`, `stage`, `status`, `program` and the `contacts` list (resolving from the day the note exists), `tracker` (blank until the application is submitted), `resume_version` and `cover_letter` (blank until the files are written), the date keys (blank until the real date), and `next`. `stage` reaches `approved` before anything is archived.
- **Length:** one line per key.
- **Never:** a stage word in `status`, or a path to a document that does not exist.
- **Right:** None yet.
- **Wrong:** `status: Withdrawn` (`2026-HRT-Sophomore.md`)
### Goal
- **Write:** what winning looks like for this program: a return offer, a specific team, a rung toward the roadmap.
- **Length:** one sentence.
- **Never:** a restatement of the Program note.
- **Right:** `Get an offer from Hudson River Trading's Sophomore Internship.` (`2026-HRT-Sophomore.md`)
- **Wrong:** None seen.
### Current State
- **Write:** stage, blocker, and what is awaited. Say whether a low response rate points at the resume and targeting, or responses without offers point at interview prep.
- **Length:** a short paragraph.
- **Never:** an undated status.
- **Right:** `Kept as the worked example of the Applying` (`2026-HRT-Sophomore.md`)
- **Wrong:** None seen.
### Interlinks
- **Write:** one line each for the dossier, the Program note, the Contact note, and the Tracker once it exists.
- **Length:** four lines.
- **Never:** depth that lives on the linked note.
- **Right:** None yet.
- **Wrong:** None seen.
### Documents
- **Write:** one line each for the resume and the letter, naming what each leads with, and the approval state. Tier 2 names the company hook.
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
- **Right:** `- [ ] None open; ineligibility is the closing fact` (`2026-HRT-Sophomore.md`)
- **Wrong:** None seen.
### Log
- **Write:** dated entries, one line per event, including each approval.
- **Length:** one line per event; an active note gets an entry at least weekly.
- **Never:** an undated line, or a week of silence on an active note.
- **Right:** `- **2026-07-16:** Created note as the worked example of the new Applying pattern.` (`2026-HRT-Sophomore.md`)
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The seven headings appear in order and none is empty | A reader finds sections by name | Lint, check 2 |
| `stage` reaches `approved` before the packet is archived, and the Tracker is created in the sitting `stage` becomes `Applied` | Approval comes before sending; the Tracker records what was sent | Reader |
| `stage`, `date_applied` and the Tracker folder agree. A note and its Tracker that disagree are a bug | Two sources of truth drift apart | Reader |
| `program` and every `contacts` entry resolve; `tracker` resolves once set | A dead link makes the hub a dead end | Lint, check 3 |
| The document keys are filled if and only if the files were written | A path to a missing file looks like a finished document | Reader |
| No active note goes a week without a Log entry | A silent active note is stale | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `status: Preparing`, `Applied`, `Offer`, `Rejected`, `Withdrawn` | `stage` takes that word; `status` becomes `active` or `complete` | Mechanical |
| No `project_kind`, `created`, `updated`, `stage` | Add them | Mechanical |
| `Interlinks` listing Job Detail, Networking, Job Description, Fit | The four links named above | Judgment |
| Archived note typed `project` with only a stub | Set `status: archived` | Judgment |
## Done Conditions
- `stage`, `date_applied` and the Tracker folder agree.
- `program`, `contacts` and a set `tracker` resolve.
- The document keys are filled if and only if the files were written, and `stage` reached `approved` first.
- The note passes [[Vault Lint]] for `internship-applying`.
## Gold Standard Example
None yet. The only Applying note is a withdrawn worked example and does not pass lint. The first real application's note should be named here.
Measured 2026-11-21 with `--family internship-applying`: 1 note, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| 2026-HRT-Sophomore | `20_Progress/Internship/Applying/` | Goal, Current State, Next Action, Open Questions, Log | `stage`, `project_kind`, `created`, `updated`, `tracker`, `job_url`; `status: Withdrawn` |
