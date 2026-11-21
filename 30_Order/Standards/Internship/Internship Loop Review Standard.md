---
type: system
status: sprout
created: 2026-08-23
updated: 2026-11-21
tags:
  - system
  - standards
  - internship
  - review
system_kind: standard
family: internship-loop-review
tier: 1
maps_to:
  - "[[Internship Loop Weekly Review Template]]"
  - "[[Internship Loop Monthly Review Template]]"
used_by:
  - "[[Internship Review System]]"
gold_standard: "[[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34]]"
notes:
  - "[[Review Standard]]"
  - "[[Internship Pipeline]]"
---
# Internship Loop Review Standard
==A review checks the loop's real output against what it was designed to do, citing the files and counts it actually read, and shows the weekly numbers and monthly decisions that Anant acts on.==
This is the Standard for the Weekly and Monthly reviews in `60_Claude/30_Reviews/Internship Loop/Scheduled/`. Anant runs both by hand; no schedule is claimed. It inherits [[Review Standard]]: cite the rows and files read, "nothing to report" is a valid finding, Decided Fixes holds only items at 100% clarity, and a review that finds a bug is not authorization to patch code. Quotas and limits are never copied into a review from memory: read them from Source of Truth and the loop's config and cite the file and the date read. It is not a note about one application.
## Spec
```json
{
  "family": "internship-loop-review-weekly",
  "template": "Internship Loop Weekly Review Template",
  "tier": 1,
  "match": {"type": "review", "kind": "internship-loop", "path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/"}],
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "review_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list", "next": "text?"},
  "headings": ["Period Covered", "Sources Reviewed", "Dossiers Written by Tier", "Applications and Follow-ups", "Loop Run Health", "Findings", "Immediate Actions", "Decided Fixes", "Open Questions", "Next Period's Watch List"],
  "optional_headings": []
}
```
```json
{
  "family": "internship-loop-review-monthly",
  "template": "Internship Loop Monthly Review Template",
  "tier": 1,
  "match": {"type": "review", "kind": "internship-loop", "path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/"}],
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "review_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list", "next": "text?"},
  "headings": ["Period Covered", "Sources Reviewed", "Tier Changes", "Quota and Limits", "Sources", "Keep Running", "Findings", "Immediate Actions", "Decided Fixes", "Open Questions", "Next Period's Watch List"],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/` or `Monthly/`. |
| File name | The review type, a separator, then the ISO week (`2026-W36`) or month (`2026-09`): `Internship Loop Weekly Review` or `Internship Loop Monthly Review`. |
| Kind | `type: review` with `review_kind: internship-loop`. |
| Status | `sprout` while open, `complete` once the review is filed. |
## Headings
Paths in the Right and Wrong lines start at `60_Claude/30_Reviews/Internship Loop/Scheduled/`.
### Frontmatter
- **Write:** `type: review`, `review_kind: internship-loop`, `status`, dates, `tags`, `notes` linking the Standard and the previous review, and `next`.
- **Length:** one line per key.
- **Never:** `type: evergreen` with tags `review` and `internship`. All four existing reviews have it, so none is found as a review.
- **Right:** None yet.
- **Wrong:** `type: evergreen` (`Weekly/Internship Loop Weekly Review — 2026-W34.md`)
### Period Covered and Sources Reviewed
- **Write:** the exact range, even when it is not seven days or one month. One line per source opened: the files, the latest Deadline Map, the Loop Status note, the loop's issues. An unread source is unchecked with a reason, never omitted.
- **Length:** one sentence for the range; one line per source.
- **Never:** a source that was not opened, ticked.
- **Right:** `2026-08-24 through 2026-09-04 (12 days, not 7` (`Weekly/Internship Loop Weekly Review — 2026-W36.md`)
- **Wrong:** None seen.
### Weekly: the three numbers
- **Write:** under `Dossiers Written by Tier`, the new dossiers this week by tier against the quota read from Source of Truth. Under `Applications and Follow-ups`, applications submitted this week and follow-ups overdue, counted from the Trackers. Under `Loop Run Health`, days since the last successful hourly run with failed runs counted, from the Loop Status note and `gh run list`, and the number of dossiers in `_Career Fair/`, which count toward the hard pause and which no mover archives. Anything a script can count is counted across the whole set, not sampled.
- **Length:** one number and one sentence of cause each.
- **Never:** an estimated count, or a number with no query named.
- **Right:** `Exact corpus-wide counts (287 live dossiers,` (`Weekly/Internship Loop Weekly Review — 2026-W36.md`)
- **Wrong:** `## Gate & Priority-Classification Conformance` (`Weekly/Internship Loop Weekly Review — 2026-W36.md`)
### Monthly: the four decisions
- **Write:** `Tier Changes` names any company that moves tier in `companies.yml`, with the evidence. `Quota and Limits` says whether quota or limits change and cites the file read. `Sources` says which sources to add or drop, with their yield. `Keep Running` says whether the loop keeps running and why. Each is a decision or an explicit "no change".
- **Length:** one paragraph or a short table each.
- **Never:** a section left out, or a decision with no evidence.
- **Right:** `confirmed by absence, not inferred.` (`Monthly/Internship Loop Monthly Review — 2026-09.md`)
- **Wrong:** None seen.
### Findings, Immediate Actions, Decided Fixes, Open Questions, Next Period's Watch List
- **Write:** as in [[Review Standard]]. Immediate Actions holds anything that cannot wait a period, including a regression producing bad output now, and any item that appeared in the same slot of two consecutive reviews of one type.
- **Length:** one bullet each.
- **Never:** a third carry of the same item.
- **Right:** `**One real miss, high confidence:**` (`Weekly/Internship Loop Weekly Review — 2026-W34.md`)
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The headings of the kind appear in order and none is empty | A review is read and compared by section | Lint, check 2 |
| `review_kind: internship-loop` and `type: review` | The reviews are found by kind | Lint, check 1 |
| Every claim traces to a file, count or log row, and counts are never estimated | Estimates repeat the drift the review should catch | Reader |
| Quotas and limits are read from Source of Truth or the loop's config on the day, never copied from a past review | A copied limit goes stale silently | Reader |
| Carryover escalation: an Open Question or Finding in the same slot of two consecutive reviews of one type moves to the next Immediate Actions | A third carry is a decision nobody made | Reader |
| The Weekly review opens every source it lists; the Monthly review names what it could not check | A silent gap looks like a clean result | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` with tags `review`, `internship` (all four) | `type: review`, `review_kind: internship-loop` | Mechanical |
| Weekly note with Gate Conformance, Standard Conformance, Priority Classification, Resource-Limit Health and Deadline Sweep Citation | The three number headings; fold any still-useful finding into Findings | Judgment |
| Monthly note with Pipeline Checklist, Per-Program Trace, Application Census, Health Check, Note-Shape Conformance | The four decision headings; keep a trace in Findings if it found a stall | Judgment |
| A target count or limit written into a review | Cite the file the number was read from | Judgment |
## Done Conditions
- Every claim traces to a file, count or log row, and no count is estimated.
- The weekly review shows the three numbers, and the monthly review makes the four decisions or says "no change".
- Decided Fixes holds only items at 100% clarity, and any two-sighting item sits in Immediate Actions.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34]]: the first real review, notable for what a full-corpus grep found that a sample would have missed. It does not pass lint: it is typed `evergreen` and uses the old headings. No review in the new shape exists.
Measured 2026-11-21 with `--family internship-loop-review-weekly` and `-monthly`: 2 notes each, none pass; none dated after 2026-09.
