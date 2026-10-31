---
type: system
status: sprout
created: 2026-10-22
updated: 2026-10-30
tags:
  - system
  - log
  - conversations
system_kind: log
log_shape: row
feeder: The person, at step 8 of each weekly review (the ten-minute setup review), by hand.
order: newest-last
scope: One row per change made to how Claude Code is set up or used (a hook, a CLAUDE.md line, a skill, a subagent, a permission, a habit), with the hypothesis and the check. Infrastructure repairs to the capture layer belong in the build plan, not here.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[30_Order/Standards/AI Loop/Logs|Logs]]"
---
# Intervention Ledger
Every change to the setup is an experiment with a stated check. A line added to CLAUDE.md is not assumed to help: the one controlled study of context files ([Gloaguen et al.](https://arxiv.org/abs/2602.11988), v3) found that context files did not generally improve task success while raising cost by over 20 percent on average (LLM-generated files by 20 and 23 percent on two benchmarks, developer-written files by at most 19 percent), and that instructions in them are followed while repository overviews do not help. The official best practices say to prune a line unless removing it would cause mistakes. This ledger is where each change earns its place or leaves.
## Rules
- One change per week, so any movement in the numbers can be attributed (the weekly setup review's own rule; its beginner mistake is five changes at once).
- Write the metric, the baseline, and the review date before making the change. Which metric depends on the code:
  - **A code with a digest rule** (E1, E2, E3, E4, S6, S7, and S4 where its rule exists): the digest count per 100 prompts over **all** prompts of the period. Write the baseline as the count and the number of prompts.
  - **A code detected only by reading** (S1, S2, S3, S5): the metric is a written question for the next review ("did the thing I fixed come back in the sample?"), not a rate. A rate from about 25 coded prompts a week carries an interval of about 11 points at 20 percent over two weeks.
- Test the change in a fresh session before logging it as in force.
- Review on the stated date: `keep`, `revert`, `extend`, or `inconclusive`. A movement smaller than the noise of two proportions, about 1.96 × √(2p(1-p)/n), is `inconclusive`; so is anything with fewer than about 30 prompts where the change could matter (a working rule, not from a source). `inconclusive` is the expected result in the first months. Wait one more period.
- "Output improved" is claimed only for a rule-count metric that moved by more than its noise. Otherwise the row says `inconclusive`.
- Never edit a finished row. A correction is a new row that names the one it corrects.
- Fix home, in this order of preference: a hook when a specific tool action must always be checked (it enforces; a rule only advises); one CLAUDE.md line for a fact that applies every time and cannot be inferred from the code; a skill for a routine you repeat; a subagent for work that floods context or needs fresh eyes; a habit for everything else.
- A prompt from The Plan appears in a row by session id only.
## Log
| Date | Change (what, where) | Type | Code targeted | Hypothesis | Metric and baseline | Review date | Result | Decision |
|---|---|---|---|---|---|---|---|---|
## Candidates already visible
These are observations, not rows. None has been made. The owner chooses at step 8 of a real weekly review.
- A whole-PDF `Read` filled the largest transcript on the Acer (115.9 MB, 19 base64 PDF results; code E2). The PDF guard built on 2026-10-29 was an actuator that arrived before the loop; if the owner logs it, the baseline is the count of PDF reads in the weeks before 2026-10-29, which the transcripts can still give while they live.
