---
type: system
status: sprout
created: 2026-08-23
updated: 2026-10-16
tags:
  - system
  - standards
  - internship
system_kind: standard
family: internship-tracker
tier: 1
maps_to:
  - "[[30_Order/Templates/Career/Tracking|Tracking]]"
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
This is the content standard for notes in `10_Areas/Career/Internships/Tracker/Each One/`. It does not cover `Tracker/Tracker.md`, `Deadline Tracker.md`, or the Dashboard, which are views. A Tracker note is created at Pipeline step 3, once its Program and Contact notes exist, and it stays the source of truth for the stage until an Applying note takes over the narrative.
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
## Headings
### Frontmatter
`program` and `contact` are quoted wikilinks on one line to the paired notes, and both resolve from the day the note exists. `related_notes` links back to the originating dossier. Date fields stay blank until the real date happens; never the string `null`. `status` is `active` in `Current/` and `Applied/`, and `complete` in `Result/`.
> [!WARNING]
> A wikilink folded across two lines by a YAML wrap breaks the link. Keep each value on one line.
### Timeline
Five dated lines: Noted, Researched, Created, Applied, Result. Unset ones read as a dash placeholder. Fill each when it happens, not from memory.
*Density:* five lines.
### Next Action
The one physical move now, with the reason. It is current: if its date has passed, rewrite it.
### Optional sections
`Summary` (why this internship, and how it relates to current work), `Company Information` (a pointer to the Program note), `Conversation`, `Interview Steps`, and `Loop Process` are added when that stage arrives. Do not create them empty.
### Folder and fields agree
`Current/` from creation until a real application goes out. `Applied/` when it is submitted, with `date_applied` set in the same sitting. `Result/` when an outcome lands, with `date_result` and `result` set. `result` is `Offer`, `Rejected`, `Withdrawn`, or `Missed` (the deadline passed and nothing was submitted; `date_result` is that deadline). A note whose folder disagrees with its dates is a bug, not a style choice.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `status`, `created`, `updated` | Add them; `status` follows the folder | mechanical |
| Body cites "Internship Pipeline Step 8" | Tracker is step 3, apply is step 7, close is step 9 | mechanical |
| Value folded across lines | One line per value | mechanical |
| `null` string in a date or result field | Leave blank | mechanical |
| Note sits in `Each One/` root | Move to `Current/`, `Applied/`, or `Result/` to match its dates | judgment |
| `result: missed` outside `Result/` | Move to `Result/`; `Missed` is now allowed | judgment |
## Done Conditions
- Every note is in one of the three folders and its dates agree with the folder.
- `program` and `contact` resolve, and `Next Action` is current.
- `result` is one of the four values, set only in `Result/`.
## Gold Standard Example
[[10_Areas/Career/Internships/Tracker/Each One/Current/2027 Software Engineering Internship - Uber]]: resolving `program` and `contact`, a short Timeline, and a concrete Next Action. It lacks `status`, `created`, and `updated`, which the Legacy Shapes table adds.
