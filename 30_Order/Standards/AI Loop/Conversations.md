---
type: system
status: sprout
created: 2026-10-15
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: ai-conversation
tier: 1
maps_to:
  - "[[AI Conversation Export Template]]"
used_by:
  - "[[Conversation Capture]]"
  - "[[Conversations Loop]]"
gold_standard: "[[60_Claude/07_AI_Information/AI Conversation - Summaries/Claude Code/2026-08-19-claude-code-second-brain-claudekit-jarvis-notes-sync — Summary]]"
notes:
  - "[[Brief Standard]]"
  - "[[Memory Management]]"
  - "[[Logs]]"
  - "[[Generated Output Standard]]"
---
# Conversations
==A conversation summary keeps the decisions and drops the back-and-forth, so the next AI does not start from zero. The raw export beside it is never rewritten.==
This Standard covers the two notes a conversation with an AI tool produces: the raw export written by a hook or script, and the summary an agent writes from it. It is not a transcript of people talking, which is a brief ([[Brief Standard]]). Hooks, schedules, and the export layout are in the export folder's README and under `30_Order/System/claude-workflow/`.
## Spec
```json
{
  "family": "ai-conversation-export",
  "tier": 2,
  "match": {"type": "input", "kind": "ai-conversation", "path": "^60_Claude/05_Clippings/AI Conversations/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "input_kind", "source_app", "source_os", "title", "started_at", "exported_at", "project", "session_id"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": [],
  "optional_headings": []
}
```
```json
{
  "family": "ai-conversation-summary",
  "tier": 1,
  "match": {"type": "input", "kind": "ai-conversation-summary", "path": "^60_Claude/07_AI_Information/AI Conversation - Summaries/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "input_kind", "source_app", "source_note", "project", "decision_count", "action_count", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list", "decision_count": "number", "action_count": "number", "source_note": "wikilink"},
  "headings": ["What Was Decided", "What Changed", "Important Context", "Source Claims (Quoted From Transcript)", "Inferred Claims (Distiller Interpretation)", "Open Questions", "Follow-Up Actions", "Related Notes", "Should Be Promoted?"],
  "optional_headings": ["Tool Use Detail"]
}
```

| Item | Rule |
|---|---|
| Allowed folders | Exports: `60_Claude/05_Clippings/AI Conversations/<machine>/<os>/<tool>/<project>/`. Summaries: `60_Claude/07_AI_Information/AI Conversation - Summaries/`. |
| File name | Export: `MM-DD {title}`. Summary: `YYYY-MM-DD-{source-app}-{slug} - Summary`. Older summaries keep their names; renaming would break links. |
| Kind | `type: input` with `input_kind: ai-conversation` (export) or `ai-conversation-summary`. |
| Status | Export: `seed` with `review_state: raw`. Summary: `sprout` once written, `tree` after the owner checked it against the export. |
## Headings
### Raw export
- **Write:** frontmatter with the identity keys in the Spec (`source_app` is `claude-code`, `cowork`, `cursor`, or another tool's lower-case name; `source_os` is `windows` or `wsl`) plus optional metrics (`tools_used`, `tokens`, `cost_usd`, `model`, `turn_count`, `duration_minutes`). The body is the transcript: a `## You` or `## Claude` turn per heading and a `## Actions Taken` list. Written by `export-claude-session.ps1`, the Cursor sweep, or the WSL hook, never by hand; re-exporting the same `session_id` updates the note in place.
- **Length:** no limit. A transcript over 20,000 words is an archive, not a note.
- **Never:** `status: raw`. `raw` is not a status: the exporter sets `status: seed` and `review_state: raw`. Never invent a metric the tool did not report.
- **Right:** `review_state: raw`
- **Wrong:** `status: raw`
### Generated indexes
- **Write:** `00 - Session Index.md` and `00 - Tool Usage Rollup.md` in each folder are generated: `type: generated`, `gen_kind: index` ([[Generated Output Standard]]), with a Dataview `FROM` on the folder they sit in.
- **Length:** the tool's output.
- **Never:** `type: dashboard` or `index`.
- **Right:** `FROM "60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis"`
- **Wrong:** None seen.
### Summary frontmatter
- **Write:** `input_kind: ai-conversation-summary`, `source_note` (a quoted wikilink to the raw export), `decision_count` and `action_count` (matching the lists), `notes`, and `updated`. Claude Code summaries may add `source_os`, `tools_used`, `tokens_total`, and `cost_usd`.
- **Length:** one line per key.
- **Never:** a summary for a conversation that produced no decision or context worth keeping.
- **Right:** `source_note: "[[08-19 Second-brain-claudekit Jarvis notes sync]]"`
- **Wrong:** None seen.
### What Was Decided
- **Write:** each decision in one line with its reason. This section sets `decision_count`.
- **Length:** one line per decision.
- **Never:** a decision with no reason.
- **Right:** `- Every Jarvis note tracking second-brain-claudekit's structure would be verified against the *real* WSL repo directly`
- **Wrong:** None seen.
### What Changed, Important Context
- **Write:** files, configs, or notes that now differ, as wikilinks or paths. Then only what a reader needs to understand the decisions: constraints, and what was ruled out and why. Claude Code summaries may add `## Tool Use Detail` after What Changed.
- **Length:** one paragraph each.
- **Never:** a replay of the transcript.
- **Right:** `Seven Jarvis notes updated in one pass, each against independently verified repo state:`
- **Wrong:** None seen.
### Source Claims and Inferred Claims
- **Write:** what the transcript states, quoted or tightly paraphrased, then what you concluded that the transcript did not say.
- **Length:** a few quotes; a paragraph of inference.
- **Never:** an inference moved into Source Claims because it sounds certain.
- **Right:** `The session's closing summary presents its verification as complete and its output as fully reconciled with real repo state.`
- **Wrong:** None seen.
### Open Questions, Follow-Up Actions, Related Notes
- **Write:** what was left unresolved (they carry forward until answered); task-formatted next steps, which set `action_count`; wikilinks to the project, concepts, and logs the conversation touched.
- **Length:** one line each.
- **Never:** a follow-up that restates the conversation.
- **Right:** `[[20_Progress/Projects/AI Use/Claude Kit/Tool Map]] · [[20_Progress/Projects/AI Use/Claude Kit/Log]]`
- **Wrong:** None seen.
### Should Be Promoted?
- **Write:** `decision: yes | no | partial`, naming what moves where: a decision to a project `next:`, an understanding to a distilled note. The transcript itself is never promoted.
- **Length:** one to three sentences.
- **Never:** promoting the transcript.
- **Right:** `The one reusable lesson (verify claims embedded in a task prompt's own framing, not just claims flagged as uncertain)`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The raw export is archived untouched, and `source_note` links to it | The summary must be checkable | Reader |
| `decision_count` and `action_count` match the lists | A stale count misleads a query | Reader |
| Source Claims and Inferred Claims stay separate | Inference presented as quotation is the most common distortion | Reader |
| Exports are UTF-8 with no byte-order mark, redacted at export; the unredacted `_raw_jsonl/` copy stays out of git and sync | A BOM breaks the frontmatter parse and a leak is permanent | Lint, check 1 (`bom`); Reader |
| `status: seed` and `review_state: raw` on every export | `raw` is not in the status vocabulary | Lint, check 1 |
| A one-line entry is appended to the session log when a summary is written ([[Memory Management]]) | The next session finds the summary | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Export starts with a byte-order mark (270 notes) | Strip it; exporters write UTF-8 without a BOM | Mechanical |
| `status: raw` (549) | `status: seed` and `review_state: raw` | Mechanical |
| No `created` or `updated` (549) | `created` is the date of `started_at`, `updated` the date of `exported_at` | Mechanical |
| `#` inside `tags` | Remove the hash | Mechanical |
| Session Index typed `dashboard` or `index`, `FROM` an old path | `type: generated`, `gen_kind: index`, `FROM` the note's own folder | Mechanical, regenerate |
| Same session under `Windows/` and `Dell/` | Keep the later `exported_at`, flag the other | Judgment |
| Summary missing `updated` or counts (all 5) | Add them; recount the lists | Mechanical |
| A brief, audit, or finding saved in the Summaries folder | Move it to its own family | Judgment |
## Done Conditions
- The raw transcript is archived and untouched, and `source_note` links to it.
- `decision_count` and `action_count` match the lists.
- Source Claims and Inferred Claims are separate.
- A one-line entry was appended to the session log ([[Memory Management]]).
- The notes pass [[Vault Lint]] for their family.
## Gold Standard Example
[[60_Claude/07_AI_Information/AI Conversation - Summaries/Claude Code/2026-08-19-claude-code-second-brain-claudekit-jarvis-notes-sync — Summary]]: full frontmatter with tool counts and cost, and every heading filled, plus the allowed `Tool Use Detail`. It does not pass lint: no `updated`, a blank line after the frontmatter, and extra blank lines.
Measured 2026-11-07: exports 697 notes, 0 pass; summaries 5, 0 pass.
