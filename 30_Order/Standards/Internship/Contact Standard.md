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
family: internship-contact
tier: 1
maps_to:
  - "[[Contact Template]]"
used_by: []
gold_standard: "[[10_Areas/Career/Internships/Contacts/Each One/Ongoing/2027 Software Engineering Internship - Uber]]"
notes:
  - "[[Program Standard]]"
  - "[[Internship Tracker Standard]]"
  - "[[Internship Pipeline]]"
---
# Contact Standard
==A Contact note is the company-level outreach file for one internship: sourced facts about who to reach, the live unsent draft, and an honest log of what was actually said.==
This is the content standard for notes in `10_Areas/Career/Internships/Contacts/Each One/`. There is one note per internship, not per person, because the work is deciding who to reach and in what order. It is created at Pipeline step 3 with a Program and a Tracker note. No message sends itself; every draft is reviewed and sent by hand.
## Spec
```json
{
  "family": "internship-contact",
  "tier": 1,
  "match": {"type": "contact", "kind": null, "path": "^10_Areas/Career/Internships/Contacts/Each One/(Ongoing|Come Back|Ended)/", "where": {}, "where_not": {}},
  "status": ["active", "paused", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "name", "role", "company", "linkedin_url", "email", "how_found", "relationship", "related_programs", "last_contact_date", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "related_programs": "list", "name": "text?", "role": "text?", "linkedin_url": "text?", "email": "text?", "last_contact_date": "text?", "next": "text?"},
  "headings": ["Facts", "Current Draft", "Conversation Log", "Next Action"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`name` stays blank when only a search snippet exists; `how_found` then records exactly what was found and by which query. `email` is blank unless it is verified, and `how_found` says whether it is verified or a pattern guess. `relationship` starts `cold` and changes when a real exchange happens. `related_programs` links the paired Program note. `status` follows the folder: `active` in `Ongoing/`, `paused` in `Come Back/` (nothing moves now, with a named reason to return), `archived` in `Ended/` (a real answer, or a reasonable follow-up window passed in silence).
> [!WARNING]
> The string `null` in `email` or `last_contact_date`. Leave the field blank.
### Facts
What you actually know about each person and why they matter for this internship. Every fact carries its source; a fact with no source is a guess. Cover how to reach them, how they relate to the company, and the concrete way they could move you toward the goal.
### Current Draft
The live, unsent message, built from `Contacts/Mimic.md` and edited until it sounds like you. Open it with a `> [!IMPORTANT]` reminder that nothing here sends itself.
### Conversation Log
Dated entries, newest at the bottom, of what was really said or sent. A creation line is not a conversation.
### Next Action
The single next move: send, follow up, or wait, with the date it depends on.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `status`, `created`, `updated`, or `last_contact_date` | Add them; `status` follows the folder | mechanical |
| The string `null` in a field | Leave blank | mechanical |
| Note sits loose in `Each One/` (13 notes) | Move to `Ongoing/`, `Come Back/`, or `Ended/` by state | judgment |
| Missing `linkedin_url` or `email` key | Add the key, blank if unknown | mechanical |
## Done Conditions
- The note sits in one of the three folders and its `status` agrees with it.
- Every fact has a source, and `related_programs` resolves.
- The Conversation Log holds real exchanges, not placeholders, and `Next Action` is current.
## Gold Standard Example
[[10_Areas/Career/Internships/Contacts/Each One/Ongoing/2027 Software Engineering Internship - Uber]]: a named recruiter with a source for every fact and a resolving Program link. It predates `status`, `created`, and `updated`, and still holds the string `null` in two fields.
