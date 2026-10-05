---
type: note
status: sprout
created: 2026-10-04
updated: 2026-10-04
course: Life
track:
  - laptop
  - wsl
tags:
  - note
related:
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
  - "[[Installations]]"
  - "[[Old Laptop Rebuild - Prompt 1 WSL]]"
next: Approve the Build 1 WSL removal and execution manifest
---
# Old Laptop Rebuild - Index

## One-Line Answer
==The old Dell (Latitude 5530) gets rebuilt to match the Acer in sessions run one layer at a time, WSL first, and every session logs what it measured and the rule that stops the same growth from returning.==

## Status
Build 1 WSL audit complete 2026-10-04 ([[Old Laptop Rebuild - Build 1 WSL Findings]]); repair-in-place recommended, no cleanup/config/install executed, awaiting approval of the removal and execution manifest. Follow-up 1 in [[Old Laptop Rebuild - Prompt 1 WSL]] (2026-10-04) executes the approved plan and adds the two idle-timeout keys the original target missed. Prompt 2 ([[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]]) is rewritten as v2 around [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]. It can run its read-only Phase 1 now, its Phase 2 after Build 1's host script has run, and Phase 4 only after the idle test passes.

## Two-laptop workflow (locked direction, 2026-10-04)
The Dell is the canonical host: one checkout per shared repo on its WSL ext4 disk. The Acer connects through VS Code Remote-SSH over Tailscale (both installed inside WSL). GitHub stays the backup and PR channel, parallel tasks use git worktrees with `<machine>/<topic>` branches, and no sync daemon touches code. Cost: the Dell must be awake and on the tailnet. Fallback when it is off: the Acer pushes a branch from its own clone. Reasoning: a single copy cannot drift, which is the property the Jarvis sync could not give without constant repair ([[Cross-Laptop Sync - Known Failure Modes and Prevention]]). Network exposure (Tailscale, sshd) needs the user's approval inside the session.

## Settings Sync is live on the Dell
The Acer's cloud copy has landed on the Dell's Windows VS Code, with Acer-only paths in the synced `settings.json`. Anything written to a Windows user-level VS Code file on the Dell reaches the Acer. Build 2 stays out of those files and records findings for the Windows-side build.

## Facts (WizTree scans plus live queries, 2026-10-04)
| Item | Value |
|---|---|
| Machine | Dell Latitude 5530, i7-1255U (10 cores, 12 threads), 32 GB RAM, Intel Iris Xe only, no NVIDIA GPU |
| Disk | One Samsung PM9A1 1 TB NVMe. C: 251.9 GB (28.6 GB free), D: 700 GB (about 366 GB free) |
| C: biggest | Users 128 GB (AppData 100 GB: Local 67.8, Roaming 32.2), Windows 39 GB, pagefile.sys 25.6 GB, Program Files 26 GB |
| Roaming heavy | Claude 10.7 GB, Code 3.4, Jan 3.3, Cursor 2.8, Kiro 2.6, npm 1.8 |
| Local heavy | Programs 15 GB, Spotify 6.2, Vivaldi 5.8, Microsoft 5.0, superwhisper 4.9, npm-cache 4.5 (redirect to D: missed), Packages 3.8, Temp 3.6, hermes 2.3, WisprFlow 1.9, ms-playwright 1.4. `Local/Google` reports a bogus size (Drive virtual files), so skip it when measuring |
| Home folders on C: | vscode-remote-wsl 6.3 GB, miniconda3 7.1 GB, .vscode 4.3, .codex 2.5, codex-cleanup-quarantine-2026-09-20 2.3, .cache 1.4 |
| D: biggest | WSL 176 GB (Ubuntu vhdx 105.4, Installers/wsl-ubuntu.tar 36.7), Docker vhdx 33.8, Games 86 (Elden Ring rar 67), $RECYCLE.BIN 32.5 (about 21 GB of Rust target dirs), ollama-models 9.2 |
| WSL | Kernel 5.15.167.4 (old). .wslconfig: mirrored, 16 GB, 8 CPUs, no swap setting |

## Findings that change the plan
- **There is no discrete GPU.** "Use the GPU" means the Iris Xe only. CUDA, NVIDIA container tooling and GPU-passthrough tuning do not apply. Heavy local-model work belongs on the Acer.
- **The pagefile warning has a visible cause.** Windows reports `D:\pagefile.sys` as the configured pagefile (system-managed, `AutomaticManagedPagefile` off), but no pagefile exists on D:. The live one is a 25.6 GB `C:\pagefile.sys`. The likely story is that Windows cannot create the D: file at boot, falls back to a temporary C: file, and shows the "pagefile" pop-up. This is a hypothesis for the Windows-host session to confirm in the event log. The fix is an explicit, sized pagefile configuration, not another reboot.
- **WSL swap defaults to C:.** No `swapfile=` setting exists, the same bug the Acer notes record.
- **Jarvis MCP needs mirrored networking.** From WSL, `127.0.0.1:27123` is Obsidian on Windows only in mirrored mode ([[VS Code - MCP and Secrets]]). The statement in [[Ubuntu - WSL]] that NAT alone forwards localhost both ways is only true from Windows to WSL, so the Dell keeps mirrored.
- **A past quarantine sits on C:.** `codex-cleanup-quarantine-2026-09-20` (2.3 GB) is on the drive being freed.
- **Running `wsl --shutdown` from inside a WSL session kills the session.** Host steps go in a script the user runs.

## Session sequence
1. WSL layer ([[Old Laptop Rebuild - Prompt 1 WSL]]): audit, `.wslconfig`, tool parity, WSL-side cleanup, Jarvis log.
2. Windows host, `C:\Users\Anant Gupta`: pagefile, AppData cleanup (Roaming/Claude, Local), Temp and crash dumps, quarantine folder, startup and services, Defender exclusions for the vhdx and `~/projects`, power plan.
3. D: offload: `wsl-ubuntu.tar`, game archives, recycle-bin Rust target dirs, Docker prune, model files.
4. Terminal parity (Windows Terminal, PowerShell profile, Starship).
5. VS Code parity (extensions 39/34, settings, MCP registry).
6. Dev-only profile and a final verification pass against the Acer.

## Logging rule for every session
Each session writes `Old Laptop Rebuild - Build N <layer> Findings.md` here, with a before/after size table, every state-changing command, the root cause of every error, and a Growth rules section (the standing rule and one check command per thing that grew).
