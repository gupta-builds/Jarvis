---
type: concept
status: sprout
created: 2026-10-04
updated: 2026-10-04
course: Life
track:
  - laptop
  - wsl
tags:
  - concept
  - laptop
  - wsl
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Prompt 1 WSL]]"
  - "[[Ubuntu - WSL]]"
  - "[[Installations]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
next: "Run the Build 1 sudo and Windows host scripts, then complete Build 2 around the locked two-laptop SSH decisions"
---
# Old Laptop Rebuild - Build 1 WSL Findings
## One-Line Answer
==Repair in place is complete on the live Linux side: 36.424 GiB of verified project output and 5.304 GiB of tool-managed caches were reclaimed, parity tools/configs were installed without copying Acer or AI homes, `.wslconfig` was backed up and aligned for an always-on Build 2 SSH host, and sudo/restart/sparse/swap verification now waits on the two handoff scripts.==
## Mechanism
WSL 2.4.13.0 is running Ubuntu 24.04.4 on kernel 5.15.167.4. `/etc/wsl.conf` contains only valid per-distro sections (`boot`, `user`, `interop`). The global VM settings are in `C:\Users\Anant Gupta\.wslconfig`, where the live 16 GiB/8-processor caps match `free -h` and `nproc`.
The distro is healthy enough to repair in place: `systemctl is-system-running` returned `running`, `systemctl --failed` returned zero units, and the full journal search found no ext4 error, I/O error, OOM kill, or kernel panic. The repeated journal replacement messages line up with `ConversationCapture-Backfill-WSL`, a hidden Windows Scheduled Task that runs `wsl.exe` every 30 minutes and lets the distro stop again after a short PowerShell backfill. The seven short boots immediately before the current boot occurred at the same half-hour cadence. That is an unclean lifecycle problem around short-lived starts, not evidence that the ext4 filesystem is corrupt.
The three files in `%TEMP%\wsl-crashes` are ELF core dumps, not WSL VM dumps: one is from `/usr/bin/git`, two are from `codex-code-mode-host`, and all filenames end in signal 7. The strongest evidence is therefore process-level SIGBUS crashes in those executables. The exact instruction-level cause would require matching debug symbols; nothing in the kernel or ext4 logs supports blaming distro corruption.
Phase 3 accepted Decision 3 from [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]: this Dell becomes the always-on Build 2 SSH host. Both timeout layers are therefore disabled (`[wsl2] vmIdleTimeout=-1` and `[general] instanceIdleTimeout=-1`), while gradual memory reclaim remains enabled. The Build 2 prompt was rewritten around that locked-decisions note rather than the superseded transient-WSL assumption.
## Audit Baseline And Planned After State
“After” below is the measured WSL-side state before the required sudo trim and Windows restart. Host VHDX shrink, new resource limits, sparse conversion, and D:-swap creation cannot be measured until the handoff scripts run.
| Item | Before, measured 2026-10-04 | After WSL-side Phase 3, measured 2026-10-04 |
|---|---:|---:|
| WSL home total | 82.88 GiB | 46.10 GiB allocated |
| `~/projects` | 46.72 GiB | 8.20 GiB allocated; 36.424 GiB exact apparent size deleted |
| `~/.vscode-server` | 7.74 GiB | 9.02 GiB; active and untouched, Build 2 handoff |
| `~/.npm` | 6.64 GiB | 4.36 GiB allocated / 3.73 GiB apparent `_npx`; native cache clean left `_npx` |
| `~/.local` | 4.02 GiB | 5.79 GiB after parity binaries/Semgrep; pnpm store pruned to 1,282 bytes apparent |
| `~/.cursor-server` | 3.57 GiB | 3.57 GiB; untouched, Build 2 handoff |
| `~/.cache` | 2.91 GiB | 2.31 GiB allocated; pip and uv caches cleared, unrelated caches held |
| `~/.claude` | 2.75 GiB | 2.75 GiB; held and untouched |
| `~/.codex-archive` | 1.83 GiB | 1.83 GiB; held and untouched |
| `~/.codex` | 1.53 GiB | 1.54 GiB; held and untouched |
| `~/.rustup` | 1.27 GiB | 1.49 GiB after update to Rust 1.99.0 |
| `~/.nvm` | 1.23 GiB | 1.23 GiB; untouched |
| `~/.vscode-remote-containers` | 1.03 GiB | 1.03 GiB; untouched, Build 2 handoff |
| Ubuntu `ext4.vhdx` | 105.94 GiB (113,729,601,536 bytes) | 107.58 GiB (115,507,986,432 bytes) before trim/restart; install writes grew the host file despite 41.728 GiB logical reclaim |
| Linux filesystem used | 94.06 GiB (100,979,793,920 bytes) | 57.07 GiB (61,275,549,696 bytes) |
| WSL swap | 4.00 GiB active; host file not visible; no explicit setting | Configured for 8GB at `D:\WSL\swap.vhdx`; restart verification pending |
| Docker data VHDX | 33.81 GiB (36,312,186,880 bytes) at `D:\WSL\Docker\DockerDesktopWSL\disk\docker_data.vhdx` | Unchanged; Windows-host handoff |
| C: free | 28.65 GiB (30,760,812,544 bytes) | 26.30 GiB (28,242,063,360 bytes); only the authorized `.wslconfig`/backup changed, so other movement is external |
| D: free | 365.64 GiB (392,607,379,456 bytes) | 363.97 GiB (390,805,831,680 bytes) before trim/host reclaim |
## Health Findings
- `CheckConnection` remains noisy under mirrored networking: 5 events in the last hour, 59 in 6 hours, 137 in 24 hours, and 116 over the current approximately 22-hour boot. The boot-wide mean was one line every 666 seconds, but events arrive in short clusters. Mirrored mode stays because both Obsidian MCP TCP endpoints were reachable at `127.0.0.1:27123` and `:27124`.
- One current-boot `WaitForBootProcess` timeout occurred while systemd took longer than 10 seconds. Systemd subsequently reached `running` with zero failed units. Treat it as a lifecycle symptom to re-check after `wsl --update`, not corruption.
- The WSL interop registration is named `/proc/sys/fs/binfmt_misc/WSLInterop-late`. Ubuntu's `wslview` 3.2.3 hardcodes the older `WSLInterop` name, so `wslview --version` falsely reports that interoperability is disabled even though `powershell.exe` and `wsl.exe` execute successfully. `wslu` is installed but browser handoff is not currently healthy.
- Docker Desktop's distro is registered but stopped. The `docker` command is unavailable in Ubuntu because WSL integration is off/not exposed, so `docker system df` could not run. The data VHDX exists and is 33.81 GiB.
- The audit scan had no editor attachment, but Phase 3 preflight found this Codex session attached through VS Code Server (`code-server`, extension host, remote-containers server). All editor folders stayed untouched and the host/idle scripts print the close-everything precondition.
## Live Contradictions Logged
| Earlier claim | Live result | Decision |
|---|---|---|
| Ubuntu VHDX 105.4 GB, about 84 GB used | VHDX is 113.73 GB decimal/105.94 GiB; ext4 reports 100.98 GB decimal/94.06 GiB used | Use live values |
| Docker VHDX at `D:\Docker\DockerDesktopWSL\...` | Actual path is `D:\WSL\Docker\DockerDesktopWSL\...` | Hand the corrected path to the Docker/Windows session |
| `wsl-crashes` accounts for the 3.6 GB Temp total | Temp is 3.48 GiB total; `wsl-crashes` is 0.54 GiB of it | Do not call all Temp data crash dumps |
| `second-brain-claudekit` is 22 commits ahead | It is 0 ahead/0 behind with one modified file | Old backup-risk claim is stale; local modification still needs owner review |
| `internship-research-loop` is 25 behind | It is 5 ahead/5 behind with many deletions, one modification, and three untracked docs | It is now diverged; no automatic pull/rebase |
| Old inventory implied about 21 top-level repos | 58 Git repositories exist, including nested sandbox/tool repos | Audit and growth checks must include nested repos |
| `gh` authentication was invalid in the master-plan audit | `gh auth status` is currently valid for `gupta-builds` over HTTPS | Do not re-authenticate unless it fails later |
| Expected default swap file visible under `%TEMP%` | 4 GiB swap is active as `/dev/sdb`, but no `swap.vhdx` is visible at the C: default or D: target | The missing explicit setting is still real; relocation is verified only after restart |
| `wslu` parity means browser handoff works | Package exists, but `wslview` fails on `WSLInterop-late` | Treat as installed-but-broken, not parity complete |
| Acer notes say no snapshot source was found for Yazi | The requested vault search still found descriptions only, not a reusable Acer dotfile snapshot | Rebuild configs from notes and label them “from notes, not from Acer” |
| Phase 1 saw no editor attachment | Phase 3 preflight found the current Codex process hosted by VS Code Server | Do not touch editor-server folders; close the editor before host restart/idle test |
| npm cache cleanup was expected to clear most of `~/.npm` | `npm cache clean --force` removed 2.253 GiB but deliberately left 4.664 GB under `_npx` | Record `_npx` as Build 2 review; do not manually delete under the tool-native-only approval |
## Repository Inventory
The scan covered all 58 repositories under `~/projects` using local refs only; no fetch, pull, commit, reset, rebase, or push occurred.
### Repositories needing attention
| Repository | Live branch/tracking state | Worktree state |
|---|---|---|
| `ai/claude/adx-worktree-throwaway-test` | `master`, no upstream | Modified `index.js`; many untracked ADX/config/evidence files |
| `ai/claude/claude-ai/code2prompt` | `main`, behind 21 | Clean |
| `ai/claude/ecc` | `main`, behind 93 | Modified Codex config; untracked Claude settings |
| `ai/claude/second-brain-claudekit` | `main`, 0 ahead/0 behind | One modified hook file |
| `ai/claude/second-brain-claudekit/sandbox/ecc` | `main`, 0/0 | Two modified files |
| `ai/claude/second-brain-claudekit/sandbox/gbrain` | `master`, behind 305 | Clean |
| `ai/claude/second-brain-claudekit/skills/.claude_wsl/gbrain` | `master`, behind 2 | One modified plugin file |
| `ai/claude/second-brain-claudekit/skills/.claude_wsl/gstack` | `main`, 0/0 | One deleted path |
| `ai/jan` | `main`, behind 381 | Clean |
| `hackathon/Resq` | `main`, 0/0 | Four modified docs |
| `hub/Assisto_website` | feature branch, 0/0 | Large modified/deleted/untracked build in progress |
| `hub/CausalOps` | `plan/persistent-memory-mcp`, no upstream | Untracked agent/Codex files |
| `hub/DNA_BJJ_APP` | `main`, 0/0 | Modified app file plus untracked steering/Supabase files |
| `hub/GymMangment_app_demo` | `main`, 0/0 | One untracked handoff doc |
| `hub/boom-tracer` | `main`, 0/0 | One modified component |
| `hub/portfolio` | `post-frontend`, no upstream | Large modified/deleted/untracked build in progress |
| `hub/tradingview` | `main`, 0/0 | Thirteen untracked design/spec docs |
| `work/internship-research-loop` | `master`, ahead 5/behind 5 | Many deleted agent skills, modified `AGENTS.md`, three untracked docs |
### Clean repositories
The other 40 repos were clean against their currently recorded upstreams: the 31 clean `second-brain-claudekit/sandbox` repos not named above, plus `ai/claude/second-brain-claudekit/sandbox/Agent-Reach`, `CL4R1T4S`, `OpenBB`, `TradingAgents`, `adx`, `agency-agents`, `agent-skill-simplified-technical-english`, `agent-skills`, `agentic-inbox`, `agentscope`, `ai-job-search`, `andrej-karpathy-skills`, `autoresearch`, `claude-code-best-practice`, `claude-context`, `claude-mem`, `claude-skills-llm-council`, `cpr-compress-preserve-resume`, `graphify`, `gsd-core`, `gstack`, `hiring-agent`, `humanizer`, `last30days-skill`, `llm-council`, `memsearch`, `obsidian-mind`, `obsidian-second-brain`, `promptfoo`, `skills`, `spec-kit`, `system-prompts-and-models-of-ai-tools`; and the top-level repos `hackathon/opspilot`, `hackathon/safereach`, `hub/Learning-Tracker-Tool`, `umn/boom`, and `work/gupta-builds`. Clean does not mean current: some clean repos are far behind, as listed above.
## Removal Manifest — Approval Checkpoint
Sizes are allocated bytes and expected reclaim is an upper bound until measured after deletion. Project, editor, AI-home, C:/D:, and Docker removals require approval.
### Pre-authorized cache cleanup proposed for Phase 3
| Cache | Present | Maximum immediate Linux-block reclaim |
|---|---:|---:|
| npm cache | 6.64 GiB | Up to 6.64 GiB |
| pnpm store | 4.05 GiB | Only unreferenced packages; less than 4.05 GiB expected |
| pip cache | 0.55 GiB | Up to 0.55 GiB |
| cargo registry + git cache | 0.44 GiB | Up to 0.44 GiB |
| uv cache | 0.20 GiB | Up to 0.20 GiB |
| **Total present** | **11.88 GiB** | **Measure after tool-native cleanup** |
### Cache cleanup — measured execution
The post-install baseline was measured immediately before cleanup so installer downloads were included.
| Cache | Before | After | Reclaimed |
|---|---:|---:|---:|
| npm (`npm cache clean --force`) | 6,425,854,956 B | 4,006,637,896 B | 2,419,217,060 B / 2.253 GiB |
| pnpm (`pnpm store prune`) | 2,176,976,425 B | 1,282 B | 2,176,975,143 B / 2.027 GiB |
| pip (`python3 -m pip cache purge`) | 570,499,016 B | 116 B | 570,498,900 B / 0.531 GiB |
| uv (`uv cache clean`) | 528,985,199 B | 0 B | 528,985,199 B / 0.493 GiB |
| Cargo registry + git | 377,965,686 B | 377,965,686 B | 0; held because stable Cargo has no manual global-cache command |
| **Total** | **10,080,281,282 B** | **4,384,604,980 B** | **5,695,676,302 B / 5.304 GiB** |

npm's native cache cleanup does not remove `_npx`; 4,663,836,672 bytes there remain a separate Build 2 review item.
### Project artifact candidates — approval required
The full scan found 147 common build/cache directories totaling 42.94 GiB. The 45 largest candidates were Git-ignored except two parent-project directories with no enclosing Git root (`ai/claude/claude-ai/node_modules`, 0.95 GiB; `.next`, 0.08 GiB), which require manual confirmation as well as approval.
| Repository/group | Candidate size | Main contents |
|---|---:|---|
| `umn/boom` | 18.91 GiB | ignored Rust `target` |
| `hub/portfolio` | 4.93 GiB | ignored `node_modules` + `.next` |
| `ai/jan` | 3.27 GiB | ignored `target`, `node_modules`, `dist` |
| `hub/CausalOps` | 2.17 GiB | ignored `.venv` + app `node_modules` |
| `hackathon/Resq` | 1.43 GiB | ignored `node_modules` + `.next` |
| `hub/Assisto_website` | 1.38 GiB | ignored `node_modules` + `.next` |
| both gstack copies | 2.64 GiB | ignored `node_modules` + generated `dist` |
| `hackathon/opspilot` | 1.15 GiB | ignored `node_modules` + `.next` |
| `sandbox/claude-mem` | 1.13 GiB | ignored `node_modules` |
| parent `ai/claude` project | 1.03 GiB | no enclosing Git root; manual review |
| `hub/Learning-Tracker-Tool` | 1.03 GiB | ignored `node_modules` + `.next` |
| `code2prompt` | 0.98 GiB | ignored Rust `target` |
| Remaining 17 groups | 2.82 GiB | ignored dependency/build/cache dirs |
### Project artifact deletion — executed manifest
All 82 entries below passed the deletion-time Git-ignore, rebuild-manifest, config/systemd/cron-reference, open-file/process, and unchanged-size gates. They were deleted largest first; zero deletion-time skips occurred. Exact total: **39,109,468,361 bytes / 36.424 GiB**.

<details>
<summary>Exact deleted paths and pre-delete sizes</summary>

```text
bytes	path
20280549704	/home/anant_gupta/projects/umn/boom/target
2599799164	/home/anant_gupta/projects/hub/portfolio/.next
2322486256	/home/anant_gupta/projects/hub/portfolio/node_modules
1483488322	/home/anant_gupta/projects/hub/CausalOps/.venv
1125898434	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-mem/node_modules
1045137362	/home/anant_gupta/projects/hackathon/Resq/node_modules
1044574825	/home/anant_gupta/projects/hub/Assisto_website/node_modules
1037334276	/home/anant_gupta/projects/ai/claude/claude-ai/code2prompt/target
885342433	/home/anant_gupta/projects/ai/jan/src-tauri/target
860798924	/home/anant_gupta/projects/ai/jan/web-app/node_modules
848585150	/home/anant_gupta/projects/hackathon/opspilot/node_modules
727980088	/home/anant_gupta/projects/hub/Learning-Tracker-Tool/node_modules
584248624	/home/anant_gupta/projects/hub/CausalOps/app/node_modules
438397855	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/node_modules
406468663	/home/anant_gupta/projects/hub/tradingview/.venv
374180162	/home/anant_gupta/projects/hackathon/safereach/node_modules
355944279	/home/anant_gupta/projects/hub/boom-tracer/node_modules
284291206	/home/anant_gupta/projects/hackathon/Resq/.next
283416301	/home/anant_gupta/projects/hub/Assisto_website/.next
238050776	/home/anant_gupta/projects/hub/Learning-Tracker-Tool/.next
221296351	/home/anant_gupta/projects/ai/jan/scripts/dist
209962588	/home/anant_gupta/projects/hackathon/opspilot/.next
193709307	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/node_modules
131833883	/home/anant_gupta/projects/ai/jan/core/node_modules
127829465	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ecc/node_modules
111325196	/home/anant_gupta/projects/hub/GymMangment_app_demo/node_modules
90957409	/home/anant_gupta/projects/ai/jan/extensions/llamacpp-extension/node_modules
77395146	/home/anant_gupta/projects/ai/jan/extensions/download-extension/node_modules
71941428	/home/anant_gupta/projects/ai/jan/node_modules
56146381	/home/anant_gupta/projects/ai/jan/extensions/assistant-extension/node_modules
56133998	/home/anant_gupta/projects/ai/jan/extensions/conversational-extension/node_modules
55007498	/home/anant_gupta/projects/ai/jan/extensions/vector-db-extension/node_modules
55007498	/home/anant_gupta/projects/ai/jan/extensions/rag-extension/node_modules
52003833	/home/anant_gupta/projects/ai/jan/extensions/mlx-extension/node_modules
51985196	/home/anant_gupta/projects/ai/jan/extensions/foundation-models-extension/node_modules
47859761	/home/anant_gupta/projects/ai/claude/ecc/node_modules
33283835	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/llm-council/.venv
33047233	/home/anant_gupta/projects/work/internship-research-loop/.venv
29674040	/home/anant_gupta/projects/ai/jan/src-tauri/plugins/tauri-plugin-vector-db/node_modules
29674040	/home/anant_gupta/projects/ai/jan/src-tauri/plugins/tauri-plugin-rag/node_modules
29674040	/home/anant_gupta/projects/ai/jan/src-tauri/plugins/tauri-plugin-mlx/node_modules
29674040	/home/anant_gupta/projects/ai/jan/src-tauri/plugins/tauri-plugin-llamacpp/node_modules
29674040	/home/anant_gupta/projects/ai/jan/src-tauri/plugins/tauri-plugin-hardware/node_modules
29674040	/home/anant_gupta/projects/ai/jan/src-tauri/plugins/tauri-plugin-foundation-models/node_modules
13393340	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/last30days-skill/.venv
9974718	/home/anant_gupta/projects/hub/DNA_BJJ_APP/node_modules
1120231	/home/anant_gupta/projects/hub/boom-tracer/dist
693925	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/packages/core/dist
645565	/home/anant_gupta/projects/hackathon/safereach/dist
547657	/home/anant_gupta/projects/hub/GymMangment_app_demo/dist
248453	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/packages/mcp/dist
241522	/home/anant_gupta/projects/ai/jan/core/dist
148042	/home/anant_gupta/projects/ai/jan/extensions/llamacpp-extension/dist
129770	/home/anant_gupta/projects/ai/jan/extensions/node_modules
127469	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/ecc/.opencode/dist
64130	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-cli/dist
57563	/home/anant_gupta/projects/hub/portfolio/dist
40708	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-core/dist
40115	/home/anant_gupta/projects/ai/jan/extensions/rag-extension/dist
36799	/home/anant_gupta/projects/ai/jan/extensions/vector-db-extension/dist
31033	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-gate/dist
27388	/home/anant_gupta/projects/ai/jan/extensions/assistant-extension/dist
26665	/home/anant_gupta/projects/ai/jan/extensions/download-extension/dist
19776	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-sweep/dist
18837	/home/anant_gupta/projects/ai/jan/extensions/conversational-extension/dist
13275	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-shape/dist
13126	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-mcp/dist
12818	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-vscode/dist
10617	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/packages/core/node_modules
9067	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/packages/vscode-extension/node_modules
8054	/home/anant_gupta/projects/ai/jan/src-tauri/plugins/node_modules
7331	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-maintain/dist
6892	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/packages/chrome-extension/node_modules
4177	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/packages/mcp/node_modules
4092	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/claude-context/examples/basic-usage/node_modules
1378	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-vscode/node_modules
202	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-cli/node_modules
170	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-mcp/node_modules
155	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-sweep/node_modules
155	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-shape/node_modules
82	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-gate/node_modules
14	/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/adx/packages/adx-maintain/node_modules
```
</details>

Held/skipped: both gstack and gbrain copies (14 matching artifact paths); `ai/claude/claude-ai/node_modules`; its no-enclosing-repo `.next`; and three paths that were not Git-ignored (`OpenBB/desktop/dist` plus two promptfoo fixture `node_modules`). No referenced/open path appeared in the approved manifest.
### Editor and AI directories — approval required
| Candidate | Present | Proposed treatment |
|---|---:|---|
| `~/.vscode-server` | 7.74 GiB | Prefer targeted stale extension/VSIX/log cleanup in Build 2; current cached VSIX alone is 1.75 GiB |
| `~/.cursor-server` | 3.57 GiB | Prefer targeted snapshot/cache/old-extension cleanup; snapshots alone are 1.14 GiB |
| `~/.vscode-remote-containers` | 1.03 GiB | Nine old server hashes; regenerable after approval |
| `~/.codex-archive` | 1.83 GiB | Hold until the user decides whether the archive is still needed |
| `~/.claude` | 2.75 GiB | Hold; never touch credentials, inspect cache subtrees separately if requested |
| `~/.codex` | 1.53 GiB | Hold; never touch `auth.json`, inspect cache subtrees separately if requested |
### Windows/Docker candidates — approval and later host session required
| Candidate | Present | Expected reclaim |
|---|---:|---:|
| `C:\Users\Anant Gupta\vscode-remote-wsl` | 6.29 GiB | Up to 6.29 GiB after the Windows/VS Code session confirms it is stale |
| `C:\Users\Anant Gupta\codex-cleanup-quarantine-2026-09-20` | 2.43 GiB | 2.43 GiB if the quarantine is approved for permanent removal |
| `%TEMP%\wsl-crashes` | 0.54 GiB | 0.54 GiB; later host cleanup after the crash record is accepted |
| Other `%TEMP%` content | 2.94 GiB | Unknown; audit in Windows-host session, not blanket deletion |
| Docker data VHDX | 33.81 GiB | Unknown because Docker CLI/integration did not respond; no prune without approval |
The three known C:-side WSL candidates total 9.26 GiB. No C: file was changed in this audit.
## Exact `.wslconfig` Diff
Microsoft's current reference places `memory`, `processors`, `swap`, `swapFile`/example `swapfile`, `vmIdleTimeout`, `networkingMode`, and `firewall` under `[wsl2]`; `instanceIdleTimeout` under `[general]`; and `autoMemoryReclaim`/`sparseVhd` under `[experimental]`. The table uses camel-case `swapFile`, while Microsoft's example uses lowercase `swapfile`; the requested lowercase spelling was retained. Source: [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config). The open-source WSL parser also contains both idle-timeout keys. WSL 2.4.13.0 was live before the update; the host script updates WSL, prints its resulting version, then rejects surfaced unknown/invalid-key errors rather than guessing.
```diff
 [wsl2]
 networkingMode=mirrored
 firewall=true
-memory=16GB
-processors=8
+memory=20GB
+processors=10
+swap=8GB
+swapfile=D:\\WSL\\swap.vhdx
+vmIdleTimeout=-1

+[general]
+instanceIdleTimeout=-1

+[experimental]
+autoMemoryReclaim=gradual
+sparseVhd=true
```
Applied file read-back passed every exact key. Backup: `C:\Users\Anant Gupta\.wslconfig.before-build1-20261004-195119.bak`. Both idle keys are deliberate because the Dell is the always-on Build 2 SSH host.
`sparseVhd=true` makes newly-created VHDs sparse according to the current reference; it does not by itself convert this existing Ubuntu VHDX. The later host script should update WSL first and attempt `wsl --manage Ubuntu --set-sparse true` only after shutdown. Recent reports in Microsoft's WSL issue tracker show newer builds may refuse existing-VHD conversion because sparse support has had data-corruption safeguards. Do not add an unsafe override: if the updated WSL refuses, stop and use the documented/manual compaction path instead.
## Toolchain Parity Diff
No reusable Acer dotfile snapshot was found in the requested vault scope. Any configuration built in Phase 3 must be labeled “from notes, not from Acer.”
| Tool/config | Dell live | Acer reference / action |
|---|---|---|
| git / git-lfs | 2.43.0 / 3.4.1 | Match |
| ripgrep | 15.2.0 | Newer than Acer note's 14.1.0; keep |
| fd / bat | Missing packages and aliases | Install `fd-find`/`bat`, add user-space aliases |
| fzf / jq / gh | 0.44.1 / 1.7 / 2.45.0 | Present; `gh` auth valid |
| wslu | 3.2.3 installed, `wslview` broken by `WSLInterop-late` | Repair/upgrade after WSL update; do not count as working parity yet |
| Node / npm / pnpm | 24.14.1 / 11.11.0 / 10.33.2 | Working nvm stack; versions differ from Acer snapshot |
| uv | 0.10.9 | Older than Acer note's 0.12.17; update user-space |
| rustup / rustc / cargo | Present; rustc/cargo 1.90.0 | Present but older than Acer reference; update with rustup |
| tmux | 3.4 binary only | Add `.tmux.conf`, TPM, resurrect, continuum, tmux-fzf, agent-status plugins, and note-based bindings |
| direnv | Missing | Sudo script: apt install, then add hook only after verification |
| delta | Missing | Install user-space; wire git/lazygit pager |
| lazygit | Missing | Install user-space release binary |
| zoxide | Missing | Install user-space and shell hook |
| sesh | Missing | Install user-space; build note-based `sesh.toml` |
| atuin | Missing | Install user-space; local-only, no account/sync |
| gh-dash | Missing | Install GitHub CLI extension; config from live repo map |
| starship | Missing; no config | Install; build note-based Tokyo Night/status/duration config |
| yazi | Missing; no config | Install release binary; build note-based plugins/theme config |
| win32yank | Missing | Install release binary and verify clipboard round-trip |
| ncdu | Missing | Sudo script: apt install; build note-based config |
| semgrep | Missing | Install with `uv tool`; keep rules per repo |
| chafa | Missing | Install static binary >=1.16, not Ubuntu's old apt build |
| Claude / Codex | 2.1.289 / 0.160.0 | Newer than recorded Acer versions; keep |
| Kiro CLI | 2.20.1 | Older than recorded Acer 2.22.0; update separately if installer supports it |
| Antigravity `agy` | Missing | In Acer inventory but not named as a Build 1 must-have; ask before adding |
| Miniconda / `jupyter-base` | Missing | Acer VS Code note says present; leave to Build 2 unless scope is expanded |
| Docker CLI integration | Missing | Windows/Docker session; do not install a second Linux Docker engine |
### Phase 3 install and verification log
| Tool | Verified Phase 3 result |
|---|---|
| uv | Updated `0.10.9` → `0.12.23` |
| rustup / rustc / cargo | Updated to rustup `1.29.1`, rustc `1.99.0`, cargo `1.99.0` |
| Kiro CLI | Updated `2.20.1` → `2.27.1` |
| delta | Installed release binary `0.20.1` |
| lazygit | Installed release binary `0.65.1` |
| Yazi / Ya | Installed release binaries `26.9.1`; no-TTY debug validation limitation logged below |
| sesh | Installed release binary `2.32.0`; `sesh list` parsed the notes-derived config |
| zoxide | Installed release binary `0.10.0`; Bash hook verified |
| atuin | Installed release binary `18.23.0`; local-only config and Bash hook verified |
| starship | Installed release binary `1.26.0`; config parse and Bash hook verified |
| win32yank | Installed x64 release `0.1.1`; PE/usage interface verified because the binary implements neither `--version` nor `--help` |
| gh-dash | Installed direct release `4.26.0` without a Git operation; `gh extension list` discovers `gh dash` |
| Chafa | Installed official static binary `1.18.3`, satisfying Yazi's >=1.16 requirement |
| Semgrep | Installed through uv tool at `1.179.0` |
| tmux / plugins | tmux `3.4`; TPM, resurrect, continuum, tmux-fzf, `samleeney/tmux-agent-status`, and `CRThaze/tmux-handlr` installed from archives; config parsed with `C-a` and pane labels |
| Antigravity `agy` | Official install is queued in `build1-user-step.sh` because the command guard rejected its temporary-file cleanup before launch; the sudo script runs it as the normal user and verifies it |
| fd / bat / ncdu / direnv | Queued in `build1-sudo-step.sh`; aliases and direnv activation occur only after version checks |
| wslu / wslview | Retest is in the post-update host script; failure enables the prepared PowerShell-backed `BROWSER` wrapper without patching system files |

Starship, Yazi, lazygit, Atuin, sesh, gh-dash, tmux, and the consolidated Bash block are explicitly labeled **“Build 1: reconstructed from Acer notes, not copied from Acer.”** No AI-platform home, SSH key, token, or `.mcp.env` was copied.
The ncdu config (`-e`, dark color, `.git`/`node_modules` excludes, confirm-quit) is also prepared and labeled from notes. Git's global `core.pager=delta` was not changed because all Git operations/config mutations are on hold; lazygit itself is wired to delta. gh-dash `repoPaths` remains empty until Build 2 deliberately maps live remotes without touching repository state.
## Decisions
- **Repair in place.** There is no ext4/systemd corruption, repos contain uncommitted and diverged work, and rebuilding would add data risk without fixing the scheduled-task/network lifecycle causes.
- **Keep mirrored networking.** It is noisy, but both Windows-host Obsidian MCP endpoints are live through it; NAT would break this known workflow.
- **Do not treat short WSL boots as random corruption.** The 30-minute cadence is explained by `ConversationCapture-Backfill-WSL`. Any change to that task belongs to the Windows-host session.
- **Do not force sparse conversion.** Keep the documented config and safe `--set-sparse` attempt, but stop if updated WSL rejects it.
- **Do not copy AI homes or secrets.** Existing mode-600 `.mcp.env`, Codex auth, GitHub hosts, and mode-700 SSH directory were checked only for permissions; no contents were printed or copied.
- **Defer Git operations.** Local refs show real divergence and active work. No fetch/pull/rebase/reset/commit/push is part of Build 1 without explicit repo-by-repo approval.
- **Make this Dell an always-on SSH host.** Decision 3 requires both idle timers at `-1`; `autoMemoryReclaim=gradual` limits reclaimable cache pressure without silently stopping the instance.
- **Delete only manifest-matching artifacts.** Every removed path was rechecked for Git ignore status, an enclosing rebuild manifest, config/unit/cron references, open files/processes, and unchanged size. Zero paths failed the deletion-time gate.
- **Do not bypass Cargo's cache ownership.** Stable Cargo 1.99 has automatic age-based collection but no stable manual global-cache command; its 0.352 GiB registry/git cache stayed intact instead of being manually removed.
## Commands That Changed State
- `uv self update`; `rustup update`; `kiro-cli update --non-interactive`.
- Official/GitHub release downloads plus `install` placed delta, lazygit, Yazi/Ya, sesh, zoxide, Atuin, Starship, win32yank, Chafa, and gh-dash in user space; `uv tool install --force semgrep` installed Semgrep.
- Release archives populated `~/.tmux/plugins` and Yazi plugin/flavor directories without `git clone`.
- `apply_patch` created the notes-derived config files and consolidated Bash hooks; a short isolated tmux server verified the tmux config and was stopped.
- The approved artifact script removed the 82 paths in the manifest below with `rm -rf` only after the fresh gate, largest first.
- `npm cache clean --force`; `pnpm store prune`; `python3 -m pip cache purge`; `uv cache clean`.
- `apply_patch` created `wsl-browser`, `build1-user-step.sh`, `build1-sudo-step.sh`, `wsl-host-step.ps1`, and `wsl-idle-test.ps1`; Bash and PowerShell parsers passed.
- `cp -p` created `.wslconfig.before-build1-20261004-195119.bak`; `apply_patch` wrote the approved `.wslconfig`; immediate Bash read-back verified all 12 keys/section lines.
- Required Jarvis findings/index/session-log updates used `apply_patch`. No Git, Docker, editor-server, AI-home, C:-cleanup, or Windows task operation ran.
## Errors Hit And Root Cause
| Error | Root cause | Resolution/status |
|---|---|---|
| Sandbox could not initialize: `.aws` crosses a writable symlink | The managed bubblewrap policy cannot enforce its read-only rule across this symlink layout | Re-ran read-only audit commands with approved escalation; no `.aws` content was read |
| First Windows event query began with `=SilentlyContinue` | Bash expanded PowerShell's `$ErrorActionPreference` inside a double-quoted command | Retried once with the PowerShell program in single quotes; succeeded |
| `stat` could not find the supplied Docker path | Live Docker VHDX is under `D:\WSL\Docker`, not `D:\Docker` | Located corrected path read-only and logged contradiction |
| `stat` could not find C: or D: swap file | No explicit swapfile setting exists; active swap is exposed only as `/dev/sdb` in this session | Verify new D: file after approved config and WSL restart |
| `wslview --version` says interop is disabled | `wslu` hardcodes `/proc/.../WSLInterop`; live registration is `WSLInterop-late` | Treat `wslu` as broken; re-check after WSL update |
| `docker system df` unavailable | Docker command/integration is not exposed in this distro and Docker Desktop distro is stopped | Defer to Docker/Windows session |
| `coredumpctl` not found | `systemd-coredump` tooling is not installed; WSL stored core files on Windows instead | Used safe file metadata; no package installed |
| Two C:/D: `du` scans took several minutes | DrvFs traversal of many small Windows files is slow | Allowed bounded read-only scans to finish; did not repeat them |
| Phase 3 broad D: Docker VHDX search exceeded the command window | A recursive DrvFs search was too broad; the original guessed path was absent | Interrupted the lingering read-only scan and used the already-audited corrected exact path; did not repeat the broad search |
| `win32yank.exe --version` and then `--help` are unsupported | win32yank 0.1.1 only implements stdin/stdout clipboard modes | Did not retry either flag; verified the x64 PE and its usage interface |
| Antigravity installer command was rejected before launch | The command guard rejects `rm -f` cleanup embedded in an exec request | Did not retry or work around it; saved the exact official install in `build1-user-step.sh`, invoked as the normal user by the sudo handoff |
| `yazi --debug` returned `Inappropriate ioctl for device` | Yazi requires a real TTY for that diagnostic path | Did not retry; binary version and config assets were verified, with interactive validation left to normal use |
| `cargo cache --help` exited 101 | Stable Cargo 1.99 has no manual `cargo cache` subcommand; official cleanup is automatic/age-based | Left 377,965,686 bytes of registry+git cache intact; no manual deletion |
| A diagnostic `tail ~/.bashrc` exposed an existing plaintext API credential in tool output | The inspection was too broad for a shell file containing exported secrets | The value is not repeated in notes and the credential file/line was not modified; rotate the affected Firecrawl credential because it appeared in this session transcript |
## Handoffs
### Build 2
- Build 2's prompt was rewritten around [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]], especially Decision 3: this Dell is the always-on SSH host.
- Editor cleanup remains: `~/.vscode-server` 9,687,461,888 bytes (9.02 GiB), `~/.cursor-server` 3,830,464,512 bytes (3.57 GiB), and `~/.vscode-remote-containers` 1,100,906,496 bytes (1.03 GiB). Phase 3 found VS Code attached, so none was touched.
- Miniconda is not present at `~/miniconda3` or `~/.miniconda`; parity/install remains a Build 2 decision.
- Review npm `_npx` at 4,663,836,672 bytes separately; npm's own cache command does not remove it.
- Validate actual SSH service/startup/access around the locked workflow after the host restart; no SSH-key or credential content was copied or changed here.
### Windows-host session
- Docker VHDX: `D:\WSL\Docker\DockerDesktopWSL\disk\docker_data.vhdx`, 36,312,186,880 bytes (33.81 GiB); Docker integration remains unavailable and no prune ran.
- C:-side candidates remain untouched: `vscode-remote-wsl` 6.29 GiB, old Codex quarantine 2.43 GiB, `%TEMP%\wsl-crashes` 0.54 GiB, and 2.94 GiB of other Temp content from the audit.
- Review/disable or redesign `ConversationCapture-Backfill-WSL`; it starts WSL every 30 minutes and explains the journal lifecycle noise. Do not change mirrored networking solely because of `CheckConnection` noise.
- Rotate the Firecrawl credential exposed by the overly broad Phase 3 shell diagnostic; do not paste the replacement into notes or logs.
- Terminal and Windows VS Code work remain later-session scope. The WSL host script is `D:\WSL\ops\wsl-host-step.ps1`; it updates WSL, stops all WSL, attempts safe sparse conversion, starts Ubuntu, verifies swap/resources, retests wslview, and measures early `CheckConnection` events.
## Growth Rules
| Growth source | Standing rule | One check command |
|---|---|---|
| WSL swap on C: | Keep explicit `swapfile=D:\\WSL\\swap.vhdx`; verify after every `.wslconfig` change/restart | PowerShell: `Get-Item -Force 'D:\WSL\swap.vhdx'` |
| WSL crash dumps | Record process/time, then remove old dumps only in the Windows-host cleanup | PowerShell: `Get-ChildItem "$env:TEMP\wsl-crashes" | Measure-Object Length -Sum` |
| Editor servers | Keep only active server hash/current extension versions; never clean while an editor is attached | `du -sh ~/.vscode-server ~/.cursor-server ~/.vscode-remote-containers` |
| Package caches | Use tool-native cleanup monthly; measure before and after; treat npm `_npx` separately because `npm cache clean` does not remove it; let stable Cargo age-clean its own global cache | `du -sh ~/.npm ~/.npm/_npx ~/.local/share/pnpm/store ~/.cache/uv ~/.cache/pip ~/.cargo/registry ~/.cargo/git` |
| Project build output | Lockfiles are source; generated `target`, `node_modules`, `.venv`, `.next`, and `dist` require approval before removal | `find ~/projects -xdev -type d \( -name node_modules -o -name .venv -o -name target -o -name .next \) -prune -exec du -sh {} +` |
| Ubuntu VHDX | Linux deletion frees ext4 blocks; trim, shut down, then measure/compact from Windows | PowerShell: `Get-Item 'D:\WSL\Ubuntu\ext4.vhdx' | Select Length,LastWriteTime` |
| Docker VHDX | Keep Docker data on D:, inspect with Docker before prune, and compact separately from Ubuntu | PowerShell: `Get-Item 'D:\WSL\Docker\DockerDesktopWSL\disk\docker_data.vhdx'` |
| C:-side WSL bridges/quarantines | Review `vscode-remote-wsl`, Temp, and dated quarantines monthly; never assume they are covered by VHDX placement | PowerShell: `Get-ChildItem $env:USERPROFILE -Force | Where-Object Name -match 'wsl|quarantine'` |
## Proposed Monthly Checklist
1. Record C:/D: free space and both VHDX lengths.
2. Run `ncdu ~` after installing it; compare `~/projects`, editor servers, caches, AI homes, and archives.
3. Run `npm cache verify`, `uv cache clean`, and `pnpm store prune`; clean pip/cargo caches only when their measured size justifies it.
4. Review project artifact totals; ask before deleting anything under `~/projects`.
5. Check `systemctl --failed`, the last day of `CheckConnection` counts, and new `%TEMP%\wsl-crashes` files.
6. Run `docker system df` when Docker is available; ask before prune.
7. Check every repo for dirty/ahead/behind state; do not auto-commit or auto-rebase.
8. Run `fstrim -av` only through the approved sudo script, then measure VHDX sizes from Windows.
## Failure Modes / Misconceptions
> [!WARNING]
> A large removable total is not the same as measured host-drive recovery. Linux blocks become free first; the VHDX may not shrink until trim and safe host-side reclamation run.
> [!WARNING]
> “Clean repo” does not mean “backed up and current.” `jan`, `sandbox/gbrain`, and `code2prompt` are clean but hundreds or dozens of commits behind their recorded upstreams.
> [!WARNING]
> `sparseVhd=true` in `.wslconfig` is not proof the existing Ubuntu disk was converted. Verify the host command's result and VHDX behavior after the restart; never force an unsafe conversion.
> [!WARNING]
> Removing editor-server directories while an editor is attached can break the active session. Phase 3 found this Codex session attached through VS Code Server, so every editor directory stayed untouched; Build 2 still requires approval and a fresh process check immediately before cleanup.
## Flashcards
Why is repair-in-place the correct Dell decision?::Systemd is running with zero failed units and there are no ext4, I/O, OOM, or panic errors, while several repos contain uncommitted or diverged work; a rebuild adds data risk without fixing the scheduled-task and mirrored-network lifecycle causes.
#cards/laptop
What explains the journal's repeated “corrupted or uncleanly shut down” replacements every 30 minutes?::The hidden `ConversationCapture-Backfill-WSL` Scheduled Task starts a short WSL session every 30 minutes; WSL later tears down the VM, and the boot timestamps match that cadence exactly.
#cards/laptop
Why can deleting 42.94 GiB of project artifacts fail to shrink `ext4.vhdx` by 42.94 GiB immediately?::Deletion frees ext4 blocks inside the virtual disk; host allocation changes only after trim and a supported sparse/compaction path.
#cards/laptop
