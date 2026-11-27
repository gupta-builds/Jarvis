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
  - "[[Hermes Control Surface]]"
  - "[[Hermes Primed Home Plan]]"
  - "[[Hermes Change Ledger Spec]]"
  - "[[Hermes Conversation Tracking Plan]]"
  - "[[Hermes Context Layer Plan]]"
  - "[[Agentic OS and Shared Memory Plan]]"
  - "[[Local Model Lineup]]"
  - "[[Local AI Memory Budget]]"
  - "[[Offload Engines and PolyStrata]]"
  - "[[Hermes Video Notes]]"
  - "[[Hermes Docker Sandbox Plan]]"
  - "[[Ollama]]"
next: Mark the conversation exporter as built here once one real session has become one passing note.
---
# Hermes Map
## Purpose
Where everything about running Hermes Agent on local models lives: the tool profile, the build order, the exact steps that were run, the controls Hermes ships with, the model and memory research, and the plans for the next phases. Read it first in any Hermes session.
## Map
[[Hermes Agent]] is the tool profile in `10_Areas/AI`: what Hermes is here, what is installed, and the standing rules. [[Hermes System]] in `20_Progress/AI` is the project note with the build order, the dated state and the next action. The older [[Hermes Agent Framework — Corrected Framing|Corrected Framing]] separates the NousResearch software from zachdoesai's framing, and [[Hermes Agent — Trading & Alert System (Distilled)]] holds the monitoring play that the software could later run.
The build record is in `Builds & Resources/Hermes`. [[Hermes Local Build Log]] is the runnable procedure with dated checkpoints, including the measured speed and the GPU power-cap finding. [[Ollama]] describes the engine as configured. [[Local Model Lineup]] holds the six chosen models, the VRAM arithmetic and the files to download. [[Local AI Memory Budget]] is the RAM audit that decides which model lane can load. [[Offload Engines and PolyStrata]] explains why AirLLM dropped out and what runs large mixture-of-experts models on a 12 GB card.
The plans follow the build order. [[Hermes Conversation Tracking Plan]] is next and turns Hermes sessions into Jarvis records in `AI Conversations/Acer/Windows/Hermes/`. [[Hermes Primed Home Plan]] makes the host environment safe to work in, using what [[Hermes Control Surface]] found already ships with Hermes, and [[Hermes Change Ledger Spec]] defines the daily record of every change. [[Hermes Context Layer Plan]] then connects rules, memory, skills and the Jarvis connector. [[Agentic OS and Shared Memory Plan]] is the larger goal across every platform and the gate before any shared database. [[Hermes Docker Sandbox Plan]] is archived: dropped on 2026-11-26.
Day-to-day use lives in `40_Resources/CS/AI/Workflows/Hermes`: [[Hermes Operating Workflow]] for starting, checking and troubleshooting, and [[Hermes Model Routing]] for main, auxiliary and delegated models. [[Hermes Video Notes]] distills the four videos behind all of this, with the five diagrams described in words so the structure is searchable. The conversation layer this work extends is mapped in [[Conversation Map]], and [[Platform Coverage]] lists Hermes as the platform whose capture is planned.
## Status
State on 2026-11-26.

| Part | State |
|---|---|
| Ollama and Hermes | connected and tested end to end |
| Models installed | `gemma4:12b-it-qat`, `ornith-1.5:9b` |
| Speed | 39.6 tokens per second warm, GPU power-capped, open |
| RAM available | 11.5 GiB at the last check, target about 16 |
| Docker sandbox | dropped, plan archived |
| Conversation capture | next build, folder decided |
| Guards, hooks, git, backups | verified available, none turned on |
| Shared memory database | gated on proven loops |
