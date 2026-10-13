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
  - "[[_Rebuild - Index]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Old Laptop Rebuild - Build 1 WSL Findings]]"
  - "[[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]]"
  - "[[Installations]]"
  - "[[Google Drive Sync Policy]]"
next: History. Build 3's prompt below was run (see the Build 3 findings in this folder). The Build 4 section is superseded by [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]]; do not run it from here.
---
# Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)

Two prompts for Claude Code sessions on the Dell's Windows side, written against the Sonnet 5.5 prompting guide (task, intent and constraints in the first turn; literal scoping; reasons next to rules; the "keep working" and "stop and report" paragraphs; a real-check verification rule; explicit approval rules for risky actions). Build 3 cleans C: and D:. Build 4, rewritten 2026-10-11, installs and configures the Windows toolkit on both laptops through scripts and builds a catalog for AI agents. The Acer dotfile snapshot export has finished, so the follow-up reply that used to sit at the bottom of this note is gone.

> [!note] Archived 2026-10-13
> The Build 3 prompt in this note was run on 2026-10-11 and 2026-10-12; results are in [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]] and [[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]]. The Build 4 prompt further down is the older version 2. The current one is [[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]].

## How to run
- **Where:** Claude Code in PowerShell on the Dell, started from `C:\Users\Anant Gupta`. Pick Sonnet 5.5 with `/model`.
- **Effort:** `high` for both. Build 3 involves judgment, images and deletions. Build 4 designs a manifest, writes and debugs several scripts and authors a catalog.
- **Order:** Build 3's audit is done, so run its approved phases first. Build 4's Phases 1 and 2 are read-only and can start earlier, but run its install scripts after Build 3's Tier A cleanup so C: has room. In Build 4 the session writes scripts and you run them: the Dell first, then the Acer from the same vault folder (Syncthing carries it).
- **Images:** paste the WizTree screenshots in the same message as the Build 3 prompt. Build 4 gets none.
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

## Build 4 prompt: scripted Windows toolkit on both laptops, configs, and the AI tool catalog

Rewritten 2026-10-11 after the Acer snapshot came back and the vault inventory of the Dell was written. It replaces the earlier Build 4 (single-machine terminal install). Changes: both laptops are in scope because the Acer's Windows side is also incomplete; the session writes install scripts and I run them; the Acer's real configs are the source of truth; the Dell's reconstructed WSL configs get replaced from the snapshot; and the session builds a catalog that tells an AI agent what is installed, where, what each tool is for and how to use it. Run it at `high` effort.

~~~text
<situation>
You are Claude Code running in Windows PowerShell, started in C:\Users\Anant Gupta, on my old laptop (Dell Latitude 5530, Windows 11 Pro). This is Build 4 of a rebuild that makes the Dell and my newer Acer laptop match for development work. Builds 1 and 2 finished the Dell's WSL side. Build 3 is cleaning C: and D: on the Dell: its audit is done, and its approved phases may still be running, so read its findings note before you install anything.
This build covers the Windows toolkit on both laptops. Both Windows sides are incomplete today: neither has PowerShell 7 configured with Starship, Windows Terminal is on defaults on both, and the shared config files differ between machines. You produce three things.
1. Scripts, config files and a verify script, stored in the vault, that install and configure the same Windows terminal toolkit, AI-platform tooling and MCP prerequisites on each laptop, and prove it.
2. Replacement of the Dell's WSL config files that were reconstructed from notes, using the Acer's real files from the dotfile snapshot.
3. A catalog of what is installed on each machine, plus an agent guide. I give these tools to a smarter AI agent. It must know what is installed, where it lives, what each tool is for and how to use it, so it can tell me exactly how to use any tool and where to use it.
How we work: you write the scripts and I run them. Installing dozens of tools through your own tool calls is slow and fragile. Run only read-only checks and dry runs yourself. For every script, and for every single command that is better run by hand (anything with a UAC prompt, a browser login or a one-time choice), give me the exact command to paste, then wait. After I run it, read the log and result files, fix the script if needed, and give me the next command.
</situation>

<facts>
Verified on 2026-10-11. Re-measure anything that drives a decision.
Dell, Windows side:
- Windows PowerShell 5.1 only. PowerShell 7, Starship, fzf, fd, bat, zoxide, delta, lazygit, Yazi, 7-Zip or NanaZip, nvm-windows, pnpm and the Iosevka Nerd Font are not installed (only Cascadia fonts). Windows Terminal 1.24 is installed on defaults: default profile Windows PowerShell, no color scheme, no font set.
- Present: Git 2.52.0, GitHub CLI 2.89.0, ripgrep 15.1.0, jq 1.8.2, FFmpeg, Node 22.16 (winget OpenJS.NodeJS.22), Python 3.13.5 in C:\Python313 (winget and Chocolatey both), uv 0.11.26 installed with pip into C:\Python313\Scripts, Miniconda in the user profile, opam 2.5.0, Docker Desktop 4.56 (disk on D:\WSL\Docker), Ollama 0.24 (models on D:\AI\ollama-models), Claude Code 2.1.296 (native, ~\.local\bin), Codex CLI 0.160.0 (npm), npm globals firecrawl-cli, mcp-remote, openclaw and opencode-ai, Claude Desktop with MCP servers named jarvis, the-plan, jarvis-fs and github. Chocolatey 2.4.3 is installed (12 packages); use winget for new installs and do not uninstall choco.
- The Windows PowerShell profile is D:\Users\_Anant\10_Areas\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1. It loads an opam environment, Kiro shell integration and a New-PyEnv helper, and it has no Starship. Documents is redirected to D:. C:\Users\Anant Gupta\.config has cagent, crush, devin, git, goose, merget, opencode and vercel-plugin.
- Tailscale lives only inside this laptop's WSL and is never installed on this laptop's Windows side.
Acer, Windows side (from its snapshot; the Acer's user is C:\Users\anant):
- Windows Terminal on defaults except font IosevkaTerm Nerd Font, color scheme One Half Dark, 85 percent acrylic, cursor #98C379, default profile Windows PowerShell. No PowerShell profile exists. Global git config has only core.longpaths, core.fsmonitor and core.untrackedCache (plus redacted identity). The snapshot's winget export lists Starship, PowerShell 7, Windows Terminal, Tailscale, NanaZip, ripgrep, jq, Yazi (installed, not configured), Node LTS (OpenJS.NodeJS.LTS), Docker Desktop, Ollama, VS Code, Cursor, Claude, Antigravity, Git, GitHub CLI, Miniconda, FFmpeg, WizTree and Revo. The Acer's Windows side has no Yazi, lazygit, bat, delta or gh-dash configuration; those run only in its WSL. Tailscale runs on the Acer's Windows side only.
- The Acer's vault root is D:\_Anant\20_Progress\Documents\Jarvis. The Dell's is D:\Users\_Anant\10_Areas\Documents\Jarvis. Syncthing carries the vault between them, so anything you write there appears on both laptops. Scripts must find the vault root themselves (an environment variable first, then known candidate paths, checking for AGENTS.md).
Dell, WSL side (the full list is the "Old Laptop" section of Installations):
- 13 of 17 comparable config files differ from the Acer's real ones, because Build 1 reconstructed them from notes: atuin, gh-dash, git ignore, lazygit, ncdu, sesh, starship.toml, Yazi init.lua, keymap.toml, theme.toml, yazi.toml, .gitconfig and .tmux.conf. The four Yazi plugin Lua files match. Three Yazi files are missing on the Dell: flavors/tokyonight-storm.yazi (flavor.toml and tmtheme.xml) and package.toml. The Acer's starship.toml is identical on Windows and WSL except that the WSL copy has CRLF line endings; the LF version is the one to keep. The Dell's .wslconfig intentionally differs from the Acer's (20 GB, 10 CPUs, swap on D:, both idle timeouts disabled for the SSH host), and gh-dash repoPaths and the WSL .gitconfig identity are machine-specific, so leave those two as they are.
- Things on the Dell's WSL that the notes did not expect: Ollama 0.18.3 at /usr/local/bin/ollama (the notes say Ollama stays Windows-side), PowerShell 7.6.4 in ~/.local/bin, and no conda, ruff, shfmt or shellcheck binaries.
Constraints that stay:
- Settings Sync is live between the laptops. Any Windows VS Code user file written here reaches the Acer. VS Code, the MCP registry and sync script, and Claude Code settings belong to Build 5, so leave them alone. You may read MCP configuration and list server names to build the catalog, never values.
- Windows Terminal, PowerShell profiles and tool configs do not sync, so they are in scope.
- Admin steps go in scripts for me to run elevated. Do not run wsl --shutdown.
</facts>

<reading_list>
Read these in full, in this order, before acting. All paths are under the vault root (Dell: D:\Users\_Anant\10_Areas\Documents\Jarvis), in 40_Resources\CS\Concepts\New Laptop\. Read the vault's AGENTS.md before writing there.
1. Old Laptop Rebuild\Acer Dotfile Snapshot\ : every file, including hashes-windows.txt, hashes-wsl.txt, excluded-windows.txt, winget\winget-export.json, VERSIONS.md and MANIFEST.md if present, and the two scripts in _scripts\ (they already worked on the Acer; reuse their secret scan, hash logging and ASCII-only patterns).
2. Installations, especially the "Old Laptop" section and the install-placement buckets.
3. Old Laptop Rebuild\: Index, Build 1 WSL Findings, Build 2 VS Code and Two-Laptop Findings, Build 3 Windows Cleanup Findings, C Drive Bloat - Failure Log and Prevention Rules.
4. Ubuntu - WSL, Acer Live State (the Starship, tmux and Yazi tuning rounds), Codebases\windows-home\VS Code - Windows, VS Code - Terminal Environments, VS Code - MCP and Secrets, VS Code - Install Loop.
The vault can be stale and the live machine wins. Log each contradiction.
</reading_list>

<design>
Apply every rule below to every script, not only the first one.
- One manifest drives everything. Create Old Laptop Rebuild\Windows Toolkit\toolkit.json. Each tool has: id, display name, category, winget id or other install method, version pin (optional), machines (both, dell or acer), install-location policy, verify command, expected-version pattern, config files it owns, and use-case fields (purpose, when to reach for it, key commands, where it runs: Windows, WSL or both, notes for an AI agent). The install script, the verify script and the catalog generator all read this one file.
- Scripts live in Old Laptop Rebuild\Windows Toolkit\_scripts\ and are numbered: 00-preflight.ps1 (read-only checks and the plan), 10-install-toolkit.ps1, 20-apply-configs.ps1, 30-wsl-config-parity.sh (the Dell's WSL), 40-build-catalog.ps1, 99-verify.ps1, plus a README with the run order and rollback. Add scripts only when a step cannot live in one of these.
- Every script is ASCII only, can be run twice with the same result, supports a -DryRun switch that prints what it would change, detects the machine (COMPUTERNAME and user path) and the vault root, writes a log under D:\WSL\ops\windows\logs\ and a result JSON into the vault under Windows Toolkit\results\<host>\, never prints secret values, never deletes anything except replacing a config file after a timestamped backup, and exits non-zero when a required step fails. Installs continue past one failed package and print a summary table.
- Installs use winget only: --exact, --accept-package-agreements, --accept-source-agreements, --disable-interactivity, and --location D:\Apps\<Name> only when the installer supports it. Portable CLI tools and fonts land under the user profile on C: and are small, so record each tool's size and drive. Machine-wide installers such as PowerShell 7 raise a UAC prompt; the script says so before it starts.
- Versions: the Dell run records the installed versions into Windows Toolkit\toolkit.lock.json. The Acer run installs those versions where winget has them, so both laptops end up on the same versions.
- Config files are written once into Windows Toolkit\configs\ as UTF-8 without BOM and LF line endings, using [IO.File]::WriteAllText (Set-Content in Windows PowerShell adds CRLF and a BOM). The apply script copies them to each machine, points tools at the shared location with user environment variables where the tool looks elsewhere on Windows (STARSHIP_CONFIG, YAZI_CONFIG_HOME and the equivalents; check each tool's current documentation), and writes a SHA-256 table. A config is "identical" only when its hash matches the source.
- Machine differences are explicit blocks guarded by machine or tool checks, never copies of the file with edits. The Dell's PowerShell profile keeps its opam, Kiro and New-PyEnv blocks; the Acer's does not need them. Tailscale is in the manifest for the Acer only. Do not touch Tailscale on either machine.
- Checks that mean something: parse every script with [System.Management.Automation.Language.Parser]::ParseFile, run each in -DryRun on the Dell, and let 99-verify.ps1 compare manifest against reality (installed version matches pattern, config hash matches source, env vars set, font family registered, profile loads in a new shell, Starship renders). A script that only started without error is not a check.
</design>

<toolkit_candidates>
Start the manifest from these candidates. The Acer snapshot's winget export and VERSIONS decide membership, and I approve the final list at the checkpoint. WSL-only tools stay out of Windows unless I approve them.
- Shell and terminal, both laptops: PowerShell 7, Windows Terminal (settings below), Starship, an IosevkaTerm Nerd Font Mono package that registers as "IosevkaTerm NFM" (find the right winget package or release, verify its checksum), zoxide, fzf, fd, bat.
- Core CLI, both: Git (current), delta, GitHub CLI, ripgrep, jq, FFmpeg, NanaZip (the Acer has it; use one archive tool on both).
- Runtimes and package managers, both: Node LTS with Corepack and pnpm, uv by its standalone installer so it comes first on PATH, Python through uv, bun if an installed AI tool needs it. Decide with me: Node 22 vs LTS (the Dell has 22, the Acer has LTS), the pip-installed uv on the Dell, and where Miniconda belongs (the plan says D:\conda). Do not change a runtime manager without my approval.
- AI platforms and agents, both: verify Claude Code (native), Codex CLI (npm, pinned), Claude Desktop, Cursor, Kiro, Antigravity, Docker Desktop and Ollama; add Windows CLIs for the others only when they exist and the Acer uses them.
- MCP prerequisites, both: npx (Node), uvx (uv), mcp-remote, Docker for container-based servers. Check, by name only, that the launch command of each configured MCP server in Claude Desktop, Claude Code user scope and Codex resolves on this machine.
- Per machine: Tailscale on the Acer's Windows side only (verify, never install on the Dell).
- Optional tier, WSL-first, not on Windows unless I approve: Yazi, lazygit, tmux, atuin, sesh, ncdu.
</toolkit_candidates>

<config_set>
Propose these at the checkpoint and write them after I approve. Treat the Acer's real files as the source for anything it has.
- starship.toml: the Acer's, with LF endings. One file for Windows and both WSLs.
- Windows Terminal settings.json: PowerShell 7 as the default profile; the font family IosevkaTerm Nerd Font Mono; a Tokyo Night Storm color scheme to match Starship, Yazi and tmux (the Acer currently uses One Half Dark; I decide); the Acer's other settings (opacity, acrylic, cursor, keybindings) kept unless I say otherwise; the Ubuntu profile named per machine; Miniconda profiles left to Miniconda.
- PowerShell 7 and Windows PowerShell profiles: UTF-8 output, STARSHIP_CONFIG, Starship initialized once, zoxide initialized once, the VS Code terminal hook guarded by Test-Path so it is harmless until Build 5 creates init.ps1, and machine blocks as described above. Add nothing else without my approval.
- Git (Windows global): core.longpaths, core.fsmonitor, core.untrackedCache (the Acer's), pull.rebase true, push.autoSetupRemote true, fetch.prune true, rerere.enabled true, init.defaultBranch main, the GitHub CLI credential helper, a shared delta include file, and the global ignore file with the eight secret patterns. core.autocrlf is a decision (the Dell has false, WSL has input); recommend one with reasons.
- Environment variables at user scope: STARSHIP_CONFIG and the config-location variables; leave the cache variables to Build 3 and only verify them.
- Dell WSL: replace the 13 differing config files and add the 3 missing Yazi files from the snapshot with 30-wsl-config-parity.sh, with timestamped backups and LF endings, leaving .wslconfig, wsl.conf, gh-dash repoPaths and the .gitconfig identity as they are. Compare the Acer's .bashrc block and tmux plugin list against the Dell's and report the differences instead of overwriting them.
</config_set>

<task>
Work in these phases, in order. Finish and check each phase before starting the next. Keep working until everything I asked for is done, and stop to ask only when you cannot go on without me or before a risky step. When the work is done and checked, stop and report. Do not add tools, features or files that I did not ask for; mention a good idea at the end instead.
Phase 1, audit (read-only). Read everything in the reading list. Re-check the Dell's Windows and WSL state live. Build current-state tables for the Dell (live) and the Acer (from the snapshot), a parity table for the WSL config files, and note what Build 3 has already changed.
Phase 2, design checkpoint. Write the design to the vault, then stop and show me: the final toolkit manifest as a table (tool, why it is there, machines, install method); every decision I need to make, each with your recommendation (Node 22 or LTS, uv standalone, Miniconda, git autocrlf, Windows Terminal scheme and font, profile contents, which WSL configs get overwritten, whether to keep Ollama and PowerShell 7 inside the Dell's WSL, which missing binaries such as ruff, shfmt and shellcheck to install); the script list with the order I will run them; the catalog outline; and the Acer plan. Wait for my reply.
Phase 3, write. Write the scripts, manifest and configs to the vault. Parse-check every script and run each one in -DryRun on the Dell. Give me the Dell run order as copy-ready commands, one per line, each with the quoted full path and the PowerShell call that runs it as a file, and tell me which ones need an elevated PowerShell and which can run as me. Then wait.
Phase 4, Dell run. I run the scripts one at a time and tell you when each has run. After each, read its log and result JSON, fix problems in the script, and give me the next command. Give me the individual commands I should run by hand (UAC installers, anything interactive) as separate lines. Repeat until 99-verify.ps1 passes, then write toolkit.lock.json.
Phase 5, catalog and agent guide. Run 40-build-catalog.ps1 so it writes Windows Toolkit\catalog\Tool Catalog - <host>.md and tool-catalog-<host>.json (every tool on Windows and in WSL with version, path, drive, owner config file and manifest use-case fields). Then write, from official documentation and my notes, one authored note next to Installations: "Machine Toolkit - Tool Use Cases and Agent Guide". It has an agent front page (which shell for what, PowerShell or WSL; where projects live and why never under /mnt; where the vault is; which AI platform is for what; which MCP servers exist, by name and purpose; the sync boundaries between Git, Syncthing and Google Drive; secrets rules), then one card per tool: what it is, when to reach for it, three to six copyable commands, its config path, gotchas learned in these builds, and a one-line instruction I can give an agent. Group the cards by task (find files, search code, git work, AI agents, MCP, containers, models, networking, terminal navigation). Propose, but do not write, a pointer line for the Windows home AGENTS.md.
Phase 6, Acer. Write "Acer Run Sheet" in Windows Toolkit\: the exact copy-ready commands for the Acer in order (the scripts are already in the vault, so the sheet only says where they are on the Acer and how the vault path differs), what each prints, what differs from the Dell and why, and a reminder that Tailscale is already on the Acer's Windows side and must not be added to its WSL. I run them on the Acer. When I tell you they ran, read the result JSON from both machines and write the parity matrix: every tool and config, columns Dell and Acer, versions and hashes, PASS or DIFF, a reason for each DIFF.
Phase 7, close. Update the "Old Laptop" section of Installations to match the final state, add an "Acer, Windows side" section next to it, add Growth rules (the standing rule and one check command for tool versions, config hashes, font registration, environment variables, startup time and catalog freshness), write the findings note, and update the Index.
</task>

<authorization>
Without asking: reading, queries, writing scripts, manifest, configs and notes under the vault (Windows Toolkit\ and the notes named above), -DryRun runs, and parse checks.
Ask first, by showing the list and waiting: running any install or config change yourself instead of through my scripts, uninstalling or replacing anything that exists (including Chocolatey packages and the pip-installed uv), changing a runtime manager, changing anything on the Acer (you cannot reach it; the run sheet is the only route), changing anything inside WSL other than through 30-wsl-config-parity.sh after I approve it, and any VS Code, MCP or Claude Code settings file.
Do not install Tailscale on the Dell. Do not print secret values. If a config, profile or log you are about to write contains a token, key or password, stop and tell me.
</authorization>

<working_rules>
- Write scripts to files and run them as files. Pasted long commands have corrupted before on these machines, and wsl.exe prints UTF-16, so strip NUL characters when you read its output.
- Before each phase, write one line saying what you are about to do. Between phases, give one or two sentences: what you found and what comes next. Do not narrate routine commands.
- When you change something that can be run or checked, run a real check that exercises the change. A check that failed to start does not count. If a check cannot run, say which one and why.
- If two attempts at one step fail for the same reason, stop and report the cause and the smallest next check.
</working_rules>

<logging>
Write under the vault's Old Laptop Rebuild folder and follow the vault write contract (never create files at the vault root, keep each note's frontmatter, patch by heading).
- Create "Old Laptop Rebuild - Build 4 Windows Toolkit Findings": before and after tables for both laptops, the final manifest, every state-changing command I ran with its result, every error with its root cause, decisions with reasons, the parity matrix, and what is left for Build 5.
- Keep the Windows Toolkit folder tidy: _scripts, configs, catalog, results, toolkit.json, toolkit.lock.json and the Acer Run Sheet.
- Add one line in 60_Claude\07_AI_Information\Session Logs\log.md and update the status line in the Index.
</logging>

<final_report>
Lead with the result: what is installed and configured on the Dell, what is waiting for me to run on the Acer, which configs match the Acer and which differ and why, and the first command I should run next. List open decisions as short bullets. Do not paste the notes back.
</final_report>
~~~
