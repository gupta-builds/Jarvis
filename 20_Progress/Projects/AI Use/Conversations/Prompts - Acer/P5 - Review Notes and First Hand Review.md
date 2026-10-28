---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - prompt
project_kind: prompt
task: weekly-review-notes-and-first-review
model: claude-sonnet-5-5
---
# P5 - Review Notes and First Hand Review
Run by Sonnet 5.5 inside the directory: `D:\_Anant\20_Progress\Documents\Jarvis`
Suggested effort: medium. This phase has a human step in the middle; the prompt stops there.
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
Status of this draft: written before P0 to P4 ran. Run after P2 (so the notes are clean and in the right folders). It can run in parallel with P6 and P7 because the first four weekly reviews are done by hand. Refresh the facts below from the P2 and P4 reports.
## Prompt - P5 Review Notes and First Hand Review
````
<role>
You are preparing and recording the owner's first weekly review of their own Claude Code sessions. The owner does the judging. You prepare the material, keep out of the way during their blind pass, and record what they decide.
</role>

<context>
The weekly review is the part of the loop that makes the owner's sessions better. It works like this, in the owner's own protocol (20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol.md): read about 25 of the week's prompts yourself, write one or two sentences about the first thing that went wrong in each before any model speaks, code each with the Failure Taxonomy, make exactly one change to how you work with Claude Code, and log the change with the check that will say whether it helped. The reason for writing first is evidence: in a controlled study (Buçinca et al., N=199) people who decided before seeing an AI suggestion over-relied on wrong suggestions less (0.64 down to 0.48) than people shown the suggestion with an explanation.

Verified on 2026-10-22: the Note Type Registry sends AI weekly reviews to 60_Claude/30_Reviews/AI/Scheduled/Weekly/ using 30_Order/Templates/AI Toolkit/AI Weekly Review Template.md and the Review Standard (30_Order/Standards/Enrich/Review Standard.md). The Standard fixes eight headings: Period Covered, Sources Reviewed, What Ran This Period, Sync & Capture Health, Findings, Decided Fixes, Open Questions, Next Period's Watch List. The protocol's bespoke nine-heading note, saved in 60_Claude/30_Reviews/AI/Conversations/, does not match; the registry wins. The only existing weekly review is "AI Tools Weekly Review" for 2026-W34 and its file name contains an em dash, which the vault's writing rules ban, so new names use a hyphen. 20_Progress/Projects/AI Use/Conversations/Intervention Ledger.md and Failure Taxonomy.md exist (the ledger has no rows; the taxonomy is version 0). The session notes have a "## You" section per typed prompt (redacted); they do not contain slash-command turns or tool-error flags.

To verify first: that after P2 the Acer notes are in their project folders with review_state: raw, and that a "## You" section is enough to code a prompt (open three notes' You sections and decide).
</context>

<goal>
One real weekly review note for the week that just ended, built from the AI Weekly Review Template with no invented headings, containing the sample, the owner's own first-failure notes and codes, the one change, and a row in the Intervention Ledger. The protocol's mapping onto the eight headings is written down. Minutes spent per step are recorded, because they decide the weekly time budget.
</goal>

<constraints>
- Scope: Claude Code sessions on the Acer, all project folders under 60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/ (Jarvis, The Plan, Home, UMN Courses and any other).
- Blind first. Do not write codes, first-failure notes or any judgment about a sampled prompt before the owner has written theirs, and do not describe a prompt as good or bad anywhere in the sample sheet. The point is that the owner's judgment is independent.
- The one change in step 8 is the owner's choice. Apply it only when they tell you to, then log it. Do not add a CLAUDE.md line, skill or hook on your own.
- Write only: the weekly note, the Intervention Ledger row, dated Corrections in Weekly Review Protocol.md, and the Log line in Conversation Layer.md. Use the template as it is.
- Never open .credentials.json, .env files, or history.jsonl.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, update updated:. Do not run git commit or git push.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step. The owner's blind pass in step 5 is the planned stop.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result. End with a short recap.
</progress_updates>

<steps>
1. Read the template, the Review Standard, the W34 review and the protocol. In the protocol's "The weekly note" section add a dated Corrections entry mapping each protocol element to the eight headings: the sample sheet and sources under Sources Reviewed; skills, subagents and MCP tools used under What Ran This Period; the capture coverage under Sync & Capture Health; codes, first-failure notes, reconciled flags, bloat and the output check under Findings; the one change, with a link to its ledger row, under Decided Fixes; time spent and unresolved questions under Open Questions; the next review date under Next Period's Watch List. If something has no home, stop and ask.
2. Pick the week. If today is on or after Sunday 2026-10-25, use 2026-W43 (Monday 19 to Sunday 25 October). Before that, use the last complete week, 2026-W42 (Monday 12 to Sunday 18 October). Confirm the dates with a date calculation before you use them.
3. Create the weekly note from the template with status: seed in 60_Claude/30_Reviews/AI/Scheduled/Weekly/ named "AI Tools Weekly Review - <year>-W<number>". Fill Period Covered. In Sources Reviewed list the session notes you opened.
4. Build the sample sheet inside Sources Reviewed. Pick about 10 prompts at random across all project folders for that week, with the random seed written in the table caption, and up to 15 flagged prompts chosen by rules you can compute from the notes. Allowed rules, each written in the note beside its results: the next prompt starts with a correction word such as no, don't, wrong, "not what"; the turn is in the top tenth by tokens in its note; the final reply says done or passes and no Bash or PowerShell call follows the last Edit or Write; the turn has the most tool calls in its session. Give each row a link to the session note, the turn number, and the reason it was picked.
5. Stop and hand over. Tell the owner exactly what to do in plain words: read each sampled prompt and what happened, write one or two sentences about the first thing that went wrong, assign codes from the Failure Taxonomy, 15 to 20 minutes, in the Findings section. Wait for them.
6. When they return, copy their notes into Findings as written, count the codes, and run taxonomy upkeep with them: any prompt that fit no code, any definition that shifted. Fill What Ran This Period and the Sync & Capture Health numbers by hand from the notes and 60_Claude/05_Clippings/AI Conversations/00 - Capture Health.md.
7. Output check: ask the owner to open five things Claude wrote more than a week ago and say how much they changed each. Record their answers under Findings.
8. Ten-minute setup review: ask "what did you correct twice this week?". Help them choose the home for the fix: a hook for a check on one specific tool action, one CLAUDE.md line for a fact that applies every time and cannot be read from the code, a skill for a routine, a subagent for work that floods the window or needs fresh eyes, otherwise a habit. Add one row to the Intervention Ledger with the metric, the baseline from this week's coded rate per 100 prompts, and a review date two weeks out. If nothing recurred, write that and change nothing.
9. Ask the owner for the minutes each step took and record them under Open Questions.
</steps>

<verification>
Before you finish, re-open the weekly note and check: it uses exactly the template's eight headings; every table row links to a real note; the ledger row has a change, a metric, a baseline and a review date; and nothing in the note was judged before the owner's words. Report any check that fails.
</verification>

<report>
Reply with: the mapping table; the sample rules and counts (random and flagged) with the seed; after the owner's pass, the code counts, the change made, the ledger row, and minutes per step; and anything in the notes that made coding hard (a missing field, a dropped turn), since that feeds the event hook and digest phases. Under 350 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]], [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]], [[30_Order/Standards/AI Loop/Review System|Review System]].
