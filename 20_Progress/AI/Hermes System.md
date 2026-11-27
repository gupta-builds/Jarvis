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
next: Take the quick backup, then build the conversation exporter against one real session.
related_progress:
  - "[[Hermes Conversation Tracking Plan]]"
  - "[[Hermes Primed Home Plan]]"
notes:
  - "[[Hermes Map]]"
  - "[[Hermes Agent]]"
  - "[[Local Model Lineup]]"
  - "[[Agentic OS and Shared Memory Plan]]"
  - "[[Jarvis OS — North Star]]"
---
# Hermes System
## Goal
==Run Hermes Agent on this laptop as a primed, monitored workhorse on local models: it records every conversation into Jarvis, works inside a home that is guarded, backed up and under git, shares the vault's rules and tools, and logs each change it makes, so no task waits on a cloud rate limit and nothing it does goes unseen.==
## Current State
*State on 2026-11-26, after a verification pass.* Hermes v0.21.3 answers through Ollama 0.40.18 on the Acer. The settings were re-read and match the notes: provider `custom`, endpoint `http://127.0.0.1:11434/v1`, default `gemma4:12b-it-qat`, context pinned at 65536 in both `model.context_length` and `model.ollama_num_ctx`. Two models are installed and both returned correct tool calls, `gemma4:12b-it-qat` and `ornith-1.5:9b`, in `D:\AI\models\ollama` (13 GB; C: holds a 12 KB `.ollama` folder). Ollama's flash attention, q8_0 cache, 30 minute keep-alive, one loaded model and one parallel request are set as user variables, and Cloud is off in the app. Evidence and commands: [[Hermes Local Build Log]].
**Decision, 2026-11-26.** The Docker sandbox is dropped ([[Hermes Docker Sandbox Plan]], archived). The terminal backend stays `local` and the plan is a primed, monitored home on the host: [[Hermes Primed Home Plan]]. Conversation documenting moves up to the next build.
**Verified controls, unused.** Hermes ships approvals, deny rules, shell hooks, checkpoints, backup and cron. On this machine approvals are `smart`, deny rules are empty, no hooks exist, checkpoints are off with 0 projects, and nothing is scheduled ([[Hermes Control Surface]]). `hermes -z` bypasses approvals, `gh` is authenticated, and a Firecrawl key is set. The Hermes home is not under git and no backup exists.
**Speed is open.** Gemma 12B decodes at 39.6 tokens per second warm against an estimate of 60 to 66, with the GPU at 97% utilization but 51 to 68 W under a software power cap. The Predator performance mode is untested. **RAM is the other limit:** 11.5 GiB available at the last check against about 16 reachable and 18 to 22 wanted for the 35B lane, and Hermes itself holds about 1.2 GB idle ([[Local AI Memory Budget]]).
Build order:

| Phase | Work | State |
|---|---|---|
| 0 | Research, model choice, RAM and VRAM audit | done 2026-11-26 |
| 1 | Ollama and Hermes end to end | done; speed gate open |
| 2 | Conversation documenting into Jarvis | next, [[Hermes Conversation Tracking Plan]] |
| 3 | Primed home: guards, hooks ledger, git, backups, daily digest | planned, [[Hermes Primed Home Plan]] |
| 4 | Rules, memory, skills, connectors | planned, [[Hermes Context Layer Plan]] |
| 5 | Update Hermes, engine upgrade (PolyStrata or llama.cpp router), the 35B brain | planned, [[Offload Engines and PolyStrata]] |
| 6 | Agentic OS: prove the loops, then a shared memory database | planned, gated on data, [[Agentic OS and Shared Memory Plan]] |
| 7 | Profiles, Kanban, model routing | planned, [[Hermes Model Routing]] |
| 8 | Slack, computer use, saved-reel review | later |
## Next Action
Take the quick backup, then build the conversation exporter against one real session.
## Open Questions
- [ ] Which Predator mode removes the GPU power cap, and what does Gemma 12B reach there? Re-run the 900-token test in [[Hermes Local Build Log]].
- [ ] Does `hermes sessions export --redact` cover JSONL, and do the desktop app and the CLI share one session store? Answered in step 1 and 6 of the conversation plan.
- [ ] Does the ledger hook receive the tool result and duration? Test with `hermes hooks test` before writing it ([[Hermes Change Ledger Spec]]).
- [ ] Is the Firecrawl web tool kept off, and do approvals stay `manual`? Both are open in [[Hermes Primed Home Plan]].
- [ ] What are the four video URLs, so [[Hermes Video Notes]] can become proper source summaries? Deferred by the owner on 2026-11-26.
- [ ] Which memory stack serves all platforms later? Not before the loops are proven ([[Agentic OS and Shared Memory Plan]]).
- [x] Is the Ollama Cloud toggle off? Yes. The 20:24 server start on 2026-11-26 shows `OLLAMA_NO_CLOUD:true`; the user-scope variable is empty, so the setting lives in the app.
- [x] Where does the conversation capture go? `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Hermes/<project>/`, decided 2026-11-26.
## Log
- **2026-11-26:** Second research pass on the four Hermes videos, the Ollama and llama.cpp changes of the last 30 days, PolyStrata, and the RAM and VRAM budget. Locked six models and wrote this cluster of notes.
- **2026-11-26:** Restarted Ollama so its five new settings applied, pointed Hermes at it, pulled and tested two models, and measured speed and GPU power behavior.
- **2026-11-26:** Decisions: Docker dropped, conversation capture moved up, folder fixed, Registry and Standards widened to cover `Builds & Resources` and `20_Progress/AI` project notes. Verification pass read the live Hermes controls and corrected this note's claims. Added [[Hermes Control Surface]], [[Hermes Primed Home Plan]], [[Hermes Change Ledger Spec]] and [[Agentic OS and Shared Memory Plan]].
