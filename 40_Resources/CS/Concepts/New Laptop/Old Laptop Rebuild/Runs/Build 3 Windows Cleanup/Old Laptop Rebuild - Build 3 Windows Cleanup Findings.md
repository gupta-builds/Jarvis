---
type: note
status: seedling
created: 2026-10-11
updated: 2026-10-11
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
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Installations]]"
  - "[[Google Drive Sync Policy]]"
  - "[[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]]"
next: "Build 3 is executed and closed by [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]] (2026-10-12): C: free 39.5 to 136 GB, weekly clean and daily watch registered. Remaining items are listed there."
---
# Old Laptop Rebuild - Build 3 Windows Cleanup Findings

## One-Line Answer
==Phase 1 (read-only) is done. C: already sits at 39.6 GiB free because the Revo cleanup ran before this session; the pagefile is the biggest single item left (25.4 GiB on C:), and its D: replacement is blocked for a reason Windows does not log, so the fix is an explicit sized pair of pagefiles proven by a reboot test, not another guess.==

## Before and after
| Metric | Before (live, 2026-10-11 ~18:30) | After |
|---|---:|---:|
| C: free | 39.58 GiB (212.3 GB used, 84.3%) | pending |
| D: free | 363.91 GiB | pending |
| Pagefile | `C:\pagefile.sys` 26,030 MB allocated, 1,185 MB in use, 1,246 MB peak; configured `d:\pagefile.sys 0 0` that does not exist | pending |
| Commit charge / limit | 43.2 GiB / 57.1 GiB | pending |
No state-changing command has run yet in this build. Every item below was a read.

## Setup facts that differed from the prompt (live machine wins)
| Prompt said | Live state | Effect |
|---|---|---|
| C: 28.2 GB free | 39.58 GiB free | Revo Uninstaller and the app removals already freed about 11 GiB |
| Seven screenshots: three C:, four D: | Seven screenshots, all of C:, taken after the Revo cleanup (WizTree shows 39.6 GB free, same as live) | D: measured live only; no D: screenshot to compare |
| 57 .dmp files, 4.3 GB | 37 .dmp files, 1.22 GiB found on C: | Earlier cleanup removed about 3 GiB of dumps |
| Pagefile about 26 to 31 GB | 26,030 MB (25.4 GiB file) | Windows resized the fallback file since 10-07 |
| Google Drive: Mirror on the Dell | Registry shows mount letters H and I for two accounts; no mirror path; no G: drive; `GoogleDriveFS` not running | Dell is configured Stream-style today, not Mirror. Re-check in the app UI before Phase 6 |
| IntelliJ, Copilot, superwhisper installed | IntelliJ absent (only a settings backup in Roaming\JetBrains), Copilot package absent, superwhisper folder absent | Already removed |
| Microsoft 365, OneDrive, Edge still to remove | Microsoft 365 Apps 16.0.20430 (4.69 GiB) and Edge 155 still installed; no OneDrive process | Listed under Tier B |
| WizTree "10-04" | Screenshots match the live scan within 0.2 GiB | Treat screenshots as the 10-11 baseline |

## Screenshot transcription (WizTree v4.31, C:, scan 7.59 s)
Hard-to-read figures were not an issue (text legible at native size), so no crop-and-zoom was needed. Size / allocated / items.
| Path | Size GB | Alloc GB | Items |
|---|---:|---:|---:|
| C: total | 227.6 | 209.7 | 1,862,699 |
| Users | 121.1 | 118.0 | 1,143,830 |
| Users\Anant Gupta | 120.8 | 117.7 | 1,138,230 |
| AppData | 93.1 | 91.5 | 792,300 |
| AppData\Local | 59.7 | 58.3 | 600,796 |
| AppData\Roaming | 33.3 | 33.1 | 188,650 |
| Roaming\Claude | 12.0 | 12.0 | 24,622 |
| Roaming\Claude\vm_bundles\claudevm.bundle | 10.6 | 10.6 | 9 files |
| Roaming Code / Jan / Cursor / Kiro / npm | 3.4 / 3.3 / 2.8 / 2.6 / 1.8 | | |
| Local\Programs | 14.1 | 14.2 | 66,011 |
| Programs: Ollama / cursor / VS Code / cluely / Loom / Kiro | 6.5 / 1.8 / 1.1 / 0.98 / 0.90 / 0.76 | | |
| vscode-remote-wsl | 6.5 | 6.5 | 93 |
| miniconda3 | 7.1 | 5.4 | 177,399 |
| .codex / .vscode / quarantine-2026-09-20 / .cache | 4.2 / 2.4 / 2.3 / 1.5 | | |
| Windows | 39.4 | 29.2 | 364,227 |
| pagefile.sys | 25.4 | 25.4 | 1 |
| Program Files | 22.8 | 20.9 | 87,600 |
| Program Files: WindowsApps / Office / Docker / Dell / WSL | 7.6 / 4.7 / 3.7 / 1.1 / 1.1 | | |
| ProgramData / System Volume Information / Program Files (x86) / opamroot | 5.8 / 2.9 / 5.4 / 2.4 | | |
By type (size GB, files): .dll 45.6 (57,419), .sys 26.7, .exe 25.7, .vhdx 12.7 (14), .gz 6.5, .dmp 4.3 (59), .msi 3.6, .gguf 2.8 (1), .iso 1.4 (2).

## Live scan vs screenshot drift (GiB, reparse points skipped)
| Item | Live | Screenshot | Note |
|---|---:|---:|---|
| Users\Anant Gupta | 120.96 (user dir total incl. AppData) | 120.8 | match |
| AppData | 93.01 | 93.1 | match |
| Roaming\Claude | 12.03 | 12.0 | match |
| vscode-remote-wsl | 6.51 | 6.5 | match |
| pagefile.sys | 25.42 | 25.4 | match |
| Windows | 35.41 | 39.4 | live scan skips hard-linked WinSxS duplicates; Tier C either way |
| Program Files | 15.30 | 22.8 | live cannot read WindowsApps (7.6 GiB); Tier C |
Conclusion: no meaningful drift, because the screenshots are from today.

## C: and D: by size, with verdict
| Item | GiB | Drive | Verdict |
|---|---:|---|---|
| Users\Anant Gupta total | 120.96 | C | split below |
| AppData\Local | 59.7 | C | see Local rows |
| Local\Programs | 14.13 | C | mostly forced C: (Electron). Ollama 6.5 needs a look (app or models?) |
| Local\Spotify | 6.60 | C | forced C: (clean cache only) |
| Local\Vivaldi | 5.05 | C | forced C:; default browser; clean cache |
| Local\Microsoft | 4.82 | C | Tier C as a tree |
| Local\npm-cache | 4.32 | C | stale copy; npm already uses D:\npm-cache. Tier A |
| Local\Google | 4.17 | C | Drive virtual files, bogus size; skip |
| Local\Packages | 3.69 | C | Tier C |
| Local\Temp | 3.35 (2.75 older than 7 d) | C | Tier A for the old part |
| Local\uv | 2.51 | C | Tier A after UV_CACHE_DIR is set |
| Local\hermes | 2.09 | C | unknown tool; Tier B, ask |
| Local\ms-playwright | 1.34 | C | Tier A after env var |
| Roaming\Claude | 12.03 | C | `vm_bundles\claudevm.bundle` 10.62 = Claude Desktop VM. Tier B, use the app's own reset |
| Roaming Code / Jan / Cursor / Kiro / npm | 3.44 / 3.31 / 2.80 / 2.62 / 1.75 | C | Code caches Tier A (1.40); Jan models Tier B; rest Tier C |
| miniconda3 | 7.09 | C | Tier B; notes say Miniconda belongs on D:\conda |
| vscode-remote-wsl | 6.51 | C | Tier B |
| .codex | 4.22 | C | Tier B (AI tool config, fresh-install policy) |
| quarantine-2026-09-20 | 2.34 | C | Tier B; contains .env-named files, so move to D: for review, never into Drive |
| opamroot / srverify | 2.37 / 0.23 | C | Tier B |
| pagefile.sys | 25.42 | C | fix in Phase 4 (admin script) |
| Windows 35.4, ProgramData 3.6, Program Files 15.3 + WindowsApps 7.6, PF(x86) 5.4 | | C | Tier C (Office 4.69 and Edge are Tier B app removals) |
| D:\WSL\Ubuntu\ext4.vhdx | 107.58 | D | Tier C; not sparse; do nothing |
| D:\WSL\Installers\wsl-ubuntu.tar | 36.75 | D | Tier B: delete after export check, or keep as the only backup |
| D:\WSL\Docker | 33.91 | D | Tier C; Docker's own prune only |
| D:\Users\Games | 86.03 | D | Tier B: Elden Ring rar 67.0, NFS Rivals rar 8.0, NFS Underground folder |
| D:\$RECYCLE.BIN | 32.5 on disk (57.2 by recorded sizes) | D | Tier A after you see the list; see below |
| D:\Users\_Anant | 13.46 | D | Tier B; vaults inside are Tier C |
| D:\_Anant | 11.88 | D | second root (00_Inbox, 20_Progress, 30_Resources, 99_Archive); review, probably the Acer-style Drive target |
| D:\AI\ollama-models | 9.2 | D | Tier B, keep unless told |
| D:\npm-cache | 1.66 | D | live, keep |

## Tier A (regenerable; waits for "go A")
| Group | GiB | Frees | Method |
|---|---:|---|---|
| Stale `Local\npm-cache` | 4.32 | C | verify `npm config get cache` = D:\npm-cache, then delete the folder |
| `Local\uv` | 2.51 | C | set `UV_CACHE_DIR=D:\uv-cache`, `uv cache clean`, remove old |
| `Local\ms-playwright` | 1.34 | C | set `PLAYWRIGHT_BROWSERS_PATH=D:\ms-playwright`, delete old (browsers redownload on demand) |
| pip cache | 0.32 | C | set `PIP_CACHE_DIR=D:\pip-cache`, `pip cache purge` |
| Temp files older than 7 d | 2.75 | C | age filter, skip locked files |
| VS Code `CachedExtensionVSIXs` 0.89, `CachedData` 0.31, `Cache` 0.20 | 1.40 | C | only with VS Code closed |
| Crash dumps except the newest per source: Crashpad (Code 15, Kiro 3, Todoist 1, Vivaldi 4), `CrashDumps` 10, `wsl-crashes` 3 | 1.22 | C | keep newest (Vivaldi 10-10 and WizTree 10-07) |
| Explorer thumbnail and icon cache | 0.21 | C | Storage Sense |
| WER ReportArchive 503 items, ReportQueue 13 | not sized | C | admin script |
| Windows Update `Download` | 0.56 | C | admin script, stop wuauserv first |
| Delivery Optimization cache | not readable unelevated | C | admin script |
| `DISM /StartComponentCleanup` | unknown | C | admin script |
| D: recycle bin | 32.5 | D | after you read the list below |
Sum for C: about 14.6 GiB plus the unsized admin items.

D: recycle bin list (recorded original paths; not all of it is regenerable, so I will not empty it on "go A" alone):
- `D:\games\NFS-Heat-DE-SteamRIP.com.rar` 25.97, deleted 2025-02-06
- `D:\projects` 25.6, deleted 2026-09-12; contains a full folder tree with `.git`, `.claude`, `.codex`, `.obsidian` and Rust `target` dirs plus loose notes. Looks like an old copy of a workspace, so check it is already in GitHub or Jarvis
- `D:\Users\_Anant\10_Areas\Documents\Jarvis\.merget` 1.85 and `.tmp.driveupload` 0.60 (Jarvis junk)
- `D:\Users\_Anant\10_Areas\Job & Apartment\UROP\BOOM\boom_windows_backup` 1.36
- `D:\Users\_Anant\10_Areas\Real coding\Hub\NSP\Assisto\my-strapi-project` 0.59
- UMN notebooks CSCI 4041 (about 1 GiB) and about 660 small files
Recorded sizes add to 57.2 but disk holds 32.5, so some entries were already purged. Ask me for the full per-entry list file if you want to pick.

## Tier B (per item)
| Item | GiB | Drive | Note |
|---|---:|---|---|
| Claude Desktop VM bundle | 10.62 | C | use Claude Desktop's own reset; app must be closed |
| `vscode-remote-wsl` | 6.51 | C | VS Code WSL bridge; regenerates but ties to the open session |
| `codex-cleanup-quarantine-2026-09-20` | 2.34 | C to D | move to D:\Quarantine\...-review-2026-11-01, then decide |
| miniconda3 | 7.09 | C | remove or rebuild at D:\conda (Build 2 left this undecided) |
| `.codex` | 4.22 | C | contents are a tool config; confirm first |
| opamroot, srverify | 2.60 | C | OCaml opam store and an old verify folder |
| `hermes` | 2.09 | C | unknown tool, identify first |
| Jan models and app | 3.31 + 0.21 | C | `.gguf` already down to 1 file |
| Microsoft 365 Apps + Teams add-in + Office companion Appx | 4.69 + small | C | wipe list; run Revo or Office uninstall |
| Microsoft Edge 155 | 2.8 | C | not uninstallable in this region; keep WebView2; see wipe-list plan below |
| Bing apps (BingSearch, BingNews, BingWeather), Outlook (new), Feedback Hub, Dev Home, Power Automate, Clipchamp-type Store bloat | small | C | `Remove-AppxPackage` for the user |
| Malwarebytes (two entries), Respondus LockDown, Dell Optimizer, SupportAssist plugin, MongoDB Shell, WinRAR | about 1.4 | C | all on the "not carrying forward" list |
| Stray files in profile root | 0.03 | C | see Sensitive and suspicious |
| `D:\WSL\Installers\wsl-ubuntu.tar` | 36.75 | D | |
| `D:\Users\Games` archives | 86.0 | D | |
| Docker data prune | up to 33.9 | D | Docker's own prune only |

### Suspicious files in the profile root
`0K7YY.exe` and `nc6a9.exe` are byte-identical (14,115,592 bytes, SHA-256 `B9A1ABFDE2EEE68E3AD7950437E39DC841FB6C22E698062EB8DEFEF7B8C92F93`), dated 2025-01-20. Both report ProductName "MoUsoCoreWorker" (a Windows Update process name), have a Chinese company certificate subject (Zhejiang, Hangzhou), and the Authenticode status is **HashMismatch**, which means the file was altered after signing. Random 5-character names plus a spoofed Windows product name is a malware-dropper pattern. They were not run. Recommendation: do not execute, run a Defender full scan, then delete with approval. Hash lookup on VirusTotal sends only the hash; I will do it only if you say so.
`NUL` (903 bytes) is listed by `Get-ChildItem` but `Test-Path` on the `\\?\` form said False, so removal needs the exact name; Tier B. `echo` (0 bytes) exists. `global.yml` is 0 bytes, `settings.json` 124 bytes, `battery-report.html` 0.2 MB, `mongosh-2.5.9-x64.msi` 0.05 GiB.

## Pagefile root cause and recommended configuration
Evidence:
- D: is NTFS, Healthy, Basic partition 5 on the same disk, and Ntfs event 98 reports it healthy at 13:04:56, one second after boot. A failed mount is not the cause.
- BitLocker: the shell property `System.Volume.BitLockerProtection` is 1 (on) for both C: and D:. Boot logs show BitLocker event 24641 ("unexpected error ... retrieve the volume master key during restart"), 24 times in 30 days, and event 24711 (V2 TPM protector used). `manage-bde` needs admin, so D:'s protector type and auto-unlock state are not read yet. That is the first admin step.
- Registry `PagingFiles` is `d:\pagefile.sys 0 0` (system managed on D: only) and `ExistingPageFiles` lists only C:.
- Crash dump type is 3 (small dump). Microsoft states dump features need a pagefile on the boot volume, so a configuration with nothing on C: makes Windows create its own fallback file on C:.
- No System-log event names a failure to create the D: file.
Verdict: **probable, not proven**: two causes stack, (1) the boot-volume rule forces a C: file when none is configured, and (2) D: is BitLocker-protected and may not be unlocked when the pagefile is initialized. Only the elevated diagnostic can separate them.
Sizing: Microsoft sizes by peak commit charge and the dump type, not by RAM. Live commit is **43.2 GiB of a 57.1 GiB limit** (RAM 31.7 GiB plus 25.4 GiB pagefile). Peak pagefile use (1.2 GiB now, 6.5 GiB on 10-07) is low, but the commit limit matters: Windows logged 38 low-virtual-memory events (ID 2004) in 30 days, 27 of them on 10-10, and all 38 named **vmmemWSL** as the top consumer (about 16 GiB). Shrinking the pagefile to match "peak use" would cut commit headroom and cause crashes.
Recommendation (after the diagnostic confirms D: can host it):
- `C:\pagefile.sys` fixed 4,096 MB initial and maximum. Satisfies the boot-volume rule for a small dump and gives a safe fallback.
- `D:\pagefile.sys` fixed 32,768 MB initial and maximum.
- Commit limit becomes about 68 GiB (31.7 + 36), above today's 57.1, and C: gains about 21 GiB. Keep crash dump type at small.
- Verify after one reboot: `Win32_PageFileUsage` must list both files and `D:\pagefile.sys` must exist. If D: is missing again, rollback is C: fixed 32,768 MB and remove the D: entry; C: then gains nothing but stops the RAM-sized fallback.
The elevated script and rollback are written in Phase 4. The read-only diagnostic exists now: `D:\WSL\ops\windows\diag-pagefile-bitlocker.ps1`.

## Crash causes
Window: last 30 days (Kernel-Power 41, BugCheck 1001 and 6008 events: none, so there were no blue screens or hard power loss).
| Rank | Program | Evidence |
|---|---|---|
| 1 | VS Code | 15 Crashpad reports (Jul 3, Aug 4, Sep 5, Oct 3; newest 10-03), 0.45 GiB |
| 2 | Realtek audio service `RtkAudUService64.exe` | 4 Application Error events in 30 d plus 1 dump |
| 3 | Loom | 3 dumps in `CrashDumps` (WizTree64 has 2 dumps and 2 error events, so it ties) |
Other Application errors: CodexSandboxService.OpenAI.Codex 16 (service errors, 2 since boot), VSS 12, Universal Print 10, `wslservice.exe` 1, `explorer.exe` 1, `svchost.exe` 1. System errors: DistributedCOM 10001 x82, HAL 20/21 x31 each (RTC query fails, firmware), BitLocker 24641 x24, Hyper-V VmSwitch 15 x21, Windows Update 20 x17.
The pattern that matches "crashes tied to a full C:" is the commit exhaustion above (vmmemWSL), not bugchecks.
Program fixes: update or reinstall the Realtek audio driver from Dell; Loom and WizTree are low-value (remove Loom if unused, update WizTree); keep one VS Code Crashpad report and rely on Settings Sync-safe checks later; investigate the Codex sandbox service error text before touching it.
dump inventory: 37 .dmp on C: (1.22 GiB): wsl-crashes 3 (0.54), Code 15 (0.45), Kiro 3 (0.10), CrashDumps 10 (0.09), Todoist 1, WebView 1, Vivaldi 4. None found outside the profile (no `C:\Windows\Minidump` or `MEMORY.DMP`).

## Installed programs, classified
Buckets from [[Installations]]. Install location read from the uninstall keys; blank means the installer does not record one.
| Program | Location | Verdict |
|---|---|---|
| VS Code 1.141, Cursor 3.19, Kiro 1.0.395, Antigravity 2.12, Jan, Ollama, Obsidian, Postman, Slack, Discord, Zoom, Telegram, Spotify, Vivaldi, Voquill, Todoist, Loom, Cluely, 16x Prompt, Bitwarden, Claude Desktop | `AppData\...` | forced to C: (Electron/Squirrel/Store); clean caches only. VS Code is bucket B (Acer put it on D:) but moving it belongs to the Windows VS Code build |
| Docker Desktop 4.56 | `C:\Program Files\Docker` (disk on D:\WSL\Docker) | keep |
| Git, GitHub CLI, Node 22, Python 3.13 (Program Files and `C:\Python313`), ripgrep, jq, FFmpeg, opam | C: small | keep; opam store `C:\opamroot` 2.37 is Tier B |
| Miniconda3 | blank | reinstall on D:\conda if needed |
| Microsoft 365 Apps, Teams Meeting Add-in, Outlook (new), Office hub, M365 Companions | Program Files | remove (your wipe list) |
| Microsoft Edge | Program Files (x86) | cannot be fully removed; keep, never default (see plan) |
| Malwarebytes, Respondus, Dell Optimizer, SupportAssist plugin, MongoDB Shell, WinRAR | various | "not carrying forward" list; remove with approval |
| PowerToys (preview), Logi Options+, Realtek, Intel graphics, Dell Command Update, Revo, WizTree, CrystalDiskInfo | Program Files | keep (hardware or tools); Dell Command Update is useful on a Dell |
| Store extras: Netflix, WhatsApp, LinkedIn, ShowKeyPlus, HP Printer Control, Bing apps, Feedback Hub, Dev Home, Power Automate, Maps, Clipchamp-like, Zune, Xbox identity | WindowsApps | Tier B group; remove what you do not use |

## Wipe list handling (Copilot, Office, OneDrive, Edge, Bing, tracking)
Plan only, nothing run:
- Copilot: package already absent; still add the policy value that turns the Copilot entry points off (admin script).
- Microsoft 365: Office uninstall through Revo or the Office installer, then its leftover Appx entries.
- OneDrive: no process is running and no folder is configured; confirm `OneDrive.exe` under `C:\Windows\SysWOW64` and remove it with the documented `OneDriveSetup.exe /uninstall`; known folders stay redirected to D:.
- Default browser and Edge: Windows 11 in this region does not allow uninstalling Edge, and WebView2 is a dependency of Obsidian, Teams, Claude and Cursor tooling. Set Vivaldi as default for http, https, .html and PDF (Windows requires you to do this in Settings, one click per type), and add policy keys that stop Edge from starting at logon and prompting.
- Bing and web search: remove BingSearch, BingNews, BingWeather and set the policy `DisableSearchBoxSuggestions` plus `BingSearchEnabled=0` for the user.
- Tracking: Windows 11 Pro allows telemetry level "Required" (1), not 0. Set `AllowTelemetry=1`, turn off advertising ID, tailored experiences, activity history upload, and disable DiagTrack only if you accept losing Windows Update diagnostics. Needs your approval per group.

## Startup and scheduled-task review
Startup entries (current user): Discord, RiotClient, Medal, Steam, GoogleDriveFS, Rize, Spotify, Docker Desktop, Voquill, Slack. Machine: SecurityHealth, WavesSvc, RtkAudUService, DubbingAI. Startup folder: E START App, Ollama, OpenClaw Gateway.cmd, Send to OneNote, Wispr Flow.
| Item | Recommendation |
|---|---|
| Discord, RiotClient, Medal, Steam, Spotify, Rize, Voquill, Slack, E START App, Wispr Flow, Send to OneNote | disable at startup (launch when needed); saves RAM and logon time |
| Docker Desktop | disable at startup (Docker is not needed running; WSL stays up without it) |
| Ollama, OpenClaw Gateway | disable unless you call them every day; Ollama starts on demand |
| GoogleDriveFS | keep and make sure it runs (it is not running now) once the Drive design is applied |
| SecurityHealth, WavesSvc, RtkAudUService | keep (Windows and audio) |
| DubbingAI (Run key plus task `Login Auto Start Dubbing Task`, last result 2147942402 = file not found) | remove the task; app name suggests it is not in use |
| `ConversationCapture-Backfill-WSL` | decision with you in Phase 4: WSL stays up now, so every 30 minutes `wsl.exe` is harmless but redundant; either keep and rename for clarity, or keep only the Windows task |
| `ConversationCapture-Backfill-Windows`, `Jarvis-Cursor-Session-Export`, `Jarvis-GitAutoSync`, `Jarvis-WeeklyReview`, `Syncthing` | keep. Syncthing ran from `D:\Users\_Anant\Downloads\syncthing-windows-amd64-v2.1.5\...` at the time of this finding, so a Downloads cleanup would have broken it; move it to `D:\Apps\Syncthing` later — **resolved 2026-10-12**: moved to `D:\Apps\Syncthing\syncthing-windows-amd64-v2.1.5\syncthing-windows-amd64-v2.1.5\syncthing.exe`, Scheduled Task and self-heal cache file repointed, process restarted clean from the new path, verified fully synced |
| `Jarvis-Syncthing-Health` | keep but it last returned 1 (matches the toast in screenshot 3: six live `.sync-conflict-*` files). Run the Operations Reference Part 4 procedure; do not bulk-delete |
| `ClaudeKit-Sync-All`, `SecondBrainClaudekit-JarvisSync` (disabled) | leave disabled |
| Vivaldi and Zoom update tasks, PowerToys Autorun, SoftLanding | keep |

## Google Drive state and design
State (folder metadata and registry only, no file contents read): Drive for desktop 132.0.0.0, `GoogleDriveFS` not running. DriveFS holds three account folders: `103930582376387415450` and `115366980661411161034` (both created 2026-09-12 within three minutes of each other) and `111151548963526254455` (touched 2026-09-16, the **current account token**, with a `machine_root_doc_id`, so it is the one with "back up folders" enabled). Mount letters in the registry: H for `111...` and I for `115...`. Which email is which cannot be read without opening account files, so I propose you tell me, or sign in via the Drive tray menu so the app shows it.
Design (applies once you approve):
- Mode: Mirror, with the mirror root on D: (path decided in Phase 6 from the official docs).
- Mirror these top-level folders only: `D:\_Anant\00_Inbox`, `20_Progress`, `30_Resources`, plus the document-only `UMN-Documents`, `Finance`, `Job & Apartment` folders as the Policy note lists. No code, no `.git`, no `node_modules`, no AI config, no secrets.
- Out: Jarvis and The Plan (Syncthing owns them, and Drive plus Syncthing on the same files would produce conflict copies), `D:\Users\_Anant\10_Areas\Documents` (it contains the Jarvis vault), `D:\WSL`, `D:\AI`, `C:\Users\Anant Gupta`.
- Drive cannot exclude subfolders inside a selected folder, so separation has to happen at the top level.
- DriveFS cache stays on C: (no supported redirect per the Acer notes).

## Sensitive-item inventory (path and category only, no values)
Name-based scan of `C:\Users\Anant Gupta`, `D:\Users`, `D:\_Anant`, `D:\AI` (skipping `node_modules`, `.venv`, `target`, the Ubuntu VHDX): **313 hits**.
| Category | Count | Where (top locations) |
|---|---:|---|
| browser data (Cookies, Login Data) | 145 | WebView2/Chromium profiles under `AppData\Local`, `AppData\LocalLow`, `AppData\Roaming\Code`, Antigravity, 16x Prompt |
| key or cert | 62 | `AppData\Local\Syncthing` (4), `.claude\sessions` (4), miniconda `pkgs` test certs (many, harmless test fixtures) |
| credential or auth file | 57 | `AppData\Roaming\Claude\local-agent-mode-sessions\...\.claude` (about 30 session folders) |
| env file | 48 | `AppData\Roaming\Kiro\...\globalStorage` (hashed folders), `codex-cleanup-quarantine-2026-09-20\agents-skills-disabled\gbrain` |
| password db | 1 | `AppData\Roaming\JetBrains\IntelliJIdea2024.3-backup\2025-02-21-17-49` |
None sit under a planned Drive mirror folder. The quarantine and the old IntelliJ backup should not move into any Drive folder. Profile-root `.mcp.env`, `.mcp.json`, `.mcp-env-*.ps1` and `.claude.json` also exist (sensitive by name).

## Contradictions with the vault
1. Index and Failure Log say C: has 20.08 GiB free: now 39.58 GiB.
2. Failure Log item 1: pagefile 31.49 GiB: now 25.4 GiB.
3. Prompt and Drive policy: Dell Mirror mode: registry shows H: and I: mount letters.
4. Index status block repeats the 2026-10-07 update paragraph twice; fix when the Index status line is updated.
5. Installations lists Miniconda for `D:\conda`; the Dell has it at `C:\Users\Anant Gupta\miniconda3` (7.09 GiB).

## State-changing commands
None so far. One new file: `D:\WSL\ops\windows\diag-pagefile-bitlocker.ps1` (read-only, elevated).

## Hand-offs to later builds
Pending until execution.

## Diagnostic result and revised pagefile plan (2026-10-11 evening)
Elevated read-only diagnostic `diag-pagefile-bitlocker.ps1`, transcript in `D:\WSL\ops\windows\` (recovery password redacted from the saved file; the key is escrowed to the Microsoft account).
- C: BitLocker 2.0, TPM plus recovery password, protection on, XTS-AES 128, used-space-only.
- D: BitLocker 2.0, protection on, **Automatic Unlock enabled through an External Key (.BEK)**. A BEK-based auto-unlock data volume is unlocked after the OS volume, which is the strongest candidate for why the D: pagefile cannot be created at boot. Still a hypothesis: Windows logs no event that names it, so the only proof is the reboot test below.
- BitLocker event 24641 also fired on 2026-10-03 (three times), so it is not new.
- `manage-bde -autounlock -status` is not a valid syntax; irrelevant.
Revised plan, because commit charge is 43.2 of 57.1 GiB (a 4 GB C: file would drop the limit below the current charge if D: fails again):
1. Stage 1 (`02-admin-cleanup.ps1 -Apply -Pagefile`): C: 16384 MB fixed, D: 32768 MB fixed. Commit limit about 80 GiB either way. C: gains about 9 GiB after the reboot.
2. Reboot, then check `Test-Path D:\pagefile.sys`.
3. Stage 2 (`03-pagefile-stage2.ps1 -Apply`): only if D: works, C: drops to 4096 MB (about 12 GiB more). If D: does not work, C: stays at 16384 fixed and the D: entry is removed. Either way the RAM-sized 25.4 GiB fallback is gone.

## C: layout map (target structure, mirrored on the Acer)
Rule: a folder on C: is either Windows, an installed program, or one tool's own state. Nothing the user authored lives on C:. Anything else goes to D:.
| Location | What it is | Owner | Action rule |
|---|---|---|---|
| `C:\Windows`, `C:\Program Files`, `C:\Program Files (x86)`, `C:\ProgramData`, `C:\Users`, `C:\Recovery`, `C:\pagefile.sys` | OS and installed programs | Windows | Tier C, never hand-edited |
| `C:\Python313`, `C:\opamroot`, `C:\srverify-*`, `C:\OneDriveTemp`, `C:\inetpub`, `C:\Config.Msi` | root-level leftovers | various | opamroot and srverify removed by script 01; empty ones are left (Windows recreates them) |
| `C:\Users\Anant Gupta\AppData\Local\Programs` | Electron and per-user apps with no location choice | each app | clean caches only; Ollama moves to `D:\Apps\Ollama` |
| `C:\Users\Anant Gupta\AppData\Roaming` | per-app settings and caches | each app | cache folders cleaned by script; never bulk-delete |
| `C:\Users\Anant Gupta\.<name>` dot folders (`.codex`, `.claude`, `.cursor`, `.kiro`, `.vscode`, `.docker`, `.cache`, `.local`, `.jdks`, `.gemini`, `.aitk`, `.pencil`) | AI and dev tool state | each tool | fresh-install-only, never synced, never copied |
| Profile root loose files | `.claude.json`, `.gitconfig`, `.npmrc`, `.condarc`, `.zshrc`, `.wslconfig`, `.mcp.*` | tools | keep (sensitive by name: `.mcp.*`, `.claude.json`); strays moved to `D:\Quarantine\c-cleanup-review-2026-11-01\profile-strays` |
| `D:\Quarantine\c-cleanup-review-2026-11-01` | the one quarantine | Build 3 | review and delete on 2026-11-01; never inside a Drive folder |
| `D:\Apps\<Name>` | programs whose installer lets you choose a location | user | winget `--location` or manual installer |
| `D:\Cache\{uv,pip,ms-playwright}` and `D:\npm-cache` | redirected tool caches | env vars | set at user scope the day the tool is installed |
| `D:\AI\ollama-models`, `D:\WSL\*` | models and WSL disks | tools | stay |
Storage verification (2026-10-11): Ollama models are on D: (`OLLAMA_MODELS=D:\AI\ollama-models`, 9.2 GiB); the Ollama app's 6.47 GiB `lib` folder is app runtime on C: and moves with the reinstall. Jan keeps its data folder in `AppData\Roaming\Jan\data` (3.31 GiB) on C:; moving it is a Jan Settings step (Advanced, Data folder).

## D: target layout and plan revision (2026-10-12)
Plan revision: the pagefile stays on C: only (16384 MB start, 32768 MB max, no D: file; script 03 dropped). Jan already moved itself to `D:\AI\jan` (its settings.json says so), so only the stale C: copy is deleted. The D: recycle bin and `D:\Users\Games` were emptied by the user (D: free went from 363.8 to 479.9 GiB).

| D: folder | Holds | Rule |
|---|---|---|
| `D:\_Anant` | the one user profile (vaults, 00_Inbox, 20_Progress, 30_Resources, 99_Archive) | target of the later `D:\Users\_Anant` merge, done only after the cleanup and a reference scan, because Jarvis, The Plan, Syncthing, MCP configs and scheduled tasks hardcode `D:\Users\_Anant` |
| `D:\AI` | `ollama-models`, `local-models`, `jan`, `hermes` | models and agent data |
| `D:\Cache` | `npm`, `uv`, `pip`, `ms-playwright`, `huggingface`, `nuget`, `gradle`, `puppeteer`, `codex` | everything that regenerates; set through user env vars and `npm config` |
| `D:\Apps` | `Ollama`, `miniconda3`, `opamroot` (junction targets), later `Syncthing` | installers with a location option |
| `D:\WSL` | Ubuntu disk, Docker disk, ops scripts | Tier C |
| `D:\Quarantine` | dated review folders | delete by the date in the name |
| `D:\DeliveryOptimization`, `D:\WUDownloadCache` | Windows Update caches | cleared by script 02; `Program Files`, `WindowsApps`, `WpSystem` are Store-managed, never touched |
