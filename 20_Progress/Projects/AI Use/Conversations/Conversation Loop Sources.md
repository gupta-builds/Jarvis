---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - research
project_kind: spec
next: Re-check the two preprints in the list (Tang, Gloaguen) for a venue version before the 30_Order rewrite cites them.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|Conversation Loop Research Plan]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
---
# Conversation Loop Sources
## What This Is
==Ten sources are locked as the evidence base for the conversation loop; each was read in full, each has a stated use in the design and a stated limit, and none claims more than its own text supports.==
Research ran 2026-10-17 to 2026-10-22. "Read in full" means the complete text was saved locally and read end to end, by me or by a reader working from the saved file with line references; the three papers behind the first shortlist's strongest claims (Tang, Gloaguen, Xiong) were re-read by me from full text and two of them were corrected. A first list of ten was replaced on 2026-10-22: SWE-chat, trajectory-judge, and the agent-documentation paper were too generic for the two jobs that matter (human approval of model output, and small local models on conversation and note records) and were swapped for the sources marked **new**.
The honest summary of the field: **no published study validates a small local model on coding-session records.** The local-model design therefore rests on adjacent evidence plus a pilot on your own labels ([[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]).
## The ten
| # | Source | Status | Use in the design | Limit |
|---|---|---|---|---|
| 1 | [Claude Code documentation](https://code.claude.com/docs/en/hooks): hooks, [sessions](https://code.claude.com/docs/en/sessions), [claude-directory](https://code.claude.com/docs/en/claude-directory), [monitoring-usage](https://code.claude.com/docs/en/monitoring-usage), [memory](https://code.claude.com/docs/en/memory), [context-window](https://code.claude.com/docs/en/context-window), [best-practices](https://code.claude.com/docs/en/best-practices) | Primary, read 2026-10-21 and 22 | What can be observed (33 hook events, `prompt_id`, `InstructionsLoaded`, telemetry events), the 30-day sweep, the 1.5-second SessionEnd budget, `async`, the unstable transcript format, `/context`, `/insights`, what loads before the first prompt and what survives compaction | The hooks page was read in two passes; field lists marked "one pass" in the notes should be rechecked before a build |
| 2 | Anthropic, [How we built Claude Code auto mode](https://www.anthropic.com/engineering/claude-code-auto-mode) (**new**) | Primary engineering post | Users accepted 93% of manual approval prompts; a reasoning-blind classifier fed only user messages and tool calls beat one fed everything; two stages; 0.4% false positives and 17% misses on 52 real overeager actions; "not a drop-in replacement for careful human review"; sampled design for [[20_Progress/Projects/AI Use/Conversations/Local Reviewer\|Local Reviewer]] | Anthropic's own data, small n for the miss rate |
| 3 | Buçinca, Malaya, Gajos, [To Trust or to Think](https://arxiv.org/abs/2102.09692), PACMHCI CSCW 2021 (**new**) | Peer reviewed experiment, N=199 | People follow a wrong AI suggestion; plain explanations did not help; three forcing designs (decide first, wait, on demand) cut overreliance from 0.64 to 0.48; the person plus AI stayed below the AI alone. Basis for writing your own note before seeing any flag | A nutrition task with lay participants and a simulated 75% AI; transfer is of the rule, not the numbers |
| 4 | Shankar et al., [Who Validates the Validators?](https://arxiv.org/abs/2404.12272), UIST 2024 (**new**) | Peer reviewed, 9 practitioners plus two offline pipelines | "Criteria drift": 5 of 9 added or reinterpreted criteria while grading; random samples of outputs gave high variance in judging a check's alignment. Basis for a living codebook and mixed sampling | Text-generation tasks, volunteers, no coding sessions |
| 5 | Tang et al., [How Coding Agents Fail Their Users](https://arxiv.org/abs/2605.29442) | arXiv preprint (the authors' repository says EMNLP 2026; the paper text does not) | Seven symptom categories from 20,574 real sessions (Claude Code is 6,648 of them) seeded into [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy\|Failure Taxonomy]]; quote-anchored, precision-first extraction with a second validation pass; expert precision 0.93 on 200 records; human agreement 0.83; LLM-versus-expert accuracy 0.81 | Only pushback-visible episodes; the abstract's "91.49% need correction" is near-definitional (9.33% of episodes had any visible resolution) |
| 6 | Gloaguen et al., [Evaluating AGENTS.md](https://arxiv.org/abs/2602.11988), v3 | arXiv preprint | Context files raised cost (LLM-generated +20% and +23%; developer-written up to 19%) and gave no significant gain; instructions are followed; overviews do not help. Basis for testing every CLAUDE.md change | Python tasks, one run each, about ±4 point standard errors; never tests lessons written from your own mistakes |
| 7 | Xiao et al., [Reducing Cost of LLM Agents with Trajectory Reduction](https://arxiv.org/abs/2509.23586) (AgentDiet), PACMSE vol. 3 (FSE) 2026 | Peer reviewed | Tool results were about 63% of tokens in an average coding trajectory; three kinds of waste (useless, redundant, expired); pruning cut input tokens 40% to 60% and net cost 21% to 36% with pass rate within -1 to +2 points. Basis for the bloat codes | One agent (Trae Agent), one run per cell, waste taxonomy not quantified per category; an agent could not prune its own context |
| 8 | Dunivin, [Scaling hermeneutics](https://link.springer.com/article/10.1140/epjds/s13688-025-00548-8), EPJ Data Science 2025 (**new**) | Peer reviewed, open access | A human-built codebook applied by an LLM: one code per prompt (κ 0.68 against 0.60), a written rationale (0.59 to 0.68), scope words (0.73 to 0.81), hold-out split, re-validate on any model change | GPT-4 and GPT-3.5 only, 111 passages; open models could not do the task at the time |
| 9 | Xu et al., [A-Mem](https://arxiv.org/abs/2502.12110), NeurIPS 2025 (**new**) | Peer reviewed | Notes with keywords, tags, and a context line built by small models (Qwen2.5 1.5B and 3B, Llama 3.2 1B and 3B) locally through Ollama; about 12 to 15 times fewer tokens than full context. Basis for T4 in the local reviewer and for note structure | Single runs, no error bars, conversational question answering; the tags were never audited |
| 10 | Zhang et al., [AgenTracer](https://arxiv.org/abs/2509.03312) (**new**) | arXiv v2; listed in the ICLR 2026 proceedings | Small base models localize a failing step 1.7% to 8.7% of the time and name the guilty agent 37% to 60%. Basis for the rule that the local model never searches a long trace | Machine-made labels, multi-agent QA and math; the venue is not in the preprint text |
## Supporting sources, read and verified, not in the ten
- Anthropic, [Effective context engineering](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents): context rot, just-in-time loading, compaction, subagents; principle only, no experiments.
- Liu et al., [Dive into Claude Code](https://arxiv.org/abs/2604.14228), v3: a nine-step turn and five context shapers from Claude Code v2.1.88, about 200 releases behind the installed 2.1.307; 27 hook events where the docs list 33. Use for the mental model, never for current behavior.
- Husain and Shankar, [error analysis](https://hamel.dev/blog/posts/evals-faq/why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.html): around 100 traces, open coding of the first failure, saturation; practitioner guidance with no experiments.
- Wu et al., [LongMemEval](https://arxiv.org/abs/2410.10813): store rounds, expand keys with extracted facts (+9.4% recall), extract before reading; Llama-3.2 1B and 3B unusable on long history directly and 0.31 to 0.47 with round memory; synthetic personal chats.
- Baumann et al., [SWE-chat](https://arxiv.org/abs/2604.20779): how line survival is measured by replaying edits against commits; model-judged success has an ICC of only 0.50 to 0.60; a 9B pushback classifier scored 0.67 on four classes and 0.79 on two.
- Chavan, [constrained decoding in small LLMs](https://arxiv.org/abs/2609.23742): schema validity to 100% for 0.6B to 4B, content accuracy still scale-dependent; one author, 14 synthetic tasks.
- Gao and Chen, [agent documentation reading](https://arxiv.org/abs/2608.20195): instruction files and working notes are 60.5% of documentation interactions, weighting-sensitive; unreviewed.
## Practitioner cases (anecdotal, not evidence of effect)
- [Matthew Hansen](https://www.blundergoat.com/articles/claude-code-insights-roasted-my-ai-workflow), Feb 2026: ran `/insights` on 64 sessions over 28 days (31 flagged "wrong approach"), then wrote five CLAUDE.md rules, two skills, and hooks. No re-run.
- [The weekly setup review](https://whatsurvivesinai.substack.com/p/claude-code-step-8-weekly-review), Oct 2026: ten minutes, one question, one change, a fresh-session test, a change log. One observed run. Locked as the procedure in [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol\|Weekly Review Protocol]] step 8.
- [Quo's token audit](https://dev.to/quolu/87-of-my-context-was-garbage-how-i-optimized-claude-code-token-usage-534k): one session, 188,000 tokens per turn, 87% history, about 80% of it tool output; agrees in direction with AgentDiet.
- [vault-scribe](https://github.com/saladin1980/vault-scribe): writes each session into an Obsidian daily note after every turn without a model call, with decisions only when they quote your words. README only; code not reviewed.
- [Every's compound engineering](https://github.com/EveryInc/compound-engineering-plugin) and Anthropic teams keeping CLAUDE.md in git: described by their authors, never measured. Every's own refresh skill states that without a periodic pass "the store misleads more than it helps".
No case reports a measured before-and-after on output quality. That gap is what [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger\|Intervention Ledger]] exists to fill.
## Set aside, with the reason
| Source | Why |
|---|---|
| NVIDIA, [Small Language Models are the Future of Agentic AI](https://arxiv.org/abs/2506.02153) | A position paper; its 40% to 70% replaceable-call figures are the authors' estimates, no small model was run |
| [trajectory-judge](https://arxiv.org/abs/2609.00038) | One author, a synthetic support desk, two models; its paired-discrimination idea is kept as a method note only |
| [SLMJury](https://arxiv.org/abs/2606.07810) | Math and science correctness, no agent traces |
| Human-LLM annotation verification, CHI 2024 | Closed access; full text could not be read |
| Meyer et al., developer self-monitoring | Full text could not be retrieved |
| Xiong et al., [memory management](https://arxiv.org/abs/2505.16067), ACL 2026 | Not coding agents; memory is retrieved example runs; no variance. Principle only: unfiltered accumulation hurt |
| Wink, Meta-Harness, ACE, the self-evolving agents survey, CODESKILL, Trace2Skill | Automation of the loop, which this design does not attempt; their results need a scalar score or automated proposer |
| Anthropic, [agent autonomy study](https://www.anthropic.com/research/measuring-agent-autonomy) | Organization-level; useful context (median turn about 45 seconds, auto-approve rising with experience), not a design input |
## Corrections made during verification
- Tang et al.: my first summary quoted the 91.49% headline without its caveat.
- Gloaguen et al.: scope narrower than first stated (repo overviews, Python, one run each).
- AgenTracer: the abstract's "below 10%" refers to other work; the paper's own small-model step-level numbers are 1.7% to 8.7%.
- A-MEM: the token saving for small models is 12 to 15 times, not the 7 times first reported.
- Gloaguen et al., checked again 2026-10-22 against the arXiv abstract: it says context files "tend to reduce task success rates" while raising inference cost by over 20%, which is stronger than the "no significant gain" in row 6. The direction supports the one-change-per-week rule more, not less. Re-read the full text for the exact table before build B10 cites a number.
- Tang et al.: the per-category percentages used in [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]] were not confirmed by the 2026-10-22 web search, which found them only on a third-party blog. They rest on the earlier full-text read. Keep citing the paper, not a blog.
- `cleanupPeriodDays: 0` has conflicting reports (the docs reject it; a public issue says it stopped transcripts being written). Never set it.
## Non-Goals
Not a literature review of agent self-improvement, which this design deliberately does not attempt.
