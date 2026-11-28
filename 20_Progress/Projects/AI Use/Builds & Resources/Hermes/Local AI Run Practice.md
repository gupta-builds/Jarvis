---
type: reference
status: seed
created: 2026-11-27
updated: 2026-11-27
tags:
  - ai
  - local-ai
  - inference
  - monitoring
  - acer
reference_kind: resource
area:
  - ai
notes:
  - "[[Hermes Map]]"
  - "[[Local Model Lineup]]"
  - "[[Offload Engines and PolyStrata]]"
  - "[[Local AI Memory Budget]]"
  - "[[Hermes Local Build Log]]"
  - "[[Acer Health Pass - 2026-11-26]]"
next: Run the 900-token test under each Windows power mode and each Predator mode with the nvidia-smi sampler below, then fill the Results table.
---
# Local AI Run Practice
How to fit a model on the Acer (12 GB RTX 5070 Ti Laptop, 31.4 GiB RAM) without starving the machine, what to watch during a run, and which sampling settings each model was published with. Read it before loading a model, and again when tokens per second come out lower than expected.
## What a run is judged on
==Every reading answers one question: where is the time going?== Track these and nothing else until a run shows a gap.

| Question | Reading that answers it | Where to read it (already installed) |
|---|---|---|
| Is the whole model on the GPU? | `PROCESSOR` column, for example `100% GPU` or a CPU/GPU split | `ollama ps`; for llama.cpp the load log lines that report layers and buffer sizes |
| How fast is it? | Generation and prompt-processing tokens per second, plus time to first token | `ollama run <model> --verbose`; the `eval_count`, `eval_duration`, `prompt_eval_duration` and `load_duration` fields of `/api/generate`; `llamacpp:predicted_tokens_seconds` and `llamacpp:prompt_tokens_seconds` from `llama-server --metrics` |
| Is VRAM full? | Memory used against the 12,227 MiB total (about 11.94 GiB usable, because the display runs on the Intel GPU) | `nvidia-smi`, Task Manager GPU tab |
| Is RAM or the pagefile under pressure? | Available RAM, commit charge against its limit, pagefile in use | Task Manager Performance tab, the watcher (`watch\ALERTS.txt`), RAMMap when Available looks healthy but the machine is slow |
| Is the GPU limited by power or heat? | Power draw, graphics clock, temperature, and the clocks-event reason bits | `nvidia-smi` query below |
| Is the PCIe link the bottleneck when experts sit in RAM? | Link generation and width during the run (idle shows Gen 1 and x8 to save power; the card supports Gen 5) | same `nvidia-smi` query |
| Are the right CPU cores working? | Per-core load while the model decodes | Task Manager, CPU tab, logical processors view |
| Is the SSD paying for it? | Disk writes during the run (loading a model is reads; large writes mean the pagefile or logs) | Task Manager Disk, the watcher's `disk_write_gb_per_hour` and CrystalDiskInfo |
One sampler covers the GPU rows. Run it in a second terminal during the test and stop it with Ctrl+C, and send it to a file on D: with `-f`:
`nvidia-smi --query-gpu=timestamp,power.draw,clocks.gr,clocks.mem,temperature.gpu,utilization.gpu,memory.used,pcie.link.gen.current,pcie.link.width.current,clocks_event_reasons.active --format=csv -l 1`
Clocks-event reason bits. `0x4` software power cap and `0x400` reliability were seen on this machine (`0x4` during the Gemma run on 2026-11-26, `0x400` at idle). The other values come from the NVML header: `0x1` idle, `0x2` application clocks setting, `0x8` hardware slowdown, `0x20` software thermal slowdown, `0x40` hardware thermal slowdown, `0x80` hardware power brake. `nvidia-smi -q -d PERFORMANCE` prints the names next to each state.
## Fitting the model and leaving room
1. **Size it first.** VRAM needed is weights on the GPU plus KV cache plus about 0.8 GiB of compute buffers, and the arithmetic per model is in [[Local Model Lineup]]. Reduce context or the KV cache type before you accept a spill to RAM.
2. **Use the engine the model suits.** Ollama for models that sit fully in VRAM (Gemma 12B, Ornith 9B). llama.cpp for the 35B mixture-of-experts and 27B models, because Ollama has no expert-offload control ([[Offload Engines and PolyStrata]]).
3. **Mixture-of-experts models.** Keep attention and shared weights on the GPU and the experts in RAM: `--n-cpu-moe N` keeps the experts of the first N layers on the CPU, and `--fit on` with `--fit-ctx <the context you want>` and `--fit-target <MiB margin>` picks the split. The llama.cpp README lists `--fit` as on by default with a 1024 MiB target margin and a 4096 minimum context, so set `--fit-ctx` explicitly or the context can shrink.
4. **Dense models.** Offload layers with `-ngl`, and expect the spilled part to run at RAM bandwidth. Two DDR5-6400 modules give a peak of about 102 GB/s, and the vault measured 92 to 99.
5. **KV cache.** `OLLAMA_KV_CACHE_TYPE=q8_0` with `OLLAMA_FLASH_ATTENTION=1` about halves it against `f16` (Ollama's FAQ says the default type is `f16`). In llama.cpp the same is `-fa on -ctk q8_0 -ctv q8_0`.
6. **One model, one request.** The vault sets `OLLAMA_MAX_LOADED_MODELS=1` and `OLLAMA_NUM_PARALLEL=1`, and llama.cpp's `-np` should be 1 as well. Each extra slot adds KV cache.
7. **Leave room to work.** Keep Available RAM above 3 GiB while a model is loaded (the gate in [[Local Model Lineup]]), and keep commit charge under 85% of its limit (the watcher warns there). Dev tools run beside the models that sit fully in VRAM. The 35B lane waits until browsers and dev servers are closed or capped ([[Local AI Memory Budget]]).
8. **Threads for CPU-side work.** Windows reports two efficiency classes on this CPU. The 8 logical processors with the higher class are 0, 1, 10, 11, 12, 13, 22 and 23, and the other 16 are efficiency cores. Hypothesis, untested: decode with spilled experts runs best with `-t 8` and an affinity mask on those 8 (`--cpu-mask 0xC03C03`). Compare against the default and `-t 16` before adopting it, and confirm in Task Manager that the load lands on the intended cores.
## Power and heat
The 5070 Ti Laptop has a default power limit of 70 W and a maximum of 115 W, and `nvidia-smi` cannot set it on this laptop (the field reads N/A). On 2026-11-26 the warm Gemma run held 39.6 tokens per second at 51 to 68 W and 65 to 68 C with reason `0x4` on every sample, on the Balanced plan, against 60 to 66 expected ([[Hermes Local Build Log]]). Since then the Windows power mode is Best performance and the NVIDIA bug is fixed, but the Predator mode has not been compared.
- Run plugged in. All the speed tests so far were on AC power.
- Compare the 900-token test under Quiet, Balanced and the top Predator mode, with the sampler running. Fill the Results table.
- Reason `0x4` with power draw well under 115 W points to the laptop's power policy. `0x20`, `0x40` or `0x80` point to heat. No bit set with low speed points away from power, toward placement, PCIe or RAM bandwidth.
- NVIDIA's `_nvtopps` plugin is disabled ([[Acer Health Pass - 2026-11-26]]). It may carry WhisperMode and Battery Boost, so a change in fan behavior or battery life is a reason to read that note's rollback.

| Date | Model | Power mode and Predator mode | Tokens per second | Power draw | Reason bits | Temperature |
|---|---|---|---|---|---|---|
| 2026-11-26 | Gemma 4 12B, 64K context | Balanced, mode not recorded | 39.6 | 51 to 68 W | `0x4` | 65 to 68 C |
## Settings that change the answer
Two different "temperatures" appear here. **Sampling temperature** is a setting that controls how random the model's word choices are. **GPU temperature** is a sensor. Context length is the third setting that costs memory: it is the "volume" the KV cache has to hold.
Publisher-recommended sampling, read from each model card on 2026-11-27. These are the vendors' numbers, not tests on this machine, and the tool-calling gate in [[Local Model Lineup]] still decides whether a model is accepted.

| Model | Mode | temperature | top_p | top_k | min_p | presence penalty |
|---|---|---|---|---|---|---|
| Gemma 4 (12B) | all | 1.0 | 0.95 | 64 | not given | not given |
| Ornith 1.5 9B | general | 1.0 | 0.95 | 20 | 0.0 | 1.5 |
| Ornith 1.5 9B | precise coding | 0.6 | 0.95 | 20 | 0.0 | 0.0 |
| Ornith 1.5 35B-A3B | general | 0.6 | 0.95 | 20 | not given | not given |
| Qwen3.8 27B | thinking | 1.0 | 0.95 | 20 | 0.0 | 0.0 |
| Qwen3.8 27B | instruct (non-thinking) | 0.7 | 0.8 | 20 | 0.0 | 1.5 |
| Qwen3.6 35B-A3B | thinking, general | 1.0 | 0.95 | 20 | 0.0 | 1.5 |
| Mellum2.1 12B-A2.5B | instruct | 0.6 | 0.95 | 20 | not given | not given |
The Qwen3.6 row comes from a search summary of its card, so re-read the card before relying on it. Ornith's 35B card gives temperature 1.0 only to reproduce its benchmarks. Gemma 4's thinking mode is switched on by putting `<|think|>` at the start of the system prompt, and Ollama handles the chat template.
Where to set them: in Ollama as `PARAMETER` lines in a Modelfile or as `options` in each API request; in llama.cpp as `--temp`, `--top-p`, `--top-k`, `--min-p` and `--presence-penalty`, or per request. Ollama's default context is 4096 tokens unless `OLLAMA_CONTEXT_LENGTH` or the app slider says otherwise, and the vault sets 64K for Hermes.
Match the setting to the job: lower temperature (0.6) for code and tool calls, where one wrong token breaks the result; the vendor's higher value (1.0) for open-ended chat and reasoning; the presence penalty only where a card asks for it to stop repetition.
## Monitoring: what exists and what is missing
Nothing needs installing for the table above. Installed already: `nvidia-smi`, Task Manager, Resource Monitor, Performance Monitor, `ollama ps` and `--verbose`, PredatorSense (temperatures, fans, performance mode), the NVIDIA App (its overlay is reported to show CPU temperature, clocks and power as well as GPU stats, a community report that the official 11.0.9 notes do not mention), CrystalDiskInfo, and the watcher in `D:\WSL\ops\windows`.
The one gap is a single timeline that puts tokens per second beside power, clocks and temperature. The options, none installed and none chosen:
- the `nvidia-smi` sampler above plus the llama.cpp `/metrics` page or Ollama's per-request timings, joined by hand;
- LibreHardwareMonitor or HWiNFO, both free hardware-sensor monitors that log CPU and GPU readings;
- Prometheus with Grafana, which has a ready dashboard for llama.cpp metrics, but runs as always-on services and costs RAM and disk writes all day (rejected for now on 2026-11-27).
Decision on 2026-11-27: install or build nothing until a run on the Results table shows a question the current tools cannot answer.
## A hardware-only local AI mode (design, not built)
The closing-apps scripts were removed on 2026-11-27, because closing apps breaks work in progress and Toggl should keep timing AI work. A mode worth building would only prepare the hardware:
- Check, and refuse to start if wrong: on AC power, power mode Best performance (Windows has an API for this that the removed script used), GPU idle and cool, Available RAM and commit within the limits above.
- Report: whether WSL, Docker or the MinerU server are running and what they hold, because each reserves memory. Stopping WSL would be an explicit switch, and Docker and MinerU stay untouched unless a switch names them.
- Check the Ollama environment against the use case (context, KV type, keep-alive).
- After the run: print the clocks-event counters and the peak temperature and power.
Open question: whether a script can read or set the Predator mode. No source was found, and the earlier RAM session found none on whether the mode survives closing PredatorSense. Do not build the mode until that is answered.
## Decisions of 2026-11-27
- AI-mode enter and leave scripts and the older `ops-85` model-mode script are removed. The read-only `ops-86-ram-snapshot.ps1` stays.
- `.wslconfig` is `memory=8GB`, `processors=8`, `autoMemoryReclaim=dropCache` (it was 20 GB, 18 and gradual), effective the next time WSL starts. ChatGPT no longer starts at logon.
- RAM result of the session that built the removed scripts, for reference: with the normal apps open Available was 7.2 to 9.4 GiB and Active plus Modified 22.1 to 24.2 GiB. With Claude Desktop, ChatGPT, Toggl, Wispr Flow, PowerToys and the other approved apps closed it reached 15.6 GiB Available and 15.9 GiB Active plus Modified. What remained was VS Code, Obsidian, one Claude Code session, Defender and the compression store. Closing apps got back about 6 to 8 GiB, at a cost the owner decided against.
## Sources
llama.cpp server README (flags, `--metrics`, `/metrics` names), read 2026-11-27. Ollama FAQ (default context, environment variables, KV cache type, `ollama ps`). Model cards on Hugging Face and Ollama for Ornith 1.5, Gemma 4, Qwen3.8 and Mellum2.1, and a search summary for Qwen3.6. `nvidia-smi` queries on this machine (power limits, PCIe, event reasons) and the Windows CPU set information (efficiency classes), 2026-11-27.
