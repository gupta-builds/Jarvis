---
type: reference
status: sprout
created: 2026-11-26
updated: 2026-11-26
reviewed: 2026-11-26
tags:
  - ai
  - hermes
  - local-ai
reference_kind: tool-profile
area:
  - ai
notes:
  - "[[Hermes Map]]"
  - "[[Hermes System]]"
  - "[[Claude Code]]"
  - "[[Jarvis OS — North Star]]"
next: Build the conversation exporter, then the primed home with guards, hooks, git and backups.
---
# Hermes Agent
Hermes Agent is the agent framework from Nous Research, and on this laptop it runs against local models so conversations and file access never leave the machine. The vault uses it as the always-available, rate-limit-free counterpart to [[Claude Code]]: less capable, never throttled. Read this note to learn what is installed, what each part is for, and where the build notes live.
## What it is here
==Hermes here means the NousResearch `hermes-agent` software, not zachdoesai's "agent as a junior operator" framing.== The vault used the name for both, and [[Hermes Agent Framework — Corrected Framing|Corrected Framing]] separates them and carries a 2026-11-26 correction now that the software is installed. It is one Python agent loop with a desktop app and a CLI on top. Around the loop sit tools, skills that load on demand, two small memory files (agent notes and a user profile), a SQLite session store, and a gateway for Telegram, Discord and Slack.
## Installed state on the Acer, 2026-11-26
| Part | State |
|---|---|
| Version | v0.21.3 (2026.9.14), git install. v0.23.1 was the latest tag on 2026-11-12. |
| Home | `D:\Apps\Hermes` (`HERMES_HOME`), program in `hermes-agent` below it, desktop app data in `%APPDATA%\Hermes`. Idle, the app and gateway hold about 1.2 GB of RAM |
| Model | provider `custom`, endpoint `http://127.0.0.1:11434/v1`, default `gemma4:12b-it-qat`, context pinned at 65536 |
| Inference | Ollama 0.40.18, models in `D:\AI\models\ollama` (12.8 GB, two models), see [[Ollama]] |
| Terminal backend | `local`, through Git Bash as the owner. The Docker sandbox was dropped on 2026-11-26 ([[Hermes Docker Sandbox Plan]], archived) for a monitored home: [[Hermes Primed Home Plan]] |
| Controls | approvals `smart`, no deny rules, no hooks, checkpoints off, nothing scheduled, no backup, home not under git. All available and unused: [[Hermes Control Surface]] |
| Sessions | local SQLite store, 2 sessions and 4 messages on 2026-11-26. Capture into Jarvis is the next build: [[Hermes Conversation Tracking Plan]], folder `AI Conversations/Acer/Windows/Hermes/` |
## What it is for and what it is not
Use Hermes for private conversations, long jobs that can run unattended (Kanban, cron), fast sub-agents, and any task where a cloud rate limit or cloud privacy is the problem. Do not use it for vault writes that depend on the Write Contract hooks, which live in Claude Code, and do not expect frontier reasoning from a 9B or 12B model.
*Contrast:* [[Claude Code]] stays the implementation surface and the other tools keep their roles. Hermes adds a fourth lane that works offline and costs only electricity. The plan is for it to share the vault's rules, memory and MCP tools so it behaves like the other platforms, only slower, as one platform in the agentic OS described in [[Agentic OS and Shared Memory Plan]].
## Standing rules
- Hermes reads `AGENTS.md`, then `CLAUDE.md`, from its working folder. A session started in the vault therefore sees the vault's write contract ([[Hermes Context Layer Plan]]).
- Hermes runs as the owner with no container, so every session is watched: approvals on, deny rules for force pushes and deletes, checkpoints on, and a daily change record ([[Hermes Change Ledger Spec]]). Do not run a session that browses untrusted pages and holds the terminal at once.
- `hermes -z` skips approvals. Use it for read-only questions only.
- Never read or copy `D:\Apps\Hermes\.env` or `auth.json`. Credentials go through `hermes secrets`. `D:\Apps\Hermes\vault` is Hermes' credential store, not the Jarvis vault.
- Hermes writes into the vault only through the Jarvis connector, into the inbox folder or the folders `AGENTS.md` names ([[Hermes Context Layer Plan]]).
- One agent per Hermes home. A second agent gets its own profile, or its memory files get written by two processes.
## Where the build notes live
[[Hermes Map]] lists every note in the cluster. [[Hermes System]] holds the build order and current status. The exact commands and measurements are in [[Hermes Local Build Log]], the model choices in [[Local Model Lineup]], and the RAM audit that limits everything in [[Local AI Memory Budget]].
