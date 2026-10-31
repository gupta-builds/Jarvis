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
next: Run the first weekly review by hand (P5) for 2026-W43 (Monday 2026-10-19 to Sunday 2026-10-25), coding 25 prompts blind from the existing session notes before any digest or event hook exists.
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
==Once a week you read about 25 of the week's prompts yourself, decide what went wrong in your own words before anything else speaks, make exactly one change to how you work with Claude Code, and log the change with the check that will say whether it helped.==
**The goal is better output, not a better score.** Better output means fewer corrections you have to repeat, less of what Claude wrote that you end up rewriting, and a shorter path from a prompt to a result you accept. Counts and rates here are thermometers for that, never targets.
**Time.** The first four weeks take about 60 minutes, because the codebook and the first labeled prompts are being built. After that, 30 to 40. P5 records the real minutes per step and replaces these numbers. **If a week has only ten minutes, do step 8 alone**; that fallback keeps the habit alive and counts as a review. Buçinca et al. found the decide-first design was the least liked by participants, so expect the blind pass to be the step you want to skip.
**Volume.** On the Acer, Claude's finished replies (Stop events) were 56 in 2026-W43 and 110 in W44 through 2026-10-30. A sample of 25 is therefore 45 percent of a W43-size week and about 20 percent of a W44-size week. The sample size is a working number, not a result.
## Before the digest exists (the first four weeks, by hand)
The digest (P7) and the event hook (P6) are built after the first review, on purpose: what makes coding hard in the real notes decides what they must record.
1. List the week's session notes from `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/<project>/` (the five folders: Jarvis, The Plan, Home, UMN Courses, Scratch) by `started_at` in the frontmatter. For W43 that is 14 notes. The `## You` sections hold your prompts (redacted) and the `### Tool Calls` lists hold what Claude did.
2. Know what the notes lack: slash-command turns, thinking, tool-error flags and subagent work are not in them ([[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]]). A code you cannot read from a note is recorded as "cannot tell from the note", which is itself input to P6.
3. Do steps 2 to 9 below by hand. The format of the eventual record is in [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]].
## Steps
1. **Open the digest (2 min).** A generated note with counts per rule flag per 100 prompts, the largest contexts, unused skills and subagents, the instruction files that loaded, and one coverage line: typed prompts counted in `history.jsonl` per session and day against prompts with fact rows, and every extra row classed as typed, scheduled, subagent report, other-session or unknown. A coverage gap is a finding before anything else, because a review of a partial record misleads.
2. **Build the sample (3 min).** About 10 random prompts and up to 15 flagged ones, drawn into **one shuffled sheet with no reason column**. The reasons (which were random, which were flagged and why) go in a separate key that you do not open until step 4. Reason: if the sheet says "the next prompt pushed back", your note on that prompt is no longer independent. Random prompts are always included because people rubber-stamp what is left unflagged (93 percent of manual approval prompts were accepted in Anthropic's data).
   - Flag rules allowed for the by-hand weeks, each computable from the notes: the next prompt starts with a correction word (no, don't, wrong, "not what"); the turn is in the top tenth by tokens in its note; the final reply says done or passes and no Bash or PowerShell call follows the last Edit or Write; the turn has the most tool calls in its session. Write the seed of the random draw next to the key.
3. **Blind pass (15 to 20 min).** For each prompt on the sheet, read what happened and write one or two sentences about the **first** thing that went wrong, then assign codes from [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]. Do not open the key, a digest flag or a second-reviewer flag. For the first 30 prompts you ever review, no model is involved at all (Husain and Shankar: annotate at least 30 yourself before any agent suggests more). Writing first is a cognitive forcing function: in Buçinca et al. (N=199) deciding before seeing the AI cut overreliance on wrong suggestions from 0.64 to 0.48 against plain explanations.
4. **Reveal and reconcile (5 min).** Open the key, then, once the second reviewer exists ([[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]], stage A), its flags with their quotes. Accept or reject each. A flag you reject on a prompt you coded OK is calibration data; a failure you coded that was not flagged is the other half.
5. **Taxonomy upkeep (3 min).** Did two prompts fit no code? Did a definition shift while you graded? If so, change the note and re-read the prompts coded under the old wording once.
6. **Bloat, toolkit and notes read (5 min).** From the digest: the five prompts that started with the largest context; the biggest tool results; files read twice; compactions; which skills, subagents and MCP tools were used and which never were; which instruction files loaded, and whether the one you expected was among them.
7. **Output check (5 min).** Open five things Claude wrote more than a week ago (notes or code). For each, how much did you change afterward? Pick them by hand or at random. There is no computed survival rate (that field was cut, see Per-Prompt Record). A high rewrite rate on a kind of output is a finding about the output, whatever the codes say.
8. **The ten-minute setup review (10 min). Locked.** Ask one question: **what did I correct twice this week?** (If the answer is not obvious, take the most frequent code from step 3.) Then:
   - Pick the home for the fix: one CLAUDE.md line for a fact that applies every time and cannot be read from the code; a skill for a routine you repeat; a subagent for work that floods the window or needs fresh eyes; a hook for a check on one specific tool action (a hook covers only the tools its matcher names, so an `Edit|Write` hook does not see a file written by a shell command).
   - Make **one** change.
   - Test it in a fresh session by repeating the prompt that failed.
   - Write one row in [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]: change, code targeted, hypothesis, metric and baseline, review date. For a code with a digest rule the metric is the digest count per 100 prompts over all prompts; for a code detected only by reading, the metric is a note, not a rate.
   - If the mistake returns, the rule was too vague or the check needs a hook. If CLAUDE.md keeps growing, move routines to skills and prune: before adding a line, ask whether removing it would cause mistakes. Gloaguen et al.: context files raised cost by over 20 percent on average and did not generally improve success, though they help for non-standard practices that cannot be read from the code.
   - If nothing recurred this week, change nothing and write that.
9. **Close (2 min).** One line in the session log ([[30_Order/Standards/AI Loop/Memory Management|Memory Management]]): prompts reviewed, codes used, the change made, minutes spent, the next review date.
## The weekly note
The registry wins. The note is the **AI Weekly Review** from `30_Order/Templates/AI Toolkit/AI Weekly Review Template.md`, saved in `60_Claude/30_Reviews/AI/Scheduled/Weekly/` as `AI Tools Weekly Review - 2026-W43` (a hyphen, because the existing W34 file name has an em dash the writing rules ban), `status: seed`. The template has eight headings, fixed. Where each protocol element goes:

| Protocol element | Heading in the note |
|---|---|
| Week, frame size, notes opened | Period Covered |
| Sample sheet, seed, the key, digest or notes opened; anything not opened | Sources Reviewed |
| Skills, subagents, MCP tools, slash commands used | What Ran This Period |
| Coverage line, hook outcomes, capture gaps | Sync & Capture Health |
| Your first-failure notes and codes, reconciled flags, bloat, the output check | Findings |
| The one change, with a link to its ledger row | Decided Fixes |
| Minutes per step, anything unresolved, as `- [ ]` tasks | Open Questions |
| Next review date, what to watch | Next Period's Watch List |
**The Plan rule.** The weekly note is synced and pushed. A prompt from The Plan is named by session id only, with no title, link, file name or quote, and its first-failure note stays generic ("answered a different question than asked"). If you cannot write it without private detail, skip it, take another random prompt, and write the skip under Open Questions.
**A missed week** is written down, not hidden: the next note's Period Covered says which week was skipped and the digest shows the streak (Review System: a review not run is a gap to record).
## Optional: `/insights`
Claude Code's built-in `/insights` writes an HTML friction report for up to 200 sessions it has not seen to `~/.claude/usage-data/report.html` and keeps a timestamped copy. It is a built-in command that the person types; a skill cannot run it. The folder does not exist on the Acer yet, so the command has never been run here, and it counts against plan usage. Run it in the monthly review (see [[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]), copy the report into the vault, and use it as an input to step 8, never as the decision.
## Do not
- Do not change more than one thing in a week. Five changes and you cannot tell which one helped.
- Do not read a key, a flag or a model suggestion before writing your own note on the prompt.
- Do not add a CLAUDE.md line for something Claude already does correctly.
- Do not let any model write or edit a rule.
- Do not repair the capture layer here. Infrastructure goes to the Build Plan.
## What each step rests on
| Step | Source | What it contributes | Checked 2026-10-30 |
|---|---|---|---|
| 2, 3 | [Husain and Shankar](https://hamel.dev/blog/posts/evals-faq/why-is-error-analysis-so-important-in-llm-evals-and-how-is-it-performed.html), page modified 2026-09-01 | Note the first failure; annotate at least 30 traces yourself before an agent suggests more; a working pool of about 100. Practitioner guidance, no experiments. The page does not say "random in every batch"; that rule is this design's, from Anthropic and Shankar | Yes, text read |
| 3 | [Buçinca et al. 2021](https://arxiv.org/abs/2102.09692) | Forcing designs (one is decide first) cut overreliance from 0.64 to 0.48 against plain explanations; N=199, a nutrition task, 75 percent accurate simulated AI; participants liked the best designs least; the benefit was larger for people high in need for cognition | Yes, Table in v1 |
| 3, 5 | [Shankar et al. 2024](https://arxiv.org/abs/2404.12272) | Criteria drift: 5 of 9 participants reinterpreted existing criteria as they graded | Yes (P2, P5, P6, P8, P9) |
| 2, 4 | [Anthropic, auto mode](https://www.anthropic.com/engineering/claude-code-auto-mode), 2026-03-25 | 93 percent of manual approvals accepted; a cheap first stage then a careful second; "not a drop-in replacement for careful human review on high-stakes infrastructure" | Yes; the qualifier was missing from earlier notes |
| 6 | [AgentDiet](https://arxiv.org/abs/2509.23586) | In an average SWE-bench Verified trajectory (48.4K tokens, 40 steps) tool messages used 30.4K tokens, about 63 percent. Benchmark runs, not long interactive sessions | Yes |
| 8 | [Gloaguen et al.](https://arxiv.org/abs/2602.11988) v3 | Context files raised cost by over 20 percent on average and did not generally improve success. LLM-generated files raised cost 20 and 23 percent on two benchmarks; developer-written files raised it by at most 19 percent and improved performance for every agent except Claude Code. Instructions in them are followed; repository overviews do not help | Yes, full text of v3 |
| 8 | [Weekly setup review](https://whatsurvivesinai.substack.com/p/claude-code-step-8-weekly-review), 2026-10-07 | The ten-minute procedure and the one-change rule; one observed run; the author sells a starter pack | Yes |
## Change Log
*2026-10-30.* Rewritten; the 2026-10-22 text is in git. Changes: the sample sheet is one shuffled list with the reasons in a separate key (second pass, from Buçinca's forcing-function logic and the P5 prompt, which would have printed the reason beside each prompt); the weekly note is the registry's eight-heading note with a mapping table (postmortem 4, 7); `agent_lines_kept_7d` removed from step 7 (postmortem 2); ledger metric rule in step 8 (postmortem 5); the model-flag step now names the second reviewer's stage A (owner, 2026-10-30); The Plan rule (postmortem 9, owner); missed-week gap rule (postmortem 7); `/insights` is a manual monthly step (postmortem 6); the "random in every batch" attribution corrected (second pass).
## Non-Goals
Not a dashboard and not a performance review of Claude. The review itself never runs automatically, and no step lets a model make the decision. A scheduled script may prepare the digest and a skeleton note; that is preparation, not review.
