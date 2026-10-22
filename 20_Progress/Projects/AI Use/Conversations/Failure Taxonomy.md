---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - codebook
project_kind: spec
next: Code the first 30 prompts blind in the first weekly review, then replace the seeded codes in this note with the ones that actually appeared.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
---
# Failure Taxonomy
## What This Is
==A codebook of what goes wrong in a prompt, seeded from published categories and meant to be replaced by your own after the first thirty prompts are coded.==
This is the vocabulary for the `codes[]` field in [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]. It is version 0. Two sources say a codebook written before reading the data does not survive it: Shankar et al. watched 5 of 9 people add or reinterpret criteria as they graded outputs ("criteria drift"), and Husain's method has the human code the first traces freely before any taxonomy is fixed. Tang et al. reached saturation after three rounds of coding 100 records. So the seed below is a starting guess, written down so the first review has something to argue with.
## Seeded codes
The first seven are Tang et al.'s symptom categories from 20,574 real sessions (arXiv 2605.29442); percentages are their share of misalignment episodes, a different base from ours. The rest are this vault's own, built from the audit and the postmortem.
| Code | Name | Definition | Detected by | Origin |
|---|---|---|---|---|
| S1 | Wrong project diagnosis | The agent misreads the codebase or vault state | human | Tang, 11.6% of episodes |
| S2 | Misread intent | The agent answers a different question than the one asked (a question treated as a command, or the reverse) | human, then local model on the next prompt | Tang, 27.0% |
| S3 | Constraint violation | An explicit rule from you or CLAUDE.md is broken | human; local model checks a stated rule against the tool calls | Tang, 38.3% (49.5% in CLI sessions) |
| S4 | Overreach | The agent does more than asked: extra files, extra changes | human; rule: files written outside the prompt's stated target | Tang, 10.2% |
| S5 | Faulty implementation | The change is wrong or incomplete | human | Tang, 17.8% (22.9% in IDE sessions) |
| S6 | Execution error | A command or tool fails because of how the agent ran it | rule: tool error with no change of approach | Tang, 2.9% |
| S7 | False self-report | The agent says it is done or that something passed when it did not, or no check ran | rule: `claims_done` with `verified_after_last_edit` false; human confirms | Tang, 22.6% (26.7% in CLI sessions) |
| E1 | Retry loop | The same or a near-identical tool call three or more times in a row | rule | Meta's Wink uses the same trigger (arXiv 2602.17037, not one of the ten) |
| E2 | Context bloat | A large tool result kept in context, a file read twice, or a session run far past its useful length | rule: result size, repeated reads, `context_tokens_start` | AgentDiet's useless, redundant, and expired waste (arXiv 2509.23586) |
| E3 | Instruction not loaded | A rule that should have applied was not in context (not loaded, path-scoped and lost to compaction, or past the memory line limit) | rule: `loaded_instruction_files` against the file you expected | Claude Code context-window docs |
| E4 | Permission friction | Repeated denials or approvals that stalled the work | rule: `permission_denials` | Anthropic auto-mode post |
| E5 | Capture gap | The record itself is missing or wrong for this prompt | rule: no event lines for a prompt that exists in history | this layer |
| OK | No problem | The prompt went as intended | human | n/a |
Each prompt gets zero or more codes and one first-failure note in your own words, written before reading any model flag (see [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]).
## Rules for changing this note
- A code is added when two prompts in a review do not fit anything, and removed when three reviews in a row never use it.
- When a definition changes, the prompts already coded with it are re-read once. Shankar et al. observed people grading to stay consistent with earlier grades and not because the output was bad, which is how a stale definition spreads.
- Literature-derived percentages are never compared with your own rates. They show what other people saw, not what you should expect.
- The local model is only ever asked about one code at a time ([[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]).
## Non-Goals
Not a scoring rubric and not a list of things to automate. Several codes (S1, S5) stay human-only.
