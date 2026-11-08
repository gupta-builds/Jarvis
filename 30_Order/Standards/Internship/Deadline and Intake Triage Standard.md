---
type: system
status: sprout
created: 2026-09-04
updated: 2026-11-07
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
This is the Standard for two notes kept by the manual deadline sweep: the intake log in `List/Dossiers/_Today/` and `Tracker/Deadline Tracker.md`. They sit outside the automated loop and outside [[Internship Notes Standard]], which governs dossiers once written. The sweep runs every three days on its own cadence ([[Internship Review System]]) and feeds both reviews and the Main Log.
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

| Item | Rule |
|---|---|
| Allowed folders | Intake log: `10_Areas/Career/Internships/List/Dossiers/_Today/`. Deadline Tracker: `10_Areas/Career/Internships/Tracker/Deadline Tracker.md`, one file. |
| File name | Intake log: the list it covers (`New Internships Listings`). The tracker is always `Deadline Tracker`. |
| Kind | Intake log: `type: input` with `input_kind: clipping`. Tracker: `type: dashboard` with `dashboard_kind: dashboard`. |
| Status | Intake log: `seed`. Tracker: `active`. |
## Headings
### Frontmatter
- **Write:** for the intake log, `type: input`, `input_kind: clipping`. For the Deadline Tracker, `type: dashboard`, `dashboard_kind: dashboard`, and `sweep_date`, the run date that anchors the bucket cutoffs.
- **Length:** one line per key.
- **Never:** a note with no frontmatter. Both intake logs and the tracker have none today.
- **Right:** None yet.
- **Wrong:** `# Current sweep`
### Intake log
- **Write:** one dated pass header per sweep, naming the exact source list and the exact slice covered. Under it, one line per candidate: a link, then a clause for the location and work-authorization signal, the deadline if stated, and any timing ambiguity flagged in the line instead of resolved by guess. Nothing here has passed Screen.
- **Length:** one line per candidate.
- **Never:** "a sample of", or logging a candidate as a match. A line here is worth a human look, not a vetted fit.
- **Right:** `## InternDock Guide 1 (summer-2027-internship-drop-august-2026)`
- **Wrong:** None seen.
### Deadline Tracker
- **Write:** five buckets re-anchored to `sweep_date` on every run: Already Over, Soon (within 7 days), Next Week (8 to 14), Next Month (15 to 45), Later. State the cutoff dates at the top. One line per dossier or Program: a wikilink and the deadline, marking a stated date apart from an anticipated one. Every live Program's `deadline_posted` and `deadline_real`, and every dossier's `deadline_posted` or `own_deadline`, are queried directly.
- **Length:** one line per dossier or Program.
- **Never:** a list built from the programs being traced that week. Already Over means the date passed, not that the posting closed.
- **Right:** `Cutoffs are anchored to today: **Soon** = through 2026-10-11;`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Every intake pass header names its source and exact range | "A sample of" cannot be repeated or audited | Reader |
| The tracker states its cutoffs and `sweep_date`, and they match the last run | Stale cutoffs put a past date in Soon | Reader |
| A candidate left in the intake log past one sweep cycle is flagged | A candidate nobody converts is a decision nobody made | Reader |
| Frontmatter is present with the keys above | Without it the notes are `unmapped` | Lint, check 1 |
| The tracker keeps only the current sweep; past sweeps live in the Main Log | A tracker that accumulates sweeps cannot be read at a glance | Reader |
| Every link in the tracker resolves | A dossier moved to `Viewed/` leaves a dead line | Lint, check 3 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Intake log or Deadline Tracker with no frontmatter (3 notes) | Add the keys above | Mechanical |
| `_Today/No Deadline.md` (retired 2026-10-04, holds no dossiers) | Delete, or redefine for a new condition | Judgment, needs a yes |
| Deadline Tracker body with many dated sweeps | Keep only the current sweep | Judgment |
| Tracker links to dossiers that moved (12 dead links) | Repoint to the dossier's current folder | Mechanical |
## Done Conditions
- Every intake pass header names its source and exact range.
- The Deadline Tracker states its cutoffs and `sweep_date`, and they match the last run.
- A candidate left in the intake log past one sweep cycle is flagged.
- The notes pass [[Vault Lint]] for `intake-log` and `deadline-tracker`.
## Gold Standard Example
[[10_Areas/Career/Internships/Tracker/Deadline Tracker]]: cutoffs stated at the top and a bucket per urgency. It does not pass lint: no frontmatter, 12 dead body links, and 22 extra blank lines.
Measured 2026-11-07: intake log 2 notes, deadline tracker 1; none pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Deadline Tracker (gold) | `10_Areas/Career/Internships/Tracker/` | Cutoffs and five buckets | Frontmatter, `sweep_date`, live links |
| New Internships Listings | `10_Areas/Career/Internships/List/Dossiers/_Today/` | Dated pass headers with exact slices | Frontmatter; 18 extra blank lines |
