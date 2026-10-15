---
type: note
status: sprout
created: 2026-10-04
updated: 2026-10-15
course: Life
track:
  - laptop
  - windows
  - wsl
tags:
  - note
related:
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
  - "[[Installations]]"
  - "[[Old Laptop Rebuild - Runs Index]]"
  - "[[Old Laptop Rebuild - Index History (to 2026-10-12)]]"
  - "[[Acer Session Handoff - Toolkit Sync (Build 5b)]]"
  - "[[WSL Toolkit Config Reference]]"
  - "[[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]]"
  - "[[Old Laptop Rebuild - C Drive AI Platforms Audit (future build)]]"
next: "1) Acer, short second visit: socat apt command, Dell-side host-key read, Windows run sheet Part 1 (UAC) and Part 3. 2) Decide the Acer's 4 local-only internship commits. 3) Revoke the Firecrawl key (Dell D1). 4) Write Builds 6, 7 and 8."
---
# Old Laptop Rebuild - Index

## One-Line Answer
==The old Dell (Latitude 5530) is rebuilt to match the Acer in sessions run one layer at a time. Builds 1 to 5 are closed on the Dell (2026-10-15). On the same day the Acer visit ran: Build 5b (WSL toolkit sync) and the Build 2 SSH items are done, and the Windows toolkit got Part 0 and Part 2. What is left is a short list that only you can do (sudo for socat, UAC prompts for Part 1, one Dell-side read for the host-key check, and decisions).==

## Where things are (reorganised 2026-10-14)
| Place | Holds |
|---|---|
| this folder | this Index, the live Acer-side prompts and plans that have not run, living reference notes, and four asset folders |
| `Runs/` ([[Old Laptop Rebuild - Runs Index]]) | everything already run, one folder per build (`Build 1` to `Build 5`), `_backups/` (every dated copy and `sync-conflicts-20261013/`), and the old Index history |
| `Windows Toolkit/` | the Build 4 deliverable: manifest `toolkit.json`, `_scripts/`, `configs/`, `results/`, `toolkit.lock.json`, an empty `catalog/` waiting for Build 4b |
| `WSL Parity/` | the Build 5 deliverable: `_scripts/`, `golden/` configs, [[WSL Toolkit Config Reference]], and the Acer handoff |
| `Acer Dotfile Snapshot/` | the Acer's real Windows and WSL configs, hashes and export scripts |
| parent `New Laptop/` | [[Installations]], [[Ubuntu - WSL]], [[New Laptop Setup]], `Codebases/`, `Sync/`, VS Code notes, and older planning notes (see "Parent folder map" in the Runs Index) |

## Roadmap (state verified against the live Dell on 2026-10-14)
| Build | Layer | State | Prompt | Findings |
|---|---|---|---|---|
| 1 | WSL layer | run, done | [[Old Laptop Rebuild - Prompt 1 WSL]] | [[Old Laptop Rebuild - Build 1 WSL Findings]] |
| 2 | WSL VS Code and two-laptop SSH | run; Dell part done; Acer-side items run 2026-10-15 (only the independent host-key comparison and the repo pilot approval remain) | [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] | [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] |
| 3 | Windows C: cleanup, snapshot, structure, watch | run, done; C: 39.5 to 145 GiB (140.9 GiB free on 2026-10-14) | [[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]] | [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]], [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] |
| 4 | Windows toolkit | run 2026-10-13 (104 PASS, lock written); finished by Build 4b on 2026-10-15 (catalog, agent guide, Installations, Acer run sheet); the Acer parity run waits for the Acer | [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]] | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 4b | Closed Builds 1 to 5 on the Dell: Cursor root cause, WSL export and tar quarantine, Windows Ollama, startup cleanup, OpenClaw removal, catalog, agent guide, Acer run sheet, Installations, Build 5 leftovers, and the Tailscale/SSH decisions (Part B) | **run 2026-10-14 and 15, closed on the Dell** | [[Old Laptop Rebuild - Build 4b Prompt (Dell Leftovers and Tailscale)]] | the "Build 4b" section of [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 5 | Dell WSL parity and tools | run 2026-10-13/14; closed on the Dell 2026-10-15 (export verified, old tar quarantined, Cursor repaired, leftovers moved) | [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]] | [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]] |
| 5b | Acer WSL toolkit sync | **run 2026-10-15 on the Acer; done except `socat` (needs your sudo)** | [[Acer Session Handoff - Toolkit Sync (Build 5b)]] | the handoff note's Results section |
| 6 | Windows VS Code, MCP and Claude Code wiring, AI platforms audit | prompt not written | - | plan: [[Old Laptop Rebuild - C Drive AI Platforms Audit (future build)]] |
| 7 | Dev-only profile and final verification against the Acer (startup apps and Docker auto-start were checked in 4b: nothing auto-starts) | prompt not written | - | - |
| 8 | `D:\_Anant` consolidation and Google Drive | plan only, needs your answers | - | plan: [[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]] |

## Dell: what is left (live-checked 2026-10-15)
Builds 1 to 5 are closed on the Dell. What remains is yours or automatic; nothing here blocks the Acer.
| # | Item | Owner | Detail |
|---|---|---|---|
| D1 | **Firecrawl key still accepted** | you | removed from `.bashrc` (0 lines) and stored nowhere, but Firecrawl's API returned 200 for it at 13:37, 13:47 and 14:06 on 2026-10-15. In the dashboard revoke the key whose "last used" is about 14:06. Never paste a key into a chat or note |
| D2 | Review and delete the old WSL tar | you, on or after 2026-11-14 | `D:\Backup\Quarantine\wsl-tar-review-2026-11-14` (36.75 GiB, README inside). Also remove `ubuntu-20261014-233219.tar.manifest.txt.malformed` in `D:\Backup\WSL`. No import test has ever been run on the new export |
| D3 | Weekly clean first run | automatic | `Toolkit-Weekly-Clean` Sunday 2026-10-18 03:30; afterwards read the newest `D:\WSL\ops\windows\logs\` entry and the watcher alert file. Dry run showed 0.01 GiB |
| D4 | Keep or remove Malwarebytes (two entries), WhatsApp, Rize, GitKrakenCLI | you | Build 7 |
| D5 | Defender exclusions, BIOS battery cap (80 percent) and AC recovery | you | need admin or the BIOS |
| D6 | 11 stale Python 3.13.5 uninstall registrations still listed by `winget list`; `python` on PATH is the Hermes venv | you | decide whether to clear the ghost entries; use `uv run python` meanwhile |
| D7 | Codex config has a WSL `node_repl` path; 13 agent dot-folders hold skill junctions | session | Build 6, see the AI platforms audit |
| D8 | Repo pilot and per-repo `packageManager` pins | you, per repo | Decision 11: one worktree per concurrently active task |
| D9 | `internship-research-loop` is 6 ahead and 5 behind `origin/master` with 25 dirty files | you | `~/tools/sync-check` shows it; no action taken |
| D10 | Quarantine folders to review | you | `build5-leftovers-2026-10-15` (Cursor server data 3.9 GiB, pnpm v10 stores 0.4 GiB, `undo.txt`), the 2026-10-14 Cursor and startup folders; pnpm store `v3` (1.8 GiB, last written 2026-02-22) was not approved and is still in place |
| D11 | Disabled Jarvis tasks `ClaudeKit-Sync-All`, `SecondBrainClaudekit-JarvisSync`; `ConversationCapture-Backfill-WSL` now disabled too | you | left disabled on purpose; re-enable with `Enable-ScheduledTask` if wanted |
Closed in Build 4b, no longer listed: Cursor repair, fresh export and tar quarantine, .NET 8 (kept on purpose for WSL Settings), catalog, agent guide, Installations rewrite, Windows Ollama, Run-key and Startup-folder cleanup (nothing auto-starts), OpenClaw, VS Code Tunnel and port-2222 fallback (both declined).
## Acer: what is left (visit of 2026-10-15 done; live-checked on `gupta-builds`)
| # | Item | State | Where it is written |
|---|---|---|---|
| A1 | Build 5b WSL toolkit sync | **DONE** except `socat`. Golden configs applied (`changed=13 same=21 fails=0`), tmux 3.8, pnpm 12.4.2, gh 2.102.0, rg 15.2.0, fd 10.5.0, bat 0.26.1, lazygit 0.66.1, sesh 2.33.0, delta 0.20.1, atuin 18.23.0, uv 0.12.23, ruff, shellcheck, shfmt installed. **You run:** `sudo apt-get update && sudo apt-get install -y socat bubblewrap` (not `31-wsl-sudo-step.sh`: it also disables a WSL Ollama service that does not exist on the Acer and would stop early) | [[Acer Session Handoff - Toolkit Sync (Build 5b)]], Results |
| A2 | Build 2 SSH items | **DONE** except the independent host-key comparison: the Acer's view of the Dell has no `SSH_HostKeys`, so it needs a Dell-side read you run with sudo (command in the Acer Handoff). Passed: Tailscale placement, direct ping, plain `ssh.exe`, `sync-check` over SSH (identical to the Dell), Acer WSL route, clone inventory. Measured: 17 MB bundle in 2.4 s, 512 MiB stream at 2.5 MiB/s (slow, cause unknown, nothing changed) | [[Old Laptop Rebuild - Build 2 Acer Handoff]], "Acer visit results" |
| A3 | Acer audit findings of 2026-10-13 | `.wslconfig` is fixed and live (20 GB, 18 CPUs, 8 GiB swap at `D:\WSL\wsl-swap.vhdx`; the old 36 MB `swap.vhdx` is in `D:\Backup\Quarantine\swap-vhdx-review-2026-10-15`); the weekly clean no longer deletes `~/.cache/node`; pnpm back on 12.4.2. **Still open:** WSL is 2.7.14.0 while the Dell is 3.0.3.0 (updating is a host step and your decision); the Ubuntu disk is 40 GiB and 72 percent used; recurring DNS-check journal noise | [[Ubuntu - WSL]], section "Acer toolkit sync and swap fix - 2026-10-15" |
| A4 | Windows toolkit on the Acer | **Part 0 and Part 2 done.** Part 0 found 5 install actions; Part 2 wrote the managed profile blocks, git settings, delta include, Terminal merge, PATH order and two environment variables. **Waiting:** Part 1 (Git and GitHub CLI upgrade with UAC, pnpm 12.11.2, uv Python, mcp-remote) and Part 3 (verify and catalog), then the Dell writes the parity matrix | [[Acer Run Sheet - Windows Toolkit]], section "Acer run log, 2026-10-15" |
| A5 | **Acer internship clone holds 4 commits that exist nowhere else** (branch `acer-predator/repo-environment-setup`, upstream deleted on GitHub) | protected by a verified Git bundle in `D:\Backup\repo-bundles\`; you decide: push the branch, or bring the commits to the Dell session (the Dell checkout is 6 ahead and 5 behind with 25 dirty files, and its note says the repo is not a uv project while the Acer commits adopt uv) | [[Old Laptop Rebuild - Build 2 Acer Handoff]] |
| A6 | Acer Windows host: Drive backup scope, Drive account question | unchanged | the Drive plan note |
| A7 | Shared bat and fd configs in `Windows Toolkit/configs/` are "reconstructed"; the Acer's own files are the real ones and differ | decide whether to promote the Acer's files into the shared source (then the Dell re-runs `20-apply-configs.ps1`) | [[Acer Run Sheet - Windows Toolkit]] |
Per-repo `packageManager` pins (none of your repos set one) stay a per-repo approval for both laptops.

## Order
1. Acer, short second visit: the `socat` apt command (A1), the Dell-side host-key read (A2), Part 1 of the Windows run sheet with its UAC prompts (A4), then Part 3 (verify and catalog). The Dell session then reads both result sets and writes the parity matrix. Decide A5 and A7.
2. Dell, whenever you like: D1 (revoke the Firecrawl key), then D2 to D11.
3. Build 6 (Windows VS Code, MCP and Claude Code wiring; reaches the Acer through Settings Sync), then Build 7.
4. Build 8 only after you answer the Drive questions.
## Standing decisions (locked, do not relitigate)
- **Two-laptop workflow (2026-10-04):** the Dell is the canonical host with one checkout per shared repo on WSL ext4. The Acer connects with VS Code Remote-SSH over Tailscale. GitHub is the backup and PR channel, parallel work uses git worktrees with `<machine>/<topic>` branches, and no sync daemon touches code. Details: [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]].
- **Tailscale placement:** inside WSL on the Dell, Windows side only on the Acer. Never on the Dell's Windows side, never inside the Acer's WSL.
- **Settings Sync is live.** Any Windows VS Code user file written on the Dell reaches the Acer. Windows VS Code, MCP and Claude Code settings are Build 6's.
- **Mirrored networking stays** (Jarvis MCP from WSL needs `127.0.0.1:27123`).
- **Never `wsl --shutdown`** from inside WSL and never restart WSL from a session; host steps go into a script you run.
- **No discrete GPU on the Dell** (Iris Xe only); heavy local-model work belongs on the Acer (RTX 5070 Ti).
- **Layout contract (Build 3b):** C: holds Windows, installs, drivers and the profile; `D:\Apps`, `D:\Cache\<tool>`, `D:\AI`, `D:\WSL`, `D:\Backup` hold the rest; a new tool sets its environment variable first. **Quarantine is `D:\Backup\Quarantine`** (it was `D:\Quarantine` until 2026-10-13).
- **Reversible deletions:** quarantine anything that is not a regenerable cache. Never delete `~/.cache/node` (it holds the Corepack pin).
- **Always-on host:** weekly clean and a daily read-only watcher on Windows (`Toolkit-Weekly-Clean`, `Toolkit-Watch-C`) and as WSL user timers (`wsl-clean.timer`, `wsl-watch.timer`).
- **Shared toolkit versions (2026-10-14):** pnpm 12.4.2 and tmux 3.8 on both laptops; Windows Terminal scheme `One Half Dark` with font `IosevkaTerm Nerd Font` on both; PowerShell 7 is the default shell; the golden WSL configs in `WSL Parity/golden/` are the single source.
- **Drive and `_Anant` (2026-10-13):** `D:\_Anant` becomes the one main folder, Jarvis and The Plan stay out of any Drive mirror, no mirror is turned on until codebases and cache trees leave the mirrored root.

## Current state (verified live, 2026-10-15)
- **Dell Windows:** C: 138.4 GiB free, D: 400.2 GiB (D: carries the 54.47 GiB export). Cursor 3.24.18 with auto-update on; Windows Ollama 0.40.3 on `127.0.0.1:11434`; OpenClaw, E START App, Python 3.13.5 and Chocolatey gone; .NET 8 kept for WSL Settings; nothing in the Run key or Startup folder starts by itself. The catalog and the agent guide exist; the Windows tables in [[Installations]] are current.
- **Dell WSL:** 3.0.3.0, systemd running, both upkeep timers on, tmux 3.8, pnpm 12.4.2 through Corepack, WSL Ollama off. No key in `.bashrc`. Cursor server data and the old pnpm v10 stores are in the quarantine.
- **Tailscale:** `dell-wsl` and `gupta-builds` connected, `RunSSH` true. Tailscale SSH is the only path: port-2222 fallback and VS Code Tunnel were declined.
- **WSL export:** `D:\Backup\WSL\ubuntu-20261014-233219.tar` (54.47 GiB, 1,114,217 entries, SHA-256 in the manifest); listing verified with GNU tar, **no import test run**.
- **Acer WSL (2026-10-15):** Ubuntu 24.04 on WSL 2.7.14.0, kernel 6.18.33.2, systemd running with 0 failed units, 19 GiB RAM, 18 CPUs, 8 GiB swap, `/` 39 GiB with 11 GiB free; tmux 3.8, pnpm 12.4.2 through Corepack (the weekly clean no longer deletes its pin), golden configs applied, guarded `.bashrc`. Tailscale is on the Windows side only (1.104.1, `gupta-builds`).
- **Acer Windows (2026-10-15):** managed profile blocks written to both PowerShell profiles, git settings (`autocrlf=input`, `pull.rebase`, `push.autoSetupRemote`, `fetch.prune`, `rerere`, `init.defaultBranch`), `STARSHIP_CONFIG` and `TOOLKIT_VAULT_ROOT` set, `~\.local\bin` first on PATH. Backups in `D:\Backup\Toolkit\20261015-170556`.
## Stale notes (status)
Patched on 2026-10-13/14: the tarball path and size, Ollama and "Dell retired" in [[Ubuntu - WSL]], bubblewrap, Build 2 ledger rows, the pnpm key, the six Build 2 corrections, the systemd statements, the Acer `.wslconfig` values, the Installations WSL section and two Installations Windows bullets.
Still open: Docker auto-start wording in [[VS Code - Windows]] (the Run-key entry exists but is disabled in StartupApproved, and Docker did not start at boot); [[Old Laptop Decommission Checklist]], `WSL New Laptop Master Plan` and [[WSL Session Briefing]] are historical (their Ollama and "Dell retired" statements are out of date; the live machine wins).

## Logging rule for every session
1. A session writes `Old Laptop Rebuild - Build N <layer> Findings.md` next to its prompt, with a before and after table, every state-changing command, the root cause of every error, and a Growth rules section. It adds one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
2. **One owner per note.** The 2026-10-13 sync conflicts happened because two Dell sessions edited the same notes (one under a renamed `_Rebuild - Index`). Only the session that closes a build edits this Index and the Runs Index; other sessions write only their own findings note.
3. When a build closes, its prompt and findings move into `Runs/Build N .../` and its row here changes state. Only prompts that still need to run stay in this folder.
4. If Syncthing writes a `*.sync-conflict-*` file, diff it against the live note, merge anything unique, then move it to `Runs/_backups/sync-conflicts-<date>/`. Never leave it beside the note.
