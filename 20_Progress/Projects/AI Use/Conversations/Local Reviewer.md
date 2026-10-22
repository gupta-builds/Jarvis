---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - local-ai
project_kind: spec
next: After the first 30 prompts are coded by hand, pull two or three 7B to 14B models into Ollama and run the pilot below against that gold set.
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
==A small model running on the Acer reads one short prompt record at a time, answers one narrow question with a quoted piece of evidence, and hands its flags to the human; it never decides, never writes a rule, and earns each question by matching the human's own labels on a held-out set.==
Written 2026-10-22. No source tested a small local model on this task, so this note is a protocol for measuring one, not a claim that it works. The evidence that exists points two ways: small models do structured, narrow work on short text, and they fail at finding where a long run went wrong.
## Hardware and state
RTX 5070 Ti Laptop GPU with 12,227 MiB, 31.4 GB RAM, Ollama installed, no model pulled (checked 2026-10-22). That fits 7B to 14B models at 4 or 5 bits. Which model is a pilot outcome; the sources used Qwen3 8B, Llama 3.2 3B, Qwen2.5 1.5B and 3B, Mistral-Nemo, and a Qwen 9B, none on this task.
## What the evidence says
| Finding | Source | Use here |
|---|---|---|
| Qwen3-8B and Llama-3.2-3B locate the failing step in a long multi-agent trace 1.7% to 8.7% of the time; naming the guilty agent worked better (37% to 60%) | AgenTracer, [arXiv 2509.03312](https://arxiv.org/abs/2509.03312) (listed in the ICLR 2026 proceedings; the preprint text names no venue; machine-made labels, multi-agent QA and math) | Never ask the small model to find the first bad step in a long trace |
| One code per prompt beat the whole codebook (κ 0.68 against 0.60); requiring a written rationale raised κ (0.59 to 0.68); one scope word moved a code from 0.73 to 0.81; GPT-3.5 averaged κ 0.34; open models could not meet the task at the time; hold out a test split | Dunivin, [EPJ Data Science 2025](https://link.springer.com/article/10.1140/epjds/s13688-025-00548-8) (GPT-4 only, 111 passages) | One question per call, rationale and quote required, held-out validation, re-validate on any model change |
| Models of 1B to 3B ran locally through Ollama and produced JSON notes (keywords, tags, one-line context) that improved question answering while using roughly 12 to 15 times fewer tokens than the full-context baseline (1,126 to 1,376 against 16,910 per question); single runs, no error bars, one conversational dataset | A-MEM, [arXiv 2502.12110](https://arxiv.org/abs/2502.12110) (NeurIPS 2025 listing) | A short JSON schema is a plausible local task; the quality of the tags was never audited |
| A classifier fed only the user's messages and the agent's tool calls, with assistant prose and tool results stripped, did better than one fed everything; a cheap first stage tuned for recall (8.5% false positives on 10,000 real calls, 6.6% misses on 52 real overeager actions) followed by a reasoning stage (0.4% false positives, 17% misses on those 52); "not a drop-in replacement for careful human review" | Anthropic, [auto mode](https://www.anthropic.com/engineering/claude-code-auto-mode) | Show authorization-type questions the user's words and the tool calls only; filter first, reason second; the human still samples the unflagged |
| People shown an AI suggestion first followed it even when wrong; deciding first reduced overreliance; the AI plus person stayed below the AI alone | Buçinca et al., [arXiv 2102.09692](https://arxiv.org/abs/2102.09692) | Model flags appear after the human's own note, and unflagged prompts are sampled |
| People's criteria changed as they graded; random samples of outputs gave high variance when judging how well a check matched | Shankar et al., [arXiv 2404.12272](https://arxiv.org/abs/2404.12272) | Expect the model's questions to need rewriting as the codebook moves |
| A frontier model labeling developer-agent episodes reached 0.81 accuracy against expert labels on average (cause 0.72, severity 0.64), against 0.83 agreement between two humans | Tang et al., [arXiv 2605.29442](https://arxiv.org/abs/2605.29442) | A reference for how well a strong model does on a hard annotation; a 9B pushback classifier got 0.67 on four classes and 0.79 on two in [SWE-chat](https://arxiv.org/abs/2604.20779) (supporting) |
| Constrained decoding took 0.6B to 4B models from 78.6% to 92.9% schema-valid output to 100%, while content accuracy stayed scale-dependent; one author, 14 synthetic tasks | Chavan, [arXiv 2609.23742](https://arxiv.org/abs/2609.23742) (supporting) | Constrain the JSON schema in Ollama, and do not mistake valid output for a correct answer |
## Questions the model may be asked
| Task | Question | Input (short) | Output |
|---|---|---|---|
| T1 Pushback | Does the user's next prompt correct or reject what the assistant just did? | The assistant's final message head and the next user prompt | `{flag, quote, why}`; a pattern rule runs first |
| T2 False done | Does the final message claim the work was tested or verified? | The final message head; the rule supplies whether a check ran | `{claims, quote}` |
| T3 Constraint | Does any tool call break this stated rule? | The rule sentence and the tool-call list only | `{flag, call, why}`; start human-only |
| T4 Note tags | What are the keywords, tags, and one-line context for this session note? | The reviewed note's prompt text | JSON proposed for approval |
Not asked: where a long run first went wrong (AgenTracer), whether the output was good (S1 and S5 stay human), or anything that needs the whole transcript.
## Pilot
1. Code the first 30 prompts by hand with no model involved ([[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] step 3).
2. Have Claude Code draft the rubric for each question and propose labels for the next 70 prompts, shown to you only after you have written your own note on each. Claude Code sets up the work; its labels are not the truth.
3. Split the 100 labeled prompts: 50 to develop prompts, 50 held out and untouched until the wording is final.
4. Run the rules first and record their precision and recall. A model has to beat the rule for its question to earn a place.
5. Run each candidate model three times per question, with and without assistant prose, JSON-constrained. Record per code: precision, recall, agreement with you, the false-alarm rate on prompts you coded OK, and how often three runs disagree.
6. Evaluate on the held-out 50 once. Write the go-live bar for each question here, with the date, using what the pilot showed. This note gives no number, because no source supports one.
7. Run two shadow weeks: flags stay hidden during the blind pass and appear at step 4, and the share you accept is logged.
## Rules while it runs
- Output unparsable or missing is a logged failure row, never a silent skip.
- Every flag shows its quote; a flag without one is dropped.
- The human samples unflagged prompts every week, because people accept what a model leaves alone.
- Re-validate on any change of model, quantization, runtime, prompt, or codebook, and at the monthly calibration.
- Prompts stay on the machine. The only outside model involved is Claude Code, in step 2 of the pilot, on redacted records.
## Non-Goals
No fine-tuning (the tuned 8B in AgenTracer used about 2,000 labeled trajectories and eight H100 GPUs; NVIDIA's position paper cites 10,000 to 100,000 examples, far beyond one person's sessions), no autonomy, and no step toward the model editing the setup.
