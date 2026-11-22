---
type: system
status: sprout
created: 2026-08-23
updated: 2026-11-21
tags:
  - system
  - standards
  - internship
system_kind: standard
family: internship-tracker
tier: 1
maps_to:
  - "[[Internship Tracker Template]]"
used_by:
  - "[[Internship Pipeline]]"
gold_standard: "[[10_Areas/Career/Internships/Tracker/Each One/Current/2027 Software Engineering Internship - Uber]]"
notes:
  - "[[Applying Standard]]"
  - "[[Program Standard]]"
  - "[[Contact Standard]]"
  - "[[Internship Promotion Agents]]"
  - "[[Internship Apply Lane]]"
---
# Internship Tracker Standard
==A Tracker note is the dated record of one application, created when it is submitted: where it stands, when each step happened, and the single next move.==
This is the Standard for notes in `10_Areas/Career/Internships/Tracker/Each One/`. It is not `Tracker.md`, `Now`, or the Deadline Map, which are views, and not the Applying note ([[Applying Standard]]). The Tracker is private (ignore rule pending) and stands alone, because the dossier leaves the tracked tree when the application is made. A Tracker outside `Applied/` is not an application: `Now`, the weekly review and every count read `Applied/` only.
## Spec
```json
{
  "family": "internship-tracker",
  "tier": 1,
  "match": {"type": "tracker", "kind": null, "path": "^10_Areas/Career/Internships/Tracker/Each One/(Current|Applied|Result)/", "where": {}, "where_not": {}},
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "program", "contact", "company", "url", "tier", "starred", "resume_variant", "letter_mode", "date_noted", "date_researched", "date_created", "date_applied", "date_result", "result", "deadline", "related_notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "related_notes": "list", "program": "text?", "contact": "text?", "tier": "number?", "starred": "text?", "resume_variant": "text?", "letter_mode": "text?", "date_researched": "text?", "date_applied": "text?", "date_result": "text?", "result": "text?", "deadline": "text?", "next": "text?"},
  "headings": ["Timeline", "Next Action"],
  "optional_headings": ["Summary", "Company Information", "Conversation", "Interview Steps", "Loop Process"]
}
```

| Item | Rule |
|---|---|
| Allowed folders | `Tracker/Each One/Applied/` and `Result/`. `Current/` holds the trackers made at Commit before this rule; nothing new is written there. `Applied/` and `Result/` do not exist today, so the first move into each creates it. |
| File name | The dossier's file name, `<Title> - <Company>`, the same as its Program note when one exists. Unique in the vault. |
| Kind | `type: tracker`, no kind key. |
| Status | `active` in `Applied/` and `Current/`, `complete` in `Result/`. |
## Headings
Paths in the Right and Wrong lines start at `10_Areas/Career/Internships/Tracker/Each One/Current/`.
### Frontmatter
- **Write:** `related_notes` links the dossier by file name. `program` and `contact` are quoted wikilinks on one line to the paired notes when they exist, and blank for tier 3. `tier`, `starred`, `resume_variant` and `letter_mode` are copied from the dossier at apply time. Date keys stay blank until the real date. `result` is `Offer`, `Rejected`, `Withdrawn` or `Missed` (the deadline passed with nothing submitted), set only in `Result/`. There is no approval key: approval lives on the Applying note's `stage`.
- **Length:** one line per key; no folded value.
- **Never:** a wikilink folded across two lines, or the string `null` in a date or result key.
- **Right:** `program: "[[10_Areas/Career/Internships/Programs/Serious/2027-Uber-SWE-CareerPrep]]"` (`2027 Software Engineering Internship - Uber.md`)
- **Wrong:** `date_result: null` (`Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC.md`)
- `Now` derives the title from the Tracker filename and the next scheduled follow-up date from `date_applied`, without additional keys.
### Timeline
- **Write:** dated lines Noted, Researched, Created, Applied and Result, then one line for each follow-up sent. Follow-ups fall due 7 and 14 days after `date_applied`. Anant writes each one from Mimic and logs the date sent. Unset lines read a dash. Fill each when it happens.
- **Length:** five lines plus one per follow-up.
- **Never:** a date filled from memory, or a follow-up line for a message not sent.
- **Right:** `- **Noted:** 2026-07-20 (manual web clip)` (`2027 Software Engineering Internship - Uber.md`)
- **Wrong:** None seen.
### Next Action
- **Write:** the one physical move now, with the reason. It is current: when its date passes, rewrite it.
- **Length:** one to two sentences.
- **Never:** a stale move.
- **Right:** `The application_url returned "Not found" on a live check 2026-09-05` (`2027 Software Engineering Internship - Uber.md`)
- **Wrong:** None seen.
### Optional sections
- **Write:** `Summary`, `Company Information` (a pointer to the Program note), `Conversation`, `Interview Steps` (updated when an interview is booked), and `Loop Process`, added when that stage arrives.
- **Length:** as the stage needs.
- **Never:** an empty optional section.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The note is created in `Applied/` in the sitting the application is submitted, with `date_applied` set and the dossier moved to `Applied/` | A Tracker made earlier records an application that did not happen | Reader |
| When a real outcome lands, set `date_result`, `result` and `status: complete` and move the Tracker to `Result/` in the same sitting. Only tiers 1 and 2 also set Applying `stage` | The folder and the dates must agree | Reader |
| `status` follows the folder | The dashboard counts by folder and status | Lint, check 1 |
| `program` and `contact` resolve when set | A dead link cuts the Tracker off from its research | Lint, check 3 |
| When a Program note's `deadline_posted` or `deadline_real` changes, the Tracker's `deadline` takes it in the same sitting | Two deadlines for one application are a bug | Reader |
| `result` records a real outcome (offer, rejection, withdrawal or missed), never a guess about how it is going | The vocabulary is closed and the record is true | Reader |
| The two headings appear in order | The dashboard reads them | Lint, check 2 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `status`, `created`, `updated` (32 of 32) | Add them; `status` follows the folder | Mechanical |
| Created at Commit and sitting in `Current/` (29) | Stays until applied, then moves to `Applied/` | Judgment |
| No `tier`, `starred`, `resume_variant`, `letter_mode` | Add them, blank if unknown | Mechanical |
| Body cites "Internship Pipeline Step 8" | Cite the step by name | Mechanical |
| Value folded across lines, or the string `null` | One line, or blank | Mechanical |
| Note outside the three folders (3) | Move to the folder its dates match | Judgment |
## Done Conditions
- Every note is in one of the three folders and its dates agree with the folder.
- `program` and `contact` resolve when set, and `Next Action` is current.
- `result` is one of the four values, set only in `Result/`.
- The note passes [[Vault Lint]] for `internship-tracker`.
## Gold Standard Example
[[10_Areas/Career/Internships/Tracker/Each One/Current/2027 Software Engineering Internship - Uber]]: resolving `program` and `contact`, a five-line Timeline and a concrete Next Action. It does not pass lint: no `status`, `created` or `updated`, and none of the four copied keys.
Measured 2026-11-21 with `--family internship-tracker`: 32 notes, 0 pass. 29 sit in `Current/`; none in `Applied/` or `Result/`.
