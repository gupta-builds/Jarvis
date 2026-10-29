---
type: project
status: active
created: 2026-10-22
updated: 2026-10-28
tags:
  - project
  - ai
  - conversations
  - build
project_kind: plan
next: Run Prompts/P3 (hook timing and failure record); P0 to P2 ran on 2026-10-28. Refine P3 to P5 with what they return. Phases, prompts and the B-to-P mapping are in Corrections below.
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer|Conversation Layer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Layer Postmortem|Conversation Layer Postmortem]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Per-Prompt Record|Per-Prompt Record]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Machine Audit 2026-10-22|Machine Audit 2026-10-22]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Local Reviewer|Local Reviewer]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Sources|Conversation Loop Sources]]"
---
# Conversation Loop Build Plan
## Goal
==Build the sensor, the digest, and the review notes that [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Design|Conversation Loop Design]] needs, in an order that lets the first weekly review happen by hand before any script exists, and the local reviewer last.==
Written 2026-10-22. **Nothing here is built.** No build starts until the pre-implementation postmortem of the design is written; that postmortem may reorder or cut items. Each build is one session and one commit. No build edits `30_Order/` (B10 is the only item that does, and only after the postmortem).
## Sequence
| # | Build | Done when | Answers |
|---|---|---|---|
| B0 | Retention and housekeeping: set `cleanupPeriodDays` (owner picks the value); decide on the 111 stray `.statusline-ratelimit-cache.json.tmp.*` files and the 606 MB `projects/` folder | The setting is in `settings.json`, confirmed by reading it back, and transcripts older than 30 days still exist after the next sweep | Postmortem 7, 12 |
| B1 | Exporter fix: dedup tokens by message id plus request id; drop cost or add a dated price table; write `status: seed` and a review state; no BOM | Two sampled sessions give totals within 5% of a hand count; the notes' frontmatter passes [[30_Order/Standards/AI Loop/Logs\|Logs]] lint | Postmortem 8 |
| B2 | Hook timing: measure the Stop and SessionEnd scripts, add `timeout` and `async: true` where safe | A recorded run time per hook, and no hook near the 1.5-second SessionEnd budget | Postmortem 3, 12 |
| B3 | Event capture hook (Node): one JSON line per prompt, tool call, tool failure, stop, and instruction load, keyed by `prompt_id`; a heartbeat line; failure rows | A day of use produces lines for every prompt in `history.jsonl`; a forced parse error yields a failure row, not silence | Postmortem 2, 3, 4 |
| B4 | Weekly digest generator: counts per rule flag, largest contexts, tool-result sizes, files read twice, skills, subagents and instruction files used, a coverage line | Run on one week, output matches a hand count on ten prompts; tests exist, because the throwaway scripts from the research were not kept | Postmortem 5, 8 |
| B5 | Review notes and templates: weekly note, monthly note mapping, ledger row template, taxonomy change log | One real weekly note filled by hand from exported notes passes [[30_Order/Standards/AI Loop/Logs\|Logs]] and Vault Lint | Postmortem 5 |
| B6 | Local reviewer pilot: pull two or three models, run the seven-step pilot in [[20_Progress/Projects/AI Use/Conversations/Local Reviewer\|Local Reviewer]] | Go-live bars written per question, or the question left human-only | none; new |
| B7 | `/insights` Jarvis skill: runs the report, copies it out of `usage-data/`, links it from the weekly or monthly note | A report from the last week sits in the vault before the sweep | Postmortem 12 |
| B8 | Dead-man's switch: a check that warns when no heartbeat arrived in 24 hours of use | Disable the hook on purpose; a warning appears within a day | Postmortem 2 |
| B9 | Dell rollout through the sync and the build notes | The Dell produces events with its own machine name; no conflict copies | Postmortem 6, 9 |
| B10 | Rewrite the `30_Order` standards, templates, and workflows from what survived | The notes in this folder conform without special cases | Postmortem 1, 4 |
Order notes: B5 comes before B3 and B4 in practice, because the first four weekly reviews run by hand ([[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]]). The pilot needs 30 hand-coded prompts, so B6 cannot start before week two.
## Handoff for the next session
- **Read first:** [[AI_CONTEXT]] cold-start order, then this folder in this order: Conversation Layer, Conversation Loop Design, Conversation Loop Sources, Machine Audit 2026-10-22, Per-Prompt Record, Weekly Review Protocol. Skip the rest until a build touches it.
- **Next action:** write the pre-implementation postmortem of the design: one finding per layer (L0 to L5), each with how it could fail, evidence from the audit, and a keep, change, or cut decision. File it beside the existing postmortem, `review_kind: audit`. Do not write it from memory of this note; stress the design against the audit.
- **Do not:** touch `30_Order/`, create anything at the vault root, read secret files, or edit `.claude/settings.json` before B0 is approved.
- **Machine facts to verify, not assume:** Claude Code 2.1.307; the global hooks are Stop and SessionEnd only; project hooks guard `Write|Edit|MultiEdit`; the `jarvis` MCP server on `127.0.0.1:27123` refused at session start though a process listened later; Ollama installed with no models; RTX 5070 Ti 12 GB; Acer is `GUPTA-BUILDS`, Dell is `DESKTOP-3VBG0JH`.
- **Syncthing:** conflict copies appeared in this folder during the research and the stale version once won. After any write, look for `.sync-conflict-*` files here and restore the corrected text from the copy.
- **Writing rules:** no em dashes, zero blank lines after a heading, wikilinks path-qualified (duplicates exist for names such as Gaps, Log, README, Review System, including backup copies under `_backups/acer-5c-20261017/`).
- **Throwaway scripts** from the research were not kept. Anything needing a count must be rewritten with tests (B4).
## Open Questions
- Which `cleanupPeriodDays` value, given a 606 MB `projects/` folder?
- Per-machine events or a synced digest only?
- What happens to the legacy `Windows/` trees and Cowork conversations?
- Which models to pull first, and how much disk to give them?
- Is 60 minutes a week for four weeks acceptable?
- Does the `/insights` skill (B7) go before or after the pilot (B6)?
## Non-Goals
Platforms other than Claude Code, any `30_Order` change before B10, and any build that lets a model change the setup by itself.
## Corrections
*2026-10-22, later the same day. The sections above are kept as written.*
### What had changed since the plan was written
- B1 is half done. A Dell session on 2026-10-22 added message-id token dedup and vault-root-aware project routing to both exporters, with `test-token-dedup.ps1` and `test-project-routing.ps1`. The dedup test passes under PowerShell 7 (re-run on the Acer). The price table, `status: seed`, the BOM, and the fenced commands are still open. The changes are uncommitted in the shared tree. *Update 2026-10-28:* [[20_Progress/Projects/AI Use/Conversations/Prompts - Acer/P1 - Exporter Correctness|P1]] closed those four for new notes, and the Dell changes are committed. Old notes are unchanged until P2 re-exports them. *Update 2026-10-28:* [[20_Progress/Projects/AI Use/Conversations/Prompts - Acer/P2 - Project Routing and Acer Re-export|P2]] re-exported the 103 Acer sessions that have a live transcript and an assistant turn; the 23 notes whose transcripts were already swept keep the old format.
- The Dell's `Jarvis-GitAutoSync` is disabled. The Acer is the only git writer, so the Syncthing conflict risk in the handoff is much smaller (0 live conflict copies found).
- The oldest transcript on the Acer is dated 2026-09-24 and moves forward daily, so B0 is urgent, not just first.
- Claude Code is 2.1.309 on the Acer, not 2.1.307.
- The events folder is not "already ignored by git and Syncthing". Only named log files are listed, so P5 adds the ignore lines.
- The weekly note's home in [[20_Progress/Projects/AI Use/Conversations/Weekly Review Protocol|Weekly Review Protocol]] conflicts with the Note Type Registry. The registry wins: `60_Claude/30_Reviews/AI/Scheduled/Weekly/`, using the AI Weekly Review Template. P4 settles the mapping.
- "One commit per build" is replaced by one session log entry per build, because `Jarvis-GitAutoSync` commits every 30 minutes and is the only git writer.
### Owner decisions, 2026-10-22
| Decision | Answer |
|---|---|
| `cleanupPeriodDays` on the Acer | 60 days. Never 0. |
| Dell scope | Repo conversations only: Jarvis, internship-research-loop, second-brain-claudekit, portfolio, CausalOps, tradingview. The rest of the Dell archive is clutter and out of scope. Build B9. |
| Acer tree | Fresh tree and the test bed for the new design. Project-based sessions are re-exported from live transcripts. Older notes whose transcripts were swept stay, recognizable by having no `review_state`. |
| Weekly reviewer | The person reads and codes first, the local model flags afterward. |
| Skill and hook home | The Jarvis vault `.claude/` only. |
| Events | Per machine and local only. Every directory used with Claude Code is tracked, including The Plan; the synced digest carries ids and links, never prompt text. This replaces the earlier idea of excluding The Plan. |
| Project folders on the Acer | Jarvis, The Plan, Home, UMN Courses (everything under `D:\_Anant\10_Areas\UMN`), and any other directory used with Claude Code gets a folder named after it. Claude's own scratch folders go to `Scratch` (assistant's choice, owner to confirm in P2's report). Rules live in one file, `capture-projects.json`. |
| Retention story | 60 days on the Acer is the whole story. The Dell follows with the repo conversations only, re-exported from live transcripts. |
| Schedule | Weekly digest on Sundays at 21:00 by default while testing. Every scheduled process is listed in the Schedule section of [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]]. |
### Numbering: B and P
There was one list, now there is one scheme. The B-numbers (B0 to B10) are the builds in the Sequence table above, written by the research session. The P-numbers are phases, one session prompt each, in `Prompts/`. P replaces B from here on; use P only. Mapping, for reading the older notes:

| Old build | Now |
|---|---|
| B0 retention | P0 |
| B1 exporter fix | P1 (note format) and P2 (project routing and re-export) |
| B2 hook timing | P3 |
| pre-implementation postmortem | P4 |
| B5 review notes | P5 |
| B3 event hook | P6 |
| B4 digest | P7 |
| not in the plan | P8 (schedules and nudge), P11 (rehearsal), P12 (platform and Dell map) |
| B8 dead-man's switch | P9 |
| B10 `30_Order` rewrite | P10 |
| B6 local reviewer pilot, B7 `/insights` skill, B9 Dell rollout | later phases, after P12 |
### What "complete" means for the Claude Code loop on the Acer
These are the owner's finish conditions of 2026-10-22, each tied to the phase that delivers it.
1. Exported sessions have landed: every session with a live transcript has exactly one note in its project folder. The coverage script says so. (P2)
2. The conversation notes are clean and ready to review: they conform to the Standard, token totals are right, commands are readable. (P1, P2, P10)
3. Logs exist and are checked: the hook's export results, the event rows, Capture Health, the watchdog state, the digest log, the Intervention Ledger. (P3, P6, P8, P9)
4. Scheduled runs work and are written down in one timetable: the digest on Sundays, the watchdog hourly, beside the tasks that already run. (P8, P9, and the Schedule section of [[20_Progress/Projects/AI Use/Conversations/Capture Registration|Capture Registration]])
5. The human review loop has run once for real: a weekly note with the owner's blind pass and one ledger row. (P5)
6. The Obsidian notes are final: Standards, Templates, Workflows, READMEs and maps describe what actually runs. (P10)
7. A test run passed on a real week, including a deliberate break that the watchdog caught. (P11)
8. What is needed for the other platforms and the Dell is written down. (P12)
The loop is running when 1 to 7 are true. It is closed only after the first Intervention Ledger row has been judged on its review date, about two weeks after the first review.
### Phases and prompts
Each prompt is an Agent Prompt note in `Prompts/`: run-by line, guide link, then the whole prompt in one fenced block. The first three are written in full. The next three are detailed and get refined by what the first three return. The last three are drafts, refined as each earlier phase returns.

| Phase | Task | Runs on | Done when |
|---|---|---|---|
| [[P0 - Retention and Transcript Snapshot\|P0]] | Retention to 60 days and a transcript snapshot | Sonnet 5.5, medium | Setting read back, snapshot counts match, sweep check pending |
| [[P1 - Exporter Correctness\|P1]] | Exporter: prices, frontmatter, encoding, readable commands, one test runner | Sonnet 5.5, medium | All tests green in both shells, two real sessions within 5% |
| [[P2 - Project Routing and Acer Re-export\|P2]] | Project routing file, reroute with approval gate, re-export, coverage script | Sonnet 5.5, high | Coverage script clean, transcript count unchanged |
| [[P3 - Hook Timing and Failure Record\|P3]] | Time the hook, record every export result | Sonnet 5.5, medium | Timing table and `export_result` lines |
| [[P4 - Design Postmortem\|P4]] | Stress test of the loop design | Opus 5.5, high | A finding per layer, each keep, change or cut |
| [[P5 - Review Notes and First Hand Review\|P5]] | Weekly note shape and the first review by hand | Sonnet 5.5, medium, with the owner | Weekly note and one ledger row |
| [[P6 - Event Capture Hook\|P6]] | Event hook | Sonnet 5.5, high | Pinned schema, concurrency and overhead tests |
| [[P7 - Weekly Digest\|P7]] | Weekly digest | Sonnet 5.5, medium | Golden test, owner's ten-prompt hand count |
| [[P8 - Schedules and Review Nudge\|P8]] | Scheduled digest, review skeleton, `/startday` nudge, timetable | Sonnet 5.5, medium | Task result 0, skeleton created once |
Written after the phases above report, because they need their results:

| Phase | Task | Needs first |
|---|---|---|
| P9 | Capture watchdog: its own task, an expected-state file, a kill drill | P3, P6, P8 |
| P10 | Finalize the Obsidian notes: rewrite the conversation Standard, Templates and Workflows from what survived, the AI Conversations README (22 KB, half historical), Conversation Map, Track Conversations, Session Index queries | P4 and everything built |
| P11 | Rehearsal on a real week: coverage, unattended schedule, digest accuracy, blind pass time, kill drill, retention, sync, redaction, overhead, back-out | P0 to P10 and seven days of events |
| P12 | Platform and Dell map, documentation only (next section) | P11 |
After P12: the local reviewer pilot, the `/insights` skill (in the Jarvis `.claude/`), the Dell rollout, then the Codex and Cursor exporters.
### Beyond Claude Code on the Acer, to be known now and built later
The repos the owner works in (internship-research-loop, second-brain-claudekit, portfolio, CausalOps, tradingview, and Jarvis itself) document sessions from more than Claude Code: Codex and Cursor too. Nothing here builds for them yet. P12 writes down, for each platform and each laptop, where its sessions live, the file format, the retention, what the Acer or Dell already holds, and what the exporter and the clean-up of existing material would need. Known on 2026-10-21 and 22: Codex has 44 session files on the Acer in `~/.codex/sessions` (2026-10-13 to 2026-10-21) and no exporter; Cursor's sweep runs only on the Dell and its notes stop at 2026-10-08; Kiro holds configuration, not sessions; Antigravity's conversation store is empty; the Dell archive holds the older and larger body of material and needs a repo-only re-export from live transcripts. The Dell closes its loop after the Acer's, by Jarvis sync plus the build notes, never by hand-copying scripts.
