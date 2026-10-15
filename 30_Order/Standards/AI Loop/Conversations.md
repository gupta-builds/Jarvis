---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[AI Conversation]]"
  - "[[Conversation Capture]]"
  - "[[Brief Standard]]"
  - "[[Memory Management]]"
---
# Conversations
==A conversation summary keeps the decisions and drops the back-and-forth: it exists so the next AI does not start from zero.==
This is the content standard for summaries of conversations with an AI tool (Claude Code, Claude web, Codex, Cursor, Kiro, ChatGPT, a local model). It governs a different subject than [[Brief Standard]], which covers transcripts of people talking (meetings, calls, videos). Do not use one for the other's job. The raw transcript is never rewritten; this Standard covers only the summary.
## Maps To
- Template: [[AI Conversation]]
## Used By Workflow
- [[Conversation Capture]]. Raw transcript to `60_Claude/05_Clippings/AI Conversations/`, summary to `60_Claude/07_AI_Information/AI Conversation - Summaries/`, then selective promotion.
## Where the summary lives and what it is called
Real summaries already live in `AI Conversation - Summaries/`, not in `10_Source_Summaries/`. One summary per raw conversation, and only for a conversation that produced a decision or context worth keeping. Filename: `YYYY-MM-DD-{source-app}-{slugified-title} — Summary.md`.
## Frontmatter
Set by the [[AI Conversation]] template: `type: input`, `input_kind: ai-conversation-summary`, `status`, `created`, `source_app`, `source_note` (wikilink to the raw file), `project`, `decision_count`, `action_count`, `tags`, `notes`.
Claude Code summaries may also carry `source_os`, `tools_used` (counts per tool), `tokens_total`, and `cost_usd`. Real notes already use them, so they are official, and they stay optional. Other tools omit them.
## Per-Heading Standard
### What Was Decided
Each decision in one line, with the reason. This section sets `decision_count`.
*Density:* short. A summary with no decisions is not worth keeping; do not write it.
### What Changed
Files, configs, or notes that now differ, as wikilinks or paths. For Claude Code, a `## Tool Use Detail` section may follow when tool use matters to the conclusion.
### Important Context
Only what a reader needs to understand the decisions: constraints, what was ruled out and why.
### Source Claims (Quoted From Transcript)
What the transcript states, quoted or tightly paraphrased.
### Inferred Claims (Distiller Interpretation)
What you concluded that the transcript did not say.
> [!WARNING]
> Moving an inference into Source Claims because it sounds certain. If the transcript did not say it, it belongs under Inferred Claims.
### Open Questions
What was left unresolved. Carries forward until answered.
### Follow-Up Actions
Task-formatted next steps. This section sets `action_count`.
### Related Notes
Wikilinks to the project, concepts, and logs the conversation touched.
### Should Be Promoted?
`decision: yes | no | partial`, naming what moves where: a decision to a project `next:`, a new understanding to a distilled note. The transcript itself is never promoted.
## Done Conditions
- The raw transcript is archived and untouched, and `source_note` links to it.
- `decision_count` and `action_count` match the lists.
- Source Claims and Inferred Claims are separated.
- A one-line entry was appended to the session log ([[Memory Management]]).
- No `---` in the body, and zero blank lines except after a callout.
## Gold Standard Example
`60_Claude/07_AI_Information/AI Conversation - Summaries/Claude Code/2026-08-19-claude-code-second-brain-claudekit-jarvis-notes-sync — Summary.md`: full frontmatter including tool counts and cost, and every heading filled. Note that it adds `## Tool Use Detail`, which this Standard now allows for Claude Code summaries.
