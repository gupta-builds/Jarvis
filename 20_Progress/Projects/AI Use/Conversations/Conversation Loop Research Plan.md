---
type: project
status: active
created: 2026-10-21
updated: 2026-10-30
tags:
  - project
  - ai
  - conversations
  - research
project_kind: plan
next: Research is finished and the postmortem is done. Step 7 (rewrite 30_Order) is phase P10 in the Build Plan, after the builds. Step 3's full pass over the transcripts is the digest (P7).
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]"
  - "[[60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-08 Jarvis conversation tracking analysis|10-08 Jarvis conversation tracking analysis]]"
---
# Conversation Loop Research Plan
## Goal
==Decide from evidence what one Claude Code session must leave behind, what reads it and when, and how that is produced at near-zero token cost, then rewrite the `30_Order` standards, templates, and workflows for the conversation layer to match.==
## Current State
*As of 2026-10-22.* Research steps 1 to 6 are done; the answers are in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]] and the evidence in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]. Steps 7 and 8 became build B10 and the sequence in [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]. Below is the starting point, kept for the record. What existed to test was a proposal from the 2026-10-08 and 2026-10-09 tracking session, recorded in [[60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-08 Jarvis conversation tracking analysis|that session's note]]. None of it was built, so every item was a hypothesis:
- Five scripts with one job each, parameterized by machine and OS: a session hook, an exporter, a backfill, a watchdog, and a distillation skill.
- Three logs: a per-machine JSONL of script runs, a session ledger table, and a table of every hook, skill, agent, and command that fired.
- A rule that a codebase counts as tracked only with a real `CLAUDE.md`, a hook pointing at one shared script, an explicit project name, and a row in a master list.
- A watchdog run on its own schedule that alerts when an expected record is missing past 1.5 times its cadence.
- A review every 10 real sessions or every Sunday, whichever comes first.
- Multi-line commands rendered in fenced blocks so the Tasks plugin stops warning.
Constraints from the owner: personal use, not a team product; hooks and scripts that cost almost no tokens; easy to edit, copy, and delete; Claude Code first. The industry material found on 2026-10-08 was written for companies watching employees, which is the wrong frame; the filter here is one developer improving their own sessions.
## Sequence
1. **Done 2026-10-21 and 22.** **Inventory what Claude Code exposes.** Read Anthropic's documentation for every hook event and its payload, session storage and retention (`cleanupPeriodDays`), settings, status line input, headless output formats, built-in telemetry export, `/cost`, `/context`, and permission modes. *Done when* every field in [[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]] is marked documented or not, and the 30-day retention question is answered.
2. **Done 2026-10-22.** **Survey what practitioners track.** Individual developers and small teams running Claude Code or similar agents: session cost and tokens, cache hit ratio, turns and duration, tool calls and error rates, retries, every shell command and its exit code, which CLI tools were used, files and folders read versus written, diffs, permission prompts and denials, subagent and MCP use, compactions, skills and slash commands. Also open-source session loggers and viewers, and the OpenTelemetry GenAI conventions as a vocabulary. For the loop itself: Run-Log-Distill, periodic batch review, and the experience-distillation papers, read with the caution that rules promoted automatically can lock in a wrong belief. *Done when* there is a table of metrics with source, cost to capture (free from the transcript, needs a hook, needs telemetry), and the decision each metric would change.
3. **Partly done.** **Test each metric on our own data.** Two sessions sampled for token totals and the machine audit; the per-metric recoverability table was folded into [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]] (source tags) and still needs a full pass in build B4. Compute every candidate from the 122 transcripts on the Acer. Examples: CLI tool names from Bash commands, files written versus read, folders touched, error rate per tool, time per turn from `turn_duration`, cache hit ratio from `usage`, subagent share, compaction count, permission denials. *Done when* each metric is marked recoverable from the transcript alone, needs a hook, or not recoverable.
4. **Done 2026-10-22.** **Define the session record.** See [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]. What one session leaves behind: the note, any log rows, what goes in frontmatter versus body versus a sidecar file, how commands, files, folders, and tool calls are listed. *Done when* a draft exists and the owner approves it.
5. **Done 2026-10-22, pending postmortem.** **Define the loop.** See [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]. Who or what reads which record, on what trigger, what each pass decides, where a finding lands so the next session behaves differently (`CLAUDE.md`, hook, skill), and how the loop proves it ran. *Done when* every step names its trigger, input, output, and token cost.
6. **Done in design, not built.** **Define the guarantees.** See the heartbeat and coverage line in the design. How a failed capture is recorded and noticed within a stated time, how redaction is checked before a note is committed, where raw copies live and for how long, how duplicates are prevented, and how a session that spans machines or days stays one record. *Done when* each failure in [[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|the postmortem]] has a named detector.
7. **Waiting.** **Rewrite `30_Order`.** Build B10, after the postmortem. Standards, templates, and workflows for the conversation family from steps 4 to 6; run Vault Lint; update [[10_Areas/AI/Setup/Conversation Map|Conversation Map]] and the as-built notes.
8. **Done 2026-10-22.** **Write build notes.** One plan note instead of one per script: [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]]. One per script or hook change, each handed to its own session as the 2026-10-04 audit asked. The Acer is built and verified first; the Dell inherits through Jarvis sync and the build notes.
## Method
Primary sources first (Anthropic's own documentation), then practitioner write-ups, each cited with its date. Every claim about Claude Code behavior is tagged documented, observed on this machine, or inferred. Nothing in `30_Order` is edited before step 7.
## Non-Goals
No script, hook, or setting changes before the pre-implementation postmortem. No work on WSL or the Dell. No other platform until the Claude Code loop runs end to end; Codex has the freshest unexported data and goes next.
## Open Questions
- [ ] Is the hook payload richer than the five fields the script reads?
- [ ] Is a Stop-hook re-export fast enough on long sessions, or should rendering wait for `SessionEnd`?
- [ ] How much of a transcript belongs in the note, and how much stays in a linked raw copy?
- [ ] What is the token budget for the periodic review pass?
- [ ] Do the logs live inside the vault or outside it?
## Corrections
*2026-10-30. The plan above is kept as written. The research is finished; this section records where each step ended up and answers the five open questions with evidence.*
### Step status
| Step | State |
|---|---|
| 1 Inventory what Claude Code exposes | Done, and re-verified on 2026-10-30 against the live docs ([[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]], Corrections) |
| 2 Survey what practitioners track | Done; the sources were all re-opened on 2026-10-30 ([[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]], verification pass) |
| 3 Test each metric on our own data | Still partial. The per-metric recoverability table lives in [[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]] (source tags D, O, C). The full pass over the 150 transcripts is the digest's job (P7); the first hand review (P5) shows which metrics the owner actually reads |
| 4 Define the session record | Done and rewritten 2026-10-30: facts from the hook, a record built by the digest |
| 5 Define the loop | Done; postmortem run 2026-10-30; the design was rewritten, not just corrected ([[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]) |
| 6 Define the guarantees | Partly built: outcome line for every export. Heartbeat, coverage line and watchdog are P6, P7 and P9 |
| 7 Rewrite `30_Order` | P10, after the builds |
| 8 Write build notes | Done: [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Conversation Loop Build Plan]] |
### Open Questions, answered
- **Is the hook payload richer than the five fields the script reads?** Yes. The common fields add `prompt_id`, `scratchpad_dir`, `permission_mode` and `effort`; the per-event fields are listed in the Session Source corrections. The export hook still reads five; the event hook (P6) will read the rest.
- **Is a Stop-hook re-export fast enough?** Measured: for 60 written exports p50 729 ms, p95 1,911 ms, max 2,382. Stop is async with `timeout: 60`, so the user does not wait. SessionEnd stays synchronous with `timeout: 30` because its p95 is above the 1.5-second default.
- **How much of a transcript belongs in the note?** Today the note carries the prompts, the final replies, the tool calls and the tool results (142 notes, 25.3 MB, median 76 KB, largest 1.35 MB). Tool results are what make notes large and what can carry private file text. The review reads the `## You` sections and the tool-call lists; the raw transcript stays 60 days.
- **What is the token budget for the periodic review pass?** The review is human; its budget is minutes (P5 measures). The only model pass is the Claude-assisted stage A, one session a week after 30 hand-coded prompts.
- **Do the logs live inside the vault or outside it?** Raw facts outside the synced tree and local (`logs/events-<machine>.jsonl`, ignored by git and Syncthing before the first write); the activity log in `~/.claude`; only the digest and the review notes are synced, with ids and links only.
### What the plan did not foresee
A privacy surface in the session notes themselves (tool results in git), a marker that blocks re-export after a deliberate deletion, a blind pass that a printed sample reason would spoil, and the fact that the second reviewer's evidence base changed while the research ran (Husain and Shankar's page was modified on 2026-09-01).
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Capture Pipeline - As Built|Capture Pipeline]] and [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]] describe what the research will be measured against. [[30_Order/Workflows/Ingestion/Conversations Loop|Conversations Loop]] is the current, unmeasured version of step 5.
