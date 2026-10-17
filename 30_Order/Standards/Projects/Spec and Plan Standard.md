---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: project-spec-plan
tier: 1
maps_to:
  - "[[Project Spec Template]]"
  - "[[Project Plan Template]]"
used_by:
  - "[[Brief to Progress]]"
gold_standard: "[[20_Progress/Internship/Building System/Source of Truth|Source of Truth]]"
notes:
  - "[[Project Standard]]"
  - "[[Agent Prompt Standard]]"
  - "[[Note Type Registry]]"
---
# Spec and Plan Standard
==A spec closes what a thing is built to do, a plan orders how to get there, and both are corrected by dated layers that keep the original, never rewritten.==
This is the standard for the thinking that sits behind a project: `project_kind: spec` (what it is and what it will not do) and `project_kind: plan` (the order of work). They live in `20_Progress/` or `60_Claude/40_Project_Briefs/`. A transcript summary is a [[Brief Standard]] note; the status page is a [[Project Standard]] note.
## Spec
```json
{
  "family": "project-spec",
  "tier": 1,
  "match": {"type": "project", "kind": "spec", "path": "^(20_Progress|60_Claude/40_Project_Briefs)/", "where": {}, "where_not": {}},
  "legacy_match": [
    {"type": "project", "path": "^20_Progress/Internship/Building System/Source of Truth"},
    {"type": "project", "path": "^20_Progress/Projects/CS/TradingView/Canon/"},
    {"type": "project", "path": "^60_Claude/40_Project_Briefs/CausalOps/(Memory Layer|_Index)\\.md"}
  ],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["What This Is", "Current State", "Non-Goals"],
  "optional_headings": ["Definition of Done", "Next Action", "Open Questions", "Corrections", "Evidence", "Related Notes"]
}
```
```json
{
  "family": "project-plan",
  "tier": 1,
  "match": {"type": "project", "kind": "plan", "path": "^(20_Progress|60_Claude/40_Project_Briefs)/", "where": {}, "where_not": {}},
  "legacy_match": [
    {"type": "project", "path": "^20_Progress/Internship/Building System/Research Loop - (Implementation|Improvement) Plan"},
    {"type": "project", "path": "^60_Claude/40_Project_Briefs/CausalOps/(Memory Layer Implementation Plan|Roadmap)\\.md"}
  ],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Goal", "Sequence", "Open Questions"],
  "optional_headings": ["Current State", "Non-Goals", "Decisions", "Done When", "Next Action", "Corrections", "Evidence", "Related Notes"]
}
```
## Headings
### Frontmatter
`project_kind` is `spec` or `plan`. `next` is the one thing to do with this note, `none` once the note is final or archived. A superseded spec or plan sets `status: archived`; superseded notes have been left `active`.
### What This Is (spec)
The closed statement of what the system does and for whom, opening with a single `==highlight==` sentence.
*Density:* a short opening plus the few sections the system needs; Source of Truth uses its gates, classification, and pipeline.
### Current State (spec)
What is built versus specified, dated. Every claim about code cites a file and line, a commit, or command output, and a claim that was checked live says when.
> [!WARNING]
> Spec text that describes the design as if it were shipped.
### Non-Goals (spec)
What the system deliberately does not do, one bullet each. Real notes call it Explicit Non-Goals or Out of Scope.
### Goal (plan)
The outcome in one sentence, as the `==highlight==` anchor.
### Sequence (plan)
Ordered steps by dependency, each with the way to tell it is done. Name what is explicitly out of scope this round.
*Density:* a numbered list; a long prompt belongs in an [[Agent Prompt Standard]] note.
### Open Questions (plan)
`- [ ]` tasks for decisions that block the sequence.
### Corrections
When a claim turns out wrong, keep the original text and add a dated section: `## Corrections` with what was wrong, how it was found, and what replaced it.
> [!WARNING]
> Quietly editing the original so the history disappears. Layering, with the original kept, is how these notes stay trustworthy.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Type `project` with no `project_kind` | `project_kind: spec` or `plan` by content | Judgment |
| `status: tree` or `sprout` | `active`, or `complete` if final | Judgment |
| Spec headings: What This System Is, The End Goal, Explicit Non-Goals, Out of Scope | What This Is, Non-Goals | Judgment |
| Plan headings: Path To N, Priority 1..N, Implementation Sequence, Execution Plan | Sequence | Judgment |
| `## 2026-10-03 — Corrections (original text above kept)` | `## Corrections` with a dated entry inside | Mechanical |
| Portfolio design docs typed `concept` (about 85) | `type: project`, `project_kind: spec` | Judgment |
| Roadmap with a status table | `project_kind: plan`; the table goes under Current State | Judgment |
## Done Conditions
- `project_kind` is set and matches the note, and `next` is live or `none`.
- A spec has What This Is, Current State, and Non-Goals; a plan has Goal, Sequence, and Open Questions.
- Code claims cite evidence, and corrections keep the original.
- The note passes [[Vault Lint]] for `project-spec` or `project-plan`.
## Gold Standard Example
[[20_Progress/Internship/Building System/Source of Truth|Source of Truth]] for a spec: a highlighted lead, hard gates, explicit non-goals, and a dated corrections layer that keeps the original. [[20_Progress/Internship/Building System/Research Loop - Improvement Plan|Improvement Plan]] for a plan: verdict, causes, a prioritized path, blocking decisions, and a correction. Both still carry `status` values outside the vocabulary.
