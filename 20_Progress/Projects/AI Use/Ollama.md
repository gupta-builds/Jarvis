---
type: reference
status: sprout
created: 2026-03-20
updated: 2026-11-26
tags:
  - ai
  - ollama
  - local-ai
reference_kind: tool-profile
area:
  - ai
notes:
  - "[[Hermes Map]]"
  - "[[Hermes Local Build Log]]"
  - "[[Local Model Lineup]]"
  - "[[Offload Engines and PolyStrata]]"
  - "[[AI Workflow]]"
  - "[[40_Resources/CS/Links|Links]]"
next: Test whether the llama.cpp router should serve the 35B lane while Ollama keeps the 12B and 9B models.
---
# Ollama
Ollama is the local model server on the Acer: it downloads models, loads them on the GPU and answers on `http://127.0.0.1:11434`, with an OpenAI-compatible route that Hermes uses. The vault uses it for the models that fit entirely in VRAM. Read it to see how it is configured and where it stops being the right tool.
## Setup as built, 2026-11-26
| Setting | Value | Why |
|---|---|---|
| Version | 0.40.18, app on C: (3.3 GB, no install-path choice) | stuck on C: by design |
| Model location | `D:\AI\models\ollama` | one models tree on D:, 12.8 GB today |
| Context | 65536 (app slider) | Hermes refuses anything under 64K |
| Flash attention | on (`OLLAMA_FLASH_ATTENTION=1`) | makes the KV cache quantization possible |
| KV cache type | `q8_0` | halves KV memory with little quality loss |
| Keep-alive | 30 minutes | avoids a reload between sessions |
| Loaded models | 1, parallel requests 1 | a 12 GB card holds one model plus its cache |
| Cloud | off | the setup is meant to be fully local |
| Network exposure | off | only this machine reaches it |

The five `OLLAMA_*` variables are user-scope environment variables and are read only when the app starts, so changing them needs a restart from a shell that has them. The model path and the context slider are app settings. Steps and checks are in [[Hermes Local Build Log]].
## Installed models
`gemma4:12b-it-qat` (11.9B, Q4_0, vision, audio, tools, thinking, 7.6 GB in VRAM at 64K) and `ornith-1.5:9b` (9.0B, Q4_K_M, vision, tools, thinking, 6.9 GB at 64K). Both returned correct tool calls and sit 100% on the GPU. The reasoning for these models and the other four is in [[Local Model Lineup]].
## Where it stops being right
==Ollama is the right engine for models that fit in VRAM and the wrong one for large mixture-of-experts models.== It has no switch to keep experts in RAM, it had no official multi-token-prediction support as of 2026-11-17, and one report found Qwen3.6-35B much slower on it than on llama.cpp. Those lanes go to PolyStrata or `llama-server` ([[Offload Engines and PolyStrata]]). Importing a raw GGUF also copies the file into Ollama's own store and needs a hand-written chat template for tools to work, so library tags are preferred.
## Cloud against local
Cloud models run on remote servers, need no local GPU, are always current and are stronger on hard reasoning, but they need internet, can cost money and see the data. Local models run offline, keep data on the machine and cost nothing per token, but depend on the hardware and trail frontier models. The tool hierarchy in the March version of this note, with Ollama as a private reading layer under Cursor and Claude Code, was written before the vault's Claude workflow and is superseded by [[Hermes Map]] and the Claude notes.
