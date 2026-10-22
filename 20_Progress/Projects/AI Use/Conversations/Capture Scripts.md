---
type: project
status: active
created: 2026-10-21
updated: 2026-10-21
tags:
  - project
  - ai
  - conversations
  - scripts
project_kind: spec
next: Read the scripts again after the research plan's first section and mark which behaviors are accidents rather than decisions.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]"
  - "[[30_Order/System/claude-workflow/README|Claude Workflow]]"
  - "[[30_Order/System/cursor-workflow/README|Cursor Workflow]]"
---
# Capture Scripts
## What This Is
==Eight files in `30_Order/System/claude-workflow/` make up conversation capture, two of them are separate implementations of the same exporter, and none of them writes a record of what it did.==
One card per script, as the code stands on 2026-10-21. Paths are relative to `30_Order/System/claude-workflow/`. Line counts and behaviors come from reading the files; the Windows exporter was read in parts (parameters, pricing, project naming, redaction, tool-call formatting, rollups, dispatch), not end to end.
## Capture path
### `hooks/jarvis-session-continuity.ps1` (158 lines)
- *Called by:* Claude Code on `Stop` and `SessionEnd`, from the global user settings.
- *Reads:* hook JSON on stdin. Uses `hook_event_name`, `cwd`, `transcript_path`, `session_id`, `reason`.
- *Does:* appends one line to `%USERPROFILE%\.claude\jarvis-session-activity.jsonl`; runs the exporter for this session; on `SessionEnd` also runs it for every Cowork transcript found under `%APPDATA%\Claude\local-agent-mode-sessions` (long-path enumeration, only folders ending `-outputs`). It has a `SessionStart` branch that prints a context-pack policy for sessions inside the vault; that event is not registered, so the branch is dead.
- *Failure:* every side effect sits in an empty `catch`, and the script always exits 0. It cannot block Claude Code and cannot report a failure.
- *Cost:* runs the exporter on every `Stop`, which is every assistant turn.
- *Settings:* the `Stop` and `SessionEnd` entries in `C:\Users\anant\.claude\settings.json` set no `timeout` and no `async` (read 2026-10-21). The docs say `SessionEnd` hooks share a 1.5-second budget unless a longer `timeout` is set (up to 60 seconds), and that `async: true` runs a command hook "in the background without blocking". By that wording, the exporter blocks the end of every turn and a `SessionEnd` export may be cut off. Neither has been timed.
### `scripts/export-claude-session.ps1` (871 lines)
- *Parameters:* `-TranscriptPath`, `-SessionId`, `-Cwd`, `-SourceApp` (`ClaudeCode` or `Cowork`), `-BackfillAll`, `-DryRun`.
- *Machine:* host name `desktop-3vbg0jh` is Dell, `gupta-builds` is Acer, anything else returns nothing and logs to `%LOCALAPPDATA%\claude-capture\unknown-host.log`.
- *Project:* `Get-ProjectName` maps `c:\users\anant` and `c:\users\anant gupta` to `Home`, two old-vault paths to `Jarvis` and `The Plan`, and uses the cwd leaf for everything else. That is why `Code`, `CSCI 5304`, `denytest`, `Plans`, and `Jesse` exist as project folders on the Acer. An empty cwd gives `Unknown`.
- *Price table:* nine models, dollars per million tokens: `claude-fable-5`, `claude-mythos-5`, `claude-opus-5`, `claude-opus-4-8`, `-4-7`, `-4-6`, `claude-sonnet-5` (2.00 input, 10.00 output), `claude-sonnet-4-6`, `claude-haiku-4-5`. A model with no entry makes the session's `cost_usd` null. No entry for `opus-5-5`, `sonnet-5-5`, or `haiku-5-5`.
- *Redaction:* `Redact-Secrets` applies eight regex rules: `sk-ant-`, `sk-`, `ghp_`, `xox*-`, `AKIA`, `Bearer` tokens, `SetEnvironmentVariable` values, and a catch-all for any 24-plus character token mixing letters and digits.
- *Rendering:* `Format-ToolCall` writes each tool call as a list line. Bash and PowerShell commands go in an inline backtick span, not a fenced block. Write contents and Edit diffs go in fenced blocks.
- *Output:* the note, the `.exported/<id>.done` marker, the `_raw_jsonl` junction, and both `00 -` rollup files (`Update-Rollups`, typed `index`).
- *Modes:* single session from the hook, a full walk of top-level transcripts with `-BackfillAll`, and `-DryRun`, which reports seen, duplicate, legacy, and pending counts without writing.
- *Logging:* none to disk except the unknown-host line. Counts go to the console.
### `scripts/wsl-session-export.ps1` (760 lines)
- The WSL twin. Same contract, same machine lookup, `Machine/WSL/Claude` as the output. Derived in Build 5c from the Dell's old hook file; the changes were root resolution, the machine segment, the legacy-marker check, create-if-missing, and `-DryRun`. Runs under `pwsh` inside WSL. Dedup is the existence of `_raw_jsonl/<session_id>.jsonl`, a one-way copy, plus the marker. Not run on this machine today; WSL is stopped.
### `scripts/backfill-windows-silent.vbs` and `scripts/backfill-wsl-silent.vbs`
- Hidden launchers. Run the exporter with `-BackfillAll` and wait for it, then run `update-capture-health.ps1` with the real exit code, then quit with that same code. The WSL launcher calls `wsl.exe -e bash -lc "pwsh ... ~/.claude/hooks/wsl-session-export.ps1 -BackfillAll"`, so it points at the user-home hook path, not the vault copy.
### `scripts/update-capture-health.ps1` (146 lines)
- Takes `-TaskLabel Windows|WSL` and `-ExitCode`. Appends `{timestamp, exitCode}` to `logs/capture-health-<label>.json`, keeping the last 20, then rewrites `00 - Capture Health.md` with the last 10 rows per label and a warning callout after 3 consecutive failures. No model calls. It records the exit code only: not how many sessions were seen, written, skipped, or failed.
### `scripts/register-capture-backfill-windows-task.ps1` (82 lines)
- Registers `ConversationCapture-Backfill-Windows` on the Acer only (it refuses any other host). Dry run unless `-Apply`. Settings were copied from the Dell's task on 2026-10-17: 30-minute repetition for 3,650 days, `RestartCount` 3 at `PT2M`, hidden, start when available, 10-minute limit, ignore new instances, and it runs on battery. Logs to `%LOCALAPPDATA%\claude-capture\register-task.log`. There is no equivalent script for the Dell, and none for WSL timers.
### `scripts/test-token-aggregation.ps1` (68 lines)
- Dot-sources the exporter, feeds it a hand-built fake transcript with known numbers, and diffs the written frontmatter. The only test in the capture path. Not wired to anything.
## Neighbors in the same folder
- `hooks/jarvis-write-guard.ps1` (95) and `hooks/jarvis-internship-note-guard.ps1` (126): vault write rules and internship frontmatter checks on `PreToolUse` and `PostToolUse`. Not capture. The internship guard writes `logs/internship-note-guard.jsonl`.
- `scripts/git-auto-sync.ps1` (458), its register script, and its VBS launcher: the 30-minute commit and push that carries the notes.
- `scripts/run-weekly-review.ps1` (57), its register script, and its VBS launcher: runs `/weekly-review` headlessly through Claude Code's print mode. That run is itself a Claude Code session, so the hook should capture it (unchecked); the `sdk-cli` entries in the transcripts are probably these runs.
- `scripts/register-jarvis-sync-task.ps1` with `sync-all-silent.vbs` and `sync-jarvis-silent.vbs`: the Unison leg that mirrors `second-brain-claudekit`'s `.claude` layer into the vault.
- `distilled-sessions.json` and `_retired-2026-07-31/`: leftovers that no script reads.
## Cursor
`30_Order/System/cursor-workflow/scripts/` holds 14 files (Python and PowerShell): `export-cursor-sessions.py` and `sweep-cursor-sessions.ps1` do the work, `redact_secrets.py` is a separate redaction implementation, `register-cursor-export-task.ps1` registers the Dell task. See [[30_Order/System/cursor-workflow/README|Cursor Workflow]].
## Documented limits the scripts were not written against
- The exporters parse the transcript JSONL directly. The docs call that format internal and likely to break on any release, and name `transcript_path`, `/export`, and `claude -p --output-format stream-json` as supported routes.
- The hook reads five fields of a larger payload. Hook events for failures, permission denials, subagent stops, compaction, and loaded instruction files (`PostToolUseFailure`, `PermissionDenied`, `SubagentStop`, `PreCompact`, `InstructionsLoaded`) are not registered.
- The 30-day transcript sweep also deletes the source the backfill walks, so a backfill can only catch up on the last 30 days. The price table and redaction rules are local findings, not docs items; see [[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]].
## Gaps between cards
- Two exporters carry their own copies of the price table, redaction rules, and rendering code. Cursor has a third redaction implementation in Python.
- Only the Windows backfill has a registration script. The WSL timer and the Dell task were created by hand on 2026-10-17.
- No script writes a success, skip, or failure record per export.
- The PowerShell 5.1 files are sensitive to non-ASCII text: `run-weekly-review.ps1` opens with a warning that a stray em dash once broke string literals, and the hook scripts carry a byte-order mark for the same reason.
## Non-Goals
Not a review of code quality and not a rewrite plan. The Windows exporter's mid-section (turn reconstruction and frontmatter assembly) and the Cursor scripts were not read in full here.
