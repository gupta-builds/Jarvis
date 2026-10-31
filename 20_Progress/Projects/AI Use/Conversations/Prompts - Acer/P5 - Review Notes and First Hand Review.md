---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
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
Status of this draft: refreshed on 2026-10-30 after the design postmortem and the owner's decision that the hand review comes **before** the event hook and digest. Run it next. It needs no new code and builds nothing. It replaces the 2026-10-22 draft, which printed "the reason it was picked" beside each sample row and so spoiled the blind pass.
## Prompt - P5 Review Notes and First Hand Review
````
<role>
You are preparing and recording the owner's first weekly review of their own Claude Code sessions. The owner does the judging. You prepare the material, keep out of the way during their blind pass, and record what they decide.
</role>

<context>
The weekly review is the part of the loop that makes the owner's sessions better. It works like this, in the owner's own protocol (20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol.md, rewritten 2026-10-30): read about 25 of the week's prompts yourself, write one or two sentences about the first thing that went wrong in each before anything else speaks, code each with the Failure Taxonomy, make exactly one change to how you work with Claude Code, and log the change with the check that will say whether it helped. The reason for writing first is evidence: in a controlled study (Buçinca et al., N=199) people who decided before seeing an AI suggestion over-relied on wrong suggestions less (0.64 down to 0.48) than people shown the suggestion with an explanation. The same study found people liked that design least, so keep the session short and make the ten-minute fallback easy to take.

Verified on 2026-10-30:
- The week is 2026-W43, Monday 2026-10-19 to Sunday 2026-10-25. It is complete. The Acer wrote 56 Stop events that week (finished Claude replies) and 14 session notes started in it (turn_count sum 138). Confirm the dates with a date calculation.
- The Acer notes are in five folders under 60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/: Jarvis, The Plan, Home, UMN Courses, Scratch. Pick by started_at in the frontmatter. A "## You" section holds the owner's prompts (redacted); "### Tool Calls" holds what Claude did, and the notes also embed tool results in fences. The notes do not contain slash-command turns, thinking, subagent work or tool-error flags, so some codes cannot be read from a note. When that happens write "cannot tell from the note" and keep a list of every such case: it decides what the event hook and digest must record.
- The registry sends the AI weekly review to 60_Claude/30_Reviews/AI/Scheduled/Weekly/ using 30_Order/Templates/AI Toolkit/AI Weekly Review Template.md (eight fixed headings: Period Covered, Sources Reviewed, What Ran This Period, Sync & Capture Health, Findings, Decided Fixes, Open Questions, Next Period's Watch List). The Weekly Review Protocol has the mapping table of protocol elements to those headings. The only existing weekly review is "AI Tools Weekly Review - 2026-W34" with an em dash in its file name; new names use a hyphen.
- The Intervention Ledger has no rows. Failure Taxonomy is version 0.
- The Plan rule: the weekly note is synced and pushed. A prompt from The Plan is named by session id only, with no title, link, file name or quote, and its note stays generic. If the owner cannot write a note without private detail, skip that prompt, take another random one, and write the skip under Open Questions.
- The activity log C:\Users\anant\.claude\jarvis-session-activity.jsonl begins with a byte-order mark on its first line. Count lines by event with a reader that strips it.
</context>

<goal>
One real weekly review note for 2026-W43, built from the AI Weekly Review Template with no invented headings, containing a shuffled sample sheet (no reasons shown), the owner's own first-failure notes and codes, the one change (or a recorded "nothing recurred"), and a row in the Intervention Ledger. Minutes per step are recorded, because they decide the weekly time budget. A list of what made coding hard is handed back for the event hook and digest phases.
</goal>

<constraints>
- Scope: Claude Code sessions on the Acer for 2026-W43, all five project folders.
- Blind first. The sample sheet is ONE shuffled list with no reason column, no "random" or "flagged" label, no code and no description of a prompt as good or bad. Do not write codes, first-failure notes or any judgment about a sampled prompt before the owner has written theirs. The reasons (which prompts were random, which were flagged and by which rule) and the random seed go in a collapsed callout headed "Key, open after your notes" inside Sources Reviewed. Tell the owner not to open it until step 6.
- The one change in step 9 is the owner's choice. Apply it only when they tell you to, then log it. Do not add a CLAUDE.md line, skill or hook on your own.
- Write only: the weekly note, the Intervention Ledger row, and the Log line in Conversation Layer.md. Use the template as it is. If the Weekly Review Protocol's mapping table needs a correction, add one dated line to its Change Log and say so in the report.
- Never open .credentials.json, any .env file, or history.jsonl. Do not print transcript text beyond the owner's redacted "## You" lines needed for the sheet.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, update updated:. Do not run git commit or git push.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step. The owner's blind pass in step 5 is the planned stop.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result. End with a short recap.
</progress_updates>

<steps>
1. Read the template, the Review Standard, the W34 review and the rewritten protocol, including its mapping table. Confirm the mapping covers every protocol element (the sheet and sources under Sources Reviewed; skills, subagents and MCP tools under What Ran This Period; coverage and hook outcomes under Sync & Capture Health; codes, first-failure notes, reconciled flags, bloat and the output check under Findings; the one change under Decided Fixes; minutes and unresolved questions under Open Questions; the next review date under Next Period's Watch List). If something has no home, stop and ask.
2. Confirm the week with a date calculation. List the session notes whose started_at falls in 2026-10-19 to 2026-10-25 across the five folders (expect 14). Record the frame: notes, turns, and Stop events per day from the activity log.
3. Create the weekly note from the template with status: seed in 60_Claude/30_Reviews/AI/Scheduled/Weekly/ named "AI Tools Weekly Review - 2026-W43". Fill Period Covered and the frame.
4. Build the sample sheet inside Sources Reviewed. Draw about 10 prompts at random across all folders with a seed you write in the key, plus up to 15 flagged ones chosen by these rules computed from the notes: the next prompt starts with a correction word (no, don't, wrong, "not what"); the turn is in the top tenth by tokens in its note; the final reply says done or passes and no Bash or PowerShell call follows the last Edit or Write; the turn has the most tool calls in its session. If the frame has fewer than 25 usable prompts, take all of them and say so. Shuffle the combined list. Each row: a number, a link to the session note (The Plan rows: session id only), the turn number, and nothing else. Put the key in the collapsed callout.
5. Stop and hand over. Tell the owner in plain words: read each sampled prompt and what happened, write one or two sentences about the first thing that went wrong, assign codes from the Failure Taxonomy, 15 to 20 minutes, in the Findings section; do not open the key. Ask them to note the minutes. Wait for them.
6. When they return, copy their notes into Findings as written, then open the key together and reconcile: for each prompt, was it random or flagged and did their note agree with the flag? Count the codes. Run taxonomy upkeep with them: any prompt that fit no code, any definition that shifted. Write the list of "cannot tell from the note" cases.
7. Fill What Ran This Period (skills, subagents, MCP tools, slash commands, from the notes) and Sync & Capture Health (coverage: notes against the Stop events; export_result counts by status for the week from the activity log) by hand.
8. Output check: ask the owner to open five things Claude wrote more than a week ago and say how much they changed each. Record their answers under Findings.
9. Ten-minute setup review: ask "what did you correct twice this week?". Help them choose the home for the fix: a hook for a check on one specific tool action, one CLAUDE.md line for a fact that applies every time and cannot be read from the code, a skill for a routine, a subagent for work that floods the window or needs fresh eyes, otherwise a habit. Add one row to the Intervention Ledger with the metric (a digest count per 100 prompts for a code with a rule; a written question for a code detected only by reading), the baseline, and a review date two weeks out. If nothing recurred, write that and change nothing.
10. Ask the owner for the minutes each step took and record them under Open Questions, with whether the blind pass felt too long.
</steps>

<verification>
Before you finish, re-open the weekly note and check: it uses exactly the template's eight headings; every table row links to a real note (The Plan rows excepted); the sheet has no reason column and the key is collapsed; the ledger row has a change, a metric, a baseline and a review date; no The Plan title, link, file name or quote appears; and nothing in the note was judged before the owner's words. Report any check that fails.
</verification>

<report>
Reply with: the frame (notes, turns, Stop events); the sample counts (random and flagged) and the seed; after the owner's pass, the code counts, the agreement between their notes and the flags, the change made, the ledger row, and minutes per step; the list of "cannot tell from the note" cases and anything else that made coding hard (a missing field, a dropped turn, a slash command you could not see), since that feeds the event hook and digest phases. Under 350 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]], [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]], [[30_Order/Standards/AI Loop/Review System|Review System]], [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]].
