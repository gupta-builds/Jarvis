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
family: internship-program
tier: 1
maps_to:
  - "[[Internship Program Template]]"
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
This is the Standard for notes in `10_Areas/Career/Internships/Programs/Serious/` and `Considering/`, one per tier 1 or tier 2 application, paired with a Contact note. `Serious` and `Considering` use the same template and the same depth; the split is timing, never rigor. It is not the Applying note, which holds live status ([[Applying Standard]]). Programs are private: the ignore rule is pending.
## Spec
```json
{
  "family": "internship-program",
  "tier": 1,
  "match": {"type": "reference", "kind": "program", "path": "^10_Areas/Career/Internships/Programs/(Serious|Considering)/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^10_Areas/Career/Internships/Programs/(Serious|Considering)/(?!.*(MOC|to-Create)\\.md$).*\\.md$", "where": {"company": "*"}, "absent": ["type"]}],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "reference_kind", "status", "created", "updated", "tags", "name", "company", "program_type", "deadline_posted", "deadline_real", "application_url", "list_origin", "recruiter_contact"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "deadline_posted": "text?", "deadline_real": "text?", "list_origin": "text?", "recruiter_contact": "text?"},
  "headings": ["Program Overview", "Eligibility", "Company Information", "Traps & Gotchas", "Prep Checklist"],
  "optional_headings": ["Related Resources"]
}
```

| Item | Rule |
|---|---|
| Allowed folders | `10_Areas/Career/Internships/Programs/Serious/` or `Considering/`, with `Career Fair/` and `Missed/` subfolders. No `Ended/` folder exists or is used. |
| File name | `<year>-<Company>-<Role>` (`2027-Nuro-AI-Platform-SWE`). Unique in the vault. |
| Kind | `type: reference` with `reference_kind: program`. |
| Status | `sprout` while research is thin, `tree` once Eligibility and Company Information are verified, `archived` once the application is made or missed. |
## Headings
Paths in the Right and Wrong lines start at `10_Areas/Career/Internships/Programs/Serious/`.
### Frontmatter
- **Write:** the 14 keys in the Spec. `name` reads "Role at Company". `deadline_posted` is the posting's own date; `deadline_real` is the date that actually binds. `list_origin` links the source dossier by file name or reads `manual-web-find (Anant, DATE)`. Keys outside the Spec (`wave`, `opens_date`, `duration_weeks`, `benefits`, `careers_page`, `eligible_classes`, `grad_year`, pay) are allowed and are not required. Lint has no extra-key rule, so do not strip them from notes agents write.
- **Length:** one line per key; every wikilink on one line.
- **Never:** the string `null`. Blank keys stay blank.
- **Right:** `list_origin: manual-web-find (Anant, 2026-07-23 clip, promoted 2026-07-29)` (`2027-Nuro-AI-Platform-SWE.md`)
- **Wrong:** `wave: null` (`2027-Deepgram-SWE-VoiceAI.md`)
### Program Overview
- **Write:** what the role is, who runs it, why it is worth the preparation hours, and how it ties to the resume and to current work.
- **Length:** one paragraph.
- **Never:** a live status word. That belongs on the Applying or Tracker note.
- **Right:** `Software engineering intern role at Nuro, a Level-4 autonomous-driving company` (`2027-Nuro-AI-Platform-SWE.md`)
- **Wrong:** None seen.
### Eligibility
- **Write:** who can apply: class year, major, work authorization, location. Name what disqualifies before starting.
- **Length:** two to five bullets.
- **Never:** an eligibility claim not taken from the posting.
- **Right:** `BS or MS in CS, EE, Robotics, or related, **graduating December 2026 or later**` (`2027-Nuro-AI-Platform-SWE.md`)
- **Wrong:** None seen.
### Company Information
- **Write:** the latest and most relevant company projects, and why they relate to the work you have done, written so a conversation can be specific. For a tier 1 letter this is the source of the company-specific opening. Link the paired Contact note here.
- **Length:** a paragraph; enough that a generic paragraph would be obviously wrong. 26 of 31 notes lack it.
- **Never:** a generic company blurb.
- **Right:** `Nuro builds the Nuro Driver™ platform deployed across robotaxis, logistics fleets, and personal vehicles` (`2027-Nuro-AI-Platform-SWE.md`)
- **Wrong:** None seen.
### Traps & Gotchas
- **Write:** anchor with a `> [!WARNING]` naming the thing most applicants get wrong.
- **Length:** one to three callouts.
- **Never:** a trap that is only a preference.
- **Right:** `The posting covers five possible teams (Data Platform, Onboard Systems, ML Infra, Simulation, Technical Infrastructure) without specifying which one an applicant lands on` (`2027-Nuro-AI-Platform-SWE.md`)
- **Wrong:** None seen.
### Prep Checklist
- **Write:** task lines for what must be done before applying.
- **Length:** three to six `- [ ]` lines.
- **Never:** a task with no object.
- **Right:** `- [ ] Review C++/Python algorithmic proficiency` (`2027-Nuro-AI-Platform-SWE.md`)
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The five headings appear in order and none is empty | The Pipeline reads them by name | Lint, check 2 |
| `type: reference`, `reference_kind: program` and `status` are set | Programs are found by kind | Lint, check 1 |
| The note records no live status | Live status changes daily; the Program changes only when a fact about the program does | Reader |
| `list_origin` and `recruiter_contact` resolve | The Program must reach its source and its Contact | Lint, check 3 |
| Blank keys stay blank, never `null`; no value is folded across lines | `null` is read as text and a fold breaks the link | Reader |
| A Program note exists before a tier 1 or tier 2 dossier is ready to apply | The company-specific opening comes from it | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `type`, `status`, `created`, `updated`, `reference_kind` (31 of 31) | Add `type: reference`, `reference_kind: program`, `status`, `created`, `updated` | Mechanical |
| Value folded across lines, or the string `null` | One line, or blank | Mechanical |
| Missing `Company Information` section (26 notes) | Add it from the Contact note and dossier facts | Judgment |
| Keys the Spec no longer requires | Leave them; they are allowed | None |
| `Ended/` named as the home of applied programs | No such folder; set `status: archived` | Judgment |
## Done Conditions
- Every Spec key is present, `list_origin` and `recruiter_contact` resolve, and no value is folded.
- All five headings hold real content, and Company Information could carry a conversation.
- The note records no live status.
- The note passes [[Vault Lint]] for `internship-program`.
## Gold Standard Example
[[10_Areas/Career/Internships/Programs/Serious/2027-Nuro-AI-Platform-SWE]]: all five headings including Company Information, a resolving recruiter contact, and a dated manual-find origin. It does not pass lint: no `type`, `status`, `created`, `updated` or `reference_kind`.
Measured 2026-11-21 with `--family internship-program`: 31 notes, 0 pass. 12 sit in `Serious/`, 11 in `Serious/Career Fair/`, 4 in `Serious/Missed/`, 3 in `Considering/`.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| 2027-Nuro-AI-Platform-SWE (gold) | `10_Areas/Career/Internships/Programs/Serious/` | All five headings, a dated origin | Five keys; `null` strings |
| 2027-Deepgram-SWE-VoiceAI | `10_Areas/Career/Internships/Programs/Serious/` | Real research | Same five keys |
