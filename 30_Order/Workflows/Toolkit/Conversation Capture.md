---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-17
tags:
  - system
  - workflow
  - conversation-memory
system_kind: workflow
serves: "[[Conversations]]"
trigger: A conversation with any AI tool produced a decision, a plan, or context worth keeping.
notes:
  - "[[Conversations Loop]]"
  - "[[Memory Management]]"
  - "[[Summaries-to-Create]]"
---
# Conversation Capture
Capture one AI conversation so its decisions survive after the chat closes. The recurring check across all sessions is [[Conversations Loop]].
## Use when
A session with Claude Code, Cowork, Cursor, Codex, Kiro, ChatGPT, or a local model decided something, changed files, or left an open question.
## Steps
1. Confirm the raw export exists in `60_Claude/05_Clippings/AI Conversations/<machine>/<os>/<tool>/<project>/`. Claude Code, Cowork, and Cursor are exported by hook or scheduled sweep. For a tool with no hook, save the transcript there untouched. Claude Code lands in `Claude/<project>/` (Cowork in `Windows/Claude/Cowork/<YYYY-MM>/`). `<machine>` is `Dell` or `Acer`, read from the host name; an unknown host writes nothing. Triggers: Stop and SessionEnd hooks, plus a safety-net backfill every 30 minutes (a systemd user timer `claude-capture-backfill` in each WSL, a scheduled task `ConversationCapture-Backfill-Windows` on each Windows side). A session already marked under the older `Windows/` or `Dell/` trees is not exported again. See [[Old Laptop Rebuild - Build 5c Acer Workspace and Capture Findings]].
2. Decide whether it earns a summary. No decision and no lasting context means stop; the export stays as the record.
3. Create the summary from [[30_Order/Templates/AI Toolkit/AI Conversation|AI Conversation]] in `60_Claude/07_AI_Information/AI Conversation - Summaries/`, named `YYYY-MM-DD-{source-app}-{slug} - Summary`.
4. Fill every heading, then set `decision_count` and `action_count` to match the lists. Keep it short; the value is the decisions, not the back-and-forth.
5. Link the project and concept notes the conversation touched.
6. Promote only what is durable: a decision to a project `next:`, a new understanding to a distilled note, an artifact to an output. Leave the rest as summary.
7. Append one entry to the session log ([[Memory Management]]) and remove the session from [[Summaries-to-Create]] if it was listed.
## Do not
Do not edit the raw export, promote the transcript, or write the summary from memory instead of the export.
## Done when
- The raw export is untouched and `source_note` links to it.
- The summary passes [[Conversations]]: counts match, source and inferred claims are separate.
- Durable items are promoted and the session log has the entry.
