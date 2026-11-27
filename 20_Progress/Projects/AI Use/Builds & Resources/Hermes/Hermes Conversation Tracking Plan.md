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
next: Take the quick backup, then run one dry-run export of a real session and write the real field names into step 1.
related_progress:
  - "[[Hermes System]]"
notes:
  - "[[Conversation Layer]]"
  - "[[Capture Pipeline - As Built]]"
  - "[[Capture Registration]]"
  - "[[Capture Scripts]]"
  - "[[Per-Prompt Record]]"
  - "[[Platform Coverage]]"
  - "[[Hermes Primed Home Plan]]"
  - "[[Agentic OS and Shared Memory Plan]]"
---
# Hermes Conversation Tracking Plan
## Goal
==Every Hermes conversation is exported into Jarvis in the vault's conversation format, on a schedule, with secrets redacted, so the next session starts with context and Hermes counts as the second platform in the shared memory plan.== This is now the next build. [[Platform Coverage]] lists local models as a platform where nothing logs a run, and Hermes already keeps a clean local record, so the work is an exporter, not a hook.
## Decisions
*2026-11-26.* The capture folder is `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Hermes/<project>/`, a sibling of the Claude, Codex and Kiro folders and of the empty `Local` folder, which stays unused. It follows the `<machine>/<os>/<tool>/<project>` layout in [[Conversations]], with `source_app: hermes` and `source_os: windows` (`hermes` was added to the Standard the same day). The exporter script lives in `D:\Apps\Hermes\scripts`, tracked by the Hermes home git, so this pass adds nothing to `30_Order`. Hermes stays on v0.21.3 until capture works, because the exporter depends on the session store and an update changes it.
## Sequence
What Hermes provides, read on 2026-11-26: sessions live in a SQLite store (`state.db`), and `hermes sessions stats` reports 2 sessions and 4 messages. `hermes sessions export` writes JSONL, Markdown, QMD, HTML or a trace, filters by session id, time, source, model, provider, working folder, message, token and tool-call counts, and takes `--redact`, `--only user-prompts` and `--dry-run`. A bulk export without a filter is refused.
Before step 1: the quick backup from [[Hermes Primed Home Plan]] step 1 exists, and the vault's `AI Conversations/Acer/Windows/` has no `Hermes` folder yet (the exporter creates it on the first write).
1. Inventory one real session. Run `hermes sessions list`, then `hermes sessions export --format jsonl --session-id <id> --dry-run`. Done when the real key names for id, title, start, end, source, model, working folder, token counts and tool calls are written into the mapping in step 2.
2. Write the field mapping. The Standard needs `type: input`, `input_kind: ai-conversation`, `source_app`, `source_os`, `title`, `started_at`, `exported_at`, `project`, `session_id`, `created`, `updated`, `tags` and `status: seed` with `review_state: raw`. `created` is the date of `started_at` and `updated` the date of `exported_at`. Optional metrics (`model`, `tokens`, `turn_count`, `tools_used`) come from the JSONL only when Hermes reports them. Done when every required key has a source.
3. Exclude helper sessions. Title generation and compression may create sessions that are not conversations. Compare `--source` and `--end-reason` values and use `--min-messages 2`. Done when no helper session appears in the exports.
4. Route to a project. Map the session's working folder to a project folder with the same file the Claude exporter uses (`capture-projects.json`: first match wins, `fallback: leaf`). A session started in the vault lands under `Jarvis`; one started in the Hermes home needs a rule, which is a change to a `30_Order` file and waits for a yes. Done when two sessions from different folders land in two folders.
5. Write the exporter, `scripts\export-hermes-sessions.mjs`. It keeps a watermark time, runs `hermes sessions export --format jsonl --after <watermark> --redact` into `D:\AI\hermes\exports\staging` (outside the vault), renders the body as `## You`, `## Hermes` and `## Actions Taken`, names the note `MM-DD {title}`, updates an existing note in place by `session_id`, writes UTF-8 with no byte-order mark and never touches the unredacted staging copy from the vault side. Done when one real session becomes one note that [[Vault Lint]] passes as `ai-conversation-export`, and a second run changes nothing.
6. Test redaction with a planted value. In a throwaway session type a fake token such as `sk-test-0000000000000000`, export it, and search the note and the staging file. Done when it appears in neither. If `--redact` does not cover JSONL, the exporter redacts first.
7. **Changes state.** Register `ConversationCapture-Backfill-Hermes` in Task Scheduler on the same 30 minute cadence as `ConversationCapture-Backfill-Windows`, with the silent launcher pattern the other tasks use. Optionally add an `on_session_end` shell hook for an immediate export of the finished session. Done when a run is logged with result 0.
8. **Changes state.** Add a Hermes row to [[Platform Coverage]] and a Hermes section to [[Capture Registration]], each with the verification date, and let the folder get its generated `00 - Session Index.md`. Done when the tables match the folder.
9. Export tool calls as platform-neutral records (session, agent, prompt, tool, target, ok, ms) from the JSONL, so the review loop reads Hermes like any other platform ([[Per-Prompt Record]]). Done when one tool call appears as one record. This shares the hook trail in [[Hermes Change Ledger Spec]], which records what changed, where this records what was said.
*Out of scope this round:* using a local Hermes model as the second reviewer (stage B of [[Local Reviewer]]), and shared memory beyond the notes ([[Agentic OS and Shared Memory Plan]]).
## Open Questions
- [ ] Is session auto-delete off on v0.21.3? Version 0.22.0 turned on deletion after 90 days and 0.23 made it opt-in; the installed config has no session-prune key, but confirm before trusting it.
- [ ] Does the desktop app write to the same `state.db` as the CLI? Start one session in each and compare `hermes sessions list`.
- [ ] Where do helper sessions appear, and are they marked?
- [ ] After the update to a newer tag, does the JSONL shape still match the exporter? Re-run steps 1 and 5 then.
