---
type: project
status: active
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - ledger
  - monitoring
project_kind: spec
next: Run hermes hooks test post_tool_call, record the real payload keys here, then write ledger.mjs against them.
notes:
  - "[[Hermes Primed Home Plan]]"
  - "[[Hermes Control Surface]]"
  - "[[Hermes Conversation Tracking Plan]]"
  - "[[Per-Prompt Record]]"
  - "[[Capture Pipeline - As Built]]"
---
# Hermes Change Ledger Spec
## What This Is
==The ledger is one append-only line for every Hermes action that changes the machine, and a nightly digest that compares the day with what a healthy day looks like.== It exists so git, backups, scripts, installs and scheduled tasks that Hermes touches are logged and maintained every day, and so a day with too much or too little shows up in the morning, not weeks later.
Source: a shell hook on `post_tool_call` for `terminal`, `write_file` and `patch` (and `execute_code` and `delegate_task` if they appear in the tool list). Each hook run gets a JSON payload on stdin with the event, tool name, tool input, session id, working folder and profile, and writes one line.

| Field | Holds |
|---|---|
| `ts` | local time, ISO |
| `session_id`, `profile`, `cwd` | where it happened; `cwd` maps to a project the way `capture-projects.json` does |
| `tool` | `terminal`, `write_file`, `patch` |
| `category` | one of the nine below |
| `target` | the path or the command's first 200 characters, redacted |
| `ok`, `ms` | outcome and duration, if the payload carries them |
| `approval` | `auto`, `asked`, `allowed-list` or `denied` |
| `checkpoint` | the checkpoint id when one was taken |
The nine categories: `git`, `backup`, `script-write` (a write to `.ps1`, `.sh`, `.py`, `.mjs`, `.js`), `install` (pip, npm, winget, choco, uv, cargo), `schedule` (schtasks, `Register-ScheduledTask`, `hermes cron`), `delete`, `network` (curl, wget, gh), `config` (anything under the Hermes home), `other`. Field names reuse the vocabulary of [[Per-Prompt Record]] (session, tool, target, ok, ms) so the review loop can read Hermes like any other platform.
Files: `D:\AI\hermes\ledger\YYYY-MM-DD.jsonl`, outside the vault and outside any sync, never containing file contents, only paths and hashes. The digest is rendered from that file at night to `YYYY-MM-DD.md`, and a copy goes to the Hermes capture folder in the vault as a generated note.
## Current State
Nothing is built. On 2026-11-26 `hermes hooks list` showed no hooks, the source defines the hook events (`pre_tool_call`, `post_tool_call`, `pre_llm_call`, `on_session_start`, `on_session_end`, `subagent_stop` and others), and the docs promise the stdin shape above. **The unverified part is whether `post_tool_call` carries the tool result and the duration.** If it does not, `ok` and `ms` stay empty and the ledger records intent, not outcome. Test it before writing the script.
## Definition of Done
A real session that writes a file, runs a git command and installs nothing produces exactly the matching lines. The digest names each category's count. A planted fake token in a command appears redacted. The hook is slower than 100 ms on no run, and a hook crash never stops the agent (fail open on `post_tool_call`, fail closed only on the one guard).
## Daily review
The digest ends with a table of expected and ceiling counts. These are starting values and move after 14 days of real data.

| Check | Healthy day | Flag |
|---|---|---|
| Quick backup | one zip, newer than 26 hours | none (underdone) |
| Home commit | changes committed within 24 hours | uncommitted changes older than a day (underdone) |
| Deletes | 0 to 5 | more than 10 (overdone) |
| Installs and scheduled tasks | each one reviewed by name | any not in the plan (overdone) |
| Network and `gh` | reads only | any push or delete (overdone) |
| Scripts written | each listed with its path | a script outside the Hermes home or a project folder |
| Denied or asked approvals | listed with the rule | a rule that fires daily means the allowlist or the prompt is wrong |
## Non-Goals
Not a transcript: that is [[Hermes Conversation Tracking Plan]]. Not a security boundary: it records, it does not contain ([[Hermes Control Surface]]). Not a record of Claude Code, which has its own hooks and session log. No file contents, no model output, and no cloud upload.
## Evidence
Hook events, payload shape and `fail_closed` read in `hermes-agent\website\docs\user-guide\features\hooks.md` on 2026-11-26. Event names counted from the installed source. `hermes hooks list`, `hermes hooks --help` and `hermes backup --help` run the same day.
