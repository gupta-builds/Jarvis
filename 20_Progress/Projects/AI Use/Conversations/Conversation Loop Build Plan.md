---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - build
project_kind: plan
next: Run Prompts/P0 (retention and snapshot) today, then P1 and P2, then P3 (design postmortem); the order and prompts are in Corrections below.
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
- B1 is half done. A Dell session on 2026-10-22 added message-id token dedup and vault-root-aware project routing to both exporters, with `test-token-dedup.ps1` and `test-project-routing.ps1`. The dedup test passes under PowerShell 7 (re-run on the Acer). The price table, `status: seed`, the BOM, and the fenced commands are still open. The changes are uncommitted in the shared tree.
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
| Events | Per machine, and scoped to tracked projects so The Plan's personal content stays out of Jarvis logs. |
### Revised order and prompts
Each prompt is an Agent Prompt Standard note in `Prompts/`, one fresh session each. B-numbers are the original builds.
| Prompt | Covers | Done when |
|---|---|---|
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P0 - Retention and Transcript Snapshot\|P0]] | B0 | Setting read back, snapshot counts match, sweep check pending |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P1 - Exporter Finish and Acer Re-export\|P1]] | B1 remainder, tracked-project re-export | Tests green in both shells, two hand counts within 5% |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P2 - Hook Timing and Failure Record\|P2]] | B2 and the export result record | Timing table, `export_result` lines, tested hook |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P3 - Design Postmortem\|P3]] | Pre-implementation postmortem | Nine findings, each keep, change, or cut |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P4 - Review Notes and First Hand Review\|P4]] | B5 and week one by hand | One real weekly note, one ledger row |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P5 - Event Capture Hook\|P5]] | B3 | Pinned schema, concurrency and overhead tests, owner smoke test |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P6 - Weekly Digest\|P6]] | B4 | Golden test, owner hand count on ten prompts |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P7 - Schedule and Review Nudge\|P7]] | New | Scheduled run result 0, skeleton created once, `/startday` nudge |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P8 - Capture Watchdog\|P8]] | B8 | Kill drill alerts within the grace window |
| [[20_Progress/Projects/AI Use/Conversations/Prompts/P9 - Loop Closed Rehearsal\|P9]] | New | Twelve checks on a real week |
P0 to P2 are repairs and do not wait for P3. P4 can run in parallel with P5 and P6 because the first four weekly reviews are by hand. B6 (local reviewer pilot), B7 (`/insights` skill), B9 (Dell), B10 (`30_Order` rewrite), and Codex get prompts after P9, because their inputs (30 hand-coded prompts, a reviewed ledger row, the Dell's live state) do not exist yet.
