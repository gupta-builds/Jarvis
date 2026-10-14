---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]]"
  - "[[Google Drive Sync Policy]]"
  - "[[Installations]]"
next: "Status 2026-10-14: sudo step done, DCIM dedupe done, ChatGPT Classic removed. Still open for you: Cursor repair and the fresh WSL export plus old-tar quarantine (60-build5b-host.ps1 stages). Acer applies the Build 5b handoff. See the Index ledgers."
---
# Old Laptop Rebuild - Build 5 WSL and D Drive Findings

## One-Line Answer
==The Dell's WSL configs now match the Acer's real files, the tools, Miniconda, cleanup and watcher timers are in place, and what remains needs sudo, a WSL restart or the Acer: three user commands and an Acer fix list.==

## Result in short
- Config parity done: 27 of 31 comparable files match by SHA-256, starship matches after LF normalisation, and the 3 that differ do so on purpose (gh-dash `repoPaths`, merged `.gitconfig`, `wsl.conf` spacing).
- Installed in user space: ruff 0.17.0, shellcheck 0.11.0, shfmt 3.14.1 (checksum-verified), Miniconda (conda 26.7.1) with `jupyter-base`.
- Freed about 5.9 GB of regenerable caches. Weekly cleanup and daily watcher run as systemd user timers.
- The 36.75 GiB tarball is intact (tar listing and SHA-256 verified). It is not moved yet: a fresh export must exist first.
- Waiting on the user: sudo step, host export, Acer items. Nothing destructive was done on D: or Windows.

## Before and after
| Item | Before | After |
|---|---|---|
| Config files matching the Acer | 4 plugin groups of 17 comparable | 27 exact + 1 LF-normalised; 3 intentional differences |
| Yazi flavor / package.toml | missing (7 files) | `tokyonight-storm` flavor + `package.toml`; `ya pkg list` shows 3 plugins and the flavor |
| `.gitconfig` | Dell keys only | + `core.pager=delta`, `core.fsmonitor`, `core.untrackedCache`, `interactive.diffFilter`, delta, merge, diff keys; identity, credentials, lfs, autocrlf=input kept |
| ruff / shfmt / shellcheck | missing | 0.17.0 / 3.14.1 / 0.11.0 |
| conda | missing | 26.7.1 at `~/miniconda3`, `jupyter-base` (Python 3.12.15, numpy, pandas 3.0.6, scikit-learn 1.9.1), spec at `~/conda/specs/jupyter-base.yml`; disk use 3.6 GB (estimate was 2.7 GB: the package cache stays) |
| `/` used | 56.7 GB | about 54 GB after cleanup plus the 3.6 GB conda install |
| `~/.npm/_npx` | 4.4 GB (32 dirs) | 15 MB |
| `.vscode-remote-containers` | 1.05 GB (9 stale hashes) | 119 MB |
| `.vscode-server` / `.cursor-server` | 5.0 / 3.6 GB | 4.9 / 3.4 GB (old VSIX cache and logs; extensions, servers, Cursor snapshots and globalStorage untouched) |
| Upkeep | none | `wsl-clean.timer` (Sun 04:30) and `wsl-watch.timer` (daily 06:15), linger on, first watcher row written |
| socat | missing | script ready, user runs it |
| WSL Ollama | active, enabled, port 11434 | script ready, user runs it |
| VHDX | 107.58 GiB | unchanged (decision: do nothing until D: free < 150 GiB) |
| Tarball | unverified | tar -tf OK, 455,976 entries (57 s); SHA-256 `d4a23e9195a20ffeed82b7eba706de89474935f502f08224c7203eb013eac326` (543 s over `/mnt/d`) |
| pnpm | 10.33.2 | 10.33.2 (briefly 12.11.2 by my mistake, restored; see Errors) |

## Commands for the user (exact)
1. Sudo step (socat, disable WSL Ollama, verify; sandbox stays off):
   `sudo bash /mnt/d/WSL/ops/build5-sudo-step.sh`
   Afterwards: `wsl-check.sh tools` should show socat, and `ss -ltn | grep 11434` should print nothing. Then start the Windows Ollama from `D:\Apps\Ollama`.
2. Fresh export (about 10 to 25 minutes of downtime; Tailscale SSH is offline meanwhile; the script restarts the distro). From Windows PowerShell, not from WSL, with editors and Codex closed:
   `powershell -ExecutionPolicy Bypass -File D:\WSL\ops\50-wsl-export-verify.ps1`
3. After step 2 succeeds: `powershell -ExecutionPolicy Bypass -File D:\WSL\ops\51-quarantine-old-tar.ps1` (dry run; it refuses without a verified export), then the same with `-Apply`. It moves, never deletes.
4. Optional, not recommended now: `52-wsl-vhdx-compact.ps1` (elevated; stops all of WSL).
5. Health check any time: `wsl-check.sh` (sections: config, tools, disk, swap, editors, backup, dtree).

## State-changing commands I ran (with the user's approval of E1 to E10)
| When | Command | Result |
|---|---|---|
| 15:13 | `30-wsl-config-parity.sh --dry-run --with-tools` | 28 changes planned, 0 fails |
| 15:13 | `30-wsl-config-parity.sh --with-tools` | 28 changes written, 0 fails, backup `~/.config/.toolkit-backups/20261013-151328`, report `parity-20261013-151328.txt` |
| 15:18 | `wsl-clean.sh --apply` (npx, vsix, logs, containers, cache) | 4.6 GB removed; editor items skipped by a self-matching check (bug, fixed) |
| 15:18 | `wsl-clean.sh --apply --items vsix,logs,containers` | 1.3 GB removed |
| 15:19 | `40-wsl-upkeep-install.sh` | two user timers enabled, linger enabled, first watcher row |
| 15:22 | `34-miniconda-jupyter-base.sh --estimate` then `--install` | estimate 245 packages, 395 MB download; installed; `.bashrc` and `.condarc` backed up to `conda-20261013-152244`, `conda init bash` added |
| 15:30 | `corepack prepare pnpm@10.33.2 --activate` | pnpm back on 10.33.2 |
| afternoon | copied `31-wsl-sudo-step.sh` to `D:\WSL\ops\build5-sudo-step.sh`; wrote host scripts 50, 51, 52 there | files only |
| read-only | tarball check, DCIM duplicate report, repo audit, Windows queries via `powershell.exe` | no changes |
Commands the user ran: none yet in this build.

## Decisions E1 to E10 (final)
| # | Outcome |
|---|---|
| E1 | Done: 11 replaced, 7 added, 2 merged. `.bashrc` left alone (E1b), `.wslconfig`, `wsl.conf`, plugins, `tokyo-night` flavor and `plugins-src/` untouched |
| E2 | Script ready; user runs it. Precondition checked: no connections to 11434, no ollama journal entries in 2 days, cloud models only |
| E3 | PowerShell 7 kept |
| E4 | Done |
| E5 | Verified `input` (Acer stays false) |
| E6 | Done after the estimate |
| E7 | Regenerable items removed by `wsl-clean.sh`; Cursor `snapshots` (1.2 GB) and `globalStorage` (1.2 GB) hold user state and stay until the user says so |
| E8 | Verified; export and quarantine scripts ready for the user |
| E9 | Replaced by the user's new layout: `D:\_Anant` canonical, `D:\Users` retired later, Drive mirror on the Dell, Drive backup on the Acer. Recorded in [[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]] and [[Google Drive Sync Policy]]. Nothing moved in Build 5. DriveFS cache stays on C: |
| E10 | Done: timers installed |

## Status ledger (final)
| Item | Status | Note |
|---|---|---|
| WSL version, kernel, systemd | PASS | 3.0.3.0, 6.18.54.1, running, 0 failed units |
| `.wslconfig`, `wsl.conf` | PASS | as intended; Hyper-V firewall default inbound is Block (see Dell-side findings) |
| Config parity | PASS | see Before and after |
| Tools | PASS | user-space tools in; tmux 3.4, node 24.14.1, pnpm 10.33.2 stay behind the Acer by design |
| socat | WAITING USER | sudo |
| WSL Ollama | WAITING USER | sudo |
| bubblewrap, sandbox | PASS / off | 0.9.0 installed, sandbox untouched |
| Editor servers, caches | PASS | regenerable items cleaned; Cursor state items WAITING USER decision |
| Miniconda, jupyter-base | PASS | |
| Upkeep timers | PASS | first scheduled runs 2026-10-14 06:15 (watch), 2026-10-18 04:30 (clean) |
| VHDX sparse / compaction | PASS (decided: do nothing) | host script 52 available |
| Tarball integrity | PASS | |
| Fresh export, quarantine of old tar | WAITING USER | scripts 50, 51 |
| BS\DCIM duplicate report | PASS | 916 groups, 1,834 files, 595 groups span both folders, 3.7 GiB reclaimable; the report is kept outside the vault at `~/.local/state/dcim-duplicates-20261013.tsv` because it lists personal photo names |
| `_Anant` consolidation, Drive mirror | WAITING USER (later build) | contradictions logged |
| Drive stale folder list | BLOCKED | Google no longer lets new backup folders be configured in the app from 2026-06-15; handled in the later build, verify in the app |
| Drive cache | PASS (decided: leave on C:) | `ContentCachePath` could move the content cache, which is about 2 MiB; the 4.2 GiB is metadata; no registry value touched |
| Repo contract audit | PASS (read-only) | see below |
| ConversationCapture-Backfill-WSL | WAITING USER | Ready, starts `wsl.exe` periodically, harmless with idle timers off |
| Host-key comparison, Acer clone and worktree inventory, large transfer, Tunnel sign-in, sync-check from the Acer, port 2222 decision, repo pilot, Firecrawl key rotation | WAITING USER / Acer | not attempted |
| 18 divergent repos | not touched | as instructed |

## Repo contract audit (read-only, 18 repos at depth 4; 55 `.git` entries counting nested trees)
- None of the 18 has `.editorconfig` or `.vscode/extensions.json`. Only 5 have `.gitattributes`.
- Mixed lockfiles: `hub/Assisto_website` (pnpm + npm), `hub/boom-tracer` (npm + bun), `ai/claude/ecc` (npm + yarn). Pick one per repo.
- No lockfile on a Python stack: `hub/CausalOps`, `hub/tradingview`, `work/internship-research-loop` (not a uv project).
- Most repos have no runtime pin (`.nvmrc`, `packageManager`, `.python-version`); only `ecc` and `jan` pin something.
- `.gitignore` lacks an `.env` rule in `adx-worktree-throwaway-test`, `second-brain-claudekit`, `hackathon/safereach`, `boom-tracer`, `gupta-builds`, `internship-research-loop`.
- Repos with uncommitted work (do not edit): Assisto_website 73, portfolio 114, tradingview 13, adx-worktree-throwaway-test 11, internship-research-loop 24, others 1 to 4. Clean candidates for the pilot: `hackathon/opspilot`, `hackathon/safereach`, `hub/Learning-Tracker-Tool`, `ai/jan`, `umn/boom`. Proposal per clean repo: add `.editorconfig` and `.vscode/extensions.json`; nothing else without approval. No repo was changed.
- Full table: rerun `33-repo-contract-audit.sh`.

## Anomalies found on the Acer (these need fixing ON THE ACER)
1. `.gitconfig`: `core.autocrlf=false` silently commits CRLF; the Build 2 keys (`push.autoSetupRemote`, `fetch.prune`, `rerere.enabled`) are absent. `fsmonitor` and `untrackedCache` are on; keep them only if repos stay on ext4 (they do not help on `/mnt/*`).
2. `starship.toml` in the Acer's WSL has CRLF line endings. Run `dos2unix ~/.config/starship.toml` there.
3. `.tmux.conf`: splits do not keep the current directory (add `-c "#{pane_current_path}"`), no `history-limit` (default 2000), no `renumber-windows`, `win32yank.exe` is called by bare name (works only if the Windows PATH is appended), and the comments say WezTerm while the terminal is Windows Terminal. No `allow-passthrough on`, which Yazi image previews inside tmux need.
4. `gh-dash/config.yml`: `repoPaths` points `NousResearch/hermes-agent` at `/mnt/d/Apps/Hermes/hermes-agent`, a Windows-side path; repos belong on ext4.
5. `.bashrc` JARVIS block: every hook is unguarded (`. "$HOME/.atuin/bin/env"` errors if missing), `~/.mcp.env` is sourced into every interactive shell so its secrets reach every process, nvm loads eagerly (slow), and `PATH` is prepended again on every re-source.
6. `.wslconfig`: the snapshot shows 16GB/8 CPUs with no swap line; the correction to 20GB/18/swap on D: is in the notes but unverified. Check with `Get-Content $env:USERPROFILE\.wslconfig` and compare with `/proc/swaps`.
7. Open items from the Acer notes still unconfirmed: chafa 1.14.0 is too old for Yazi image previews (needs 1.16 or newer), the `tmux-handlr` ntfy wiring, `direnv` install.
8. `excluded-wsl.txt` in the snapshot contains one junk line ("Shell cwd was reset"): the export script logged a shell message as an exclusion. Harmless.
9. The Acer's Windows `starship.toml` (2,260 B) equals the WSL one after LF normalisation, so the prompts match; keep it that way.

## Dell-side findings (not Acer)
- The Hyper-V firewall for the WSL VM has default inbound action Block with `firewall=true` and mirrored networking: listeners inside WSL (dev servers, Ollama) are not reachable from the LAN. Tailscale is unaffected. Left as is (no network exposure changes without asking).
- Docker Desktop: `AutoStart` is false in its settings, but the Run key still starts it (Index notes); `IntegratedWslDistros` already lists Ubuntu, so integration is on although the `docker-desktop` distro is stopped. Build 7 decides.
- The Windows `.wslconfig` matches the facts; there is no `.wslgconfig`; the registry lists two distros (Ubuntu, docker-desktop), both on D:.
- Windows C: holds WSL-related files but none that change WSL settings: editor remote-WSL extension scripts (VS Code, Cursor), Hermes agent docs, a Kiro task file `wsl-session-not-recognized.meta.json`, `AppData\Local\wsl`. Nothing to fix in them.
- Sync-conflict files exist in the vault and were left alone: `Build 4 Windows Toolkit Findings.sync-conflict-20261013-020344-VYYX3J5.md`, `Prompt 1 WSL.sync-conflict-20261013-144400-VYYX3J5.md` and `Build 5 Prompt (WSL Parity and D Drive).sync-conflict-20261013-144400-VYYX3J5.md`. Read and compare them before discarding any.

## Errors and root causes
| Error | Root cause | Fix |
|---|---|---|
| First Bash and several Write calls blocked | the fact-forcing hook wants facts before first use | stated request and purpose, retried |
| `pkill -f tarcheck.sh` ended my own shell | pattern matched its own command line | kill by PID |
| tar log flooded with `LIBARCHIVE.xattr` warnings | bsdtar headers read by GNU tar | stderr discarded; not corruption |
| Config-verify step hung | `starship config` opens `$EDITOR` | removed from the check, killed the editor |
| Editor cleanup items skipped | the "editor running" check matched my own tool-call text | check anchored to `/.vscode-server/bin/` style paths; rerun worked |
| `33-repo-contract-audit.sh` written to `~` | forgot `cd` before the heredoc | moved into the scripts folder |
| Lockfile column showed duplicates | bad parameter expansion | rewritten |
| **pnpm jumped to 12.11.2** | my weekly-clean "cache" item deleted `~/.cache/node`, which holds Corepack's pinned pnpm and last-known-good; the next `pnpm` call downloaded the newest | `corepack prepare pnpm@10.33.2 --activate`; `node` removed from the cache list in `wsl-clean.sh`; rule added below |
| Conda disk use above the estimate (3.6 vs 2.7 GB) | the estimate excluded the retained package cache | noted; `conda clean --all` can return about 0.9 GB |
| Drive "mirror running" claim | contradicted live: Drive not running, stale list, drive letters on two accounts | logged in the consolidation note |

## Research used
- [Advanced settings configuration in WSL](https://learn.microsoft.com/en-us/windows/wsl/wsl-config) (page dated 2026-04-15, read in full 2026-10-13): `sparseVhd` applies to newly created VHDs only; `autoMemoryReclaim` values `disabled`, `gradual`, `dropCache`; `instanceIdleTimeout=-1` disables auto shutdown; `vmIdleTimeout` default 60000; `swap`, `swapFile`; `networkingMode=mirrored` needs Windows 11 22H2 or newer; `[automount] options` (including `metadata`), `[interop] appendWindowsPath`, `[boot] systemd`, `[user] default`. The page says nothing about WSL 3.x.
- [Basic commands for WSL](https://learn.microsoft.com/en-us/windows/wsl/basic-commands) and the [FAQ](https://learn.microsoft.com/en-us/windows/wsl/faq): `wsl --export` and `--import` are the supported backup and move path; `--vhd` exports a VHDX for WSL 2. No official verifier exists, so integrity is tar listing plus SHA-256, and only an import test proves bootability (not run, it would register a distro).
- [Use systemd to manage Linux services with WSL](https://learn.microsoft.com/en-us/windows/wsl/systemd) and the freedesktop `systemd.timer` documentation (excerpts): `Persistent=true` catches missed runs; user timers outside a login need `loginctl enable-linger` (now enabled).
- VHDX shrinking is not built in; reports in [microsoft/WSL#4699](https://github.com/microsoft/WSL/issues/4699), [#10703](https://github.com/microsoft/WSL/issues/10703), [#12103](https://github.com/microsoft/WSL/issues/12103). Community-reported, not official.
- [Advanced Drive for desktop configuration](https://support.google.com/a/answer/7644837): `ContentCachePath`, `ContentCacheMaxKbytes`, registry scopes. [Customize Drive for desktop settings](https://support.google.com/drive/answer/13470231): new backup folders cannot be configured in the app from 2026-06-15, Photos backup ends 2026-08-10, Mirror applies to My Drive in a chosen folder, and the local cache cannot sit inside a mirrored folder.

## Build 5b (2026-10-13, later): toolkit upgrade, tarball, duplicates, Cursor, ChatGPT
| Topic | Result |
|---|---|
| sudo step | User ran `build5-sudo-step.sh`: socat installed, WSL Ollama disabled, succeeded |
| Golden configs | `WSL Parity/golden/home` applied with `37-toolkit-apply.sh` (13 files, 0 fails); see [[WSL Toolkit Config Reference]] |
| Upgrades | gh 2.102.0, fzf 0.74.5, rg 15.2.0, fd 10.5.0, bat 0.26.1, lazygit 0.66.1, sesh 2.33.0, gh-dash 4.26.1, node 24.21.0; previous binaries in `~/.local/bin/.prev/`; tmux held at 3.4 at that time (superseded: 3.8 built on 2026-10-14, see the final section below) |
| Tarball | Export of the old Ubuntu from 2026-01-15. 21.7 GB of 36.75 GiB is a Rust `target/` folder from `boom`; also 3.5 GB `src/boom`, 1 GB `/root/boom`, toolchains and caches. Nothing references it. Quarantine after a verified export |
| DCIM duplicates | 916 groups, 918 extra copies, 3,799 MiB; every extra copy verified with `cmp`; deletion run with `62-dcim-dedupe.sh --apply`, log in `~/.local/state/dcim-delete-*.tsv` |
| Repo audit scope | 18 own repos (the 55 `.git` entries include 37 third-party clones under `second-brain-claudekit/sandbox`). Editor contract added (untracked) to opspilot, safereach, Learning-Tracker-Tool; `jan` and `boom` are upstream clones, skipped |
| Cursor | Interrupted in-place update 3.19.7 to 3.19.13 on 2026-09-06; `Cursor.exe` stranded in `_\`; repair in `60-build5b-host.ps1` (user runs) |
| ChatGPT | Classic = `OpenAI.ChatGPT-Desktop`, new "ChatGPT" = `OpenAI.Codex`; Classic removal in `60-build5b-host.ps1` |
| Tailscale | No need to turn it off for the export; do not use `tailscale down` (persists). Clean stop: `sudo systemctl stop tailscaled` |
| Quarantine path | Now `D:\Backup\Quarantine` |
Corrections to Build 5: `core.fsmonitor` was a no-op on Linux and was removed; my cleanup deleted `~/.cache/node` (Corepack pin) and pnpm was restored to 10.33.2. Waiting on the user: run `60-build5b-host.ps1`, decide the pnpm major and tmux version. Future work: [[Old Laptop Rebuild - C Drive AI Platforms Audit (future build)]].

## Build 5 final (2026-10-14): host-script run, tmux 3.8, pnpm 12.4.2, DCIM result
| Topic | Result |
|---|---|
| Laptop | Restarted and updated by the user before this run; WSL up, tailscale/timers fine, D: 452 GiB free |
| Host script run 1 (08:55) | ChatGPT Classic 1.2026.190.0 REMOVED; new ChatGPT (`OpenAI.Codex` 26.1007.9446.0) kept and healthy. Cursor: broken install and stale state quarantined into `D:\Backup\Quarantine` (`cursor-broken-install-2026-10-14`, `cursor-state-*`, `cursor-oldlogs-2026-10-14`), but the reinstall FAILED: winget answered "found an existing package already installed ... no available upgrade" (exit -1978335189) because its registry entry outlived the folder I had just moved. Export prompt returned empty (winget had eaten the console input), so Export and Quarantine were skipped: no export manifest, so the 36.75 GiB tar was correctly NOT moved |
| Fix (script `60-build5b-host.ps1`, Cursor stage) | `winget uninstall` of the stale entry, then `winget install --force`, both fed `$null` on stdin so the later Read-Host prompts keep working. Cursor, then Export plus Quarantine, now run as separate invocations (commands below) |
| Cursor state | Not yet re-installed at the time of writing: `Programs\cursor` is absent; the next run of the Cursor stage installs it. `%APPDATA%\Cursor` user data (settings, extensions, history) was NOT moved except Crashpad, process-monitor, blob_storage, update-supervisor and logs older than 7 days |
| DCIM duplicates | DONE: `62-dcim-dedupe.sh --apply` finished before the restart; 918 files deleted (3,799 MiB), 0 left on disk, log `~/.local/state/dcim-delete-20261013-195126.tsv` maps each deleted path to the kept copy. Empty folders left behind were not removed |
| tmux | 3.8 installed in `~/.local/bin` WITHOUT sudo (no `bison` needed: the release tarball ships a generated `cmd-parse.c`; `38` stubs yacc). apt tmux 3.4 remains at `/usr/bin/tmux` as fallback; `38 --rollback tmux` restores the previous binary. Tested on a throwaway socket: golden `.tmux.conf` loads with no errors, `escape-time 10`, `history-limit 100000`, `allow-passthrough on`, `set-clipboard external`, sesh binds `prefix T` (picker) and `prefix L` (last) present |
| pnpm | 12.4.2 pinned with Corepack to match the Acer (user decision). Store moved to `store/v11`; old v10 store is orphaned (reclaimable). No own repo declares `packageManager`: pinning it per repo is a later, per-repo approval |
| Config verification | `37-toolkit-apply.sh --dry-run`: changed=0, same=34, fails=0. starship prompt, atuin 18.23.0 (hook active, no errors in `doctor`), lazygit 0.66.1, sesh 2.33.0, yazi 26.9.1, gh-dash 4.26.1, bat theme `tokyonight_storm` registered, rg config via `RIPGREP_CONFIG_PATH`, fzf 0.74.5, delta 0.20.1, git include wired (`zdiff3`, no `core.fsmonitor`), `.bashrc` syntax ok with zoxide and atuin hooks |
| Scripts changed | `38-toolkit-upgrade.sh` default set now includes `pnpm` and `tmux` (yacc stub, idempotent check, version table fixed); `60-build5b-host.ps1` Cursor stage as above |
| Decisions closed | pnpm 12.4.2 and tmux 3.8 on both laptops (user). Acer `core.autocrlf=input` stays the recommendation in the handoff note |

### Final commands for the user (no sudo is needed any more)
1. Windows PowerShell (not WSL), repair and test Cursor: `powershell -ExecutionPolicy Bypass -File D:\WSL\ops\60-build5b-host.ps1 -Stages Cursor` and type YES. If it still fails, send the log path it prints.
2. Windows PowerShell, fresh WSL export and old-tar quarantine (10 to 25 minutes of WSL downtime; Tailscale returns by itself): `powershell -ExecutionPolicy Bypass -File D:\WSL\ops\60-build5b-host.ps1 -Stages Export,Quarantine`, YES twice. If the prompt ever skips by itself again, run `-Stages Export` alone.
3. Acer WSL: follow [[Acer Session Handoff - Toolkit Sync (Build 5b)]] (steps run `36`, `37`, `38`; `38` now also pins pnpm 12.4.2 and builds tmux 3.8; close tmux first).

## Growth rules
Standing rule: nothing is removed unless it is a regenerable cache or the user approved it; every move goes to a dated quarantine; every config change keeps a timestamped backup in `~/.config/.toolkit-backups/`.
| What grows or drifts | Rule | One check command |
|---|---|---|
| Config hashes | the 11 replaced files stay equal to the Acer snapshot; edits go to the snapshot first | `wsl-check.sh config` |
| Tool versions | adopt, do not upgrade, except by decision; never delete `~/.cache/node` (Corepack pin) | `wsl-check.sh tools` |
| VHDX growth | revisit compaction when D: free < 150 GiB or the VHDX passes 140 GiB | `wsl-check.sh disk` |
| WSL swap | swap.vhdx stays small; alert at 4 GiB file or 2 GiB in use | `wsl-check.sh swap` |
| Editor servers and caches | the weekly timer only touches regenerable items; Cursor snapshots and globalStorage are decided by hand | `wsl-check.sh editors` and `wsl-clean.sh` (dry run) |
| Tarball and backup | the old tar leaves `D:\WSL\Installers` only after a verified export exists; never deleted | `wsl-check.sh backup` |
| D: tree and Drive | one canonical tree, `D:\Users` retired only in the later build; Drive settings and registry stay untouched until then | `wsl-check.sh dtree` |
| Alerts | the daily watcher writes `~/.local/state/wsl-watch/ALERT`; the Windows watcher owns host-side numbers | `cat ~/.local/state/wsl-watch/ALERT; tail -n 3 ~/.local/state/wsl-watch/history.csv` |
All scripts live in `Old Laptop Rebuild/WSL Parity/_scripts/` (see its README); `wsl-check.sh`, `wsl-clean.sh` and `wsl-watch.sh` are also installed in `~/.local/bin`.

## Waiting on you or the Acer
Acer: apply the nine items above; verify `.wslconfig`; host-key fingerprint comparison; clone and worktree inventory; large-transfer measurement; `ssh.exe anant_gupta@dell-wsl '~/tools/sync-check'`. You: the three commands above; VS Code Tunnel sign-in; port-2222 decision; repo pilot choice; Firecrawl key rotation at the provider (the key is still in plaintext in the Dell `.bashrc`); the ConversationCapture-Backfill-WSL decision; Cursor snapshots and globalStorage; the Drive questions in the consolidation note.
