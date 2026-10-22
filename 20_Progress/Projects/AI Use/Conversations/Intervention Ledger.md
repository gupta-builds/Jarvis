---
type: system
status: sprout
created: 2026-10-22
updated: 2026-10-22
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
Every change to the setup is an experiment with a stated check. A line added to CLAUDE.md is not assumed to help: the one controlled study of context files ([Gloaguen et al.](https://arxiv.org/abs/2602.11988)) found LLM-generated ones raised cost 20 to 23 percent (developer-written ones up to 19 percent) without a significant gain in success, and the official best practices say to prune a line unless removing it would cause mistakes. This ledger is where each change earns its place or leaves.
## Rules
- One change per week, so any movement in the numbers can be attributed (the weekly setup review's own rule; its beginner mistake is five changes at once).
- Write the metric, the baseline, and the review date before making the change. The metric is a rate per 100 prompts for a code in [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]], or a count from the digest.
- Test the change in a fresh session before logging it as in force.
- Review on the stated date: `keep`, `revert`, `extend`, or `inconclusive`. Inconclusive means fewer than about 30 relevant prompts passed (a working rule, not from a source); wait one more period.
- Never edit a finished row. A correction is a new row that names the one it corrects.
- Fix home, in this order of preference: a hook when a specific tool action must always be checked (it enforces; a rule only advises); one CLAUDE.md line for a fact that applies every time and cannot be inferred from the code; a skill for a routine you repeat; a subagent for work that floods context or needs fresh eyes; a habit for everything else.
## Log
| Date | Change (what, where) | Type | Code targeted | Hypothesis | Metric and baseline | Review date | Result | Decision |
|---|---|---|---|---|---|---|---|---|
