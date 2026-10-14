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
next: "Build 5 is ready to send (WSL home, Sonnet 5.5): see the readiness audit below. Build 4 finishes its Terminal font change, the catalog and agent guide (Phase 5) and the Acer run (Phase 6). Then write the Build 6 and 7 prompts."
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
| 4 | Windows toolkit on both laptops (PowerShell 7, Terminal, Starship, font, configs, catalog and agent guide) | **Dell installed and verified 2026-10-13** (104 PASS, lock file written); open: Terminal font change to the Acer's face, catalog and agent guide (Phase 5), Acer run sheet and parity (Phase 6), closing notes (Phase 7). All of D1 to D16 answered | [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]] | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] |
| 5 | WSL parity and the D: drive (config parity, Build 2 leftovers, the 36.75 GiB `wsl-ubuntu.tar`, Google Drive and the `_Anant` folders) | **prompt ready and re-verified against the live machine on 2026-10-13** (see the audit below) | [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]] | written by the run |
| 6 | Windows VS Code and MCP wiring (extensions, settings, MCP registry, stale Acer paths, agent dot-folder skill junctions) | prompt not written (was "Build 5" before 2026-10-13) | - | - |
| 7 | dev-only profile and a final verification pass against the Acer | prompt not written (was "Build 6") | - | - |

## Order and independence
Build 4 (Windows) and Build 5 (WSL) touch different layers and can run in either order. Build 4 depends on nothing in Build 5, and Build 4 no longer carries any WSL script: Build 5 writes its own `30-wsl-config-parity.sh` (the old line saying it comes from Build 4 was stale). Builds 6 and 7 come after both. Each run ends by moving its prompt and findings into `Runs/` and updating the table above.

## Standing decisions (locked, do not relitigate)
- **Two-laptop workflow (2026-10-04):** the Dell is the canonical host with one checkout per shared repo on WSL ext4. The Acer connects with VS Code Remote-SSH over Tailscale. GitHub is the backup and PR channel, parallel work uses git worktrees with `<machine>/<topic>` branches, and no sync daemon touches code. Cost: the Dell must be awake. Details in [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]].
- **Tailscale placement:** inside WSL on the Dell, Windows side only on the Acer. Never on the Dell's Windows side, never inside the Acer's WSL.
- **Settings Sync is live.** Any Windows VS Code user file written on the Dell reaches the Acer. Windows VS Code, MCP and Claude Code settings are Build 6's.
- **Mirrored networking stays.** Jarvis MCP from WSL needs `127.0.0.1:27123` to be Obsidian on Windows, which only mirrored mode gives.
- **Never `wsl --shutdown`** from inside WSL, and never restart WSL from a session; host steps go into a script the user runs.
- **No discrete GPU on the Dell** (Iris Xe only); heavy local-model work belongs on the Acer.
- **Layout contract (Build 3b):** C: holds Windows, installs, drivers and the profile; D:\Apps, D:\Cache\<tool>, D:\AI, D:\WSL, D:\Backup, D:\Quarantine hold the rest; a new tool sets its environment variable first.
- **Reversible deletions:** quarantine, do not delete, anything that is not a regenerable cache.
- **Always-on host:** weekly clean and a daily read-only watcher run as scheduled tasks ([[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]]).

## Current state in four lines (2026-10-13)
- Dell Windows: C: 145 GiB free, D: 450 GiB; Build 4 installed PowerShell 7 (default shell), Starship, the Iosevka font, zoxide, fzf, fd, bat, delta, NanaZip, pnpm, Node 24, standalone uv 0.12.19 first on PATH; Python 3.13.5 and Chocolatey are gone. .NET 8 still waits for the Dell Command Update check.
- Dell WSL: **3.0.3.0 (stable, 2026-10-09), kernel 6.18.54.1, systemd `running` with zero failed units** (the `systemd-binfmt` degradation is gone, so the wait for a stable release is over); Ubuntu 24.04, mirrored; 13 of 17 config files still differ from the Acer's; Ollama runs in WSL and blocks the Windows one.
- Tailscale: Dell WSL `dell-wsl` and Acer Windows connected directly; plain SSH to the canonical checkout proven.
- Open items by build: see the table above and [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]].

## Readiness audit, 2026-10-13 (done before Build 5)
Method: read every note in this folder, the Sync notes' headings and the session log, then compared each claim with the live machine (read-only). The live machine won every disagreement.

| Item | Notes said | Live | Where it is handled |
|---|---|---|---|
| WSL version and systemd | 3.0.1.0, degraded, waiting for a stable fix | **3.0.3.0 stable, kernel 6.18.54.1, systemd running, 0 failed units** | Build 5 prompt corrected; Build 2 notes patched |
| `wsl ~` in PowerShell 7 | worked | failed: PowerShell 7 expands a bare `~` to the Windows home before `wsl.exe` sees it | fixed in the Build 4 profile block (re-apply `20-apply-configs.ps1`); Build 5 prompt tells the session how to start |
| `core.excludesfile` | Build 2 said it was set | unset; Git reads the default `~/.config/git/ignore` (same eight patterns) | harmless; Build 5 contradiction list |
| `core.autocrlf` in WSL | Build 5 E5 proposed to set `input` | already `input` since 2026-10-07 | E5 reworded to verify only |
| Build 5 script source | "comes from Build 4's `30-wsl-config-parity.sh`" | Build 4 dropped it; Build 5 writes its own | Index paragraph fixed |
| Config parity | 13 of 17 differ | still true; 3 Yazi items missing (`package.toml`, `flavor.toml`, `tmtheme.xml`) | Build 5 Phase 3 |
| Tools missing in WSL | ruff, shfmt, shellcheck, socat, conda | all still missing; bubblewrap 0.9.0 present | Build 5 E4, E6, sudo step |
| Ollama in WSL | running, blocks Windows Ollama | active and enabled on 127.0.0.1:11434 | Build 5 E2 |
| WSL upkeep | none | no cron entries; one default Ubuntu user timer | Build 5 Phase 5 starts clean |
| Repos | 58 in the Build 1 inventory | 53 `.git` folders found now | Build 5 Phase 4 re-counts |
| Tunnel CLI | installed, not signed in | `service_installed: false`, no tunnel | WAITING USER |
| Claude user MCP in WSL | jarvis, the-plan, jarvis-fs | also graphify and pencil | Build 6 |
| ConversationCapture-Backfill-WSL (Windows task) | Build 1 said review it; Build 3 left the decision open | still Ready (runs `wsl.exe` every 30 minutes) | added to Build 5 as report-only, WAITING USER |
| Windows startup apps | Build 3 recommended disabling Discord, Spotify, Rize, Voquill, Slack, Docker Desktop | still in the Run key (Medal, Steam and Riot no longer are) | open, owner user, Build 7 |
| Docker Desktop auto-start | [[VS Code - Windows]] says off by choice | the Run key still has `Docker Desktop` | open, owner user, Build 7 |
| Malwarebytes | on the "not carrying forward" list | version 5.7 still installed | open, user decision |
| .NET 8 | removal waits for the Dell Command Update check | still installed, Dell Command Update 5.7.0 present | open, user runs `04-admin-remove.ps1 -IncludeDotnet8` after the check |
| Windows privacy and Edge policies | planned in Build 3 | set (Copilot off, Bing off, telemetry level 1, Edge startup boost and background mode off) | PASS |
| Quarantines | two dated folders | `c-cleanup-review-2026-11-01` 2.42 GiB, `c-deep-clean-review-2026-11-11` 8.52 GiB | review dates stand |
| Disabled tasks `ClaudeKit-Sync-All`, `SecondBrainClaudekit-JarvisSync` | leave disabled | still disabled | PASS |
| Not verifiable | Defender exclusions, BIOS battery cap and AC recovery | need admin or BIOS | user |

Nothing in Builds 1 to 3 was found unfinished apart from the rows marked open. The six "Corrections older notes need" in the Build 2 findings were never applied; they are now in the stale list below so Build 5 Phase 7 patches them.
## Stale notes to fix when touched
Found by the 2026-10-13 reading pass. The live machine wins over each of these.
- `wsl-ubuntu.tar` is 36.75 GiB, not 73 (the Build 3b note was corrected). The old WSL Session Briefing puts it at `D:\Installers\`; it is `D:\WSL\Installers\`.
- [[Ubuntu - WSL]], the WSL master plan and the briefing say Ollama is Windows-only and the Dell is retired; both are out of date (a WSL Ollama runs; the Dell is the canonical host). The decommission checklist is superseded.
- bubblewrap is installed on the Dell; `socat` is not. Build 2 notes still say both are missing.
- Build 2's 2026-10-11 ledger rows 4.4, 4.9 and 4.10 are stale (later sections show them passed).
- The pnpm key is `enableGlobalVirtualStore`, not `virtualStoreType: global`.
- Acer `.wslconfig` values in the snapshot (16 GB, 8 CPUs) predate the 2026-10-12 correction noted in [[Ubuntu - WSL]].
- Systemd "degraded" and "waiting for a stable WSL" statements (Build 1 and Build 2 findings, SSH Runbook, [[Installations]], [[Ubuntu - WSL]]): resolved by WSL 3.0.3.0 on 2026-10-13.
- Build 2 findings, "Corrections older notes need" (never applied): `virtualStoreType` versus `enableGlobalVirtualStore` (already listed above); the second-brain checkout has no root package manifest (`~/projects/ai/claude/second-brain-claudekit`); the internship repo is not a live uv project; WSLENV is `ELECTRON_RUN_AS_NODE/w:`, not empty; Acer `ssh.exe` did show an unknown-host prompt; `settingsSync.ignoredSettings` is absent.
- [[VS Code - Windows]] says Docker Desktop auto-start is off; the Run key still starts it.
- [[Installations]] "Old Laptop" section still describes the Windows side as pre-rebuild; Build 4 Phase 7 rewrites it.

## Logging rule for every session
Each session writes `Old Laptop Rebuild - Build N <layer> Findings.md` here (it moves into `Runs/` when the build closes), with a before/after size table, every state-changing command, the root cause of every error, and a Growth rules section (the standing rule and one check command per thing that grew). It adds one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
