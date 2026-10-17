---
type: system
status: sprout
created: 2026-08-23
updated: 2026-10-16
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
  - "[[Deadline and Intake Triage Standard]]"
  - "[[Internship Pipeline]]"
---
# Internship Loop Review Standard
==A review checks the loop's real output against what it was designed to do, citing the files and counts it actually read, never a summary of dossier counts alone.==
This is the content standard for the Weekly Discovery Review and the Monthly Promotion Review in `60_Claude/30_Reviews/Internship Loop/Scheduled/`. It inherits [[Review Standard]] unchanged: cite the rows and files read, "nothing to report" is a valid finding, Decided Fixes holds only items at 100% clarity, and a review that finds a bug is not authorization to patch code. The Weekly review covers pipeline step 1 (automated discovery, which fails in reproducible, bug-shaped ways). The Monthly review covers steps 2 to 9 (human judgment, which stalls). A third check, the Deadline Sweep, runs every three days on its own; both reviews cite its latest output instead of rebuilding deadlines by hand.
## Spec
```json
{
  "family": "internship-loop-review-weekly",
  "tier": 1,
  "match": {"type": "review", "kind": "internship-loop", "path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/"}],
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "review_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list", "next": "text?"},
  "headings": ["Period Covered", "Sources Reviewed", "Sample & Method", "Gate Conformance", "Standard Conformance", "Priority Classification Accuracy", "Resource-Limit Health", "Deadline Sweep Citation", "Findings", "Immediate Actions", "Decided Fixes", "Open Questions", "Next Period's Watch List"],
  "optional_headings": []
}
```
```json
{
  "family": "internship-loop-review-monthly",
  "tier": 1,
  "match": {"type": "review", "kind": "internship-loop", "path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/", "where": {}, "where_not": {}},
  "legacy_match": [{"path": "^60_Claude/30_Reviews/Internship Loop/Scheduled/Monthly/"}],
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "review_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list", "next": "text?"},
  "headings": ["Period Covered", "Sources Reviewed", "Pipeline Checklist", "Per-Program Trace", "Deadline Sweep Reconciliation", "Application Census", "Health Check", "Note-Shape Conformance", "Findings", "Immediate Actions", "Decided Fixes", "Open Questions", "Next Period's Watch List"],
  "optional_headings": []
}
```
## Headings
Frontmatter: `type: review`, `review_kind: internship-loop`, `status` `sprout` while open and `complete` once filed in the MOC. File names keep the existing pattern: the review type, a separator, then the ISO week (`2026-W36`) or month (`2026-09`); see the Gold Standard Example.
### Weekly Discovery Review
| Heading | Holds |
|---|---|
| Period Covered | The exact range, even when it is not seven days |
| Sources Reviewed | Four boxes, always: sampled dossier paths, Dossiers MOC capacity table, Excluded log, latest Deadline Sweep. An unread source is unchecked with a reason, never omitted |
| Sample & Method | Sample size and how it was chosen. Anything a script can count (field compliance, `matched_reason`) is grepped across the whole corpus |
| Gate Conformance | The sample against the four hard gates: timing, US location, OPT, CS relevance. Cite file and gate |
| Standard Conformance | [[Internship Notes Standard]] fraction, counted, not estimated |
| Priority Classification Accuracy | Whether each sampled posting sits in the right bucket |
| Resource-Limit Health | Bucket counts against the 50 threshold and issues that should have fired |
| Deadline Sweep Citation | The latest sweep's Already Over and Soon buckets, with its header date |
| Findings, Decided Fixes, Open Questions | As in [[Review Standard]] |
| Immediate Actions | Anything that cannot wait a period, including a regression producing bad output now |
| Next Period's Watch List | What to recheck, including promoted carryovers |
### Monthly Promotion Review
| Heading | Holds |
|---|---|
| Sources Reviewed | Every folder opened: Programs, Contacts, Tracker, Applying, Preperation, and the latest sweep |
| Pipeline Checklist | The month graded against the Pipeline's Done When |
| Per-Program Trace | Noted to result for each note trio, flagging stalls |
| Deadline Sweep Reconciliation | A real query of every live Program's deadline against the sweep's Already Over bucket, never a hand-built list |
| Application Census | Counted Ended, Missed, Serious, Considering, not yet reached out, and not yet researched, each with its query |
| Health Check | Applications submitted against 500 by 2026-12-31, days left, required rate, actual rate. State the gap every time it is still true |
| Note-Shape Conformance | Program, Contact, Tracker, and Applying notes against their Standards, naming checks that were blocked |
> [!WARNING]
> Carryover Escalation: an Open Question or Finding that appears in the same slot in two consecutive reviews of one type is promoted to the next review's Immediate Actions, not carried a third time.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` with tags `review`, `internship` | `type: review`, `review_kind: internship-loop` | mechanical |
| Weekly note with "Gate & Priority-Classification Conformance" merged | Split into Gate Conformance and Priority Classification Accuracy | judgment |
| Weekly note with no Deadline Sweep Citation or Immediate Actions | Add both | judgment |
## Done Conditions
- Every claim traces to a file, count, or log row, and counts are never estimated.
- The Weekly review checks all four sources, and the Monthly review names what it could not check.
- Decided Fixes holds only items at 100% clarity, and any two-sighting item sits in Immediate Actions.
- The review is linked from the Reviews MOC and reflected in the Main Log.
## Gold Standard Example
[[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34]]: the first real review, notable for what a full-corpus grep found that a sample would have missed. It predates the review type and the Immediate Actions section.
