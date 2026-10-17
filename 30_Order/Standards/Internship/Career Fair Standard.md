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
family: career-fair
tier: 2
maps_to: []
used_by:
  - "[[Career Fair Intake]]"
gold_standard: none
notes:
  - "[[Internship Notes Standard]]"
  - "[[Program Standard]]"
  - "[[Internship Pipeline]]"
---
# Career Fair Standard
==A career fair produces raw capture first and promoted notes second; the capture is never rewritten, and every posting heard about ends up as a dossier or a recorded reason.==
This is the standard for the notes a recruiting event leaves in `20_Progress/Internship/Career Fair/`: the pre-fair company list and the raw conversation or page pastes. The notes that grow out of them (dossiers, Programs, Contacts, Trackers) follow their own Standards; [[Career Fair Intake]] says how they are made. The September 2026 fair produced 11 of each ad hoc, which is why this exists.
## Spec
```json
{
  "family": "career-fair",
  "tier": 2,
  "match": {"type": "input", "kind": null, "path": "^20_Progress/Internship/Career Fair", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "input_kind", "status", "created", "updated", "tags"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": []
}
```
## Headings
Headings are not enforced; the frontmatter is.
### Frontmatter
`type: input`. `input_kind: clipping` for the hand-typed company list, `transcript` for a raw paste. `status: seed` until it has been worked through, then `archived`. `created` and `updated` are real dates, and `tags` is a list.
### Company list
One line per company: whether it has a posting, what the posting is, and a talking point or question to bring. Record what you actually saw, including "no internship posted".
### Raw captures
One note per source or conversation, titled by topic (`Transcript - OPT`). The body is the raw text under `## Raw Transcript`. Never rewritten after capture; distilled facts go into the dossier or Contact note.
### Derived notes
Every posting heard about gets a dossier in `List/Dossiers/_Career Fair/` with `source: CareerFair-Manual`, the `career-fair` tag, and a specific `matched_reason`. A company with no posting gets a line in the list and no dossier.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: presentation` on the company list | `input_kind: clipping` | mechanical |
| Raw paste with blank `created` and `tags` | Fill `created`; make `tags` a list | mechanical |
| Same posting with slightly different file names across dossier, Program, Contact, and Tracker | One sanitized name, shared | judgment |
## Done Conditions
- Each raw capture is untouched, dated, and typed.
- Every posting heard about has a dossier or a recorded reason in the list.
- File names follow `<Title> - <Company>` with the same illegal characters stripped everywhere and no trailing period.
## Gold Standard Example
None yet. The next fair's capture notes should be named here.
