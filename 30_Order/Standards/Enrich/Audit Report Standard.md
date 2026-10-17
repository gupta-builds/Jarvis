---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
  - review
system_kind: standard
family: audit-report
tier: 1
maps_to:
  - "[[30_Order/Templates/Capability/Audit Report Template|Audit Report Template]]"
used_by: []
gold_standard: "[[60_Claude/20_Distilled_Notes/Jarvis Systems Audit - Retrieval, Sync, and Plugins (2026-08-21)]]"
notes:
  - "[[Review System]]"
  - "[[Capability Review Standard]]"
---
# Audit Report Standard
==An audit reports what a system actually does, with one counted finding at a time and an ordered list of what to do about it.==
This is the standard for a one-off review of a system, pipeline, or change set: a vault audit, an ingestion pipeline audit, a convergence change report. It is not a periodic review ([[Capability Review Standard]], [[Review Standard]]) and not a plan. Audits live in `60_Claude/30_Reviews/`. Two audits sit in `20_Distilled_Notes/` today and are misplaced, because a distilled note is a concept you understand, not a report.
## Spec
```json
{
  "family": "audit-report",
  "tier": 1,
  "match": {"type": "review", "kind": "audit", "path": "^60_Claude/30_Reviews/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "review_kind", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Summary", "Findings", "Priority Queue", "Open Questions"],
  "optional_headings": ["Scope", "What Changed"],
  "legacy_match": [
    {"path": "^60_Claude/30_Reviews/Vault-Audit-2026-05-29\\.md$"},
    {"path": "^60_Claude/30_Reviews/Jarvis Enrichment Phase 1 . 2026-04-24\\.md$"},
    {"path": "^60_Claude/30_Reviews/North Star Convergence . Change Report 2026-06-11\\.md$"},
    {"path": "^60_Claude/20_Distilled_Notes/Ingestion Pipeline Audit"},
    {"path": "^60_Claude/20_Distilled_Notes/Jarvis Systems Audit"},
    {"path": "^60_Claude/30_Reviews/Monthly/Monthly Review . 2026-06\\.md$"}
  ]
}
```
## Headings
### Summary
What was audited, the date, and the verdict in two or three sentences. Put the scope here if it fits; use the optional `Scope` heading when the audit covers several systems.
*Density:* short. The reader should know the verdict without scrolling.
### Findings
Numbered, one problem each, as a `###` heading that states the claim and a paragraph that proves it with a count, a file, or a log row. A finding corrected mid-audit says so in place.
> [!WARNING]
> A number reported without checking how it was produced. One audit's "5,354 broken wikilinks" was mostly a parser bug, found only because the finding showed its method.
### Priority Queue
An ordered list of next actions, each tied to the finding it answers, with the highest-leverage item first. Decisions that only the owner can make are marked as such.
### Open Questions
`- [ ]` tasks for anything the audit could not settle.
### What Changed
Optional. If the audit also made changes, list the files touched and what was deliberately left alone.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Headings such as `Why this audit exists`, `Session goal and decisions locked`, `Summary` | `Summary` | judgment |
| `Finding 1 - ...` as `##` headings | `Findings`, one `###` per finding | judgment |
| `Priority queue`, `Next`, `Next thread`, `Recommended Next Commands` | `Priority Queue` | judgment |
| `type: evergreen`, `project`, or `plan` | `type: review`, `review_kind: audit` | mechanical |
| An audit in `20_Distilled_Notes/` | Move it to `60_Claude/30_Reviews/` | judgment, needs a yes |
| `Monthly Review 2026-06`, the one monthly review, a one-off scorecard | Treat as an audit; no monthly cadence exists | judgment |
## Done Conditions
- The Summary states the verdict, and every finding shows how it was measured.
- Priority Queue items each name the finding they answer.
- Nothing the audit changed went unlisted.
## Gold Standard Example
[[60_Claude/20_Distilled_Notes/Jarvis Systems Audit - Retrieval, Sync, and Plugins (2026-08-21)]]: findings that state a claim and show the method, one corrected mid-session, then an ordered queue. It sits in the wrong folder, which the Legacy Shapes table fixes.
