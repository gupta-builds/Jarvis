---
type: system
status: sprout
created: 2026-07-29
updated: 2026-11-21
tags:
  - system
  - standards
  - internship
system_kind: standard
family: internship-dossier
tier: 2
maps_to: []
used_by:
  - "[[Career Fair Intake]]"
gold_standard: "[[10_Areas/Career/Internships/List/Dossiers/_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC]]"
notes:
  - "[[Program Standard]]"
  - "[[Internship Tracker Standard]]"
  - "[[Internship Loop Run]]"
  - "[[Internship Loop Upkeep]]"
---
# Internship Notes Standard
==A dossier is a bot-written posting capture that makes a 60-second decision possible; the vault contract is its frontmatter, its links, and the folder that records its state.==
This is the Standard for dossiers in `10_Areas/Career/Internships/List/Dossiers/` and for the raw captures a career fair leaves in `20_Progress/Internship/Career Fair/`. The bot's extraction rules, hard gates, limits and manifest belong to the `internship-research-loop` repo and Source of Truth, not here. It is not the Program, Contact or Tracker note, which have their own Standards.
## Spec
```json
{
  "family": "internship-dossier",
  "tier": 2,
  "match": {"type": "input", "kind": "job-dossier", "path": "^10_Areas/Career/Internships/List/Dossiers/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^10_Areas/Career/Internships/List/Dossiers/(?!_Today/)(?!.*(MOC|to-Create)\\.md$).*\\.md$", "where": {"company": "*"}, "absent": ["type"]}],
  "status": ["seed", "tree", "archived"],
  "required_keys": ["type", "input_kind", "status", "review_state", "created", "updated", "tags", "company", "title", "url", "source", "terms", "locations", "target_year", "date_posted", "date_found", "deadline_posted", "own_deadline", "matched_reason", "next", "notes", "tier", "resume_variant", "letter_mode"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "terms": "list", "locations": "list", "target_year": "list", "notes": "list", "date_posted": "text?", "deadline_posted": "text?", "own_deadline": "text?", "next": "text?", "tier": "number", "resume_variant": "text", "letter_mode": "text"},
  "headings": [],
  "optional_headings": []
}
```
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
| Allowed folders | Dossiers: `List/Dossiers/` in `1 - AI & ML`, `2 - Fullstack`, `3 - CyS & Finance`, `Other`, `Viewed`, `_Career Fair`, `Applied`, `Archived`. Captures: `20_Progress/Internship/Career Fair/`. |
| File name | Dossier: `<Title> - <Company>`; a numeric suffix means a file name collision, not a duplicate posting. Capture: the topic (`Transcript - OPT`). |
| Kind | `type: input` with `input_kind: job-dossier`. Captures: `input_kind` is `clipping` (the company list) or `transcript` (a raw paste). |
| Status | Dossier `seed`, `tree` or `archived`, set by the state table below. Captures `seed` until worked through, then `archived`. |
## Headings
The body is bot output, so headings are not enforced. The frontmatter and the folder are. Dossier paths in the Right and Wrong lines start at `10_Areas/Career/Internships/List/Dossiers/`.
### Frontmatter
- **Write:** `type: input`, `input_kind: job-dossier`, then `company`, `title`, `url`, `source`, `terms`, `locations`, `target_year`, `date_posted`, `date_found`, the deadline pair, `matched_reason`, `status`, `review_state`, `created`, `updated`, `next`, `notes`, `tier`, `resume_variant`, `letter_mode`, `tags`. `starred`, `date_applied` and the screen keys appear when set. `created` is `date_found`; `updated` is `date_found` at write and changes on every move. `tier` is 1, 2 or 3 from the company file.
- **Length:** one line per key; `matched_reason` one sentence.
- **Never:** `matched_reason: matched`. The signal sits in the callout and is missing from the field; six of nine sources write the bare word.
- **Right:** `matched_reason: One of 12 engineering tracks within TSMC's Summer 2027 AZ internship` (`_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC.md`)
- **Wrong:** `matched_reason: matched` (`1 - AI & ML/A.I. Developer Co-Op (Boston, MA) - Manhattan Associates.md`)
### Company
- **Write:** the host employer exactly as the posting names it. A placement intermediary goes in the body. One spelling per company, so the `company/<slug>` tag clusters its postings.
- **Length:** one line.
- **Never:** a typo copied from a source, or an intermediary's name. Montenson for Mortenson sits in 5 dossiers.
- **Right:** None seen.
- **Wrong:** `company: Montenson` (`1 - AI & ML/AI Intern - Montenson.md`)
### States and moves
- **Write:** `status` is maturity only; `review_state` says whether a person looked; the folder says where the dossier stands. They change together, as the table says.
- **Length:** one row per folder.
- **Never:** a stage word in `status`. `removed` and `unreviewed` are not in the vocabulary.
- **Right:** None yet.
- **Wrong:** `status: removed` (`Viewed/2027 North America Software Engineering Internship - The Trade Desk.md`)

| Folder | status | review_state | Moved there by | When | Today |
|---|---|---|---|---|---|
| The four role folders | `seed` | `unreviewed` | Loop writer, by role | At write | by code |
| Same folder, screened | `seed` | `reviewed` | Anant, reading the posting | At Screen | by hand |
| Same folder, promoted | `tree` | `reviewed` | `/promote-dossier`, which writes the Program note | `next` names the Program | by hand |
| `_Career Fair/` | `seed` | `unreviewed` | Anant, the manual lane | At capture | by hand |
| `Applied/` | `archived` | `reviewed` | `mark_applied`, which sets `date_applied` | At submission | by hand |
| `Viewed/` | `archived` | unchanged | Recheck job, which sets `removed_date` and `removed_reason` | The posting closed | by code |
| `Archived/` | `archived` | unchanged | The Archived mover, with `removed_reason: deadline lapsed` | The deadline passed with no application | by hand |
### Deadline
- **Write:** exactly one of `deadline_posted` (the posting states it) or `own_deadline` (a forcing date the writer sets when the posting states none); the other key stays blank. `Viewed/` and `_Career Fair/` dossiers may carry neither.
- **Length:** one value.
- **Never:** an inferred date, or both keys with values.
- **Right:** `deadline_posted: 2026-09-30` (`1 - AI & ML/A.I. Developer Co-Op (Boston, MA) - Manhattan Associates.md`)
- **Wrong:** None seen.
### Links and tags
- **Write:** `notes` holds the Dossiers MOC link; a `Viewed/` dossier also holds the Removed Dossiers MOC link. Any other note links to a dossier by file name, so a move between folders breaks nothing. `tags` carries `internship`, `company/<slug>`, and `auto-discovered` for bot finds.
- **Length:** two links at most; three tags.
- **Never:** a path-qualified link to a dossier. It dies when the dossier moves; the Deadline Tracker holds twelve such dead links.
- **Right:** `  - "[[10_Areas/Career/Internships/List/Dossiers MOC]]"` (`_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC.md`)
- **Wrong:** `- [[10_Areas/Career/Internships/List/Dossiers/Other/Software Engineering Intern (Summer 2027) - RTX]] — deadline was 2026-08-21` (`10_Areas/Career/Internships/Tracker/Deadline Tracker.md`)
### Screen fields
- **Write:** `screened_date`, `screened_decision` (`pass` or `reject`) and `screened_reason` (the signal), added by Anant after he reads the posting. Until an eligibility gate exists he screens by eye. A PhD, clearance or citizenship role is `reject` with that reason.
- **Length:** three keys.
- **Never:** backfilled screen fields, or a `reject` with no reason.
- **Right:** None yet.
- **Wrong:** None seen.
### Body and ready to apply
- **Write:** the title, a `> [!NOTE]` match callout, then `## Posting (fetched DATE)` with the posting text. A dossier is ready to apply when the posting text was captured, the deadline has not lapsed, `screened_decision` is not `reject`, `resume_variant` and `letter_mode` are set, and for tier 1 and tier 2 a Program note exists. A Contact note is not a gate.
- **Length:** the posting text.
- **Never:** apply from a dossier whose posting text was not captured, or delete a closed posting.
- **Right:** `## Posting (fetched 2026-09-22)` (`_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC.md`)
- **Wrong:** `Found 2026-07-28 via Freehire. No posting content fetched.` (`Other/Software Engineering Intern, Summer 2027 - Google.md`)
### Career fair capture
- **Write:** one note per source or conversation, titled by topic, with `type: input`, `input_kind`, `status: seed`, real `created` and `updated`, and the raw text under `## Raw Transcript`. Every posting heard about gets a dossier in `_Career Fair/` with `source: "CareerFair-Manual"`, the `career-fair` tag and a specific `matched_reason`. A company with no posting gets a line in the company list and no dossier. Captures are private; the ignore rule is pending.
- **Length:** whatever was captured; one dossier per posting.
- **Never:** a rewrite after capture, the starter instruction left in the body, or `input_kind: presentation`.
- **Right:** `source: "CareerFair-Manual"` (`_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC.md`)
- **Wrong:** `input_kind: presentation` (`20_Progress/Internship/Career Fair '25 & '26.md`)
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `type: input`, `input_kind: job-dossier`, and every Spec key present | Dossiers are found by kind | Lint, check 1 |
| `status` is `seed`, `tree` or `archived`, and the folder agrees with the state table | Folder and status disagreeing hides a stalled dossier | Lint, check 1 (status); Reader (folder) |
| Exactly one deadline key has a value, except in `Viewed/` and `_Career Fair/` | Two values disagree | Reader |
| `matched_reason` names the signal | A bare word gives the screener nothing to check | Reader |
| `company` is the host employer, spelled the way the posting spells it | A typo splits one company in two | Reader |
| `notes` resolves to the MOC and the `company/<slug>` tag is present | The MOC and company clusters need both | Lint, check 3 (link); Reader (tag) |
| A closed posting moves to `Viewed/` with its removal keys and is not deleted | The record shows why it was dropped | Reader |
| A raw capture is never rewritten, and every posting heard about has a dossier or a line in the list | Distillation happens in the dossier, so the source stays checkable | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `type` or `input_kind` | Add `type: input`, `input_kind: job-dossier` | Mechanical |
| `status: unreviewed` | `status: seed` and `review_state: unreviewed` | Mechanical |
| `status: removed` with `removed_date` | `status: archived`, folder `Viewed/` | Mechanical |
| `status: promoted` | `status: tree` | Mechanical |
| No `created` or `updated` | `created` and `updated` from `date_found` | Mechanical |
| `preference_tier` | `tier` 1, 2 or 3 | Judgment |
| No `notes` | Add the Dossiers MOC link | Mechanical |
| `matched_reason: matched` | Name the signal from the callout | Judgment |
| `company` a typo or an intermediary | The host employer | Judgment |
| `input_kind: presentation`, blank `created` on a capture | `input_kind: clipping`, real dates | Mechanical |
## Done Conditions
- Frontmatter carries every Spec key, `status` is in the vocabulary, and the folder agrees with the state table.
- Exactly one deadline key has a value outside `Viewed/` and `_Career Fair/`.
- `notes` resolves to the MOC, and no other note links to the dossier by path.
- The note passes [[Vault Lint]] for `internship-dossier`, or for `career-fair` when it is a capture.
## Gold Standard Example
[[10_Areas/Career/Internships/List/Dossiers/_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC]]: a specific `matched_reason`, the MOC link, the company tag and the posting heading. It does not pass lint: no `type`, `input_kind`, `created`, `updated`, `tier`, `resume_variant` or `letter_mode`, and `status: unreviewed`. No dossier can pass until the loop writes the new keys.
Measured 2026-11-21 with `--family internship-dossier`: 354 notes, 0 pass; `--family career-fair`: 4 notes, 0 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC (gold) | `List/Dossiers/_Career Fair/` | Specific reason, MOC link | The seven new keys; `status: unreviewed` |
| Transcript - OPT | `20_Progress/Internship/Career Fair/` | The `Raw Transcript` heading | Blank `created`, no `updated`, the starter instruction in the body |
