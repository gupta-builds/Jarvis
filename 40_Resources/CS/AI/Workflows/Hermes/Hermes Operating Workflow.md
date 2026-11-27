---
type: reference
status: seed
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - workflow
reference_kind: resource
area:
  - ai
notes:
  - "[[Hermes Agent]]"
  - "[[Hermes Local Build Log]]"
  - "[[Local AI Memory Budget]]"
  - "[[Local Model Lineup]]"
next: Re-run the speed test after the Predator mode check and record the result in the Hermes Local Build Log.
---
# Hermes Operating Workflow
How to start, check and troubleshoot Hermes on the Acer when it runs on Ollama. The vault uses it so a session does not rediscover the same failures. Read it before a session and whenever Hermes is slow or gives odd answers.
## Before a session
Run these in a terminal. None of them changes anything.
```powershell
ollama ps                                   # want PROCESSOR 100% GPU and CONTEXT 65536
mineru server status --json                 # want "running": false
(Get-Counter '\Memory\Available Bytes').CounterSamples.CookedValue/1GB   # available GiB
nvidia-smi --query-gpu=memory.used,power.draw,clocks_throttle_reasons.active --format=csv
```
==Available RAM and a stopped MinerU server decide which model lane can load.== The budget is in [[Local AI Memory Budget]]. Plug in, and set Windows power mode to Best performance, because the GPU is power-capped on Balanced.
## Starting Hermes
The desktop app and the CLI share `D:\Apps\Hermes`, so a model change in one shows in the other after a restart. The CLI is on `PATH`.
```powershell
hermes status                 # components and provider
hermes -z "one short prompt"  # one-shot, prints the answer
hermes doctor                 # config and dependency check
hermes prompt-size            # fixed prompt budget for a fresh session
```
## Choosing the model
Only one model stays loaded (`OLLAMA_MAX_LOADED_MODELS=1`), so every switch pays a load.

| Task | Model | Why |
|---|---|---|
| Coding agent work, sub-agents | `ornith-1.5:9b` | SWE-bench Verified 70.6 reported by the vendor, tool call verified, 6.9 GB at 64K |
| General chat, screenshots, audio | `gemma4:12b-it-qat` | vision and audio, tool call verified, 7.6 GB at 64K |
| Heavy or overnight work | the 35B lane | not built yet, see [[Offload Engines and PolyStrata]] |

Switch inside a session with `/model <name>`, or run `hermes model`. Cold loads measured on 2026-11-26: Ornith 9B 17 s, Gemma 12B 46 s the first time from a cold disk.
## What slows it down
Hermes sends a fixed prompt on every call: about 29.9 KB of system prompt and 41.8 KB of tool schemas for 24 tools, roughly 17,000 tokens. The first turn pays for it in prefill, and later turns reuse the cache while the stable part of the prompt does not change. Trim it with `hermes tools` and `hermes skills`, and check the effect with `hermes prompt-size`. The GPU power cap and a context mismatch are the other two causes, both in the table below.
## Failure modes seen
| Symptom | Cause | Fix |
|---|---|---|
| Answers are shallow or forget the task | Ollama's small default context | App slider at 64k, `model.ollama_num_ctx` pinned in Hermes, confirm with `ollama ps` |
| New Ollama settings have no effect | Environment variables are read at start only | Restart the Ollama app from a shell that has them, then read the "server config" line in `%LOCALAPPDATA%\Ollama\server.log` |
| VRAM overflows on load | Hermes auto-detects Gemma's 256K window and sends it as `num_ctx` | Pin `model.context_length` and `model.ollama_num_ctx` to 65536 |
| Raw tool JSON appears in the reply | Tool format not parsed | `ollama show <model>` must list `tools`, then test `/api/chat` with a tool |
| `hermes config set` removed every comment | It rewrites the file | Active settings were diffed and kept; the backup is in `D:\Apps\Hermes\backups\config` |
| Helper tasks cause pauses | A different auxiliary model forces a swap | Keep auxiliary tasks on the main model, see [[Hermes Model Routing]] |
| Docker volume not mounted from the Desktop app | Known bug in v0.21 builds, issues 61115 and 63383 | Check with `docker inspect`, update Hermes |
## Commands worth remembering
```powershell
hermes sessions list
hermes sessions export --format md --newer-than 1 D:\AI\hermes\exports   # bulk export needs a filter
hermes kanban boards
hermes profile list
hermes pause / hermes resume        # emergency stop for cron, Kanban and gateway turns
```
