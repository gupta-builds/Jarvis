---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - review
project_kind: spec
next: Hold the first monthly review at the end of November 2026, after four weekly reviews exist, using the existing Conversation Loop Review note.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]]"
---
# Monthly Review Protocol
## What This Is
==The weekly review finds problems and makes one change; the monthly review decides which changes stay, whether the vocabulary and the local reviewer still deserve trust, and what the next month is about.==
Time: about 90 minutes. It is written into [[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]], whose headings come from the current Review Standard; the mapping is in the last section. The goal is the same as the weekly one: better output, with rates as thermometers.
## Steps
1. **Read the month's four weekly notes and the ledger (10 min).** What was found, what was changed, what is due for review.
2. **Judge each change that is at least two weeks old (25 min).** For every ledger row due: take the metric's rate per 100 prompts before the change and since, and the number of relevant prompts. Decide `keep`, `revert`, `extend`, or `inconclusive`. Fewer than about 30 relevant prompts since the change is inconclusive, not a result (a working rule of this design, not a figure from a source). Where two changes touched the same code, say so; neither is attributable.
3. **Re-code the taxonomy (10 min).** Merge codes that were never told apart, split codes that hid two problems, drop codes unused for three reviews. Re-read prompts coded under a changed definition. This is where criteria drift is handled on purpose (Shankar et al. saw it in 5 of 9 people).
4. **Calibrate the local reviewer (20 min), once it exists.** Draw 50 prompts it flagged and 50 it did not. Label all 100 blind. Compute per code: precision, recall, agreement with you, the false-alarm rate on prompts you coded OK, and how stable its answers are across three runs. If a code falls below the bar written in [[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]], it goes back to human-only. Re-validate on any change of model, prompt, runtime, or codebook; smaller model variants in the same family degraded unpredictably in Dunivin's study.
5. **Prune (10 min).** Open CLAUDE.md, the rules, auto memory, and any skill from the ledger. For each line ask whether removing it would cause a mistake. Remove the ones that would not. The context-file study found each added file raised steps and cost; the cheapest line is the one not loaded.
6. **Context and cost trend (5 min).** The 95th percentile of starting context size, compactions per week, the share of tokens in tool results, and, once the token dedup fix (build B1) is in, cost per accepted task. Compare with last month, never with a published figure.
7. **Capture health (5 min).** Coverage line per week, hook alive, retention setting in force, sync-conflict copies in the capture folder, the status of each track note. This is the only place infrastructure is reviewed; fixes go to the build plan.
8. **Run `/insights` and file the report (5 min).** Copy the HTML out of `~/.claude/usage-data/` into the vault before the 30-day sweep and link it. Compare its friction list with your own codes; where it names something you did not, read two of its examples.
9. **Choose the next month's one theme (5 min).** A single code or question for the weeklies to push on.
## Mapping to the note's headings
| Heading in Conversation Loop Review | Content |
|---|---|
| Period Covered, Sources Reviewed | The four weekly notes, the ledger, the digests, the `/insights` report; name any not opened |
| What Ran This Month | Skills, subagents, MCP tools, slash commands used, from the digests |
| Sync and Capture Health | Step 7 |
| Tool Map Health Check | Not used by this loop; write "not applicable" |
| Findings | Steps 2 to 6, each citing the ledger row or digest line |
| Decided Fixes | Only the changes judged `keep` or `revert` with a stated reason |
| Open Questions | `inconclusive` rows and anything the sample could not settle |
| Next Month's Watch List | Step 9 |
## Non-Goals
Not a report to anyone else, and not an automatic job. If the month had fewer than about 150 prompts, the rates are probably too thin to judge (another working rule); say so and carry the rows forward.
