---
type: note
status: sprout
created: 2026-10-07
updated: 2026-10-17
course: Life
track:
  - laptop
  - windows
tags:
  - note
  - laptop
  - disk
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Runs Index]]"
  - "[[Old Laptop Rebuild - Build 1 WSL Findings]]"
  - "[[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]]"
  - "[[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]]"
  - "[[Installations]]"
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
next: "Dell closed except vscode-remote-wsl. Acer: set the cache variables (row 3)."
---
# C Drive Bloat - Failure Log and Prevention Rules

## One-Line Answer
==Moving the WSL disk to D: protected C: from almost nothing: the Dell's C: is 93% used because dozens of small defaults (tool caches, Electron apps, a fallback pagefile, old redirects never cleaned up) each landed on C: separately, and Build 1's 41.7 GiB reclaim happened entirely on D: and inside ext4.==

## Status (2026-10-17)
All nine failure-log rows are settled on the Dell except row 5 (`vscode-remote-wsl`, still on C:). The Acer still lacks most cache redirects (row 3). C: free on the Dell moved 28.6 GiB (2026-10-04) to 20 (10-07) to 136 (10-12) to 145 (10-13) and read 120.8 on 2026-10-17 because the system-managed pagefile grew to 31 GB; the standing rule is to read C: free after a reboot before suspecting data. The growth rules below remain the maintained part of this note.
## Measured state (Dell, read-only scan 2026-10-07)
| Item | Value | Source |
|---|---:|---|
| C: size / used / free | 252 GB / 93% / about 20 GiB | `df /mnt/c` |
| C: free, 2026-10-04 start of Build 1 | 28.65 GiB | Build 1 findings |
| C: free, after Build 1 | 26.30 GiB | Build 1 findings |
| C: free, 2026-10-07 | about 20 GiB | live; the drop is about 6 GiB in three days |
| `C:\pagefile.sys` | 31.49 GiB (was 25.6 on 10-04) | live; peak use only 6.3 GiB, current 4.6 GiB |
| Profile, non-AppData | about 29 GiB | scan |
| `AppData\Local` top | Programs 14.1, Spotify 6.38, Vivaldi 5.63, Microsoft 4.87, superwhisper 4.82, **npm-cache 4.31**, Packages 3.68, Temp 3.37, **uv 2.51**, hermes 2.09, WisprFlow 1.88, **ms-playwright 1.34** (GiB) | scan |
| Profile folders | miniconda3 7.09, **vscode-remote-wsl 6.29**, .vscode 4.08, .codex 3.36, **codex-cleanup-quarantine-2026-09-20 2.34**, .cache 1.44, .local 1.18, .kiro 0.91 (GiB) | scan |
| Roaming and Windows folders | not measured in this pass. 10-04 WizTree: Roaming Claude 10.7, Code 3.4, Jan 3.3, Cursor 2.8, Kiro 2.6, npm 1.8 | [[Old Laptop Rebuild - Index]] |

## Failure log
| # | What went wrong | Evidence | Root cause | Status |
|---|---|---|---|---|
| 1 | Pagefile on C: is 31.5 GiB although Windows is configured for `d:\pagefile.sys` | `Win32_PageFileSetting`: `d:\pagefile.sys`, size 0/0, `AutomaticManagedPagefile` False. `Win32_PageFileUsage`: only `C:\pagefile.sys`, 32,247 MB allocated, peak 6,471 MB | The configured D: file does not get created, so Windows falls back to a RAM-sized file on C:. Why D: fails is a hypothesis; confirm in the event log before changing anything | Closed 2026-10-12 (Build 3): one system-managed `C:\pagefile.sys`, 16,384 to 32,768 MB; the D: file was dropped and the BitLocker external-key auto-unlock explanation was never tested. The file still grows toward 32 GB under memory pressure (31 GB on 2026-10-17), which is normal and shows up as lost C: free space until the next reboot |
| 2 | npm cache redirect "missed" | `npm config get cache` now returns `D:\npm-cache`, but `Local\npm-cache` still holds 4.31 GiB | The redirect was set later and the old cache was never removed. It is a stale copy, not live data | Closed (Build 3): `Local\npm-cache` is gone; the npm cache is `D:\Cache\npm` |
| 3 | uv, Playwright, pip caches default to C: | `UV_CACHE_DIR`, `PIP_CACHE_DIR`, `PLAYWRIGHT_BROWSERS_PATH` unset for the user; `Local\uv` 2.51 GiB, `ms-playwright` 1.34 GiB | Each tool needs its own env var; the D: policy was written per tool, never as a rule | Closed on the Dell (Build 3): `UV_CACHE_DIR`, `PIP_CACHE_DIR`, `HF_HOME`, `NUGET_PACKAGES`, `GRADLE_USER_HOME`, `PLAYWRIGHT_BROWSERS_PATH`, `PUPPETEER_CACHE_DIR` all point into `D:\Cache`. **Open on the Acer**: its catalog (2026-10-15) shows only `UV_CACHE_DIR=D:\Apps\uv-cache`; the others, and `OLLAMA_MODELS`, are unset |
| 4 | WSL swap lands on C: | Acer notes; the Dell had no `swapfile=` | `swapfile` defaults to `%TEMP%\swap.vhdx` | Fixed on the Dell by Build 1 (`D:\WSL\swap.vhdx`, 8 GiB). The Acer fixed its own swap on 2026-10-15 (`D:\WSL\wsl-swap.vhdx`) |
| 5 | Moving the VHDX to D: was read as "WSL is off C:" | Index facts; 9.26 GiB of WSL-adjacent files sit on C: | `vscode-remote-wsl` (6.29), the old Codex quarantine (2.34) and `%TEMP%\wsl-crashes` (0.54) are outside the VHDX | Partly closed: the 2026-09-20 Codex quarantine and `%TEMP%\wsl-crashes` are gone. `vscode-remote-wsl` (6.5 GiB) is **still on C:** and was never decided |
| 6 | Electron and Store apps are stuck on C: | [[Installations]] already says so; Spotify 6.38, Vivaldi 5.63, superwhisper 4.82, WisprFlow 1.88 | Their installers offer no location choice | Accepted. Budget for them; clear their caches |
| 7 | Windows-side editors and agents grow on C: | `.vscode` 4.08, `.codex` 3.36, Local\Programs 14.1 (VS Code installed on C: here, on D: on the Acer) | Install location and extension cache are not redirectable per tool | Accepted. Ollama moved to `D:\Apps\Ollama`; the editors and Electron apps stay on C: |
| 8 | A cleanup created more C: data | `codex-cleanup-quarantine-2026-09-20` 2.34 GiB | "Quarantine" moved files to the same drive and nothing reviewed them | Closed 2026-10-17: the quarantine and every other review folder were verified and deleted. The 2026-10-12 fix for the Codex daemon (`.codex\packages` junction with a `current` pointer) stands |
| 9 | Free space was reported from the wrong place | Build 1's 41.7 GiB reclaim changed D: and ext4 only; C: free fell | Different drives; host reclaim also needs trim plus compaction | Rule below |

## Growth rules (apply to both laptops)
| Source | Standing rule | One check command (PowerShell) |
|---|---|---|
| Free-space floor | Treat C: under 60 GB free as "act now" and under 30 GB as an incident. The statusline warning at 30 GB is too late for a 250 GB drive | `Get-PSDrive C \| % { [math]::Round($_.Free/1GB,1) }` |
| Pagefile | Explicit size on a drive that works, with a measured cap (peak use plus headroom), never a RAM-sized fallback. The Windows-host build chooses the numbers | `Get-CimInstance Win32_PageFileUsage \| select Name,AllocatedBaseSize,PeakUsage` |
| Tool caches | Set the env var at user scope the day the tool is installed: `npm config set cache`, `UV_CACHE_DIR`, `PIP_CACHE_DIR`, `PLAYWRIGHT_BROWSERS_PATH`, `OLLAMA_MODELS`. After any redirect, delete the old C: copy in the same step | `npm config get cache; [Environment]::GetEnvironmentVariable('UV_CACHE_DIR','User')` |
| WSL files | VHDX, swap and Docker data on D:. Review `vscode-remote-wsl`, `%TEMP%` and any dated quarantine monthly | `Get-ChildItem $env:USERPROFILE -Force \| ? Name -match 'wsl\|quarantine'` |
| Installers | Before installing, check whether the installer has a location option. If not, list it as "stuck on C:" in [[Installations]] with its expected size | Compare `Local\Programs` and `Program Files` against [[Installations]] |
| Quarantine folders | A quarantine lives on D: and has a review date in the folder name | `Get-ChildItem C:\Users\* -Directory -Force \| ? Name -match 'quarantine'` |
| Reporting | State the drive with every "reclaimed" number | n/a |

## What the Acer needs (not measured here)
The Acer's C: is about 315 GB (166.5 GiB free on 2026-10-15) with D: at 518.5 GiB free. Its catalog shows npm and uv redirected but the other tool caches and OLLAMA_MODELS not (see row 3); its WSL swap moved to D: on 2026-10-15; DriveFS cache stays on C: with no supported redirect ([[Acer Live State — 2026-09-16]]).

## Hand-offs (closed 2026-10-17)
The Windows-host build this note was written for ran as Build 3 (plan in the Build 3 findings, execution in 3b). Final state per failure-log row is in the table above. What is still open:
- **Acer:** set the cache variables (`PIP_CACHE_DIR`, `HF_HOME`, `NUGET_PACKAGES`, `GRADLE_USER_HOME`, `PLAYWRIGHT_BROWSERS_PATH`, `PUPPETEER_CACHE_DIR`) and decide `OLLAMA_MODELS`; its `UV_CACHE_DIR` already points to `D:\Apps\uv-cache`. The Acer has 166.5 GiB free on C: (2026-10-15 catalog), so it is not urgent.
- **Dell:** decide `vscode-remote-wsl` (6.5 GiB on C:); re-read C: free after the next reboot (the pagefile should shrink back from 31 GB); the daily watcher (`D:\WSL\ops\windows\watch\watch-history.csv`) and the first `Toolkit-Weekly-Clean` run on 2026-10-18 are the standing checks.
- Reference measurements: C: free 20.08 GiB (2026-10-07), 39.5 (2026-10-11), 136.4 (2026-10-12 night), 145.4 (2026-10-13), 120.8 (2026-10-17).