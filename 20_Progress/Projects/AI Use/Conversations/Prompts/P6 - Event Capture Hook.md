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
task: event-capture-hook
model: claude-sonnet-5-5
---
# P6 - Event Capture Hook
Run by Sonnet 5.5 inside the directory: `D:\_Anant\20_Progress\Documents\Jarvis`
Suggested effort: high. It registers a global hook that runs on every tool call, so the design must be right.
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
Status of this draft: designed from the Design note and the hooks reference, before P0 to P4 ran. Do not run it until P3 (timing) and P4 (postmortem) have reported. Refresh the "inputs from earlier phases" part and any step P4 changed.
## Prompt - P6 Event Capture Hook
````
<role>
You are building the sensor of the owner's session-review loop: a small, fast, model-free Node script that records facts about each prompt and tool call in Claude Code. It must never slow the owner down, never print to the session, and never lose a failure silently.
</role>

<context>
The weekly review reads facts, not scraped transcripts. The record shape is defined in 20_Progress/Projects/AI Use/Conversations/Per-Prompt Record.md; the design is Conversation Loop Design.md layer L0; the failure codes it must support are in Failure Taxonomy.md. Read those three first. P4's postmortem and its Corrections override this prompt where they differ.

Inputs from earlier phases (refresh): P3's measured cost of a PowerShell hook and its async decision; P4's decisions on the record shape; P2's capture-projects.json routing file and its rules.

Verified in the Claude Code hooks reference on 2026-10-22 (https://code.claude.com/docs/en/hooks.md; re-check):
- 33 events. Every hook receives session_id, prompt_id (absent until the first user input), transcript_path, cwd, permission_mode, effort, hook_event_name.
- UserPromptSubmit adds prompt. PostToolUse adds tool_name, tool_input, tool_use_id, tool_response, duration_ms. PostToolUseFailure adds error, is_interrupt, duration_ms. PermissionDenied adds reason. SubagentStop adds agent_id, agent_type, agent_transcript_path, last_assistant_message. PreCompact and PostCompact add trigger. InstructionsLoaded adds file_path, memory_type, load_reason. Stop adds last_assistant_message. StopFailure adds error.
- Matching hooks run in parallel and PostToolUse fires concurrently for parallel tool calls. Async hooks cannot change Claude's behavior, and their timeout is not enforced. In headless runs (claude -p) async hooks still running at teardown are killed.
- Stdout of a UserPromptSubmit hook is added to the model's context, so the script must print nothing to stdout.
- Node v24.19.0 is installed. .gitignore and .stignore list specific log file names only; events-*.jsonl is not covered yet.
Owner decisions: raw events stay on each machine (the Acer first). Every directory the owner uses with Claude Code is tracked, with a project name from the same routing file as the exporter. Prompt text is redacted and never pasted documents.
</context>

<goal>
One deterministic hook script and its tests, registered globally for the events that the Per-Prompt Record needs, appending redacted one-line JSON records to a per-machine file that git and Syncthing ignore. A forced failure leaves a failure row. The measured overhead is within P3's budget. The owner can see counts per event for a session and compare them with the prompt count, without reading any text.
</goal>

<constraints>
- The script prints nothing to stdout and always exits 0. It makes no model call and no network call. JARVIS_EVENTS_OFF=1 disables it.
- It never stores a tool_response body (byte length only), a full shell command (first token and an ok flag only), or any prompt over 2,000 characters or 40 lines (store length, the first 200 characters and pasted: true; these two numbers are working rules, not sourced). Redact stored text with the exporter's eight rules, written once in a Node module with test vectors.
- One appendFileSync of one line under 4 KB per event. A failure to write goes to %LOCALAPPDATA%\claude-capture\events-fallback.log.
- Build in 30_Order/System/claude-workflow/hooks/ (the script and a lib folder) with node --test tests beside the existing scripts. Edit only the "hooks" block of C:\Users\anant\.claude\settings.json, with targeted edits after copying it to the scratchpad, and leave the existing Stop and SessionEnd entries alone.
- Add ignore lines for events-*.jsonl and the fallback log to .gitignore and to .stignore (with the (?d) prefix like its neighbors). Prove them with git check-ignore -v. Note that .stignore does not sync, so the Dell needs the same lines by hand later.
- Never open .credentials.json, .env files, or history.jsonl text (counting its lines for a coverage test is allowed).
- Do not run git commit or git push. Notes you patch: no em dashes, no blank line after a heading, path-qualified wikilinks.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result. End with a short recap.
</progress_updates>

<steps>
1. Key capture. Register a temporary logger that records only field names and value types per event for about an hour of normal use. Compare with the documented fields, answer whether a slash command fires UserPromptSubmit, and remove the logger. Pin the observed field lists as fixtures in a schema test so a release that renames a field fails a test.
2. Write the script and lib: parse stdin, resolve the project through the routing file's rules (reimplement the rules in Node and share one fixture file of cases with the PowerShell routing test so the two cannot drift), classify the event, redact, append. Common row: version, timestamp, machine, session_id, prompt_id, agent_id when present, event, cwd, project. Per-event fields follow the Per-Prompt Record. On Stop also write a turn_end row with the first 300 redacted characters of last_assistant_message, claims_done (a regex list in an editable JSON config) and verified_after_last_edit (any Bash or PowerShell row after the last Edit or Write row of the same prompt_id whose command head is in an editable list of test, lint and build commands).
3. Failure rows. A parse error or unknown payload writes a failure row with the stage and a truncated message to the same file and a line to stderr. Silence is never an outcome.
4. Tests (node --test, synthetic fixtures): one expected row per event type; empty stdout for every event; garbage and empty stdin give a failure row and exit 0; redaction vectors; routing fixtures; and 50 concurrent processes leave 50 intact lines.
5. Measure: 100 sequential runs, p50 and p95 wall time including Node startup. Compare with P3's budget. If over, investigate before registering.
6. Register after the tests pass: one handler, node "<absolute path>\hooks\jarvis-events.js", async true, timeout 10, for UserPromptSubmit, PostToolUse, PostToolUseFailure, PermissionDenied, SubagentStop, PreCompact, PostCompact, InstructionsLoaded, StopFailure, and a second Stop entry. Parse the file afterward and confirm only the hooks block changed.
7. Write the smoke test for the owner: open a fresh session in a tracked directory, send one prompt that uses two tools, then run a one-liner that prints row counts per event for that session and the history.jsonl line count for that session id. Mark it pending.
8. Patch Capture Registration, Per-Prompt Record (the ignored-folder claim and the final field list) and the hook table in 30_Order/System/claude-workflow/README.md, each with a dated entry, and add the Log line to Conversation Layer.md.
</steps>

<verification>
When you change code that can be run, built, or type-checked, run a real check that exercises the change before reporting it done: the project's tests, type-checker, or build, or the changed command itself. A syntax-only check, or a check command that failed to start, does not count; if all that is missing is the project's declared dependencies, install them with its own package manager and lockfile, never via sudo or the system package manager, unless told not to. Only if no real check can run here, say which one you did not run and why instead of reporting the change as done. Here the real checks are the node tests, the concurrency test, the overhead measurement, git check-ignore, and the settings parse.
</verification>

<report>
Reply with: the key-capture result (any missing or renamed field and the slash-command answer); test output; the overhead table; the git check-ignore output; the settings diff and backup path; the pending smoke test; and anything you cut from the record and why. Under 400 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]].
