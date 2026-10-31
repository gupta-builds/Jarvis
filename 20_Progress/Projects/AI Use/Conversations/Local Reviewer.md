---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - local-ai
project_kind: spec
next: Nothing to build yet. Stage A starts after P11, once 30 prompts carry your own codes. Stage B starts only when its four-part gate is true (every platform captured the same way, 100 labeled prompts, 4 weeks of stage A, a rubric per question).
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]"
---
# Local Reviewer
## What This Is
==The second reviewer reads one short record at a time, answers one narrow question with a quoted piece of evidence, and hands its flags to the human after the human has written their own note. It starts as a Claude-assisted pass and becomes a local model only once the process is proven and repetitive.==
The note keeps its original name; it now covers both stages. Written 2026-10-22, restaged 2026-10-30 on the owner's decision: **until every AI platform is captured the same way, the second reviewer is a Claude-assisted pass; when all platforms are covered and the process is written out and repetitive, a local model takes the narrow questions.** The reviewer never decides, never writes a rule, and earns each question by matching the human's labels on a held-out set. No source tested a small local model on coding-session records, so stage B is a protocol for measuring one, not a claim that it works.
## Stage A: Claude-assisted pass (after P11)
**Gate.** You have hand-coded at least 30 prompts across the first weekly reviews. Husain and Shankar (page modified 2026-09-01) say to annotate at least 30 traces yourself before an agent suggests more; the agent then searches the remaining traces for likely instances of the failures you described, you accept or reject, and you iterate to saturation with a working pool of about 100.
**What it reads.** Short records only: the final message head of the previous assistant turn plus your next prompt (pushback), the claim and the tool-call list (false done, constraint), taken from the redacted session notes. Not the whole transcript. Anthropic's auto-mode classifier did worse when fed assistant messages and tool results, and a shorter transcript was easier to read, though that classifier judged overeager actions, not output quality. The Plan is excluded unless the owner opts in (open decision).
**How a call works.**
1. A fresh Claude Code session gets the rubric for one code and a batch of prompts you have not coded this week.
2. It returns JSON per prompt: `flag`, a verbatim `quote`, and a short `rationale`. One code per call, because Dunivin found one code per prompt beat the whole codebook (kappa 0.68 against 0.60) and a rationale raised agreement (0.68 against 0.59).
3. Output that does not parse is written as a failure row and counted, never skipped.
4. Flags stay hidden until step 4 of the weekly review, after your own notes and after the key.
5. You mark each flag accept or reject. The accepted share per code is logged weekly, and the monthly step 4 reads it.
**Rules while it runs.**
- Digest rules run first and the Claude pass is asked only what a rule cannot answer. A question has to beat its rule to stay.
- Every flag shows its quote; a flag without one is dropped.
- Unflagged prompts are sampled every week, because people accept what a model leaves alone (93 percent of manual approvals in Anthropic's data).
- Re-validate on any change of model, prompt or codebook. Hold out 50 labeled prompts untouched until the wording is final.
- Claude Code sets up the rubrics and the runs; your labels are the truth. The only outside model is Claude Code, which already receives these sessions.
- No step lets it edit a rule, a CLAUDE.md line, a skill or a setting.
## Stage B: local model (gate)
Start only when all four are true:
1. Every target platform (Claude Code on the Acer first, then the Dell, Codex, Cursor) writes the same record, so the rubric is written once.
2. At least 100 prompts carry your labels, 50 of them held out.
3. Stage A has run for 4 or more weeks and its accepted share per code is on file.
4. A rubric is written for each question that is a candidate for a local model.
Then pilot, in this order:
1. Run the digest rules and record their precision and recall. A model has to beat the rule for its question to earn a place.
2. Pull two or three 7B to 14B models into Ollama (the Acer has an RTX 5070 Ti Laptop GPU with 12,227 MiB and 31.4 GB RAM; Ollama was installed with no model on 2026-10-22, not re-checked since).
3. Run each candidate three times per question, with and without assistant prose, JSON-constrained. Constrained decoding made 0.6B to 4B models schema-valid 100 percent of the time (from 78.6 to 92.9 percent) while content accuracy stayed scale-dependent, so valid output is not a correct answer.
4. Record per code: precision, recall, agreement with you, the false-alarm rate on prompts you coded OK, and how often three runs disagree.
5. Evaluate on the held-out 50 once and write the go-live bar per question here, with the date. This note gives no number, because no source supports one.
6. Two shadow weeks: flags stay hidden during the blind pass and appear at the reveal, and the accepted share is logged.
## Questions the reviewer may be asked
| Task | Question | Input (short) | Output | Starts as |
|---|---|---|---|---|
| T1 Pushback | Does the user's next prompt correct or reject what the assistant just did? | The assistant's final message head and the next user prompt | `{flag, quote, why}`; a pattern rule runs first. SWE-chat found pushback in 50 percent of turns, so this flags a lot and is read with the previous action | Stage A |
| T2 False done | Does the final message claim the work was tested or verified? | The final message head; the digest rule says whether a check ran | `{claims, quote}`; mostly a rule | Digest rule; model only if the rule misses |
| T3 Constraint | Does any tool call break this stated rule? | The rule sentence and the tool-call list only | `{flag, call, why}` | Human-only until stage A shows a good accepted share |
| T4 Note tags | Keywords, tags and a one-line context for a reviewed note | The reviewed note's prompt text | JSON proposed for approval | Not a review question. An indexing aid for stage B, after the platforms are covered |
Not asked: where a long run first went wrong (AgenTracer: small models found the failing step 1.7 to 8.7 percent of the time on its benchmark), whether the output was good (S1, S2 and S5 stay human), or anything that needs the whole transcript.
## What the evidence says
Every row was re-checked on 2026-10-30 against the paper or page unless the last column says otherwise.

| Finding | Source | Use here | Checked |
|---|---|---|---|
| Qwen3-8B and Llama-3.2-3B located the failing step in long multi-agent traces 1.72 to 8.73 percent of the time (handcrafted and automated splits); naming the guilty agent worked better (37 to 63 percent across the open models). A coder model reached 34 percent on one split | AgenTracer, arXiv 2509.03312 v2; the abstract says reasoning LLMs are "generally below 10%" at this task; machine-made labels, multi-agent QA and math | Never ask a small model to find the first bad step in a long trace | Table in v2 |
| One code per prompt beat the whole codebook (kappa 0.68 against 0.60); a written rationale raised kappa (0.59 to 0.68); GPT-3.5 averaged 0.34; gold set of 111 passages; a human-in-the-loop tag-for-review workflow is feasible with frontier models | Dunivin, EPJ Data Science 2025 | One question per call, rationale and quote required, hold-out validation, re-validate on a model change | Text |
| Models of 1B to 3B ran locally through Ollama and produced JSON notes; the A-Mem row used 1,126 tokens per question against 16,910 for the full-context baseline | A-Mem, arXiv 2502.12110 (v11); single runs, no error bars, one conversational dataset | A short JSON schema is a plausible local task; tag quality was never audited | Table |
| A classifier fed only user messages and tool calls did better than one fed assistant text and tool results ("a drop in performance on our overeagerness testset"); stage 1 8.5 percent false positives and 6.6 percent misses, full pipeline 0.4 and 17 percent on 52 real overeager actions; "not a drop-in replacement for careful human review on high-stakes infrastructure" | Anthropic, auto mode, 2026-03-25 | Show authorization-type questions the user's words and the tool calls only; filter first, reason second; the human samples the unflagged | Text |
| People shown an AI suggestion first followed it even when wrong; deciding first reduced overreliance; the person plus AI stayed below the AI alone | Buçinca et al., arXiv 2102.09692 | The reviewer's flags and the sample's reasons appear after the human's note | Abstract and table |
| People's criteria changed as they graded | Shankar et al., arXiv 2404.12272 | Expect the reviewer's questions to need rewriting as the codebook moves | Text |
| A frontier model labeled developer-agent episodes with judge accuracy 0.82 and inter-rater agreement 0.78 among raters (v2). Earlier notes said 0.81 and 0.83 | Tang et al., arXiv 2605.29442 v2 | A reference for how well a strong model does on a hard annotation. A 9B pushback classifier got 0.67 on four classes and 0.79 on two in SWE-chat (not re-opened) | v2 text |
| Constrained decoding took 0.6B to 4B models from 78.6 to 92.9 percent schema-valid to 100 percent; content accuracy stayed scale-dependent; five models, 14 tasks | Chavan, arXiv 2609.23742 (supporting) | Constrain the JSON schema in Ollama, and do not mistake valid output for a correct answer | Abstract |
## Change Log
*2026-10-30.* Restaged into A and B on the owner's decision. The postmortem's finding 3 had proposed cutting the local reviewer; the second pass found that Husain and Shankar's updated guidance supports an agent-assisted pass after 30 hand annotations, and the owner chose a Claude pass now and a local model later. Evidence rows were re-checked; the Tang agreement figures were corrected from 0.81 and 0.83 to 0.82 and 0.78 (v2); the Anthropic quote now carries its qualifier; T4 moved out of the review path. The 2026-10-22 pilot is stage B, unchanged except for its gate.
## Non-Goals
No fine-tuning (the tuned 8B in AgenTracer used about 2,000 labeled trajectories and eight H100 GPUs, and NVIDIA's position paper cites 10,000 to 100,000 examples, far beyond one person's sessions), no autonomy, and no step toward the reviewer editing the setup.
