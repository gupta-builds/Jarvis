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
task: weekly-digest
model: claude-sonnet-5-5
---
# P7 - Weekly Digest
Run by Sonnet 5.5 inside the directory: `D:\_Anant\20_Progress\Documents\Jarvis`
Suggested effort: medium.
Follow this prompting guide to lay it out correctly: `https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/prompting-claude-sonnet-5-5`
Status of this draft: refreshed on 2026-10-30 from the design postmortem and the second pass. Do not run it until P5 has reported what made coding hard and P6 has produced at least three days of real fact rows. Refresh the flag list and sections from P5's "cannot tell from the note" list. It replaces the 2026-10-22 draft, which defaulted to one complete week, asked for a coverage line that equals `history.jsonl`, and listed the sample with its reasons.
## Prompt - P7 Weekly Digest
````
<role>
You are writing the script that prepares the owner's weekly review: it turns a week of recorded fact rows into a note of counts, flags and a review sample. It judges nothing and uses no model.
</role>

<context>
Layer L1 of Conversation Loop Design.md (rewritten 2026-10-30). The weekly review in Weekly Review Protocol.md opens with a digest: counts per rule flag per 100 prompts, the prompts that started with the largest context, the largest tool results, files read twice, which skills, subagents and MCP tools were used and which never were, which instruction files loaded, one coverage line, and a shuffled review sample. Flags and codes are defined in Failure Taxonomy.md (rewritten): S4 where a rule exists, S6 execution error, S7 false self-report, E1 retry loop, E2 context bloat, E3 instruction not loaded, E4 permission friction, E5 capture gap. P6's fact rows and Per-Prompt Record.md define the input. The digest syncs between the owner's two laptops, so it holds ids, counts and vault-relative links only.

Verified 2026-10-30:
- Generated Output Standard (30_Order/Standards/Generated Output Standard.md) wants type: generated, generator, gen_kind (report fits), no status, optional review_state; the generated zone path is undecided, so placement checks are waived. The AI weekly review note it feeds is made in P5 and P8 from the AI Weekly Review Template.
- A Sunday 21:00 run covers a week that is still ending. So every run rebuilds BOTH the current ISO week (marked "provisional through <run time>") and the previous one (final). Output is overwritten in place, one writer per note.
- Coverage: the hook's UserPromptSubmit rows will exceed the typed prompts in history.jsonl, because it also fires for scheduled tasks and /loop iterations, background subagent reports and messages from other sessions. The target is: every typed prompt counted per session and day in history.jsonl has at least one row, and every extra row is given a source class (typed, scheduled, subagent_report, other_session, unknown) from the transcript's origin and promptSource fields. Whether a typed built-in command such as /clear fires UserPromptSubmit is settled by P6.
- Headless claude -p runs kill async hooks at teardown (19 of 150 transcripts on this Acer are headless). A prompt with no fact rows is folded from its transcript and marked folded. Do not treat it as an error unless the transcript also lacks it.
- Expected-empty skips: 10 export_result lines say "transcript not found" and all follow a SessionEnd with reason resume or other. Classify these as expected, not as capture gaps.
- C:\Users\anant\.claude\jarvis-session-activity.jsonl begins with a byte-order mark on its first line; strip it before parsing.
- Over a coded sample of 25 prompts a rate is too noisy to judge; ledger metrics for a code with a rule are the digest's counts per 100 prompts over ALL prompts of the period, so print the count and the number of prompts together.
- agent_lines_kept_7d is cut: 874 of 974 commits in 30 days are 30-minute Auto-sync snapshots. Do not compute it.
- Privacy: a prompt from The Plan is named by session id only. No title, no link, no file path, no quote. For The Plan print counts, not paths. Other projects may print vault-relative paths.

Inputs from earlier phases (refresh): the fact-row field list pinned by P6; the sample rules P5 used by hand and its list of what made coding hard; the owner's weekly-note mapping.
</context>

<goal>
A tested script that, given an ISO week (default: the current and the previous one), writes the digest to 60_Claude/30_Reviews/AI/Conversations/Digests/ with the sections above, a shuffled review sample (about 10 random prompts with a printed seed plus up to 15 flagged) with NO reason column, and a separate key file that lists the reason for each sampled id. Ids and links only. Same input and seed give byte-identical output. A week with no rows produces a plain "no events" digest, and a coverage gap is the first line.
</goal>

<constraints>
- No prompt text, no assistant text, no pasted content, no The Plan titles or paths in any output. Reason: it syncs.
- history.jsonl is read only to count typed prompts per session and day. Never copy a line, never print one.
- Tolerate missing fields and list the Claude Code versions seen. Deterministic, no network, no model call, finish two weeks in under 30 seconds (a working ceiling).
- One writer per generated note: overwrite the week's digest and key in place. Thresholds for flags live in an editable JSON config, each with a comment saying it is a working rule.
- The sample sheet shows only a number, a link (or session id for The Plan) and the turn number. The key file is a separate generated note headed "open after your own notes".
- Build in 30_Order/System/claude-workflow/scripts/ with tests beside it. Do not edit Standards, Templates or Workflows. Never open .credentials.json or .env files. Do not run git commit or git push.
- Notes you patch: no em dashes, no blank line after a heading, path-qualified wikilinks.
- When the work the user asked for is done and checked, stop and report. Don't add features, tests, files, docs or refactors that weren't asked for. If you think one would help, mention it at the end instead of doing it.
- Keep working until everything the user asked for is done, and only stop to ask when you can't go on without the user or before a risky step.
</constraints>

<progress_updates>
Before your first tool call, say in one sentence what you are about to do. After each numbered step, write one line with the result. End with a short recap.
</progress_updates>

<steps>
1. Define each flag as code with thresholds in the config. E1: the same tool with a near-identical target three or more times in a row. E2: the largest tool results, files read twice, context size per prompt. E3: InstructionsLoaded rows against an editable list of files expected per project. E4: PermissionDenied rows (auto mode only; say so in the digest). E5: no fact rows for a prompt that exists in the transcript. S6: a tool error with no change of approach. S7: claims_done (a regex list in an editable JSON file) with verified_after_last_edit false (any Bash or PowerShell row with a test, lint or build command after the last Edit or Write row of the same prompt). The pushback hint: a pushback word in the next prompt AND a re-edit of the same target within two prompts, because SWE-chat found pushback in 50 percent of turns and a bare keyword would flag half of everything.
2. Write the script. Choose the language (Node suits the event file) and say why in one line.
3. Write the sections in this order: coverage line (typed prompts counted against prompts with rows, extra rows by source class, folded prompts, expected-empty skips); counts per rule flag per 100 prompts with n, and the prompt ids; five largest starting contexts; ten largest tool results; files read twice; tool errors per tool with interrupts counted apart; skills, subagents and MCP tools used and never used (from the installed lists under .claude); instruction files loaded; compactions and permission denials; versions seen; the missed-week gap line and the streak; the review sample.
4. Tests: a synthetic fact-row file with known flags and a golden digest and key; idempotence; missing fields; an empty week; a week with a gap; a BOM on the activity log's first line; an expected-empty skip; a folded prompt; a The Plan prompt (assert that no title, path or quote appears); the provisional label on the current week.
5. Validate on real rows: give the owner ten sampled prompts with the digest's counts beside them so they can check by hand. Do not mark them equal yourself.
6. Time the run on two weeks of rows.
7. Patch Weekly Review Protocol (a dated Change Log line pointing at the digest path), Capture Scripts (a card), and add the Log line to Conversation Layer.md.
</steps>

<verification>
When you change code that can be run, built, or type-checked, run a real check that exercises the change before reporting it done: the project's tests, type-checker, or build, or the changed command itself. A syntax-only check, or a check command that failed to start, does not count; if all that is missing is the project's declared dependencies, install them with its own package manager and lockfile, never via sudo or the system package manager, unless told not to. Only if no real check can run here, say which one you did not run and why instead of reporting the change as done. Here the real checks are the tests, the golden files, the idempotence run, the The Plan masking test, and the timing.
</verification>

<report>
Reply with: the flag definitions and thresholds; test output; the run time; the path of one real digest and its key; the ten-prompt comparison table for the owner; and what the digest could not compute and what you propose. Under 350 words.
</report>
````
## Run Record
- Ran:
- Result:
- Reviewed by owner:
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]], [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]], [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]].
