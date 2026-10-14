---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-14
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
  - "[[Old Laptop Rebuild - Index History (to 2026-10-12)]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
next: "When Build 4b, 5b, 6, 7 or 8 closes, add its folder and a results row here"
---
# Old Laptop Rebuild - Runs Index

Everything that has already been run for the Dell rebuild: the prompt that was sent and the findings it produced, one folder per run. Prompts that have not run yet, living reference notes and the roadmap stay one level up in [[Old Laptop Rebuild - Index]]. Reorganised 2026-10-13 and again 2026-10-14. Obsidian links use note names, so no link broke.

## Folder layout
| Folder | Holds |
|---|---|
| `Build 1 WSL/` | prompt and findings |
| `Build 2 VS Code and Two-Laptop/` | prompt and findings (Acer-side Phase 4 items are still open and live in the Index) |
| `Build 3 Windows Cleanup/` | the combined prompt note (Build 3 ran; its Build 4 half is superseded), the findings, and the 3b snapshot and watch note |
| `Build 4 Windows Toolkit/` | prompt and findings (Phases 1 to 4 ran; Build 4b continues them) |
| `Build 5 WSL and D Drive/` | prompt and findings (three Dell host commands and the Acer sync are still open) |
| `_backups/` | every dated `.bak`, `.pre-*` and pre-merge copy, the two Index copies from the Windows and WSL sessions, and `sync-conflicts-20261013/` |
| this folder | [[Old Laptop Rebuild - Index History (to 2026-10-12)]] and this note |

## What each run did
| Run | Dates | Prompt | Findings | Result in one line |
|---|---|---|---|---|
| Build 1, WSL layer | 2026-10-04 to 10-07 | [[Old Laptop Rebuild - Prompt 1 WSL]] | [[Old Laptop Rebuild - Build 1 WSL Findings]] | 36.4 GiB of project artifacts and 5.3 GiB of caches reclaimed in ext4; `.wslconfig` aligned for the always-on SSH host |
| Build 2, WSL VS Code and two-laptop SSH | 2026-10-07 to 10-12 | [[Old Laptop Rebuild - Prompt 2 VS Code and Two-Laptop Workflow]] | [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] | Tailscale in WSL, direct path to the Acer, plain SSH to the canonical checkout proven; Acer-side items open |
| Build 3, Windows C: cleanup | 2026-10-11 to 10-12 | [[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]] | [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]], [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] | C: free 39.5 to about 145 GiB, caches and apps moved to D:, layout contract, weekly clean and daily watch tasks |
| Build 4, Windows toolkit (Phases 1 to 4) | 2026-10-11 to 10-13 | [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]] | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] | PowerShell 7, Starship, font, zoxide, fzf, fd, bat, delta, NanaZip, pnpm, Node 24, standalone uv installed; Python 3.13.5 and Chocolatey removed; 104 PASS; Terminal One Half Dark with `IosevkaTerm Nerd Font`; catalog and Acer run not done |
| Build 5, Dell WSL parity and tools | 2026-10-13 to 10-14 | [[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]] | [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]] | configs equal to the Acer's (27 exact), golden set applied, ruff, shellcheck, shfmt, Miniconda, tmux 3.8, pnpm 12.4.2, 5.9 GB of caches freed, upkeep timers, DCIM duplicates deleted (3,799 MiB), socat in, WSL Ollama off, ChatGPT Classic removed; Cursor repair and the fresh export are still waiting for you |

Note on the Build 5 prompt: this folder holds the copy that was filed. A later copy with the readiness-audit corrections (WSL 3.0.3.0, the `wsl ~` start instructions) sits in `_backups/sync-conflicts-20261013/`.

## Parent folder map (`New Laptop/`, classified 2026-10-14)
| Note or folder | Role | State | Action taken |
|---|---|---|---|
| [[Installations]] | living inventory | WSL half current, Windows half pre-rebuild | two bullets corrected; Build 4b rewrites the tables |
| [[Ubuntu - WSL]] | living WSL reference, now also the Acer audit | current | none |
| [[New Laptop Setup]] | original Acer setup plan | historical | none |
| `Acer Live State 2026-09-16` | Acer snapshot | historical | none |
| `WSL New Laptop Master Plan` and [[WSL Session Briefing]] | September WSL plans | historical, Ollama and "Dell retired" statements out of date | none; the Index lists them as stale |
| [[Old Laptop Decommission Checklist]] | decommission plan | superseded (the Dell is now the canonical host; the note already carries a warning) | none |
| `Statusline Migration - Acer Prompt` | an Obsidian plugin "Batch 3" prompt (status seed) | misplaced: it is not about the laptop rebuild | none; decision for you (belongs under the Obsidian plugin notes) |
| `VS Code ...` notes (Windows Environment Build Prompt, Professional Setup, Terminal Environments, Install Loop, MCP and Secrets, Modifications) | Acer Windows VS Code work, run 2026-10-12 | reference; Modifications is proposals only | none; Build 6 reads them |
| `Codebases/` | per-repo directives and the locked-decisions note | living | the stray `.bak` file moved to `_backups/` |
| `Sync/` | Cross-Laptop Sync builds 1 to 13 with their own roadmap, plus the Drive policy | its prompts (Build 7, Build 11) already ran | none |

## What still has no run
Build 4b (catalog, agent guide, Acer run sheet), Build 5b (the Acer handoff note is ready), Builds 6, 7 and 8 (prompts not written). The Index holds the open-work ledgers for the Dell and the Acer.
