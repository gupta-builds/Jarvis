---
type: project
status: active
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - local-ai
project_kind: project
next: Set up the Docker terminal backend with one scoped workspace mount and prove the mount with docker inspect.
related_progress:
  - "[[Hermes Docker Sandbox Plan]]"
notes:
  - "[[Hermes Map]]"
  - "[[Hermes Agent]]"
  - "[[Local Model Lineup]]"
  - "[[Jarvis OS — North Star]]"
---
# Hermes System
## Goal
==Run Hermes Agent on this laptop as a local, Docker-sandboxed assistant that records every conversation into Jarvis, shares the vault's context, rules and tools, and works on local models so no task waits on a cloud rate limit.==
## Current State
*State on 2026-11-26.* Hermes v0.21.3 answers through Ollama on the Acer. A one-shot message through `hermes -z` came back in 44 seconds, including a model swap. Ollama runs with flash attention, a q8_0 KV cache, a 30 minute keep-alive, one loaded model, one parallel request and a 65536 context. Two models are installed and both return correct tool calls: `gemma4:12b-it-qat` and `ornith-1.5:9b`. Evidence and exact commands are in [[Hermes Local Build Log]].
**Speed is the open problem.** Gemma 12B decodes at 39.6 tokens per second warm, against an estimate of 60 to 66. The GPU sat at 97% utilization but 51 to 68 W, with the driver reporting a software power cap, not heat. Whether the Predator performance mode lifts that cap is untested.
**RAM is the second constraint.** Available memory is 9.6 GiB with Obsidian and VS Code open, against about 16 GiB reachable and 18 to 22 GiB wanted for the 35B lane ([[Local AI Memory Budget]]). A session prompt to fix it is written and has not run.
Build order:

| Phase | Work | State |
|---|---|---|
| 0 | Research, model choice, RAM and VRAM audit | done 2026-11-26 |
| 1 | Ollama and Hermes end to end | done; speed gate open |
| 2 | Docker sandbox for code execution | next, [[Hermes Docker Sandbox Plan]] |
| 3 | Conversation tracking into Jarvis | planned, [[Hermes Conversation Tracking Plan]] |
| 4 | Jarvis, The Plan and MCP context | planned, [[Hermes Context Layer Plan]] |
| 5 | Memory, rules and skills shared across platforms | planned, provider decision open |
| 6 | Engine upgrade: PolyStrata or llama.cpp router, the 35B brain | planned, [[Offload Engines and PolyStrata]] |
| 7 | Profiles, Kanban, model routing | planned, [[Hermes Model Routing]] |
| 8 | Slack, computer use, saved-reel review | later |

## Next Action
Set up the Docker terminal backend with one scoped workspace mount and prove the mount with docker inspect.
## Open Questions
- [ ] Which Predator mode removes the GPU power cap, and what does Gemma 12B reach there? Re-run the 900-token test in [[Hermes Local Build Log]].
- [ ] Update Hermes from v0.21.3 to the current stable tag before the Docker phase? The Desktop docker-volumes bug and the one-gateway session store both changed after v0.21.
- [ ] Which memory provider, if any, goes beyond the built-in two files: Hindsight, Honcho, the vault's gbrain plan, or none?
- [x] Is the Ollama Cloud toggle off? Yes. The 20:24 server start on 2026-11-26 shows `OLLAMA_NO_CLOUD:true`.
- [ ] What are the four video URLs, so [[Hermes Video Notes]] can become proper source summaries?
- [ ] Does Hermes read extra skill folders, so the vault's `.claude/skills` can be shared without copying?
## Log
- **2026-11-26:** Second research pass on the four Hermes videos, the Ollama and llama.cpp changes of the last 30 days, PolyStrata, and the RAM and VRAM budget. Locked six models and wrote this cluster of notes.
- **2026-11-26:** Restarted Ollama so its five new settings applied, pointed Hermes at it, pulled and tested two models, and measured speed and GPU power behavior.
