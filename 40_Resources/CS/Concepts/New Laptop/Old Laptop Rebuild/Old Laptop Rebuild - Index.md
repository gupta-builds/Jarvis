---
type: note
status: sprout
created: 2026-10-04
updated: 2026-10-13
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
  - "[[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]]"
  - "[[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]]"
next: "Send the Build 4 prompt (Windows, Sonnet 5.5) and the Build 5 prompt (WSL home, Sonnet 5.5); they are independent. Then write the Build 6 and 7 prompts."
---
# Old Laptop Rebuild - Index

## One-Line Answer
==The old Dell (Latitude 5530) gets rebuilt to match the Acer in sessions run one layer at a time, and every session logs what it measured and the rule that stops the same growth from returning.==

## Where things are (reorganised 2026-10-13)
| Place | Holds |
|---|---|
| this folder | this Index, the prompts that have not run yet, living reference notes, the Acer dotfile snapshot, the Build 4 working findings |
| [[Old Laptop Rebuild - Runs Index]] and `Runs/` | everything already run, one folder per build (prompt plus findings), `_backups/` for all dated `.bak` files, and the full old Index with its dated status paragraphs |
| `Old Laptop Rebuild/Acer Dotfile Snapshot/` | the Acer's real Windows and WSL configs, hashes and scripts; Build 4 copies configs from here |
| parent folder `New Laptop/` | [[Installations]] (the inventory), [[Ubuntu - WSL]], [[New Laptop Setup]], `Codebases/`, `Sync/` (Cross-Laptop Sync notes, [[Google Drive Sync Policy]]) |

Living reference notes here: [[C Drive Bloat - Failure Log and Prevention Rules]], [[Old Laptop Rebuild - Build 2 SSH Runbook]], [[Old Laptop Rebuild - Build 2 Acer Handoff]], [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] (audit and an unanswered design checkpoint; Build 4 continues it).

## Roadmap
| Build | Layer | Status | Prompt | Findings |
|---|---|---|---|---|
| 1 | WSL layer | run, done | [[Old Laptop Rebuild - Prompt 1 WSL]] | [[Old Laptop Rebuild - Build 1 WSL Findings]] |
| 2 | WSL VS Code and two-laptop SSH | run; Phase 4 items open, carried into Build 5 | [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] | [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] |
| 3 | Windows C: cleanup (plus 3b snapshot, structure, watch) | run, done 2026-10-12; C: free 39.5 to about 136 GiB | [[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]] | [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]], [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] |
| 4 | Windows toolkit on both laptops (PowerShell 7, Terminal, Starship, font, configs, catalog and agent guide) | audit and design done, **prompt ready, decisions D1 to D12 unanswered** | [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]] | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 5 | WSL parity and the D: drive (config parity, Build 2 leftovers, the 36.75 GiB `wsl-ubuntu.tar`, Google Drive and the `_Anant` folders) | **run 2026-10-13/14, closing: parity, tools, golden configs, tmux 3.8, pnpm 12.4.2, DCIM dedupe, ChatGPT Classic removal done; open: Cursor reinstall and WSL export plus tar quarantine (two PowerShell commands in the Build 5 findings note, section 'Build 5 final'); Acer applies the handoff note** | [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]] | [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]], [[Old Laptop Rebuild - Anant Folder Consolidation and Drive Plan (later build)]] |
| 6 | Windows VS Code and MCP wiring (extensions, settings, MCP registry, stale Acer paths, agent dot-folder skill junctions) | prompt not written (was "Build 5" before 2026-10-13) | - | - |
| 7 | dev-only profile and a final verification pass against the Acer | prompt not written (was "Build 6") | - | - |

## Order and independence
Build 4 (Windows) and Build 5 (WSL) touch different layers and can run in either order. Build 4 depends on nothing in Build 5. Build 5's WSL config parity script comes from Build 4's `30-wsl-config-parity.sh`, so Build 5 only runs that step after Build 4 has delivered it; everything else in Build 5 is independent. Builds 6 and 7 come after both. Each run ends by moving its prompt and findings into `Runs/` and updating the table above.

## Standing decisions (locked, do not relitigate)
- **Two-laptop workflow (2026-10-04):** the Dell is the canonical host with one checkout per shared repo on WSL ext4. The Acer connects with VS Code Remote-SSH over Tailscale. GitHub is the backup and PR channel, parallel work uses git worktrees with `<machine>/<topic>` branches, and no sync daemon touches code. Cost: the Dell must be awake. Details in [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]].
- **Tailscale placement:** inside WSL on the Dell, Windows side only on the Acer. Never on the Dell's Windows side, never inside the Acer's WSL.
- **Settings Sync is live.** Any Windows VS Code user file written on the Dell reaches the Acer. Windows VS Code, MCP and Claude Code settings are Build 6's.
- **Mirrored networking stays.** Jarvis MCP from WSL needs `127.0.0.1:27123` to be Obsidian on Windows, which only mirrored mode gives.
- **Never `wsl --shutdown`** from inside WSL, and never restart WSL from a session; host steps go into a script the user runs.
- **No discrete GPU on the Dell** (Iris Xe only); heavy local-model work belongs on the Acer.
- **Layout contract (Build 3b):** C: holds Windows, installs, drivers and the profile; D:\Apps, D:\Cache\<tool>, D:\AI, D:\WSL, D:\Backup, D:\Backup (with D:\Backup\Quarantine since 2026-10-13) hold the rest; a new tool sets its environment variable first.
- **Reversible deletions:** quarantine, do not delete, anything that is not a regenerable cache.
- **Always-on host:** weekly clean and a daily read-only watcher run as scheduled tasks ([[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]]).

## Current state in four lines (2026-10-13)
- Dell Windows: C: about 136 GiB free (about 145 after the last finishing script), D: about 450 GiB; Python 3.13.5, Chocolatey, .NET 8 and the pip `uv` are waiting on Build 4's standalone `uv`.
- Dell WSL toolkit (2026-10-14): tmux 3.8, pnpm 12.4.2 (matches the Acer), golden configs verified (34 files in sync); see [[WSL Toolkit Config Reference]].
- Dell WSL: 3.0.1.0, Ubuntu 24.04, mirrored, systemd degraded only by `systemd-binfmt` (fix is in WSL 3.0.2 prerelease; the user chose to wait for stable); configs now match the Acer's real files (Build 5; 3 intentional differences); Ollama still runs in WSL until the user runs the sudo step.
- Tailscale: Dell WSL `dell-wsl` and Acer Windows connected directly; plain SSH to the canonical checkout proven.
- Open items by build: see the table above and [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]].

## Stale notes to fix when touched
Found by the 2026-10-13 reading pass. The live machine wins over each of these. **Build 5 (2026-10-13) patched by heading: the tarball path and size (Build 3b already corrected), Ollama and 'Dell retired' in Ubuntu - WSL, bubblewrap, ledger rows 4.4 / 4.9 / 4.10, the pnpm key and second-brain / internship paths in Locked Decisions, the six Build 2 corrections, the systemd statements, the Acer `.wslconfig` values, and the Installations Old Laptop WSL section. Still open: Docker auto-start in VS Code - Windows (Build 7) and the Windows half of Installations (Build 4).**
- `wsl-ubuntu.tar` is 36.75 GiB, not 73 (the Build 3b note was corrected). The old WSL Session Briefing puts it at `D:\Installers\`; it is `D:\WSL\Installers\`.
- [[Ubuntu - WSL]], the WSL master plan and the briefing say Ollama is Windows-only and the Dell is retired; both are out of date (a WSL Ollama runs; the Dell is the canonical host). The decommission checklist is superseded.
- bubblewrap is installed on the Dell; `socat` is not. Build 2 notes still say both are missing.
- Build 2's 2026-10-11 ledger rows 4.4, 4.9 and 4.10 are stale (later sections show them passed).
- The pnpm key is `enableGlobalVirtualStore`, not `virtualStoreType: global`.
- Acer `.wslconfig` values in the snapshot (16 GB, 8 CPUs) predate the 2026-10-12 correction noted in [[Ubuntu - WSL]].

## Logging rule for every session
Each session writes `Old Laptop Rebuild - Build N <layer> Findings.md` here (it moves into `Runs/` when the build closes), with a before/after size table, every state-changing command, the root cause of every error, and a Growth rules section (the standing rule and one check command per thing that grew). It adds one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
