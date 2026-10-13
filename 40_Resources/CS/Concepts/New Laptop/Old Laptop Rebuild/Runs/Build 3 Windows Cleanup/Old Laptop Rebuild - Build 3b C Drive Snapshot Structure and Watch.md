---
type: note
status: seedling
created: 2026-10-12
updated: 2026-10-12
course: Life
track:
  - laptop
  - windows
tags:
  - note
  - laptop
  - storage
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Installations]]"
next: "Run 06 -StoreApps, then 08-finish-cleanup.ps1 (section 10); then Build 4 (toolkit) and the _Anant build on D:"
---

# Build 3b - C drive snapshot, structure and watch

Dell Latitude 5530 (`C:\Users\Anant Gupta`). Written 2026-10-12 after Build 3 scripts 01 and 02 ran. This note is the reference for what C: looks like, where things belong, what Windows owns, and what watches it from now on. The `_Anant` folder on D: is deliberately out of scope (next build). Google Drive data is not relied on yet.

## 1. Snapshot (WizTree, 2026-10-12 evening, before scripts 04 to 07)

C: total 251.9 GB, used 135.0 GB, free 116.9 GB, reserved space 2.1 GB. Before Build 3 free was 39.5 GB.

| Area | Size | What it is | Verdict |
|---|---|---|---|
| `C:\Users\Anant Gupta` | 65.4 GB | profile (AppData 56.5, dot folders about 8) | main target |
| `C:\Windows` | 33.5 GB | WinSxS 12.0, System32 9.5 (DriverStore about 4.5), Installer 1.8, LiveKernelReports 3.0 (USB-C dump) | only LiveKernelReports is removable |
| `pagefile.sys` | 16.0 GB | commit backing (WSL pushes commit to 43 GB) | keep, set in Build 3 |
| `$MFT` | 1.7 GB | NTFS file table | keep |
| `C:\Program Files` | 16.2 GB | WindowsApps 6.6, Docker 3.7, WSL 1.1, PowerToys 0.9, dotnet 0.5, Logi 0.5 | installs |
| `C:\ProgramData` | 5.0 GB | LogiOptionsPlus 1.4, Package Cache 0.64, Microsoft 0.49, Malwarebytes 0.28, Epic 0.14, chocolatey 0.13 | partly removable |
| `System Volume Information` | 2.9 GB | restore points | keep, watch |
| `C:\Program Files (x86)` | 5.1 GB | Microsoft (Edge, WebView) 3.9, InstallShield 0.76 (Dell Optimizer leftover), Google 0.30 | partly removable |
| `C:\Python313` | 0.29 GB | choco python313 | removable after uv (Build 4) |

AppData\Local 42.5 GB: Programs 7.1, Spotify 7.0, Vivaldi 5.2, Microsoft 4.7 (Outlook 1.0, Office 0.9, Olk 0.5 are Microsoft 365 leftovers), Google 4.2 (DriveFS), Packages 3.6 (MSTeams 1.9, WhatsApp 0.5), Temp 3.5, hermes junction 2.1.
AppData\Roaming 13.9 GB: Kiro 1.8, Cursor 1.8, npm 1.8 (global CLIs, keep), Code 1.6, Claude 0.8, Zoom 0.9, Medal 0.8, kingsoft 0.7, Opera 0.4, riot-client-ux 0.3, JetBrains 0.2.
File types: .dmp 3.7 GB (19 files), .iso 1.4 GB (2 Docker images, keep), .msi 2.9 GB (Windows\Installer, keep), .tmp 0.9 GB, .db-wal 0.8 GB, .vscdb 0.8 GB (editor state, keep).

## 2. What Build 3 did and what it left (verified live)

Done: caches and temp cleared, Claude VM bundle and Jan stale data deleted, Miniconda, opam, hermes and codex packages moved to D: with junctions, Ollama reinstalled on `D:\Apps`, component store cleaned (about 22 GB), 13 Store apps and 6 programs removed, OneDrive removed, pagefile fixed on C:. Syncthing was moved to `D:\Apps\Syncthing` by hand. Both `.relocating` folders, the npm cache, Riot metadata, Dell Optimizer package and 3 dead services were removed in the follow-up. Installers of three removed apps were deleted.

Cause of the earlier errors: opam files carry the System attribute, the user shell could not delete them (6,860 denials) and PowerShell asked a prompt per folder. Fixed by `takeown`, `icacls`, `attrib` and `cmd rd` from an elevated shell.

## 3. What Windows owns on C: and what we may configure

| Item | Size | Do not delete because | Configurable |
|---|---|---|---|
| `Windows\WinSxS` | 12 GB real | component store, hard-linked | only via DISM `/StartComponentCleanup` (Windows also runs it weekly itself) |
| `Windows\Installer` | 1.8 GB | MSI repair and uninstall files | none; it shrinks as products are uninstalled |
| `ProgramData\Package Cache` | 0.64 GB | repair and uninstall of VC++, .NET, PowerToys | same as above |
| `Program Files (x86)\InstallShield Installation Information` | 0.76 GB | uninstall data | Dell Optimizer entry is orphaned and removed by script 06 |
| `System Volume Information` | 2.9 GB | restore points, shadow copies | `vssadmin resize shadowstorage /for=C: /on=C: /maxsize=<N>GB`; script 06 reports current use |
| `pagefile.sys` / `swapfile.sys` | 16 GB / 16 MB | virtual memory | size set to 16-32 GB; hibernate is off so no `hiberfil.sys` |
| `$MFT`, `$LogFile`, `$Secure` | about 2 GB | NTFS metadata | none |
| `Windows\LiveKernelReports` | 3.0 GB | not needed | safe to empty; recurs because a USB-C (`UcmUcsiCx`) driver hangs; update Dell drivers if it returns |
| `C:\inetpub` | 0 | Microsoft security hardening folder (2025) | keep, even though it is empty |
| `C:\Recovery`, `C:\Dell`, `$Recycle.Bin`, `Documents and Settings` | tiny | WinRE, Dell update logs, links | keep |
| Reserved storage | 2.1 GB | update staging | `DISM /Online /Set-ReservedStorageState` can disable it; not worth the update risk |
| `Windows\System32\DriverStore` | about 4.5 GB | driver packages | old versions can be pruned with `pnputil /delete-driver`; script 06 only reports the size |

## 4. Structure (the contract)

C: holds Windows, Program Files installs, ProgramData for services, the user profile, `pagefile.sys`, and anything with a kernel driver or service (Docker, WSL, Tailscale if installed). Everything regenerable, large or portable lives on D:.

| D: folder | Purpose | Redirected by |
|---|---|---|
| `D:\Apps` | apps that accept an install path (miniconda3, Ollama, opamroot, Syncthing) | installer location, junction for legacy paths |
| `D:\Cache\<tool>` | disposable caches, one folder named after the tool | `npm` via `~/.npmrc`; `UV_CACHE_DIR`, `PIP_CACHE_DIR`, `HF_HOME`, `NUGET_PACKAGES`, `GRADLE_USER_HOME`, `PLAYWRIGHT_BROWSERS_PATH`, `PUPPETEER_CACHE_DIR`, `TEMP`, `TMP` (= `D:\Cache\Temp`) |
| `D:\AI` | models and agents | `OLLAMA_MODELS=D:\AI\ollama-models`, hermes junction |
| `D:\WSL` | distro, Docker and swap VHDX, ops scripts | `.wslconfig`, Docker setting |
| `D:\WSL\ops\windows` | all scripts, logs and the watch history | - |
| `D:\Backup\GameSaves` | game saves moved off C: (kept) | script 05 |
| `D:\Quarantine` | reversible deletions with a review date | script 05 |
| `D:\Dev`, `D:\Tools`, `D:\Installers` | new: projects, portable CLIs, installers | not created yet; create when first used |

Rules: new app = try an install path on D:, else leave on C: (Store, drivers). New cache = set its environment variable first. Never use a junction when a variable exists; keep the existing three (miniconda3, hermes, codex packages) because their contents hold absolute paths. Do not delete the `miniconda3` junction.

## 5. Scripts and run order (`D:\WSL\ops\windows`)

| Order | Script | Shell | Does |
|---|---|---|---|
| 1 | `04-admin-remove.ps1` | elevated | Logi Options+ and plugin service, VC++ 2010 and 2012, .NET 9, `ProgramData\Epic`. `-IncludeDotnet8`, `-IncludePython` are gated |
| 2 | `06-admin-deep-clean.ps1` | elevated | LiveKernelReports, WER, Dell Optimizer leftover, Google updater cache, Teams add-in, optional `-StoreApps`, reports |
| 3 | `05-user-deep-clean.ps1` | normal | moves uninstalled-app folders and outdated installers to quarantine, saves to `D:\Backup`, deletes caches and old Temp |
| 4 | `07-register-watch-tasks.ps1` | elevated | creates the two scheduled tasks |

Every script is a dry run until `-Apply`. Bugs found while writing them: the first elevated check used the string `Administrator` (no such group; fixed with the role enum), and the `.wslconfig` backup filter also matched the live file (fixed, dry run now lists only the two dated backups).

## 6. Watch design

| What | How | Where |
|---|---|---|
| Weekly clean | scheduled task `Toolkit-Weekly-Clean`, Sunday 03:30, old Temp, kernel dumps, WER, updater caches, crash reports, Delivery Optimization | log in `D:\WSL\ops\windows\logs` |
| Daily watch | `Toolkit-Watch-C`, 08:00, read-only | `watch\watch-history.csv`, `latest.json`, `ALERTS.txt`, toast |
| Alerts | C: free under 80 (warn) or 60 (critical); D: free under 100; LiveKernelReports over 0.5 GB; Temp over 3 GB; WSL swap over 4 GB; ext4 or Docker VHDX growth over 5 GB per week; C: falling over 10 GB per week; pagefile use; uptime over 21 days; Syncthing down; quarantine review date | |
| Jarvis | analysis of `latest.json` and history belongs to the existing `Jarvis-WeeklyReview` (LLM), not to the cleanup task | not wired yet |

Not scheduled on purpose: Spotify cache, Vivaldi cache (apps are open; they are cleaned by script 05 when closed), DISM `/ResetBase`, driver pruning, anything touching Google DriveFS.

## 7. Battery and always-on (Dell BIOS, F2 at boot)

Cap charge at 80 percent: Power Management, Battery Configuration, Custom with start 75 and stop 80 (or Primary AC Use). Set AC Recovery to power on after power loss. Windows side done by hand: never sleep on AC, disk never off, lid close does nothing, power button shuts down. Syncthing runs at logon, so after an unplanned reboot it stays down until sign-in; the daily watcher alerts if it is down. Auto sign-in was not enabled (weakens BitLocker).

## 8. Honest accounting

Expected from dry-run sizes (not measured): script 05 about 10.9 GiB, script 06 about 4 GiB (LiveKernelReports 3.0 from the screenshot, not readable without admin), script 04 about 2.5 GiB. That would put C: free near 130 to 135 GiB. Still on C: after that: Windows 33 GB, pagefile 16 GB, Docker 3.7, Spotify 7 (offline downloads), Google DriveFS 4.2 (not touched), Vivaldi 5.2, editors about 8, and the 1.9 GB Teams package unless `-StoreApps` is used.

Not done after this build: Python 3.13.5 and Chocolatey (need the standalone uv from Build 4), .NET 8 (check Dell Command Update first), Spotify and DriveFS relocation, `D:\WSL\Installers\wsl-ubuntu.tar` (36.75 GiB; an earlier draft said 73 GB because the size check counted the file twice; a D: item for Build 5), obsolete disabled tasks `ClaudeKit-Sync-All` and `SecondBrainClaudekit-JarvisSync`, the Windows Ollama startup shortcut (conflicts with the WSL Ollama on port 11434), Medal-like unknowns (Rize, GitKrakenCLI), and the Build 4 toolkit itself.

## 9. Run results (2026-10-12 night, from the logs, measured)

| Step | Result |
|---|---|
| 04 | Logi Options+ and Plugin Service, VC++ 2010 and 2012, .NET 9 removed (the two .NET 9 MSIs returned 1605 = already gone with their bundle), `ProgramData\Epic` removed. C: free 118.5 to 121.3 GiB |
| 06 | LiveKernelReports 3,070 MB emptied, Dell Optimizer InstallShield leftover 759 MB removed, Google updater cache 288 MB, Teams Meeting Add-in uninstalled. C: free 121.3 to 125.3 GiB. Restore points use 3.57 of 5.04 GB (fine) |
| 05 | 8.26 GiB moved (quarantine and game saves), 3.89 GiB caches and old Temp deleted. C: free 125.3 to 136.4 GiB. Left: `Local\Respondus` (locked) and three `DEL*.tmp` files (Windows installer temp, weekly task removes them) |
| 07 | `Toolkit-Weekly-Clean` (Sundays 03:30) and `Toolkit-Watch-C` (daily 08:00) registered. First watch run exit 0, no alerts |

Measured end state before the finishing step: **C: free 136.4 GiB (was 39.5 at the start of Build 3), D: free 449.8 GiB**, quarantine 6.28 GiB, no alerts. All items on the removal list are gone from the registry.

## 10. Finishing step (script 08) and final layout of the ops folder

`06-admin-deep-clean.ps1 -StoreApps -Apply` removes the Store apps MSTeams (1.9 GB), LinkedIn (0.2 GB), Netflix and HP Printer Control (WhatsApp stays). `08-finish-cleanup.ps1 -Apply -CloseSpotify` then: removes the locked Respondus cache, removes 14 verified-empty leftover folders (Adobe, Dell, JetBrains, Logi, old Office and similar), moves the remaining ten installers in Downloads to quarantine, sets Spotify offline storage to `D:\Cache\Spotify` with a 1 GB cache cap and empties `Local\Spotify\Data` (6.4 GB; offline downloads there are lost and re-download), and archives the finished scripts. The Spotify prefs key names come from community documentation, not Spotify, so check Settings > Storage after the next launch. The prefs file is backed up first.

Expected after both: about 145 GiB free (estimate, to be replaced by the next watch reading).

`D:\WSL\ops\windows` after the finish: `04-admin-remove.ps1` (kept: Python 3.13.5, Chocolatey and .NET 8 wait for Build 4), `08-finish-cleanup.ps1`, `weekly-clean.ps1` and `watch-c.ps1` (used by the tasks, do not move), `logs\`, `watch\`, `backup-20261012-1807\` (registry backups for the rollback of script 02), and `archive\build3-20261012\` (scripts 01 to 03, 05 to 07, pagefile diagnostics). Archive these further to the vault or delete them after the quarantine review.

## 11. Still open (not cleanup, carried forward)

- About 50 dot-folders in the profile (`.adal`, `.agents`, `.hermes`, `.openhands`, `.qoder` and similar) look empty but hold agent skill junctions, many pointing at `C:\Users\Anant Gupta\.agents\skills\*`, which does not exist. A separate task, because it sits under agent settings.
- Python 3.13.5 and Chocolatey after the standalone uv (Build 4); .NET 8 after checking Dell Command Update; Windows Ollama startup shortcut (conflicts with the WSL Ollama on 11434); obsolete disabled tasks `ClaudeKit-Sync-All`, `SecondBrainClaudekit-JarvisSync`; Rize and GitKrakenCLI are unknown tools left in place; WhatsApp (0.5 GB) kept.
- D: items (now Build 5): `D:\WSL\Installers\wsl-ubuntu.tar` (36.75 GiB, corrected from 73), Google DriveFS cache on C: (4.2 GB), `D:\Quarantine` review on 2026-11-01 and 2026-11-11.
- Battery cap to 80 percent and AC Recovery are BIOS steps for the user (section 7).

## 12. After the finish (fill in from the next watch reading)

| Metric | Start of Build 3 | Before 3b | Now |
|---|---|---|---|
| C: free | 39.5 GB | 116.9 GB | 136.4 GB (145 expected after script 08) |
| Users | | 65.4 GB | |
| ProgramData | | 5.0 GB | |
| Windows | | 33.5 GB | |
| Quarantine on D: | | 2.4 GB | 6.28 GB |
