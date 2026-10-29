---
type: project
status: active
created: 2026-10-21
updated: 2026-10-28
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
### `scripts/export-claude-session.ps1` (1,076 lines)
- *Parameters:* `-TranscriptPath`, `-SessionId`, `-Cwd`, `-SourceApp` (`ClaudeCode` or `Cowork`), `-BackfillAll`, `-DryRun`, `-Force`.
- *`-Force`:* re-renders a session even when its marker is newer than the transcript. It reuses the note file name stored in the marker, so a title change cannot create a second note, and the session stays in the folder holding its marker. Used on 2026-10-28 as `-BackfillAll -Force` to regenerate the Acer notes in the finished format.
- *Test override:* the environment variable `JARVIS_CAPTURE_OUTROOT` replaces the computed output root so tests and real-transcript checks write to a scratch folder. Test only; the hook and the scheduled task never set it.
- *Machine:* host name `desktop-3vbg0jh` is Dell, `gupta-builds` is Acer, anything else returns nothing and logs to `%LOCALAPPDATA%\claude-capture\unknown-host.log`.
- *Project:* `Get-ProjectName` reads the ordered rules in `capture-projects.json` (see the routing file card below), caches them per run, and uses the cwd's last path segment when no rule matches. An empty cwd gives `Unknown`. Before 2026-10-28 it knew only the vault, The Plan and Home, which is why `Code`, `CSCI 5304`, `denytest`, `Plans`, and `Jesse` existed as project folders on the Acer.
- *Price table:* twelve models, dollars per million tokens, each with its own cache-read multiplier (0.05 for `claude-opus-5-5` and `claude-sonnet-5-5`, 0.1 for the rest). Added 2026-10-28: `claude-opus-5-5` (4.00 and 20.00), `claude-sonnet-5-5` (2.00 and 10.00), `claude-haiku-5-5` (0.10 and 0.50, the up-to-100,000-token rate). Cache writes are 1.25x (5 minutes) and 2x (1 hour) of input. A model with no entry (`claude-fable-5-1` today) makes the session's `cost_usd` null.
- *Redaction:* `Redact-Secrets` applies eight regex rules: `sk-ant-`, `sk-`, `ghp_`, `xox*-`, `AKIA`, `Bearer` tokens, `SetEnvironmentVariable` values, and a catch-all for any 24-plus character token mixing letters and digits.
- *Rendering:* `Format-ToolCall` writes each tool call as a list line. Bash and PowerShell commands, their results, Write contents, and Edit and MultiEdit diffs go in fenced blocks (`bash` and `powershell` tagged for commands; every diff line carries `-` or `+`). Read, Grep, Glob, and the default JSON dump for Agent, Skill, and MCP calls stay one-line inline spans. Helpers: `Get-Fence` and `Format-InlineCode` size the delimiter past any backtick run in the content, `Write-Utf8NoBom` writes without a byte-order mark.
- *Output:* the note, the `.exported/<id>.done` marker, the `_raw_jsonl` junction, and both `00 -` rollup files (`Update-Rollups`, typed `generated`, `gen_kind: index`). Frontmatter carries `status: seed`, `review_state: raw`, `created`, and `updated`.
- *Modes:* single session from the hook, a full walk of top-level transcripts with `-BackfillAll`, and `-DryRun`, which reports seen, duplicate, legacy, and pending counts without writing.
- *Logging:* none to disk except the unknown-host line. Counts go to the console.
### `capture-projects.json` (18 lines, in `30_Order/System/claude-workflow/`)
- *Does:* holds the project routing rules: a `version`, a `comment` on how to add a project, an ordered `rules` list (`project`, `match` of `under` or `exact`, `path` with the tokens `{vault}`, `{root}`, `{home}`, `{localappdata}`), and `fallback: "leaf"`. First match wins. Tokens resolve from the exporter's own location and the environment, so the Dell can reuse the file. The table is in [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]].
- *Failure:* a missing or invalid file switches the exporter to the built-in Jarvis, The Plan and Home rules and writes one line to `%LOCALAPPDATA%\claude-capture\routing.log`. It never throws.
### `scripts/check-capture-coverage.ps1` (160 lines)
- *Does:* read-only proof. For each top-level transcript it reports whether the session has an assistant turn (a text search for the assistant type marker, not a parse), whether exactly one note carries its `session_id`, and whether that note sits in the folder the routing rules give for the transcript's first cwd. It counts notes whose transcript is gone and that lack `review_state`. Exits 1 on any session with no note, two notes, or a wrong folder. Sessions with no assistant turn and sessions that exist only in the legacy trees are listed as exempt.
- *Parameters:* `-TranscriptsRoot`, `-NotesRoot`, `-RoutingFile`, so tests can point it at synthetic folders. Tested by `test-check-capture-coverage.ps1`.
### `scripts/reroute-acer-notes.ps1` (303 lines)
- *Does:* prints a plan, and changes things only with `-Apply`. Notes whose transcript is gone and that sit in the wrong folder move with their marker and get a new `project:` line (a pre-edit copy is archived). A session with two notes keeps the one with the later `exported_at`. A live session in the wrong folder has only its marker archived, so the exporter writes the regenerated note into the right folder; the old note is archived by the next run. Folders left with no notes are retired, and folders named by a routing rule never are.
- *Safety:* nothing is deleted; moved-out files go to the archive folder with a SHA-256 `MANIFEST.csv` that later runs append to. Each retired folder's `_raw_jsonl` junction is removed with `cmd /c rmdir`, never `Remove-Item -Recurse`, and the live transcript set is re-checked after every removal. Parameters: `-NotesRoot`, `-TranscriptsRoot`, `-RoutingFile`, `-ArchiveRoot`, `-Apply`.
### `scripts/wsl-session-export.ps1` (760 lines)
- The WSL twin. Same contract, same machine lookup, `Machine/WSL/Claude` as the output. Derived in Build 5c from the Dell's old hook file; the changes were root resolution, the machine segment, the legacy-marker check, create-if-missing, and `-DryRun`. Runs under `pwsh` inside WSL. Dedup is the existence of `_raw_jsonl/<session_id>.jsonl`, a one-way copy, plus the marker. Not run on this machine today; WSL is stopped.
### `scripts/backfill-windows-silent.vbs` and `scripts/backfill-wsl-silent.vbs`
- Hidden launchers. Run the exporter with `-BackfillAll` and wait for it, then run `update-capture-health.ps1` with the real exit code, then quit with that same code. The WSL launcher calls `wsl.exe -e bash -lc "pwsh ... ~/.claude/hooks/wsl-session-export.ps1 -BackfillAll"`, so it points at the user-home hook path, not the vault copy.
### `scripts/update-capture-health.ps1` (146 lines)
- Takes `-TaskLabel Windows|WSL` and `-ExitCode`. Appends `{timestamp, exitCode}` to `logs/capture-health-<label>.json`, keeping the last 20, then rewrites `00 - Capture Health.md` with the last 10 rows per label and a warning callout after 3 consecutive failures. No model calls. It records the exit code only: not how many sessions were seen, written, skipped, or failed.
### `scripts/register-capture-backfill-windows-task.ps1` (82 lines)
- Registers `ConversationCapture-Backfill-Windows` on the Acer only (it refuses any other host). Dry run unless `-Apply`. Settings were copied from the Dell's task on 2026-10-17: 30-minute repetition for 3,650 days, `RestartCount` 3 at `PT2M`, hidden, start when available, 10-minute limit, ignore new instances, and it runs on battery. Logs to `%LOCALAPPDATA%\claude-capture\register-task.log`. There is no equivalent script for the Dell, and none for WSL timers.
### `scripts/run-all-tests.ps1` (33 lines) and the `test-*.ps1` files
- The runner runs every `test-*.ps1` in `scripts/` under `pwsh` and under `powershell.exe` (the hook's shell), prints one PASS or FAIL line per test per shell, and exits non-zero if any fail. Run by hand; nothing schedules it.
- `test-exporter-output.ps1` (207 lines): synthetic transcripts for frontmatter, no BOM, rollup typing, fenced and inline rendering, per-model cost, and an en dash title surviving a second export. Takes `-ExporterPath` to run against another copy of the exporter.
- `test-capture-projects.ps1` (140 lines): every routing rule inside and outside its path, rule order, case, trailing slash, sibling-prefix paths, the Scratch rule on a real `%LOCALAPPDATA%\Temp\claude` path, the leaf fallback, and a missing, corrupt or invalid routing file. `test-check-capture-coverage.ps1` (78 lines): one synthetic session per coverage case, and that the script changes no file.
- `test-token-dedup.ps1` (93 lines): one count per message id in both exporters. `test-project-routing.ps1` (82 lines): project naming and the folder a session keeps. `test-token-aggregation.ps1` (87 lines): tool, token, and cost totals; rewritten 2026-10-28 to build its own transcript, because the fake one it used no longer existed and it had been failing.
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
## Corrections
*2026-10-28. The sections above are kept as written.*
### The hook card (`hooks/jarvis-session-continuity.ps1`, now 215 lines)
- **New output:** after the export, the hook appends a second line to `jarvis-session-activity.jsonl`: `{timestamp, event: "export_result", session_id, status, ms, error}`. `status` is the exporter's own (`written`, `dup`, `junk`, `legacy`, `error`), `skipped` when no export was attempted (`error` says `no session_id`, `no transcript_path` or `transcript not found`), or `no_status` when the exporter printed none. `ms` times the session export only, not the Cowork sweep. `error` is empty on success; on an exception it holds the exception type and the script line (shape: `<ExceptionType> at <script>.ps1:<line>`), never a message, a path, or transcript text. The first line is unchanged and is still written before the export.
- **Superseded:** "cannot report a failure" and "no script writes a success, skip, or failure record per export" are no longer true for the session export. Still true for the Cowork sweep (one empty `catch` per transcript) and for the backfill.
- **Failure:** a `trap` at the top turns any unexpected error into exit 0. A log write that fails is swallowed inside one helper and cannot throw. Checked with six odd stdin payloads and a log path that is a folder: exit 0 each time.
- **Test overrides (test only, never set in settings or a task):** `JARVIS_ACTIVITY_LOG` replaces the activity file path; `JARVIS_CAPTURE_OUTROOT` is read by the exporter and reaches it because the hook calls the exporter in its own process.
- **Settings:** the "Settings" bullet is superseded. `Stop` is `async: true`, `timeout: 60`; `SessionEnd` is synchronous, `timeout: 30`. See [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]].
- **Byte-order mark:** the Gaps line saying the hook scripts carry a byte-order mark is wrong for this hook. It has none, and none at the last commit either. It does hold two non-ASCII em dashes, in the `SessionStart` text that never runs. Nothing was changed there.
### Timing, 2026-10-28
Wall time of `powershell.exe -NoProfile -File <hook>` with JSON on stdin, `Measure-Command`, 5 runs per cell, p50 / p95 in milliseconds (nearest rank, so p95 is the slowest of 5). Output went to a scratch folder and the activity file to a scratch file. "Fresh" is a new session id, so the export really ran; "dup" is the same id again, so the early return ran. Startup of an empty script was 219 / 231, and the hook with garbage stdin 229 / 379.

| Transcript | Export status | `Stop` fresh | `SessionEnd` fresh | `Stop` dup | `SessionEnd` dup |
|---|---|---|---|---|---|
| smallest, 1,918 B | `junk` | 523 / 552 | 490 / 585 | 547 / 569 | 436 / 593 |
| median, 1,104,343 B | `written` | 874 / 1,159 | 874 / 892 | 434 / 473 | 485 / 627 |
| largest, 115,894,961 B | `written` | 4,909 / 5,225 | 4,827 / 5,055 | 435 / 495 | 512 / 585 |

- The largest transcript is 115.9 MB, not "over 8 MB". Its fresh export is about 4.5 seconds inside the hook, so the time is not proportional to size.
- The `dup` path costs about 100 to 190 ms inside the hook on top of the 219 ms start. The assumption that `dup` is fast held; the assumption that a re-render is the slow case held too. A `Stop` after a turn finds the transcript grown, so it re-renders, and that costs the "fresh" figure.
- This machine has no Cowork folder, so the `SessionEnd` sweep added nothing here.
### Decision
- `Stop`: p95 on the median and largest transcripts (1,159 and 5,225 ms) is over the 500 ms line, so it went async with `timeout: 60`.
- `SessionEnd`: stays synchronous with `timeout: 30`. A fresh export of the largest transcript outlasts the default 1.5 seconds three times over; 30 seconds is about six times the worst measured run.
- No debounce was added. Async already takes the cost off the user. A debounce would skip exports on purpose, which is the failure the `export_result` line exists to catch, and it would leave the last turns to `SessionEnd` or the 30-minute backfill when a session dies without a clean exit. Revisit with the day of real timings below.
### Risks seen but not tested
- An async `Stop` export can still be running when `SessionEnd` starts, and both would render the same note. A collision would show as `status: error` in the activity file. The exporter has no lock.
- Whether an async hook survives `SessionEnd` in an interactive session is undocumented, and a headless run kills it, so only the interactive check below can answer it.
### Pending checks for the owner
1. `SessionEnd` really exports: in a scratch folder, start `claude`, send one prompt, run `/clear`, then run `Get-Content $env:USERPROFILE\.claude\jarvis-session-activity.jsonl -Tail 3`. An `export_result` line for that session must appear. Do not use `claude -p`; it kills async hooks and gives a false result.
2. After one normal working day: p50 and p95 of `ms` from the real file, `Get-Content $env:USERPROFILE\.claude\jarvis-session-activity.jsonl | ConvertFrom-Json | Where-Object event -eq export_result`, then group by `status` and take the 50th and 95th percentile of `ms`. Also count lines whose `status` is `error` or `no_status`.
### The test files
`test-session-hook.ps1` (112 lines) runs the hook as a child shell with synthetic transcripts: empty stdin, garbage stdin, a missing transcript, a valid transcript (written, then dup, exact field names, no transcript text in the log), and an export that throws. 21 assertions, 7 test files in total, 14 of 14 runs passing under `pwsh` and `powershell.exe`.
