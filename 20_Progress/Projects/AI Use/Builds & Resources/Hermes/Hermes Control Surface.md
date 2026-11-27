---
type: reference
status: sprout
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - security
  - monitoring
reference_kind: research
area:
  - ai
notes:
  - "[[Hermes Agent]]"
  - "[[Hermes Primed Home Plan]]"
  - "[[Hermes Change Ledger Spec]]"
  - "[[Hermes Local Build Log]]"
next: Run hermes hooks test post_tool_call once the ledger hook exists and write the real payload keys into this note.
---
# Hermes Control Surface
What Hermes Agent can stop, see, undo and scope on its own, checked against the installed v0.21.3 on 2026-11-26 by running the commands and reading the docs that ship in `hermes-agent\website\docs`. Read it before trusting any Hermes session with real work, and before adding a control that Hermes already has.
## Why it matters
The Docker sandbox was dropped on 2026-11-26 (see [[Hermes Docker Sandbox Plan]]), so the terminal backend stays `local`: Hermes runs commands through Git Bash as the same Windows user that owns the vault. Isolation is gone and four things replace it: stop (approvals and deny rules), see (hooks that write a ledger), undo (checkpoints, git and backups) and scope (working folder, project routing and a short connector list). ==Most of that machinery already ships with Hermes and is switched off or empty here.== The plan that turns it on is [[Hermes Primed Home Plan]].
## Controls found, and their state here
| Control | What it does | State on this Acer |
|---|---|---|
| `approvals.mode` | Asks before dangerous shell commands. `smart` lets an auxiliary model judge, `manual` always asks, `off` disables | `smart` (default). The judge is the local model, so a weak model decides |
| `approvals.deny` | Glob list that blocks commands before `--yolo` or mode `off` is consulted | empty |
| `command_allowlist` | Patterns approved for good; `hermes approvals suggest` mines them from history | none yet |
| Hardline blocklist | Code-shipped floor that no flag overrides | always on |
| `hermes approvals test "<cmd>"` | Shows the verdict without running anything | `git status` allowed, a recursive delete asks |
| File write safety | `write_file` and `patch` refuse credential stores, `.env`, the Hermes `vault` folder and Windows device paths. `HERMES_WRITE_SAFE_ROOT` adds a hard folder fence | protected paths active; the fence is unset |
| Shell hooks | Scripts on `pre_tool_call`, `post_tool_call`, `pre_llm_call`, session start and end, `subagent_stop` and more. Same stdin and stdout JSON shape as Claude Code hooks, and exit code 2 blocks | none configured (`hermes hooks list`) |
| `fail_closed` | Makes a failed or slow `pre_tool_call` hook block the call instead of passing it | needs to be set per hook |
| Checkpoints | Shadow git store that snapshots a folder before writes and destructive commands, restored with `/rollback` | opt-in and off; the store holds 0 projects |
| `hermes backup` | Zip of the whole home, or `--quick` for config, `state.db`, `.env`, auth and cron | not scheduled; a zip holds secrets |
| `hermes cron` | Scheduler run by the gateway; `--no-agent --script` runs a plain script with no model | gateway running, no jobs |
| `hermes pause` and `resume` | Stops new cron, Kanban and gateway turns without killing running work | available |
| `hermes sessions export` | JSONL, Markdown, HTML or trace export with filters, `--redact` and `--dry-run` | works; bulk export without a filter is refused |
| `hermes import-agent claude-code` | Maps `CLAUDE.md`, `Bash(...)` permissions, MCP servers and skills into Hermes; never reads credential files | not run |
| `hermes security`, `egress`, `secrets` | OSV supply-chain audit, a credential-injection egress firewall, external secret sources | not examined |
## Findings that change the plan
- `hermes -z` auto-bypasses approvals. The 44 second test on 2026-11-26 ran that way, so any script that calls `-z` has no approval prompt. Deny rules and hooks still apply, which is why they matter more than the mode.
- Hooks need first-use consent. A gateway or scheduled run has no terminal to answer, and an unapproved hook is skipped, not run. Approve each hook once by hand with `hermes hooks test`.
- The terminal tool is Git Bash and runs as the owner. The write guards cover `write_file` and `patch` only, and the docs call them defense in depth, not a boundary. A hostile web page that steers the model could still run a shell command. Hooks, deny rules and checkpoints detect and soften that, they do not contain it.
- `gh` is authenticated through the GitHub CLI, so Hermes could push or delete repositories as the owner. Deny rules for force pushes and repository deletion belong in the first config change.
- A Firecrawl key is set in the Hermes `.env`. Web search through it is a cloud call, which conflicts with the no-cloud rule for inference. Leave the tool off, or accept it knowingly.
- `D:\Apps\Hermes\vault` is Hermes' encrypted credential store, not the Jarvis vault. Never point a tool or a note at it.
- Hermes processes hold memory at idle: five desktop-app processes and four Python processes (gateway, serve and two helpers) add up to about 1.2 GB, which counts against [[Local AI Memory Budget]].
## What was run
`hermes --version`, `hermes status`, `hermes doctor`, `hermes hooks list`, `hermes approvals test` with two commands, `hermes checkpoints status`, `hermes cron status`, `hermes config get` on eight keys, and the help for `backup`, `hooks`, `approvals`, `checkpoints`, `cron`, `import-agent`, `pause` and `sessions export`. No `.env` or `auth.json` was opened. The docs read were `security.md`, `checkpoints-and-rollback.md`, `which-file-does-what.md`, `import-from-other-agents.md`, `windows-native.md` and `features/hooks.md`.
