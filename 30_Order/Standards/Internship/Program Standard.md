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
family: internship-program
tier: 1
maps_to:
  - "[[Program Template]]"
used_by: []
gold_standard: "[[10_Areas/Career/Internships/Programs/Serious/2027-Nuro-AI-Platform-SWE]]"
notes:
  - "[[Internship Notes Standard]]"
  - "[[Internship Tracker Standard]]"
  - "[[Contact Standard]]"
  - "[[Internship Pipeline]]"
---
# Program Standard
==A Program note is static research on one internship: what it is, who can apply, the traps, and enough about the company to hold an informed conversation. Live status lives elsewhere.==
This is the content standard for notes in `10_Areas/Career/Internships/Programs/Serious/` and `Considering/`, created at Pipeline step 3 beside a Contact and a Tracker note. `Serious` and `Considering` use the same template and the same depth; the split is timing, never rigor. Applied-to programs move to an `Ended/` subfolder, missed ones to `Missed/`.
## Spec
```json
{
  "family": "internship-program",
  "tier": 1,
  "match": {"type": "reference", "kind": "program", "path": "^10_Areas/Career/Internships/Programs/(Serious|Considering)/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^10_Areas/Career/Internships/Programs/(Serious|Considering)/(?!.*(MOC|to-Create)\\.md$).*\\.md$", "where": {"company": "*"}, "absent": ["type"]}],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "reference_kind", "status", "created", "updated", "tags", "name", "company", "program_type", "eligible_classes", "grad_year", "role_type", "wave", "opens_date", "deadline_posted", "deadline_real", "duration_weeks", "benefits", "application_url", "careers_page", "list_origin", "applying_note", "recruiter_contact"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "eligible_classes": "list", "benefits": "list", "grad_year": "text?", "wave": "text?", "opens_date": "text?", "deadline_posted": "text?", "deadline_real": "text?", "duration_weeks": "text?", "careers_page": "text?", "list_origin": "text?", "applying_note": "text?", "recruiter_contact": "text?"},
  "headings": ["Program Overview", "Eligibility", "Company Information", "Traps & Gotchas", "Prep Checklist"],
  "optional_headings": ["Related Resources"]
}
```
## Headings
### Frontmatter
`type: reference`, `reference_kind: program`. `name` reads "Role at Company". `deadline_posted` is the posting's own date; `deadline_real` is the date that actually binds (an early review start, a rolling cutoff). Pay is optional and recorded as `pay_per_week` or `pay_per_hour` with `pay_currency`; it is never a screening factor. `applying_note` stays blank until an Applying note exists, then links it. `list_origin` links the source dossier or reads `manual-web-find (Anant, DATE)`. Blank fields stay blank, never the string `null`, and every wikilink stays on one line.
`status` is `sprout` while research is thin, `tree` once Eligibility and Company Information are verified, and `archived` in `Ended/` or `Missed/`.
> [!WARNING]
> Editing a Program note to record a status word. That belongs on the Applying or Tracker note. A Program changes only when a fact about the program changes.
### Program Overview
What the role is, who runs it, why it is worth the preparation hours, and how it ties to the resume and to current work.
### Eligibility
Who can apply: class year, major, work authorization, location. Name what disqualifies before starting.
### Company Information
The latest and most relevant company projects, and why they relate to the work you have done. Written so a conversation can be specific. Link the paired Contact note here.
*Density:* enough that a generic paragraph would be obviously wrong.
### Traps & Gotchas
Anchor with a `> [!WARNING]` naming the thing most applicants get wrong.
### Prep Checklist
Task lines for what must be done before applying.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `type` | Add `type: reference` and `reference_kind: program`; add `status`, `created`, `updated` | mechanical |
| Value folded across lines or the string `null` | One line, or blank | mechanical |
| Missing `Company Information` section (older notes) | Add it from the Contact note and dossier facts | judgment |
| Extra undocumented fields (`wave`, `pay_*`, `benefits`, `careers_page`) | Now part of the Spec | none |
## Done Conditions
- Every required key is present, `list_origin` and `recruiter_contact` resolve, and no value is folded.
- All five headings hold real content, and the Company Information section could carry a conversation.
- The note records no live status.
## Gold Standard Example
[[10_Areas/Career/Internships/Programs/Serious/2027-Nuro-AI-Platform-SWE]]: all headings including Company Information, a resolving recruiter contact, and a dated manual-find origin. It predates `type` and `status`.
