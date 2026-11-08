---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
  - review
system_kind: standard
family: audit-report
tier: 1
maps_to:
  - "[[Vault Audit Report Template]]"
used_by: []
gold_standard: "[[60_Claude/30_Reviews/Conversation Capture Layer Audit (2026-10-17)|Conversation Capture Layer Audit (2026-10-17)]]"
notes:
  - "[[Review System]]"
  - "[[Capability Review Standard]]"
---
# Audit Report Standard
==An audit reports what a system actually does, with one counted finding at a time and an ordered list of what to do about it.==
This is the Standard for a one-off review of a system, pipeline, or change set: a vault audit, an ingestion pipeline audit, a convergence change report. It is not a periodic review ([[Capability Review Standard]], [[Review Standard]]) and not a plan. A distilled note is a concept you understand, not a report, so an audit does not belong in `20_Distilled_Notes/`.
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/30_Reviews/`, or a subfolder of it for the system audited (`AI/Conversations/`). |
| File name | The subject plus `Audit`, with the date in parentheses (`Conversation Capture Layer Audit (2026-10-17)`). |
| Kind | `type: review` with `review_kind: audit`. |
| Status | `sprout` while the Priority Queue is open, `complete` once every item is done or handed to a plan. |
## Headings
### Frontmatter
- **Write:** `type: review`, `review_kind: audit`, `status`, dates, `tags`, and `notes` linking the system audited and the notes the findings cite.
- **Length:** one line per key.
- **Never:** `type: evergreen`, `project`, or `plan` on an audit. It is then not found as a review.
- **Right:** `review_kind: audit`
- **Wrong:** None seen.
### Summary
- **Write:** what was audited, the date, and the verdict, so the reader knows the verdict without scrolling.
- **Length:** two or three sentences.
- **Never:** a goal-and-decisions preamble. The verdict comes first.
- **Right:** `Audited the AI-conversation capture and distillation layer across both laptops (Dell, Acer) and both OS environments (Windows, WSL)`
- **Wrong:** `## Session goal and decisions`
### Scope
- **Write:** optional. What the audit covers and how it was counted, when the audit spans several systems.
- **Length:** one paragraph.
- **Never:** findings. They go under Findings.
- **Right:** `counted by a script on 2026-10-21; no transcript text was copied.`
- **Wrong:** None seen.
### Findings
- **Write:** numbered, one problem each, as a `###` heading that states the claim, and a paragraph that proves it with a count, a file, or a log row. A finding corrected mid-audit says so in place.
- **Length:** one claim and one paragraph each.
- **Never:** a number reported without how it was produced. One audit's "5,354 broken wikilinks" was mostly a parser bug, found only because the finding showed its method.
- **Right:** `### 2. Distillation has nearly stopped: 5 summaries against 630 live raw notes`
- **Wrong:** `## Finding 1 - the registry`
### Priority Queue
- **Write:** an ordered list of next actions, each tied to the finding it answers, with the highest-leverage item first. Decisions only the owner can make are marked as such.
- **Length:** one to two sentences per item.
- **Never:** an item that answers no finding.
- **Right:** `1. Decide whether to build a real silence tripwire (a check that pages or logs when zero new sessions land for N days) before adding any more platforms.`
- **Wrong:** `## Priority queue`
### Open Questions
- **Write:** `- [ ]` tasks for anything the audit could not settle.
- **Length:** one sentence each.
- **Never:** a deleted unresolved question.
- **Right:** `- [ ] Keep the empty Codex/Antigravity/Kiro/local-model folders as a visible to-do, or remove them until a real plan exists for each?`
- **Wrong:** None seen.
### What Changed
- **Write:** optional. If the audit also made changes, the files touched and what was deliberately left alone.
- **Length:** one paragraph.
- **Never:** an unlisted change.
- **Right:** `This audit is itself new.`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Summary, Findings, Priority Queue, and Open Questions appear in order and none is empty | A skill and a reader find the verdict and the queue by name | Lint, check 2 |
| Every finding shows how its number was measured | An unchecked number can be wrong by an order of magnitude | Reader |
| Every Priority Queue item names the finding it answers | A queue with no link to evidence cannot be re-prioritized | Reader |
| The audit sits under `60_Claude/30_Reviews/` | A report in `20_Distilled_Notes/` is mistaken for knowledge | Lint, check 4 |
| An audit is not authorization to fix | Decided fixes are the owner's call ([[Review System]]) | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Headings such as `Why this audit exists`, `Session goal and decisions locked`, `Summary` | `Summary` | Judgment |
| `Finding 1 - ...` as `##` headings | `Findings`, one `###` per finding | Judgment |
| `Priority queue`, `Next`, `Next thread`, `Recommended Next Commands` | `Priority Queue` | Judgment |
| `type: evergreen`, `project`, or `plan` | `type: review`, `review_kind: audit` | Mechanical |
| An audit in `20_Distilled_Notes/` (Ingestion Pipeline Audit, Jarvis Systems Audit) | Move it to `60_Claude/30_Reviews/` | Judgment, needs a yes |
| A postmortem outside `30_Reviews/` (Conversation Layer Postmortem) | Move it, or retype it as a project note | Judgment, needs a yes |
| `Monthly Review 2026-06`, the one monthly review, a one-off scorecard | Treat as an audit; no monthly cadence exists | Judgment |
## Done Conditions
- The Summary states the verdict, and every finding shows how it was measured.
- Priority Queue items each name the finding they answer.
- Nothing the audit changed went unlisted.
- The note passes [[Vault Lint]] for the `audit-report` family.
## Gold Standard Example
[[60_Claude/30_Reviews/Conversation Capture Layer Audit (2026-10-17)|Conversation Capture Layer Audit (2026-10-17)]] passes lint: a verdict in the Summary, ten numbered findings that each state a claim and show the count, a finding corrected in place, an ordered queue that names the finding each item answers, and Open Questions as tasks.
Measured 2026-11-07 with `--family audit-report`: 13 notes, 5 pass.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Conversation Capture Layer Audit (2026-10-17) (gold) | `60_Claude/30_Reviews/` | All of the above | Nothing found |
| Tool Call Analysis | `60_Claude/30_Reviews/AI/Conversations/` | Passes lint; a counted table of tool calls | Not read in full |
| Conversation Layer Postmortem | `20_Progress/Projects/AI Use/Conversations/` | The audit headings and a Corrections section | Wrong folder |
| Jarvis Systems Audit - Retrieval, Sync, and Plugins (2026-08-21) | `60_Claude/20_Distilled_Notes/` | Findings that show their method | Wrong folder; `Finding N` as `##`; `Priority queue` |
