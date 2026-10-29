---
type: note
status: sprout
created: 2026-10-13
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
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]"
next: "When Build 6, 7 or 8 runs, add its folder and a results row here."
---
# Old Laptop Rebuild - Runs Index

## One-Line Answer
==One folder per run, each holding only the findings note for that run; the prompts that drove the runs were retired on 2026-10-17 once their results were verified, and this note says where everything from them now lives.==

## Folder layout
| Folder | Holds |
|---|---|
| `Build 1 WSL/` | [[Old Laptop Rebuild - Build 1 WSL Findings]] |
| `Build 2 VS Code and Two-Laptop/` | [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] (includes the SSH runbook as executed) |
| `Build 3 Windows Cleanup/` | [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]] (audit and plan) and [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] (execution and the structure contract) |
| `Build 4 Windows Toolkit/` | [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]] (Phases 1 to 4, Build 4b and its 2026-10-17 follow-up) |
| `Build 5 WSL and D Drive/` | [[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]] (Build 5 and the Dell part of Build 5b) |
| `Build 5b Acer Visit/` | [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]] (the Acer's part of Builds 2, 4 and 5b, with the Windows parity matrix) |
| this folder | this note |

## What each run did
| Run | Dates | Result in one line |
|---|---|---|
| Build 1, WSL layer | 2026-10-04 to 10-07 | 36.4 GiB of project artifacts and 5.3 GiB of caches removed inside ext4; `.wslconfig` retuned (20 GB, 10 CPUs, 8 GiB swap on D:, both idle timers off); WSL 2.4.13.0 to 3.0.1.0; 75-second idle test passed |
| Build 2, WSL VS Code and two-laptop SSH | 2026-10-07 to 10-15 | WSL-side VS Code parity (34 extensions); Tailscale SSH between `dell-wsl` and `gupta-builds`; host key MATCH; `sync-check` identical on both; port-2222 fallback and VS Code Tunnel declined |
| Build 3, Windows C: cleanup (+3b) | 2026-10-11 to 10-12 | C: free 39.5 to 136.4 GiB; caches redirected to D:; pagefile settled; daily watcher and weekly clean registered; structure contract written |
| Build 4, Windows toolkit (+4b) | 2026-10-11 to 10-17 | PowerShell 7, Starship, font, zoxide, fzf, fd, bat, delta, NanaZip, pnpm, Node 24, standalone uv; 104 PASS and a lock; catalog and agent guide; Python and Chocolatey removed; Cursor's update failure traced to a force-kill; WSL export and tar quarantine; OpenClaw, Rize and dead startup entries removed; 53.8 GiB of quarantine deleted; pnpm-pin pilot on one repo |
| Build 5, Dell WSL parity (+5b) | 2026-10-13 to 10-14 | configs equal to the Acer's real files, then one golden set; ruff, shellcheck, shfmt, Miniconda; upkeep timers; tmux 3.8 and pnpm 12.4.2; DCIM duplicates (3,799 MiB) removed; ChatGPT Classic removed |
| Acer visit | 2026-10-15 | golden WSL set applied (`changed=13 same=21 fails=0`), Windows toolkit Parts 0 to 3 (0 FAIL), Build 2 SSH checks, WSL updated to 3.0.3.0, 4 local-only internship commits found and bundled |

## Where the retired material went (2026-10-17)
All of it is recoverable from the vault's git history; nothing needed to run or understand the machines was lost.

| Retired note | Its content now lives in |
|---|---|
| `Prompt 1 WSL` | Build 1 findings; the locked rules in the Locked Decisions note |
| `Prompt 2 VS Code and Two-Laptop Workflow` | Build 2 findings; rules R1 to R10 in the Locked Decisions note |
| `Windows Prompts (Build 3 ... and Build 4 Terminal Parity)` | Build 3 and 3b findings (its Build 4 half was superseded) |
| `Build 4 Prompt (Windows Toolkit)` | Build 4 findings; its Build 3 lessons are in the Index and the Build 3b note |
| `Build 5 Prompt (WSL Parity and D Drive)` | Build 5 findings |
| `Build 4b Prompt (Dell Leftovers and Tailscale)` | the Build 4b sections of the Build 4 findings |
| `Index History (to 2026-10-12)` | the Index ("Starting state") and the Build 1 to 3 findings |
| `Build 2 SSH Runbook` | Build 2 findings ("SSH runbook as executed") |
| `Build 2 Acer Handoff`, `Acer Session Handoff (Build 5b)`, `Acer Run Sheet` | the Acer visit findings (results, the parity matrix, and a condensed recipe) |
| every `.bak`, session copy and `acer-visit` backup | git history only |
| the 2026-10-13 `sync-conflicts` folder | gone before this pass; the incident is recorded below |

## Incidents worth remembering
- **2026-10-13, 15 Syncthing conflict files:** two Dell Claude sessions edited the same notes at once (one under a renamed `_Rebuild - Index`). No technical lock exists; the Index's "one owner per note" rule is the response, and Decision 11 in the Locked Decisions note records the same limit for code worktrees.
- **2026-10-14, Cursor's update broke twice:** a script force-killed it while its updater was applying an update. Fixed in the script; auto-update stays on (Build 4 findings).
- **2026-10-14, a WSL export "crashed" after writing the tar:** Windows `tar.exe` cannot read 56 pax names and exited nonzero under PS 5.1 `Stop`; the archive was sound (GNU tar listing, exit 0).
- **2026-10-17, C: free fell 17.5 GiB in a day with no alert:** most likely the system-managed pagefile growing to 31 GB; confirm after a reboot.

## Parent folder map (`New Laptop/`, classified 2026-10-17)
| Note or folder | Role | State |
|---|---|---|
| [[Installations]] | living inventory (Acer sections, Dell Windows and WSL tables, Acer WSL and Windows state) | current as of 2026-10-17 |
| [[Ubuntu - WSL]] | living WSL reference and the Acer audit | current; two wrong flashcards corrected |
| [[Machine Toolkit - Tool Use Cases and Agent Guide]] | authored agent guide | current |
| [[New Laptop Setup]] | original Acer setup plan | historical |
| `Acer Live State 2026-09-16` | Acer snapshot and execution log | historical |
| `WSL New Laptop Master Plan` and [[WSL Session Briefing]] | September WSL plans | historical; Ollama and "Dell retired" statements are out of date |
| [[Old Laptop Decommission Checklist]] | decommission plan | superseded (the Dell is the canonical host) |
| `Statusline Migration - Acer Prompt` | an Obsidian plugin prompt | misplaced; not part of this programme |
| `VS Code ...` notes | Acer Windows VS Code work from 2026-10-12 | reference; Build 6 reads them |
| `Codebases/` | per-repo directives and the Locked Decisions note | living |
| `Sync/` | the separate Cross-Laptop Sync series with its own roadmap | untouched by this programme |

## What still has no run
Builds 6, 7 and 8 (no prompts written). The open ledgers for the Dell and the Acer, and the ordered next actions, are in [[Old Laptop Rebuild - Index]].
