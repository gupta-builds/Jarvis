---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
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
This is the Standard for the notes a recruiting event leaves in `20_Progress/Internship/Career Fair/`: the pre-fair company list and the raw conversation or page pastes. It is not the dossiers, Programs, Contacts, or Trackers that grow out of them, which follow their own Standards. The September 2026 fair produced 11 of each ad hoc, which is why this exists.
## Spec
```json
{
  "family": "career-fair",
  "tier": 2,
  "match": {"type": "input", "kind": null, "path": "^20_Progress/Internship/Career Fair", "strict_path": true, "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "input_kind", "status", "created", "updated", "tags"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/Internship/Career Fair/`; the pre-fair list `Career Fair '25 & '26.md` sits one level up. |
| File name | The topic for a raw capture (`Transcript - OPT`); `<Title> - <Company>` for dossiers, Programs, Contacts, and Trackers, with illegal characters stripped the same way everywhere and no trailing period. |
| Kind | `type: input` with `input_kind: clipping` (the company list) or `transcript` (a raw paste). |
| Status | `seed` until worked through, then `archived`. |
## Headings
The headings are not enforced; the frontmatter is.
### Frontmatter
- **Write:** `type: input`, `input_kind`, `status: seed`, real `created` and `updated` dates, and `tags` as a list.
- **Length:** one line per key.
- **Never:** `input_kind: presentation` or a blank `created`. Both leave the note outside the vocabulary and the timeline.
- **Right:** None yet.
- **Wrong:** `input_kind: presentation`
### Company list
- **Write:** one line per company: whether it has a posting, what the posting is, and a talking point or question to bring. Record what you saw, including "no internship posted".
- **Length:** one line each.
- **Never:** a guess about a posting.
- **Right:** `3. Aagard - No job online`
- **Wrong:** None seen.
### Raw captures
- **Write:** one note per source or conversation, titled by topic, with the body as the raw text under `## Raw Transcript`.
- **Length:** whatever was captured.
- **Never:** a rewrite after capture, or leftover template instructions. Distilled facts go into the dossier or Contact note.
- **Right:** `## Raw Transcript`
- **Wrong:** `Paste the untouched transcript below, inside the fence.`
### Derived notes
- **Write:** every posting heard about gets a dossier in `List/Dossiers/_Career Fair/` with `source: CareerFair-Manual`, the `career-fair` tag, and a specific `matched_reason`. A company with no posting gets a line in the list and no dossier.
- **Length:** one dossier per posting.
- **Never:** a dossier for a company with no posting.
- **Right:** `source: "CareerFair-Manual"`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `type`, `input_kind`, `status`, `created`, `updated`, `tags` are set | The capture is found by kind and date | Lint, check 1 |
| A raw capture is never rewritten | Distillation happens in the dossier, so the source stays checkable | Reader |
| Every posting heard about has a dossier or a recorded reason in the list | A posting that disappears cannot be revisited | Reader |
| File names follow `<Title> - <Company>` with the same illegal characters stripped everywhere | The dossier, Program, Contact, and Tracker must resolve by one name | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `input_kind: presentation` on the company list | `input_kind: clipping` | Mechanical |
| Raw paste with blank `created` and no `updated` (`Transcript - OPT`, `Comp Sci`, `Sponsoring`) | Fill `created` and `updated`; make `tags` a list | Mechanical |
| The starter instruction left in a raw capture | Delete it | Mechanical |
| Same posting with slightly different file names across dossier, Program, Contact, and Tracker | One sanitized name, shared | Judgment |
## Done Conditions
- Each raw capture is untouched, dated, and typed.
- Every posting heard about has a dossier or a recorded reason in the list.
- File names follow `<Title> - <Company>` with the same illegal characters stripped everywhere and no trailing period.
- The note passes [[Vault Lint]] for `career-fair`.
## Gold Standard Example
None yet. No capture note passes lint. The next fair's capture notes should be named here.
Measured 2026-11-07 with `--family career-fair`: 4 notes, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Career Fair '25 & '26 | `20_Progress/Internship/` | A numbered company list with talking points | `input_kind: presentation`, no `updated` |
| Transcript - OPT | `20_Progress/Internship/Career Fair/` | The `Raw Transcript` heading | Blank `created`, no `updated`; the starter instruction in the body |
