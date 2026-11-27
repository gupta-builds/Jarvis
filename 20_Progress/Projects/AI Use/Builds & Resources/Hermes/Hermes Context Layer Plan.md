---
type: reference
status: seed
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - context
  - runbook
reference_kind: runbook
machine: acer
notes:
  - "[[Hermes System]]"
  - "[[Hermes Agent]]"
  - "[[Jarvis OS — North Star]]"
  - "[[00_Execution]]"
  - "[[Graphify]]"
next: Pick the memory approach (built-in only, a provider, or the vault's gbrain plan) before touching rules or MCP.
---
# Hermes Context Layer Plan
## Why This Note Exists
Hermes on a small local model is only as useful as the context it carries. This note plans how it gets the vault's rules, memory, skills and tools so it behaves like the other AI platforms here, only slower. It covers everything after the sandbox: Jarvis and The Plan as sources, memory across platforms, rules, skills and MCP tools. ==Every item costs prompt tokens on every call, so each one has to earn its bytes.== The fixed prompt today is 29.9 KB of system text and 41.8 KB of tool schemas.
## Gate
- The Docker sandbox in [[Hermes Docker Sandbox Plan]] is working, so context sources are mounted deliberately.
- `hermes prompt-size` has a baseline from a session started in the vault. A run from the vault showed a 12.4 KB context tier, consistent with the vault's rule files being loaded.
- Secrets stay out of this plan. Credentials go in `D:\Apps\Hermes\.env` or through `hermes secrets`, never copied from the Claude Code config.
## Steps
1. Rules. Hermes discovers `AGENTS.md`, then `CLAUDE.md`, from the working folder and loads the first match, so a session started in the vault already follows the Write Contract. `SOUL.md` is different: it is global, loaded from the Hermes home only, and is the agent's identity. The current file is 667 bytes. **Changes state.** Write a short Jarvis identity there and keep the vault rules in `AGENTS.md`.
2. Memory. Built-in memory is two files per profile, `MEMORY.md` (2,200 characters) and `USER.md` (1,375 characters), loaded as a frozen snapshot at session start. They do not auto-compact, and two agents on one Hermes home corrupt each other. **Changes state.** Seed `USER.md` with the short list of working preferences already in the global rules.
3. Provider decision. Beyond the two files, Hermes memory providers are now plugins (Hindsight, Honcho and others). The vault's earlier decision in [[00_Execution]] is gbrain with gstack as one memory stack, and [[Graphify]] covers the graph side. Pick one approach before installing anything.
4. Skills. Skills live in `D:\Apps\Hermes\skills` (12 bundled categories), use the same `SKILL.md` shape as the Claude skills, and load in three levels so only a short index costs tokens on every call. The index is about 5 KB today. Trim unused bundled skills with `hermes skills opt-out`. Check whether Hermes accepts an extra skills folder so the vault's `.claude/skills` can be shared without copying.
5. MCP. Servers go under `mcp_servers` in the config with `hermes mcp install`, `login` and `configure`, and a new session or `/reload-mcp` picks them up. Reuse the same Jarvis and The Plan server definitions that Claude Code uses, with an `include` list so only the tools needed enter the prompt. Test read-only tools first.
6. Writes. Decide that the agent writes into the vault only through the Jarvis MCP and only into the inbox folder or the folders `AGENTS.md` names, never by a mounted writable path.
7. Sources for retrieval. [[Graphify]] and the vault index feed GraphRAG-style answers, which the video diagrams describe as the most connected form of retrieval.
## Checkpoints
None yet. Facts above come from the Hermes docs on context files, memory, skills and MCP read on 2026-11-26, and from `hermes prompt-size`.
## Open Questions
- Which memory approach, and does it run locally with no cloud call?
- How large does the tool schema grow after Jarvis and The Plan MCP tools are added, and does it still prefill in an acceptable time?
