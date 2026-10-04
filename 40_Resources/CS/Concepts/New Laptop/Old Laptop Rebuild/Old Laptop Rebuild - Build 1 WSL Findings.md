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
next: "Wait for approval of the Build 1 removal and execution manifest"
---
# Old Laptop Rebuild - Build 1 WSL Findings
## One-Line Answer
==Repair this Dell WSL install in place: the filesystem and systemd are healthy, the 30-minute unclean-journal pattern comes from a scheduled Windows task repeatedly starting short-lived WSL sessions, and the large reclaim opportunities are regenerable project output (42.94 GiB), user caches (11.88 GiB present), editor-server state (12.34 GiB present), and known C:-side WSL debris (9.26 GiB present), not corruption.==
## Mechanism
WSL 2.4.13.0 is running Ubuntu 24.04.4 on kernel 5.15.167.4. `/etc/wsl.conf` contains only valid per-distro sections (`boot`, `user`, `interop`). The global VM settings are in `C:\Users\Anant Gupta\.wslconfig`, where the live 16 GiB/8-processor caps match `free -h` and `nproc`.
The distro is healthy enough to repair in place: `systemctl is-system-running` returned `running`, `systemctl --failed` returned zero units, and the full journal search found no ext4 error, I/O error, OOM kill, or kernel panic. The repeated journal replacement messages line up with `ConversationCapture-Backfill-WSL`, a hidden Windows Scheduled Task that runs `wsl.exe` every 30 minutes and lets the distro stop again after a short PowerShell backfill. The seven short boots immediately before the current boot occurred at the same half-hour cadence. That is an unclean lifecycle problem around short-lived starts, not evidence that the ext4 filesystem is corrupt.
The three files in `%TEMP%\wsl-crashes` are ELF core dumps, not WSL VM dumps: one is from `/usr/bin/git`, two are from `codex-code-mode-host`, and all filenames end in signal 7. The strongest evidence is therefore process-level SIGBUS crashes in those executables. The exact instruction-level cause would require matching debug symbols; nothing in the kernel or ext4 logs supports blaming distro corruption.
## Audit Baseline And Planned After State
No system cleanup, install, `.wslconfig` edit, restart, or repo mutation happened in this audit. “After” means the approved target, not a measured result yet.
| Item | Before, measured 2026-10-04 | After Phase 3 target |
|---|---:|---:|
| WSL home total | 82.88 GiB | Measure after approved cleanup |
| `~/projects` | 46.72 GiB | Up to 42.94 GiB of regenerable candidates removed only with approval |
| `~/.vscode-server` | 7.74 GiB | Approval-dependent; keep the active server hash/current extensions |
| `~/.npm` | 6.64 GiB | Cache cleaned, measured afterward |
| `~/.local` | 4.02 GiB | Tool installs may change this; pnpm store currently 4.05 GiB inside it |
| `~/.cursor-server` | 3.57 GiB | Approval-dependent; no editor was attached during audit |
| `~/.cache` | 2.91 GiB | uv/pip caches cleaned, measured afterward |
| `~/.claude` | 2.75 GiB | Unchanged unless separately approved; credentials untouched |
| `~/.codex-archive` | 1.83 GiB | Unchanged unless separately approved |
| `~/.codex` | 1.53 GiB | Unchanged unless separately approved; `auth.json` untouched |
| `~/.rustup` | 1.27 GiB | Keep current toolchain; clean only cargo registry cache |
| `~/.nvm` | 1.23 GiB | Keep current LTS unless a later parity decision changes it |
| `~/.vscode-remote-containers` | 1.03 GiB | Approval-dependent |
| Ubuntu `ext4.vhdx` | 105.94 GiB (113,729,601,536 bytes) | Measure after trim/host-side reclaim |
| Linux filesystem used | 94.06 GiB (100,979,793,920 bytes) | Measure after approved cleanup |
| WSL swap | 4.00 GiB active; host file not visible at either expected path; no `swapfile=` setting | 8GB at `D:\WSL\swap.vhdx` after restart |
| Docker data VHDX | 33.81 GiB at `D:\WSL\Docker\DockerDesktopWSL\disk\docker_data.vhdx` | No prune without approval; measure separately |
| C: free | 28.65 GiB (30,760,812,544 bytes) | Measure after Windows-side approved removals |
| D: free | 365.64 GiB (392,607,379,456 bytes) | Measure after VHDX work |
## Health Findings
- `CheckConnection` remains noisy under mirrored networking: 5 events in the last hour, 59 in 6 hours, 137 in 24 hours, and 116 over the current approximately 22-hour boot. The boot-wide mean was one line every 666 seconds, but events arrive in short clusters. Mirrored mode stays because both Obsidian MCP TCP endpoints were reachable at `127.0.0.1:27123` and `:27124`.
- One current-boot `WaitForBootProcess` timeout occurred while systemd took longer than 10 seconds. Systemd subsequently reached `running` with zero failed units. Treat it as a lifecycle symptom to re-check after `wsl --update`, not corruption.
- The WSL interop registration is named `/proc/sys/fs/binfmt_misc/WSLInterop-late`. Ubuntu's `wslview` 3.2.3 hardcodes the older `WSLInterop` name, so `wslview --version` falsely reports that interoperability is disabled even though `powershell.exe` and `wsl.exe` execute successfully. `wslu` is installed but browser handoff is not currently healthy.
- Docker Desktop's distro is registered but stopped. The `docker` command is unavailable in Ubuntu because WSL integration is off/not exposed, so `docker system df` could not run. The data VHDX exists and is 33.81 GiB.
- No VS Code or Cursor server process was attached during the process scan. Codex processes were active. Editor folders still remain approval-gated.
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
Microsoft's current reference still places `memory`, `processors`, `swap`, `swapfile`, `networkingMode`, and `firewall` under `[wsl2]`, while `autoMemoryReclaim` and `sparseVhd` remain under `[experimental]`. Paths must use escaped backslashes and size values accept whole numbers with units. Source: [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config).
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

+[experimental]
+autoMemoryReclaim=gradual
+sparseVhd=true
```
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
## Decisions
- **Repair in place.** There is no ext4/systemd corruption, repos contain uncommitted and diverged work, and rebuilding would add data risk without fixing the scheduled-task/network lifecycle causes.
- **Keep mirrored networking.** It is noisy, but both Windows-host Obsidian MCP endpoints are live through it; NAT would break this known workflow.
- **Do not treat short WSL boots as random corruption.** The 30-minute cadence is explained by `ConversationCapture-Backfill-WSL`. Any change to that task belongs to the Windows-host session.
- **Do not force sparse conversion.** Keep the documented config and safe `--set-sparse` attempt, but stop if updated WSL rejects it.
- **Do not copy AI homes or secrets.** Existing mode-600 `.mcp.env`, Codex auth, GitHub hosts, and mode-700 SSH directory were checked only for permissions; no contents were printed or copied.
- **Defer Git operations.** Local refs show real divergence and active work. No fetch/pull/rebase/reset/commit/push is part of Build 1 without explicit repo-by-repo approval.
## Commands That Changed State
The audit made no WSL, Windows, Git, cache, package, Docker, or `.wslconfig` change. State changes were limited to the required Jarvis documentation:
- `apply_patch` created this findings note.
- The same patch updated `Old Laptop Rebuild - Index.md` by heading.
- The same patch appended one continuity line to `60_Claude/07_AI_Information/Session Logs/log.md`.
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
## Growth Rules
| Growth source | Standing rule | One check command |
|---|---|---|
| WSL swap on C: | Keep explicit `swapfile=D:\\WSL\\swap.vhdx`; verify after every `.wslconfig` change/restart | PowerShell: `Get-Item -Force 'D:\WSL\swap.vhdx'` |
| WSL crash dumps | Record process/time, then remove old dumps only in the Windows-host cleanup | PowerShell: `Get-ChildItem "$env:TEMP\wsl-crashes" | Measure-Object Length -Sum` |
| Editor servers | Keep only active server hash/current extension versions; never clean while an editor is attached | `du -sh ~/.vscode-server ~/.cursor-server ~/.vscode-remote-containers` |
| Package caches | Use tool-native cleanup monthly; measure before and after | `du -sh ~/.npm ~/.local/share/pnpm/store ~/.cache/uv ~/.cache/pip ~/.cargo/registry` |
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
> Removing all editor-server directories while an editor is attached can break the active session. The audit saw no attached VS Code/Cursor process, but approval and a fresh process check are still required immediately before cleanup.
## Flashcards
Why is repair-in-place the correct Dell decision?::Systemd is running with zero failed units and there are no ext4, I/O, OOM, or panic errors, while several repos contain uncommitted or diverged work; a rebuild adds data risk without fixing the scheduled-task and mirrored-network lifecycle causes.
#cards/laptop
What explains the journal's repeated “corrupted or uncleanly shut down” replacements every 30 minutes?::The hidden `ConversationCapture-Backfill-WSL` Scheduled Task starts a short WSL session every 30 minutes; WSL later tears down the VM, and the boot timestamps match that cadence exactly.
#cards/laptop
Why can deleting 42.94 GiB of project artifacts fail to shrink `ext4.vhdx` by 42.94 GiB immediately?::Deletion frees ext4 blocks inside the virtual disk; host allocation changes only after trim and a supported sparse/compaction path.
#cards/laptop
