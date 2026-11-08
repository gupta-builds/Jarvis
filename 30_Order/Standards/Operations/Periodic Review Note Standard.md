---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
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
gold_standard: "[[10_Areas/Life/Enumerate/Weekly/2026-W44|2026-W44]]"
notes:
  - "[[Daily Note Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[Enumerate Board]]"
---
# Periodic Review Note Standard
==A weekly, monthly, or yearly note is the personal ledger of a period: short, dated, and linked to the review that holds the evidence.==
This is the Standard for the notes in `10_Areas/Life/Enumerate/Weekly/`, `Monthly/`, and `Yearly/`. It is not the Weekly Synthesis, which holds the audit ([[Capability Review Standard]]), and not the daily note ([[Daily Note Standard]]). This note holds the summary, goals, and fixes, and no health, money, or relationship content: that belongs in The Plan ([[AGENTS]], golden rule 6).
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

| Item | Rule |
|---|---|
| Allowed folders | `10_Areas/Life/Enumerate/Weekly/`, `Monthly/`, or `Yearly/`, by kind. |
| File name | The period: `2026-W44`, `2026-06`, `2026`. The title is the file name. |
| Kind | `type: thought` with `thought_kind: weekly`, `monthly`, or `yearly`, and `period` equal to the file name. |
| Status | `sprout` while filled, `complete` once reviewed. |
## Headings
### Frontmatter
- **Write:** `thought_kind`, `period`, `status`, `created`, `updated`, `tags` (the kind), `next`. A weekly note adds `review`, a quoted link to its Weekly Synthesis. Below the title, `> [!NOTE] Summary:` holds one sentence of the period.
- **Length:** one line per key; one summary sentence.
- **Never:** `thought_kind: reflection` or a missing `period`. The note then matches no kind and cannot be placed on a timeline.
- **Right:** `period: "2026-W44"`
- **Wrong:** `thought_kind: reflection`
### Goals (weekly)
- **Write:** the top items of the week, 80 first, taken from the Weekly Synthesis. Each is a checkable outcome.
- **Length:** five to eight items.
- **Never:** a goal with no way to tell it is done.
- **Right:** `- [ ] CSCI 4061 Project 2 submitted by Fri 10/30.`
- **Wrong:** None seen.
### Productivity (weekly and monthly)
- **Write:** what actually landed, with the note, commit, or number that shows it.
- **Length:** three to six lines.
- **Never:** mood. "A productive week" is not evidence.
- **Right:** None yet.
- **Wrong:** None seen.
### Good habits and Bad habits (weekly)
- **Write:** specific behaviors, named by what happened.
- **Length:** one or two lines each.
- **Never:** a trait ("disciplined").
- **Right:** None yet.
- **Wrong:** None seen.
### Fixes (weekly and monthly)
- **Write:** each fix is one concrete change.
- **Length:** three to five lines.
- **Never:** a wish such as "be more disciplined".
- **Right:** `Put the four assessment outcomes and the Project 2 and Lab 7 Gradescope status on their Boards.`
- **Wrong:** None seen.
### Check-in (weekly)
- **Write:** optional. Focus and discipline on the work, one line each.
- **Length:** two lines.
- **Never:** health or relationship prompts. They belong in The Plan.
- **Right:** `Focus:`
- **Wrong:** `> [!QUESTION] Rate yourself on focus, health, discipline, and connection`
### Resolution checklist and Recap (yearly)
- **Write:** builder goals, each with a measurable end state. Recap is added in December.
- **Length:** a checklist of up to ten goals.
- **Never:** personal-life resolutions (gym, cooking, finances). They live in The Plan.
- **Right:** None yet.
- **Wrong:** `# What made you better this Year?`
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| `thought_kind` and `period` are set, and `period` matches the file name | The kind and the timeline come from them | Lint, check 1 |
| Weekly: Goals and Fixes are filled from the synthesis, and `review` links it | The synthesis holds the evidence | Reader |
| No health, money, or relationship content | Jarvis holds execution, not personal life | Reader |
| Sections hold evidence, not mood | "Only 5 daily notes in 18 days" is evidence; "a productive week" is not | Reader |
| The four weekly headings appear (Tier 2 does not enforce them) | `/weekly-review` patches by section name | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `thought_kind: reflection` (Monthly and Yearly notes) | `weekly`, `monthly`, or `yearly` by folder | Mechanical |
| No `period` | From the file name | Mechanical |
| `# 52 Weeks`, `# What made you better this month?` as the title | The file name; keep the question as a one-line callout if wanted | Mechanical |
| `> [!NOTE] **Summary**:` | `> [!NOTE] Summary:` | Mechanical |
| `related_progress` holding a Weekly Synthesis link | `review` | Mechanical |
| `# Check-in` or `# Recap` as a top-level heading | `## Check-in` (focus and discipline only), `## Recap` | Mechanical |
| `tags: ["#brainstorm"]` | `[weekly]`, `[monthly]`, or `[yearly]` | Mechanical |
| `status: seed` | `sprout`, or `complete` after review | Mechanical |
| Gym, cooking, or finance resolutions in `Resolutions'26` | Move to The Plan | Judgment |
## Done Conditions
- Frontmatter passes the Spec for its kind, with `period` matching the file name.
- Weekly: Goals and Fixes are filled from the synthesis and `review` links it.
- No health, money, or relationship content.
- Sections hold evidence, not mood.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[10_Areas/Life/Enumerate/Weekly/2026-W44|2026-W44]]: `thought_kind`, `period`, a quoted `review` link, a one-sentence summary, checkable Goals, and concrete Fixes. It does not pass lint: 13 extra blank lines, and its Productivity, Good habits, and Bad habits sections still hold only the template comment.
Measured 2026-11-07: weekly 9 notes, 1 passes (`2026-W45`, an unfilled template); monthly 1 note and yearly 2 notes, none pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| 2026-W44 (gold) | `10_Areas/Life/Enumerate/Weekly/` | Goals and Fixes with evidence | Blank lines; three sections empty |
| 2026-W45 | `10_Areas/Life/Enumerate/Weekly/` | Passes lint | Unfilled |
| 2026-06 | `10_Areas/Life/Enumerate/Monthly/` | The first monthly | `thought_kind: reflection`, no `period`, `#` in tags |
| 2026 | `10_Areas/Life/Enumerate/Yearly/` | The first yearly | Same, and an empty `updated` |
