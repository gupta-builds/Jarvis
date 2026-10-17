---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: ai-conversation
tier: 1
maps_to:
  - "[[30_Order/Templates/AI Toolkit/AI Conversation|AI Conversation]]"
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
This Standard covers the two notes a conversation with an AI tool produces: the raw export written by a hook or script, and the summary an agent writes from it. It does not cover transcripts of people talking, which are [[Brief Standard]] briefs. Hooks, schedules, and the export layout are documented in the export folder's README and under `30_Order/System/claude-workflow/`.
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
## Headings
### Raw export
Written by `export-claude-session.ps1`, the Cursor sweep, or the WSL hook, never by hand. Path `60_Claude/05_Clippings/AI Conversations/<machine>/<os>/<tool>/<project>/MM-DD {title}.md`. Frontmatter holds the identity keys in the Spec (`source_app` is `claude-code`, `cowork`, `cursor`, or another tool's lower-case name; `source_os` is `windows` or `wsl`) plus optional metrics: `tools_used`, `tokens`, `cost_usd`, `model`, `files_touched`, `turn_count`, `duration_minutes`. Cursor exports carry `files_changed_count`, `lines_added`, and `lines_removed` instead of tokens and cost. Never invent a metric the tool did not report.
The body is the transcript: a `## You` or `## Claude` turn per heading and a `## Actions Taken` list for tool calls. Re-exporting the same `session_id` updates the same note in place. Redaction happens at export; the unredacted `_raw_jsonl/` copy stays out of git and sync.
*Density:* no limit. A transcript over 20,000 words is an archive, not a note.
> [!WARNING]
> Writing `status: raw`. `raw` is not a status. The exporter sets `status: seed` and `review_state: raw`.
`00 - Session Index.md` and `00 - Tool Usage Rollup.md` in each folder are generated: `type: generated`, `gen_kind: index` ([[Generated Output Standard]]), and their Dataview `FROM` path is the folder they sit in.
### Summary
One summary per raw conversation, and only for one that produced a decision or context worth keeping. Path `60_Claude/07_AI_Information/AI Conversation - Summaries/`, file `YYYY-MM-DD-{source-app}-{slug} - Summary.md`. Existing summaries keep their older names; renaming would break links. Claude Code summaries may add `source_os`, `tools_used`, `tokens_total`, and `cost_usd`; other tools omit them.
### What Was Decided
Each decision in one line with its reason. This section sets `decision_count`. A summary with no decision is not worth keeping.
### What Changed
Files, configs, or notes that now differ, as wikilinks or paths. Claude Code summaries may add `## Tool Use Detail` after it.
### Important Context
Only what a reader needs to understand the decisions: constraints, and what was ruled out and why.
### Source Claims (Quoted From Transcript)
What the transcript states, quoted or tightly paraphrased.
### Inferred Claims (Distiller Interpretation)
What you concluded that the transcript did not say.
> [!WARNING]
> Moving an inference into Source Claims because it sounds certain.
### Open Questions
What was left unresolved. They carry forward until answered.
### Follow-Up Actions
Task-formatted next steps. This section sets `action_count`.
### Related Notes
Wikilinks to the project, concepts, and logs the conversation touched.
### Should Be Promoted?
`decision: yes | no | partial`, naming what moves where: a decision to a project `next:`, an understanding to a distilled note. The transcript itself is never promoted.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Export starts with a byte-order mark (283 notes) | Strip it; exporters write UTF-8 without a BOM | mechanical |
| `status: raw` | `status: seed` and `review_state: raw` | mechanical |
| No `created` or `updated` | `created` is the date of `started_at`, `updated` the date of `exported_at` | mechanical |
| `#` inside `tags` | Remove the hash | mechanical |
| Session Index typed `dashboard` or `index`, `FROM` an old path | `type: generated`, `gen_kind: index`, `FROM` the note's own folder | mechanical, regenerate |
| Same session under `Windows/` and `Dell/` | Keep the later `exported_at`, flag the other | judgment |
| Summary missing `updated` or counts | Add them; recount the lists | mechanical |
| A brief, audit, or finding saved in the Summaries folder | Move it to its own family | judgment |
## Done Conditions
- The raw transcript is archived and untouched, and `source_note` links to it.
- `decision_count` and `action_count` match the lists.
- Source Claims and Inferred Claims are separate.
- A one-line entry was appended to the session log ([[Memory Management]]).
## Gold Standard Example
The Claude Code summary in `AI Conversation - Summaries/Claude Code/`: full frontmatter with tool counts and cost, and every heading filled, plus the allowed `Tool Use Detail`.
