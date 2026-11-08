---
type: system
status: sprout
created: 2026-07-29
updated: 2026-11-07
tags:
  - system
  - standards
  - internship
system_kind: standard
family: internship-dossier
tier: 2
maps_to: []
used_by: []
gold_standard: "[[10_Areas/Career/Internships/List/Dossiers/_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC]]"
notes:
  - "[[Internship Pipeline]]"
  - "[[Program Standard]]"
  - "[[Deadline and Intake Triage Standard]]"
---
# Internship Notes Standard
==A dossier is a bot-written posting capture that makes a 60-second decision possible; the vault contract is its frontmatter, its links, and where it lives.==
This is the Standard for dossiers in `10_Areas/Career/Internships/List/Dossiers/`, including `Viewed/` and `_Career Fair/`. The bot's extraction rules, hard gates, resource limits, and manifest belong to the `internship-research-loop` repo and its Source of Truth, not here. It is not the Program, Contact, or Tracker note, which have their own Standards.
## Spec
```json
{
  "family": "internship-dossier",
  "tier": 2,
  "match": {"type": "input", "kind": "job-dossier", "path": "^10_Areas/Career/Internships/List/Dossiers/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^10_Areas/Career/Internships/List/Dossiers/(?!_Today/)(?!.*(MOC|to-Create)\\.md$).*\\.md$", "where": {"company": "*"}, "absent": ["type"]}],
  "status": ["seed", "tree", "archived"],
  "required_keys": ["type", "input_kind", "company", "title", "url", "source", "terms", "locations", "target_year", "date_posted", "date_found", "matched_reason", "status", "next", "notes", "tags"],
  "key_types": {"terms": "list", "locations": "list", "target_year": "list", "notes": "list", "tags": "list", "date_posted": "text?", "next": "text?"},
  "headings": [],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `List/Dossiers/` in the priority folders `1 - AI & ML`, `2 - Fullstack`, `3 - CyS & Finance`, `Other`, plus `Viewed/` and `_Career Fair/`. `_Today/` holds the intake log, not dossiers. |
| File name | `<Title> - <Company>`. Same-company duplicates carry a numeric suffix. |
| Kind | `type: input` with `input_kind: job-dossier`. |
| Status | `seed` for a new find, `tree` once promoted to a Program (then `next` names it), `archived` once removed. Whether a human has looked is `review_state`, not `status`. |
## Headings
The body is bot output, so headings are not enforced. The frontmatter below is.
### Frontmatter
- **Write:** keys in the bot's order: `company`, `title`, `url`, `source`, `terms`, `locations`, `target_year`, `date_posted`, `date_found`, one deadline field, `matched_reason`, `status`, `next`, `notes`, `preference_tier`, `tags`, plus `type: input` and `input_kind: job-dossier`. `date_posted` stays empty when the source gave none. `target_year: []` is the normal case.
- **Length:** one line per key; `matched_reason` one sentence.
- **Never:** `matched_reason: matched`. The specific signal sits in the callout below and is missing from the field; 81 of 287 dossiers had the bare word in the 2026-W36 review.
- **Right:** `matched_reason: One of 12 engineering tracks within TSMC's Summer 2027 AZ internship`
- **Wrong:** `status: unreviewed`
### Deadline
- **Write:** exactly one of `deadline_posted` (the posting states it) or `own_deadline` (`date_found` plus 7 days). `Viewed/` dossiers are exempt.
- **Length:** one field.
- **Never:** an inferred or defaulted date, or both fields with one null.
- **Right:** None yet.
- **Wrong:** None seen.
### Links and tags
- **Write:** `notes` always holds the Dossiers MOC; a removed dossier also holds the Removed Dossiers MOC. `tags` includes `company/<slug>`, which clusters same-company postings without a hub note.
- **Length:** two links; three tags.
- **Never:** a dossier with no `notes`.
- **Right:** `  - "[[10_Areas/Career/Internships/List/Dossiers MOC]]"`
- **Wrong:** None seen.
### Screen fields
- **Write:** `screened_date`, `screened_decision` (`pass` or `reject`), and `screened_reason` (the specific signal), added by whoever runs Pipeline step 2.
- **Length:** three keys.
- **Never:** backfilled screen fields.
- **Right:** None yet.
- **Wrong:** None seen.
### Body and placement
- **Write:** the title, a `> [!NOTE]` match callout, then `## Posting (fetched DATE)` with the posting text, free of duplicated paragraphs and UI chrome. `Viewed/` is a human triage bin: a closed posting moves there with `removed_date` and `removed_reason`.
- **Length:** the posting text.
- **Never:** a deleted closed posting.
- **Right:** `## Posting (fetched 2026-09-22)`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `type: input` and `input_kind: job-dossier` | Dossiers are found by kind | Lint, check 1 |
| `status` is `seed`, `tree`, or `archived` | `unreviewed`, `removed`, `promoted` are not in the vocabulary | Lint, check 1 |
| Exactly one deadline field has a value | Two fields disagree | Reader |
| `matched_reason` names the signal | A bare "matched" gives the screener nothing to check | Reader |
| `notes` resolves to the MOC and the `company/<slug>` tag is present | The MOC and company clusters need both | Lint, check 3 (link); Reader (tag) |
| A closed posting is moved to `Viewed/` with its removal fields, not deleted | The record shows why it was dropped | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `type` or `input_kind` (354 of 354) | Add `type: input`, `input_kind: job-dossier` | Mechanical |
| `status: unreviewed` (277) | `status: seed` and `review_state: unreviewed` | Mechanical |
| `status: removed` (74) | `status: archived` | Mechanical |
| `status: promoted` (3) | `status: tree` | Mechanical |
| No `notes:` (242) | Add the Dossiers MOC link | Mechanical |
| `deadline_posted` and `own_deadline` both present, one null | Keep only the one that has a value | Mechanical |
| `matched_reason: matched` | Name the signal from the callout | Judgment |
## Done Conditions
- Frontmatter carries every required key, `status` is in the vocabulary, and exactly one deadline field has a value.
- `notes` resolves to the MOC, and the `company/<slug>` tag is present.
- A closed posting is in `Viewed/` with its removal fields, not deleted.
- The note passes [[Vault Lint]] for `internship-dossier`.
## Gold Standard Example
[[10_Areas/Career/Internships/List/Dossiers/_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC]]: a specific `matched_reason`, the MOC link, and the company tag. It does not pass lint: no `type` or `input_kind`, and `status: unreviewed`.
Measured 2026-11-07 with `--family internship-dossier`: 354 notes, 0 pass. 128 sit in `1 - AI & ML`, 74 in `Viewed`, 58 in `Other`, 45 in `3 - CyS & Finance`.
