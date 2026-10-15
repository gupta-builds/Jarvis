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
next: "1) One Acer visit: the Build 5b handoff, Part 0 of the Windows run sheet, and the Build 2 SSH items. 2) Revoke the Firecrawl key that the API still accepts (Dell item D1). 3) Write Builds 6, 7 and 8."
---
# Old Laptop Rebuild - Index

## One-Line Answer
==The old Dell (Latitude 5530) is rebuilt to match the Acer in sessions run one layer at a time. Builds 1 to 5 are closed on the Dell (2026-10-15), with a short list of items that only you can do; nothing has run on the Acer yet, and its two handoffs (WSL toolkit and Windows toolkit) are ready.==

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
| 2 | WSL VS Code and two-laptop SSH | run; Dell part done, Acer-side Phase 4 items still open (see Acer ledger) | [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] | [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] |
| 3 | Windows C: cleanup, snapshot, structure, watch | run, done; C: 39.5 to 145 GiB (140.9 GiB free on 2026-10-14) | [[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]] | [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]], [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] |
| 4 | Windows toolkit | run 2026-10-13 (104 PASS, lock written); finished by Build 4b on 2026-10-15 (catalog, agent guide, Installations, Acer run sheet); the Acer parity run waits for the Acer | [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]] | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 4b | Closed Builds 1 to 5 on the Dell: Cursor root cause, WSL export and tar quarantine, Windows Ollama, startup cleanup, OpenClaw removal, catalog, agent guide, Acer run sheet, Installations, Build 5 leftovers, and the Tailscale/SSH decisions (Part B) | **run 2026-10-14 and 15, closed on the Dell** | [[Old Laptop Rebuild - Build 4b Prompt (Dell Leftovers and Tailscale)]] | the "Build 4b" section of [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 5 | Dell WSL parity and tools | run 2026-10-13/14; closed on the Dell 2026-10-15 (export verified, old tar quarantined, Cursor repaired, leftovers moved) | [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]] | [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]] |
| 5b | Acer WSL toolkit sync | **ready, not run** | [[Acer Session Handoff - Toolkit Sync (Build 5b)]] | the handoff note's Results section |
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
## Acer: what is left (nothing has been run there from this folder)
| # | Item | Where it is written |
|---|---|---|
| A1 | **The one ready build:** Build 5b, steps 1 to 7 and the 15-row fix table (git keys, starship CRLF, tmux, gh-dash paths, `.bashrc` hardening, atuin, tool versions, chafa and direnv, `.wslconfig`, pnpm 12.4.2, tmux 3.8) | [[Acer Session Handoff - Toolkit Sync (Build 5b)]] |
| A2 | Build 2 SSH items: independent host-key comparison (read from the Acer's own `tailscale.exe status --json`), `ssh dell-wsl '~/tools/sync-check'`, clone and worktree inventory, large-transfer check, optional WSL route test | [[Old Laptop Rebuild - Build 2 Acer Handoff]], steps 3 to 5 |
| A3 | Acer audit findings from 2026-10-13: Acer WSL is 2.7.14.0 (Dell is 3.0.3.0); saved `.wslconfig` (20GB, 18 CPUs, swap on D:) is not active until you cold-restart WSL; the Ubuntu disk is 40 GiB and 70 percent used; uv cache 7.5 GiB; its weekly clean deletes `~/.cache/node` (the Corepack pin) and pnpm floated to 12.11.2; recurring DNS-check errors | [[Ubuntu - WSL]], section "Acer audit and launch correction - 2026-10-13" |
| A4 | Windows toolkit parity: Part 0 is a read-only paste-back (the Acer already has pieces from 2026-10-12); the Dell then writes the parity matrix | [[Acer Run Sheet - Windows Toolkit]] |
| A5 | Acer Windows host: its Drive backup scope, Drive account question | the Drive plan note |
Recommendation: fold A2 and A3 into the same Acer session as A1 (one Acer visit), with A3's `wsl --shutdown` and WSL update left as host steps for you.

## Order
1. One Acer visit, in this order: the Windows run sheet Part 0 (read-only), the Build 5b WSL handoff, the Build 2 SSH items. The Dell session then reads the paste-backs and writes the parity matrix.
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
## Stale notes (status)
Patched on 2026-10-13/14: the tarball path and size, Ollama and "Dell retired" in [[Ubuntu - WSL]], bubblewrap, Build 2 ledger rows, the pnpm key, the six Build 2 corrections, the systemd statements, the Acer `.wslconfig` values, the Installations WSL section and two Installations Windows bullets.
Still open: Docker auto-start wording in [[VS Code - Windows]] (the Run-key entry exists but is disabled in StartupApproved, and Docker did not start at boot); [[Old Laptop Decommission Checklist]], `WSL New Laptop Master Plan` and [[WSL Session Briefing]] are historical (their Ollama and "Dell retired" statements are out of date; the live machine wins).

## Logging rule for every session
1. A session writes `Old Laptop Rebuild - Build N <layer> Findings.md` next to its prompt, with a before and after table, every state-changing command, the root cause of every error, and a Growth rules section. It adds one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
2. **One owner per note.** The 2026-10-13 sync conflicts happened because two Dell sessions edited the same notes (one under a renamed `_Rebuild - Index`). Only the session that closes a build edits this Index and the Runs Index; other sessions write only their own findings note.
3. When a build closes, its prompt and findings move into `Runs/Build N .../` and its row here changes state. Only prompts that still need to run stay in this folder.
4. If Syncthing writes a `*.sync-conflict-*` file, diff it against the live note, merge anything unique, then move it to `Runs/_backups/sync-conflicts-<date>/`. Never leave it beside the note.
