---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - wsl
tags:
  - note
  - laptop
  - prompt
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Old Laptop Rebuild - Build 2 SSH Runbook]]"
  - "[[Old Laptop Rebuild - Build 2 Acer Handoff]]"
  - "[[Old Laptop Rebuild - Runs Index]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Installations]]"
  - "[[Google Drive Sync Policy]]"
next: "Run in Claude Code inside WSL (Sonnet 5.5, high effort, started in the WSL home directory). Answer the Phase 2 decisions E1 to E10."
---
# Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)

Written 2026-10-13. Build 5 is the WSL half of what is left: make the Dell's WSL match the Acer's real configuration and tooling, finish the WSL items Build 2 left open, and settle the D: drive (the 36.75 GiB WSL tarball, the `_Anant` folders and Google Drive). It also owns the Dell's WSL config replacement that Build 4 used to carry, so only one session ever edits WSL files.

## How to run
- **Where:** Claude Code started **inside WSL** on the Dell, in the home directory (`cd ~ && claude`). `/model` Sonnet 5.5, effort `high`. Starting in the home directory matters: the session sees the WSL files the way every WSL tool does, and it has `/mnt/d` for the vault and the D: drive.
- **Independent of Build 4.** They can run in either order. Build 5 does not need the Windows toolkit; it does not touch Windows apps. Both sessions write their own findings notes.
- **It cannot use sudo or elevation.** It writes a reviewed script for each such step and gives you one command to run. Host steps that restart WSL go into a PowerShell script under `D:\WSL\ops\` for you to run; the session never restarts WSL.
- **Images:** none.
- **Starting it:** `wsl --cd '~'` (or `wsl ~` after the Build 4 profile block is re-applied), then `claude`. In Windows Terminal you can also open the Ubuntu profile, which starts in the WSL home.
- **Before you send it:** make sure the Dell is on AC and stays awake (the always-on settings are already set), and close editors attached to WSL if you want the editor-server cleanup in Phase 3 to be considered.

---

~~~text
<situation>
You are Claude Code running inside WSL (Ubuntu 24.04) on my old laptop, a Dell Latitude 5530, started in my WSL home directory. This is Build 5 of a rebuild that makes the Dell match my newer Acer laptop for development. Build 1 aligned the Dell's WSL, Build 2 set up VS Code and the two-laptop SSH workflow (some of its items are still open), Build 3 cleaned the Dell's C: drive (finished), and Build 4 is a separate Windows-side session that you do not touch.
The Dell is the always-on canonical dev host: one checkout per shared repo under ~/projects on WSL ext4, and my Acer connects over Tailscale and SSH. So WSL here must be correct, stable and boring. You produce four things.
1. WSL parity: replace the Dell's WSL config files that Build 1 reconstructed from notes with the Acer's real ones from the dotfile snapshot, bring the tool set and versions in line, and report every remaining difference with its reason.
2. The WSL items Build 2 left open: the unrun sudo script (socat), the repo contract audit, editor-server cleanup, Miniconda with jupyter-base, and the Ollama conflict. Anything that needs the Acer or my sign-in is listed as waiting on me, not attempted.
3. WSL upkeep: a plan and, once I approve it, scripts for a weekly safe cleanup and a watcher for the WSL disk, swap and caches, so the host does not bloat the way C: did.
4. The D: drive: decide what happens to the 36.75 GiB tarball D:\WSL\Installers\wsl-ubuntu.tar, tidy the D:\_Anant tree and the Google Drive setup, and write the plan for the Drive cache. The vault stays untouched except for notes you are asked to write.
Research before you recommend: read the notes below, then look up current best practice from official sources (Microsoft Learn for WSL, the WSL release notes, Google's Drive for desktop admin documentation, the tool docs) and cite what you used. The vault can be stale; the live machine wins. Log every contradiction.
</situation>

<facts>
Verified 2026-10-12 by a read-only pass. Re-measure anything that drives a decision.
Dell WSL (live, re-verified 2026-10-13): WSL 3.0.3.0 (the stable release of 2026-10-09), kernel 6.18.54.1, Ubuntu 24.04.4, user anant_gupta, VHDX D:\WSL\Ubuntu\ext4.vhdx 107.6 GiB (not sparse although .wslconfig says sparseVhd=true), / has about 900 GiB free inside the VHDX, D: has about 450 GiB free, C: about 145 GiB. .wslconfig (intentionally differs from the Acer): mirrored networking, firewall true, 20 GB, 10 processors, swap 8 GB at D:\WSL\swap.vhdx, vmIdleTimeout -1, instanceIdleTimeout -1, autoMemoryReclaim gradual. /etc/wsl.conf has systemd, default user and interop (only spacing differs from the Acer's). systemd now reports running with zero failed units: the stable WSL 3.0.3 carries the fix for the systemd-binfmt read-only flush (WSL issue 41783), so the old degraded state, and my earlier decision to wait for a stable release, are closed. Re-check it in Phase 1; do not install any prerelease and do not apply workarounds. Build 2 gate 4.5 (the 75-second idle test) passed on 3.0.1; a repeat on 3.0.3 is optional and is a Windows host step for me.
Windows side changed on 2026-10-13 (Build 4, not yours): PowerShell 7 is now the default Windows Terminal shell. PowerShell 7 expands a bare ~ before wsl.exe sees it, so "wsl ~" fails there; the Build 4 profile block now wraps wsl so "wsl ~" works again once I re-apply it, and "wsl --cd '~'" always works. Windows has Node 24.20, standalone uv 0.12.19 first on the PATH, Python and Chocolatey are gone, and Windows git has core.autocrlf=input. None of this changes the WSL side, but it is what powershell.exe will show you.
Tools on the Dell WSL: node 24.14.1, pnpm 10.33.2, uv 0.12.23, rustc 1.99.0, claude 2.1.296, codex 0.162.1, kiro-cli 2.27.1, agy 1.3.3, tmux 3.4, delta 0.20.1, starship 1.26.0, yazi 26.9.1, lazygit 0.65.1, zoxide 0.10.0, atuin 18.23.0, sesh 2.32.0, chafa 1.18.3, PowerShell 7.6.4, semgrep 1.179.0, direnv, ncdu, fd, bat, bubblewrap. Missing: ruff, shfmt, shellcheck, conda/Miniconda, socat. Ollama 0.18.3 runs as a systemd service on 127.0.0.1:11434 with cloud models only; under mirrored networking it blocks the Windows Ollama (0.40.3 at D:\Apps\Ollama, models in D:\AI\ollama-models) from listening. Docker is only the Windows CLI through PATH.
Acer WSL (from notes and its snapshot, you cannot reach it): Ubuntu-24.04 on D:\WSL\Ubuntu, conda 26.7.1 with a jupyter-base environment, node 24.21.0, pnpm 12.4.2, uv 0.12.17, claude 2.1.277, tmux 3.7c, delta 0.19.2, Docker WSL integration on. Its .wslconfig in the snapshot says 16 GB and 8 CPUs, but a note says it was corrected to 20 GB, 18 CPUs and swap on D: afterwards (verify, do not assume).
Parity state: 13 of 17 comparable config files differ from the Acer's real ones, because Build 1 rebuilt them from notes: atuin, gh-dash, git ignore, lazygit, ncdu, sesh, starship.toml, Yazi init.lua, keymap.toml, theme.toml, yazi.toml, .gitconfig, .tmux.conf. Four Yazi plugin Lua files and the tmux plugin list match. Three Yazi items are missing on the Dell: flavors/tokyonight-storm.yazi (flavor.toml, tmtheme.xml) and package.toml. The Dell also has an extra flavors/tokyo-night.yazi and a 25-folder plugins-src/. The Acer's starship.toml has CRLF line endings in its WSL copy; keep the LF version. gh-dash repoPaths and the WSL .gitconfig identity and credential sections are machine-specific: keep them. The Dell .bashrc block marker is "# >>> JARVIS_WSL_ENV_BLOCK (Build 1: from notes, not from Acer) >>>"; the Acer's block has the marker "# JARVIS_WSL_ENV_BLOCK" and its hooks (starship, zoxide, atuin, direnv, nvm, cargo, .mcp.env) are unguarded. The Dell .bashrc also holds a plaintext Firecrawl key and exported FIRECRAWL_API_KEY and OPENAI_API_KEY: never print those lines; the key still needs rotating by me at the provider.
Repos: ~/projects/{ai,hackathon,hub,scratch,umn,work}; second-brain-claudekit is at ~/projects/ai/claude/ on the Dell and ai/second-brain-claudekit on the Acer. Build 1 found 18 repos needing attention (for example internship-research-loop 5 ahead and 5 behind). Heavy items inside WSL: .vscode-server 5.0 GB, .cursor-server 3.6 GB, .vscode-remote-containers 1.1 GB, ~/.npm/_npx 4.66 GB.
Tailscale: inside this WSL only (dell-wsl, 100.94.129.113, RunSSH true, key expiry disabled, direct path to the Acer proven). Windows side none on the Dell, and none inside the Acer's WSL. openssh-server is not installed and nothing listens on 22 or 2222.
D: drive (live): wsl-ubuntu.tar is 39,454,945,280 bytes (36.75 GiB, written 2026-01-15), a real Ubuntu 24.04 rootfs tar, referenced by no script or scheduled task. Do not trust any note that says 73 GB; that was a measuring error. Registered distros: Ubuntu (D:\WSL\Ubuntu) and docker-desktop (D:\WSL\Docker\DockerDesktopWSL, docker_data.vhdx 33.85 GiB). D:\WSL\ops holds the host scripts. D:\Backup\GameSaves holds archived game saves; D:\Quarantine holds two dated review folders (2026-11-01 and 2026-11-11).
Two _Anant trees: D:\Users\_Anant is the Windows known-folder redirect target (Documents is D:\Users\_Anant\10_Areas\Documents, with the Jarvis vault and The Plan; also UMN 3.3 GiB, Real coding 0.64 GiB, Finance, Job & Apartment, a 0.5 GiB .tmp.driveupload with 6010 extensionless files, Inbox with syncthing.exe and a GodMode folder). D:\_Anant has 00_Inbox (empty), 20_Progress (65 files), 30_Resources (0.11 GiB), 99_Archive (11.76 GiB: BS\DCIM holds Camera 3.52 GiB and Entire Copy 7.82 GiB with at least one identical mp4 in both; Backup is full of empty school folders). The Acer's vault root is D:\_Anant\20_Progress\Documents\Jarvis, the Dell's is D:\Users\_Anant\10_Areas\Documents\Jarvis. Syncthing carries the vault; code is never synced.
Google Drive for desktop 132.0 is installed on the Dell with three account IDs and a 4.2 GiB DriveFS cache on C: (mostly sqlite metadata, content cache about 2 MiB; mount letters H and I are saved per account). It is not running now. Its backed-up folder list is stale: it still names D:\Users\_Anant\20_Progress, 30_Resources and 00_Inbox, which now live under D:\_Anant. The vault's Google Drive Sync Policy says: sync documents only, never .git, node_modules, .venv, build output, AI configs, secrets or either Obsidian vault; Drive cannot exclude subfolders, so separate at the top level. I do not want anything to depend on Google Drive data yet.
Hard constraints:
- Never run wsl --shutdown, wsl --terminate or anything that restarts WSL, and never unregister, import or export a distro, from inside this session. Host steps go in an ASCII PowerShell script under D:\WSL\ops\ for me to run.
- You cannot enter a sudo password: write a reviewed script, print each step, give me one exact command.
- Settings Sync is live between the laptops and Windows VS Code is not yours to edit. Do not edit Windows VS Code, MCP or Claude Code settings files, Windows Terminal, PowerShell profiles or Windows apps; those are Builds 4 and 6.
- Do not touch Tailscale settings, ACLs, sshd or any network exposure without asking. Do not start Kubernetes or AI infrastructure.
- Never print tokens, keys, .mcp.env, auth files or SSH keys. Do not tail .bashrc broadly.
- Git: read-only status is fine. No fetch, commit, push, branch, reset, rebase, merge or PR without repo-specific approval. Never work from /mnt/c or /mnt/d for repos.
- Vault: follow its AGENTS.md write contract (no files at the vault root, never read or write 50_Archive, patch by heading, keep frontmatter, no em dashes). Do not touch .stignore, .gitignore or the vault's scheduled tasks, and never run git reset --hard, checkout or pull --rebase there. Read each .sync-conflict file before discarding it.
</facts>

<reading_list>
Vault root as seen from WSL: /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis. Notes are in 40_Resources/CS/Concepts/New Laptop/ (the rebuild folder was reorganised on 2026-10-13: finished runs are under Old Laptop Rebuild/Runs/, living notes sit in Old Laptop Rebuild/). Your WSL home has only a 3-line AGENTS.md stub, so read the vault's AGENTS.md first.
Read in this order:
1. Old Laptop Rebuild/Old Laptop Rebuild - Index (roadmap and standing decisions).
2. Old Laptop Rebuild/Old Laptop Rebuild - Build 2 SSH Runbook (its 2026-10-12 checkpoint table) and Build 2 Acer Handoff.
3. Old Laptop Rebuild/Runs/Build 2 VS Code and Two-Laptop/Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings: the ledger, Phase 3 proposals, "Corrections older notes need", Growth Rules. Skim the rest.
4. Codebases/Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem (Decisions 1 to 10).
5. Old Laptop Rebuild/Runs/Build 1 WSL/Old Laptop Rebuild - Build 1 WSL Findings: Decisions, Handoffs, Errors, Growth Rules, repo inventory. And, in Old Laptop Rebuild/Runs/Build 1 WSL/, only the "Locked operating and safety rules" and "Execution plan" blocks of Prompt 1 WSL.
6. Installations: the "Old Laptop" section, the Acer WSL entries and Growth rules.
7. Old Laptop Rebuild/Old Laptop Rebuild - Build 4 Windows Toolkit Findings: its Phase 1 "WSL config parity" table and the Phase 2 decisions D7 to D10 (their recommendations are carried into your decisions below).
8. Old Laptop Rebuild/Acer Dotfile Snapshot/: wsl/ files, hashes-wsl.txt, VERSIONS.md, MANIFEST.md and the two _scripts (reuse their secret scan, hash logging and ASCII-only patterns). Copy approved configs from here; read nothing else in it.
9. Old Laptop Rebuild/C Drive Bloat - Failure Log and Prevention Rules and the Build 3b note under Runs/Build 3 Windows Cleanup (sections 4 and 11) for the D: layout contract.
10. Codebases/windows-home or wsl-home: only VS Code - WSL. Sync/Google Drive Sync Policy. From Sync/Cross-Laptop Sync - Known Failure Modes and Prevention read only the headings for sections 3, 5, 6, 13 and 17 and use them if you write in the vault.
11. Ubuntu - WSL: only its "Mistakes already made once" list.
Do NOT read: WSL New Laptop Master Plan, WSL Session Briefing, Old Laptop Decommission Checklist, New Laptop Setup, Acer Live State, Prompt 2, Statusline Migration, anything in Runs/_backups/, .bak files, or the Sync build notes. They are stale or superseded.
Known contradictions to resolve with live evidence, not by choosing a note (the first two were already settled by the 2026-10-13 readiness audit; confirm them): WSL 3.0.1 degraded in the notes versus 3.0.3 running live; Build 2 says core.excludesfile was set, live has it unset and Git reads the default ~/.config/git/ignore (84 bytes, the same eight patterns), which is fine; tarball 36.75 versus 73 GiB (live: 36.75); bubblewrap installed or missing (live: installed, socat missing); Ollama Windows-only versus a running WSL service (live: running); Acer .wslconfig 16/8 versus 20/18; Drive Mirror versus streaming (undetermined); repo count 58 versus 53; second-brain-claudekit path.
</reading_list>

<task>
Work in phases, finishing and checking each before the next. Keep working until the work is done; stop to ask only when you cannot go on or before a risky step. Do not add tools or files I did not ask for; mention good ideas at the end.
Phase 1, audit (read-only). Read the reading list. Re-check live: WSL version and .wslconfig, systemd state, tool versions, every comparable config file's SHA-256 against hashes-wsl.txt, disk (/ inside the VHDX, the VHDX file on D:, D:, C:), the editor-server and cache sizes, Ollama state, running processes that hold files. Build a status ledger with PASS, DIFF, UNKNOWN, WAITING USER or BLOCKED for every item below. For the Acer, use the snapshot and notes and say UNKNOWN where only the Acer can answer.
Phase 2, research and checkpoint. Look up current best practice from official sources and cite it: .wslconfig and wsl.conf options for WSL 3.0 (mirrored networking, sparseVhd, autoMemoryReclaim, swap), VHDX growth and compaction, wsl --export and --import and what verifies a tarball, systemd user timers for scheduled upkeep inside WSL, and Google Drive for desktop admin settings (ContentCachePath and the folder-backup list). Write the design to the vault, then stop and show me: the ledger; the parity plan (which files are replaced, which are merged, which stay, and the script you will write); the decisions E1 to E10 below with a recommendation each; the D: and Drive plan; the upkeep plan; and the list of everything that waits on me or on the Acer. Wait for my reply.
Phase 3, WSL parity and tools. After I approve, write 30-wsl-config-parity.sh (and any other script) to the vault folder Old Laptop Rebuild/WSL Parity/_scripts/, ASCII only, with timestamped backups under ~/.config/.toolkit-backups/<timestamp>/, a --dry-run switch, a --with-tools switch (user-space ruff, shfmt, shellcheck, no sudo), its own PATH (non-interactive bash lacks ~/.local/bin, nvm and cargo), LF endings, a secret scan before copying, a SHA-256 table of source and result, and a non-zero exit when a required step fails. Parse-check with bash -n and shellcheck if present, run it in --dry-run, show me the diff summary, then give me the command and wait. After I run it, verify with hashes and a real check that each tool loads its config (starship prints a prompt, tmux starts a throwaway server and reads the config, yazi and atuin parse theirs). Then do the sudo step: review build2-sudo-step.sh (/mnt/d/WSL/ops/build2-sudo-step.sh; bubblewrap is already installed, socat is not), give me the one command, verify afterwards, and keep the sandbox off.
Phase 4, Build 2 leftovers (read-only first, approval before any change). Item 7: audit the repo contract read-only and propose, per repo, what to change. Item 8: itemize the editor-server and cache cleanup (.vscode-server, .cursor-server, .vscode-remote-containers, ~/.npm/_npx), checking open handles and whether an editor is attached, and wait for my yes per item. Item 9: a dry-run size estimate for Miniconda and jupyter-base, then install only if I approve. The Ollama service: show the effect of stopping and disabling it (it frees port 11434 for the Windows Ollama) and wait for my decision; leave the binary. List the Acer-dependent, sign-in and Windows-side items as WAITING USER without attempting them: the Windows scheduled task ConversationCapture-Backfill-WSL (still Ready; it starts wsl.exe every 30 minutes, which Build 1 flagged for review and Build 3 left undecided; with the idle timers off it is harmless, so only report it and its effect), host-key comparison, Acer clone and worktree inventory, large-transfer measurement, VS Code Tunnel sign-in and persistence, the sync-check from the Acer, the port-2222 fallback decision, the repo pilot, and the Firecrawl key rotation. Do not fix the 18 divergent repos.
Phase 5, upkeep. Propose a weekly safe cleanup for WSL (user-level only: caches older than a threshold, .npm/_npx older than a threshold, no sudo) as a systemd user timer or cron, and a watcher script that records df for /, the VHDX file size, swap.vhdx size, ~/.cache, ~/.npm, the editor servers, journal size and load, with thresholds that print an alert file. It must coordinate with the Windows watcher that already runs: Toolkit-Watch-C writes D:\WSL\ops\windows\watch\watch-history.csv and latest.json and measures the VHDX sizes, so do not duplicate that. Write them only after I approve; keep every deletion reversible or limited to regenerable caches. VHDX compaction and --set-sparse need WSL to restart: if you think either is worth it, write the host script, explain the downtime, and let me decide; the earlier note recommends doing nothing.
Phase 6, D: drive and Google Drive. The tarball: read the notes that mention it to learn why it exists; run a non-destructive integrity check (tar -tf to /dev/null and a SHA-256, from WSL or a host script, noting the read time over /mnt/d) and show the result. Then recommend, with risks: keep it; or take a fresh export of the live Ubuntu to D:\Backup\WSL with a host script (it must run when the distro can be idle, and I run it), verify that, and only then move the old tar to a dated quarantine under D:\Quarantine for review. Never delete it, and never delete it before a newer verified export exists. The _Anant trees: propose one canonical structure (numbered folders consistent with the vault's, one place per kind of thing, which of D:\Users\_Anant and D:\_Anant holds what, and how the Acer's different vault root fits), a verified duplicate report for BS\DCIM (hash-compare Camera against Entire Copy and list the duplicates before anything moves), the stale .tmp.driveupload, empty folders, the stray syncthing.exe and node installer, and regenerable trees inside the document areas that break the Drive policy (the CSCI 5304 .conda environment, node_modules). Produce the plan and scripts that move to quarantine; do not delete, and wait for my approval before running anything that moves files. Google Drive: decide nothing that depends on its data. Report the stale folder list, document the supported way to fix it in the Drive app, say whether relocating the DriveFS cache with the ContentCachePath policy is worth it (it may leave the sqlite metadata on C:; verify against Google's documentation), and recommend keeping the cache where it is unless there is a measured reason. Do not edit the Drive registry values or delete its cache.
Phase 7, close. Update the "Old Laptop" section of Installations to match the final WSL state, fix the stale statements listed in the Index under "Stale notes to fix when touched" (including the six items under "Corrections older notes need" in the Build 2 findings and the systemd statements, now resolved) by patching those notes by heading, add Growth rules (the standing rule and one check command for config hashes, tool versions, VHDX growth, WSL swap, editor servers, the tarball and backup, the D: tree and Drive), write the findings note "Old Laptop Rebuild - Build 5 WSL and D Drive Findings" in the Old Laptop Rebuild folder (before and after tables, every state-changing command I ran with its result, errors with root cause, decisions with reasons, the ledger), add one line to 60_Claude/07_AI_Information/Session Logs/log.md, update the Index roadmap row, and move this build's prompt and findings under Runs/ in a new folder.

Decisions to put to me in Phase 2, each with your recommendation (starting points, re-check them):
E1 Ownership: this build owns the Dell's WSL config replacement. Recommend replacing the 13 files and adding the 3 Yazi items; .gitconfig is a merge keeping the Dell's identity and credential helper and taking the Acer's delta settings and the Build 2 keys; gh-dash keeps the Dell's repoPaths; leave .wslconfig, wsl.conf and the plugin Lua files; keep the extra tokyo-night flavor and plugins-src until I say otherwise.
E2 Ollama in WSL: recommend sudo systemctl disable --now ollama and keep the binary, so the Windows Ollama can serve the 9.2 GB of local models; confirm the WSL Ollama is only used for cloud models first.
E3 PowerShell 7 in WSL (7.6.4): keep, harmless.
E4 ruff, shfmt, shellcheck: install in user space with --with-tools.
E5 core.autocrlf: input on the Dell's WSL (Build 2 already set it on 2026-10-07; verify only); the Acer's WSL stays false.
E6 Miniconda and jupyter-base in WSL: only after the dry-run estimate, to match the Acer.
E7 Editor-server cleanup: itemized, with approval per item.
E8 The tarball: verify, take a fresh export first, then quarantine; never delete.
E9 D: structure and Drive: the canonical tree, the BS\DCIM duplicate handling and the Drive folder fix, with the DriveFS cache left in place unless measured otherwise.
E10 WSL upkeep: a systemd user timer for weekly user-level cleanup plus a watcher, versus doing nothing.
</task>

<authorization>
Without asking: reading, queries, web research, writing scripts, plans and notes under the vault's Old Laptop Rebuild folder, dry runs, bash -n and shellcheck checks, and read-only Windows queries through powershell.exe (never anything that changes state).
Ask first, by showing the list and waiting: running any config or tool change yourself instead of through my scripts; installing or removing a package; any deletion or move (even to quarantine); any sudo step; anything that restarts WSL; editing any dotfile (back it up, and show the diff first); anything on the Acer (you cannot reach it); Tailscale, ACL, sshd or network changes; Docker prune; Windows VS Code, MCP, Claude Code or Windows Terminal files; any change to Google Drive settings, registry values or cache.
Do not print secret values. If a file you are about to write contains a token, key or password, stop and tell me.
</authorization>

<working_rules>
- Write scripts to files and run them as files; do not paste long commands. wsl.exe prints UTF-16, so strip NUL characters when you read its output, and run host commands through powershell.exe, not by mangled /mnt paths.
- Before each phase write one line saying what you are about to do; between phases one or two sentences. Do not narrate routine commands.
- Back up every file before editing and read it back after. When you change something runnable, run a real check that exercises it; a check that failed to start does not count. If a check cannot run, say which and why.
- Make destructive steps reversible: move to a dated quarantine, delete only regenerable caches. Check the elevation of host scripts with the WindowsBuiltInRole enum, not the string 'Administrator'. Test every wildcard in a dry run: a filter like .wslconfig.* also matches .wslconfig. PowerShell 5.1 has no ternary and no &&; Set-Content writes CRLF and a BOM.
- If two attempts at one step fail for the same reason, stop and report the cause and the smallest next check.
</working_rules>

<logging>
Follow the vault write contract. Findings go in Old Laptop Rebuild/ as "Old Laptop Rebuild - Build 5 WSL and D Drive Findings", with a PASS, DIFF, UNKNOWN, WAITING USER or BLOCKED ledger, before and after tables, every state-changing command I ran with its result, every error with its root cause, decisions with reasons, and Growth rules (the standing rule and one check command per thing that grew). Scripts live in Old Laptop Rebuild/WSL Parity/_scripts/. Add one line to the session log and update the Index status. No em dashes in notes.
</logging>

<final_report>
Lead with the result: what changed in WSL and on D:, which configs now match the Acer and which differ and why, what is waiting on me or on the Acer, and the first command I should run next. List open decisions as short bullets. Do not paste the notes back.
</final_report>
~~~
