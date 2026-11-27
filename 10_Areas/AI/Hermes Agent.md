---
type: reference
status: sprout
created: 2026-11-26
updated: 2026-11-26
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
next: Set up the Docker terminal backend so the agent runs code in a sandbox that sees only one mounted folder.
---
# Hermes Agent
Hermes Agent is the agent framework from Nous Research, and on this laptop it runs against local models so conversations and file access never leave the machine. The vault uses it as the always-available, rate-limit-free counterpart to [[Claude Code]]: less capable, never throttled. Read this note to learn what is installed, what each part is for, and where the build notes live.
## What it is here
==Hermes here means the NousResearch `hermes-agent` software, not zachdoesai's "agent as a junior operator" framing.== The vault used the name for both, and [[Hermes Agent Framework — Corrected Framing|Corrected Framing]] separates them and carries a 2026-11-26 correction now that the software is installed. It is one Python agent loop with a desktop app and a CLI on top. Around the loop sit tools, skills that load on demand, two small memory files (agent notes and a user profile), a SQLite session store, and a gateway for Telegram, Discord and Slack.
## Installed state on the Acer, 2026-11-26
| Part | State |
|---|---|
| Version | v0.21.3 (2026.9.14), git install. v0.23.1 was the latest tag on 2026-11-12. |
| Home | `D:\Apps\Hermes` (`HERMES_HOME`), program in `hermes-agent` below it, desktop app data in `%APPDATA%\Hermes` (5 MB) |
| Model | provider `custom`, endpoint `http://127.0.0.1:11434/v1`, default `gemma4:12b-it-qat`, context pinned at 65536 |
| Inference | Ollama 0.40.18, models in `D:\AI\models\ollama` (12.8 GB, two models), see [[Ollama]] |
| Terminal backend | `local`. The Docker sandbox is the next build: [[Hermes Docker Sandbox Plan]] |
| Sessions | local SQLite store, first session recorded 2026-11-26. Capture into Jarvis is not wired: [[Hermes Conversation Tracking Plan]] |
## What it is for and what it is not
Use Hermes for private conversations, long jobs that can run unattended (Kanban, cron), fast sub-agents, and any task where a cloud rate limit or cloud privacy is the problem. Do not use it for vault writes that depend on the Write Contract hooks, which live in Claude Code, and do not expect frontier reasoning from a 9B or 12B model.
*Contrast:* [[Claude Code]] stays the implementation surface and the other tools keep their roles. Hermes adds a fourth lane that works offline and costs only electricity. The plan is for it to share the vault's rules, memory and MCP tools so it behaves like the other platforms, only slower.
## Standing rules
- Hermes reads `AGENTS.md`, then `CLAUDE.md`, from its working folder. A session started in the vault therefore sees the vault's write contract ([[Hermes Context Layer Plan]]).
- Never mount the whole vault or the home folder into the sandbox. Mount one scoped folder.
- Never read or copy `D:\Apps\Hermes\.env` or `auth.json`. Credentials go through `hermes secrets`.
- One agent per Hermes home. A second agent gets its own profile, or its memory files get written by two processes.
## Where the build notes live
[[Hermes Map]] lists every note in the cluster. [[Hermes System]] holds the build order and current status. The exact commands and measurements are in [[Hermes Local Build Log]], the model choices in [[Local Model Lineup]], and the RAM audit that limits everything in [[Local AI Memory Budget]].
