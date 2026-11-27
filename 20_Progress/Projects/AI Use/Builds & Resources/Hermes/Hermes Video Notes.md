---
type: reference
status: seed
created: 2026-11-26
updated: 2026-11-26
tags:
  - ai
  - hermes
  - video
  - research
reference_kind: research
area:
  - ai
notes:
  - "[[Hermes Map]]"
  - "[[Hermes System]]"
  - "[[Hermes Model Routing]]"
  - "[[Hermes Agent]]"
next: Record the four video URLs and convert each section into a video source summary under 60_Claude/10_Source_Summaries/Video Ingestion.
---
# Hermes Video Notes
Four videos the Hermes build is based on, distilled in the order they were watched, plus the five diagrams from them described in words. The vault uses it as the source record for decisions in [[Hermes System]]. Read it when a design choice needs its origin.
> [!WARNING]
> These sections come from pasted transcripts and screenshots on 2026-11-26. The URLs were not recorded, the Qwen 3.8 video's settings are partly mis-transcribed, and none of this has been reduced to source summaries yet.
## Video 1: getting your own local agent running (Callum, Wanderloots)
==The pitch is that Hermes grows with you: persistent memory, self-written skills, scheduled automation and tool connections, running free on local models.== The first ten minutes are an install tour and are mostly skippable. The useful part starts at the local-model setup.
### Install and onboarding
The Windows installer takes 4 to 5 minutes and installs the agent plus the desktop app. First launch opens an onboarding chat powered by a free trial model (`nous/welcome`, once per OS user). The agent loads the Hermes, Claude design and p5.js skills to build an animated guide, which shows the agent loop: model, terminal, web, skills, tool result, back to the conversation. Sessions sit at the side, the model picker below the input.
### Local models in one click
Settings, Providers, Local Models. Hermes reads the hardware and suggests a model (on his 64 GB unified memory, Qwen 3.6 35B-A3B at 22 GB), or you choose from a Hugging Face search. Install runtime installs llama.cpp in about 3 seconds, then Download, Turn on, Use. The rule is that the model must be smaller than GPU memory with headroom for context. The Q in a file name is quantization: Gemma 4 12B is 22 GB at full size and 9 GB at Q6. A 26B-A4B model has 26B parameters and activates 4B. He measured 13 tokens per second, and warns that overloading RAM slows everything.
### Memory and settings
Two memory files hold what you are working on and how you like to work. Saving a preference in one session shows up in a new session ("what project am I working on"). Memory and context settings keep persistent memory and the user profile on. Memory providers, Hindsight and Honcho, are plugins you can add. Advanced settings hold the terminal execution backend. Other surfaces: a messaging gateway (Telegram, Discord, Slack), profiles such as a researcher with its own settings, and bot mode where bots talk to each other.
### The map of what comes next
He pointed to a playlist: Telegram news digest, Ollama as a runtime, Docker isolation, Obsidian as an LLM wiki, limiting vault access through Docker, an agentic librarian that shows a review page before anything enters the wiki, memory providers (Hindsight, Honcho), one memory shared by Claude Code, Codex, Antigravity and Cursor, profiles as bots, then Kanban orchestration. Local models are the thread through all of it.
## Video 2: running the agent inside Docker
==The goal is access, not execution: the agent may see chosen files but runs code only inside a sandbox.== He first lets Hermes on GPT 5.5 list a test folder holding fake therapy notes, strategy and API keys. Hermes redacts secret values in its answer, but it read the files, so they may already have reached the model provider. After switching to Docker the same request fails: the container has no such folder.
### Setup steps
1. Install Docker Desktop, accept terms, skip sign-in, keep it running.
2. In Hermes settings, Workspace, set the working directory to `/workspace`, which is a path inside the container.
3. In `config.yaml` replace the empty `docker_volumes` list with `host path:/workspace`, for example a `Hermes workspace` folder on the desktop.
4. In Advanced, switch the terminal backend from local to Docker. Quit and reopen Hermes.
5. The first request creates the container. A file the agent writes appears in the Docker `/workspace` tab and in the host folder, and the reverse.
He recommends mounting volumes by hand, because the `docker_mount_cwd_to_workspace` option caused trouble in the desktop app. Any number of volumes can be listed. If something breaks, delete the container, change settings and start again.
### Rules he states
Never mount the home folder or the root. A dedicated agent vault for an Obsidian LLM wiki can be a mounted volume and can be a Git folder for backup. Skills do not necessarily run inside the sandbox, so external skills can still act on the host: prefer your own and the official ones. A stronger option is to run the whole Hermes instance in the container and use the desktop app as a remote gateway window, at the cost of reaching Apple Notes or Obsidian. My inference, not his: the version-0.23 single-gateway design may make that simpler. A bug in July and August 2026 had the desktop app ignore `docker_volumes`, so check with `docker inspect`.
## Video 3: Qwen 3.8 27B and Hermes on a four-GPU server (Digital Spaceport)
Settings that matter for throughput, on four RTX 3090s at FP16 with vLLM: GPU memory utilization 0.95, max sequences about 20 (16 is safe), 16K batched tokens, KV cache in FP8, chunked prefill and prefix caching on (he calls prefix caching critical), 384 MB shared multimedia processing for screenshots, Qwen3 reasoning parser, the `qwen3_coder` tool-call parser and not the XML one for Qwen 3.8, thinking on with high reasoning effort and preserved thinking. He runs GPU servers in LXC containers because VMs cost performance.
*Findings:* Qwen 3.8 27B finished a two-day project that Qwen 3.8 Flash Next at int4 could not, and he keeps Flash Next for deep creative chat. DeepSeek V4 Flash is the choice if only code matters, and GLM 5.3 has the best code quality but is slow. In a swarm of five sub-agents, decode rose from the 70s to more than 100 and peaked near 222 tokens per second in aggregate, with a prefix-cache hit rate of 94.8%.
==Single-stream speed matters for chat, throughput matters for agent swarms.== That does not transfer to this laptop, which runs one request at a time. The takeaways that do transfer are prefix caching, a tool-call parser that matches the model family, and judging a model by hands-on agent work.
## Video 4: model routing and agent delegation (Callum, Wanderloots)
The three levels and the four kinds of delegation are in [[Hermes Model Routing]]. Extra detail: he runs Ollama on a Mac Studio and Lemonade on an AMD machine as custom endpoints, and sets a fast, a balanced and a deep route. A three-way test on one research question gave end-to-end times of about 16, 19 and 2 minutes for the fast local, balanced local and deep cloud routes, and the cloud model's report ranked first. The local fast model overstated a source. His fix is to make the fast tier a mixture of two small models and have an aggregator compare. He moves Kanban triage and decomposition, the biggest token users in his tests, to cheap or local models. A sponsor spot covers the free Consensus paper-search MCP tool.
## The five diagrams
- *Your local agent.* A smartphone reaches a local model and its llama.cpp engine on the GPU or CPU, all inside a Docker sandbox. A profile database feeds two Hindsight memory stores, a local wiki, a researcher bot and a librarian bot (both on Honcho), and a Kanban board with TODO, IN PROGRESS and DONE. Everything shares a system drive.
- *Four layers.* Use and connect (messaging: Telegram, Discord, Slack; runtimes: Ollama, LM Studio, Lemonade). Access and safety (Docker, execution backend, scoped access). Context and knowledge (Obsidian, LLM wiki, librarian review; built-in memory, advanced providers, shared-agent memory). Specialists and teamwork (profiles, bots, orchestration, Kanban).
- *Hermes ecosystem.* Hermes Desktop feeds Hermes Agent, which uses a local model or a cloud model (data leaves the computer). Agent actions run in a Docker sandbox with terminal, files and code execution. A host Hermes workspace maps to `/workspace`, and personal files are blocked.
- *Direct LLM, RAG and GraphRAG.* A direct model answers from training. RAG retrieves text chunks from a vector database. GraphRAG retrieves subgraphs of entities and relations from a knowledge graph, and gives the most connected answer. This matches the vault's Graphify plan.
- *One workflow, two views.* Five Kanban tasks: scope the goal (orchestrator), build and check (implementer, with an internal check loop), independent review (reviewer, evidence only), whole-outcome review (orchestrator), human approval (you). The dependency graph repeats with the repair loop returning to the first task.
## Actions this gives the build
Each maps to a phase in [[Hermes System]]. Install the runtime and models (done). Turn on built-in memory and plan a provider. Docker backend with a scoped mount (dropped on 2026-11-26 for a monitored home on the host, phase 3, see [[Hermes Primed Home Plan]]). Obsidian as a wiki through a dedicated folder, with a librarian review page (phases 3 and 4). Slack gateway and the saved-reel review (phase 8). Profiles, model routes and Kanban with a reviewer and a human approval step (phase 7).
