---
type: project
status: active
created: 2026-10-17
updated: 2026-10-17
tags:
  - jarvis
  - current-state
project_kind: spec
next: Complete J0 in Jarvis Restoration Build Plan by reconciling host ownership and evidence gaps.
related_progress:
  - '[[Jarvis Restoration Build Plan]]'
  - '[[Jarvis Build History - July to October 2026]]'
---
# Jarvis Current State - 2026-10-17
## What This Is
==This is the October 17 evidence inventory for restoring Jarvis across Acer and Dell.==
It distinguishes source files from installed services and historical successes from present observations. [[Jarvis Build History - July to October 2026]] owns the retrospective; [[Jarvis Restoration Build Plan]] owns future execution. Subsequent changes need dated evidence rather than silently converting this snapshot into a claim of current operation.
## Current State
### Evidence rules and local inspection
**User report, October 17:** Anant says Syncthing works, internship-research-loop is off, conversation syncing is off, and no ingestion pipeline is running on this laptop. These are the operating assumptions for the restoration work. They do not identify every remote task or prove the other laptop's state.
**Live local observation:** the read-only inspection ran on Acer `GUPTA-BUILDS`, Windows user `anant`, on October 17 at approximately 17:50 CDT. It checked scoped task metadata, command resolution, selected file metadata, logs, code, and safe configuration structure. It did not execute pipelines, reindex databases, start services, inspect secret values, or change scheduled tasks.
**Historical evidence:** findings, handoffs, commits, and logs establish what happened at their recorded dates. **Artifact evidence:** an exporter, README, schema, or workflow exists on disk. Neither category alone establishes current activation or successful execution.
### Host matrix
| Surface | Acer Windows, inspected October 17 | Acer WSL | Dell |
|---|---|---|---|
| Vault path and identity | Current workspace is `D:\_Anant\20_Progress\Documents\Jarvis`; host `GUPTA-BUILDS`. | Not live-audited for this inventory. | October 15 rebuild closeout exists; no live inventory in this review. |
| Syncthing | User reports working; latest Git log finally restores folder `paused=False`. No Syncthing API or full peer-health audit performed. | Execution and ownership need mapping. | October 15 historical peer completion is not today's observation. |
| Git auto-sync | Task present and Ready; last result 1 at 17:33. Log records failed pull/rebase and abort. | Not live-checked. | Historical Git task closeout exists; fresh status required. |
| Weekly review | Task present; October 11 log records actual run and success. Next task time October 18, 06:00. | Not established as an owner. | No live state verified. |
| Conversation hooks/tasks | No inspected Windows continuity registration; no scoped capture/backfill task found. User reports off. | Hook and exporter registration not inspected. | October 15 record names disabled capture and Claude Kit tasks. |
| CLI and memory runtime | `python.exe` resolves to Store alias; `py` absent. Node and Claude binaries resolve. | Runtime and environment need explicit checks. | Toolkit closure does not establish CLI/memory readiness. |
| Internship pipeline | Off by user report; four Acer-only commits historically protected in a bundle. | Working repo ownership needs reconciliation. | Historical ahead/behind/dirty state requires fresh check before activation. |
### Components and operating gaps
| Component | Evidence on disk or in history | Current interpretation and next proof |
|---|---|---|
| Instructions and note contracts | Current `AGENTS.md`, [[AI_CONTEXT]], [[HUMAN_WRITING]], registry, standards, templates, workflows, and lint implementation. | Real infrastructure. Consistent use and conformance remain separate verification tasks; no current blanket score. |
| Write guards | Project `.claude/settings.json` has Write/Edit/MultiEdit pre/post hooks. | Inspected Windows settings expose guards, not registered session-continuity events. Hooks are not a universal guarantee of correct notes. |
| Git/Syncthing | Task and latest Git log; banner at 17:46 reports Git failure. | Transport can be working while Git backup/convergence fails. Diagnose the actual rebase error and preserve work before retrying. |
| `jarvis-cli` | `30_Order/System/jarvis-cli/jarvis.ps1`, `jarvis_ops.py`, README. | Wrapper selects an existing `python` before `py`; the alias can defeat fallback. Report output still targets obsolete `60_Claude/50_Reviews/Ops Reports`. No CLI schedule demonstrated. |
| `jarvis-memory` | `registry.py`, `server.py`, `schema.sql`, README, local SQLite file. | Notes upsert, status, and title/path `LIKE` search are implemented. MCP tools are status/search/reindex. No embeddings storage or semantic/graph answer service is implemented in inspected code. |
| Local memory database | `registry.sqlite` exists, 2,600,960 bytes, last written September 20 at 13:53. | No local table counts read. Earlier MCP count 6,265 is not attributed to this database/host. Do not repeat it as the present Acer count. |
| Index correctness | Registry upserts indexed notes; scalar regex parser does not read multiline lists. | Reindex does not delete removed/renamed records, so a fresh scan can retain stale paths. Archive and tooling exclusions need scan-level verification, including existing `.agents` traversal. No directory should be created for this audit. |
| MCP registration | Root `.mcp.json` inspected structurally and lists only `jarvis`. | A locally registered `jarvis-memory` server is not demonstrated here. Existing notes/API MCP and the planned memory MCP are distinct. |
| Continuity/capture | `jarvis-session-continuity.ps1` and `export-claude-session.ps1` exist. Sync Build 12 explicitly says continuity was dormant. | Windows session-continuity events are not registered in the inspected settings. Startup read order needs alignment with the current context owner before enabling. |
| Exporter schema and layout | Exporter around line 641 still emits `status: raw`, old `Windows/<project>` layout, and `source_os: windows`. | [[Conversations]] requires `status: seed`, `review_state: raw`, dates, and machine/OS/tool/project layout. Existence of the standard does not mean the exporter enforces it. |
| Backfill and duplicates | WSL VBS launcher references an external user-hook script; Sync Build 13 recorded differing duplicate exports. | No scoped current backfill task. Track source IDs, redaction, exclusions, layout, idempotency, growth updates, and content-preserving deduplication before activation. |
| Cursor capture | `30_Order/System/cursor-workflow/` contains exporter and launcher. | WSL branch hardcodes old user/vault paths; launcher does not establish meaningful child completion. No scoped task found. |
| Claude Kit mirroring | Manifest/history and registration script exist. Current registration code references an old WSL repository path. | User/toolkit history does not establish current mirroring. Verify host, path, ownership, directions, and manifest before registration. |
| Ingestion | [[Capture to Summary]] is a complete manual procedure; current ingesting-clipping skill exists. | Ingestion agent describes itself as a scaffold and references an obsolete skill path. No running background pipeline established; user reports none. |
| Daily and weekly workflows | Startday/closeday commands route to local skills; weekly runner and task exist. | Descriptions and embedded instructions contain old Summer OS/master-plan paths. Weekly runner logs child status but does not reliably propagate failures; task result alone is insufficient. No daily schedule demonstrated. |
| Retrieval evaluation | Structural lint, some outside tool evaluations, and old benchmark proposals exist. | No maintained, locally demonstrated Jarvis retrieval/answer benchmark established. Calling all evaluation absent would erase real lint and qualification work. |
| Graph and plugins | Wikilinks, metadata, original plugin findings, and an August Graphify pipeline exist. | `jarvis-memory` graph ingestion is separate and not implemented by its notes upsert path. Current plugin activation/export freshness needs a host-specific check. |
### Task and log evidence
The scoped task query returned `Jarvis-GitAutoSync`, `Jarvis-Syncthing-Health`, and `Jarvis-WeeklyReview`. Both Git and health tasks reported last result 1. A Ready task can still have failed its last run. No capture/backfill, Cursor, or Claude Kit task appeared in that scoped inventory; this is not a claim about every possible task name or WSL scheduler.
`30_Order/System/claude-workflow/logs/git-auto-sync.log` ends at October 17, 17:33 with failed `pull --rebase` while applying `059221b1`, rebase abort, and final FAILED. It subsequently reports Syncthing `paused=False`. `30_Order/System/sync-workflow/Sync Alert Banner.md` at 17:46 lists the Git failure. This is evidence for a Git convergence problem, not proof that Syncthing transport is broken.
The weekly log records an October 11 start at 12:30 and OK/exit 0 at 12:43. However, `run-weekly-review.ps1` does not consistently return the child exit code or fail its catch path. A good historical run and a defective failure signal can coexist.
### Drift ledger
| Earlier or stale statement | Dated clarification | Where future work belongs |
|---|---|---|
| Syncthing works, therefore sync is fully healthy. | User reports working transport; October 17 Git failure is independently observed. | J1, preserving histories first. |
| Python is definitely unusable now. | Command resolution reaches the Store alias; prior README reports unusable shim. Runtime execution was not attempted here. | J2 selects and verifies a real runtime. |
| Reindex refreshes all records correctly. | Inspected upsert code retains deleted/renamed paths. | J2 index lifecycle and temporary-fixture checks. |
| The memory service has thousands of current Acer notes. | Earlier MCP number is not tied to the local stale database. | J2 record actual host/database/corpus counts. |
| Graph infrastructure was never built. | August 22 Graphify repo graph/export pipeline is historically evidenced. | J0 maps it; J7 treats vault graph retrieval as a separate conditional build. |
| Portable capture scripts mean syncing is restored. | Sync 12 explicitly left continuity dormant; current Windows hooks do not register it. | J3 capture readiness and selected activation later. |
| Export schema already matches Conversations. | Exporter still has old status and layout. | J3 conformance and migration plan before enabling. |
| Toolkit/platform closeout means all workflows are restored. | October 15 closure did not establish ingestion, memory, or capture. | J2 through J5 each require their own gate. |
| Roadmaps and indexes are current completion authorities. | Same-day addenda and latest closeouts supersede several headlines and Runs entries. | Preserve old text; add dated corrections linked to findings. |
| All evaluation is missing. | Lint and qualification exist; retrieval quality measurement is not established. | J6 builds the missing benchmark. |
### Evidence anchors
Code and task facts above were inspected read-only on October 17. Relevant tracked files include `30_Order/System/jarvis-memory/registry.py`, `30_Order/System/jarvis-memory/schema.sql`, `30_Order/System/jarvis-memory/server.py`; `30_Order/System/jarvis-cli/jarvis_ops.py:23`; `30_Order/System/claude-workflow/scripts/run-weekly-review.ps1`; `30_Order/System/claude-workflow/scripts/export-claude-session.ps1:641`; `30_Order/System/claude-workflow/hooks/jarvis-session-continuity.ps1`; and `30_Order/System/cursor-workflow/scripts/export-cursor-sessions.py:68`. Exact script locations should be re-resolved before execution rather than copied from an obsolete wrapper.
Historical anchors are [[Cross-Laptop Sync - Build 12 Findings]], [[Cross-Laptop Sync - Build 13 Findings]], [[Cross-Laptop Sync - Operations Reference]], [[Old Laptop Rebuild - Index]], [[Conversations]], [[Capture to Summary]], and the three system READMEs. [[Jarvis Build History - July to October 2026]] links the original chronology.
## Non-Goals
- This snapshot does not declare Dell, Acer WSL, remote GitHub Actions, or all Syncthing peers live-verified.
- It does not run scripts, change settings, reconcile Git branches, remove exports, or restart paused work.
- It does not select a model, vector database, or neural-network build before operational restoration.
## Open Questions
- [ ] Which host owns each repo, automation task, registry, capture source, and generated artifact?
- [ ] What is the current Dell/WSL/remote CI state after preserving unmerged work?
- [ ] Which runtime should each task use, and which paths are portable configuration versus machine-local state?
- [ ] Which paused workflows should resume first once their own gates pass?
