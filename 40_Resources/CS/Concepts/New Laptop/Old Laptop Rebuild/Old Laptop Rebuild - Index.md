---
type: note
status: sprout
created: 2026-10-04
updated: 2026-10-14
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
next: "1) Send the Build 4b prompt on the Dell (Claude Code in PowerShell, Sonnet 5.5, effort high). 2) Send the Acer 5b handoff on the Acer. 3) Write Builds 6, 7 and 8."
---
# Old Laptop Rebuild - Index

## One-Line Answer
==The old Dell (Latitude 5530) is rebuilt to match the Acer in sessions run one layer at a time. Builds 1 to 3 are done, Builds 4 and 5 are mostly done on the Dell with a short list left, and nothing runs on the Acer yet except one handoff note that is ready.==

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
| 4 | Windows toolkit | Phases 1 to 4 run 2026-10-13 (104 PASS, lock written); **Build 4b open** | [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]] | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 4b | Closes Builds 1 to 5 on the Dell: Cursor repair, WSL export and tar quarantine, .NET 8, Ollama, catalog, agent guide, Acer run sheet, Installations, Firecrawl key, startup apps, Build 5 leftovers, and the Tailscale/SSH items from Build 2 (separate Part B) | **prompt ready** | [[Old Laptop Rebuild - Build 4b Prompt (Dell Leftovers and Tailscale)]] | continues the Build 4 findings, "Build 4b" section |
| 5 | Dell WSL parity and tools | run 2026-10-13/14; three user host commands still open | [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]] | [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]] |
| 5b | Acer WSL toolkit sync | **ready, not run** | [[Acer Session Handoff - Toolkit Sync (Build 5b)]] | the handoff note's Results section |
| 6 | Windows VS Code, MCP and Claude Code wiring, AI platforms audit | prompt not written | - | plan: [[Old Laptop Rebuild - C Drive AI Platforms Audit (future build)]] |
| 7 | Startup apps, Docker auto-start, dev-only profile, final verification against the Acer | prompt not written | - | - |
| 8 | `D:\_Anant` consolidation and Google Drive | plan only, needs your answers | - | plan: [[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]] |

## Dell: what is left (live-checked 2026-10-14)
| # | Item | Owner | Build | Detail |
|---|---|---|---|---|
| D1 | Cursor installed 2026-10-14 but its self-update fails ("Moving: resources", access denied) | you | 5 | `Programs\cursor\Cursor.exe` absent; broken install is quarantined. Run `powershell -ExecutionPolicy Bypass -File D:\WSL\ops\60-build5b-host.ps1 -Stages Cursor`, type YES |
| D2 | No fresh WSL export (the 2026-10-14 command passed `-Stages Export,Quarantine` and nothing ran: `-File` sends the comma list as one string); the 36.75 GiB `wsl-ubuntu.tar` is still in `D:\WSL\Installers` | you | 5 | `... 60-build5b-host.ps1 -Stages Export,Quarantine`, YES twice. WSL is down 10 to 25 minutes; Tailscale returns by itself. The tar moves only after a verified export |
| D3 | .NET 8 runtimes still installed (8.0.25, 8.0.26) | you, elevated | 4b | check that Dell Command Update 5.7.0 does not need them, then `04-admin-remove.ps1 -IncludeDotnet8` (dry run first) |
| D4 | Catalog and agent guide not written | session | 4b | `catalog/` is empty; no "Tool Use Cases and Agent Guide" note |
| D5 | `Installations` Windows half still pre-rebuild | session | 4b | two bullets corrected on 2026-10-14; the tables are not |
| D6 | Weekly clean has never run | automatic | 3 | `Toolkit-Weekly-Clean` first run Sunday 2026-10-18 03:30; check its log and the watcher alert file afterwards |
| D7 | Windows Ollama is not running; nothing listens on 11434 | you | 5 | WSL Ollama is disabled; start `D:\Apps\Ollama` and confirm `OLLAMA_MODELS` |
| D8 | Run key still starts Discord, GoogleDriveFS, Rize, Spotify, Docker Desktop, Voquill, Slack | you | 7 | decide per app; Docker's own setting says auto-start is off |
| D9 | Firecrawl key sits in plaintext in the Dell `.bashrc` | you | now | rotate at the provider; do not paste the value anywhere |
| D10 | Malwarebytes, WhatsApp, Rize, GitKrakenCLI | you | 7 | keep or remove; Malwarebytes was listed installed on 2026-10-13, not re-checked |
| D11 | Defender exclusions, BIOS battery cap (80 percent) and AC recovery | you | 7 | need admin or the BIOS; not verifiable from a session |
| D12 | Codex config has a WSL `node_repl` path; 13 agent dot-folders hold skill junctions | session | 6 | see the AI platforms audit |
| D13 | Cursor `snapshots` (1.2 GB) and `globalStorage` (1.2 GB) in WSL, old pnpm v10 store | you | 5 | decide; both are reclaimable but hold state |
| D14 | `ConversationCapture-Backfill-WSL` task starts `wsl.exe` every 30 minutes | you | 5 | keep or disable |
| D15 | VS Code Tunnel sign-in, port 2222, repo pilot (editor contract applied to 3 repos), per-repo `packageManager` pins | you | 5 | per-repo approvals |
| D16 | Disabled Jarvis tasks `ClaudeKit-Sync-All`, `SecondBrainClaudekit-JarvisSync` | you | - | left disabled on purpose |

## Acer: what is left (nothing has been run there from this folder)
| # | Item | Where it is written |
|---|---|---|
| A1 | **The one ready build:** Build 5b, steps 1 to 7 and the 15-row fix table (git keys, starship CRLF, tmux, gh-dash paths, `.bashrc` hardening, atuin, tool versions, chafa and direnv, `.wslconfig`, pnpm 12.4.2, tmux 3.8) | [[Acer Session Handoff - Toolkit Sync (Build 5b)]] |
| A2 | Build 2 SSH items: independent host-key comparison, clone and worktree inventory, large-transfer check, optional WSL route test | [[Old Laptop Rebuild - Build 2 Acer Handoff]] |
| A3 | Acer audit findings from 2026-10-13: Acer WSL is 2.7.14.0 (Dell is 3.0.3.0); saved `.wslconfig` (20GB, 18 CPUs, swap on D:) is not active until you cold-restart WSL; the Ubuntu disk is 40 GiB and 70 percent used; uv cache 7.5 GiB; its weekly clean deletes `~/.cache/node` (the Corepack pin) and pnpm floated to 12.11.2; recurring DNS-check errors | [[Ubuntu - WSL]], section "Acer audit and launch correction - 2026-10-13" |
| A4 | Windows toolkit parity (Build 4 Phase 6): the Acer already has pieces of it from 2026-10-12, so it starts with a read-only paste-back | Build 4b |
| A5 | Acer Windows host: its Drive backup scope, Drive account question | the Drive plan note |
Recommendation: fold A2 and A3 into the same Acer session as A1 (one Acer visit), with A3's `wsl --shutdown` and WSL update left as host steps for you.

## Order
1. Dell host commands D1, D2 (about 40 minutes with the export), then D3.
2. In parallel: the Acer runs A1 (+A2, A3). The Dell and Acer sessions touch different machines.
3. Build 4b (Windows, short). It writes the catalog, the agent guide and the Acer run sheet, so write it before the Acer's Windows parity run.
4. Build 6, then Build 7 (both Windows; Build 6 first because VS Code, MCP and Claude Code settings reach the Acer through Settings Sync).
5. Build 8 only after you answer the Drive questions.

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

## Current state (verified live, 2026-10-14)
- **Dell Windows:** C: 140.9 GiB free (145.4 on 2026-10-13; a Windows update and restart happened in between, watcher raised no alert), D: 451.2 GiB. Python 3.13.5, Chocolatey, Teams, LinkedIn, Netflix, HP Printer Control, Epic, Logi Options+ and the Build 3 scripts (archived to `D:\WSL\ops\windows\archive\build3-20261012`) are gone. Spotify cache is 0.38 GB. Remaining in `D:\WSL\ops\windows`: `04-admin-remove.ps1`, `08-finish-cleanup.ps1`, `weekly-clean.ps1`, `watch-c.ps1`.
- **Dell WSL:** 3.0.3.0, kernel 6.18.54.1, systemd running with no failed units; golden configs applied (34 files in sync); tmux 3.8, pnpm 12.4.2, Miniconda with `jupyter-base`; socat installed and WSL Ollama disabled by your sudo step; DCIM duplicates deleted (3,799 MiB); both upkeep timers on.
- **Tailscale:** Dell WSL `dell-wsl` and Acer Windows connected directly; plain SSH to the canonical checkout proven.
- **Dell tarball:** `wsl-ubuntu.tar` 36.75 GiB, intact, nothing references it, waits for D2.

## Stale notes (status)
Patched on 2026-10-13/14: the tarball path and size, Ollama and "Dell retired" in [[Ubuntu - WSL]], bubblewrap, Build 2 ledger rows, the pnpm key, the six Build 2 corrections, the systemd statements, the Acer `.wslconfig` values, the Installations WSL section and two Installations Windows bullets.
Still open: Docker auto-start wording in [[VS Code - Windows]] (the Run key still starts it); the Windows tables in [[Installations]] (Build 4b); [[Old Laptop Decommission Checklist]], `WSL New Laptop Master Plan` and [[WSL Session Briefing]] are historical (their Ollama and "Dell retired" statements are out of date; the live machine wins).

## Logging rule for every session
1. A session writes `Old Laptop Rebuild - Build N <layer> Findings.md` next to its prompt, with a before and after table, every state-changing command, the root cause of every error, and a Growth rules section. It adds one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
2. **One owner per note.** The 2026-10-13 sync conflicts happened because two Dell sessions edited the same notes (one under a renamed `_Rebuild - Index`). Only the session that closes a build edits this Index and the Runs Index; other sessions write only their own findings note.
3. When a build closes, its prompt and findings move into `Runs/Build N .../` and its row here changes state. Only prompts that still need to run stay in this folder.
4. If Syncthing writes a `*.sync-conflict-*` file, diff it against the live note, merge anything unique, then move it to `Runs/_backups/sync-conflicts-<date>/`. Never leave it beside the note.
