---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: course-audit
tier: 1
maps_to: []
used_by: []
gold_standard: "[[40_Resources/UMN/The Plan/APAS|APAS]]"
notes:
  - "[[Degree Control Standard]]"
  - "[[Board Standard]]"
---
# Degree Audit Standard
==A degree audit note is a ledger: what the audit says, as of which date, and which differences between it and the plan are still unverified.==
This is the standard for the degree-requirement ledger in `40_Resources/UMN/The Plan/` (`class_kind: audit`): APAS and the minor requirement notes. Two notes qualify today. The other notes in that folder (`Community College`, `Extra Credits`) are fragments and are not covered. The audit feeds the term syllabus in [[Degree Control Standard]]; it is not coursework.
## Spec
```json
{
  "family": "course-audit",
  "tier": 1,
  "match": {"type": "class", "kind": "audit", "path": "^40_Resources/UMN/The Plan/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "class_kind", "status", "created", "updated", "tags", "notes", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Audit Metadata", "Credits", "Requirements", "Verification Queue"],
  "optional_headings": [],
  "legacy_match": [
    {"path": "^40_Resources/UMN/The Plan/(APAS|Entrepreneurship Minor)\\.md$"}
  ]
}
```
## Headings
### Frontmatter
`class_kind: audit`, `status` `tree` only right after a fresh audit is reconciled, otherwise `sprout`. `next` names the next reconciliation. `tags: [class, audit]`.
### Audit Metadata
The audit's source, the date it was generated, and the program it covers. Everything below is "as of" this date.
### Credits
Earned, in progress, and remaining credits, with the arithmetic.
### Requirements
The requirement groups (liberal education, major, minor, electives) with each one's state: met, in progress, or open. Use `###` per group.
### Verification Queue
Every difference between the audit and the plan that has not been checked, each with the source that would settle it. Clear an item only after checking that source.
> [!WARNING]
> Updating the plan from the old audit after a course drop. Reconcile a fresh audit first.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: evergreen` on APAS | `type: class`, `class_kind: audit` | Mechanical |
| `Lib ed requirements`, `Major Requirements`, `Elective Credits` | `###` groups under `Requirements` | Judgment |
| `Planning reconciliation before course selection` | `Verification Queue` | Judgment |
| `Details about the minor` (Entrepreneurship Minor) | `Requirements` | Judgment |
| `Community College` (brainstorm, 30 words), `Extra Credits` (personal statement) | Not audits; retype as `thought` or `reference` | Judgment |
## Done Conditions
- The audit date is explicit and every figure is as of that date.
- Credits reconcile.
- Every open difference is in the Verification Queue with its source.
- The note passes [[Vault Lint]] for `course-audit`.
## Gold Standard Example
[[40_Resources/UMN/The Plan/APAS|APAS]]: audit metadata, credits, requirement groups, and a planning reconciliation. It is typed `evergreen`, which the Legacy Shapes table retypes.
