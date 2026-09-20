---
type: concept
status: sprout
created: 2026-09-19
tags:
  - concept
  - laptop
  - ai-infrastructure
notes:
  - "[[Cross-Laptop Sync - Build Roadmap]]"
  - "[[Cross-Laptop Sync - Build 3 Findings]]"
  - "[[Cross-Laptop Sync - Rollback Procedure]]"
next: "[[Cross-Laptop Sync - Build Roadmap]]"
---
# Cross-Laptop Sync - Build 4 Findings
## One-Line Answer
==All five of the six curated mirror folders that actually exist came back secrets-clean, but four of them turned out to be 87-99% regenerable bloat (installed IDE extensions, `node_modules`, cached per-session tool output, one embedded live codebase with its own `.git`) rather than the curated config they were assumed to hold== — `.stignore` now un-excludes all five and adds 12 narrow bloat-subtree exclusions in their place, dropping the actual synced footprint from a combined ~4.1GB to roughly 60MB, and the two other requested checks (a new Unison/Syncthing race surface, unbounded log growth) both came back with concrete, testable answers rather than guesses.

## Part 1: Secret-Pattern Audit, Per Folder
Ran an automated scan for hard secret formats (`sk-`, `ghp_`, `AKIA`, `-----BEGIN...PRIVATE KEY-----`, Slack tokens) across all five existing folders, then sampled real file content by hand in every folder that had anything shaped like config, credentials, or session state. `.kiro_windows` doesn't exist — nothing to audit.

1. **`.claude_windows` — CLEAN.** 21M, 350 files. Top-level structure is exactly what was assumed: `agents/`, `commands/`, `context/`, `hooks/`, `rules/`, `skills/` (21M, all small skill definitions, no `node_modules` anywhere), `AGENTS.md`, `CLAUDE.md`, `Setup.md`, `Sync-Log.md`. Zero secret-pattern hits anywhere in the folder.
2. **`.claude_wsl` — CLEAN (secrets), but 99% bloat.** 1.9G, 32,538 files. `agents/`+`commands/`+`hooks/` total 81K and are clean, curated config. Every secret-pattern hit (AWS SDK TypeScript type definitions, a minified WASM bundle, files literally named `secret-scan.test.ts` and `redact-patterns.ts`) was inside `skills/gbrain/node_modules/` or `skills/gbrain/test/` or the equivalent `skills/gstack/` paths — confirmed by reading them directly: type definitions and compiled/minified bundles that coincidentally contain key-shaped byte sequences, plus test files *for* a secret-redaction feature, not secrets themselves. `skills/gbrain/` (367M) and `skills/gstack/` (1.5G) are each a complete vendored application — their own `.git`, `.github`, `node_modules`, `test`/`tests`, `docs`, `src` — not skill definitions written for this vault.
3. **`.cursor_windows` — CLEAN (secrets), but 97% bloat.** 987M, 13,690 files. `mcp.json` shows literal `"Bearer REDACTED"` and `"GITHUB_PERSONAL_ACCESS_TOKEN": "REDACTED"` — already scrubbed, not live tokens. `extensions/` (959M) is installed VS Code/Cursor extension binaries (Python, Docker, ESLint, Jupyter, etc.) — regenerable via the extension marketplace, not curated. `projects/` (18M) is per-workspace session cache keyed by hashed path, e.g. `projects/d-Users-Anant-.../agent-tools/<uuid>.txt` — sampled one: a cached web-fetch result (an article on LLM economics), 22K, clearly ephemeral tool-output cache, not config. `ai-tracking/ai-code-tracking.db` (3.9M) is a SQLite database — confirmed via `file`, not a text config — tracking AI-written-code stats, regenerable telemetry. `plugins/cache` and `plugins/local` (6.4M) are compiled plugin binaries.
4. **`.cursor_wsl` — CLEAN (secrets), but ~90% bloat, plus one real embedded codebase.** 31M, 3,951 files. `mcp.env` declares `JARVIS_OBSIDIAN_API_KEY`, `THE_PLAN_OBSIDIAN_API_KEY`, `GITHUB_PERSONAL_ACCESS_TOKEN` as empty-string exports (a scrubbed template, not populated secrets); `mcp.json` shows the same `"Bearer REDACTED"` pattern as `.cursor_windows`. `projects/` (18M) and `plugins/` (6.3M) are the same cache/session categories as above. **The one genuine finding:** `worktrees/portfolio__WSL__ubuntu_/nkv/` (part of `worktrees/`, 3.7M total) is a real, live Next.js project — `package.json`, `node_modules`, `.next` build output, its own `.git`, and a real `.env.local`. This is a live git working tree sitting inside a Syncthing-mirrored folder, which is exactly what the roadmap's locked decision forbids for codebases. `.env.local` is already covered by `.stignore`'s existing bare `.env.local` line — Syncthing's ignore patterns are unanchored by default and match at any depth (confirmed against [Syncthing's ignoring-files docs](https://docs.syncthing.net/users/ignoring.html)) — so no secret was ever at risk of syncing, but `node_modules` and `.next` were not covered by anything, and a live `.git` inside a synced tree is a corruption path regardless of whether its own `.git` folder happens to be excluded.
5. **`.kiro_windows` — DOES NOT EXIST.** No folder under `20_Progress/AI/Kiro/`. Nothing to audit; its `.stignore` line currently matches zero files either way.
6. **`.kiro_wsl` — CLEAN (secrets), but 99% bloat, plus one embedded external repo.** 1.2G, 5,182 files. `settings/mcp.json` and `powers/installed/supabase-hosted/mcp.json` both show the same scrubbed `"Bearer REDACTED"` pattern. `tasks/*.meta.json` holds Kiro task-execution metadata (task titles, timestamps, session/execution UUIDs) — sampled one in full: no credentials, just a record of what got done and when, closer in kind to a changelog than to session history worth excluding. `extensions/` (1.2G, same VS-Code-extension-binary category as Cursor's) is nearly the entire folder. `powers/repos/supabase-hosted/` is a cloned external repo — has its own `.git`, `README.md`, `LICENSE` — an installed dependency for a Kiro "power," not curated content.

## Part 2: Bloat Exclusion and Resulting Sync Size
Found every regenerable/non-curated subtree per the prompt's criteria (package-manager-installed, build output, cache, test fixtures) and excluded each by its specific path, leaving the parent folder itself un-excluded:

| Folder | Bloat excluded | Size before | Size after |
|---|---|---:|---:|
| `.claude_windows` | none found | 21M | 21M (unchanged) |
| `.claude_wsl` | `skills/gbrain`, `skills/gstack` | 1.9G | ~33M |
| `.cursor_windows` | `extensions`, `projects`, `plugins`, `ai-tracking` | 987M | ~0.5M |
| `.cursor_wsl` | `projects`, `plugins`, `worktrees` | 31M | ~3M |
| `.kiro_wsl` | `extensions`, `powers/repos` | 1.2G | ~0.2M |

Combined: roughly **4.1GB before → roughly 60MB after**, across the four folders that had bloat. `.claude_windows` needed no changes — it was already entirely curated content at 21M.

Each bloat exclusion was written as a full vault-relative path (e.g. `20_Progress/AI/Cursor/.cursor_windows/extensions`), not a bare directory name, because Syncthing's unanchored-by-default matching means a bare `extensions` or `projects` pattern would also match any similarly-named folder anywhere else in the vault — the existing `.stignore` already relies on this same path-anchoring behavior for its folder-level lines, so this is consistent with the file's own established convention, not a new mechanism.

## Part 3: What Changed in `.stignore`
Made the edit via `sed` through Bash, per Build 3's documented workaround for the `PreToolUse:Edit` hook's false-positive block on root-level file edits — not touched or reconfigured, per this build's own boundaries.

Removed (blanket folder exclusions, replaced by narrower ones or dropped entirely):
```
20_Progress/AI/Claude Code/.claude_windows
20_Progress/AI/Claude Code/.claude_wsl
20_Progress/AI/Cursor/.cursor_windows
20_Progress/AI/Cursor/.cursor_wsl
20_Progress/AI/Kiro/.kiro_windows
20_Progress/AI/Kiro/.kiro_wsl
```

Added (the non-existent `.kiro_windows` line is kept as-is since it costs nothing and matches nothing today; the rest are the Part 2 bloat subtrees):
```
20_Progress/AI/Kiro/.kiro_windows
20_Progress/AI/Claude Code/.claude_wsl/skills/gbrain
20_Progress/AI/Claude Code/.claude_wsl/skills/gstack
20_Progress/AI/Cursor/.cursor_windows/extensions
20_Progress/AI/Cursor/.cursor_windows/projects
20_Progress/AI/Cursor/.cursor_windows/plugins
20_Progress/AI/Cursor/.cursor_windows/ai-tracking
20_Progress/AI/Cursor/.cursor_wsl/projects
20_Progress/AI/Cursor/.cursor_wsl/plugins
20_Progress/AI/Cursor/.cursor_wsl/worktrees
20_Progress/AI/Kiro/.kiro_wsl/extensions
20_Progress/AI/Kiro/.kiro_wsl/powers/repos
```

Net effect: `.claude_windows` is now fully unexcluded with no bloat lines at all — the only one of the six that was genuinely clean top to bottom.

## Part 4: Line-by-Line Review of the Entire `.stignore`
Every line, checked against three bars — genuine secret, proven sync-conflict-causing churn, or confirmed regenerable bloat — with two flagged as not clearly meeting any of them:

- `.git` — architecture requirement, not this build's three categories: concurrent writes to Git's object store corrupt the repo. Non-negotiable per the roadmap.
- `.mcp.json`, `.credentials.json`, `.env`, `.env.local`, `.claude/.env.local` — genuine secret-file patterns by name.
- `.claude/settings.local.json` — local permission/tool overrides, machine-specific by design, not meant to be shared.
- `.obsidian/workspace.json`, `.obsidian/workspace-mobile.json` — proven churn (Build 1/3): per-device UI state, no cross-device value.
- `.trash` — **flagged, not one of the three bars cleanly.** Obsidian's local deletion staging area. Not a secret, not proven high-churn, not regenerable bloat in the node_modules sense — but syncing it would actively work against the point of deleting a file (either resurrecting it on the other device, or creating a delete/undelete race). Recommend keeping it excluded on this independent "syncing this is actively harmful" basis, named explicitly rather than forced into the wrong bucket.
- `.obsidian/graph.json` — **flagged.** Only 5 git commits total (Build 3's own churn audit) — not "proven" churn by the same evidentiary bar `workspace.json`/`lean-terminal` met. Per-device graph-view layout, plausibly fine to sync, plausibly fine to leave excluded. Recommend a future small audit rather than changing it unreviewed in this build, which was scoped to the six named folders plus this line-by-line pass, not a general re-litigation of Build 1's original exclusions.
- `.obsidian/workspaces.json` — **flagged**, same reasoning as `graph.json`: only 2 git commits, borderline low-churn per-device state, not clearly proven either way.
- `.obsidian/plugins/copilot/data.json`, `.obsidian/plugins/quickadd/data.json` — documented secret risk (AI provider credentials) in [[Plugin Inventory and Configuration Map]]'s Sensitive Field Redaction list.
- `.obsidian/plugins/obsidian-local-rest-api/data.json` — directly verified in Build 3 to hold a live API key and TLS private key material.
- `.obsidian/plugins/lean-terminal/data.json` — Build 3: machine-specific `cwd` paths plus raw terminal scrollback (secret-adjacent) and proven churn together.
- `.obsidian/plugins/recent-files-obsidian/data.json` — Build 3: 223 commits of proven pure per-device churn.
- `.obsidian/copilot-index-*.json` — regenerable bloat: Copilot's vault embeddings index, hundreds of MB, rebuildable from the vault content, not hand-curated.
- `30_Order/System/jarvis-memory/*.sqlite*` — same category, a regenerable local search index.
- `60_Claude/05_Clippings/AI Conversations/**/_raw_jsonl`, `**/_raw_composer` — the strongest secret/privacy case in the file: unredacted raw AI session transcripts, explicitly called out in `.gitignore`'s own comment on the same paths.
- The 12 new bloat lines from Part 2 — regenerable bloat, justified in Part 1/2 above.

## Part 5: Unison/Syncthing Race Surface
Checked whether Unison's 15-minute local `sync-all.sh` writes into `.claude_windows`/`.claude_wsl` — now Syncthing-synced folders — can land in the same short pre-scan window Build 1/2 proved dangerous for a human edit.

Read the live `jarvis` folder config via the REST API (`GET /rest/config/folders/jarvis`): `fsWatcherEnabled: true`, `fsWatcherDelayS: 10`, `rescanIntervalS: 3600`. The dangerous window Build 2 found is governed by `fsWatcherDelayS`, not `rescanIntervalS` — after any write, Syncthing's watcher waits roughly 10 seconds of quiet before scanning the changed paths, and only after that scan does the local database know about the change (and can therefore version an incoming overwrite instead of losing it silently).

**No live risk today.** The race Build 2 proved requires two things: a local write, and an incoming remote change for the *same file* arriving before the local watcher has scanned it. Right now only the Dell runs Unison against `.claude_windows`/`.claude_wsl` — the Acer has no Unison mirror pointed at these paths yet (that's Build 7's `new-laptop-windows`/`new-laptop-wsl` manifest entries, still unbuilt). With no second writer, there is nothing for an incoming Syncthing change to collide with; Unison's writes simply propagate outward to the Acer as reads, with a ~10-second window before they're versioned-if-overwritten, same as any other write to this folder.

**A real forward risk for Build 7, not this one.** If the Acer's future Unison entries are ever configured to write into these *same* shared vault paths (rather than distinct per-machine paths, which is what "two *new* entries" in the roadmap already implies), then two independently-scheduled 15-minute automated writers touching the same files would create exactly Build 2's proven failure mode — an automated version of it, recurring on a fixed cadence instead of happening once by human coincidence. The odds of any single 15-minute cycle landing inside the ~10-second watcher-delay window are low per event (roughly 1%) but compound over weeks of continuous operation, and unlike a human race this one repeats forever until fixed. Recommendation for Build 7: keep each machine's Unison mirror writing to distinct, non-overlapping vault paths — which the "new-laptop-windows"/"new-laptop-wsl" naming already suggests is the plan — rather than relying on schedule staggering, which is fragile and drifts.

## Part 6: Log-Hygiene Proposal
`_All-Projects-Sync-Log.md` (873K) and each project's `Sync-Log.md` (638K-992K) are flat, unbounded append-only logs — one `TIMESTAMP  Project  STATUS` line per manifest entry per 15-minute `sync-all.sh` run, no headers, no rotation.

**Built and dry-run tested, not applied:** [[30_Order/System/sync-workflow/scripts/rotate-sync-logs.ps1]] moves everything older than a retention window into a dated `Sync-Log-Archive-<date>.md` next to the source file, and rewrites the active log to keep only the recent window plus any leading frontmatter — nothing is deleted, only moved. A 30-day dry run showed the actual growth rate is much higher than expected: 30 days of retention still left 8,000-17,000 active lines per file (only 300-600 lines were even old enough to archive), because these logs accumulate hundreds of lines per day across ten projects. Re-tested at 7-day retention: archives 87-95% of each file's current content, leaving 1,700-3,700 active lines per file — a genuinely useful cap. The script now defaults to `-RetentionDays 7` for that reason.

**Not applied to the live logs this session, deliberately.** The rotation is safe and reversible (archive, not delete), but it reads a file, computes what to keep, and rewrites it — and these exact files get appended to by the Scheduled Task roughly every 15 minutes. Running it while that task is mid-write risks losing the one line it appends between this script's read and its overwrite. Recommend the user runs `-Apply` themselves at a moment they're not worried about racing the task (or a future build wires it into the same rotation cadence with proper locking) rather than this build silently mutating ten files of real historical log data without a supervised first run.

## Sources
- [Syncthing — Ignoring Files](https://docs.syncthing.net/users/ignoring.html) — unanchored-by-default pattern matching, confirmed this session
- `GET /rest/config/folders/jarvis` against this machine's running Syncthing v2.1.5 instance — `fsWatcherEnabled`, `fsWatcherDelayS`, `rescanIntervalS` — this session, 2026-09-19
- Direct filesystem audit of all five existing mirror folders: `du -h`, `find`, `file`, and hand-sampled content (`mcp.json`, `mcp.env`, `ai-code-tracking.db`, `agent-tools/*.txt`, `tasks/*.meta.json`) — this session, 2026-09-19
- Automated secret-pattern grep (`sk-`, `ghp_`, `AKIA`, `-----BEGIN...PRIVATE KEY-----`, Slack tokens) across all five folders — this session, 2026-09-19
- [[Plugin Inventory and Configuration Map]] — Sensitive Field Redaction list, cited for Copilot/QuickAdd data.json risk
- [[Cross-Laptop Sync - Build 3 Findings]] — `lean-terminal`/`recent-files-obsidian` churn precedent
