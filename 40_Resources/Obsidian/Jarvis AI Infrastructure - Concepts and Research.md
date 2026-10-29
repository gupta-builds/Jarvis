---
type: reference
status: sprout
created: 2026-10-17
updated: 2026-10-17
tags:
  - jarvis
  - ai-infrastructure
  - research
reference_kind: research
area:
  - '[[10_Areas/AI/Claude Code]]'
  - '[[10_Areas/AI/Codex]]'
notes:
  - '[[20_Progress/Projects/Jarvis & The Plan/Jarvis]]'
  - '[[Jarvis Restoration Build Plan]]'
  - '[[Jarvis Current State - 2026-10-17]]'
  - '[[Portfolio Option A — RAG + Hybrid Search (jarvis-memory Build)]]'
---
# Jarvis AI Infrastructure - Concepts and Research
Use this note when deciding which AI mechanism Jarvis needs and what evidence would justify building it. It preserves the October 17 discussion and research options; [[Jarvis Restoration Build Plan]] owns implementation order. No research option here authorizes activating a service or choosing a stack.
## Harnesses, orchestration, and context
==Jarvis already has components of an agent harness; the reliable integration of those components still needs evidence.==
A **harness** is the software and operating environment around a model: instructions, tools, permissions, state, execution, checks, and recovery. **Orchestration** decides which script, model, agent, or human handles each step and how their outputs move. An agent definition is an artifact; an observed invocation and its result establish whether that route works.
Jarvis's candidate harness components include `AGENTS.md`, `CLAUDE.md`, [[HUMAN_WRITING]], [[AI_CONTEXT]], `30_Order/`, project commands and skills, MCP access, write guards, scheduled scripts, continuity records, and lint. Calling this six of seven universal layers adds false precision: there is no locally verified coverage measure behind that earlier statement.
**Context engineering** selects the smallest useful context for a task. The practical build is a bounded pack of current state, relevant project notes, evidence, and recent decisions, with provenance and an explicit size budget. Shared instructions should point to one owner rather than duplicate policy in every tool. Anthropic describes context as finite and recommends managing what enters it. [Effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
## Knowledge graph, plugins, and neural networks
==A linked note graph provides relationships; a neural network learns parameters from data.==
**Wikilinks** connect note nodes. Frontmatter supplies properties and, when a field contains note links with defined meaning, typed relationships. A consistent `type` field labels a node; it does not create a learned representation. A usable knowledge graph additionally needs defined relationships, identity resolution, provenance, and query behavior. Markdown already provides raw graph material, but that does not prove that `jarvis-memory` extracts or queries it.

| Component | Mechanism | What still needs verification in Jarvis |
|---|---|---|
| Obsidian Graph View | Draws internal links between notes | Visualization is not proof of graph retrieval. |
| Dataview and Bases | Query structured note properties and display views | Queries, paths, metadata quality, and actual plugin availability. |
| ExcaliBrain | Displays relationships using configured link/property conventions | Which relation fields this vault configures and whether they render correctly. |
| Omnisearch | Keyword retrieval and indexing within Obsidian | Current scope, indexing cost, and exclusions; no semantic-memory service is established by installation. |
| Tasks and Spaced Repetition | Query actions and drill cards from note text | Raw transcript scans have caused OOM incidents; preserve exclusions described in [[Acer Session Findings — Obsidian OOM Crash]]. |
| Meta Bind and Templater | Help users create or edit structured note data | Whether current templates preserve the canonical schema. |
| Local REST API and MCP bridge | Give external tools access to notes and operations | Per-host availability, permissions, and tool registration. |
| Graphify and other generated exports | Produce additional representations when invoked | The generating artifact, refresh date, source scope, and consuming tool. |
Graph View, Dataview, and ExcaliBrain documentation explain their mechanisms; they do not establish which plugins are enabled on either laptop. [Obsidian Graph View](https://obsidian.md/help/Plugins/Graph%2Bview), [Dataview](https://github.com/blacksmithgu/obsidian-dataview), [ExcaliBrain](https://github.com/zsviczian/excalibrain)
Jarvis also has historical generated-graph work: the August 22 [[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation|Graphify implementation]] built an internship-repo graph and exported generated artifacts through Git hooks. [[Jarvis Build History - July to October 2026]] records the merge-driver/PATH repair, orphan pruning, and unresolved export-manifest locking risk. That history corrects the earlier claim that graph tooling was merely proposed; it still does not establish a fresh vault-wide graph retrieval index today.
A **neural network** contains learned weights. **Embeddings** use a trained model to map text into vectors for similarity search. Adding embeddings would give Jarvis a neural representation of note content; writing notes and connecting them with links does not train a neural network. A **graph neural network** is another model family that learns using graph structure and features. Jarvis needs a specific prediction task and suitable training/evaluation data before that becomes a practical build.
## Capture, memory, and the related repositories
==Capturing transcripts, retrieving decisions, and qualifying tools are different workflows with different completion gates.==
**Conversation capture** collects source transcripts. **Normalization** gives vendors and sessions consistent IDs, dates, host names, paths, and checksums. **Distillation** extracts decisions, changes, uncertainties, and actions with links back to the source. **Promotion** adds reviewed durable knowledge to canonical notes. A functioning exporter only proves the first part of this chain.
Historical GBrain semantic testing and a local promptfoo `/challenge` experiment are real component evaluations; their dated results do not constitute a maintained Jarvis retrieval benchmark. Preserve the distinction between a tested component and a deployed memory service.
**Persistent memory** includes live context, durable decisions, and retrieval over historical evidence. The April plans already propose raw, normalized, and distilled layers. They also propose context packs and conversation filters. Those remain useful goals, but [[Jarvis Current State - 2026-10-17]] records the current gaps and avoids treating schema tables as populated services.
**second-brain-claudekit** qualifies outside tools through sandboxing, testing, and promotion decisions; its hooks or mirrors are separate integrations. The current [[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]] and [[20_Progress/Projects/AI Use/Claude Kit/Source of Truth/The Qualification Pipeline|The Qualification Pipeline]] provide its local evidence. It is not the general explanation for all conversation capture in Jarvis. A tested tool, a promoted tool, a global install, and a currently invoked tool are four distinct claims. Earlier gstack and mattpocock skill-count anecdotes require their dated qualification records before reuse.
**internship-research-loop** is an adjacent operating pipeline with deterministic discovery and validation documented separately from human-started model assistance. Preserve that separation when restoring it. Claims about hourly Actions, test counts, schema-drift gates, ranking, ATS deduplication, dossier validation, and deletion brakes require the current repo and CI evidence. Anant reports the loop off on this laptop on October 17; this review does not establish remote CI state. Its repository history is not a reason to re-enable it before preserving work on both hosts.
## Evaluation before retrieval complexity
==A fixed set of evidence-backed questions makes retrieval changes comparable.==
Start with 30 to 50 real questions and their evidence notes, versioned against the corpus and retrieval configuration. Include direct facts, related-note synthesis, recent decisions, superseded facts, contradictions, and questions the vault cannot answer. Course questions can contribute examples if they test the intended workflow; they should not silently become the whole benchmark. Separate a development set from held-out cases to reduce tuning to the answers.

| Measure | What it answers |
|---|---|
| Recall@k | Did the returned set contain the required evidence? |
| MRR | How early did the first relevant result appear? |
| Answer correctness | Did the answer actually answer the question? |
| Citation support | Does each cited passage support the associated claim? |
| Abstention and stale-state handling | Does the system admit missing evidence and distinguish obsolete decisions? |
| Latency and cost | What does each successful task cost in time and inference? |
| Repeated-run reliability | Does the same workflow continue to succeed across runs and restarts? |
**Vault Lint** measures structural conformance; it is already a form of evaluation. It does not measure retrieval relevance or answer truth. Code assertions, model graders, and human review serve different purposes. Audit a sample of grader decisions and keep traces so a failure can be assigned to retrieval, context assembly, generation, tools, or stale evidence.
Anthropic evaluates the model and harness together and discusses code, model, and human graders. `pass@k` measures whether at least one of k attempts succeeds; `pass^k` asks whether all attempts succeed. A single correct answer and dependable repeated operation are different requirements. [Demystifying evals for AI agents](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents)
## Conditional retrieval builds
==Choose the next retrieval component from observed failures against the baseline.==
1. **Lexical baseline.** Verify the current title/path `LIKE` search, then test body search using SQLite FTS/BM25 or an equivalent small local index. Preserve note and heading IDs, source scope, timestamps, and hashes. Fix deleted/renamed-note handling before comparing relevance.
2. **Chunking.** Compare heading-based chunks with fixed windows and overlap. Add semantic chunking only if the cases justify its cost. Keep heading paths and source spans so citations survive retrieval. Raw transcripts must not compete indiscriminately with reviewed notes.
3. **Embeddings and hybrid search.** Compare lexical-only, dense-only, and their combination on the same cases. Track embedding model/version, index refresh, privacy, and cost. Reciprocal rank fusion is an option; weighted scoring needs calibration. ChromaDB, Qdrant, hosted retrieval, and local model choices remain alternatives from the July proposal.
4. **Reranking and grounded answers.** Add a cross-encoder or model reranker only if it improves the measured failures enough to justify latency/cost. Answer generation must cite the retrieved passage and identify missing support. A citation-shaped link is not proof of entailment.
5. **Graph extraction and expansion.** Extract wikilinks and defined frontmatter relations with source provenance, stable identities, unresolved-link handling, and edge direction. First expose a useful neighborhood query. Then compare graph expansion or Personalized PageRank with lexical/hybrid retrieval on multi-note cases. An existing graph visualization does not establish this service.
6. **Temporal memory.** Record when a claim was valid and when it was recorded. Preserve superseded decisions and invalidate their current applicability instead of silently deleting the trail. Test questions such as which sync policy applied before and after Sync Build 11. Temporal metadata adds work and should solve demonstrated stale-state failures.
7. **Learned graph experiments.** Consider link prediction only with a clear task, suitable features, leakage controls, a held-out split, and simple similarity/popularity baselines. Do not use speculative edge predictions as trusted note links without review.
## Research anchors and limits
==Published results justify experiments; Jarvis must establish its own results.==

| Source | What it contributes | Local decision boundary |
|---|---|---|
| [HippoRAG 2](https://arxiv.org/abs/2502.14802), 2025 | Knowledge-graph retrieval with Personalized PageRank and associative-memory evaluation. | Its reported gains are benchmark results, not a prediction of Jarvis recall. Test an ablation against existing retrieval. |
| [Zep temporal knowledge graph](https://arxiv.org/abs/2501.13956), 2025 | A vendor-authored design and evaluation for temporal agent memory. | Adopt validity and supersession concepts only if local stale-fact cases need them; no vendor adoption is implied. |
| [LongMemEval](https://arxiv.org/abs/2410.10813), 2024/2025 | Evaluates long-term assistant memory across conversation histories. | Borrow question categories and scoring discipline, while keeping Jarvis-specific evidence. |
| [LongMemEval-V2](https://arxiv.org/abs/2605.12493), 2026 | Examines workflow memory, changing state, environment details, and knowledge limits for web agents. | Adapt useful categories; do not claim the vault has run or matches this benchmark. |
| [Microsoft GraphRAG](https://github.com/microsoft/graphrag) | Official implementation and resource warnings; repository currently describes maintenance mode. | A full GraphRAG stack is an optional comparison, not a prerequisite for using existing wikilinks. |
The earlier replies also named Faros, Implicator/Karpathy's LLM Wiki, Tianpan, and an unnamed UBC thesis. Their incomplete citations are preserved as unresolved leads, not validated evidence or requirements. No numeric claim from those references is used to select a build.
## Long-running agents and learning outcomes
==Useful continuity records name the task, current state, evidence, and next action across sessions.==
Anthropic's long-running-agent work uses initialization, task lists, progress artifacts, Git history, and checks to carry work across context windows. Its later harness-design discussion emphasizes revisiting components as model capabilities change. Jarvis can test whether its project hub, current-state record, small context packs, and dated evidence improve resumption without accumulating redundant instructions. [Effective harnesses](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents), [Harness design for long-running applications](https://www.anthropic.com/engineering/harness-design-long-running-apps)
Learn retrieval evaluation, data modeling, SQLite/index maintenance, observability, and failure recovery through the restoration builds. For neural models, learn linear algebra, differentiation, gradient descent, backpropagation, embeddings, and transformers before graph representation learning. Each subject should support a concrete experiment or explain an observed failure.
The five-year ambition is a direction, not a new timetable: a system another engineer can run, inspect, recover, and evaluate; a documented experiment showing when hybrid or graph retrieval helps; and evidence that the system improves real project work. An engineering portfolio claim should contain measured outcomes and reproducible methods. Earlier professional ratings are opinions based on incomplete artifacts and are not capability measurements.
## Open Questions
- [ ] Which real Jarvis tasks fail often enough to belong in the first evaluation set?
- [ ] Which note classes should retrieval trust by default, and how should raw conversations be weighted?
- [ ] Does graph expansion improve multi-note retrieval enough to justify extraction and maintenance?
- [ ] Which stale-decision cases require temporal validity beyond a dated correction?
- [ ] Which optional research leads warrant primary-source verification after restoration?
