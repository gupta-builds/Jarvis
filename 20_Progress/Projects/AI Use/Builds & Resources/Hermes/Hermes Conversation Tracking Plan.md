---
type: project
status: active
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - conversations
project_kind: plan
next: Check the Hermes session retention setting, then write the exporter against one real session.
related_progress:
  - "[[Hermes System]]"
notes:
  - "[[Conversation Layer]]"
  - "[[Capture Pipeline - As Built]]"
  - "[[Per-Prompt Record]]"
  - "[[Platform Coverage]]"
  - "[[Local Reviewer]]"
---
# Hermes Conversation Tracking Plan
## Goal
==Every Hermes conversation is exported into Jarvis in the vault's conversation format, on a schedule, with secrets redacted, so the next session starts with context.== [[Platform Coverage]] lists local models as a platform where nothing logs a run, and Hermes is now that platform. Hermes already keeps a clean local record, so the work is an exporter, not a hook.
## Sequence
What Hermes provides, read on 2026-11-26 from `hermes sessions --help`, `hermes sessions export --help` and one `--dry-run`: sessions live in a SQLite store (`state.db` in the Hermes home), and after one test message `hermes sessions stats` reported 1 session and 2 messages. The session list shows an id (`20261126_204441_033c4e`), a short title and the workspace folder name. `hermes sessions export` writes JSONL, Markdown (one file per session), QMD, HTML or a trace, with filters for session id, time range, source, model, provider, cwd, message and token counts, plus `--redact`, `--only user-prompts` and `--dry-run`. A bulk export without a filter is refused. From v0.22 and v0.23 one gateway per machine owns every session; the installed v0.21.3 predates that.
1. Confirm the session retention setting. Version 0.22.0 turned on deletion of sessions inactive for 90 days, and 0.23 made it opt-in again. The installed config has no session-prune key (its `proactive_prune` keys concern tool-result context, not sessions), but confirm before trusting it. Done when the setting is written down.
2. Approve the destination. Proposed: `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Hermes/<project>/`, a new sibling of the empty `Local` folder. Done when the owner says yes.
3. Read the Standard [[Conversations]]. An export needs `type: input`, `input_kind: ai-conversation`, `source_app`, `source_os`, `title`, `started_at`, `exported_at`, `project` and `session_id` in its frontmatter, and Hermes Markdown will not have all of them. Done when the field mapping is written.
4. Write the exporter beside the other scripts in [[Capture Scripts]]. It keeps a watermark time, exports with `--after <watermark> --format md --redact`, adds the frontmatter, maps the workspace folder to a project folder as `capture-projects.json` does for Claude Code, and never overwrites an existing note. Done when one real session becomes one correct note and Vault Lint passes it.
5. Also export `--format jsonl` and map each tool call to the platform-neutral fields in [[Per-Prompt Record]] (session, agent, prompt, tool, target, ok, ms), so the review loop treats Hermes like any other platform. Done when a tool call appears as one record.
6. **Changes state.** Register a Windows scheduled task on the same 30 minute cadence as the Claude Code backfill and add a Hermes row to [[Capture Registration]]. Done when a run is logged and the row names the verification date.
7. **Changes state.** Add a Hermes row to [[Platform Coverage]] with the date. Done when the table matches the folder.
*Out of scope this round:* using a local Hermes model as the second reviewer, which is stage B of [[Local Reviewer]].
## Open Questions
- [ ] Does the Desktop app write to the same store as the CLI on v0.21.3?
- [ ] Where do auxiliary-task sessions (titles, compression) go? They are not conversations and should be excluded.
- [ ] Is the export free of secrets after `--redact`? Spot-check one note before scheduling.
