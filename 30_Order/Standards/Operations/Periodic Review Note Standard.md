---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: periodic-review-note
tier: 2
maps_to:
  - "[[Better Weekly]]"
  - "[[Better Month]]"
  - "[[Better Year]]"
used_by: []
gold_standard: none
notes:
  - "[[Daily Note Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[Enumerate Board]]"
---
# Periodic Review Note Standard
==A weekly, monthly, or yearly note is the personal ledger of a period: short, dated, and linked to the review that holds the evidence.==
This is the Standard for the notes in `10_Areas/Life/Enumerate/Weekly/`, `Monthly/`, and `Yearly/`. `/weekly-review` creates or patches the weekly note after it writes the Weekly Synthesis; the synthesis holds the audit, and this note holds the summary, goals, and fixes. Daily notes are [[Daily Note Standard]].
## Spec
```json
{
  "family": "periodic-review-note-weekly",
  "tier": 2,
  "match": {"type": "thought", "kind": "weekly", "path": "^10_Areas/Life/Enumerate/Weekly/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "active", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "thought_kind", "period"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Goals", "Productivity", "Good habits", "Bad habits", "Fixes"],
  "optional_headings": ["Check-in"],
  "legacy_match": [{"path": "^10_Areas/Life/Enumerate/Weekly/"}]
}
```
```json
{
  "family": "periodic-review-note-monthly",
  "tier": 2,
  "match": {"type": "thought", "kind": "monthly", "path": "^10_Areas/Life/Enumerate/Monthly/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "active", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "thought_kind", "period"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Productivity", "Fixes"],
  "optional_headings": [],
  "legacy_match": [{"path": "^10_Areas/Life/Enumerate/Monthly/"}]
}
```
```json
{
  "family": "periodic-review-note-yearly",
  "tier": 2,
  "match": {"type": "thought", "kind": "yearly", "path": "^10_Areas/Life/Enumerate/Yearly/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "active", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "thought_kind", "period"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Resolution checklist"],
  "optional_headings": ["Recap"],
  "legacy_match": [{"path": "^10_Areas/Life/Enumerate/Yearly/"}]
}
```
## Headings
### Frontmatter
`type: thought`, `thought_kind` (`weekly`, `monthly`, or `yearly`), `period` (`2026-W41`, `2026-06`, `2026`), `status` (`sprout` while filled, `complete` once reviewed), `created`, `updated`, `tags` (the kind), `next`. A weekly note adds `review`, a quoted link to its Weekly Synthesis, set by `/weekly-review`. The title is the file name. Below it, `> [!NOTE] Summary:` holds one sentence of the period.
> [!WARNING]
> An empty `created`. The 2026-W27 weekly has none, so it cannot be placed on a timeline.
### Goals (weekly)
The top items of the week, 80 first, taken from the synthesis. Each is a checkable outcome.
### Productivity (weekly, monthly)
What actually landed, with the note, commit, or number that shows it.
*Density:* evidence, not mood. "Only 5 daily notes in 18 days" is evidence; "a productive week" is not.
### Good habits and Bad habits (weekly)
One or two specific lines each, named by behavior.
### Fixes (weekly, monthly)
Each fix is one concrete change, not a wish.
> [!WARNING]
> A fix such as "be more disciplined". Write "run LeetCode before opening a browser tab".
### Check-in (weekly, optional)
Focus and discipline on the work, one line each. Health and relationship prompts belong in The Plan ([[AGENTS]], golden rule 6).
### Resolution checklist and Recap (yearly)
Builder goals, each with a measurable end state. Recap is added in December. Personal-life resolutions (gym, cooking, finances) live in The Plan.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `thought_kind: reflection` | `weekly`, `monthly`, or `yearly` by folder | mechanical |
| No `period` | From the file name | mechanical |
| `# 52 Weeks`, `# What made you better this month?` as the title | The file name; keep the question as a one-line callout if wanted | mechanical |
| `> [!NOTE] **Summary**:` | `> [!NOTE] Summary:` | mechanical |
| `related_progress` holding a Weekly Synthesis link | `review` | mechanical |
| `# Check-in` as a top-level heading | `## Check-in`, focus and discipline only | judgment |
| `# Recap` as a top-level heading | `## Recap` | mechanical |
| `tags: ["#brainstorm"]` | `[weekly]`, `[monthly]`, or `[yearly]` | mechanical |
| `status: seed` | `sprout`, or `complete` after review | mechanical |
| Gym, cooking, or finance resolutions in `Resolutions'26` | Move to The Plan | judgment |
## Done Conditions
- Frontmatter passes the Spec for its kind, with `period` matching the file name.
- Weekly: Goals and Fixes are filled from the synthesis and `review` links it.
- No health, money, or relationship content.
- Sections hold evidence, not mood.
## Gold Standard Example
None yet: no note has `thought_kind: weekly` and `period`. The closest weekly is [[2026-W39]], with a one-sentence summary, a link to its synthesis, evidenced Goals, and concrete Fixes, in the old shape.
