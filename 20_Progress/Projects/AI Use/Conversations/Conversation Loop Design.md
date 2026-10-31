---
type: project
status: active
created: 2026-10-22
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - design
project_kind: spec
next: The postmortem is written (Conversation Loop Design Postmortem, 2026-10-30). Get the owner's answers to its Open Questions, then run P5 (hand review) before P6 to P8 as changed in the Corrections below and in the Build Plan.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]"
---
# Conversation Loop Design
## What This Is
==A weekly habit in which you read a sample of your own Claude Code prompts, write down what went wrong before any model speaks, make one change to the setup, and check next time whether it helped; scripts and a small local model only collect, flag, and count.==
Written 2026-10-22. The design is **locked pending a postmortem**: the choices below are settled unless the pre-implementation postmortem breaks one, and the status stays `active` until then. It is for Claude Code only, on the Acer first, with Obsidian as the place the review happens. The earlier idea of a recursive, self-improving loop is dropped. **The goal is better output, not better scores.** Rates in this design are thermometers for that, never targets.
## Current State
The old capture layer had one part of a loop: a sensor. It wrote 630 session notes and nothing read them ([[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]] finding 5). A loop needs a sensor, a metric, a decision, an actuator, and a check that the change worked. This design supplies the other four, and puts the human at the decision.

| Part | Old layer | This design |
|---|---|---|
| Sensor | Stop and SessionEnd hooks exporting a note per session | A per-event hook writing one JSON line per prompt, tool call, and stop, plus a coverage count against `history.jsonl` |
| Metric | Token and cost totals, inflated 2.2 to 2.5 times | Counts per failure code, context size, rewrite rate of agent-written text, with the cost fix (B1) |
| Decision | None | The person, weekly, blind first |
| Actuator | None | One change per week: a CLAUDE.md line, a skill, a subagent, a hook, or a habit |
| Check | None | [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger\|Intervention Ledger]] row with metric, baseline, and review date |
The raw material is measured, not assumed: [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]] lists what runs and what is written per prompt and per tool call today.
## The layers
| Layer | What it is | Who or what runs it | Cost per use | Built in |
|---|---|---|---|---|
| L0 Capture | Hook writes one event line per prompt, tool call, tool failure, stop, and instruction load, keyed by `prompt_id`; a heartbeat line; failure rows when parsing fails | A small Node script on each machine, `async`, no model | Milliseconds, zero tokens | B3 |
| L1 Digest | A weekly generated note: counts per rule flag, largest contexts, tool-result sizes, files read twice, skills and subagents used or never used, instruction files loaded, a coverage line | A script run by hand or by schedule, no model | Zero tokens | B4 |
| L2 Local reviewer | A 7B to 14B model in Ollama answers four narrow questions with a quote each and hands flags to the human | Ollama on the Acer, behind a pilot | Local compute only | B6 |
| L3 Weekly review | About 25 prompts read blind, one change, one ledger row | The person | 60 minutes, then 30 to 40 | B5 |
| L4 Monthly review | Judge changes, re-code the taxonomy, calibrate the local reviewer, prune, check capture | The person | About 90 minutes | B5 |
| L5 `/insights` skill | A Jarvis skill runs `/insights` in the weekly and monthly review and copies the report out before the 30-day sweep | Claude Code, started by the person | One report per run | B7 |
The record each layer shares is defined in [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]; the vocabulary the person codes with is [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]].
## The ten-minute setup review (locked)
Step 8 of the weekly review, and the fallback when only ten minutes exist:
1. Ask: **what did I correct twice this week?** If it is not obvious, take the most frequent code from the blind pass.
2. Pick the home for the fix: a hook for a check on one specific tool action, one CLAUDE.md line for a fact that applies every time and cannot be read from the code, a skill for a routine, a subagent for flooding or fresh eyes, a habit otherwise.
3. Make **one** change.
4. Test it in a fresh session by repeating the prompt that failed.
5. Write one ledger row.
6. If nothing recurred, change nothing and write that.
The procedure comes from a weekly setup review published in October 2026 (one observed run, no measured outcome); the ledger is what turns it into evidence of your own. Matthew Hansen's `/insights` case is the model for L5: a friction report turned into rules, skills, and hooks. It is built after the loop runs, because a report with no ledger behind it cannot be checked.
## Why the human reviews this way
- **Write before you see.** Buçinca et al. (N=199): showing an AI suggestion and explanation did not reduce overreliance; designs that made people decide first did (0.64 to 0.48). Model flags appear only after your own note.
- **Sample the unflagged.** Anthropic found users accepted 93% of manual approval prompts, and its own classifier missed 17% of real overeager actions. Random prompts are in every sample.
- **Let the codebook move.** Shankar et al. watched 5 of 9 people change their criteria as they graded. The taxonomy is a living note with a change rule, and criteria drift is handled at the monthly step.
- **Code the first failure.** Practitioner guidance on error analysis (Husain and Shankar) and the extraction method in Tang et al. both anchor a code to a quoted piece of evidence, and look at the first thing that went wrong, not the last.
## Why the local model is limited
Nothing published tests a small local model on coding-session records. The adjacent evidence says narrow and short: Dunivin's one-code-per-call with a rationale and a hold-out set, A-MEM's small models writing JSON note fields, Anthropic's classifier seeing only user messages and tool calls. And it says not long: AgenTracer's small models found the failing step in a long trace 1.7% to 8.7% of the time. So the model is asked four questions ([[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]), each is earned on a held-out set of your own labels, and none ever edits a rule. Claude Code sets up the first runs and drafts the rubrics; the labels that count are yours.
## Decisions
| Locked now | Why |
|---|---|
| Human decides; scripts count; local model flags | Output quality is a judgment that no cited source lets a small model make |
| Blind pass before any flag | Buçinca et al. |
| One change per week with a ledger row | Attribution; Gloaguen et al. found added context cost 20% or more with no significant gain |
| Raw events stay on the machine (`30_Order/System/claude-workflow/logs/events-<machine>.jsonl`, already ignored by git and Syncthing); only generated digests and review notes sync | Prompts hold pasted content (104 of 432 `history.jsonl` lines); sync conflicts already cost corrections once |
| Hook scripts are deterministic and model-free | A hook with a model call adds latency to every tool call (AgentDiet: a typical trajectory is about 40 steps) |
| Codes seeded from Tang et al. (S1 to S7) and AgentDiet's waste kinds, plus a few of ours | A starting vocabulary, edited by review |
| `/insights` is a Jarvis skill built after the loop runs | Needs the ledger to be checkable |
### Still open
| Open | Owner or pilot decides |
|---|---|
| `cleanupPeriodDays` value | Owner (B0); the default sweep is 30 days |
| Events location per machine versus synced | Owner; per machine is proposed |
| Legacy `Windows/` trees and Cowork | Owner |
| Which local models to pull and the go-live bar per question | Pilot, B6 |
| Weekly time budget | Owner; 60 minutes for four weeks is proposed |
| Order of the `/insights` skill against the pilot | Owner |
## Gaps the postmortem found, and how this design answers them
| Finding | Answer here |
|---|---|
| 2, 3 Silent failure; the hook hides its failures | Heartbeat line, failure rows, coverage line in the digest, dead-man's switch (B8) |
| 4 Three implementations of one job | One event hook and one digest script; the old exporters stay as the archive until the owner decides |
| 5 No reader | The weekly review is the reader; the digest is its input |
| 7 Raw copy is not durable | `cleanupPeriodDays` raised (B0); events JSONL holds what the review needs |
| 8 Wrong or absent metrics | Dedup fix (B1); counts per code and per prompt |
| 11 Failure modes that survive repair | Sync conflicts, partial coverage, and drift appear in the risk list below |
| 12 Documented risks | 1.5-second SessionEnd budget (`async`, `timeout`), unstable transcript format (read the hook's `transcript_path`, never depend on field names), unswept `history.jsonl` |
| 1, 6, 9 Layout and coverage claims | Not addressed here; owner decisions on legacy trees and platforms |
## Risks this design adds
| Risk | Mitigation |
|---|---|
| Review fatigue: the loop dies in week three | A ten-minute fallback that keeps the habit; the digest shows streaks, not scores |
| False confidence in the local model | Held-out validation, quotes required, unflagged samples, re-validation on any change |
| Criteria drift makes weeks incomparable | Taxonomy change log; re-read prompts coded under an old wording |
| Hook overhead on every tool call | `async: true`, a short script, measured in B2 before B3 ships |
| Sync conflicts on frequent rewrites | Raw events not synced; one writer per generated note |
| Prompt privacy | Events stay local; Claude Code sees only redacted records in the pilot |
| Storage growth | Events are small lines; the `projects/` folder is already 606 MB and is a B0 question |
| Telemetry or transcript format changes on a release | Pin the field list in a test; coverage line catches silent drops |
| Feeling of progress without better output | The output check in step 7 and the ledger's metric rule |
## Non-Goals
Recursive self-improvement, automatic rule writing, a score or leaderboard for sessions, fine-tuning, other platforms (Codex, Cowork, WSL), and any model decision about whether output was good.
## Corrections
*2026-10-30, from [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design Postmortem|Conversation Loop Design Postmortem]]. The sections above are kept as written. The lock stands except where an item below says otherwise; `status` stays `active` until the owner answers the postmortem's Open Questions.*
- **L0 Capture (postmortem finding 1).** Rows are keyed by session, agent (`main` or `agent_id`), and `prompt_id` or null, not by `prompt_id` alone, because the docs say it is absent until the first user input. The hook only appends facts: `claims_done` and `verified_after_last_edit` move to the digest, since async sibling rows may not be written when `Stop` fires. Raw events keep no prompt text (length, `pasted`, command name only). A prompt with no rows is folded from the transcript at digest time. The ignore lines for the events file are added before the first write; the "Locked now" row's "already ignored by git and Syncthing" is wrong for a new file (`git check-ignore` exits 1). `claude -p` runs kill async hooks, so they are tested once and treated as possibly missing.
- **L1 Digest (finding 2).** The coverage line is not equality with `history.jsonl`. It reads: every typed prompt counted per session and day has at least one row, and every extra row carries a source class from the transcript (`origin`, `promptSource`). `agent_lines_kept_7d` is cut: 874 of 974 commits in 30 days are 30-minute `Auto-sync` snapshots, so lines cannot be traced to prompts. The output check stays the five hand-opened files. The digest holds ids and links only, and covers the last complete ISO week by default.
- **L2 Local reviewer (finding 3).** Cut from the build path. T1 and T2 become digest rules, T3 stays human-only, T4 is dropped. [[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]] stays as a deferred protocol, reopened only if about 8 weekly reviews show a recurring code that no rule flags. The "Why the local model is limited" section stands as the reason.
- **L3 Weekly review (finding 4).** Kept. The first review runs before the event hook is built, minutes per step are recorded, and the weekly note is the registry's eight-heading note. A skipped week is recorded as a gap.
- **L4 Monthly review (finding 5).** For a code with a digest rule, the ledger metric is the digest count per 100 prompts over all prompts of the period, not the coded sample of about 25 a week (a 95 percent interval of about 11 points at 50 prompts). Human-coded codes (S1, S2, S3, S5) are judged as notes. `inconclusive` is the expected outcome. The calibration step goes with L2.
- **L5 `/insights` (finding 6).** The skill is cut. A skill is a prompt and cannot run a built-in command; `~/.claude/usage-data` does not exist on the Acer. The monthly review keeps a manual step: type `/insights`, copy the report into the vault. The report is swept at `cleanupPeriodDays` (60 on the Acer), not at the 30 days stated above. The "Order of the `/insights` skill against the pilot" question is closed: neither is on the path.
- **Schedule and nudge (finding 7).** The weekly digest is a scheduled script that prepares input; the review stays human. The task starts when available; the nudge appears in a toast and in `/startday` while the newest weekly note is a skeleton, and a missed week appears in the next digest as a gap. Review System's sentence "Nothing runs on its own" is reworded in P10.
- **Test and acceptance (finding 8).** The loop is accepted as working after 4 consecutive weekly notes (or 3 and a recorded gap) and one judged ledger row. "Output improved" is claimed only for a rule-count metric over all prompts. P11 adds a seeded drill of three known-bad prompts.
- **Platform and machine scope (finding 9).** The "Prompt privacy" risk row ("Events stay local") is incomplete: the exporter already puts The Plan's redacted sessions into git. Scripts live in the vault; registration is user-level, made by a script from the vault, because The Plan, Home and UMN Courses sit outside it. Codex and Cursor stay after P12, with platform-neutral event fields. In "Still open", `cleanupPeriodDays` is answered (60 on the Acer), events are per machine, and the time budget waits for P5.
