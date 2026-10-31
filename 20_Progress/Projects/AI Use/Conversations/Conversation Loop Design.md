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
next: Run P5 (the first weekly review by hand, no new code), then P4b (The Plan privacy fix, with the owner's approval gate), then P6 to P8 as written in the Build Plan.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design Postmortem|Conversation Loop Design Postmortem]]"
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
==A weekly habit in which you read a sample of your own Claude Code prompts, write down what went wrong before anything else speaks, make one change to the setup, and check later whether it helped; scripts only collect and count, and a second reviewer only suggests after your own notes exist.==
First written 2026-10-22, rewritten to current truth on 2026-10-30 after [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design Postmortem|the postmortem]] and a second pass that re-opened the sources and the live machine. The design is for Claude Code on the Acer (Windows) first. The Dell and the other platforms come after the Acer loop runs end to end. **The goal is better output, not better scores.** Rates here are thermometers, never targets. The original 2026-10-22 text is in git history; the change log at the bottom says what moved and why.
## Current State
Measured on the Acer on 2026-10-30. Capture works and nothing reads it yet.

| Part | What exists | What does not |
|---|---|---|
| Sensor | A Stop and SessionEnd hook writes one redacted note per session, plus an outcome line (`export_result`) for every export. Since 2026-10-28 22:36, 51 of 51 Stop and 24 of 24 SessionEnd events have an outcome line, including 5 of 5 `/clear` exits | The per-event record (L0) |
| Metric | Token totals deduplicated by message id and priced for the 5.5 models (new notes only) | Counts per code, context size, the digest (L1) |
| Decision | Nothing | The weekly review (L3). The one AI tools weekly review ever written is W34, in August |
| Actuator | Nothing | One change per week (the ten-minute review) |
| Check | An empty [[20_Progress/Projects/AI Use/Conversations/Intervention Ledger|Intervention Ledger]] | Any row |
Capture itself is 119 of 120 sessions covered (the one gap is a note deleted by a cleanup session, see the Build Plan). The raw material is measured in [[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit]] and re-measured in its Corrections.
## The layers
| Layer | What it is | Who or what runs it | Cost per use | Built in |
|---|---|---|---|---|
| L0 Capture | A hook appends one fact line per prompt, tool call, tool failure, instruction load, compaction, permission denial, stop and stop failure. Rows are keyed by session, agent (`main` or `agent_id`) and `prompt_id` or null. No prompt text, no tool output, no judgments. Heartbeat and failure rows. Local to each machine | A small Node script, async, no model | Milliseconds, zero tokens (Node starts in 57 ms at p50 and 213 ms at p95 on this Acer) | P6 |
| L1 Digest | A generated note for an ISO week: counts per rule flag per 100 prompts, largest contexts, tool-result sizes, files read twice, skills and subagents used or never used, instruction files loaded, a coverage line, and a shuffled review sample with no reasons shown. Ids and links only | A script on a schedule, rebuilding the current and the previous week each run. No model | Zero tokens | P7, P8 |
| L2 Second reviewer | Stage A: a Claude Code pass proposes more instances of your own codes after you have coded 30 prompts yourself. Stage B: a local model takes over the narrow, repetitive questions once every platform is captured and the process is written out | Claude Code at stage A; Ollama at stage B | One session per week at stage A; local compute at stage B | After P11 |
| L3 Weekly review | About 25 prompts read blind, one change, one ledger row | The person | 60 minutes for four weeks, then 30 to 40 | P5 by hand first |
| L4 Monthly review | Judge changes, re-code the taxonomy, check the second reviewer, prune, check capture | The person | About 75 minutes | After four weekly reviews |
| L5 `/insights` | The built-in command, typed by the person, with the report copied into the vault by hand | The person | One report per run, counted against plan usage | Monthly step |
The record each layer shares is [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]. The vocabulary the person codes with is [[20_Progress/Projects/AI Use/Conversations/Failure Taxonomy|Failure Taxonomy]]. The step-by-step reviews are [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] and [[20_Progress/Projects/AI Use/Conversations/Monthly Review Protocol|Monthly Review Protocol]].
## The ten-minute setup review (locked)
Step 8 of the weekly review, and the fallback when only ten minutes exist:
1. Ask: **what did I correct twice this week?** If it is not obvious, take the most frequent code from the blind pass.
2. Pick the home for the fix: a hook for a check on one specific tool action, one CLAUDE.md line for a fact that applies every time and cannot be read from the code, a skill for a routine, a subagent for flooding or fresh eyes, a habit otherwise.
3. Make **one** change.
4. Test it in a fresh session by repeating the prompt that failed.
5. Write one ledger row.
6. If nothing recurred, change nothing and write that.
The procedure comes from a weekly setup review published on 2026-10-07 (one observed run, no measured outcome; the author also sells a starter pack, so treat it as a recipe and not as evidence). The ledger is what turns it into evidence of your own. Matthew Hansen's `/insights` case (64 sessions over 28 days, 31 flagged "wrong approach") is the model for L5: a friction report turned into rules, skills and hooks. He did not re-run it, so no effect was measured.
## Why the human reviews this way
- **Write before you see.** Buçinca et al. (N=199, a nutrition task with a simulated 75 percent accurate AI): designs that made people decide first cut overreliance from 0.64 to 0.48 against plain explanations. Two side findings matter here. People rated the designs that worked best the least favorably, and the benefit was larger for people high in need for cognition. So the blind pass is the least pleasant design and the one most likely to be skipped; that is why the ten-minute fallback exists. Flags, and the reason a prompt was picked, appear only after your note.
- **Sample the unflagged.** Anthropic found users accepted 93 percent of manual approval prompts, and its own two-stage classifier still missed 17 percent of 52 real overeager actions. Random prompts are in every sample.
- **Let the codebook move.** In Shankar et al., 5 of 9 practitioners reinterpreted criteria as they graded. The taxonomy is a living note with a change rule, and drift is handled at the monthly step.
- **Code the first failure.** Husain and Shankar's guidance (page last modified 2026-09-01) says to note the first failure in a trace, and to annotate at least 30 traces yourself before any agent suggests more. Tang et al. anchor each code to a quoted piece of evidence.
## How the second reviewer is staged
The owner decided on 2026-10-30: until every AI platform is captured the same way, the second reviewer is a Claude-assisted pass. A local model comes later, when the process is proven, written out and repetitive, which is the kind of work a small local model does well.
- **Stage A (after P11):** once you have hand-coded 30 prompts, a Claude Code session reads redacted prompt records and proposes more instances of your own codes, one code per call, each with a quote and a rationale. You accept or reject each after your own note. The agent never edits a rule. This follows Husain and Shankar's updated guidance and Dunivin's finding that one code per call, with a rationale, raises agreement (kappa 0.68 against 0.60 and 0.59), and that a human-in-the-loop tag-for-review workflow is feasible with frontier models.
- **Stage B (gate):** start only when all four hold: every target platform writes the same record; at least 100 prompts carry your labels; stage A has run for 4 or more weeks with the accepted share logged; a rubric is written per question. Then pilot local models on a held-out set as in [[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]].
- **Why not a local model now:** nothing published tests a small local model on coding-session records, and AgenTracer's small models found the failing step in long multi-agent traces only 1.7 to 8.7 percent of the time (the 8B model with step-level training did better, which is out of scope here). The evidence for a local reviewer is adjacent, not direct.
## Decisions
Rows marked **(default)** were set by the assistant on 2026-10-30 without a separate question; the owner can veto them (they are also checkboxes in the postmortem's Open Questions). Unmarked rows are owner decisions or follow from a source.

| Locked now | Why |
|---|---|
| Human decides; scripts count; a second reviewer suggests only after the human's note | Output quality is a judgment no cited source lets a small model make |
| Blind pass before any flag, and before the reason a prompt was picked | Buçinca et al. |
| One change per week with a ledger row | Attribution; Gloaguen et al. found context files raised cost by over 20 percent on average and did not generally improve success, and for the Claude Code agent developer-written files did not improve it |
| Raw events stay on each machine and are ignored by git and Syncthing before the first line is written. **(default)** They hold no prompt text | Prompts hold pasted content (104 of 432 `history.jsonl` lines on 2026-10-22); sync conflicts already cost corrections once |
| The Plan's session notes stay local to the Acer (owner, 2026-10-30) | The exporter wrote 23 `.md` files of The Plan sessions, with tool results, into git and onto the remote; see the Build Plan's P4b |
| Synced notes (digest, weekly note) refer to The Plan prompts by session id only, with no title, link, path or quote | Titles and file names can be private |
| Hook scripts are deterministic and model-free | A hook with a model call adds latency to every tool call |
| **(default)** Scripts live in the vault; registration is user-level in `~/.claude/settings.json`, made by a script kept in the vault. This restates the owner's 2026-10-22 "hooks live in the vault `.claude` only" | Project settings cover only sessions started inside the vault, and The Plan, Home and UMN Courses are outside it. The existing Stop, SessionEnd and PDF-guard hooks already work this way |
| **(default)** Ledger metrics for a code with a digest rule are digest counts per 100 prompts over all prompts | Over 50 coded prompts a 20 percent rate carries a 95 percent interval of about 11 points |
| **(default)** `/insights` is a monthly manual step, not a skill | A skill is a prompt and cannot type a built-in command; the report folder does not exist on the Acer yet |
| Codes seeded from Tang et al. (S1 to S7, verified against v2 of the paper) and AgentDiet's waste kinds, plus a few of ours | A starting vocabulary, edited by review |
## Open decisions
| Open | Who decides |
|---|---|
| Whether a deliberate deletion of a session note should be recreated by capture | Owner, before P6 |
| Whether the Claude pass at stage A may read The Plan prompts | Owner, before stage A |
| Weekly time budget | P5 measures minutes per step; 60 minutes for four weeks is the working number |
| Which local models to pull | Stage B pilot, not before the gate |
| Legacy `Windows/` trees and Cowork | Owner, with the Dell phase |
## Gaps the first postmortem found, and the answers
| Finding of the 2026-10-21 postmortem | Answer here |
|---|---|
| 2, 3 Silent failure; the hook hides its failures | Done for exports: an outcome line for every Stop and SessionEnd. Still to do: heartbeat and failure rows in L0, coverage line in L1, watchdog (P9) |
| 4 Three implementations of one job | One event hook and one digest script; the old exporters stay as the archive until the owner decides |
| 5 No reader | The weekly review is the reader; the digest is its input |
| 7 Raw copy is not durable | `cleanupPeriodDays` is 60 on the Acer (set 2026-10-28, a transcript 32 days old survived the last sweep; the first full 60-day test is 2026-11-27) |
| 8 Wrong or absent metrics | Dedup fix and prices done for new notes; counts per code in L1 |
| 11 Failure modes that survive repair | Sync conflicts, partial coverage and drift appear in the risk list below |
| 12 Documented risks | `async` Stop and 30 s SessionEnd done; unstable transcript format handled by reading `transcript_path` only through the exporter and folding from the transcript only as a fallback |
| 1, 6, 9 Layout and coverage claims | Acer tree is five project folders; Dell and other platforms come after the Acer loop |
## Risks this design carries
| Risk | Mitigation |
|---|---|
| Review fatigue: the loop dies in week three | Ten-minute fallback; a missed week is written into the next digest as a gap with a streak count; a reminder in a toast and in `/startday` while the weekly note is still a skeleton |
| The blind pass is spoiled by how the sample was built | The sample sheet is shuffled and shows no reason; reasons sit in a separate key opened after your notes |
| Small samples read as results | Rule-backed codes are judged on digest counts over all prompts; coded rates are notes; `inconclusive` is the expected outcome |
| The coverage line cries wolf | The target is "every typed prompt has at least one row, and every extra row has a source class"; empty sessions closed by `/resume` are expected skips |
| Hooks lose rows in `claude -p` runs | Async hooks are killed at teardown in headless runs; 19 of 150 transcripts on the Acer are headless. The digest folds a prompt with no rows from the transcript and marks it |
| Hook overhead on every tool call | `async: true`, a short Node script, measured in P6 before registration |
| Sync conflicts on frequent rewrites | Raw events not synced; one writer per generated note; `Jarvis-GitAutoSync` is the only git writer (2 of its last 12 runs ended FAILED on 2026-10-30 and the next run recovered) |
| A cleanup deletes a captured note and its marker blocks re-export | Coverage script flags it; the policy is an open decision |
| Prompt privacy | Events hold no prompt text; The Plan stays local; synced notes carry ids only |
| Telemetry or transcript format changes on a release | Pin the field list in a test; the coverage line catches silent drops (24 Claude Code versions in five weeks on this Acer) |
| Feeling of progress without better output | The output check (five hand-opened files) and the ledger's metric rule |
## Non-Goals
Recursive self-improvement, automatic rule writing, a score or leaderboard for sessions, fine-tuning, any model decision about whether output was good, and other platforms until the Claude Code loop runs end to end on the Acer. The other platforms (Codex first) then follow, and the Dell follows the Acer by the gate in the Build Plan.
## Change Log
*2026-10-30. Rewritten from the 2026-10-22 text; the original is in git. Each line names the finding of the postmortem that caused it, or "pass 2" for what the second pass added.*
- **L0 (postmortem 1).** Keys are session, agent and `prompt_id` or null, because `prompt_id` is absent until the first user input. The hook only appends facts. `claims_done` and `verified_after_last_edit` moved to the digest, because async sibling rows may not be written when Stop fires. No prompt text in raw events. The ignore lines come before the first write; the 2026-10-22 claim that the folder was "already ignored" was wrong (`git check-ignore` exits 1).
- **L1 (postmortem 2).** The coverage line is no longer equality with `history.jsonl`: `UserPromptSubmit` also fires for scheduled prompts, subagent reports and messages from other sessions. `agent_lines_kept_7d` is cut: 874 of 974 commits in 30 days are 30-minute Auto-sync snapshots. The sample hides reasons (pass 2). Each run rebuilds the current and previous ISO week, which fixes the postmortem's own "last complete week" wording, since a Sunday 21:00 run would otherwise skip the week that is ending.
- **L2 (postmortem 3, then the owner's answer of 2026-10-30).** The postmortem proposed cutting the local reviewer. Re-reading Husain and Shankar (modified 2026-09-01) showed that an agent-assisted second pass after 30 hand annotations is the guidance. The owner chose a Claude-assisted stage A now and a local stage B later.
- **L3 (postmortem 4).** Kept. The first review runs before the hook is built. The weekly note is the registry's eight-heading AI Weekly Review note.
- **L4 (postmortem 5).** Metric rule; step times total 75 minutes once calibration moves to the second reviewer's own check.
- **L5 (postmortem 6).** Skill cut; manual monthly step. The report folder is swept at `cleanupPeriodDays`, which is 60 on the Acer, not 30.
- **Scope (postmortem 9 and the owner).** The Plan stays local; registration is user-level; the Dell follows the Acer by a gate.
- **Sources (pass 2).** Tang et al. v2 reports inter-rater agreement 0.78 and judge accuracy 0.82 (earlier notes said 0.83 and 0.81); Gloaguen et al. v3 says "no significant effect"; the Anthropic quote "not a drop-in replacement for careful human review" carries the qualifier "on high-stakes infrastructure". Details in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]].
