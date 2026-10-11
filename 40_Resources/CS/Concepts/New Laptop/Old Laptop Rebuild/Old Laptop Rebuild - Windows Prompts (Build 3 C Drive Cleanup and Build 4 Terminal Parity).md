---
type: note
status: sprout
created: 2026-10-11
updated: 2026-10-11
course: Life
track:
  - laptop
  - windows
  - terminal
tags:
  - note
  - laptop
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Old Laptop Rebuild - Build 1 WSL Findings]]"
  - "[[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]"
  - "[[Installations]]"
  - "[[Google Drive Sync Policy]]"
next: Run Build 3 (with the seven WizTree screenshots attached), then the Acer snapshot prompt, then Build 4
---
# Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)

Two prompts for Claude Code sessions on the Dell's Windows side, written against the Sonnet 5.5 prompting guide (task, intent and constraints in the first turn; literal scoping; reasons next to rules; the "keep working" and "stop and report" paragraphs; a real-check verification rule; explicit approval rules for risky actions). A third, small prompt for the Acer is in the appendix.

## How to run
- **Where:** Claude Code in PowerShell on the Dell, started from `C:\Users\Anant Gupta`. Pick Sonnet 5.5 with `/model`.
- **Effort:** Build 3 at `high` (judgment, images, deletions). Build 4 at `medium` (well-specified installs and configs).
- **Order:** Build 3, then the Acer snapshot prompt (appendix), then Build 4. Build 4 can start without the snapshot, but its configs would then be rebuilt from notes and not byte-identical to the Acer's.
- **Images:** paste the seven WizTree screenshots (C: three, D: four) in the same message as the Build 3 prompt. Build 4 gets none.
- **Admin steps:** the sessions run without elevation and write every admin step to a script under `D:\WSL\ops\windows\` for you to run in an elevated PowerShell.
- **Numbering:** Build 1 was WSL, Build 2 was WSL VS Code plus the SSH workflow. These are Build 3 and Build 4. Windows VS Code and MCP wiring become Build 5, and the dev-only profile with the final check against the Acer becomes Build 6.

---

## Build 3 prompt: C: cleanup, Google Drive mirror, D: baseline, WSL host settings

~~~text
<situation>
You are Claude Code running in Windows PowerShell, started in C:\Users\Anant Gupta, on my old laptop: Dell Latitude 5530, Windows 11 Pro (build 26300), i7-1255U, 32 GB RAM, Intel Iris Xe graphics only, one 1 TB NVMe split into C: (251.9 GB) and D: (700 GB). This is Build 3 of a rebuild that makes this Dell match my newer Acer laptop for development work. Builds 1 and 2 finished the WSL side in separate sessions. This session covers the Windows side of storage: free up C:, fix what keeps refilling it, set up a clean D:, set up Google Drive mirroring for the files this laptop needs, and apply the Windows-only WSL host settings.
Why: C: is about 89% to 93% used and this laptop has had repeated crashes and failures that trace back to a full C:. A past cleanup made it worse (a "quarantine" folder moved files onto the same drive). Every step you take should say which drive it frees. Terminal installs and configs are the next build, and Windows VS Code and MCP wiring come after that, so leave both alone.
I attached seven WizTree screenshots from 2026-10-04: three of C: (tree view, expanded Users and Anant Gupta, and the pagefile selection) and four of D:. If they are missing from this message, say so in your first line and continue with live scans while I attach them.
</situation>

<facts>
Verified on 2026-10-11 from live queries, my notes and the screenshots. Treat them as a starting map and re-measure anything that drives a decision.
- Disks: C: 251.9 GB with 28.2 GB free; D: 700 GB with about 364 GB free. Known folders are redirected to D:\Users\_Anant (Documents is D:\Users\_Anant\10_Areas\Documents, Desktop is D:\Users\_Anant\Inbox, Downloads is D:\Users\_Anant\Downloads). My Jarvis and The Plan Obsidian vaults live under D:\Users\_Anant and are synced by Syncthing. Google Drive must never cover them.
- Pagefile: Windows is configured for d:\pagefile.sys (size 0/0, automatic management off), but that file does not exist. The live one is C:\pagefile.sys at about 26 to 31 GB with a peak use of 1 to 6 GB. My hypothesis is that Windows cannot create the D: file at boot, falls back to a RAM-sized file on C:, and shows the pagefile warning at startup. Confirm in the event log before changing anything.
- WizTree on C: (2026-10-04): Users 128 GB (AppData 100 GB: Local 67.8 and Roaming 32.2), Windows 39.4, pagefile.sys 25.6, Program Files 26.2, ProgramData 5.8, Program Files (x86) 8.1, System Volume Information 4.2, opamroot 2.4, Python313 0.3, srverify-20260502173203 0.24. By type: .dll 47.8 GB, .sys 26.8, .exe 25.8, .vhdx 11.7 (15 files), .gz 6.3, .gguf 4.7 (3 files), .dmp 4.3 (57 files), .jar 3.2, .msi 3.1 (mostly C:\Windows\Installer, which I do not touch), .onnx 1.6.
- Measured AppData\Local (GiB, 2026-10-07): Programs 14.1, Spotify 6.4, Vivaldi 5.6, Microsoft 4.9, superwhisper 4.8, npm-cache 4.3, Packages 3.7, Temp 3.4, uv 2.5, hermes 2.1, WisprFlow 1.9, ms-playwright 1.3. Roaming (WizTree 10-04): Claude 10.7 (likely Claude Desktop's VM bundle, which explains the .vhdx files), Code 3.4, Jan 3.2 (the .gguf models), Cursor 2.8, Kiro 2.6, npm 1.7. Profile folders: miniconda3 7.1, vscode-remote-wsl 6.3, .vscode 4.1, .codex 3.4, codex-cleanup-quarantine-2026-09-20 2.3, .cache 1.4. Local\Google reports a bogus size because of Drive virtual files, so skip it when measuring.
- Profile root also holds stray items to classify: 0K7YY.exe, nc6a9.exe, a file named NUL, a file named echo, global.yml, settings.json, battery-report.html, mongosh files, scikit_learn_data, and C:\Users\Anant Gupta\bin.
- WizTree on D: (2026-10-04): WSL 176 GB (Ubuntu ext4.vhdx 105, Installers\wsl-ubuntu.tar 36.7, Docker 33.9), Users 111.5 (Games 86.0 including a 67 GB game archive, _Anant 25.4), $RECYCLE.BIN 32.5 (about 21 GB of Rust target directories), AI\ollama-models 9.2, WindowsApps 3.6, npm-cache 1.6, WpSystem 0.8.
- C: leftovers from WSL work: vscode-remote-wsl 6.3 GiB, the 2026-09-20 quarantine 2.3 GiB, %TEMP%\wsl-crashes 0.5 GiB (three process-level core dumps, no VM corruption).
- Tool caches still defaulting to C: because the env vars are unset: UV_CACHE_DIR, PIP_CACHE_DIR, PLAYWRIGHT_BROWSERS_PATH. The npm cache is already D:\npm-cache, but a stale 4.3 GiB copy sits in AppData\Local\npm-cache.
- WSL (finished by Build 1): version 3.0.1.0, .wslconfig on C: has networkingMode=mirrored, firewall=true, memory=20GB, processors=10, swap=8GB, swapfile=D:\\WSL\\swap.vhdx, vmIdleTimeout=-1, instanceIdleTimeout=-1, autoMemoryReclaim=gradual, sparseVhd=true. Ubuntu is at D:\WSL\Ubuntu, Docker Desktop's disk is under D:\WSL\Docker, and Docker Desktop is not running. This laptop is the always-on SSH host for the Acer, so WSL must stay up and reachable. Tailscale lives only inside this laptop's WSL and is never installed on its Windows side.
- A hidden scheduled task ConversationCapture-Backfill-WSL runs wsl.exe every 30 minutes. Other non-Microsoft tasks: ConversationCapture-Backfill-Windows, Jarvis-GitAutoSync, Jarvis-Syncthing-Health, Jarvis-WeeklyReview, Jarvis-Cursor-Session-Export, Syncthing, two disabled sync tasks, a dubbing-app login task. Startup entries include Ollama, OpenClaw Gateway, Wispr Flow, Discord, RiotClient, Medal, Steam, Rize, Spotify, Docker Desktop, Voquill, Slack, DubbingAI, E START App and GoogleDriveFS.
- Google Drive for desktop 132 is installed. The DriveFS folder holds three account folders, no G: drive is mounted, and no GoogleDriveFS process was running at the time of the check. OneDrive has no folder configured.
- Installed apps worth reviewing (partial winget list): IntelliJ IDEA Ultimate 2024.3, MongoDB Shell, two Malwarebytes entries, Respondus LockDown Browser, Dell Optimizer, SupportAssist plugin, Microsoft 365 Apps, Docker Desktop 4.56, Miniconda, Python 3.13 in C:\Python313, Node 22, Jan, Ollama, Postman, Cluely, Loom, Netflix, FFmpeg, opam, Steam, Riot, Medal, Bitwarden. Chocolatey is also installed.
- Settings Sync is live between this laptop and the Acer. Anything written to a Windows user-level VS Code file here reaches the Acer within minutes.
</facts>

<reading_list>
Read these in full, in this order, before acting. They are under D:\Users\_Anant\10_Areas\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\ (also reachable through the jarvis MCP if it is connected). Read the vault's AGENTS.md before writing there.
1. Old Laptop Rebuild\C Drive Bloat - Failure Log and Prevention Rules (the root causes and growth rules for this exact problem).
2. Old Laptop Rebuild\Old Laptop Rebuild - Index, Build 1 WSL Findings (its handoffs), and Build 2 VS Code and Two-Laptop Findings (its Windows-side findings).
3. Installations (the install-placement buckets A, B and C, the "not carrying forward" list, the drive placement table), New Laptop Setup, Old Laptop Decommission Checklist.
4. Sync\Google Drive Sync Policy, then the Sync folder's Operations Reference, Known Failure Modes and Prevention, and Build Roadmap, to learn exactly where Google Drive stops and Syncthing starts. Also Acer Live State (the G: drive, the C:\Data mount point, OneDrive Known Folder Move).
5. Ubuntu - WSL (Mistakes already made once, Maintenance Cadence).
If I paste older incident notes into this session, read them before the notes above. The vault can be stale, and the live machine wins; log each contradiction.
</reading_list>

<decisions_already_made>
Carry these without reopening them.
- WSL, Docker's WSL disk and the WSL swap file live on D:. Tailscale is never installed on this laptop's Windows side. Mirrored networking stays.
- Electron and Microsoft Store apps cannot choose an install location. They stay on C: and get their caches cleaned. Apps whose installers offer a real location choice go to D:\Apps\<Name> through winget --location or a manual installer.
- Google Drive on this Dell uses Mirror mode and on the Acer uses Stream mode. Drive carries documents and other non-regenerable files only: no code, no .git, no node_modules or build output, no AI-tool config directories, no secrets, and no Obsidian vault. Drive cannot exclude subfolders inside a folder that is already selected, so separate folders at the top level instead.
- A quarantine folder lives on D: and has a review date in its name.
- Windows VS Code user files and the Settings Sync state are out of bounds for this session.
</decisions_already_made>

<task>
Work in these phases, in order. Finish and check each phase before starting the next. Keep working until everything I asked for is done, and stop to ask only when you cannot go on without me or before a risky step. When the work is done and checked, stop and report. Do not add features, files, docs or refactors that I did not ask for; mention a good idea at the end instead.

Phase 1, inventory (read-only).
1. Transcribe the visible numbers from the screenshots into a table (path, size, allocated, file count). Where a figure is hard to read, crop and zoom the image with a small Python or PowerShell script before you trust it. Run any Python that reads files I give you with `python -I`.
2. Re-measure every figure that will drive a decision with live scans of C: and D: (use per-folder scans with Get-ChildItem or du-style sums, skipping reparse points; WizTree is the map and the live scan is the truth). Report drift against the screenshots.
3. Find the real causes of the crashes: Application and System event log errors since the last boot and the past 30 days, WER reports, and the 57 .dmp files (locate them, group by program, keep the newest one). Name the three most frequent crashing programs.
4. Find why the D: pagefile does not get created. Test these in order: the System log around boot, BitLocker state of D: (`manage-bde -status D:`), whether D: is NTFS and healthy, whether D: mounts after the pagefile is initialized, and any storage-redirect setting ("where new content is saved"). Search current Microsoft documentation for the sizing and crash-dump rules before proposing numbers.
5. List every installed program with its install location and size, and classify each as keep, remove, reinstall on D:, or forced to C:, using the Installations buckets. Flag programs on the "not carrying forward" list.
6. Read the Google Drive state: which of the three accounts is which (by folder metadata and sign-in state, never by reading file contents), and what mode Drive is in.

Phase 2, plan and checkpoint. Write the findings to the vault (see logging), then stop and show me:
- a table of what is on C: and D:, by size, with a verdict per item;
- Tier A, Tier B and Tier C lists (see authorization) with sizes and the drive each frees;
- the pagefile root cause and the exact configuration you recommend, with the numbers justified;
- the crash causes and the program fixes;
- the Google Drive design: which top-level folders mirror, where the mirror folder lives, and why the Jarvis and The Plan vaults stay out;
- the startup and scheduled-task review, with a recommendation per item.
Wait for my reply.

Phase 3, execute Tier A after I reply "go A" (or edit the list). Delete the regenerable items with each tool's own method where one exists (npm, uv, pip and Playwright cache commands, Storage Sense or cleanmgr-equivalent, DISM StartComponentCleanup in an admin script). Measure C: free space after every group.

Phase 4, fix the causes.
1. Set the user env vars UV_CACHE_DIR, PIP_CACHE_DIR and PLAYWRIGHT_BROWSERS_PATH to folders on D:, confirm each tool uses them, and delete the old C: copies in the same step.
2. Write the elevated script for the pagefile change and for anything else that needs admin, under D:\WSL\ops\windows\, with a backup and rollback printed first. Give me the single command to run it.
3. Decide with me what happens to ConversationCapture-Backfill-WSL now that WSL stays up all the time, and write the logon task that starts WSL if the host needs one.

Phase 5, apps and profile clutter. Work through the Tier B list one item at a time, after my approval of each item or group.

Phase 6, Google Drive mirror. Check the official Drive for desktop documentation for Mirror mode and the local folder location, then set it up as designed in Phase 2, with the mirror folder on D:. Sign in or out of an account only after I say so. Check afterwards that the vaults, .git folders, node_modules and secret files are not inside the mirrored set.

Phase 7, D: baseline and Windows host settings.
1. Review D: with me (the 36.7 GB installer tarball, the game archive, the recycle-bin contents, Docker data, model files), then create the standard folders the notes call for and nothing more.
2. Verify the WSL host state from Windows: `wsl --version`, `wsl -l -v`, .wslconfig contents, the swap file on D:, the Ubuntu and Docker disks, and the sparse-disk status.
3. Write a Defender exclusion script for the WSL and Docker disks and the D: dev folders as an option, and explain the security tradeoff before I run it.
4. Review startup entries and scheduled tasks one by one and apply only the ones I approve.

Phase 8, final check and logging. Re-measure C: and D:, run the checks from the Growth rules table in the failure-log note, and write the results.
</task>

<authorization>
Reversible, read-only and note-writing work needs no approval: scans, queries, event-log reads, screenshot work, writing under the vault's Old Laptop Rebuild folder, creating folders on D:, writing scripts to D:\WSL\ops\windows\.
Tier A, approved as a group once I reply "go A": regenerable data that a tool recreates. That covers package and tool caches, stale duplicate caches, Temp files older than 7 days, crash dumps except the newest, WER reports, thumbnail and shader caches, Windows Update and Delivery Optimization caches, and the recycle-bin contents after I have seen the list.
Tier B, approved per item: installed programs, anything in my profile or in D:\Users\_Anant, the 2026-09-20 quarantine folder, vscode-remote-wsl, Claude Desktop's VM bundle (use the app's own reset if one exists), Jan and Ollama models, game archives, installer tarballs, stray executables (check each one's signature and hash before I decide), the NUL file (remove it with a \\?\ path only after I approve).
Tier C, left alone: C:\Windows (including WinSxS and Installer), Program Files\WindowsApps, ProgramData as a tree, drivers, Recovery, EFI and MSR partitions, System Volume Information, any broad AppData tree, the Jarvis and The Plan vaults, D:\WSL\Ubuntu\ext4.vhdx, Docker's disk (Docker's own prune only, with my approval), game saves, any file whose purpose you cannot name.
Anything that needs admin goes into a script for me to run elevated. Do not run `wsl --shutdown` in this session unless I ask, because it ends other WSL sessions. Do not install Tailscale. Do not sign in or out of any account without my say-so.
</authorization>

<sensitive_data>
My profile and D: hold secrets and personal documents, and some of them could end up in Google Drive, in a log or in a note if handled carelessly. So classify by file name and location first, and read contents only when a file's purpose cannot be decided any other way.
- Treat these as sensitive: .env and .env.* files, .ssh, id_* keys, *.pem, *.key, *.pfx, credentials and auth files (auth.json, .credentials.json, .mcp.env, .aws, .azure, .kube, .git-credentials), password-manager exports and *.kdbx, browser profile data (Login Data, Cookies), wallet or seed files, and identity, tax and bank documents.
- Print only counts, paths and sizes for them. Never print values, never copy them into the vault, never place them under a Drive-mirrored folder, and never delete them without my explicit approval per group.
- List the sensitive items you found in the findings note by path and category only.
- Before any move or deletion of user data, say where the data goes and confirm it is not leaving this laptop unintentionally.
</sensitive_data>

<working_rules>
- Write every script to a .ps1 file (ASCII only), print what it will do, and run it with -File. Pasted long commands have corrupted before on these machines, and wsl.exe prints UTF-16, so strip NUL characters when you read its output.
- Say which drive each step frees, and report free space after every group: C: first, then D:.
- Before you start a phase, write one line saying what you are about to do. Between phases, give one or two sentences: what you found and what comes next. Do not narrate routine commands.
- When you change something that can be run or checked, run a real check that exercises the change (re-read the config, re-run the measurement, start the tool). A check that failed to start does not count. If a check cannot run, say which one and why.
- If two attempts at one step fail for the same reason, stop and report the cause and the smallest next check.
</working_rules>

<logging>
Write to D:\Users\_Anant\10_Areas\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\ and follow the vault write contract (never create files at the vault root, keep each note's frontmatter, patch by heading).
- Create "Old Laptop Rebuild - Build 3 Windows Cleanup Findings": a before and after table (C: free, D: free, pagefile, each reclaimed group with its drive), every state-changing command, every error with its root cause, decisions with reasons, the Drive design, the crash causes, and the sensitive-item inventory by path and category.
- Update "C Drive Bloat - Failure Log and Prevention Rules" by heading: close the failures you fixed, add new ones, and keep its Growth rules table current with the check commands you verified.
- Add a monthly check list and one line in 60_Claude\07_AI_Information\Session Logs\log.md, and update the status line in the Index.
- Hand off what belongs to later builds (Windows VS Code, MCP, terminal) with the numbers you found.
</logging>

<final_report>
Lead with the measured result: C: free before and after, D: free before and after, GiB reclaimed per group with its drive, and what is waiting for me, including the script paths and the exact commands to run. Then list open decisions as short bullets. Do not paste the notes back.
</final_report>
~~~

---

## Build 4 prompt: Windows terminal installs and config parity

~~~text
<situation>
You are Claude Code running in Windows PowerShell, started in C:\Users\Anant Gupta, on my old laptop (Dell Latitude 5530, Windows 11 Pro). This is Build 4 of a rebuild that makes the Dell match my newer Acer laptop for development work. Builds 1 and 2 finished the WSL side. Build 3 cleaned C: and D:. This session covers the Windows terminal toolkit: install the tools, write their configuration files so they are the same as on the Acer, and show proof of parity. Windows carries a lighter set than WSL, but the same prompt, fonts, colors and config files. VS Code user files, the MCP registry and Claude Code settings are out of scope (Build 5), because Settings Sync would carry any change to the Acer.
Why exact parity matters: I work across two laptops, and a config that differs by a few bytes between them causes confusing behavior that is hard to trace. The aim is the same files, the same tool versions where the package manager allows it, and a short list of differences that each have a stated reason.
</situation>

<facts>
Verified on 2026-10-11 from live queries and my notes.
- Dell today: Windows PowerShell 5.1 only (no PowerShell 7). Windows Terminal is installed. Not installed: Starship, fd, bat, fzf, zoxide, delta, lazygit, Yazi, 7-Zip or NanaZip, nvm-windows, pnpm. The Iosevka Nerd Font is missing (only Cascadia fonts exist). Present: git 2.52.0, gh 2.89.0, ripgrep 15.1.0 and jq 1.8.2 (both from winget), Node 22.16 (winget), Python 3.13.5 in C:\Python313, uv installed through pip into C:\Python313\Scripts, Miniconda in the user profile, Docker Desktop, VS Code 1.141 on C:, Claude Code as a native binary in ~\.local\bin, Codex through npm. Chocolatey is also installed; use winget only for new installs and list any choco packages in your findings.
- Dell profile layout: Documents is redirected to D:\Users\_Anant\10_Areas\Documents, so the Windows PowerShell profile is D:\Users\_Anant\10_Areas\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 (it exists). The PowerShell 7 profile will be Documents\PowerShell\Microsoft.PowerShell_profile.ps1 there. C:\Users\Anant Gupta\.config holds cagent, crush, devin, git, goose, merget, opencode and vercel-plugin, and no starship or yazi folder yet.
- Acer reference (from my vault notes, not measured): Windows Terminal with PowerShell 7 as the shell, Starship with the Tokyo Night preset tuned with [status], [cmd_duration], $shlvl and $jobs and scan_timeout 500 ms, the same starship.toml file on Windows and WSL, Yazi with a git-status column, full borders, smart filter and the Tokyo Night Storm flavor, the IosevkaTerm Nerd Font registered by Windows as "IosevkaTerm NFM", a PowerShell profile that runs Starship once and dot-sources ~/.config/vscode-env/init.ps1 only inside VS Code, and recorded tool versions: Starship 1.26.0, Yazi 26.9.1, delta 0.19.2, zoxide 0.10.0, ripgrep 14.1.0, git 2.43.0 (WSL), uv 0.12.17.
- The synced Windows VS Code settings on this Dell already name the font 'IosevkaTerm NFM'. Installing that font fixes terminal icons in VS Code without touching a VS Code file.
- WSL (Build 1) already has Starship, Yazi, lazygit, delta, zoxide, atuin, tmux and the rest, with configs rebuilt from notes and labeled "from notes, not from Acer".
- Dotfile snapshot from the Acer: check D:\Users\_Anant\10_Areas\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\Acer Dotfile Snapshot\ . If it exists it is the source of truth for every config file. If it does not exist, say so in your first update, build configs from the notes, and label each one "from notes, not from Acer".
- Settings Sync is live between this laptop and the Acer. Terminal tools do not sync, but VS Code user files do.
</facts>

<reading_list>
Read these in full, in this order. They are under D:\Users\_Anant\10_Areas\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\ (also reachable through the jarvis MCP). Read the vault's AGENTS.md before writing there.
1. Old Laptop Rebuild\Acer Dotfile Snapshot\ (if present), then Old Laptop Rebuild\Old Laptop Rebuild - Index, Build 1 WSL Findings, Build 3 Windows Cleanup Findings (if present) and C Drive Bloat - Failure Log and Prevention Rules.
2. Installations (the Windows software table, the install-placement buckets, the "not carrying forward" list, the WSL tool table).
3. Acer Live State (the tuning pass for Starship, tmux and Yazi, and the failures hit), Ubuntu - WSL, Codebases\windows-home\VS Code - Windows (Terminal Icons, Terminal Environment sections), VS Code - Terminal Environments, VS Code - Install Loop.
4. The clipped sessions under 60_Claude\05_Clippings\AI Conversations\Windows\Claude Code\ whose names mention new-laptop installs or the WSL setup guide, for what was actually installed on the Acer's Windows side.
The vault can be stale and the live machine wins. Log each contradiction.
</reading_list>

<target_state>
The Windows toolkit, lighter than WSL: PowerShell 7, Windows Terminal, Starship, the IosevkaTerm Nerd Font Mono family, git with delta as the pager, GitHub CLI (with the gh-dash extension if the Acer has it), ripgrep, fd, bat, fzf, zoxide, jq, lazygit, Yazi (with the `file` utility it needs from Git for Windows), 7-Zip or NanaZip per Installations, and uv through its standalone installer so it comes first on PATH. Runtime managers (nvm-windows, Node, conda, Python) and the AI CLIs stay as they are: record the difference from the Acer and leave it for me to decide.
Parity rules:
1. Shared config files are byte-identical across the Acer snapshot, Windows and WSL: starship.toml, the Yazi toml files, lazygit config, bat and ripgrep configs, and a shared delta include file referenced from each machine's own .gitconfig. Write them as UTF-8 without BOM and with LF line endings, using [IO.File]::WriteAllText, because Set-Content in Windows PowerShell adds CRLF and a BOM. Compare SHA-256 hashes to prove it.
2. Where Windows looks for a config in a different place, point it at the shared location with a user environment variable: STARSHIP_CONFIG, YAZI_CONFIG_HOME, and the lazygit, bat and ripgrep equivalents. Check each tool's current documentation for the exact variable.
3. Install the Acer's recorded version when winget has it (winget install --id <id> --version <v> --exact). Otherwise install the nearest version and log the difference.
4. Installs: winget only. Portable CLI tools land under the user profile on C:, which is small and acceptable; installers with a location option go to D:\Apps\<Name> when --location works; log each tool's size and drive. UAC prompts are expected for machine-wide installs such as PowerShell 7; tell me one line before triggering one.
5. Windows Terminal: settings.json identical to the Acer's snapshot except machine-specific values (profile GUIDs, paths), with the Tokyo Night Storm scheme, the Iosevka Nerd Font Mono family, and PowerShell 7 as the default profile. Back up the current file first.
6. PowerShell profiles (5.1 and 7): identical to the Acer's, with Starship initialized once, zoxide initialized once, UTF-8 output, and the VS Code terminal hook guarded by `if (Test-Path ...)` so it is harmless until Build 5 creates it. Add nothing the Acer's profile does not have.
</target_state>

<task>
Work in these steps, in order. Finish and check each step before starting the next. Keep working until everything I asked for is done, and stop to ask only when you cannot go on without me or before a risky step. When the work is done and checked, stop and report. Do not add tools, features, files or refactors that I did not ask for; mention a good idea at the end instead.
1. Read the notes and the snapshot. Inventory the Dell's Windows side: versions of every tool above, the profile and Windows Terminal files, installed fonts, env vars. Write the inventory as a table with the Acer reference beside it.
2. Install in this order, with a version check after each: PowerShell 7, the Iosevka Nerd Font (so Windows registers "IosevkaTerm NFM"; verify with System.Drawing.Text.InstalledFontCollection), Starship, git update and delta, gh (and gh-dash if on the Acer), ripgrep, fd, bat, fzf, zoxide, jq, lazygit, Yazi, 7-Zip or NanaZip, uv standalone.
3. Write the shared config files to ~\.config with the byte rules above, then set the env vars at user scope.
4. Write the PowerShell profiles and the Windows Terminal settings, each after a backup, then open a new session of each shell and verify: the prompt renders icons, `starship print-config` parses, the status and duration modules work, zoxide jumps, Yazi starts with the theme and git column, lazygit starts and uses delta, and fzf, bat and fd run.
5. Compare against WSL: for each shared file, hash the Windows copy and the WSL copy (`wsl.exe -d Ubuntu -- sha256sum <path>`; strip NUL characters from wsl.exe output). Build the parity matrix described below. If a WSL file differs from the snapshot, write a script that copies the snapshot version into WSL with a backup, and show it to me before anything runs.
6. Measure terminal startup time for Windows PowerShell and for PowerShell 7 (five warm runs each, with and without the profile) and compare with the Acer's recorded 734 to 869 ms.
</task>

<authorization>
No approval needed: reading, installing with winget from the target list, writing the shared configs and profiles after a backup, setting the listed user env vars, writing under the vault's Old Laptop Rebuild folder, writing scripts to D:\WSL\ops\windows\.
Ask first: uninstalling or replacing anything that exists (including choco packages and the pip-installed uv), changing runtime managers (Node, Python, conda), changing the system default terminal or shell, any change inside WSL, any VS Code, MCP or Claude Code settings file, and anything that needs the Acer.
Do not install Tailscale on Windows. Do not print secret values. If a config file or profile you are about to write contains a token, key or password, stop and tell me.
</authorization>

<working_rules>
- Write every script to a .ps1 file (ASCII only), print what it will do, and run it with -File. Pasted long commands have corrupted before on these machines.
- Before each step, write one line saying what you are about to do. Between steps, give one or two sentences: what you found and what comes next. Do not narrate routine commands.
- When you change something that can be run or checked, run a real check that exercises the change. A check that failed to start does not count. If a check cannot run, say which one and why.
- If two attempts at one step fail for the same reason, stop and report the cause and the smallest next check.
</working_rules>

<logging>
Write to D:\Users\_Anant\10_Areas\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\ and follow the vault write contract (never create files at the vault root, keep each note's frontmatter, patch by heading).
- Create "Old Laptop Rebuild - Build 4 Windows Terminal Findings" with: the parity matrix (rows: each tool and each config file; columns: Acer reference, Dell Windows, Dell WSL; with versions, SHA-256 and a PASS, DIFF or UNKNOWN verdict, and a reason for every DIFF), every install with its size and drive, every state-changing command, every error with its root cause, startup timings, and the list of things left for Build 5.
- Add a Growth rules section (the standing rule and one check command per item: tool versions, config hashes, font registration, env vars, startup time).
- Add one line in 60_Claude\07_AI_Information\Session Logs\log.md and update the status line in the Index.
</logging>

<final_report>
Lead with the result: which tools and configs now match the Acer, which differ and why, the startup timings, and what is waiting for me. List open decisions as short bullets. Do not paste the notes back.
</final_report>
~~~

---

## Appendix: Acer dotfile snapshot prompt (run on the Acer before Build 4)

Run this in a Claude Code or Codex session on the Acer, from its Windows home. It exports the non-secret terminal configs into the vault (Syncthing carries them to the Dell) so Build 4 can copy the Acer's real files instead of rebuilding them from notes.

~~~text
<situation>
You are running on my newer Acer laptop (Windows 11, WSL Ubuntu-24.04). I am making my old Dell laptop match this one. The Dell's terminal configs were rebuilt from notes, so they may differ from the real ones here. Your job is a read-only export of this laptop's non-secret terminal configuration into my Jarvis vault, so the Dell can copy the real files.
</situation>

<task>
Create the folder 40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\Acer Dotfile Snapshot\ in the Jarvis vault (Windows path D:\...\Jarvis\ on this laptop; find it from the vault's own notes). Read the vault's AGENTS.md before writing, and keep to its write contract.
Copy these files into it, in subfolders named windows\ and wsl\, preserving relative paths:
- Windows: ~\.config\starship.toml, ~\.config\yazi\ (all toml files and flavor or plugin folders, without compiled caches), lazygit, bat, ripgrep, delta and gh-dash configs wherever they live, the Windows Terminal settings.json (LocalState folder of the Microsoft.WindowsTerminal package), the PowerShell 5.1 and 7 profiles, the user .gitconfig and ~\.config\git files, and the output of `winget export` to a JSON file.
- WSL: ~/.config/starship.toml, ~/.config/yazi/, ~/.config/atuin/config.toml, ~/.config/sesh/sesh.toml, ~/.config/gh-dash/config.yml, lazygit config, ~/.config/git/, ~/.tmux.conf and the tmux plugin list, ~/.config/ncdu, only the JARVIS_WSL_ENV_BLOCK section of ~/.bashrc, /etc/wsl.conf, and the Windows .wslconfig.
- Also write VERSIONS.md: the --version output of every terminal tool on both sides, the installed font family names, and the user environment variables that point at config folders (names and non-secret paths only).
- Write MANIFEST.md: a table of every exported file with its source path, size and SHA-256.
</task>

<sensitive_data>
Scan every file for secrets before copying it (tokens, API keys, passwords, private keys, credential helpers with embedded values). Leave out any file that matches, list it in MANIFEST.md under "excluded" with the reason and without its contents, and remove credential or identity lines from copies of .gitconfig. Do not export anything from ~/.claude, ~/.codex, ~/.cursor, ~/.kiro, ~/.ssh, ~/.mcp.json, ~/.mcp.env or any other AI-tool or credential directory.
</sensitive_data>

<working_rules>
This task changes nothing except creating the snapshot folder. Write scripts to .ps1 or .sh files and run them as files. Verify the result by recomputing the hashes of the copies against MANIFEST.md. When it is done and checked, stop and report; do not start any other work.
</working_rules>

<final_report>
Say how many files were exported, which were excluded and why, and give the snapshot folder path.
</final_report>
~~~
