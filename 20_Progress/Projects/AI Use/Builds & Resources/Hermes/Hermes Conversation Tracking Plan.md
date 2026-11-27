---
type: reference
status: seed
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - conversations
  - runbook
reference_kind: runbook
machine: acer
notes:
  - "[[Hermes System]]"
  - "[[Conversation Layer]]"
  - "[[Capture Pipeline - As Built]]"
  - "[[Per-Prompt Record]]"
  - "[[Platform Coverage]]"
  - "[[Local Reviewer]]"
next: Check the Hermes session retention setting, then write the exporter against one real session.
---
# Hermes Conversation Tracking Plan
## Why This Note Exists
[[Platform Coverage]] lists local models as a platform where nothing logs a run. Hermes is now that platform, and the vault's rule is that every AI conversation is recorded in Jarvis so the next session starts with context. This note plans the capture for Hermes without repeating the Claude Code design in [[Conversation Layer]]. ==Hermes already keeps a clean local record, so the work is an exporter that turns it into the vault's export format, not a hook.==
## What Hermes provides
- Sessions live in a SQLite store (`state.db` in the Hermes home). After one test message `hermes sessions stats` reported 1 session and 2 messages. The session list shows an id (`20261126_204441_033c4e`), a short title, and the workspace folder name.
- `hermes sessions export` writes JSONL, Markdown (one file per session), QMD, HTML or a trace. It takes filters for session id, time range, source, model, provider, cwd, message and token counts, plus `--redact`, `--only user-prompts` and `--dry-run`. A bulk export without a filter is refused.
- From v0.22 and v0.23 one gateway per machine owns every session, so the CLI, desktop app and bots write to one store through one writer. The installed v0.21.3 predates that.
## Gate
- The session retention setting is known. Version 0.22.0 turned on deletion of sessions inactive for 90 days, and 0.23 made it opt-in again. The installed config has no session-prune key (its `proactive_prune` keys concern tool-result context, not sessions), but confirm before trusting it.
- The destination is approved. Proposed: `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Hermes/<project>/`, a new sibling of the empty `Local` folder.
- The export carries no secrets. Use `--redact` and spot-check one note.
## Steps
1. Read the Standard [[Conversations]]. An export needs `type: input`, `input_kind: ai-conversation`, `source_app`, `source_os`, `title`, `started_at`, `exported_at`, `project` and `session_id` in its frontmatter. Hermes Markdown will not have all of them, so the exporter adds them.
2. Write the exporter as a script beside the other capture scripts ([[Capture Scripts]]). It stores a watermark time, exports with `--after <watermark> --format md --redact`, adds the frontmatter, maps the workspace folder to a project folder as `capture-projects.json` does for Claude Code, and never overwrites an existing note.
3. Also export `--format jsonl` and map each tool call to the platform-neutral fields in [[Per-Prompt Record]] (session, agent, prompt, tool, target, ok, ms), so the review loop treats Hermes like any other platform.
4. **Changes state.** Register a Windows scheduled task on the same 30 minute cadence as the Claude Code backfill and add the Hermes row to [[Capture Registration]].
5. Dry-run first with `--dry-run`, then one real run. Check the output against the Standard and run Vault Lint on the folder.
6. **Changes state.** Update [[Platform Coverage]] with a Hermes row and the date.
7. Later: let a local Hermes model act as the second reviewer, which is stage B of [[Local Reviewer]].
## Checkpoints
None yet. Facts above were read on 2026-11-26 from `hermes sessions --help`, `hermes sessions export --help` and one `--dry-run` that refused the unfiltered bulk request.
## Open Questions
- Does the Desktop app write to the same store as the CLI on v0.21.3?
- Where should auxiliary-task sessions (titles, compression) go? They are not conversations and should be excluded.
