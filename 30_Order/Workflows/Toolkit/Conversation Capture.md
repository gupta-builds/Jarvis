---
type: evergreen
status: tree
created: 2026-05-31
updated: 2026-10-15
tags:
  - system
  - workflow
  - conversation-memory
notes:
  - "[[00_Workflows Index]]"
  - "[[40_Resources/Obsidian/Jarvis Vault Architecture]]"
  - "[[Jarvis Three-Month Research Engine Master Plan]]"
---
# Conversation Capture

Capture an LLM conversation so its decisions survive after the chat closes. This is the biggest missing layer in Jarvis and the backbone of the three-month plan: you make many decisions with AI tools, and without capture, every new AI starts from zero.

**Use when:** a conversation with any AI (Claude, Codex, Cursor, Kiro, ChatGPT, a local model) produced a decision, a plan, or context worth keeping.

**Moves:** raw transcript → `60_Claude/05_Clippings/AI Conversations/` → summary in `60_Claude/07_AI_Information/AI Conversation - Summaries/` (and the `jarvis-memory` registry under `30_Order/System/` indexes both).

**Serves Standard:** [[Conversations]]. **Template:** [[AI Conversation]].

## The three layers

Raw conversation is not knowledge yet. Store it in three layers and only promote the durable parts:

1. **Raw archive** — the transcript, untouched, in `05_Clippings/AI Conversations/`.
2. **Summary** — a short distillation in `AI Conversation - Summaries/`, shaped by the [[AI Conversation]] template and the [[Conversations]] Standard.
3. **Promotion** — only durable decisions become concept notes, project updates, outputs, or `next:` actions. The transcript itself never becomes a durable note.

## Steps

1. Save the raw transcript to `05_Clippings/AI Conversations/`. Do not edit it.
2. Write the summary in `AI Conversation - Summaries/` from the [[AI Conversation]] template. Keep it short: the value is the decisions, not the back-and-forth.
3. Wikilink the project and concept notes the conversation touched.
4. Promote only what is durable: turn a decision into a project `next:`, a new understanding into a distilled note, an artifact into an output. Leave the rest as summary.
5. Append a one-line session-log entry noting the import and whether anything was promoted.

## Frontmatter

Comes from the [[AI Conversation]] template. Do not write it from memory.

## Done when

- The raw transcript is archived and untouched.
- A short summary captures decisions, changes, and open questions.
- Durable items are promoted; the transcript is not promoted wholesale.
- The session log records the import.
