---
type: project
status: active
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - context
project_kind: plan
next: Run hermes import-agent claude-code --dry-run yourself, read the preview, and decide which items to take.
related_progress:
  - "[[Hermes System]]"
notes:
  - "[[Hermes Agent]]"
  - "[[Hermes Primed Home Plan]]"
  - "[[Agentic OS and Shared Memory Plan]]"
  - "[[Jarvis OS — North Star]]"
  - "[[00_Execution]]"
  - "[[Graphify]]"
---
# Hermes Context Layer Plan
## Goal
==Hermes carries the vault's rules, memory, skills and connectors so it behaves like the other AI platforms here, only slower, and every item earns its bytes because each one is paid for on every call.== The fixed prompt today is 29.9 KB of system text and 41.8 KB of tool schemas. This plan covers what goes into the primed home after the guards exist: rules, memory, skills and connectors to Jarvis and The Plan.
## Decisions
*2026-11-26.* Without a container nothing is fenced by mounts, so context is fenced by tool choice. Hermes writes to the vault only through the Jarvis connector, and only into the inbox folder or the folders `AGENTS.md` names. The shared memory database is not built here; that waits for the data in [[Agentic OS and Shared Memory Plan]], and Hermes keeps its two built-in memory files meanwhile.
## Sequence
Before step 1: steps 1 to 5 of [[Hermes Primed Home Plan]] are done, so every connector added below is already watched and every change can be undone. Credentials go in `D:\Apps\Hermes\.env` or through `hermes secrets`, never copied from the Claude Code config.
1. **Changes state.** Rules. Hermes loads `SOUL.md` from its home as the agent's identity (slot one of the prompt, now 667 bytes of default Nous persona), and loads the first of `.hermes.md`, `AGENTS.md`, `CLAUDE.md`, `.cursorrules` from the working folder. A session started in the vault therefore reads the vault's `AGENTS.md` already. Replace `SOUL.md` with a short Jarvis identity of about 2 KB: voice, the secrets rule, no writes outside the ask, no em dashes. Done when `hermes prompt-size` shows both loaded and the growth matches the byte counts.
2. Import preview. `hermes import-agent claude-code --dry-run` shows what it would map: global `CLAUDE.md` into memory entries (capped at 2,200 characters, which the long global file will overflow), `Bash(...)` allow and deny rules into the allowlist and `approvals.deny`, skills into `skills\claude-code-imports`, and MCP servers with secret-looking values stripped and listed. Run it yourself, because it reads the Claude folder. Done when the preview is reviewed and the items to take are chosen. If it cannot take items one by one, try it in a scratch profile first.
3. **Changes state.** Memory. The built-in files are `MEMORY.md` (2,200 characters) and `USER.md` (1,375), written by the agent and loaded as a frozen snapshot at session start. Set `memory.write_approval` to true so each save is reviewed, and seed the profile with the short list of working preferences. Done when a new session recalls one preference unprompted and a save asks first.
4. **Changes state.** Skills. They live in `D:\Apps\Hermes\skills` (12 bundled groups), use the same `SKILL.md` shape as the Claude skills, and load in three levels so only a short index costs tokens each call. Trim unused bundled skills with `hermes skills`, check `hermes curator status` and pause background skill rewriting until the ledger is running, and look at `hermes sync` for moving skills between laptops. Done when the index shrinks and one vault skill runs in Hermes.
5. **Changes state.** Connectors, in tiers. Tier one, read only: the Jarvis search, read and list tools. Tier two, write to the inbox folder only. Tier three, a browser, stays off because it feeds untrusted pages to a model that holds a shell. The Plan holds personal-life notes and is added only if a task needs it, read only. Add servers with `hermes mcp install` and `configure`, an `include` list so only needed tools enter the prompt, and `/reload-mcp`. Done when one read-only call succeeds and the new tool-schema size is recorded next to the 41.8 KB baseline.
6. Write rule. State in `AGENTS.md` that the agent writes into the vault only through the Jarvis connector, into `60_Claude/00_Inbox/` or the folders named there. Done when the rule is in the file and a test write elsewhere is refused by the guard hook.
7. Retrieval. [[Graphify]] and the vault index feed graph-style answers, which the video diagrams describe as the most connected form of retrieval. Done when one question is answered from the graph with its sources.
*Out of scope this round:* cross-platform memory beyond the built-in files, and any Slack or computer-use workflow.
## Open Questions
- [ ] How large does the tool schema grow once the Jarvis tools are added, and does the first turn still prefill in an acceptable time at 64K context?
- [ ] Is it safe for one `AGENTS.md` to serve Claude Code and Hermes when the Claude-specific rules sit in `CLAUDE.md`, which Hermes never loads once `AGENTS.md` matches?
- [ ] Which Hermes tools can be switched off entirely (`hermes tools`) to cut the schema, given that 24 are loaded?
