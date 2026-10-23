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
# P4 - Review Notes and First Hand Review
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P4 - Review Notes and First Hand Review.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
The human review is the part of the loop that produces better output, and it can start before any digest or hook exists. [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] says to run the first four weeks by hand from the exported notes. This prompt fixes the weekly note's shape and home, prepares the sample, stops for the owner's blind pass, and then helps record the result. It is build B5 plus week one of the protocol.
- **Verified 2026-10-22:** the Note Type Registry sends AI weekly reviews to `60_Claude/30_Reviews/AI/Scheduled/Weekly/` using `AI Weekly Review Template` and [[30_Order/Standards/Enrich/Review Standard|Review Standard]], which fixes eight headings: Period Covered, Sources Reviewed, What Ran This Period, Sync & Capture Health, Findings, Decided Fixes, Open Questions, Next Period's Watch List. The protocol's bespoke note (nine headings, in `30_Reviews/AI/Conversations/`) does not match.
- **Verified 2026-10-22:** [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]] and [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]] exist and are empty or at version 0. The Acer holds 113 session notes whose `## You` sections hold the typed prompts, redacted. Slash-command turns and tool-error flags are not in the notes.
- **Assumed, check on three notes:** the `## You` text is enough to code a prompt without opening the transcript.
- **The existing W34 review** has an em dash between "Review" and "2026-W34" in its filename, which the writing rules ban. New weekly notes use a hyphen.
## Hard Rules
- Scope is the Acer, Windows side, tracked projects only (the list the owner confirmed in P1). Do not touch WSL, the Dell, Cowork, Cursor, or Codex.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`. Use the AI Weekly Review Template as it is. Invent no headings and no frontmatter keys.
- Never read or print `.credentials.json`, `.env*`, tokens, or `history.jsonl` text.
- **Blind first.** Do not write codes, first-failure notes, or any judgment of a prompt before the owner has written theirs. Do not mention model opinions in the sample sheet.
- The owner makes the one change in step 8. You apply it only on their explicit instruction, then log it.
- Search before creating. Write only the files named below. Nothing at the vault root. Do not run `git commit`.
- After any vault write, search for `.sync-conflict-*` copies and restore corrected text.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- Do not set the status of this prompt to `complete`.
## Implementation Order
1. Read the Review Standard, the template, the W34 review, and the protocol. In the protocol's "The weekly note" section add a dated Corrections entry mapping each protocol element onto the eight fixed headings: the digest and sample sheet under Sources Reviewed; skills, subagents, and MCP tools used under What Ran This Period; the coverage line under Sync & Capture Health; codes, first-failure notes, reconciled flags, bloat, and the output check under Findings; the one change, linked to its ledger row, under Decided Fixes; time spent and unresolved questions under Open Questions; the next review date under Next Period's Watch List. If a protocol element has no home, stop and ask.
2. Choose the review week: the ISO week that ended most recently, or the current one if the owner says so. Default for this run is 2026-W43 (Monday 2026-10-19 to Sunday 2026-10-25).
3. Create `60_Claude/30_Reviews/AI/Scheduled/Weekly/AI Tools Weekly Review - 2026-W43.md` from the template, `status: seed`. Fill Period Covered, and Sources Reviewed with the exported notes opened.
4. Build the sample sheet as a table inside Sources Reviewed: about 10 prompts chosen at random with a seed written in the table caption, plus up to 15 flagged by rules you can compute from the notes, each with a link to the session note, the turn number, and the reason it was picked. Allowed flag rules, all written in the note: the next prompt starts with a correction word ("no", "don't", "wrong", "not what"); the turn's tokens are in the top decile; the final message says "done" or "passes" and no Bash or PowerShell call follows the last Edit or Write; the turn has the most tool calls in its session. Show no model flags.
5. **Stop.** Tell the owner exactly what to do: read each sampled prompt and what happened, write one or two sentences about the first thing that went wrong, assign codes from the Failure Taxonomy, 15 to 20 minutes, in the Findings section. Wait.
6. When the owner returns: copy their notes verbatim into Findings, count codes, run taxonomy upkeep (any prompt that fit no code, any definition that shifted), and fill What Ran This Period and the Sync & Capture Health numbers by hand from the notes and Capture Health.
7. Output check: the owner opens five things Claude wrote more than a week ago and says how much they changed. Record their answers under Findings.
8. Ten-minute setup review: ask the owner "what did you correct twice this week?", help choose the home for the fix (hook, one CLAUDE.md line, skill, subagent, or habit), and add one row to the Intervention Ledger with the metric, the baseline from this week's coded rate per 100 prompts, and a review date two weeks out. If nothing recurred, write that.
9. Record minutes spent per step in Open Questions. They decide the weekly time budget.
## Report Back
- The mapping table from step 1.
- The sample sheet rules as written, the seed, and the counts picked (random and flagged).
- After the owner's pass: code counts, the change made, the ledger row, and minutes per step.
- Anything in the exported notes that made coding hard (a missing field, a dropped turn) as input for P5 and P6.
## What Not To Do
- Do not pre-label prompts to be helpful. It breaks the blind pass.
- Do not edit CLAUDE.md or add a skill without the owner's choice in step 8.
- Do not move the weekly note to `30_Reviews/AI/Conversations/`.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]], [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]], [[30_Order/Standards/AI Loop/Review System|Review System]].
