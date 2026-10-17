---
type: project
status: complete
created: 2026-10-17
updated: 2026-10-17
tags:
  - jarvis
  - build-history
project_kind: spec
next: none
related_progress:
  - '[[Jarvis Current State - 2026-10-17]]'
  - '[[Jarvis Restoration Build Plan]]'
---
# Jarvis Build History - July to October 2026
## What This Is
==This retrospective organizes the available Jarvis build evidence from July through October 17, 2026, without treating historical success as current operation.==
The principal requested window is July 17 through October 17. July 3 and 4 appear only as earlier context. This is a completed, bounded documentation artifact, not a claim that the underlying builds are all complete and not a new ongoing log. Existing findings, [[20_Progress/Projects/AI Use/Claude Kit/Log|Claude Kit Log]], and [[60_Claude/07_AI_Information/Session Logs/log|session log]] remain the original records.
## Current State
### Evidence and coverage
The chronology uses original findings and their later addenda before roadmap summaries. Dates identify when the source recorded an observation, not when it was re-tested. A checked task, a tested function, an installed script, and a working end-to-end workflow are different levels of evidence. [[Jarvis Current State - 2026-10-17]] records the October 17 local inspection and user reports.
Coverage is strongest for Claude Kit's July 29 to August 22 work, Sync Builds 0 to 13, and the October laptop rebuild. The internship System - Build Log provides durable July 17 to 26 evidence; this is still not an event-by-event reconstruction of every day in the window. Git history and selected logs provide provenance, but this document does not assert that every commit, conversation, or three-month change was reviewed. Earlier April and May plans are linked as design ancestry, outside this window.
### Design ancestry and early July context
[[Jarvis Three-Month Research Engine Master Plan]] and [[Jarvis Multi-Agent PKM Plan]] proposed capture, a registry, context packs, semantic retrieval, graph queries, cited answers, enrichment, learning, research, and evaluation. Their schedules, target counts, command examples, and older paths were proposals, not shipped milestones.
The session log records manual PDF/web ingestion on July 3 and 4, including 28 summaries and a reported memory inventory. It also records no morning schedule and unpopulated semantic components. A July 4 guard blocked a clipping-board write without a documented resolution in the reviewed entries. These show both real processing work and incomplete automation; the reported inventory is not a present count.
### July 17 through 26: internship pipeline builds
[[20_Progress/Internship/Building System/System - Build Log|System - Build Log]] records a real July 17 deterministic discovery launch, verified hourly operation and 137 dossiers, schema-drift stopping, deferred seen-state until confirmed push, and a four-check write gate. July 18 added enrichment/manual grading, daily rechecks, and a mass-deletion brake; its test total was 167 at that checkpoint. July 19's audit found technical operation alongside zero promotions, showing why pipeline activity is not the same as completed applications.
July 23 manual searches exposed genuine coverage misses. July 24 and 25 added direct ATS coverage and expanded curated sources. A July 25 citizenship/OPT exclusion regex check on 22 citizens-only postings improved from 6 of 22 to 13 of 22, while a throttled backlog produced actual verified writes and many deferred items. These are dated case results, not current accuracy. July 26 classification, relevance, and template changes included an Appian dossier promoted into Program, contact, and tracker records, without a claim of application submission; same-day later commits superseded the earlier unshipped status.
[[20_Progress/Internship/Building System/Source of Truth|Source of Truth]] adds important later corrections: the old Prompt 10 pending claim was superseded, write starvation was repaired in August, schema checks passed, and September introduced exact quotas and a hard pause. Its October 3 investigation found workflow labels saying active while the Actions API showed no runs and logs were stale; execution was unknown. It also left a quota-shortfall failure open: repeated shortfalls could charge losses and exclude candidates without writes. Do not restart based on an active flag. The October 17 user report says the loop is off on this laptop.
### July 29 through August 21: Claude Kit qualification and mirrors
| Date | Recorded build | Evidence and limit |
|---|---|---|
| July 29 | Formalized qualification documents, dependency checking, Tool Map, and a dedicated log. WSL/Windows symlink alternatives failed because of elevation or reparse behavior. | [[20_Progress/Projects/AI Use/Claude Kit/Log|Claude Kit Log]]. This explains why ordinary mirrored files replaced the assumed symlink approach. |
| July 30 | Installed Unison 2.54 without root and replaced the earlier rclone-bisync proposal. Forward, reverse, and genuine conflict-skip tests ran; DrvFs configuration needed repair. | Same log. These were manual tests; automation was not yet established by this entry. |
| July 30 | Cloned ECC and installed dependencies in a sandbox. Claude discovered its instructions/skills from the clone. | Same log. The recorded test suite start has no recorded result there; sandbox presence was not automatically inert. |
| August 10 | Multi-project manifest replaced single-project syncing. Hidden launcher exit propagation and task-registration timing were corrected; an actual task ran with exit 0. | Same log. The older `SecondBrainClaudekit-JarvisSync` task was disabled as rollback; the broader rollout tested source/mirror behavior and avoided conflict tests against live settings. |
| August 19 | Renamed qualification lane `tested-skills` to `tested-tools`, tested CPR, and relocated native scaffolds. | Same log and [[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]]. Imported skill counts were not counts of individually tested skills. |
| August 20 | GBrain completed an actual non-keyword embedding/semantic test and received a global-promotion verdict. gstack remained blocked by a WSL library dependency. | Same log. GBrain's test was outside a deployed Jarvis memory engine; promotion approval did not prove global installation. |
| August 20 to 21 | Removed secret-bearing broad dumps in favor of curated mirror subsets, revised the manifest, retired duplicate writing logs, and repaired recursive instruction copying with explicit-file rules. | Same log. Conversation export confirmation still blocked automatic distillation. A temporary task failure and later recovery are both part of the record. |
[[20_Progress/Projects/AI Use/Claude Kit/Source of Truth/The Qualification Pipeline|The Qualification Pipeline]], [[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]], and [[20_Progress/Projects/AI Use/Claude Kit/Build Map|Build Map]] describe this project's purpose: evaluate outside tools and control their adoption. Its scheduled mirrors and optional hooks are separate from Jarvis's general conversation-memory design.
### August 22: a real Graphify pipeline
The [[60_Claude/40_Project_Briefs/Graphify — Internship Research Loop Implementation|Graphify internship implementation]] records an actual graph build over the internship repo, not just a proposed tool. The August 22 session log records a deep pass with 711 nodes and 45 communities, with a later graph at 697 nodes. These are dated generated-repo graph counts, not current vault-wide counts.
Post-commit and post-checkout hooks plus a custom post-merge path exported generated material into the internship project briefs. Debugging found a missing merge driver and conflicting tool installations: the approved `uv tool` version differed from the older pip executable on PATH. Reinstalling hooks restored merge-driver setup; pruning 350 orphan artifacts was committed as `f75662ac`. Custom sync blocks survived. A supposed lost user note proved to be generated output, and a truncated directory listing had supported a mistaken inference about Git.
The recorded remaining risk was a shared export-ownership manifest updated without locking. Generated graphs, export hooks, and the future `jarvis-memory.links` index are distinct systems. The historical Graphify build does not establish current refresh or capture state. See [[How to use Graphify]] and [[Graphify Workflow]] for the original usage context.
### September: Sync Builds 0 through 8
The original `Sync` IDs are retained. They are not renumbered into the restoration plan's J-series.
| Original build | What the findings establish | What must remain qualified |
|---|---|---|
| Sync 0 and 1, September 18 | A pilot exposed silent external overwrite behavior in Obsidian. | The vulnerable interval was before Syncthing scanned the local edit; versioning does not preserve every unscanned edit. See [[Cross-Laptop Sync - Build 1 Findings]] and [[Cross-Laptop Sync - Build Roadmap]]. |
| Sync 2, September 19 | Two independent localhost devices reproduced conflict-copy and versioning behavior after scans. | Watchers were deliberately off for part of the experiment. This was not a measurement of a normal real-world overwrite interval. [[Cross-Laptop Sync - Build 2 Findings]] |
| Sync 3 | Audited settings and added a REST settings checker. Findings confirmed an ExcaliBrain installation, real Bases files, and ordinary mirrors. | The earlier claim that ExcaliBrain was missing was wrong. Historical installation does not establish today's enabled state. [[Cross-Laptop Sync - Build 3 Findings]] |
| Sync 4 | Reduced mirrored content from roughly 4.1 GB to 60 MB and established the requirement for distinct per-machine mirror paths before future Acer wiring. | Paths, ownership, and task registration still need current host checks. [[Cross-Laptop Sync - Build 4 Findings]] |
| Sync 5 | Excluded a root virtual environment, Excalidraw dependencies, and tracked Lean Terminal dependencies from inappropriate transport. Rotated logs and documented settings. | Two Templater folder paths were identified as broken and left unresolved then. Avoid a precise log-count total because the prose and table disagree. [[Cross-Laptop Sync - Build 5 Findings]] |
| Sync 6 | Investigated defaults collisions, then actually paired Acer, repaired the NUL issue, and obtained independent Dell verification. | The earlier headline saying pairing had not happened was superseded by the same note's later appendices. [[Cross-Laptop Sync - Build 6 Findings]] |
| Sync 7 | Bootstrapped Acer Git with a large backlog and tested a real push rejection/retry. Drive Stream work was recorded; Unison was not started there. | A successful script or an actively CI-written remote branch did not prove human content was backed up. Dell Git/task closeout followed September 20. [[Cross-Laptop Sync - Build 7 Findings]] and [[Cross-Laptop Sync - Jarvis Wrap-Up]] |
| After Sync 7 | Reconciled junction errors, conflict copies, and temporary files; introduced a periodic guard. | Keep these counts as dated incident results rather than present inventory. [[Cross-Laptop Sync - Jarvis Wrap-Up]] |
| Sync 8, September 28 | Investigated Git/Syncthing races, versioning, and a disabled guard. Later addenda reconciled 31 conflict files and restored content groups. | A proposed 300-second watcher delay was superseded by 120 seconds the same day. Automated coordination was function-tested by dot-sourcing, without a real Git tick then. The source's restored-group count disagrees with its bullet list. [[Cross-Laptop Sync - Build 8 Findings]] |
Sync 8's later addenda also supersede the early statement that the Acer Copilot backup was untouched: it was deleted later. Provider-side key rotation remained separate. No credentials or backup contents belong in this documentation.
### October: Sync Builds 9 through 13 and operational repairs
| Original build | Recorded change | Remaining boundary |
|---|---|---|
| Sync 9, October 2 | Added banner/toast visibility after health checks detected a conflict for days without getting human attention; changed Git backup cadence from 15 to 30 minutes while health checks remained every 5 minutes. | Detection is insufficient unless a person sees an actionable alert. [[Cross-Laptop Sync - Build 9 Findings]] |
| Sync 10, October 4 | Repaired ignore symmetry across 14 files and six regressions; found the weekly-review weekday/path issue. | Later task state, rather than this finding alone, determines whether the schedule is now correct. [[Cross-Laptop Sync - Build 10 Findings]] |
| Sync 11, October 4 | Replaced competing dashboard writers with per-machine banner files and a stable embed; Acer verification is separate. | Do not restore the old shared-dashboard writer from an obsolete operations section. [[Cross-Laptop Sync - Build 11 Findings]] and [[Cross-Laptop Sync - Build 11 Acer Verification]] |
| Sync 12, October 4 | Repaired portable paths across 14 automation files and checked functional hooks. | The session-continuity script was repaired but explicitly dormant and unwired. Portable code did not establish capture activation. [[Cross-Laptop Sync - Build 12 Findings]] |
| Sync 13, October 6 | Added ignored-directory handling and self-heal logic. Identified 148-plus duplicate exports across WSL/Windows paths with differing content. | Self-heal was not live-outage-tested then; duplicate reconciliation remained open. [[Cross-Laptop Sync - Build 13 Findings]] |
[[Cross-Laptop Sync - Operations Reference]] later records an October 14 approved merge `9eafb5b2`, recovery of stash-only history `c9c052c6`, and a 23:18 successful run. Its October 15 appendices record ignored `.opencode/skills` parent repair, a repaired 29-commit backlog, and a successful 15:24 run with peer completion. Those dated successes coexist with the October 17 Git failure; the older successful run does not close today's alert.
### October 9 and 14: Obsidian memory failures
[[Acer Session Findings — Obsidian OOM Crash]] records multiple distinct causes. The October 9 work investigated Omnisearch full indexing, Tasks scanning raw conversations, a Hover Editor issue, and lazy-plugin behavior that reintroduced folders or overwrote settings while Obsidian remained open. An October 14 recurrence implicated Spaced Repetition scanning large raw transcript strings. Recorded exclusions reduced heap use from about 2.85 GB to 0.76 GB in that run with 26 loaded plugins.
The same incident history later corrected the previously broken self-heal command through executable caching. These are dated observed repairs, not a guarantee against future OOM. Capture restoration must respect plugin scan exclusions before introducing more transcripts.
### October laptop rebuild: original IDs preserved
[[Old Laptop Rebuild - Index]] is the latest closeout authority in the reviewed rebuild set; [[Old Laptop Rebuild - Runs Index]] still has stale open entries. Read findings and later checkpoints before interpreting an unfinished checklist near a note's beginning.
| Original build | October 15 recorded position | Unresolved scope |
|---|---|---|
| Old Laptop 1 | Dell WSL work closed, including a final idle test that superseded an earlier pending next step. | Not evidence of every Jarvis pipeline running. |
| Old Laptop 2 | VS Code, SSH, and two-laptop work recorded through later handoffs. | Execution host owns files; task worktrees do not follow laptop identity. See [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]. |
| Old Laptop 3 and 3b | Windows cleanup and snapshot/watch work recorded. | The watcher-to-weekly-analysis bridge was explicitly not wired. |
| Old Laptop 4 and 4b | Windows toolkit and later Dell/Tailscale closeout recorded. | Current parity matrix and bat/fd application still need their separate checks. |
| Old Laptop 5 and Acer 5b | WSL/toolkit and D-drive work closed in the October 15 index; Acer SSH and Windows Parts 0 to 3 also closed. | An audit of 18 repos found gaps in editor conventions, lockfiles, and runtime pins; it changed none of those repos. |
| Old Laptop 6 | Future AI/VS Code/MCP audit. | No finished execution prompt established in this review. |
| Old Laptop 7 | Future development profile. | Does not block every basic Jarvis restoration step. |
| Old Laptop 8 | Future Drive consolidation. | Keep separate from current note-sync and workflow restoration. |
The October 15 closeout records four Acer-only internship commits protected by a verified bundle. Dell's internship checkout was recorded six ahead, five behind, and dirty with 25 changes. Reconcile this evidence before choosing a working checkout or restarting automation. Historical toolkit closure did not close conversation, ingestion, or memory gaps. Disabled Dell tasks included `ClaudeKit-Sync-All`, `SecondBrainClaudekit-JarvisSync`, and `ConversationCapture-Backfill-WSL`.
### October 11 and 12: capture recovery and later boundaries
The mixed-order session log records a W41 review with a 376-file conversation backlog landing, Claude Kit Unison stopped since September 20, and earlier project sync logs removed. It records an October 12 Git recovery and a repaired Codex daemon current pointer after quarantine. These are historical incident outcomes; they do not establish present capture syncing or successful distillation. Later user reports and current host checks must remain visible.
### October 16 and 17: note contracts and present handoff
Commits `0e23b437`, `abcc516a`, and `06728e6d` establish recent registry, conformance, and Vault Lint work. This implemented registry, frontmatter/conformance/editing/generated/component standards, a Node lint implementation, and later project, machine-runbook, reference, output, capture, summary, and promotion note kits. The current standards and lint implementation exist; their existence does not prove a measured percentage of vault-wide conformance.
On October 17, Anant reports Syncthing working and the internship loop, conversation syncing, and ingestion inactive on this laptop. Local task/log inspection additionally found a recent Git auto-sync failure. [[Jarvis Current State - 2026-10-17]] preserves those observations without inventing current Dell, WSL-capture, or remote CI state.
## Non-Goals
- This retrospective does not relocate original findings or merge distinct build numbering systems.
- It does not restart jobs, modify runtime configuration, reconcile repository histories, or delete duplicated conversations.
- It does not establish complete three-month event coverage or turn old measurements into present system metrics.
## Open Questions
- [ ] Which remaining July events materially change the build record beyond the reviewed internship and Claude Kit logs?
- [ ] Which duplicate exports contain unique user-authored context that must survive reconciliation?
- [ ] Which stale summary pages need later corrections after each restoration gate is actually verified?
## Related Notes
[[Builds - Jarvis]] maps the records. [[Jarvis AI Infrastructure - Concepts and Research]] preserves the AI design discussion. [[Jarvis Restoration Build Plan]] turns the gaps into dependent builds.
