---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - prompt
project_kind: prompt
task: event-capture-hook
model: claude-sonnet-5-5
---
# P6 - Event Capture Hook
Run by Sonnet 5.5 inside the directory: `D:\_Anant\20_Progress\Documents\Jarvis`
Suggested effort: high. It registers a global hook that runs on every tool call, so the design must be right.
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
Status of this draft: refreshed on 2026-10-30 from the design postmortem and a second pass that re-read the hooks reference and tested the machine. Run it only after P5 (the hand review) has reported what made coding hard, P4b (The Plan stays local) is done, and the owner has answered the deleted-note policy. It replaces the 2026-10-22 draft, which had the hook store 200 characters of each prompt and compute `claims_done` and `verified_after_last_edit` at Stop time.
## Prompt - P6 Event Capture Hook
````
<role>
You are building the sensor of the owner's session-review loop: a small, fast, model-free Node script that records facts about each prompt and tool call in Claude Code. It must never slow the owner down, never print to the session, never store text, and never lose a failure silently.
</role>

<context>
The weekly review reads facts, not scraped transcripts. The record is defined in 20_Progress/Projects/AI Use/Conversations/Per-Prompt Record.md (rewritten 2026-10-30): the hook writes only fact rows; a digest folds them into prompt records later. Read that note, Conversation Loop Design.md layer L0, the "What each remaining phase must do" part of Conversation Loop Build Plan.md, and Failure Taxonomy.md first. P5's list of what made coding hard overrides this prompt where they differ.

Verified in the Claude Code hooks reference on 2026-10-30 (https://code.claude.com/docs/en/hooks.md; re-check, the pages change often; Claude Code is 2.1.314):
- 33 events. Common input: session_id, prompt_id ("absent until the first user input"), transcript_path ("may lag the in-memory conversation"), cwd, scratchpad_dir, permission_mode, effort, hook_event_name. agent_id and agent_type identify a subagent or teammate; a subagent's tool calls fire the same hooks.
- UserPromptSubmit adds prompt. It also fires for a scheduled task or /loop iteration, a background subagent reporting back, and a message from another session, and for a typed skill or custom command with the line as typed. UserPromptExpansion carries command_name. Whether a typed built-in command such as /clear fires UserPromptSubmit is not documented.
- PostToolUse adds tool_name, tool_input, tool_use_id, tool_response, duration_ms. PostToolUseFailure adds error, is_interrupt, duration_ms. PermissionDenied fires only in auto mode (the owner's sessions are auto). SubagentStop adds agent_id, agent_type, agent_transcript_path, last_assistant_message. PreCompact and PostCompact add trigger. InstructionsLoaded adds file_path, memory_type, load_reason and is asynchronous. Stop adds last_assistant_message. StopFailure adds the API error string.
- Matching hooks run in parallel and PostToolUse fires concurrently for parallel tool calls. Async hooks cannot change Claude's behavior and their timeout is not enforced. Under claude -p, async hooks still running at teardown are killed.
- Stdout of a UserPromptSubmit hook is added to the model's context, so the script must print nothing to stdout.
- Measured on this Acer: Node v24.19.0 starts and appends one line in 57 ms at p50 and 213 ms at p95 (60 runs). 100 simultaneous appends of 3.0 KB and of 3.9 KB left 0 torn lines in 200. PowerShell starts in about 219 ms.
- git check-ignore -v on 30_Order/System/claude-workflow/logs/events-GUPTA-BUILDS.jsonl exits 1: the file would be tracked and synced. .gitignore and .stignore list named log files only.
- The existing registrations are in C:\Users\anant\.claude\settings.json: Stop (async, timeout 60), SessionEnd (timeout 30), three PreToolUse entries for the PDF guard (timeout 20). Leave them alone.
- C:\Users\anant\.claude\jarvis-session-activity.jsonl begins with a byte-order mark on its first line. Your own file must not.

Owner decisions: raw events stay on each machine and are local only. Every directory the owner uses with Claude Code is tracked, with a project name from capture-projects.json. The record holds NO prompt text, no assistant text, no tool output and no pasted content (a working default the owner may veto). Scripts live in the vault; registration is user-level in settings.json, made by a script kept in the vault, because The Plan, Home and UMN Courses sit outside the vault. The Plan's session notes stay local to the Acer (P4b).
</context>

<goal>
One deterministic hook script and its tests, registered globally for the events that the Per-Prompt Record lists, appending one-line JSON fact rows to a per-machine file that git and Syncthing ignore before the first line is written. A forced failure leaves a hook_error row. The measured overhead is within P3's budget. The owner can print counts per event for a session and compare the UserPromptSubmit count with the typed prompts counted per session in history.jsonl, without reading any text.
</goal>

<constraints>
- The script prints nothing to stdout and always exits 0. No model call and no network call. JARVIS_EVENTS_OFF=1 disables it.
- Rows are facts only. Never store a prompt, an assistant message, a tool_response body (byte length only), a full shell command (first token and an ok flag only), or an error message (a short error_class code only). Do NOT compute claims_done or verified_after_last_edit; the digest does that. Store UserPromptSubmit as length, line count, pasted (true over 2,000 characters or 40 lines; working numbers, not sourced) and command_name (the first word when the line starts with /).
- Common row: v (schema version, 1), ts, machine, session_id, agent ("main" or the agent_id), prompt_id or null, event, cwd, project, claude_version when available. Key by session, agent and prompt_id; a row with no prompt_id is written with null.
- One appendFileSync of one line under 4 KB per event, written without a byte-order mark. A failure to write goes to %LOCALAPPDATA%\claude-capture\events-fallback.log.
- Build in 30_Order/System/claude-workflow/hooks/ (the script and a lib folder) with node --test tests beside the existing scripts. No dependencies. Edit only the "hooks" block of C:\Users\anant\.claude\settings.json, with targeted edits after copying it to the scratchpad, and leave the existing entries alone. The edit is made by a registration script kept in 30_Order/System/claude-workflow/scripts/ (dry run unless -Apply, refuses other hosts, backs up first), not by hand.
- Add ignore lines for events-*.jsonl and the fallback log to .gitignore and to .stignore (with the (?d) prefix like its neighbors) BEFORE the first write. Prove them with git check-ignore -v. Note that .stignore does not sync, so the Dell needs the same lines later.
- Never open .credentials.json, .env files, or history.jsonl text (counting its lines per session for the smoke test is allowed).
- Do not run git commit or git push. Notes you patch: no em dashes, no blank line after a heading, path-qualified wikilinks.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result. End with a short recap.
</progress_updates>

<steps>
1. Ignore lines first. Add events-*.jsonl and the fallback log to .gitignore and .stignore, then prove them with git check-ignore -v on a would-be events file name. Only then continue.
2. Key capture. Register a temporary logger (in the scratchpad, not the vault) that records only field names and value types per event for about an hour of normal use, with the real settings backed up. Answer, with counts: which of the 33 events fire; whether a subagent's rows carry the parent's prompt_id; whether a typed /clear fires UserPromptSubmit; whether InstructionsLoaded fires at session start with no prompt_id; whether PermissionDenied appears. Remove the logger. Pin the observed field lists as fixtures in a schema test so a release that renames a field fails a test.
3. Write the script and lib: parse stdin, resolve the project through the routing file's rules (reimplement them in Node and share one fixture file of cases with the PowerShell routing test so the two cannot drift), classify the event, append. Per-event fields follow the Per-Prompt Record fact-row table. A parse error or unknown payload writes a hook_error row (stage and a short error_class) to the same file and one line to stderr. Silence is never an outcome.
4. Tests (node --test, synthetic fixtures): one expected row per event type; empty stdout for every event; garbage and empty stdin give a hook_error row and exit 0; no row ever contains prompt text or a tool_response body; no byte-order mark; the 4 KB cap; JARVIS_EVENTS_OFF=1; routing fixtures; and 50 concurrent processes leave 50 intact lines.
5. Measure: 100 sequential runs, p50 and p95 wall time including Node startup, against the 57 and 213 ms baseline and P3's PowerShell numbers. If over, investigate before registering.
6. Headless test. With a copy of the hook entries in a --settings test file (not the real settings), run one claude -p prompt in a scratch folder that uses two tools, and report exactly which rows landed and which did not. Do not use the result to claim the hook works under -p; the docs say async hooks are killed at teardown.
7. Register after the tests pass: one handler, node "<absolute path>\hooks\jarvis-events.js", async true, timeout 10, for UserPromptSubmit, PostToolUse, PostToolUseFailure, PermissionDenied, SubagentStart, SubagentStop, PreCompact, PostCompact, InstructionsLoaded, StopFailure, and a second Stop entry. Parse the file afterward and confirm only the hooks block changed and the existing entries are byte-identical.
8. Write the smoke test for the owner: open a fresh session in a tracked directory, send one prompt that uses two tools, then run a one-liner that prints row counts per event for that session and the typed-prompt count for that session id from history.jsonl (counting lines only). The pass rule is: every typed prompt counted per session has at least one UserPromptSubmit row, and every extra row belongs to a scheduled, subagent-report or other-session prompt. Mark it pending.
9. Patch Capture Registration, Per-Prompt Record (answer each "Verify in P6" item and pin the final field list) and the hook table in 30_Order/System/claude-workflow/README.md, each with a dated entry, and add the Log line to Conversation Layer.md.
</steps>

<verification>
When you change code that can be run, built, or type-checked, run a real check that exercises the change before reporting it done: the project's tests, type-checker, or build, or the changed command itself. A syntax-only check, or a check command that failed to start, does not count; if all that is missing is the project's declared dependencies, install them with its own package manager and lockfile, never via sudo or the system package manager, unless told not to. Only if no real check can run here, say which one you did not run and why instead of reporting the change as done. Here the real checks are the node tests, the concurrency test, the overhead measurement, git check-ignore, the headless run, and the settings parse.
</verification>

<report>
Reply with: the key-capture result (any missing or renamed field, the subagent prompt_id answer, the /clear answer); test output; the overhead table; the git check-ignore output; the settings diff and backup path; the headless result; the pending smoke test; and anything you cut from the record and why. Under 400 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]].
