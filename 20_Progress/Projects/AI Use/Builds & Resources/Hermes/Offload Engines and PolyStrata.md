---
type: reference
status: sprout
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - local-ai
  - inference
  - research
reference_kind: research
area:
  - ai
notes:
  - "[[Hermes Map]]"
  - "[[Local Model Lineup]]"
  - "[[airllm]]"
  - "[[llmfit]]"
  - "[[Hermes Local Build Log]]"
next: Clone PolyStrata into an isolated folder under D:\AI, read AI_SETUP.md and the install scripts, and only then run anything.
---
# Offload Engines and PolyStrata
What actually lets a 12 GB laptop run models larger than its VRAM at usable speed, and which tool to trust with it. The vault uses it to choose the engine for the 35B and 27B lanes. Read it before installing an inference engine or when a large model is slow.
## Why AirLLM dropped out
==AirLLM answers "can a 70B model run" and not "how fast".== It streams every layer from disk to the GPU for each token, so it suits offline batch jobs from Python. The vault's [[airllm]] card already called it conditional and never a chat tool. Its core code was last updated in September 2024. For the 40 to 60 tokens per second goal it is the wrong mechanism.
*What works instead:* for a mixture-of-experts model, keep attention and shared weights on the GPU and leave the experts in RAM, because only about 3B of the parameters fire per token. A dense 70B cannot use this trick. At about 43 GB for Q4 and 92 to 99 GB/s of RAM bandwidth it reads 2 to 5 tokens per second, so no tool makes it easy.
## What runs mixture-of-experts models
| Tool | What it does | Limit |
|---|---|---|
| llama.cpp `--n-cpu-moe N` | Keeps the experts of the first N layers in RAM, the rest on the GPU. On 12 GB cards about N=25 to 27 for a 40-layer 35B model | Hand tuning. `--fit on --fit-ctx 65536 --fit-target 512` picks N automatically, and bare `--fit on` silently drops context to 4K |
| llama.cpp MTP | Multi-token prediction drafts several tokens and verifies them in one pass. Reported 33 to 72% faster decode in November 2026 tests | Needs the model's MTP head file and `llama-server`. Ollama had no official MTP support as of 2026-11-17 |
| llama.cpp router mode | One `llama-server` loads and unloads models on demand with `--models-dir` and `--models-max` | The cap counts models, not memory, so set it to 1 on this card |
| llama-swap | A YAML file starts and stops model servers, with groups, idle timers, metrics and other engines | You write and maintain the rules |
| Hermes Local Models | The desktop app installs and manages llama.cpp, rates models against the hardware, guarantees 64K context, and spills expert weights first | Part of Hermes v0.22 and later, newer than the installed v0.21.3 |
| Ollama | Convenient, tool calling and vision flags per library tag | No expert-offload knob, no MTP, reported slower than llama.cpp on Qwen3.6-35B |
Ollama is the right engine for the 12B and 9B models that fit in VRAM. It is the wrong one for the 35B lane.
## PolyStrata
PolyStrata is an MIT-licensed engine built on the Strata project that keeps a model's experts in RAM, caches the hot ones in VRAM, and swaps installed models while the server runs. It reads the same GGUF files as llama.cpp and serves OpenAI and Anthropic APIs on localhost, so Hermes and Claude Code can use it. Created 2026-10-06, about 1,600 stars, one maintainer, last push 2026-11-25.
*Evidence:* on the vendor's RTX 4070 Laptop (8 GB, 32 GB RAM) Ornith 1.5 writes 59 to 86 tokens per second, Qwen3.6-35B-A3B 94 to 100 at Q3 and Gemma 4 26B-A4B 85 to 93. A user on an RTX 4070 SUPER 12 GB reports 140 tokens per second in a short chat against about 77 for llama.cpp, and a user with the same Core Ultra 9 275HX on an RTX 5060 8 GB reports roughly 20% faster than before. Its docs say output matched llama.cpp token for token on the main model.
*Caveats:* setup adds `--tail-skip 6`, which skips a few low-ranked experts and shifts answers slightly. `STRATA_ROUTE_TAIL_SKIP=0` turns it off at some cost in speed. Thirteen of its fourteen models run on engines it calls experimental. The installer downloads prebuilt engine binaries checked against SHA pins that the project attests itself. Its draft or MTP "guesses" inflate speed on predictable text, so agent-session numbers run lower than short-chat numbers.
*Install facts:* `START-HERE.bat`, with `--data-dir` for where the 70 to 120 GB of files go and `--gguf-dir` to use GGUFs already on disk. It needs an NVIDIA driver 580 or newer for the default CUDA 13 engine and creates a private Python 3.12 environment. The per-model config is `strata-<model>.json`, and `--ram-experts-mib 6144` caps its RAM at some speed cost.
## Next
Treat it as untrusted code until read. Clone it into an isolated folder under `D:\AI`, read `docs/AI_SETUP.md`, the installer and the engine download logic, then run one model with a small file and the RAM cap before relying on it. Benchmark Ornith 35B and Qwen3.6-35B on it against a plain `llama-server --n-cpu-moe` run, with the 900-token test from [[Hermes Local Build Log]]. If it fails the gate, the router mode plus MTP path covers the same lanes. The model choices are in [[Local Model Lineup]].
