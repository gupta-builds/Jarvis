---
type: project
status: active
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - monitoring
project_kind: plan
next: Take the quick backup, then put D:\Apps\Hermes under git with the allowlist in step 2.
related_progress:
  - "[[Hermes System]]"
notes:
  - "[[Hermes Control Surface]]"
  - "[[Hermes Change Ledger Spec]]"
  - "[[Hermes Conversation Tracking Plan]]"
  - "[[Hermes Context Layer Plan]]"
  - "[[Agentic OS and Shared Memory Plan]]"
  - "[[Hermes Docker Sandbox Plan]]"
---
# Hermes Primed Home Plan
## Goal
==Hermes works directly on this laptop, in a home folder that is guarded, backed up, under git and connected to the vault, and every change it makes lands in a daily record, so nothing is overdone, nothing is missed and any change can be undone.== It is a monitored environment in the way Claude Code is one: hooks write the trail, scheduled tasks keep the safety copies, and a daily review compares what happened with what should have.
## Decisions
*2026-11-26.* The Docker sandbox is dropped. A container means an image to maintain, mounts to keep correct (the desktop app ignored `docker_volumes` in two issues) and settings duplicated inside it, and the agent still could not touch the vault, which is the point of giving it a job. The replacement is five controls, all native to Hermes ([[Hermes Control Surface]]): stop with approvals and deny rules, see with hook records, undo with checkpoints, git and backups, scope with the working folder and a short connector list, and review with a daily digest.
==The cost is isolation.== Hermes runs as the owner through Git Bash, and the controls detect and soften a bad action without containing it. Two rules follow. Never run a session that browses untrusted pages and holds the terminal tool at the same time until the hooks are verified. If one job class needs real containment later (running downloaded code), the archived Docker plan is the fallback for that class only.
## Sequence
Before step 1, confirm: `hermes status` shows the gateway running; Ollama answers on port 11434; `D:\AI\hermes` is not inside a Syncthing folder or a git work tree, because a backup zip holds secrets; and no Hermes session is mid-run.
1. **Changes state.** Quick backup: `hermes backup --quick --label pre-prime -o D:\AI\hermes\backups`. Done when the zip exists. Never open it.
2. **Changes state.** Put `D:\Apps\Hermes` under git, local only, with an allowlist `.gitignore`: ignore everything, then allow `.gitignore`, `config.yaml`, `SOUL.md`, `memories\*.md`, `agent-hooks`, `scripts`, and your own skill folders (the bundled ones change with every `hermes update`). Done when `git ls-files` lists only those paths and `git check-ignore -v .env auth.json state.db` ignores all three. Add a pre-commit scan that refuses a staged line holding a long value after `key`, `token`, `secret` or `password`.
3. **Changes state.** Guardrails. Back up `config.yaml`, then set `approvals.mode` to `manual` for the first 14 days (the local model is a weak judge), `approvals.deny` to a short list (force push, repository delete, recursive delete outside the working folder, registry and scheduled-task removal), and `checkpoints.enabled` to true. Check each deny pattern with `hermes approvals test`. Done when five sample commands return the expected verdict and a test write creates a project in `hermes checkpoints`.
4. **Changes state.** Ledger hook: `agent-hooks\ledger.mjs` on `post_tool_call`, plus one `pre_tool_call` guard with `fail_closed: true` that blocks writes to `50_Archive`, `.obsidian`, `.git` and the vault root. Approve each hook once by hand, then run `hermes hooks doctor`. Done when a test tool call adds exactly one line to the day's file ([[Hermes Change Ledger Spec]]) and a write to `50_Archive` is blocked.
5. **Changes state.** Four Windows scheduled tasks, built like the existing capture tasks: a daily quick backup, a weekly full backup with `-k 3`, a daily commit of the Hermes home that skips when nothing changed, and a nightly ledger digest. Done when each shows result 0 on two consecutive days.
6. First daily review. Read the digest against the expected and ceiling table in the ledger spec. Done when one real day has been reviewed and the thresholds adjusted from data.
7. Only then update Hermes from v0.21.3. The backup and git history are the rollback path, and the exporter and hook tests get re-run afterward because v0.22 and v0.23 changed sessions, retention and the gateway.
*Out of scope this round:* the vault rules, memory, skills and connectors, which are [[Hermes Context Layer Plan]], and any shared database, which is [[Agentic OS and Shared Memory Plan]].
## Open Questions
- [ ] Should `approvals.mode` stay `manual` for good, or move to `smart` once a stronger model is the judge?
- [ ] Is the Firecrawl web tool kept off, given that it sends queries to a cloud service?
- [ ] Do hooks fire for the desktop app on v0.21.3 exactly as for the CLI? The docs say yes; test both.
- [ ] Where do the hook and exporter scripts live long term: the Hermes home (tracked by its own git, chosen for now) or a vault system folder, which would need its own component note in `30_Order`?
