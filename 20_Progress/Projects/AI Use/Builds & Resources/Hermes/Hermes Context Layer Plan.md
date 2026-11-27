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
next: Pick the memory approach (built-in only, a provider, or the vault's gbrain plan) before touching rules or MCP.
related_progress:
  - "[[Hermes System]]"
notes:
  - "[[Hermes Agent]]"
  - "[[Jarvis OS — North Star]]"
  - "[[00_Execution]]"
  - "[[Graphify]]"
---
# Hermes Context Layer Plan
## Goal
==Hermes carries the vault's rules, memory, skills and tools so it behaves like the other AI platforms here, only slower, and every item earns its bytes because each one is paid for on every call.== The fixed prompt today is 29.9 KB of system text and 41.8 KB of tool schemas. This plan covers everything after the sandbox: Jarvis and The Plan as sources, memory across platforms, rules, skills and MCP tools.
## Sequence
Before step 1, confirm that the sandbox in [[Hermes Docker Sandbox Plan]] works, so context sources are mounted deliberately; that `hermes prompt-size` has a baseline from a session started in the vault (a run from the vault showed a 12.4 KB context tier, consistent with the vault's rule files being loaded); and that credentials go in `D:\Apps\Hermes\.env` or through `hermes secrets`, never copied from the Claude Code config.
1. Rules. Hermes discovers `AGENTS.md`, then `CLAUDE.md`, from the working folder and loads the first match, so a session started in the vault already follows the Write Contract. `SOUL.md` is different: it is global, loaded from the Hermes home only, and is the agent's identity. The current file is 667 bytes. **Changes state.** Write a short Jarvis identity there and keep the vault rules in `AGENTS.md`. Done when `hermes prompt-size` shows both loaded and the prompt grew by the expected amount.
2. Memory. Built-in memory is two files per profile, `MEMORY.md` (2,200 characters) and `USER.md` (1,375 characters), loaded as a frozen snapshot at session start. They do not auto-compact, and two agents on one Hermes home corrupt each other. **Changes state.** Seed `USER.md` with the short list of working preferences already in the global rules. Done when a new session recalls one preference unprompted.
3. Provider decision. Beyond the two files, Hermes memory providers are plugins (Hindsight, Honcho and others). The vault's earlier decision in [[00_Execution]] is gbrain with gstack as one memory stack, and [[Graphify]] covers the graph side. Done when one approach is chosen in writing.
4. Skills. Skills live in `D:\Apps\Hermes\skills` (12 bundled categories), use the same `SKILL.md` shape as the Claude skills, and load in three levels so only a short index costs tokens on every call. The index is about 5 KB today. **Changes state.** Trim unused bundled skills with `hermes skills opt-out`, and check whether Hermes accepts an extra skills folder so the vault's `.claude/skills` can be shared without copying. Done when the index shrinks and one vault skill runs in Hermes.
5. MCP. Servers go under `mcp_servers` in the config with `hermes mcp install`, `login` and `configure`, and a new session or `/reload-mcp` picks them up. **Changes state.** Reuse the same Jarvis and The Plan server definitions that Claude Code uses, with an `include` list so only the tools needed enter the prompt. Done when a read-only tool call succeeds and the new tool-schema size is recorded.
6. Writes. Decide that the agent writes into the vault only through the Jarvis MCP and only into the inbox folder or the folders `AGENTS.md` names, never by a mounted writable path. Done when the rule is in `AGENTS.md`.
7. Retrieval. [[Graphify]] and the vault index feed GraphRAG-style answers, which the video diagrams describe as the most connected form of retrieval. Done when one question is answered from the graph with its sources.
*Out of scope this round:* cross-platform memory beyond the chosen approach, and any Slack or computer-use workflow.
## Open Questions
- [ ] Which memory approach, and does it run locally with no cloud call?
- [ ] How large does the tool schema grow after Jarvis and The Plan MCP tools are added, and does the first turn still prefill in an acceptable time?
- [ ] Is it safe to let the same `AGENTS.md` serve Claude Code and Hermes when Claude-specific rules sit in `CLAUDE.md`?
