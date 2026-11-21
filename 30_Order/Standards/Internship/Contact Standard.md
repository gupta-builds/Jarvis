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
family: internship-contact
tier: 1
maps_to:
  - "[[Internship Contact Template]]"
used_by: []
gold_standard: "[[10_Areas/Career/Internships/Contacts/Each One/Ongoing/2027 Software Engineering Internship - Uber]]"
notes:
  - "[[Program Standard]]"
  - "[[Internship Tracker Standard]]"
  - "[[Internship Pipeline]]"
---
# Contact Standard
==A Contact note is the company-level outreach file for one internship: sourced facts about who to reach, the live unsent draft, and an honest log of what was actually said.==
This is the Standard for notes in `10_Areas/Career/Internships/Contacts/Each One/`. There is one note per internship, for tier 1 and tier 2 applications, not one per person, because the work is deciding who to reach and in what order. Anant writes and sends every message himself, from `Contacts/Mimic.md`; the `contact-researcher` agent finds sourced names and LinkedIn people-search links and never sends or scrapes. It is not the Program note ([[Program Standard]]) or the Tracker ([[Internship Tracker Standard]]). A Contact note is not a gate for applying. `Contacts/` is git-ignored today, except `Mimic.md`.
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

| Item | Rule |
|---|---|
| Allowed folders | `10_Areas/Career/Internships/Contacts/Each One/Ongoing/`, `Come Back/` or `Ended/`. |
| File name | The same name as its Program note. Unique in the vault. |
| Kind | `type: contact`, no kind key. |
| Status | By folder: `active` in `Ongoing/`; `paused` in `Come Back/` (nothing moves now, with a named reason to return); `archived` in `Ended/` (a real answer, or a reasonable follow-up window passed in silence). |
## Headings
Paths in the Right and Wrong lines start at `10_Areas/Career/Internships/Contacts/Each One/`.
### Frontmatter
- **Write:** `name` (blank when only a search snippet exists), `how_found` (what was found and by which query), `email` (blank unless verified; `how_found` says whether verified or a pattern guess), `relationship` (starts `cold`), `related_programs` (links the paired Program note), `status`, dates.
- **Length:** one line per key.
- **Never:** the string `null` in `email` or `last_contact_date`. Leave the key blank.
- **Right:** `how_found: "linkedin search snippet: Uber university recruiting"` (`Ongoing/2027 Software Engineering Internship - Uber.md`)
- **Wrong:** `email: null` (`Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC.md`)
### Facts
- **Write:** what you know about each person and why they matter for this internship. Every fact carries its source. Cover how to reach them, how they relate to the company, and how they could move you toward the goal.
- **Length:** one bullet per fact.
- **Never:** a fact with no source. It is a guess.
- **Right:** `Every item below is a real tool-call result with its source` (`Ongoing/2027 Software Engineering Internship - Uber.md`)
- **Wrong:** None seen.
### Current Draft
- **Write:** the live, unsent message, built from `Contacts/Mimic.md` and edited until it sounds like you. It opens with a `> [!IMPORTANT]` reminder that nothing here sends itself.
- **Length:** one message.
- **Never:** a draft presented as sent.
- **Right:** `Not yet written` (`Ongoing/2027 Software Engineering Internship - Uber.md`)
- **Wrong:** None seen.
### Conversation Log
- **Write:** dated entries, newest at the bottom, of what was really said or sent.
- **Length:** one to three sentences per entry.
- **Never:** a creation line as a conversation entry.
- **Right:** None yet.
- **Wrong:** `- **2026-09-05:** Note created during the review-system backlog clear` (`Ongoing/2027 Software Engineering Internship - Uber.md`)
### Next Action
- **Write:** the single next move: send, follow up, or wait, with the date it depends on.
- **Length:** one to two sentences.
- **Never:** a move with no date or trigger.
- **Right:** `Confirm the original req (jobs.uber.com/en/jobs/300697/) is genuinely expired` (`Ongoing/2027 Software Engineering Internship - Uber.md`)
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The note sits in one of the three folders and its `status` agrees with the folder | The folder is how a human sees state | Reader (status key: Lint, check 1) |
| Blank keys stay blank, never the string `null`; every wikilink stays on one line | `null` is read as text, and a folded link breaks | Reader |
| `related_programs` resolves | The Contact must reach its Program | Lint, check 3 |
| Every fact has a source | An unsourced contact fact sends the outreach to a guess | Reader |
| The Conversation Log holds real exchanges | A placeholder log hides that no contact happened | Reader |
| No message is sent by an agent | Every draft is reviewed and sent by hand | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `status`, `created`, `updated` (30 of 30) | Add them; `status` follows the folder | Mechanical |
| The string `null` in a key | Leave blank | Mechanical |
| Note sits loose in `Each One/` (12 notes) | Move to `Ongoing/`, `Come Back/` or `Ended/` by state | Judgment |
| Missing `linkedin_url` or `email` key | Add the key, blank if unknown | Mechanical |
## Done Conditions
- The note sits in one of the three folders and its `status` agrees with it.
- Every fact has a source, and `related_programs` resolves.
- The Conversation Log holds real exchanges, not placeholders, and `Next Action` is current.
- The note passes [[Vault Lint]] for `internship-contact`.
## Gold Standard Example
[[10_Areas/Career/Internships/Contacts/Each One/Ongoing/2027 Software Engineering Internship - Uber]]: a named recruiter with a source for every fact and a resolving Program link. It does not pass lint: no `status`, `created` or `updated`, and the string `null` in two keys.
Measured 2026-11-21 with `--family internship-contact`: 30 notes, 0 pass. `email` is filled on 1 and `last_contact_date` on 0, so no outreach has been logged.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| 2027 Software Engineering Internship - Uber (gold) | `10_Areas/Career/Internships/Contacts/Each One/Ongoing/` | Sourced facts, a resolving Program link | Three keys; `null` strings; only a creation line in the log |
