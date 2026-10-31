---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - review
project_kind: spec
next: Hold the first monthly review at the end of November 2026, after four weekly reviews exist, as an AI Tools Monthly Review note in 60_Claude/30_Reviews/AI/Scheduled/Monthly/. The 2026-10-21 Conversation Loop Review stays as the first, partial review.
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
==The weekly review finds problems and makes one change; the monthly review decides which changes stay, whether the vocabulary and the second reviewer still deserve trust, and what the next month is about.==
Time: about 75 minutes, or about 90 when the second reviewer runs (step 4). The earlier 90-minute figure summed to 95 and included a calibration step that now belongs to the second reviewer. The goal is the weekly one: better output, with rates as thermometers.
## Steps
1. **Read the month's four weekly notes and the ledger (10 min).** What was found, what was changed, what is due for review. Skipped weeks are gaps; count them.
2. **Judge each change that is at least two weeks old (25 min).** For every ledger row due, use the metric the row named.
   - **Rule-backed code** (E1, E2, E3, E4, S6, S7, and S4 where its rule exists): the digest count per 100 prompts over **all** prompts, before the change and since. Call a movement real only if it is larger than the noise of two proportions: about 1.96 × √(2p(1-p)/n) with n prompts on each side. By that arithmetic (not a figure from a source) a baseline of 10 percent moves by more than about 8, 6 or 4 points at n of 100, 200 or 400 per side, and a baseline of 20 percent by more than about 11, 8 or 6 points. A smaller movement is `inconclusive`.
   - **Human-coded code** (S1, S2, S3, S5): the weekly sample is about 25 prompts, so two weeks give 50 and a 20 percent rate carries an interval of about 11 points. Judge these as notes ("did the thing I fixed come back in the sample?"), never as a before and after rate.
   - Decide `keep`, `revert`, `extend`, or `inconclusive`. `inconclusive` is the expected outcome for most rows in the first months. Fewer than about 30 prompts where the change could matter is `inconclusive` whatever the counts say (a working rule of this design). Where two changes touched the same code, say so; neither is attributable.
3. **Re-code the taxonomy (10 min).** Merge codes that were never told apart, split codes that hid two problems, drop codes unused for three reviews. Re-read prompts coded under a changed definition. This is where criteria drift is handled on purpose (Shankar et al.: 5 of 9 practitioners reinterpreted criteria).
4. **Check the second reviewer (15 min), only while it runs.** Stage A (Claude-assisted): from the accepted-share log, read 20 accepted and 20 rejected flags with their quotes, and 20 prompts it did not flag that you coded as failures. Drop or reword any question whose accepted share is low. Stage B (local model), if it exists: draw 50 flagged and 50 unflagged prompts, label all 100 blind, and compute per code precision, recall, agreement with you, the false-alarm rate on prompts you coded OK, and stability across three runs, against the bar written in [[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]. Re-validate on any change of model, prompt, runtime or codebook.
5. **Prune (10 min).** Open CLAUDE.md, the rules, auto memory, and any skill from the ledger. For each line ask whether removing it would cause a mistake. Remove the ones that would not. Gloaguen et al.: context files raised cost by over 20 percent on average; the cheapest line is the one not loaded.
6. **Context trend (5 min).** The 95th percentile of starting context size, compactions per week, and the share of tokens in tool results. Compare with last month, never with a published figure (AgentDiet's 63 percent is a SWE-bench trajectory of 48.4K tokens in 40 steps). Cost per accepted task is dropped: the owner closed the model-price items on 2026-10-29 and does not track cost closely.
7. **Capture health (5 min).** Coverage line per week, hook alive, retention setting in force (60 days on the Acer; first full test 2026-11-27), sync-conflict copies, the watchdog's state, and any week the digest did not run. This is the only place infrastructure is reviewed; fixes go to the Build Plan.
8. **Run `/insights` and file the report (5 min).** Type `/insights` yourself (a skill cannot), copy `~/.claude/usage-data/report.html` into the vault before the retention sweep, and link it. Compare its friction list with your own codes; where it names something you did not, read two of its examples. One run analyzes up to 200 sessions it has not seen and counts against plan usage.
9. **Choose the next month's one theme (5 min).** A single code or question for the weeklies to push on.
## The monthly note
The registry wins here too. The note is the **AI Monthly Review** from `30_Order/Templates/AI Toolkit/AI Monthly Review Template.md`, saved in `60_Claude/30_Reviews/AI/Scheduled/Monthly/` as `AI Tools Monthly Review - 2026-11`, `status: seed`. `Scheduled/Monthly/` is empty today. The earlier [[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]] (`review_kind: monthly`, in `AI/Conversations/`) was the first, partial review of this layer and stays where it is as history.

| Heading in the monthly template | Content |
|---|---|
| Period Covered, Sources Reviewed | The four weekly notes, the ledger, the digests, the `/insights` report; name any not opened |
| What Ran This Month | Skills, subagents, MCP tools, slash commands used, from the digests, with a trend |
| Sync & Capture Health | Step 7 |
| Tool Map Health Check | Not used by this loop; write "not applicable" |
| Findings | Steps 2 to 6, each citing the ledger row or digest line |
| Decided Fixes | Only the changes judged `keep` or `revert`, with a stated reason |
| Open Questions | `inconclusive` rows and anything the sample could not settle, as `- [ ]` tasks |
| Next Month's Watch List | Step 9 |
The Plan rule from the weekly protocol applies: a prompt from The Plan is named by session id only.
## Change Log
*2026-10-30.* Rewritten; the 2026-10-22 text is in git. Changes: the judging rule uses digest counts over all prompts for rule-backed codes and treats human-coded codes as notes, with the interval arithmetic written out (postmortem 5); calibration became "check the second reviewer" with stage A and stage B (postmortem 3, owner 2026-10-30); `/insights` is typed by the person (postmortem 6); the cost-trend item dropped (owner, 2026-10-29); the note's home is the registry's monthly template, not `AI/Conversations/` (postmortem 4, 5); total time corrected from 90 to 75 (second pass).
## Non-Goals
Not a report to anyone else, and not an automatic job. If the month had fewer than about 150 prompts, the rates are probably too thin to judge (a working rule); say so and carry the rows forward. On this Acer 2026-W43 had 56 Stop events and W44 had 110 through 2026-10-30, so a month is likely to clear that bar.
