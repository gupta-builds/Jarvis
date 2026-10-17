---
type: system
status: sprout
created: 2026-07-29
updated: 2026-10-16
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
This is the vault-side contract for dossiers in `10_Areas/Career/Internships/List/Dossiers/`, including `Viewed/` and `_Career Fair/`. The bot's extraction rules, hard gates, resource limits, and manifest belong to the `internship-research-loop` repo and its Source of Truth, not here. Program, Contact, and Tracker notes have their own Standards.
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
## Headings
The body is bot output, so headings are not enforced. The frontmatter below is.
### Frontmatter
Keys in the bot's order: `company`, `title`, `url`, `source`, `terms`, `locations`, `target_year`, `date_posted`, `date_found`, one deadline field, `matched_reason`, `status`, `next`, `notes`, `preference_tier`, `tags`, plus `type: input` and `input_kind: job-dossier`. `date_posted` stays empty when the source gave none. `target_year: []` is the normal case. `matched_reason` names the rule or signal that matched, never the bare word `matched`.
> [!WARNING]
> `matched_reason: matched` on 187 of 356 dossiers. The specific signal sits in the callout below and is missing from the field.
### Status
`seed` for a new find, `tree` once promoted to a Program (then `next` names it), `archived` once removed. A removed dossier moves to `Viewed/` and gains `removed_date` and `removed_reason`. Whether a human has looked is `review_state`, not `status`.
### Deadline
Exactly one of `deadline_posted` (the posting states it) or `own_deadline` (`date_found` plus 7 days). Never inferred, never defaulted. `Viewed/` dossiers are exempt.
### Links and tags
`notes` always holds the Dossiers MOC. A removed dossier also holds the Removed Dossiers MOC. `tags` includes `company/<slug>`, which clusters same-company postings without a hub note.
### Screen fields
`screened_date`, `screened_decision` (`pass` or `reject`), and `screened_reason` (the specific signal) are added by whoever runs Pipeline step 2. They are never backfilled.
### Body and placement
Title, a `> [!NOTE]` match callout, then `## Posting (fetched DATE)` with the posting text, free of duplicated paragraphs and UI chrome. Priority folders are `1 - AI & ML`, `2 - Fullstack`, `3 - CyS & Finance`, and `Other`. Manual and career-fair finds use the same template with `source: manual` or `CareerFair-Manual`. `Viewed/` is a human triage bin. A closed posting moves there; it is never deleted.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `type` or `input_kind` | Add `type: input`, `input_kind: job-dossier` | mechanical |
| `status: unreviewed` | `status: seed` and `review_state: unreviewed` | mechanical |
| `status: removed` | `status: archived` | mechanical |
| `status: promoted` | `status: tree` | mechanical |
| No `notes:` (242 dossiers) | Add the Dossiers MOC link | mechanical |
| `deadline_posted` and `own_deadline` both present, one null | Keep only the one that has a value | mechanical |
| `matched_reason: matched` | Name the signal from the callout | judgment |
## Done Conditions
- Frontmatter carries every required key, `status` is in the vocabulary, and exactly one deadline field has a value.
- `notes` resolves to the MOC, and the `company/<slug>` tag is present.
- A closed posting is in `Viewed/` with its removal fields, not deleted.
## Gold Standard Example
[[10_Areas/Career/Internships/List/Dossiers/_Career Fair/Computer Integrated Manufacturing (CIM) Engineer Intern - TSMC]]: a specific `matched_reason`, the MOC link, and the company tag. It predates `type` and the deadline rule, which the Legacy Shapes table adds.
