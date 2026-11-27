---
type: reference
status: sprout
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - local-ai
  - models
  - research
reference_kind: research
area:
  - ai
notes:
  - "[[Hermes Map]]"
  - "[[Hermes Local Build Log]]"
  - "[[Local AI Memory Budget]]"
  - "[[Offload Engines and PolyStrata]]"
  - "[[llmfit]]"
next: Download the 35B and Qwen3.8 files to D:\AI\models\gguf after the RAM session, then run the speed gate on each.
---
# Local Model Lineup
The six models chosen for this laptop on 2026-11-26, why each earned its slot, and the arithmetic that decides what fits in 11.94 GiB of VRAM. The vault uses it to pick a lane and to download the right file. Read it before pulling a model or replacing one.
## The decision
==Three daily models and one fallback for each, chosen around the 12 GB GPU first and RAM second.== The 12B and 9B models live entirely in VRAM and need 2 to 3 GiB of RAM, so they run while Obsidian, VS Code and Playwright are open. The 35B and 27B lanes need RAM that the machine only has after the cleanup in [[Local AI Memory Budget]].

| Slot | Model and file | Role | Reported evidence |
|---|---|---|---|
| Daily 1 | Ornith-1.5-35B-A3B, PolyStrata APEX-I-MINI (17 GB) | Hermes brain, Kanban workers | SWE-bench Verified 79.0, Terminal-Bench 2.1 68.5, MCP-Atlas 70.2 |
| Daily 2 | Ornith-1.5-9B, library tag `ornith-1.5:9b` (Q4_K_M, 6.6 GB) | coding agent that fits VRAM | SWE-bench Verified 70.6, Terminal-Bench 2.1 47.0, Toolathlon 41.2 |
| Daily 3 | Gemma 4 12B QAT Q4_0, `gemma4:12b-it-qat` (7.2 GB) | vision, audio, general chat | Tau2 69.0, LiveCodeBench v6 72.0 |
| Fallback 1 | Qwen3.6-35B-A3B UD-Q3_K_M (16.6 GB), plain llama.cpp | covers Daily 1 on a different engine | SWE-bench Verified 73.4 |
| Fallback 2 | Mellum2.1-12B-A2.5B Instruct Q4_K_M (8.07 GB) plus MTP head | covers Daily 2, different vendor | SWE-bench Verified 40.4, 2.5B active, built for sub-agents |
| Fallback 3 | Qwen3.8-27B UD-Q3_K_XL (13.15 GB) plus MTP head (1.37 GB) | covers Daily 3 and the deep overnight lane | Terminal-Bench 2.1 73.0, SWE-bench Pro 61.7 |
Every number is vendor-reported on the vendor's own harness. No independent head-to-head exists. Ornith's results were averaged over five runs with the git history removed, and it still trails Muse-Glimmer-30B on MCP-Atlas (75.5).
*Who trained what:* Ornith 1.5 continues pretraining and uses reinforcement learning on tasks, scaffolds and rollouts the model generates for itself, on a Qwen3.5 base. Gemma 4 is Google DeepMind's, trained on web text in more than 140 languages, code, images and audio. Mellum2.1 is JetBrains', post-trained with reinforcement learning on repository tasks in sandboxes where only passing hidden tests earn reward. Qwen3.8-27B is Alibaba's dense model with a vision encoder and a multi-token-prediction head.
*Swap rule:* if Qwen3.8-27B cannot hold 15 tokens per second at 32K context, replace it with Groot-19B-A3B Q4_K_M (Apache 2.0, multimodal, reported ahead of Qwen3.6-35B on 12 of 16 benchmarks). It is a young, less proven publisher, so it gets its own checks first.
## How the VRAM budget is computed
VRAM needed = weights on the GPU + KV cache + about 0.8 GiB of compute buffers + the vision file. The KV cache is full-attention layers x 2 x KV heads x head size x context x bytes per value. Sliding-window layers count only their window, and linear-attention layers hold a small fixed state. [[llmfit]] gets this wrong: it treats every layer as full attention, so it rated Gemma 12B at 31 GB for 64K context when the real figure is about 8.4 GiB.

| Model | Full-attention layers | KV at 64K, fp16 | q8_0 | Measured or estimated total |
|---|---|---|---|---|
| Gemma 4 12B | 8 of 48, one KV head of size 512, plus 40 sliding layers of 1024 tokens | 1.41 GB | about 0.75 | 7.6 GB in `ollama ps`, 8,212 MiB on the card (measured) |
| Ornith-1.5-9B | 8 of 32, 4 KV heads of 256 | 2.15 GB | about 1.14 | 6.9 GB in `ollama ps` (measured) |
| Mellum2.1-12B-A2.5B | 7 of 28, 4 KV heads of 128, plus 21 sliding | 0.94 GB | about 0.5 | about 9.3 GiB (estimate) |
| Qwen3.6-35B-A3B, Ornith 35B, Groot | 10 of 40, 2 KV heads of 256 | 1.34 GB | about 0.71 | weights spill to RAM |
| Qwen3.8-27B | 16 of 64, 4 KV heads of 256 | 4.29 GB | about 2.3 | about 16 GiB, so about 4 GiB spills |
The card has 11.94 GiB free because the display runs on the Intel iGPU. Two of these models cannot sit in VRAM together, so every lane switch is a load. Dense decode speed is roughly the bytes read per token over the memory bandwidth. A dense 27B with 4 GiB in system RAM reads about 5 GB at 92 GB/s each token, which is why Qwen3.8-27B is estimated at 13 to 21 tokens per second and the MoE models are not.
## Speed reality on this machine
Estimates came from other people's cards: Gemma 12B 85 to 90 on a 3080 Ti, so 60 to 66 expected here. The measured warm figure is 39.6 tokens per second because the GPU runs under a software power cap of 54 to 65 W ([[Hermes Local Build Log]]). Treat every estimate above as a ceiling until the power mode is sorted and each model has passed the gate below.
## Files and where they go
`D:\AI\models\ollama` is Ollama's own store (hashed blobs, 12.8 GB today). `D:\AI\models\gguf` is for plain GGUF files that PolyStrata and llama.cpp read in place. Do not import the Ollama models into the GGUF folder or the reverse, because Ollama copies imports.

| Model | Source |
|---|---|
| Ornith 9B, Gemma 12B | `ollama pull` (done) |
| Ornith 35B | PolyStrata APEX-I-MINI, or `ornith-ai/Ornith-1.5-35B-A3B-GGUF` Q4_K_M (21.71 GB) plus `mmproj` (0.9 GB) |
| Qwen3.6-35B-A3B | `unsloth/Qwen3.6-35B-A3B-GGUF`, `UD-Q3_K_M` (16.6 GB) or `UD-Q4_K_M` (22.13 GB) |
| Mellum2.1 Instruct | `JetBrains/Mellum2.1-12B-A2.5B-Instruct-GGUF`, `Q4_K_M` (8.07 GB), plus the MTP file |
| Qwen3.8-27B | `unsloth/Qwen3.8-27B-GGUF`, `UD-Q3_K_XL` (13.15 GB) and `MTP/mtp-Qwen3.8-27B-Q4_0.gguf` (1.37 GB) |
Set `LLAMA_CACHE` and `HF_HOME` to D: so no download lands on C:.
## Rejected, and why
- Gemma 4 E4B and 26B-A4B: the vault now holds one Gemma. The 26B stays a candidate only if Groot fails.
- LFM2.5-24B-A2B: strong tool use (BFCLv4 65.0, LiveClaw 48.1) but weak coding (SWE-bench Verified 51 against 66 for Qwen3.6), and a license that limits commercial use above $10M revenue.
- Nemotron-3.5-Lightning: text only and unproven in Hermes.
- MiniCPM-V 4.7: a vision specialist that needs about 25 GB of RAM.
- Qwen3.8-Flash-Next Coder (125B-A6B): reported to fit 32 GB of RAM, but this machine has 31.4 GiB in total.
- Devstral Small 2 24B: 13.3 GB at Q4 does not fit 12 GB of VRAM.
- Flint 40B-A2.5B: its model card says almost nothing.
- Any dense 70B: about 43 GB at Q4 over 92 to 99 GB/s of RAM bandwidth is 2 to 5 tokens per second.
## Gates before a model is accepted
- Tool-call test returns the right function and arguments.
- At least 15 tokens per second warm at the real context, measured with the 900-token test.
- `ollama ps` or the engine log shows the expected placement and the context Hermes asked for.
- Available RAM stays above 3 GiB while it is loaded.
## Sources
Model cards on Hugging Face for Ornith-1.5-35B-A3B and 9B, Gemma 4, Qwen3.6, Qwen3.8, LFM2.5 and Groot, read 2026-11-26. The JetBrains Mellum2.1 Instruct post (2026-11) and its model cards. atomic.chat's 12 GB card measurements for Gemma 12B and Ornith 9B. Attention layouts from each model's `config.json`.
