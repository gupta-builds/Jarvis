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
next: Run the first weekly review by hand from the existing exported notes, coding the first 30 prompts blind, before any digest script exists.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
---
# Weekly Review Protocol
## What This Is
==Once a week you read about 25 of the week's prompts yourself, decide what went wrong in your own words before any model speaks, make exactly one change to how you work with Claude Code, and log the change with the check that will say whether it helped.==
**The goal is better output, not a better score.** Better output means fewer corrections you have to repeat, less of what Claude wrote that you end up rewriting, and a shorter path from a prompt to a result you accept. Counts and rates in this protocol are thermometers for that, never targets.
**Time.** The first four weeks take about 60 minutes, because the codebook and the first labeled prompts are being built. After that, about 30 to 40 minutes. **If a week has only ten minutes, do step 7 alone**; that fallback keeps the habit alive.
**Before any script exists** (builds B3 and B4 in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]): take the week's session notes from `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/` and the typed prompts from the notes' `## You` sections, and do steps 1 to 8 by hand. The format of the record is in [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]].
## Steps
1. **Open the digest (2 min).** A generated note with counts per code, the largest contexts, the rule flags, unused skills and subagents, the instruction files that loaded, and one coverage line: prompts found in `history.jsonl` against prompts that have a record. A coverage gap is a finding before anything else, because a review of a partial record misleads.
2. **Pick the sample (3 min).** About 10 random prompts and up to 15 flagged ones (retry loop, large context, tool errors, a "done" with no check after the last edit, a next prompt that pushes back, the longest turns). Random prompts are always included: people rubber-stamp whatever a model leaves unflagged (93% of manual approval prompts were accepted in Anthropic's own data), and random samples are how unflagged problems get found.
3. **Blind pass (15 to 20 min).** For each prompt, read what happened and write one or two sentences about the **first** thing that went wrong, then assign codes from [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]. Do not open any model flag yet. For the first 30 prompts you ever review, no model is involved at all. Writing first is a cognitive forcing function. In Buçinca et al. (N=199) three such designs, one of which had people decide before seeing the AI, cut overreliance on wrong suggestions from 0.64 to 0.48 compared with simply showing explanations, which did not help at all.
4. **Reveal and reconcile (5 min), once the local reviewer is validated.** Open the model's flags with their quoted evidence. Accept or reject each. A flag you reject on a prompt you coded OK is calibration data; a prompt you coded as a failure that the model missed is the other half.
5. **Taxonomy upkeep (3 min).** Did two prompts fit no code? Did a definition shift while you graded? If so, change the note and re-read the prompts coded under the old wording once.
6. **Bloat, toolkit, and notes read (5 min).** From the digest: the five prompts that started with the largest context; the biggest tool results; files read twice; compactions; which skills, subagents, and MCP tools were used and which never were; which instruction files loaded, and whether the one you expected was among them.
7. **Output check (5 min).** Open five things Claude wrote more than a week ago (notes or code). For each, how much did you change afterward? The digest lists the share of agent-written lines still unchanged after seven days. A high rewrite rate on a kind of output is a finding about the output, whatever the codes say.
8. **The ten-minute setup review (10 min). Locked.** Ask one question: **what did I correct twice this week?** (If the answer is not obvious, take the most frequent code from step 3.) Then:
   - Pick the home for the fix: one CLAUDE.md line for a fact that applies every time and cannot be read from the code; a skill for a routine you repeat; a subagent for work that floods the window or needs fresh eyes; a hook for a check on one specific tool action (a hook covers only the tools its matcher names, so an `Edit|Write` hook does not see a file written by a shell command).
   - Make **one** change.
   - Test it in a fresh session by repeating the prompt that failed.
   - Write one row in [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]: change, code targeted, hypothesis, metric and baseline, review date.
   - If the mistake returns, the rule was too vague or the check needs a hook. If CLAUDE.md keeps growing, move routines to skills and prune: before adding a line, ask whether removing it would cause mistakes.
   - If nothing recurred this week, change nothing and write that.
9. **Close (2 min).** One line in the session log ([[30_Order/Standards/AI Loop/Memory Management|Memory Management]]): prompts reviewed, codes used, the change made, the next review date.
## The `/insights` layer
Claude Code's built-in `/insights` writes an HTML report of friction points for up to 200 unseen sessions into `~/.claude/usage-data/`, and the 30-day sweep deletes it. Once the loop is running, a Jarvis skill runs `/insights` as part of the weekly and monthly review and copies the report into the vault first. It is the manual and review layer and an input to step 8, never the decision. One published use is [Matthew Hansen's](https://www.blundergoat.com/articles/claude-code-insights-roasted-my-ai-workflow): from a 64-session report he wrote five CLAUDE.md rules, two skills, and a hook set; he did not re-run it to measure the effect, which is why a change here goes through the ledger.
## The weekly note
One note per ISO week in `60_Claude/30_Reviews/AI/Conversations/`, named `Weekly 2026-W43` and so on, with these headings: Period Covered, Coverage (prompts expected, prompts recorded), Sample (random and flagged counts), Codes (counts and links to the first-failure notes), Flags Reconciled, Bloat and Toolkit, Output Check, Change Made (link to the ledger row), Next Review. The shape is not final until the postmortem of this design lands and `30_Order` is rewritten.
## Do not
- Do not change more than one thing in a week. Five changes in one week and you cannot tell which one helped.
- Do not read a model flag before writing your own note on the prompt.
- Do not add a CLAUDE.md line for something Claude already does correctly.
- Do not let the local model write or edit a rule.
- Do not repair the capture layer here. Infrastructure goes to the build plan.
## What each step rests on
| Step | Source | What it contributes |
|---|---|---|
| 2, 3 | [Husain and Shankar](https://hamel.dev/blog/posts/evals-faq/why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.html) | Open-code the first failure in a trace, review around 100 traces, keep random ones in every batch (practitioner guidance, no experiments) |
| 3 | [Buçinca et al. 2021](https://arxiv.org/abs/2102.09692) | Forcing designs (one is decide first) cut overreliance from 0.64 to 0.48 versus plain explanations; N=199, a nutrition task, so the design rule transfers and the numbers do not |
| 3, 5 | [Shankar et al. 2024](https://arxiv.org/abs/2404.12272) | Criteria drift in 5 of 9 participants, so the codebook changes as you grade |
| 2, 4 | [Anthropic, auto mode](https://www.anthropic.com/engineering/claude-code-auto-mode) | 93% of manual approvals accepted; a cheap filter then a careful pass; the classifier is not a replacement for careful human review |
| 6 | [AgentDiet](https://arxiv.org/abs/2509.23586) | Tool results were about 63% of tokens in an average trajectory |
| 8 | [Gloaguen et al.](https://arxiv.org/abs/2602.11988) | Test every context-file change; additions cost steps |
| 8 | [Weekly setup review](https://whatsurvivesinai.substack.com/p/claude-code-step-8-weekly-review), Oct 2026 | The ten-minute procedure and the one-change rule (one observed run, adopted as procedure) |
## Non-Goals
Not a dashboard and not a performance review of Claude. It does not run automatically, and no step lets a model make the decision.
