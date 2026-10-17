---
type: project
status: active
created: 2026-10-17
updated: 2026-10-17
tags:
  - jarvis
  - restoration
project_kind: plan
next: Complete J0 by reconciling host ownership and evidence gaps in the current-state inventory.
related_progress:
  - '[[Jarvis Current State - 2026-10-17]]'
  - '[[Jarvis Build History - July to October 2026]]'
---
# Jarvis Restoration Build Plan
## Goal
==Restore the existing Jarvis workflows on explicitly owned hosts, prove they work, and use that baseline to choose future builds.==
This is the canonical order for current Jarvis work. J0 through J7 are coordination IDs for this plan, not replacements for Sync Builds 0 to 13 or Old Laptop Builds 1 to 8. Those original IDs and findings remain intact in [[Jarvis Build History - July to October 2026]]. The April schedules are paused; no new deadline is implied.
## Sequence
### J0: reconcile the inventory and execution ownership
*Goal:* establish one dated operational baseline before changing configuration.
*Evidence:* [[Jarvis Current State - 2026-10-17]], [[Old Laptop Rebuild - Index]], [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]], [[Cross-Laptop Sync - Operations Reference]].
*Owner and host:* Anant and the implementing agent record Acer Windows, Acer WSL, Dell Windows, Dell WSL, and remote CI separately. The machine executing a process owns its files; task worktrees follow tasks rather than laptop labels.
*Prerequisites:* the October 17 documentation set and access to the host being checked. Mark an inaccessible host unverified rather than blocking all local read-only inventory.
*Scope:* inventory repo roots/branches, dirty work and unique commits, runtime paths, MCP registrations, relevant tasks/hooks, capture source IDs, database/index locations, mirror manifests, plugin exclusions, and current owner. Record whether each component is proposed, present, registered, disabled, last successful, failed, or unverified. Map old commands and paths to actual current artifacts; preserve distinct cross-vault promotion and same-vault device sync decisions.
*Done gate:* each workflow has an owner host, exact entry point, source and destination, current evidence timestamp, last result or explicit unknown, and one next verification. Missing Dell or remote evidence is visible. No completion is inferred from toolkit parity or a README.
*Stop and recovery:* stop a dependent change when the execution host, source of truth, or preservation of unique work is ambiguous. This packet is read-only; record uncertainty and continue independent inventory.
### J1: restore Git convergence while retaining working Syncthing transport
*Goal:* make human work recoverable across both laptops and remove the observed Git alert without erasing either history.
*Evidence:* October 17 failed rebase applying `059221b1`; Sync 8's race findings, Sync 11's per-machine banners, October 14/15 recovery appendices, and the four protected Acer internship commits.
*Owner and host:* the agent on the repo's execution host, coordinated by Anant; use a separate evidence record for each laptop.
*Prerequisites:* J0 source ownership and explicit accounting of dirty work, bundles, stashes, unique commits, and peer histories.
*Scope:* inspect the actual rebase failure, preserve current work, reconcile histories using the existing approved approach, and verify Git/Syncthing coordination. Keep watcher delay and banner behavior from the latest addenda rather than stale roadmap prose. Confirm ignore symmetry, root markers, versioning, and recovery paths. Review shared working-tree concurrency and restore from named backups only when their contents are understood.
*Done gate:* a real Git cycle exits successfully with expected branch/remote state; preserved local and peer work remains available; the transport resumes; the per-machine alert reflects the result; and a second check after a normal work interval shows no new conflict or lost edit. An isolated conflict/recovery exercise uses disposable content. Success on Acer does not certify Dell.
*Stop and recovery:* halt automatic mutation on ambiguous conflicts or missing work; retain existing bundles and backups, restore the prior safe task state, and use [[Cross-Laptop Sync - Rollback Procedure]]. Do not delete conflict copies merely to make a health check green.
### J2: make CLI and memory reliable on the selected runtime
*Goal:* run the existing tools against the intended vault with accurate paths and index lifecycle.
*Evidence:* `jarvis.ps1` runtime choice, `jarvis_ops.py:23` old report folder, local Store alias resolution, September 20 SQLite timestamp, notes-only upsert implementation, seven-table schema, and root MCP registration inventory.
*Owner and host:* Anant selects the initial execution host from J0; the implementing agent records interpreter, environment, database, and vault root there. Repeat host verification before claiming portability.
*Prerequisites:* J0 host/root identity; preserve the existing database before migrations or rebuilds. J1 convergence is needed before sharing changed tooling or using a moving corpus as evaluation truth.
*Scope:* select a real interpreter and dependency environment, correct wrapper resolution and canonical report path, verify archive/tool exclusions before scanning, and make missing/deleted/renamed records explicit. Preserve multiline metadata and relationship provenance where needed. Check root detection under both entry points. Register the memory MCP only after direct execution and root identity are verified; inspect existing registration to avoid duplicate services.
*Done gate:* exact runtime/version and commands are recorded; CLI help, health, status, and report destination work; a disposable fixture proves add/edit/rename/delete index behavior; Archive and prohibited paths are excluded before traversal; a backed-up real index matches the intended corpus scope with a fresh timestamp; and MCP search returns attributable results from that same host/database. Counts identify both numerator and corpus exclusions.
*Stop and recovery:* stop on the wrong root, unexpected scans, schema corruption, or missing dependency; restore the database copy and previous registration. No new `.agents` directory may be created anywhere. Existing read-only directories do not authorize creating another one.
### J3: restore conversation capture and accountable memory flow
*Goal:* capture selected Windows/WSL sessions once, preserve their provenance, and turn important decisions into retrievable summaries.
*Evidence:* [[Conversations]], [[Conversations Loop]], dormant Sync 12 continuity, exporter status/layout mismatch, Cursor hardcoded paths, missing scoped backfill tasks, and Sync 13 differing duplicate exports.
*Owner and host:* one named capture owner per machine/OS/tool. Anant selects the first source; the implementing agent works on that source's host before extending to others.
*Prerequisites:* J0 source ownership; J1 safe transport; J2 runtime for Python-backed adapters. Current [[AI_CONTEXT]] owns startup policy. Confirm raw-transcript exclusions in memory-heavy Obsidian plugins before increasing capture volume.
*Scope:* align export status, dates, machine/OS/tool/project layout, stable source IDs, checksums, redaction, and read exclusions with the current standard. Inspect Windows and WSL hooks independently; repair external backfill dependencies and Cursor portability/exit propagation. Reconcile duplicate groups without discarding unique content. Register only the selected mechanism after a manual run. Keep raw, normalized, distilled, and promoted layers distinct; do not invent a scheduled distillation job where confirmation still gates it.
*Done gate:* one new controlled session exports with correct provenance; repeating export creates no duplicate; later transcript growth updates the correct source; a forced failure is visible; a restart/resume does not lose state; and one decision summary links to the raw source and can be retrieved. Then verify the actual registered event or task fires on each selected host. Raw-export recovery alone does not close distillation.
*Stop and recovery:* stop on leaked credentials, wrong host/layout, duplicate explosion, missing source context, OOM regression, or unreliable child status. Restore the previous disabled registration, retain sources, and record the failed gate. No bulk cleanup precedes preservation.
### J4: restore daily, weekly, and ingestion use
*Goal:* run a small work loop from real notes with accurate failure signals.
*Evidence:* [[Capture to Summary]], actual ingesting-clipping skill, scaffold ingestion agent, stale startday/weekly instructions, weekly runner exit behavior, and October 11 historical success.
*Owner and host:* Anant uses the loop; the implementing agent verifies the selected Windows or WSL runner and records its actual output.
*Prerequisites:* J2 runtime/root, J1 recoverability, and J3 where conversation ingestion is involved. Use existing standards and skills rather than introducing another pipeline.
*Scope:* reconcile stale skill paths, Summer OS descriptions, current project/master-plan links, summary destinations, and templates. Fix child exit propagation before trusting task metadata. Run one daily opening, one close/review, one weekly review, and one selected source through capture, summary, links, and an action or explicit no-action decision. Confirm whether the immediate ingestion route is manual; a background watcher is a separate optional build.
*Done gate:* outputs follow the current templates, preserve raw sources, resolve their links, and record useful next actions. A failing child returns failure to its caller. Re-running does not duplicate source records. The existing weekly registration is verified at its actual next run after a successful manual invocation; daily automation is not assumed or required to use the workflows.
*Stop and recovery:* stop on wrong destinations, overwritten raw sources, obsolete template output, or lost failure signals. Preserve the source and revert only the changed wrapper/configuration; keep manual execution available.
### J5: restore adjacent workflow integrations deliberately
*Goal:* resume chosen integrations without confusing their ownership or historical completion.
*Evidence:* user-reported internship pause; October 15 protected commits and divergent Dell checkout; [[20_Progress/Projects/AI Use/Claude Kit/Tool Map|Tool Map]], [[20_Progress/Projects/AI Use/Claude Kit/Source of Truth/The Qualification Pipeline|The Qualification Pipeline]], mirror registration's stale path, and historical Graphify exports.
*Owner and host:* internship execution belongs to the reconciled repository/runner; Claude Kit mirrors belong to their manifest-defined hosts; Graphify belongs to its generator repo. Anant chooses which integration is needed for current work.
*Prerequisites:* J0 ownership, J1 history preservation, J2 dependencies, and the relevant output standards from J3/J4.
*Scope:* reconcile the internship checkout and preserved commits, inspect actual remote CI state, validate existing deterministic gates, and document the selected restart trigger. Audit quota starvation and pause behavior before resumption. For Claude Kit, verify manifest paths/directions and avoid restarting disabled redundant tasks. For Graphify, check freshness, merge-driver PATH, export ownership and locking, and generated-output consumers. These are distinct subpackets and may finish separately.
*Done gate:* each selected integration has a manual or controlled run, attributable output, error visibility, and a repeat/restart check. Internship no-write/defer decisions are distinguishable from success; mirroring preserves conflicts; generated graph output is labeled and does not overwrite human notes. Record actual remote run IDs before claiming CI is active.
*Stop and recovery:* preserve repo histories and output backups; disable the selected trigger on destructive or unexpected writes, stale source formats, quota starvation, conflict loss, or ambiguous output ownership. Do not enable all integrations together.
### J6: establish baseline evaluation and bounded context
*Goal:* prove the restored system retrieves evidence and resumes work correctly before adding ranking complexity.
*Evidence:* original master-plan evaluation targets, July [[Portfolio Option A — RAG + Hybrid Search (jarvis-memory Build)]], and [[Jarvis AI Infrastructure - Concepts and Research]].
*Owner and host:* Anant reviews answer evidence; the implementing agent runs a versioned evaluator on the chosen stable corpus/runtime.
*Prerequisites:* J2 stable index and source identity; relevant J3/J4 outputs available. Unfinished unrelated J5 integrations need not block a small fixed-corpus experiment.
*Scope:* build 30 to 50 real evidence-backed questions spanning direct, multi-note, temporal, contradictory, and unanswerable cases. Record development/held-out splits, corpus revision, expected sources, retrieval configuration, and reproducible scoring. Measure current keyword behavior before body BM25/FTS, embeddings, or graph. Test a small project context pack against current resumption tasks and include explicit unknowns.
*Done gate:* a saved baseline reports Recall@k/MRR, answer/citation support, abstention, latency, and cost with failure cases. Mechanical, model, and human graders have distinct roles. Structural lint remains a separate measure. Context packs cite their source state and demonstrably orient a new session without obsolete priorities.
*Stop and recovery:* freeze a corpus/configuration on mixed revisions or wrong-host queries; correct evidence labels and rerun affected cases. No improvement claim is made without a comparable baseline.
### J7: choose future research from measured failures
*Goal:* add only mechanisms that solve demonstrated limits.
*Evidence:* [[Jarvis AI Infrastructure - Concepts and Research]] and the existing April/July designs, interpreted through J6 results.
*Owner and host:* Anant selects an experiment; the implementing agent uses an isolated index or branch and identifies the execution/cost boundary.
*Prerequisites:* J6 baseline and a named failure pattern. A neural experiment additionally requires a defined task, data, and simple baselines.
*Scope:* evaluate heading/fixed/semantic chunking; lexical/dense/hybrid retrieval; fusion/reranking; then typed-edge neighborhoods and optional Personalized PageRank. Consider temporal validity for stale-decision failures, long-running progress/context artifacts for resumption failures, and optional learned link prediction only after fundamentals and leakage-safe data preparation. Do not adopt every named stack or paper.
*Done gate:* each experiment has a hypothesis, comparable evaluation cases, ablation, latency/cost results, failure analysis, and an adopt/defer/reject decision. Promotion requires a demonstrated improvement worth its maintenance cost. A negative result is a completed experiment.
*Stop and recovery:* retain the simpler production baseline when gains are absent, unsupported, or too expensive. Experimental predictions do not silently become trusted note links. No UI, graph database, model-training job, or new harness layer is a prerequisite merely because it appears in a paper.
## Current State
October 17 is a documentation and inventory checkpoint. No restoration packet is marked complete by the creation of these notes. Anant reports Syncthing working and internship research, conversation syncing, and ingestion off on this laptop. The local inspection establishes a separate Git failure and runtime/index/capture gaps. See [[Jarvis Current State - 2026-10-17]] for the evidence and host limits.
## Decisions
The existing plans remain design history, corrected in dated layers. This plan orders future execution by dependency and verification rather than by the old week numbers. Read-only inventory may proceed independently on available hosts. Configuration changes, service activation, repository reconciliation, and migrations belong to later execution sessions with their concrete scope established.
## Open Questions
- [ ] Which host and interpreter will own the first verified CLI/memory run?
- [ ] Which conversation source should be the first controlled J3 restoration?
- [ ] Which internship, Claude Kit, and Graphify integrations are needed immediately for real work?
- [ ] Which two or three recurring user tasks should anchor the first evaluation cases?
## Next Action
Complete J0 by reconciling host ownership and evidence gaps in the current-state inventory.
