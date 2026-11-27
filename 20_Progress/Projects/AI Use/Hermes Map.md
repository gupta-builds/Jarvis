---
type: index
status: sprout
created: 2026-11-26
updated: 2026-11-26
tags:
  - moc
  - ai
  - hermes
notes:
  - "[[Hermes Agent]]"
  - "[[Hermes System]]"
  - "[[Hermes Local Build Log]]"
  - "[[Local Model Lineup]]"
  - "[[Local AI Memory Budget]]"
  - "[[Offload Engines and PolyStrata]]"
  - "[[Hermes Video Notes]]"
  - "[[Ollama]]"
next: Add the Docker sandbox record to this map once the first mount is proven.
---
# Hermes Map
## Purpose
Where everything about running Hermes Agent on local models lives: the tool profile, the build order, the exact steps that were run, the model and memory research, and the plans for the next phases. Read it first in any Hermes session.
## Map
[[Hermes Agent]] is the tool profile in `10_Areas/AI`: what Hermes is here, what is installed, and the standing rules. [[Hermes System]] in `20_Progress/AI` is the project note with the build order, the dated state and the next action. The older [[Hermes Agent Framework — Corrected Framing|Corrected Framing]] separates the NousResearch software from zachdoesai's framing, and [[Hermes Agent — Trading & Alert System (Distilled)]] holds the monitoring play that the software could later run.
The build record is in `Builds & Resources/Hermes`. [[Hermes Local Build Log]] is the runnable procedure with dated checkpoints, including the measured speed and the GPU power-cap finding. [[Ollama]] describes the engine as configured. [[Local Model Lineup]] holds the six chosen models, the VRAM arithmetic and the files to download. [[Local AI Memory Budget]] is the RAM audit that decides which model lane can load. [[Offload Engines and PolyStrata]] explains why AirLLM dropped out and what runs large mixture-of-experts models on a 12 GB card.
Three plans cover the phases that follow. [[Hermes Docker Sandbox Plan]] is next. [[Hermes Conversation Tracking Plan]] turns Hermes sessions into Jarvis records using the same fields as [[Per-Prompt Record]]. [[Hermes Context Layer Plan]] connects the vault, The Plan, memory, rules, skills and MCP tools.
Day-to-day use lives in `40_Resources/CS/AI/Workflows/Hermes`: [[Hermes Operating Workflow]] for starting, checking and troubleshooting, and [[Hermes Model Routing]] for main, auxiliary and delegated models. [[Hermes Video Notes]] distills the four videos behind all of this, with the five diagrams described in words so the structure is searchable. The conversation layer that this work extends is mapped in [[Conversation Map]], and [[Platform Coverage]] lists Hermes as the platform with no capture yet.
## Status
State on 2026-11-26.

| Part | State |
|---|---|
| Ollama and Hermes | connected and tested end to end |
| Models installed | `gemma4:12b-it-qat`, `ornith-1.5:9b` |
| Speed | 39.6 tokens per second warm, GPU power-capped, open |
| RAM available | 9.6 GiB, target about 16 |
| Docker sandbox | not started |
| Conversation capture | not wired |
