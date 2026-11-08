---
type: system
status: sprout
created: 2026-08-23
updated: 2026-11-07
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
This is the Standard for the Weekly Discovery Review and the Monthly Promotion Review in `60_Claude/30_Reviews/Internship Loop/Scheduled/`. It inherits [[Review Standard]]: cite the rows and files read, "nothing to report" is a valid finding, Decided Fixes holds only items at 100% clarity, and a review that finds a bug is not authorization to patch code. The Weekly review covers pipeline step 1 (automated discovery, which fails in reproducible, bug-shaped ways). The Monthly review covers steps 2 to 9 (human judgment, which stalls). It is not the Deadline Sweep, which both reviews cite ([[Deadline and Intake Triage Standard]]).
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
  "headings": ["Period Covered", "Sources Reviewed", "Sample & Method", "Gate Conformance", "Standard Conformance", "Priority Classification Accuracy", "Resource-Limit Health", "Deadline Sweep Citation", "Findings", "Immediate Actions", "Decided Fixes", "Open Questions", "Next Period's Watch List"],
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
  "headings": ["Period Covered", "Sources Reviewed", "Pipeline Checklist", "Per-Program Trace", "Deadline Sweep Reconciliation", "Application Census", "Health Check", "Note-Shape Conformance", "Findings", "Immediate Actions", "Decided Fixes", "Open Questions", "Next Period's Watch List"],
  "optional_headings": []
}
```

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/` or `Monthly/`. |
| File name | The review type, a separator, then the ISO week (`2026-W36`) or month (`2026-09`): `Internship Loop Weekly Review` or `Internship Loop Monthly Review`. |
| Kind | `type: review` with `review_kind: internship-loop`. |
| Status | `sprout` while open, `complete` once filed in the Reviews MOC. |
## Headings
### Frontmatter
- **Write:** `type: review`, `review_kind: internship-loop`, `status`, dates, `tags`, `notes` linking the Standards and the previous review, and `next`.
- **Length:** one line per key.
- **Never:** `type: evergreen` with tags `review` and `internship`. All four existing reviews have it, so none is found as a review.
- **Right:** None yet.
- **Wrong:** `type: evergreen`
### Weekly: Period Covered and Sources Reviewed
- **Write:** the exact range, even when it is not seven days. Four source boxes, always: sampled dossier paths, the Dossiers MOC capacity table, the Excluded log, the latest Deadline Sweep. An unread source is unchecked with a reason, never omitted.
- **Length:** one sentence for the range; one line per source.
- **Never:** a source that was not opened, ticked.
- **Right:** `2026-08-24 through 2026-09-04 (12 days, not 7`
- **Wrong:** None seen.
### Weekly: Sample & Method, Gate Conformance, Standard Conformance
- **Write:** sample size and how it was chosen (anything a script can count is grepped across the whole corpus); the sample against the four hard gates (timing, US location, OPT, CS relevance), citing file and gate; the [[Internship Notes Standard]] fraction, counted.
- **Length:** a paragraph per section.
- **Never:** an estimated count, or Gate and Priority merged into one heading.
- **Right:** `Exact corpus-wide counts (287 live dossiers,`
- **Wrong:** `## Gate & Priority-Classification Conformance`
### Weekly: Priority Classification Accuracy, Resource-Limit Health, Deadline Sweep Citation
- **Write:** whether each sampled posting sits in the right bucket; bucket counts against the 50 threshold and issues that should have fired; the latest sweep's Already Over and Soon buckets, with its header date.
- **Length:** a short paragraph or table each.
- **Never:** a deadline list rebuilt by hand. Cite the sweep.
- **Right:** `**One real miss, high confidence:**`
- **Wrong:** None seen.
### Monthly: Pipeline Checklist, Per-Program Trace, Deadline Sweep Reconciliation
- **Write:** the month graded against the Pipeline's Done When; noted to result for each note trio, flagging stalls; a real query of every live Program's deadline against the sweep's Already Over bucket.
- **Length:** a table or one paragraph per batch.
- **Never:** a hand-built deadline list.
- **Right:** `confirmed by absence, not inferred.`
- **Wrong:** None seen.
### Monthly: Application Census, Health Check, Note-Shape Conformance
- **Write:** counted Ended, Missed, Serious, Considering, not yet reached out, and not yet researched, each with its query. Applications submitted against 500 by 2026-12-31, days left, required rate, actual rate, with the gap stated every time it is still true. Program, Contact, Tracker, and Applying notes against their Standards, naming checks that were blocked.
- **Length:** a table plus two sentences.
- **Never:** a section left out. Both existing monthly notes lack all three.
- **Right:** None yet.
- **Wrong:** None seen.
### Findings, Immediate Actions, Decided Fixes, Open Questions, Next Period's Watch List
- **Write:** as in [[Review Standard]]. Immediate Actions holds anything that cannot wait a period, including a regression producing bad output now, and any item that appeared in the same slot of two consecutive reviews of one type.
- **Length:** one bullet each.
- **Never:** a third carry of the same item.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The thirteen headings of the kind appear in order and none is empty | A review is read and compared by section | Lint, check 2 |
| `review_kind: internship-loop` and `type: review` | The reviews are found by kind | Lint, check 1 |
| Every claim traces to a file, count, or log row, and counts are never estimated | Estimates repeat the drift the review should catch | Reader |
| Carryover Escalation: an Open Question or Finding in the same slot of two consecutive reviews of one type moves to the next Immediate Actions | A third carry is a decision nobody made | Reader |
| The Weekly review checks all four sources; the Monthly review names what it could not check | A silent gap looks like a clean result | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` with tags `review`, `internship` (all four) | `type: review`, `review_kind: internship-loop` | Mechanical |
| Weekly note with "Gate & Priority-Classification Conformance" merged | Split into Gate Conformance and Priority Classification Accuracy | Judgment |
| Weekly note with no Deadline Sweep Citation or Immediate Actions | Add both | Judgment |
| Monthly note with "Note-Shape Conformance - Provisional" and no Application Census, Health Check, or Deadline Sweep Reconciliation | Add the three; drop the suffix | Judgment |
## Done Conditions
- Every claim traces to a file, count, or log row, and counts are never estimated.
- The Weekly review checks all four sources, and the Monthly review names what it could not check.
- Decided Fixes holds only items at 100% clarity, and any two-sighting item sits in Immediate Actions.
- The review is linked from the Reviews MOC and reflected in the Main Log.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[60_Claude/30_Reviews/Internship Loop/Scheduled/Weekly/Internship Loop Weekly Review — 2026-W34]]: the first real review, notable for what a full-corpus grep found that a sample would have missed. It does not pass lint: it is typed `evergreen`, and lacks Deadline Sweep Citation and Immediate Actions.
Measured 2026-11-07: weekly 2 notes, monthly 2 notes; none pass.
