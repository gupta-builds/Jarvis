---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: project-spec-plan
tier: 1
maps_to:
  - "[[Project Spec Template]]"
  - "[[Project Plan Template]]"
used_by: []
gold_standard: "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
notes:
  - "[[Project Standard]]"
  - "[[Agent Prompt Standard]]"
  - "[[Note Type Registry]]"
---
# Spec and Plan Standard
==A spec closes what a thing is built to do, a plan orders how to get there, and both are corrected by dated layers that keep the original, never rewritten.==
This is the Standard for the thinking that sits behind a project: `project_kind: spec` (what it is and what it will not do) and `project_kind: plan` (the order of work). It is not the status page of the project ([[Project Standard]]), not a transcript summary ([[Brief Standard]]), and not a prompt for an agent ([[Agent Prompt Standard]]).
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

| Item | Rule |
|---|---|
| Allowed folders | `20_Progress/` or `60_Claude/40_Project_Briefs/`, next to the project. |
| File name | The subject plus `Spec`, `Design`, or `Plan` (`Conversation Loop Design`, `Plan - Jesse`). Unique in the vault. |
| Kind | `type: project` with `project_kind: spec` or `plan`. |
| Status | `active` while it governs work, `complete` when final, `archived` when superseded. A superseded spec or plan is never left `active`. |
## Headings
### Frontmatter
- **Write:** `project_kind` (`spec` or `plan`), `status`, dates, `tags`, and `next`, the one thing to do with this note, `none` once the note is final or archived.
- **Length:** one line per key.
- **Never:** a status outside the project vocabulary, such as `tree` or `sprout`. Both exist on specs and plans today.
- **Right:** `project_kind: plan`
- **Wrong:** `status: tree`
### What This Is (spec)
- **Write:** the closed statement of what the system does and for whom, opening with a single `==highlight==` sentence.
- **Length:** a short opening plus the few sections the system needs.
- **Never:** the heading "What This System Is" or "The End Goal": they hide the section from the Spec.
- **Right:** `==A weekly habit in which you read a sample of your own Claude Code prompts`
- **Wrong:** `## What This System Is`
### Current State (spec)
- **Write:** what is built versus specified, dated. Every claim about code cites a file and line, a commit, or command output, and a claim checked live says when.
- **Length:** a dated paragraph and a table of parts.
- **Never:** spec text that describes the design as if it were shipped.
- **Right:** `Measured on the Acer on 2026-10-30. Capture works and nothing reads it yet.`
- **Wrong:** None seen.
### Non-Goals (spec)
- **Write:** what the system deliberately does not do, one item each.
- **Length:** a list of two to eight items.
- **Never:** the headings "Explicit Non-Goals" or "Out of Scope".
- **Right:** `Recursive self-improvement, automatic rule writing, a score or leaderboard for sessions`
- **Wrong:** `## Explicit Non-Goals`
### Goal (plan)
- **Write:** the outcome, as the `==highlight==` anchor.
- **Length:** one sentence.
- **Never:** a list of tasks.
- **Right:** `==By October 2027, this mentorship has converted into a landed internship`
- **Wrong:** None seen.
### Sequence (plan)
- **Write:** ordered steps by dependency, each with the way to tell it is done. Name what is explicitly out of scope this round.
- **Length:** a numbered list. A long prompt belongs in an [[Agent Prompt Standard]] note.
- **Never:** the headings "Path To N", "Priority 1..N", "Implementation Sequence", or "Execution Plan".
- **Right:** `1. Send the outreach email, ready in [[Initial Outreach]], proposing a first meeting before 2026-11-02.`
- **Wrong:** `## Priority 1`
### Open Questions (plan)
- **Write:** `- [ ]` tasks for decisions that block the sequence. An answered one is ticked, with the answer and date.
- **Length:** one sentence each.
- **Never:** a question that does not block the sequence.
- **Right:** `- [ ] Finish deciding and dating the five "20" goals above once priorities are confirmed with Jesse directly.`
- **Wrong:** None seen.
### Corrections
- **Write:** when a claim turns out wrong, keep the original text and add a dated `## Corrections` section: what was wrong, how it was found, what replaced it.
- **Length:** one dated entry per correction.
- **Never:** a quiet edit of the original so the history disappears.
- **Right:** `## Corrections`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| A spec has What This Is, Current State, Non-Goals; a plan has Goal, Sequence, Open Questions | Skills and readers find them by name | Lint, check 2 |
| `project_kind` is set and matches the note, and `next` is live or `none` | The dashboard reads `next` | Lint, check 1 |
| Code claims cite evidence | A claim about code without evidence is a guess | Reader |
| Corrections keep the original | Layering is how these notes stay trustworthy | Reader |
| A superseded note is `archived` | Superseded notes left `active` mislead | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Type `project` with no `project_kind` | `project_kind: spec` or `plan` by content | Judgment |
| `status: tree` (Source of Truth) or `sprout` (CausalOps Memory Layer, Roadmap) | `active`, or `complete` if final | Judgment |
| Spec headings: What This System Is, The End Goal, Explicit Non-Goals, Out of Scope | What This Is, Non-Goals | Judgment |
| Plan headings: Path To N, Priority 1..N, Implementation Sequence, Execution Plan | Sequence | Judgment |
| A dated heading such as "2026-10-03 Corrections (original text above kept)" | `## Corrections` with a dated entry inside | Mechanical |
| Portfolio design docs typed `concept` | `type: project`, `project_kind: spec` | Judgment |
| Roadmap with a status table | `project_kind: plan`; the table goes under Current State | Judgment |
## Done Conditions
- `project_kind` is set and matches the note, and `next` is live or `none`.
- A spec has What This Is, Current State, and Non-Goals; a plan has Goal, Sequence, and Open Questions.
- Code claims cite evidence, and corrections keep the original.
- The note passes [[Vault Lint]] for `project-spec` or `project-plan`.
## Gold Standard Example
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]] passes lint as a spec: a highlighted lead, a dated Current State with a table of parts, explicit Non-Goals, and a Corrections layer. [[20_Progress/Mentorship Program/Plans/Plan - Jesse|Plan - Jesse]] is the plan example: a highlighted Goal, a numbered Sequence, and Open Questions ticked with dated answers.
Measured 2026-11-07: specs 22 notes, 5 pass; plans 12 notes, 7 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Conversation Loop Design (gold) | `20_Progress/Projects/AI Use/Conversations/` | All three headings, Corrections | Nothing found |
| Plan - Jesse | `20_Progress/Mentorship Program/Plans/` | Goal, Sequence, Open Questions | Nothing found |
| Source of Truth | `20_Progress/Internship/Building System/` | Hard gates, non-goals, dated corrections | Legacy headings; `status: tree` |
| Research Loop - Improvement Plan | `20_Progress/Internship/Building System/` | Verdict, causes, prioritized path | `Priority N` headings |
