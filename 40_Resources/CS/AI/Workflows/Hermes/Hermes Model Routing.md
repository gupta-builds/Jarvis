---
type: reference
status: seed
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - routing
reference_kind: resource
area:
  - ai
notes:
  - "[[Hermes Agent]]"
  - "[[Hermes Video Notes]]"
  - "[[Local Model Lineup]]"
  - "[[Hermes Operating Workflow]]"
next: Decide which auxiliary tasks can move off the main model once a second engine or a CPU model exists.
---
# Hermes Model Routing
Which model answers which kind of work in Hermes, from the model-routing video and from this laptop's limits. The vault uses it to keep the daily lane choice and the delegation design in one place. Read it before assigning an auxiliary model, a sub-agent route or a Kanban worker.
## Three layers
==Hermes picks a model at three levels, and they are independent: the main model, the auxiliary models, and delegation.== The main model answers the conversation and is set per profile. Auxiliary models run helper tasks and default to the main model: vision, compression, skills hub search, approval, MCP tool routing, title generation, the `/review` sub-agent, the Kanban triage specifier, the Kanban decomposer, the profile describer and the curator. Delegation covers sub-agents and teams.
## Four kinds of delegation
| Kind | What the child gets | What it lacks |
|---|---|---|
| Default task delegation | Same model as the parent, or one set model | No choice per task |
| Model routes (advanced delegation plugin, needs Hermes 0.22.5 or later) | A named route per task, such as fast, balanced, deep, each on a different model or provider | Cannot be combined with profile routes |
| Profile routes | The profile's model, skills, keys and soul | Its memory and custom context; those must be passed in |
| Kanban | A full profile with its memory, run as its own process, with cards saved in a database | Slower to set up |

Sub-agents are not persistent: if the parent quits, their work is lost. Kanban cards survive.
## Decision tree from the video
1. *Internal housekeeping?* Use auxiliary models. Compression, skills hub, triage specifier and decomposer save the most tokens.
2. *Persistent multi-step work?* Use Kanban.
3. *Needs a specialist's skills, tools or credentials?* Use profile routes.
4. *Needs the specialist's memory?* Use Kanban, because a profile route drops memory.
5. *Would independent analysis improve the result?* Use model routes or plain delegation and have the parent compare.
Then weigh privacy, speed and cost, and keep a cloud fallback only if the task allows it.
## What this laptop changes
With one 12 GB GPU and `OLLAMA_MAX_LOADED_MODELS=1`, routing is serialization. A route to a different model unloads the current one and pays a load, 17 s for Ornith 9B. Parallel researchers from the video would queue behind each other. Until a second engine or a CPU-resident small model exists, keep every auxiliary task on the main model and use routing for overnight jobs where the wait does not matter.
## Lane plan
| Tier in the video | Lane here | Model | Engine |
|---|---|---|---|
| Fast | quick chat, vision, titles | Gemma 4 12B | Ollama now |
| Balanced | coding agent, sub-agents | Ornith 1.5 9B | Ollama now |
| Deep | overnight Kanban workers, long coding | Ornith 1.5 35B, Qwen3.8-27B | PolyStrata or llama.cpp, later |

The fallbacks per lane are in [[Local Model Lineup]]. Hermes also has `hermes fallback`, which tries another provider when the primary fails, and a mixture-of-agents mode in which two small models answer and an aggregator compares them. Neither is configured yet. The second needs two models resident at once, which this GPU cannot do.
