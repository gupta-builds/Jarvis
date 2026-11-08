---
type: system
status: sprout
created: 2026-08-23
updated: 2026-11-07
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
  - "[[Internship Tracking Workflow]]"
  - "[[Internship Pipeline]]"
gold_standard: "[[10_Areas/Career/Internships/Tracker/Each One/Current/2027 Software Engineering Internship - Uber]]"
notes:
  - "[[Applying Standard]]"
  - "[[Program Standard]]"
  - "[[Contact Standard]]"
---
# Internship Tracker Standard
==A Tracker note is the dated index of one internship: where it stands, when each step happened, and the single next move.==
This is the Standard for notes in `10_Areas/Career/Internships/Tracker/Each One/`. It is not `Tracker/Tracker.md`, `Deadline Tracker.md`, or the Dashboard, which are views, and not the Applying note, which takes over the narrative ([[Applying Standard]]). A Tracker note stays the source of truth for the stage until an Applying note exists.
## Spec
```json
{
  "family": "internship-tracker",
  "tier": 1,
  "match": {"type": "tracker", "kind": null, "path": "^10_Areas/Career/Internships/Tracker/Each One/(Current|Applied|Result)/", "where": {}, "where_not": {}},
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "program", "contact", "company", "url", "date_noted", "date_researched", "date_created", "date_applied", "date_result", "result", "deadline", "related_notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "related_notes": "list", "date_researched": "text?", "date_applied": "text?", "date_result": "text?", "result": "text?", "deadline": "text?", "next": "text?"},
  "headings": ["Timeline", "Next Action"],
  "optional_headings": ["Summary", "Company Information", "Conversation", "Interview Steps", "Loop Process"]
}
```

| Item | Rule |
|---|---|
| Allowed folders | `10_Areas/Career/Internships/Tracker/Each One/Current/`, `Applied/`, or `Result/`. |
| File name | The same name as its Program note. Unique in the vault. |
| Kind | `type: tracker`, no kind key. |
| Status | `active` in `Current/` and `Applied/`, `complete` in `Result/`. |
## Headings
### Frontmatter
- **Write:** `program` and `contact` as quoted wikilinks on one line to the paired notes, resolving from the day the note exists. `related_notes` links back to the originating dossier. Date fields stay blank until the real date happens. `result` is `Offer`, `Rejected`, `Withdrawn`, or `Missed` (the deadline passed and nothing was submitted; `date_result` is that deadline), set only in `Result/`.
- **Length:** one line per key; no folded value.
- **Never:** a wikilink folded across two lines by a YAML wrap, or the string `null` in a date or result field.
- **Right:** `program: "[[10_Areas/Career/Internships/Programs/Serious/2027-Uber-SWE-CareerPrep]]"`
- **Wrong:** None seen.
### Timeline
- **Write:** five dated lines: Noted, Researched, Created, Applied, Result. Unset ones read as a dash placeholder. Fill each when it happens, not from memory.
- **Length:** five lines.
- **Never:** a date filled from memory.
- **Right:** `- **Noted:** 2026-07-20 (manual web clip)`
- **Wrong:** None seen.
### Next Action
- **Write:** the one physical move now, with the reason. It is current: if its date has passed, rewrite it.
- **Length:** one to two sentences.
- **Never:** a stale move.
- **Right:** `The application_url returned "Not found" on a live check 2026-09-05`
- **Wrong:** None seen.
### Optional sections
- **Write:** `Summary` (why this internship), `Company Information` (a pointer to the Program note), `Conversation`, `Interview Steps`, and `Loop Process`, added when that stage arrives.
- **Length:** as the stage needs.
- **Never:** an empty optional section.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `Current/` from creation until a real application goes out; `Applied/` when submitted, with `date_applied` set in the same sitting; `Result/` when an outcome lands, with `date_result` and `result` | A note whose folder disagrees with its dates is a bug, not a style choice | Reader |
| `status` follows the folder | The dashboard counts by folder and status | Lint, check 1 |
| `program` and `contact` resolve | A tracker with a dead link cannot reach its research | Lint, check 3 |
| `result` is one of the four values | The vocabulary is closed | Reader |
| The two headings appear in order | The dashboard reads them | Lint, check 2 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `status`, `created`, `updated` (32 of 32) | Add them; `status` follows the folder | Mechanical |
| Body cites "Internship Pipeline Step 8" | Tracker is step 3, apply is step 7, close is step 9 | Mechanical |
| Value folded across lines | One line per value | Mechanical |
| `null` string in a date or result field | Leave blank | Mechanical |
| Note sits outside `Current/`, `Applied/`, `Result/` (3 notes) | Move to `Current/`, `Applied/`, or `Result/` to match its dates | Judgment |
| `result: missed` outside `Result/` | Move to `Result/`; `Missed` is now allowed | Judgment |
## Done Conditions
- Every note is in one of the three folders and its dates agree with the folder.
- `program` and `contact` resolve, and `Next Action` is current.
- `result` is one of the four values, set only in `Result/`.
- The note passes [[Vault Lint]] for `internship-tracker`.
## Gold Standard Example
[[10_Areas/Career/Internships/Tracker/Each One/Current/2027 Software Engineering Internship - Uber]]: resolving `program` and `contact`, a five-line Timeline, and a concrete Next Action. It does not pass lint: no `status`, `created`, or `updated`.
Measured 2026-11-07 with `--family internship-tracker`: 32 notes, 0 pass. 29 sit in `Current/`; none in `Applied/` or `Result/`.
