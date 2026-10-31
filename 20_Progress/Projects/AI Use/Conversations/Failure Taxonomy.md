---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - codebook
project_kind: spec
next: Code the first 30 prompts blind in the first weekly review (P5), then replace the seeded codes in this note with the ones that actually appeared.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
---
# Failure Taxonomy
## What This Is
==A codebook of what goes wrong in a prompt, seeded from published categories and meant to be replaced by your own after the first thirty prompts are coded.==
This is the vocabulary for the `codes[]` field in [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]. It is version 0. Two sources say a codebook written before reading the data does not survive it: Shankar et al. saw 5 of 9 practitioners reinterpret criteria as they graded ("criteria drift"), and Husain and Shankar have the human annotate at least 30 traces freely before any taxonomy or agent suggestion. Tang et al. reached saturation after three rounds of coding. The seed below is a starting guess, written down so the first review has something to argue with.
## Seeded codes
S1 to S7 are Tang et al.'s symptom categories from 20,574 real sessions in 1,639 repositories (arXiv 2605.29442, checked against v2, revised 2026-08-31). The percentages are shares of misalignment episodes in their data, a different base from ours, and they are context, never a target. Claude Code is 6,648 of their sessions, with a median of 5 user turns. E1 to E5 are this vault's own.

| Code | Name | Definition | Overall | IDE | CLI | Detected by | Ledger metric |
|---|---|---|---|---|---|---|---|
| S1 | Wrong project diagnosis | The agent misreads the codebase or vault state | 11.56% | 12.78% | 9.30% | human | human note |
| S2 | Misread intent | The agent answers a different question than the one asked (a question treated as a command, or the reverse) | 26.95% | 28.39% | 24.31% | human; the next prompt's pushback is a hint | human note |
| S3 | Constraint violation | An explicit rule from you or CLAUDE.md is broken | 38.33% | 32.26% | 49.49% | human; second reviewer checks a stated rule against the tool calls | human note |
| S4 | Overreach | The agent does more than asked: extra files, extra changes | 10.20% | 11.50% | 7.80% | human; rule: files written outside the prompt's stated target | digest count where the rule exists |
| S5 | Faulty implementation | The change is wrong or incomplete | 17.82% | 22.89% | 8.49% | human | human note |
| S6 | Execution error | A command or tool fails because of how the agent ran it | 2.87% | 2.09% | 4.32% | rule: tool error with no change of approach | digest count per 100 prompts |
| S7 | False self-report | The agent says it is done or that something passed when it did not, or no check ran | 22.58% | 20.36% | 26.66% | rule: `claims_done` with `verified_after_last_edit` false; human confirms | digest count per 100 prompts |
| E1 | Retry loop | The same or a near-identical tool call three or more times in a row | n/a | n/a | n/a | rule | digest count per 100 prompts |
| E2 | Context bloat | A large tool result kept in context, a file read twice, or a session run far past its useful length | n/a | n/a | n/a | rule: result size, repeated reads, `context_tokens_start` | digest count per 100 prompts |
| E3 | Instruction not loaded | A rule that should have applied was not in context (not loaded, path-scoped and lost to compaction, or past the memory line limit) | n/a | n/a | n/a | rule: `loaded_instruction_files` against the file you expected | digest count per 100 prompts |
| E4 | Permission friction | Repeated denials or approvals that stalled the work | n/a | n/a | n/a | rule: `PermissionDenied` rows (auto mode only; manual approvals are not captured) | digest count per 100 prompts |
| E5 | Capture gap | The record itself is missing or wrong for this prompt | n/a | n/a | n/a | rule: no fact rows for a prompt in the transcript | digest count, watched by the watchdog |
| OK | No problem | The prompt went as intended | | | | human | |
Tang's eighth bucket, "Other or emerging", is 0.34 percent; their data has no S8 equivalent in this vault. Each prompt gets zero or more codes and one first-failure note in your own words, written before reading anything a script or a model flagged (see [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]).
## What the published numbers say about this codebook
- Constraint violations (S3) and inaccurate self-reporting (S7) grew in share over time in Tang et al., and misalignment persisted across adjacent sessions in the same repository. That supports watching S3 and S7 week over week and keeping CLAUDE.md rules checkable.
- CLI sessions skew to S3 (49.49 percent against 32.26 in IDE) and S7 (26.66 against 20.36); IDE sessions skew to S5 (22.89 against 8.49). Your sessions are CLI, so S3 and S7 are the codes to expect first. They are expectations to test, not rates to hit.
- SWE-chat (arXiv 2604.20779, v2) found users push back in 50 percent of all turns and that only 59 percent of agent-written code survives into commits. So a flag that fires on any pushback word will fire on about half of all prompts. The pushback hint for S2 is useful only when read with the previous assistant action, and the digest counts it without sampling by it.
- Tang counts only pushback-visible episodes, so S1 and S5 failures you never pushed back on are invisible to their method and to this codebook's pushback hint. Random prompts in every sample are the only cover for that.
## Rules for changing this note
- A code is added when two prompts in a review do not fit anything, and removed when three reviews in a row never use it.
- When a definition changes, the prompts already coded with it are re-read once. Shankar et al. observed people grading to stay consistent with earlier grades and not because the output was bad, which is how a stale definition spreads.
- Literature-derived percentages are never compared with your own rates.
- A code gets a ledger metric as a digest count per 100 prompts only if a rule detects it over all prompts. A code detected only by reading is judged in the monthly review as notes. Reason: a rate from about 25 coded prompts a week has an interval of about 11 points at a 20 percent rate (1.96 times the square root of 0.2 × 0.8 / 50 for two weeks).
- The second reviewer is only ever asked about one code at a time ([[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]).
## Change Log
*2026-10-30.* Percentages checked against the full text of Tang et al. v2: every figure in the 2026-10-22 table was right (the seed note had said they were unconfirmed; they are in Table 3 of v2). Added IDE and CLI columns, the Ledger metric column and the SWE-chat base rate (second pass). Rule and metric wording follows postmortem findings 2 and 5.
## Non-Goals
Not a scoring rubric and not a list of things to automate. Several codes (S1, S2, S5) stay human-only.
