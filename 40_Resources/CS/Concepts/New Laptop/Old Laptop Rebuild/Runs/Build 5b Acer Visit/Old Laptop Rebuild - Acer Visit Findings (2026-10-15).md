---
type: note
status: sprout
created: 2026-10-15
updated: 2026-10-17
course: Life
track:
  - laptop
  - windows
  - wsl
tags:
  - note
  - laptop
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Runs Index]]"
  - "[[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]]"
  - "[[WSL Toolkit Config Reference]]"
  - "[[Ubuntu - WSL]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
next: "Open on the Acer side: decide the 4 local-only internship commits, then the discussion on what WSL is for on the Acer. Build 6 wires Windows VS Code, MCP and Claude Code."
---
# Old Laptop Rebuild - Acer Visit Findings (2026-10-15)

## One-Line Answer
==On 2026-10-15 the Acer applied everything the Dell had built: the WSL golden toolkit (Build 5b), Parts 0 to 3 of the Windows toolkit (Build 4) and all Build 2 SSH checks, plus a WSL platform update to 3.0.3.0; both laptops now run the same configs and nearly the same tool versions, the independent SSH host-key check matched, and the one real risk found is four internship commits that exist only on the Acer.==

## Scope and sources
Everything in the Acer sections is **Acer-reported** by the Claude and user sessions that ran on `gupta-builds` between 16:41 and about 19:00 CDT on 2026-10-15; the Dell session could read their notes and result files but cannot see the Acer's disk. Where the Dell could check a claim (the host key, the Windows catalogs, the config hashes) it did, and that is marked. This note replaces three instruction notes that existed only to drive that visit: the Acer WSL handoff (Build 5b), the Windows run sheet and the Build 2 Acer handoff. Their results are kept here; their step lists are condensed into "How to repeat this on a machine" at the bottom. Raw evidence is in the vault: `Windows Toolkit/results/GUPTA-BUILDS/*.json`, `Windows Toolkit/catalog/Tool Catalog - GUPTA-BUILDS.md`.

## Before and after (Acer)
| Area | Before the visit | After |
|---|---|---|
| WSL configs vs golden set | `wsl-check` baseline: 30 MATCH, 1 DIFF against the old September snapshot | `37-toolkit-apply.sh`: `changed=13 same=21 fails=0`; 22 MATCH and 9 intentional DIFF against the old snapshot (atuin, gh-dash, git ignore, lazygit, sesh, starship now LF, yazi.toml, `.tmux.conf`, `.gitconfig`). The 9 are the golden set replacing the September files on purpose, not drift |
| WSL tools | tmux 3.7c, pnpm 12.11.2 (floated), uv 0.12.17, delta 0.19.2, lazygit 0.65.1, atuin 18.22.0, sesh 2.30.1, gh 2.45.0; ruff, shellcheck, shfmt, socat missing | tmux 3.8 (built from source, no sudo), pnpm 12.4.2 pinned, uv 0.12.23, delta 0.20.1, lazygit 0.66.1, atuin 18.23.0, sesh 2.33.0, gh 2.102.0, fzf 0.74.5, rg 15.2.0, fd 10.5.0, bat 0.26.1, ruff 0.17.1, shellcheck 0.11.0, shfmt 3.14.1, codex 0.162.1; socat 1.8.0.0 and bubblewrap 0.9.0 installed by the user with sudo |
| WSL platform | WSL 2.7.14.0, kernel 6.18.33.2 | WSL 3.0.3.0, kernel 6.18.54.1-1, WSLg 1.0.79, MSRDC 1.2.7391 (script `70-acer-wsl-update.ps1`, 1 min 15 s, 18:48) |
| `.wslconfig` | launch-failing file with a swap path problem | `memory=20GB`, `processors=18`, `swapFile=D:\WSL\wsl-swap.vhdx`, `swap=8GB`, mirrored, `firewall=true`, `dnsTunneling=true`, `autoProxy=true`, `[experimental] sparseVhd=true`, `autoMemoryReclaim=gradual`; live: 19 GiB, 18 CPUs, 8 GiB swap on `/dev/sdc`. The old `D:\WSL\swap.vhdx` (36 MB) was quarantined on the Acer with a 2026-11-15 review date |
| Windows toolkit | partial (fzf, fd, bat, delta, zoxide, PSFzf from 2026-10-12) | Parts 0 to 3 run; `99-verify.ps1` **0 FAIL**; managed profile blocks in both PowerShell profiles, git settings (`autocrlf=input`, `pull.rebase`, `push.autoSetupRemote`, `fetch.prune`, `rerere`, `init.defaultBranch`), `STARSHIP_CONFIG` and `TOOLKIT_VAULT_ROOT` set, `~\.local\bin` first on PATH; PowerShell 5.1 and 7 start in about 1.5 s |
| `~/.mcp.env` exposure | sourced into every interactive shell, so three MCP keys reached every process | no longer sourced; wrapper functions for `claude`, `codex`, `kiro-cli`, `agy` and `opencode` load it inside that one process (`_ai_run`); verified from a clean `env -i` shell: none of the keys is exported, `claude mcp list` shows jarvis, the-plan and jarvis-fs connected. **Acer-local**, not in the golden set |
| Weekly clean | `~/tools/weekly-cache-cleanup.sh` (Sunday 03:00) deleted `~/.cache/node` | deletion block removed; Corepack pnpm pin is safe again |
| Two-laptop SSH | Remote-SSH and plain `ssh.exe` worked; host key only accepted, never compared | host key **MATCH** (Dell-side read), `sync-check` over SSH identical to the Dell's run, Acer WSL route works, clones inventoried (below) |

## Part 1: WSL toolkit sync (Build 5b on the Acer)
Steps run in order with backups to `~/.config/.toolkit-backups/`: health baseline (`36-wsl-check.sh`), tmux server closed, `37-toolkit-apply.sh`, `38-toolkit-upgrade.sh`, TPM plugin install (all six plugins), then the Acer-only fixes. Found and fixed beyond the planned fix table:
- **The cause of the pnpm float:** the Acer's own weekly cleanup deleted `~/.cache/node`, which holds Corepack's pnpm pin; that is how pnpm reached 12.11.2. The same mistake had happened on the Dell in Build 5 (see that note). Rule: nothing may delete `~/.cache/node` on any machine.
- **Not covered by `38-toolkit-upgrade.sh`, done by hand:** delta, atuin (release tarballs with SHA-256 checked against GitHub digests), uv (`uv self update`), codex (`npm i -g`), ruff (`uv tool`), shellcheck and shfmt (checksum checked). Old binaries are in `~/.local/bin/.prev`.
- **Item 7 (`.bashrc` hardening):** every JARVIS hook guarded with `command -v`, `~/.local/bin` added to PATH only if absent, duplicate nvm load removed, `bash -n` passes, new-shell startup 0.57 s.
- **`bat cache --build`** was needed once because the first run reported an incompatible cache from the older bat.
- **tmux-handlr ntfy topic:** `~/.config/tmux-handlr/ntfy.env` exists (mode 600); the topic value was not read or recorded.
- **Do not run on the Acer:** `31-wsl-sudo-step.sh` (it also runs `systemctl disable --now ollama`, which fails there because no WSL Ollama exists, and with `set -e` it would stop before its checks) and `30-wsl-config-parity.sh` (it would overwrite the golden configs with the old snapshot). For socat: `sudo apt-get update && sudo apt-get install -y socat bubblewrap`.
- **Golden-set notes for the Dell:** `36-wsl-check.sh` had the Dell's vault path and the old swap file name hard-coded and now detects both; `37` does not set `core.autocrlf`, so `input` was set by hand; the shared bat and fd configs were reconstructions (promoted, below).

## Part 2: Windows toolkit on the Acer (Build 4, Parts 0 to 3)
| Part | Result |
|---|---|
| 0 (read-only) | preflight 47 manifest entries, 5 planned actions; the dry run would upgrade GitHub CLI, install pnpm, a uv-managed Python and mcp-remote; Node reported MANUAL because the manifest names `OpenJS.NodeJS.22` and the Acer is on 24.19.0 |
| 1 (UAC) | `INSTALLED=3 MANUAL=1 OK=30 UPGRADED=1`: pnpm 12.11.2, uv-managed Python 3.13.15, mcp-remote 0.2.1; GitHub CLI 2.101.0 to 2.102.0; Git was already 2.55.0 |
| 2 (apply) | starship and git ignore unchanged (hashes equal), delta include written, both profile blocks written, Terminal merged (Acer profiles kept), 9 git settings changed, user PATH order fixed, two environment variables set. Backups in `D:\Backup\Toolkit\20261015-170556` (restore with `-RestoreFrom`) |
| 3 (verify, catalog) | `99-verify.ps1` **0 FAIL**; every config, git, profile, Terminal, font, environment and startup check PASS; `40-build-catalog.ps1` PASS, 41 manifest tools |
Promotion: the Acer's real `bat` and `fd` configs were copied byte for byte into `Windows Toolkit/configs/` (SHA-256 `F613417D...` and `6A549EAF...`); the shared copies had been reconstructions. `toolkit.json` was not edited, so the Dell lock stays valid. **Dell action, done 2026-10-17:** `20-apply-configs.ps1` ran on the Dell (bat and fd written, hashes match, and the Dell's user PATH was put back in the right order, `~\.local\bin` first).

### Windows parity matrix (Dell lock vs Acer catalog, computed 2026-10-17)
| Group | Tools | Verdict |
|---|---|---|
| Identical versions (22) | PowerShell 7.6.7, Windows Terminal, Starship 1.26.0, IosevkaTerm Nerd Font v3.5.1, zoxide, fzf, PSFzf, fd, bat, delta, Git 2.55.0, GitHub CLI 2.102.0, jq, NanaZip, pnpm 12.11.2, uv 0.12.19, uv Python 3.13.15, winget, Codex 0.162.1, VS Code 1.142.0, mcp-remote, uvx | PASS |
| Acer newer (DIFF, benign) | ripgrep 15.2.0 vs 15.1.0; ffmpeg 9.0.1 vs 8.1.2; Claude Code 2.1.301 vs 2.1.300; Claude Desktop 2.42304 vs 2.37337; Docker Desktop 4.91.0 vs 4.56.0; Docker CLI 29.8.0 vs 29.1.3 | DIFF: the Acer updated itself; the lock records the Dell |
| Acer older (DIFF) | Node 24.19.0 vs 24.20.0 (and npm, npx); Cursor 3.24.9 vs 3.24.18; Antigravity 2.13.0 vs 2.22.0; Ollama 0.34.1 vs 0.40.3 | DIFF: Node is a user decision; the rest self-update |
| Dell only, by design (3) | Miniconda, opam, Kiro | not part of the Acer toolkit |
| Tailscale | Acer: installed on Windows as `gupta-builds`, 1.104.1; Dell: absent on Windows (runs in WSL) | PASS, as locked |
| Shared configs | starship, git ignore, delta include, bat, fd ignore, both profile blocks, Terminal fragment | PASS on both (Acer's `bat` and `fd` showed DIFF only before the promotion) |
| WSL golden configs | Dell `37 --dry-run`: `same=34 changed=0`; Acer `same=21` after `changed=13` | PASS: both on the golden set |
Free space at catalog time: Dell C: 138.5 / D: 404.7 GiB; Acer C: 166.5 / D: 518.5 GiB. Drift above is why the lock is the reference and is not auto-enforced.

## Part 3: Build 2 SSH checks from the Acer
| Check | Result | Evidence |
|---|---|---|
| Tailscale placement | PASS | Windows 1.104.1 connected as `gupta-builds` (`100.84.91.11`); inside the Acer WSL there is no `tailscale` binary, no package, `tailscaled` not active |
| Route | PASS | direct `via 10.5.8.253:41641`, 4 to 5 ms (13 ms in a later sample); control plane shows `dell-wsl` online with relay `ord` |
| Remote command | PASS | plain `ssh.exe anant_gupta@dell-wsl` ran `hostname` (`DESKTOP-3VBG0JH`) and `uptime`; Tailscale SSH asked for its browser "check" authentication once |
| **Host key** | **PASS (MATCH), closed 2026-10-15** | Neither side's `tailscale status --json` carries `SSH_HostKeys` for the Dell (checked on both). The user ran `71-hostkey-fingerprint.sh` on the Dell (and an equivalent openssl one-liner): `SHA256:PHOUaZNkip9YvF80hW6WbG5emclHt7rIYMfWf3VzxHA`, equal to the key the Acer accepted; `known_hosts` and `ssh-keyscan` agree. `ssh-keygen -lf` cannot read Tailscale's PKCS8 key file, hence the script |
| `sync-check` over SSH | PASS | identical to the Dell's local run: second-brain-claudekit `main` 0/0, dirty 1; internship-research-loop `dell-latitude/deadline-quota-and-reseed-fixes` 6 ahead / 5 behind `origin/master`, dirty 25. The `node`, `pnpm`, `uv` lines read `not-installed` over a non-interactive shell (nvm and `~/.local/bin` are set in the interactive `.bashrc`); the repo lines are the check |
| Large transfer | measured, slow | 17,039,678-byte `git bundle` streamed in 2.38 s (6.8 MiB/s); a 512 MiB stream took 197 s, **2.5 MiB/s**, on a direct 4 to 13 ms path. Cause not established (candidates: one SSH stream through the Dell's userspace Tailscale, `tailscale0` MTU 1280, mirrored networking). No setting changed. The largest repo history on the Dell is `jan` at 1.5 GB: test before cloning it over this link |
| Acer WSL route | PASS | `dell-wsl` resolves to `100.94.129.113` in the Acer WSL, `tcp/22` reachable, `ssh` with a temporary known-hosts file holding only the verified key ran `hostname` |
| Remote-SSH execution location | not re-tested | the 2026-10-12 evidence stands (extension host on the Dell WSL server); needs a GUI VS Code window |
Gotcha: Tailscale SSH "check" mode asks for a browser confirmation after a period of inactivity; a non-interactive run prints a `login.tailscale.com/a/...` URL and waits.

### Clone and worktree inventory (Acer)
| Path | Branch and upstream | Ahead / behind | Dirty | Size | Role and proposal |
|---|---|---|---|---|---|
| `~/projects/ai/second-brain-claudekit` | `main`, `origin/main` | 0 / 0 | 0 | 211 MB | clean, no unique work; relabel as behind the Dell, retire only after approval |
| `~/projects/work/internship-research-loop` | `acer-predator/repo-environment-setup`, upstream **gone** on origin | 4 / 5 vs `origin/master` | 0 | 40 MB | **holds 4 commits that exist nowhere else** (2026-10-03: `645a6c5` remove `.agents` mirror and keep Codex config only under `.codex`; `3e986c7` move 21 mirrored skill files into `.codex/skills`; `51b0377` adopt uv with `pyproject.toml` and `uv.lock`; `e0788fe` ignore machine-local settings, env files and tool caches; 24 files, 541 insertions). Do not retire |
| `~/projects/work/gupta-builds` | `main` | in sync | 1 untracked | 0.5 MB | not a shared repo |
| `~/projects/scratch/gpu-smoke-test` | `main`, no commits | n/a | 6 untracked | 5.3 GB | scratch, not a shared repo |
No Windows-side clone of either shared repo exists. Protection made without touching the repo: `D:\Backup\repo-bundles\internship-research-loop-acer-20261015.bundle` (1.6 MB, `git bundle verify`: complete history, SHA-256 `64e07ec865aaa0b45bb5eecebffe054f4d472407b2af53a1ae6a4f992353257a`). **Decision for the user:** push `acer-predator/repo-environment-setup` to GitHub, or bring the four commits to the Dell session. The Dell's internship checkout is itself 6 ahead / 5 behind with 25 dirty files and is not a uv project, while commit `51b0377` adopts uv, so the two histories need a deliberate merge.

## Acer WSL disk (inventory for the planned discussion, read-only)
`/` is 39 GiB (72 percent used, 11 GiB free) with `ext4.vhdx` 28.9 GiB on D:. Largest items: `~/.cache` 7.7 GB (uv 7.5 GB, regenerable), `.vscode-server` 4.1 GB, `miniconda3` 3.8 GB, `.codex` 2.1 GB, `.local` 1.8 GB, `.rustup` 1.5 GB, `.npm` 0.9 GB, `.nvm` 0.7 GB, `.cargo` 0.5 GB, `projects` 252 MB plus `scratch/gpu-smoke-test` 5.3 GB. The Acer has no `wsl --export` backup yet: take one before any resize. Planned discussion (after the builds): what the Acer's WSL is for now that the Dell hosts the code, what to do with the two clones and `gpu-smoke-test`, resize versus rebuild, and which Windows pieces make Remote-SSH smoother.

## Errors and root causes (Acer)
| Error | Root cause | Fix |
|---|---|---|
| Every Windows toolkit script failed with "The term 'Get-FileHash' is not recognized" | started from a shell that inherited PowerShell 7's `PSModulePath`, so Windows PowerShell 5.1 loaded PowerShell 7's utility module first | `$env:PSModulePath = [Environment]::GetEnvironmentVariable('PSModulePath','Machine')` before starting; a normal 5.1 window does not need it. Worth a guard in `_lib.ps1` |
| Part 3 failed with "'\_scripts\99-verify.ps1' does not exist" | `$TK` was undefined in the new terminal window | define `$V` and `$TK` in every new window |
| pnpm floated to 12.11.2 | the Acer's weekly cleanup deleted `~/.cache/node` | deletion removed; rule recorded |
| `70-acer-wsl-update.ps1` printed a blank `systemd:` line | it checks a few seconds after the restart | cosmetic; check `systemctl is-system-running` after a minute (it was `running`) |
| `ssh-keygen -lf` on the Tailscale host key: "is not a key file" | Tailscale stores a plain PKCS8 PEM | `71-hostkey-fingerprint.sh` derives the public key with openssl |
| Docker Desktop closed by the WSL update | `wsl --update` / shutdown stops all distros | the user reopens it; its engine was not running at the check |

## Open after the visit
1. Decide the Acer's 4 local-only internship commits (push the branch, or bring them to the Dell session).
2. Discussion: the role of WSL on the Acer (disk 72 percent used, no export backup).
3. Remote-SSH execution-location re-check in a GUI window; clone retirement approvals.
4. Why the SSH stream is only 2.5 MiB/s (measure before cloning large histories).
5. Reopen Docker Desktop on the Acer.
6. Move the Acer's Node 24.19.0 to the lock's 24.20.0 only if wanted (manifest policy is manual).

## Growth rules
| Standing rule | Check |
|---|---|
| Nothing deletes `~/.cache/node` on any machine (it holds the Corepack pin) | `grep -rn "cache/node" ~/tools ~/.local/bin ~/.config/systemd 2>/dev/null` must show only comments |
| Size a repo's transfer cost without cloning | `ssh <host> 'cd <repo> && git bundle create - --all' \| wc -c` |
| Start Windows toolkit scripts from a clean 5.1 environment | `$env:PSModulePath = [Environment]::GetEnvironmentVariable('PSModulePath','Machine')` |
| Secrets reach only the tools that need them | from `env -i bash -ic 'env \| grep -c _API_KEY'` expect 0 outside the AI-CLI wrappers |
| A WSL update closes Docker Desktop | reopen it and check `docker version` |

## How to repeat this on a machine (condensed from the retired instruction notes)
**Windows side** (normal PowerShell, scripts in `Windows Toolkit/_scripts`, vault root differs per machine): set `$V` (vault root) and `$TK` (toolkit folder); run `00-preflight.ps1`, `10-install-toolkit.ps1 -DryRun`, `20-apply-configs.ps1 -DryRun` and `99-verify.ps1` first (read-only); then `10-install-toolkit.ps1` (UAC prompts), `20-apply-configs.ps1`, a fresh window, `99-verify.ps1`, `40-build-catalog.ps1`. Pass `-Machine acer` or `-Machine dell` if the vault path is unusual. Never run `11-node-lts-swap.ps1` or `04-admin-remove.ps1` on the Acer. Never pass `-WriteLock` on the Acer.
**WSL side** (scripts in `WSL Parity/_scripts`): `36-wsl-check.sh`, close tmux, `37-toolkit-apply.sh --dry-run` then real, `38-toolkit-upgrade.sh --dry-run` then real, `prefix + I` once in tmux. Details of each config: [[WSL Toolkit Config Reference]].
**SSH checks:** `tailscale.exe ping dell-wsl`; plain `ssh.exe anant_gupta@dell-wsl`; read the host key on the Dell with `71-hostkey-fingerprint.sh` (sudo); `ssh dell-wsl '~/tools/sync-check'`.
