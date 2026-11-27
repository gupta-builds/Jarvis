---
type: reference
status: sprout
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - ollama
  - runbook
reference_kind: runbook
machine: acer
notes:
  - "[[Hermes System]]"
  - "[[Ollama]]"
  - "[[Local Model Lineup]]"
  - "[[Local AI Memory Budget]]"
next: Re-run step 8 after the Predator mode check and write the number into Checkpoints.
---
# Hermes Local Build Log
## Why This Note Exists
This is the runnable record of connecting Hermes Agent to Ollama on the Acer (`GUPTA-BUILDS`) with models stored on D:, including the measurements that decided what comes next. It supersedes the bare "ollama pull and point Hermes at it" advice in the March [[Ollama]] note, and it is the procedure to repeat on the Dell. The model reasoning is in [[Local Model Lineup]] and the RAM limits in [[Local AI Memory Budget]].
## Gate
- D: has at least 30 GB free and `D:\AI\models\ollama` exists. On 2026-11-26 D: had 521 GB free.
- Hermes is installed with `HERMES_HOME` set (`D:\Apps\Hermes` on the Acer) and `hermes status` runs.
- Ollama answers on `127.0.0.1:11434` and `ollama list` works.
- Ollama Cloud is off in its settings, so nothing routes to a cloud model by accident.
## Steps
1. Read the hardware baseline: `nvidia-smi`, available RAM, `ollama --version`, `hermes --version`. Nothing changes.
2. **Changes state.** Set the Ollama environment at user scope: `OLLAMA_FLASH_ATTENTION=1`, `OLLAMA_KV_CACHE_TYPE=q8_0`, `OLLAMA_KEEP_ALIVE=30m`, `OLLAMA_MAX_LOADED_MODELS=1`, `OLLAMA_NUM_PARALLEL=1`, each with `[Environment]::SetEnvironmentVariable('NAME','value','User')`.
3. **Changes state.** In the Ollama app settings set Model location to `D:\AI\models\ollama`, the context slider to 64k, and Cloud off. The app stores these itself, so they do not appear as user environment variables.
4. **Changes state.** Quit the Ollama app and start it again from a shell that has the step 2 variables. Open `%LOCALAPPDATA%\Ollama\server.log`, find the last "server config" line, and confirm flash attention true, KV type q8_0, keep-alive 30m, one loaded model, one parallel request, 65536 context and the D: model path.
5. **Changes state.** Back up `config.yaml` into `backups\config` under Hermes home, then run `hermes config set` for `model.provider custom`, `model.base_url http://127.0.0.1:11434/v1`, `model.default gemma4:12b-it-qat`, `model.context_length 65536`, `model.ollama_num_ctx 65536`. Diff the non-comment lines against the backup. The command strips all comments but keeps every active setting.
6. **Changes state, about 5 minutes each.** `ollama pull gemma4:12b-it-qat` and `ollama pull ornith-1.5:9b`. These are the official library tags. Importing the same files from raw GGUFs would need a hand-written chat template, which breaks tool calling, and would copy 14 GB a second time.
7. Prove tool calling, then Hermes. Post a chat request with one tool definition to `/api/chat` and require a `tool_calls` entry with the right arguments. Then run `hermes -z "which model are you running on?"`.
8. Measure speed on the loaded model: a 900-token generation through `/api/generate` with `nvidia-smi` sampled every 0.7 s for clocks, power, temperature, utilization and throttle reasons.
## Checkpoints
**2026-11-26, Acer:** Ollama had been running since 02:18 with its old settings, so the five variables set earlier were not in effect (flash attention false, keep-alive 5 minutes). Restarted at 20:10 and the log showed all five applied, 65536 context and the D: path.
**2026-11-26, Acer:** `hermes config set` took the file from 1,997 lines to 145. A diff of active settings showed only the five intended changes plus quote styling. Backup: `backups\config\config.yaml.pre-ollama-20261126-201039`.
**2026-11-26, Acer:** Pulls finished in 5 min 17 s (Gemma, 7.2 GB listed) and 4 min 22 s (Ornith, 6.6 GB). `ollama show ornith-1.5:9b`: architecture qwen35, 9.0B, Q4_K_M, 262144 maximum context, capabilities tools, thinking, completion, vision, plus a 456M vision projector. `gemma4:12b-it-qat`: 11.9B, Q4_0, capabilities completion, vision, audio, tools, thinking.
**2026-11-26, Acer:** Model location changed to `D:\AI\models\ollama` at about 20:24. The store held 12.8 GB in 18 files, `D:\AI\ollama` no longer existed, and C: held none.
**2026-11-26, Acer:** First Gemma run, thinking on: 1 min 46 s total, 45.7 s load from a cold disk, 729 tokens at 29.63 tokens per second. `ollama ps`: 7.6 GB, 100% GPU, context 65536.
**2026-11-26, Acer:** Warm Gemma run, 900 tokens: 39.6 tokens per second. GPU at 95 to 97% utilization, clocks swinging 675 to 1552 MHz, 51 to 68 W, 65 to 68 C, throttle reason `0x4` (software power cap) on every sample, and no thermal bits. Windows power plan Balanced, on AC power, battery 79%. The Predator performance mode was set but its effect on the cap is unmeasured.
**2026-11-26, Acer:** Tool test passed on both models with `read_file` and the exact path argument. Ornith 9B cold load was 17.2 s and a warm call 0.7 s. `hermes -z` answered "I am running on gemma4:12b-it-qat" in 44 s wall time, including the swap from Ornith. `hermes prompt-size`: 29.9 KB system prompt plus 41.8 KB of tool schemas. `hermes sessions stats` showed one session and two messages afterward.
**2026-11-26, Acer:** Open. 39.6 tokens per second is about 60% of the 60 to 66 estimate. At 54 to 65 W the GPU is power-limited, not bandwidth-limited. Compare Quiet, Balanced and the top Predator mode with the step 8 test before blaming the model or the engine.
