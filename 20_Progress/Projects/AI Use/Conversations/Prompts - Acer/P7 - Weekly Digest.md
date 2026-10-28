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
task: weekly-digest
model: claude-sonnet-5-5
---
# P7 - Weekly Digest
Run by Sonnet 5.5 inside the directory: `D:\_Anant\20_Progress\Documents\Jarvis`
Suggested effort: medium.
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
Status of this draft: designed before P0 to P6 ran. Do not run it until P6 has produced at least three days of real event rows and P5 has shown what the hand review needed. Refresh the flag list and sections from P5's "what made coding hard" notes and P4's decisions.
## Prompt - P7 Weekly Digest
````
<role>
You are writing the script that prepares the owner's weekly review: it turns a week of recorded events into a note of counts, flags and a review sample. It judges nothing and uses no model.
</role>

<context>
Layer L1 of Conversation Loop Design.md. The weekly review in Weekly Review Protocol.md opens with a digest: counts per rule flag, the prompts that started with the largest context, the largest tool results, files read twice, which skills, subagents and MCP tools were used and which never were, which instruction files loaded, and one coverage line comparing the prompts typed (history.jsonl line counts) with the prompts that have event rows. Flags and codes are defined in Failure Taxonomy.md: S6 execution error, S7 false self-report, E1 retry loop, E2 context bloat, E3 instruction not loaded, E4 permission friction, E5 capture gap. P6's event rows and Per-Prompt Record.md define the input. The digest syncs between the owner's two laptops.

Verified 2026-10-22: Generated Output Standard (30_Order/Standards/Generated Output Standard.md) wants type: generated, generator, gen_kind (report fits), no status, optional review_state; the generated zone path is undecided, so placement checks are waived. The AI weekly review note it feeds is made in P5 and P8 from the AI Weekly Review Template. transcript_path may lag the live turn, so context sizes for today's prompts can be one turn stale.

Inputs from earlier phases (refresh): the event field list pinned by P6; the sample rules P5 used by hand; P4's decision on agent_lines_kept_7d (deferred unless kept).
</context>

<goal>
A tested script that, given an ISO week, writes the week's digest to 60_Claude/30_Reviews/AI/Conversations/Digests/ with the sections above and the review sample (about 10 random prompts with a printed seed plus up to 15 flagged), as ids and links only. Same input and seed give byte-identical output. A week with no events produces a plain "no events" digest, and a coverage gap is the first line.
</goal>

<constraints>
- No prompt text, no assistant text and no pasted content in the digest: ids, counts, paths relative to the vault, and links to session notes only. Reason: it syncs.
- history.jsonl is read only to count prompts per session and day. Never copy a line.
- Tolerate missing fields and list the Claude Code versions seen. Deterministic, no network, no model call, finish a week in under 30 seconds (a working ceiling).
- One writer per generated note: overwrite the week's digest in place. Thresholds for flags live in an editable JSON config, each with a comment saying it is a working rule.
- Build in 30_Order/System/claude-workflow/scripts/ with tests beside it. Do not edit Standards, Templates or Workflows. Never open .credentials.json or .env files. Do not run git commit or git push.
- Notes you patch: no em dashes, no blank line after a heading, path-qualified wikilinks.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result. End with a short recap.
</progress_updates>

<steps>
1. Define each flag as code with thresholds in the config. E1: the same tool with a near-identical target three or more times in a row. E2: the largest tool results, files read twice, context size per prompt. E3: InstructionsLoaded rows against an editable list of files expected per project. E4: permission denials. E5: no event rows for prompts counted in history.jsonl. S6: a tool error with no change of approach. S7: claims_done with verified_after_last_edit false.
2. Write the script. Choose the language (Node suits the event file) and say why in one line.
3. Write the sections in this order: coverage line; counts per flag with prompt ids; five largest starting contexts; ten largest tool results; files read twice; tool errors per tool with interrupts counted apart; skills, subagents and MCP tools used and never used (from the installed lists under .claude); instruction files loaded; compactions and permission denials; versions seen; the review sample.
4. Tests: a synthetic events file with known flags and a golden digest; idempotence; missing fields; an empty week; a week with a gap.
5. Validate on real events: give the owner ten sampled prompts with the digest's counts beside them so they can check by hand. Do not mark them equal yourself.
6. Time the run on a week of events.
7. Patch Weekly Review Protocol steps 1 and 2 with a dated entry pointing at the digest path, Capture Scripts with a card, and add the Log line to Conversation Layer.md.
</steps>

<verification>
When you change code that can be run, built, or type-checked, run a real check that exercises the change before reporting it done: the project's tests, type-checker, or build, or the changed command itself. A syntax-only check, or a check command that failed to start, does not count; if all that is missing is the project's declared dependencies, install them with its own package manager and lockfile, never via sudo or the system package manager, unless told not to. Only if no real check can run here, say which one you did not run and why instead of reporting the change as done. Here the real checks are the tests, the golden file, the idempotence run, and the timing.
</verification>

<report>
Reply with: the flag definitions and thresholds; test output; the run time; the path of one real digest; the ten-prompt comparison table for the owner; and what the digest could not compute and what you propose. Under 350 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]], [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]].
