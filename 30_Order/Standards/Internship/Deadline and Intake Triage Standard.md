---
type: system
status: sprout
created: 2026-09-04
updated: 2026-10-16
tags:
  - system
  - standards
  - internship
  - triage
system_kind: standard
family: deadline-triage
tier: 2
maps_to: []
used_by: []
gold_standard: "[[10_Areas/Career/Internships/Tracker/Deadline Tracker]]"
notes:
  - "[[Internship Pipeline]]"
  - "[[Internship Notes Standard]]"
  - "[[Internship Loop Review Standard]]"
  - "[[Internship Review System]]"
---
# Deadline and Intake Triage Standard
==Intake logs candidates before anyone decides on them; the Deadline Tracker shows what is due and when. Both are maintained by a sweep, and neither is a gate.==
This is the standard for two notes kept by the manual deadline sweep: the intake log in `List/Dossiers/_Today/` and `Tracker/Deadline Tracker.md`. They sit outside the automated loop and outside [[Internship Notes Standard]], which governs dossiers once written. The sweep runs every three days on its own cadence ([[Internship Review System]]) and feeds both reviews and the Main Log.
## Spec
```json
{
  "family": "intake-log",
  "tier": 2,
  "match": {"type": "input", "kind": "clipping", "path": "^10_Areas/Career/Internships/List/Dossiers/_Today/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^10_Areas/Career/Internships/List/Dossiers/_Today/(?!No Deadline).*\\.md$"}],
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "input_kind", "status", "created", "updated", "tags"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": []
}
```
```json
{
  "family": "deadline-tracker",
  "tier": 2,
  "match": {"type": "dashboard", "kind": "dashboard", "path": "^10_Areas/Career/Internships/Tracker/Deadline Tracker\\.md$", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^10_Areas/Career/Internships/Tracker/Deadline Tracker\\.md$"}],
  "status": ["active", "archived"],
  "required_keys": ["type", "dashboard_kind", "status", "created", "updated", "tags", "sweep_date"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "sweep_date": "date"},
  "headings": ["Already Over", "Soon", "Next Week", "Next Month", "Later"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
Intake log: `type: input`, `input_kind: clipping`. Deadline Tracker: `type: dashboard`, `dashboard_kind: dashboard`, and `sweep_date`, the run date that anchors the bucket cutoffs.
### Intake log
One dated pass header per sweep, naming the exact source list and the exact slice covered, such as "entries 1-125 of 136". Never "a sample of". Under it, one line per candidate: a link, then a clause for the location and work-authorization signal, the deadline if stated, and any timing ambiguity flagged in the line instead of resolved by guess. Nothing here has passed Screen. A candidate becomes a dossier with the normal frontmatter, becomes a Program directly as a manual find, or is dropped. One left unconverted after a full sweep cycle is flagged.
> [!WARNING]
> Logging a candidate as a match. A line here is worth a human look, not a vetted fit.
### Deadline Tracker
Five buckets re-anchored to `sweep_date` on every run: Already Over, Soon (within 7 days), Next Week (8 to 14), Next Month (15 to 45), Later. State the cutoff dates at the top. One line per dossier or Program: a wikilink and the deadline, marking a stated date apart from an anticipated one. Every live Program's `deadline_posted` and `deadline_real`, and every dossier's `deadline_posted` or `own_deadline`, are queried directly, never built from the programs being traced that week.
Already Over means the date passed, not that the posting closed. Confirm closure by hand.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Intake log or Deadline Tracker with no frontmatter | Add the keys above | mechanical |
| `_Today/No Deadline.md` (retired 2026-10-04, holds no dossiers) | Delete, or redefine for a new condition | judgment, needs a yes |
| Deadline Tracker body with many dated sweeps | Keep only the current sweep; the log of past ones is the Main Log | judgment |
## Done Conditions
- Every intake pass header names its source and exact range.
- The Deadline Tracker states its cutoffs and `sweep_date`, and they match the last run.
- A candidate left in the intake log past one sweep cycle is flagged.
## Gold Standard Example
[[10_Areas/Career/Internships/Tracker/Deadline Tracker]]: cutoffs stated at the top and a bucket per urgency. It has no frontmatter yet and holds more than the current sweep.
