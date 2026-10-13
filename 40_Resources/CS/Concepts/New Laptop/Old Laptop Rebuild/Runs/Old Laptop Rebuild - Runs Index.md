---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - windows
  - wsl
tags:
  - note
  - laptop
related:
  - "[[_Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Index History (to 2026-10-12)]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
next: Add each future build here when its prompt and findings move into Runs
---
# Old Laptop Rebuild - Runs Index

Everything that has already been run for the Dell rebuild: the prompt that was sent and the findings it produced, one folder per run. Prompts that have not run yet, living reference notes and the roadmap stay one level up in [[_Rebuild - Index]]. Moved here on 2026-10-13. Obsidian links use note names, so no link broke.

## Folder layout

| Folder | Holds |
|---|---|
| `Build 1 WSL/` | the Build 1 prompt and its findings |
| `Build 2 VS Code and Two-Laptop/` | the Build 2 prompt and its findings (Phase 4 items still open, carried into Build 5) |
| `Build 3 Windows Cleanup/` | the combined prompt note (Build 3 prompt, run; old Build 4 v2, superseded), the findings, and the 3b snapshot and watch note |
| `_backups/` | every dated `.bak` and `.pre-*` copy of the notes above and of the living notes (Index, Handoff, Runbook, C Drive Bloat) |
| this folder | [[Old Laptop Rebuild - Index History (to 2026-10-12)]], the full old Index with its dated status paragraphs |

## What each run did

| Run | Dates | Prompt | Findings | Result in one line |
|---|---|---|---|---|
| Build 1, WSL layer | 2026-10-04 to 10-07 | [[Old Laptop Rebuild - Prompt 1 WSL]] | [[Old Laptop Rebuild - Build 1 WSL Findings]] | 36.4 GiB of project artifacts and 5.3 GiB of caches reclaimed inside ext4; `.wslconfig` aligned for the always-on SSH host; WSL 3.0.1.0 live, systemd degraded only by `systemd-binfmt` |
| Build 2, WSL VS Code and two-laptop SSH | 2026-10-07 to 10-12 | [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] | [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] | Phase 2 items 1 to 6 applied; Tailscale in WSL, direct path to the Acer, plain SSH to the canonical checkout proven. Phase 4 authentication, inventory and pilot items and items 7 to 9 are still open |
| Build 3, Windows C: cleanup | 2026-10-11 to 10-12 | [[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]] | [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]], [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] | C: free 39.5 to about 136 GiB, pagefile fixed, caches and apps moved to D:, a C:/D: layout contract, weekly clean and daily watch tasks |

## What still has no run

Read the Index for the roadmap. In short: Build 4 (Windows toolkit) and Build 5 (WSL parity and the D: drive) have prompts ready; Build 6 (Windows VS Code and MCP wiring) and Build 7 (dev-only profile and final verification) are not written yet.
