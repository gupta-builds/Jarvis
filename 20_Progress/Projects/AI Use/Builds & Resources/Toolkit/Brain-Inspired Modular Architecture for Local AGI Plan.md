---
type: project
status: active
created: 2026-11-27
updated: 2026-11-27
tags:
  - project
  - ai
  - agi
  - neuro-ai
  - architecture
  - local-agi
project_kind: plan
next: Prototype the local hippocampal episodic memory buffer in SQLite and test pattern separation and completion on agent traces.
related_progress:
  - "[[20_Progress/Projects/AI Use/Agentic OS and Shared Memory Plan|Agentic OS and Shared Memory Plan]]"
  - "[[20_Progress/AI/Hermes System|Hermes System]]"
  - "[[20_Progress/Projects/AI Use/The AI Hub|The AI Hub]]"
notes:
  - "[[Jarvis OS — North Star]]"
  - "[[Jarvis Memory]]"
  - "[[HUMAN_WRITING]]"
---
# Brain-Inspired Modular Architecture for Local AGI Plan
## Goal
==Achieve autonomous, lifelong-learning Artificial General Intelligence on a single local machine by replacing monolithic models with a modular cognitive architecture that mirrors biological brain regions: a fast hippocampal episodic memory, a sensory neocortex, a basal ganglia action selector, a cerebellar predictive forward engine, and an executive prefrontal coordinator.==
This plan translates the neuro-AI principles of Whole Brain Architecture (WBA) and Embodied General Intelligence (EGI) into an executable software stack that runs across the local hardware environment without relying on massive cloud clusters.
## Theoretical Foundations and Research Context
Monolithic Large Language Models (LLMs) cannot achieve robust general intelligence on their own. While transformers excel at implicit statistical pattern matching across static text, they suffer from catastrophic forgetting, massive computational inefficiency, context amnesia, and a total absence of real-time sensorimotor grounding. Biological intelligence solves this through evolutionary functional modularity: distinct anatomical organs specialize in fundamentally different optimization objectives, coordinated through an executive network.
```
                  ┌──────────────────────────────────────────────┐
                  │          Higher-Level Executive Manager       │
                  │   Prefrontal Cortex (PFC) / Global Workspace │
                  │  (Local LLMs, Meta-Controllers, Working Mem) │
                  └──────────────────────┬───────────────────────┘
                                         │
        ┌────────────────────────────────┼────────────────────────────────┐
        ▼                                ▼                                ▼
┌──────────────────────┐      ┌──────────────────────┐      ┌──────────────────────┐
│  Sensory Neocortex   │      │    Basal Ganglia     │      │      Cerebellum      │
│  (Visual/Auditory)   │      │   Action Selection   │      │  Motor/Control Loops │
│  Architecture: CNNs  │      │   Architecture: RL   │      │  Architecture: MPC   │
└──────────┬───────────┘      └──────────────────────┘      └──────────────────────┘
           │
           ▼
┌──────────────────────┐
│     Hippocampus      │
│  Episodic Memory     │
│  Architecture: SNNs  │
└──────────────────────┘
```
### 1. The Anchor Paper: Neuromorphic Hippocampal Memory
* **Citation:** Daniel Casanueva-Morato, Álvaro Ayuso-Martínez, Giacomo Indiveri, Juan P. Domínguez-Morales, and Gabriel Jiménez-Moreno. *Analog Sequential Hippocampal Memory Model for Trajectory Learning and Recalling: A Robustness Analysis Overview*, **Advanced Intelligent Systems** (Wiley, Volume 7, Issue 1, 2024/2025, DOI: [10.1002/aisy.202400282](https://doi.org/10.1002/aisy.202400282)).
* **Core Mechanism:** Implements the hippocampal trisynaptic circuit using Spiking Neural Networks (SNNs) on mixed-signal analog/digital neuromorphic hardware (DYNAP-SE).
* **The Four Sub-Circuits:**
  1. **Entorhinal Cortex (EC):** Spatial coordinate interface, grid cells, sensory gateway.
  2. **Dentate Gyrus (DG):** Sparse coding and **pattern separation**, preventing interference between similar experiences.
  3. **Cornu Ammonis 3 (CA3):** Auto-associative recurrent neural network with recurrent collateral synapses, executing **pattern completion** from noisy or partial cues.
  4. **Cornu Ammonis 1 (CA1):** Temporal readout comparator, decoding sequential trajectories into executable actions.
* **Relevance to Local AGI:** Proves that trajectory memory, one-shot continuous learning, and noise-robust recall can run at milliwatt power consumption using specialized spike-based memory topologies rather than billions of dense transformer parameters.
### 2. Cross-Brain Literature and Architecture Mappings
Kenji Doya's foundational computational framework (1999/2000) established that the three major brain structures correspond to three distinct machine learning paradigms:
* **Neocortex = Unsupervised / Representation Learning:** Hierarchical perception and world models.
* **Basal Ganglia = Reinforcement Learning:** Action selection guided by dopamine reward prediction errors.
* **Cerebellum = Supervised Learning:** Predictive internal forward models and timing control.
#### Neocortex and the Sensory Stream (CNNs and ViTs)
* **Biological Counterpart:** Ventral visual stream (V1 -> V2 -> V4 -> Inferior Temporal [IT] cortex).
* **Key Literature:**
  - **Yamins et al. (2014, PNAS):** *Performance-optimized hierarchical models predict neural responses in higher visual cortex*. Proved that deep Convolutional Neural Networks (CNNs) trained purely on object classification predict single-neuron firing rates in primate IT cortex better than any handcrafted neuroscientific model.
  - **DiCarlo, Zoccolan, and Rust (2012, Trends in Cognitive Sciences):** *How does the brain solve visual object recognition?* Formulated the hierarchical ventral stream cascade that CNNs mathematically instantiate.
  - **Schrimpf et al. (2018/2020, Neuron/bioRxiv):** *Brain-Score: Which Artificial Neural Network for Object Recognition is most Brain-Like?* Standardized the metric of representational similarity between CNN layers and biological primate recording sites.
#### Basal Ganglia and Value-Based Gating (Reinforcement Learning)
* **Biological Counterpart:** Striatum, Globus Pallidus, Substantia Nigra pars compacta (SNc), and Ventral Tegmental Area (VTA).
* **Key Literature:**
  - **Schultz, Dayan, and Montague (1997, Science):** *A neural substrate of prediction and error*. Demonstrated that phasic dopamine bursts in the primate midbrain match the mathematical Temporal Difference (TD) error ($\delta$) formulated by Sutton and Barto.
  - **Frank, Loughry, and O'Reilly (2001, Cognitive, Affective, and Behavioral Neuroscience):** The Prefrontal Cortex Basal Ganglia Working Memory (PBWM) model. Proved how basal ganglia gating pathways ("Go" versus "No-Go") regulate what information enters executive working memory.
#### Cerebellum and Predictive Error Minimization (Forward Models and MPC)
* **Biological Counterpart:** Cerebellar cortex (granule cells, Purkinje cells, climbing fibers).
* **Key Literature:**
  - **Marr (1969) and Albus (1971):** The Marr-Albus theory of the cerebellar cortex as an expansive perceptron utilizing supervised learning signals.
  - **Wolpert, Miall, and Kawato (1998, Trends in Cognitive Sciences):** *Internal models in the cerebellum*. Mapped pairs of forward (predictive) and inverse (control) models to cerebellar microzones, showing how the brain bypasses slow biological feedback loops.
  - **Kawato (1999, Current Opinion in Neurobiology):** Internal models for motor control and trajectory planning.
#### Prefrontal Cortex and Executive Orchestration (LLMs and Global Workspace)
* **Biological Counterpart:** Dorsolateral prefrontal cortex (dlPFC), orbitofrontal cortex (OFC), and thalamocortical loops.
* **Key Literature:**
  - **Wang et al. (2018, Nature Neuroscience):** *Prefrontal cortex as a meta-reinforcement learning system*. Showed how recurrent networks meta-trained on varied tasks develop internal RL dynamics mirroring the PFC.
  - **Goyal, Bengio, et al. (2021, ICLR):** *Coordination of Modular Neural Networks via a Global Workspace*. Formulated inter-module communication routed through a capacity-constrained shared bottleneck.
  - **Yamakawa (2021, AGI):** *The Whole Brain Architecture Approach: To Create Human-like Artificial General Intelligence by Learning from the Brain*. The foundational engineering blueprint for combining sensory neocortex, basal ganglia, cerebellum, and hippocampus.
## Local Machine Architecture and Resource Mapping
To run this architecture on local hardware (Acer/Dell laptops with consumer GPUs and system RAM), each biological region is mapped to lightweight, purpose-built local software engines:

| Brain Region | Biological Role | Local Software Implementation | Hardware Footprint |
| :--- | :--- | :--- | :--- |
| **Hippocampus** | Rapid episodic indexing, pattern separation and completion, trajectory recall | SQLite vector/graph registry (`jarvis-memory`), SNN simulator (Lava / Norse / Brian2), or fast HNSW index with Hebbian decay | < 500 MB RAM, low CPU |
| **Sensory Neocortex** | Hierarchical feature extraction, visual perception, audio embeddings | Small CNNs (MobileNetV4, EfficientNet), compact Vision Transformers (ViT-Small), or Whisper-tiny | 1 GB to 2 GB VRAM / NPU |
| **Basal Ganglia** | Action gating, tool-call selection, utility estimation, reward tracking | Actor-Critic policy module (CleanRL), Q-table, or lightweight classifier trained on reward prediction errors | < 250 MB RAM, minimal compute |
| **Cerebellum** | Internal forward model, execution trajectory prediction, error correction | Fast linear/MLP forward model or Model Predictive Control (MPC) heuristic loop | < 200 MB RAM, low-latency CPU |
| **Prefrontal Cortex** | Working memory, meta-planning, linguistic reasoning, task arbitration | Local quantized LLM (Qwen 2.5 7B/14B, Llama 3.2, Mistral via Ollama / Hermes) or hybrid gateway | 4 GB to 8 GB VRAM |
## Current State
* **Executive Layer:** Partially operational. Local agents (Hermes, Ollama, Claude Code CLI, Cursor) can reason over prompts and execute scripts, but they run statelessly.
* **Episodic Memory (Hippocampus):** Rudimentary. Markdown notes in Obsidian serve as external semantic storage. The `jarvis-memory` SQLite schema exists in [[Jarvis Memory]] but lacks active associative recall, pattern separation, and automated replay loops.
* **Perception (Sensory Neocortex):** Isolated. Screen captures and text parsing are triggered on demand without continuous representation learning.
* **Action Selector (Basal Ganglia):** Missing. Tool invocation relies on brute-force prompt stuffing rather than an adaptive, dopamine-like reward gating mechanism.
* **Predictive Motor/Loop Control (Cerebellum):** Missing. Agent tool executions wait on full output without internal forward predictions to catch runaway actions early.
## Non-Goals
* **Monolithic Scaling:** We are not training a hundred-billion-parameter local model. General intelligence here emerges from modular interaction, not raw parameter volume.
* **Cloud Dependence for Core Loops:** The system must remain functional completely offline on local compute. Remote APIs (Gemini, Claude) serve only as teacher models or high-tier fallback consultants.
* **Whole-Brain Cellular Simulation:** We are not simulating billions of biological biophysical ion channels. We implement the mathematical and functional principles of each region.
## Sequence
### Phase 1: Hippocampal Episodic Memory and Pattern Separation
1. **Build the Local Episodic Buffer:** Instantiate the local SQLite episodic store with support for fast vector embeddings and relational linking.
2. **Implement DG Pattern Separation:** Implement a sparse-coding projection layer so that distinct user sessions and tool trajectories receive orthogonal representations, preventing memory interference.
3. **Implement CA3 Pattern Completion:** Add an associative retrieval mechanism that takes a partial state cue (such as an error string or an incomplete prompt) and recalls the complete prior successful action trajectory.
4. **Done When:** The local system correctly retrieves a previous multi-step CLI sequence from a partial command fragment with zero LLM prompting, completing retrieval in under 50 milliseconds.
### Phase 2: Basal Ganglia Action Selection and Gating
1. **Action Candidate Registry:** Define a structured action space covering local system tools (file read, file edit, command execution, memory query, user ask).
2. **TD-Error Reward Engine:** Implement a reward tracking loop that records an explicit Temporal Difference error ($\delta$) when an action succeeds or fails.
3. **Working Memory Gating:** Connect the basal ganglia module to the prefrontal context window, preventing irrelevant tool schemas from polluting the prompt context.
4. **Done When:** The gating module filters out at least 70% of unnecessary tools before prompting the local LLM, cutting prompt token costs and eliminating hallucinations on tool selection.
### Phase 3: Cerebellar Forward Model for Sub-Second Error Detection
1. **State-Action Forward Predictor:** Train a tiny MLP forward model that takes the current terminal/editor state plus the chosen tool action and predicts the expected state diff.
2. **Discrepancy Detector:** Intercept tool execution output; if the actual state deviates significantly from the cerebellar prediction, trigger an immediate interrupt.
3. **Done When:** A runaway shell loop or destructive file deletion is halted before completing because the cerebellar discrepancy signal exceeds threshold.
### Phase 4: Sensory Stream Integration
1. **Local Vision/Sensory Feature Pipeline:** Integrate a lightweight local visual backbone (MobileNet / small CNN) that monitors terminal windows, IDE states, and document screenshots.
2. **Representational Bottleneck:** Compress high-dimensional sensory feeds into compact latent vectors fed directly into the hippocampal buffer and executive working memory.
3. **Done When:** The local agent detects and reacts to a UI layout change or terminal error state from image input in under 200 milliseconds.
### Phase 5: Executive Prefrontal Synthesis and Closed-Loop Local AGI
1. **Global Workspace Coordinator:** Unify the four modules under a central arbitration loop driven by a local quantized LLM (e.g. Qwen 2.5 via Ollama / Hermes).
2. **Offline Replay and Memory Consolidation:** Implement an idle-time daemon that replays recent episodic trajectories, pruning noise and consolidating successful procedures into permanent vault knowledge.
3. **Done When:** The local agent autonomously completes a novel multi-step software engineering task, learns the environment dynamics on the fly, remembers the solution across machine reboots, and executes it the second time with zero guidance and fewer steps.
## Open Questions
- [ ] Can the hippocampal pattern separation layer run purely as an algorithmic sparse dictionary, or does an analog neuromorphic simulation (such as Norse or Lava SNNs) offer measurable performance gains on standard CPU/GPU hardware?
- [ ] What is the most lightweight local model capable of acting as the executive prefrontal arbiter without exceeding 6 GB VRAM on the primary laptop?
- [ ] How should reward signals be generated objectively during coding and vault-maintenance tasks to drive basal ganglia TD learning without requiring constant human intervention?
- [ ] Does the `jarvis-memory` SQLite schema require restructuring to accommodate CA3-style auto-associative graph links alongside vector tables?
## Evidence
* **Casanueva-Morato et al. (2024/2025):** Full paper and open-source implementation at `dancasmor/Robust-analog-sequential-hippocampus-memory-model-for-trajectory-learning-and-recalling` demonstrating SNN trajectory learning.
* **Brain-Score Benchmark (Schrimpf et al.):** Public empirical data demonstrating representational similarity between primate visual cortex and CNN hierarchies.
* **Sutton and Barto / Schultz et al. (1997):** Formal mathematical equivalence between dopamine neurobiology and temporal difference reinforcement learning.
* **Local Machine Baseline:** Successful execution of quantized models via Ollama and Hermes on local hardware documented in [[20_Progress/AI/Hermes System|Hermes System]].
## Related Notes
* [[20_Progress/Projects/AI Use/Agentic OS and Shared Memory Plan|Agentic OS and Shared Memory Plan]]
* [[20_Progress/Projects/AI Use/The AI Hub|The AI Hub]]
* [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]
* [[Jarvis Memory]]
* [[Jarvis OS — North Star]]
