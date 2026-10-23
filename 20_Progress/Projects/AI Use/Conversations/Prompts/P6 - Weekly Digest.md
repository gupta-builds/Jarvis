---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - prompt
project_kind: prompt
task: weekly-digest
model: claude-sonnet-5-5
---
# P6 - Weekly Digest
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P6 - Weekly Digest.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
Layer L1 of [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]: a script that turns a week of event rows into the note the weekly review opens first, with zero tokens. Without it, steps 1, 2, and 6 of [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] stay manual. This is build B4. The throwaway counting scripts from the research were not kept, so everything here is rewritten with tests.
- **Verified 2026-10-22:** [[30_Order/Standards/Generated Output Standard|Generated Output Standard]] wants `type: generated`, `generator`, and `gen_kind` (`report` fits), no `status`, and `review_state` optional; the generated zone path is not decided and placement checks are waived until the registry sets one.
- **Verified in the hooks reference:** `transcript_path` may lag the live turn, so context sizes read from a transcript for a prompt that just ended can be one turn stale. The digest runs on whole days, so this matters only for the current day.
- **Depends on P5:** event rows exist for at least a few days. If P3 changed the record shape, follow P3.
- **Owner decisions 2026-10-22:** the human does the weekly blind pass; the digest syncs between laptops, so it carries ids and links and no prompt text. `agent_lines_kept_7d` is deferred unless P3 kept it.
- **Assumed, check:** an installed skill or subagent is a directory or file under `.claude/skills` and `.claude/agents`, so "available but never used" can be computed by listing them.
## Hard Rules
- Scope is the Acer, Windows side, Claude Code only, tracked projects only.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`. Build in `30_Order/System/claude-workflow/scripts/` with tests beside it.
- Deterministic and model-free. The same events and the same seed give a byte-identical digest. No network.
- The digest contains prompt ids, session ids, counts, tool and file paths relative to the vault, and links to session notes. It contains no prompt text, no `last_assistant_message` text, and no pasted content.
- `history.jsonl` is read only to count prompts per session and day. Never copy a line of it.
- A missing field is tolerated and counted. Never crash on a version change; the digest lists the Claude Code versions seen.
- One writer per generated note: overwrite the week's digest in place, idempotently. Do not run `git commit`; look for `.sync-conflict-*` after writing.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:` on notes you patch.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. Read [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]] and [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]. Define each rule flag as code with a JSON config for thresholds: E1 retry loop (the same tool with a near-identical target three or more times in a row), E2 context bloat (the largest tool results and files read twice; context size per prompt from the transcript's last deduplicated `usage` before the prompt), E3 instruction not loaded (the `InstructionsLoaded` rows against a list of files expected for the project), E4 permission friction (denials), E5 capture gap (no event rows for a prompt that exists in `history.jsonl` counts), S6 execution error (a tool error with no change of approach), S7 false self-report (`claims_done` true and `verified_after_last_edit` false). Thresholds are working rules, not sourced; write them in the config with a comment saying so.
2. Write the digest script (`scripts/build-conversation-digest.js` or the language you choose, with a short reason). Input: an ISO week, the events file, the `history.jsonl` counts, and transcripts for context size. Output: `60_Claude/30_Reviews/AI/Conversations/Digests/Digest <ISO week>.md` with `type: generated`, `generator: conversation-digest`, `gen_kind: report`, `iso_week`, `period_start`, `period_end`, `review_state: raw`.
3. Sections, in this order: a coverage line first (prompts in `history.jsonl` against prompts with event rows, per day, with the gap named); counts per rule flag with prompt ids; the five prompts that started with the largest context; the ten largest tool results; files read twice; tool errors per tool, with interrupts counted apart from errors; skills, subagents, and MCP tools used and, from the installed lists, never used; instruction files loaded; compactions and permission denials; the Claude Code versions seen; then the review sample: about 10 random prompts (seed printed) and up to 15 flagged, as ids and links. This replaces the manual sample rules written in P4.
4. Tests: a synthetic events file with known flags and a golden digest; idempotence (two runs, identical bytes); a file with missing fields; an empty week (the digest says so plainly, which is a valid result); a week with a coverage gap (the gap is the first line). Use `node --test` or Pester, whichever the script language needs.
5. Validate against reality: run it on the days of real events available. The owner hand-counts ten sampled prompts (tool calls, errors, files read) from the session notes and compares with the digest. Provide the ten and the digest values side by side, and do not mark them equal yourself.
6. Time the run on a week of events. It must finish in under 30 seconds (a working ceiling).
7. Patch [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] step 1 and 2 with a dated entry pointing at the digest path, and [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]] with a card for the script.
## Report Back
- The flag definitions and thresholds as written.
- Test output, the run time, and one real digest's path.
- The side-by-side hand-count table for the owner, with the owner's verdict if they gave one.
- What the digest could not compute (fields the events do not carry) and what you propose.
## What Not To Do
- Do not put prompt text, assistant text, or pasted content in the digest.
- Do not score or rank sessions. The digest counts; it does not judge.
- Do not call a model to word the digest.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]], [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]].
