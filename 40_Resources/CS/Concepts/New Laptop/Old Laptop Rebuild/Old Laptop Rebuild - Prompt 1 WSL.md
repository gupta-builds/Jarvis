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
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Ubuntu - WSL]]"
  - "[[Installations]]"
---
# Old Laptop Rebuild - Prompt 1 WSL

Run in Codex (gpt-5.6-sol, medium effort) from `/home/anant_gupta` on the old laptop. Start it with `codex -m gpt-5.6-sol -c model_reasoning_effort=medium`, or set the effort with `/model`. Sibling notes: [[Old Laptop Rebuild - Index]].

## Prompt

~~~text
You are Codex running in the WSL home directory (/home/anant_gupta) of the old laptop: Dell Latitude 5530, Windows 11 Pro, Ubuntu-24.04 on WSL2. This session works on the WSL layer only: audit, plan, then execute the changes I approve. Windows-side work (C: cleanup, pagefile, Windows Terminal, VS Code) belongs to later sessions. Record what you notice for them, but do not do it.

# Goal
Make this WSL install match the new laptop's (Acer) WSL configuration, and stop WSL from filling C:. The new laptop's notes are the reference. This machine already works, so repair it in place and align it. Do not rebuild it unless the audit shows real corruption.

# Read first, in full
Vault: /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis (also reachable through the jarvis MCP). Read vault AGENTS.md before writing there. Then read every note in 40_Resources/CS/Concepts/New Laptop/, especially:
- Ubuntu - WSL (Current State, Mistakes already made once)
- Installations (the "Full software list - WSL side" table)
- WSL New Laptop Master Plan (Decisions, Maintenance Cadence; the phases are historical)
- Acer Live State (WSL execution log, round 2)
- VS Code - WSL, VS Code - Install Loop, VS Code - Terminal Environments, VS Code - MCP and Secrets
- WSL Session Briefing (old Dell findings; re-verify before trusting any of it)
- Old Laptop Rebuild/Old Laptop Rebuild - Index (facts and the session sequence)
Notes can be stale or contradict each other. The live machine wins. Verify a claim before acting on it, and log each contradiction you find.

# Verified facts (2026-10-04)
- Hardware: i7-1255U (10 cores, 12 threads), 32 GB RAM, Intel Iris Xe only. There is no NVIDIA GPU, so skip CUDA and WSL GPU tuning. Ollama stays on the Windows side.
- C: is 251.9 GB with 28.6 GB free. D: is 700 GB with about 366 GB free. One NVMe disk.
- Distro: D:\WSL\Ubuntu\ext4.vhdx is 105.4 GB. About 84 GB is used inside it, and the kernel is 5.15.167.4. Docker's disk is D:\Docker\DockerDesktopWSL\disk\docker_data.vhdx (33.8 GB).
- C:\Users\Anant Gupta\.wslconfig currently holds networkingMode=mirrored, firewall=true, memory=16GB, processors=8. It has no swap setting, so WSL's swap vhdx defaults to %TEMP% on C:.
- /etc/wsl.conf is correct. Never put a [wsl2] section in it.
- Home usage: projects 47G (umn 19, ai 16, hub 11, hackathon 3.1), .vscode-server 7.8G, .npm 6.7G, .local 4.3G, .cursor-server 3.6G, .cache 2.9G, .claude 2.8G, .codex-archive 1.9G, .codex 1.6G, .rustup 1.3G, .nvm 1.3G, .vscode-remote-containers 1.1G.
- WSL footprint on C: includes AppData\Local\Temp (3.6 GB, with wsl-crashes dumps), C:\Users\Anant Gupta\vscode-remote-wsl (6.3 GB), and C:\Users\Anant Gupta\codex-cleanup-quarantine-2026-09-20 (2.3 GB, a past quarantine that sits on the drive we are trying to free).
- These repos had unpushed or uncommitted work on 2026-08-26. Re-check them: second-brain-claudekit (22 ahead), internship-research-loop (25 behind), portfolio, Assisto_website, tradingview, GymMangment_app_demo, DNA_BJJ_APP, Resq, adx-worktree-throwaway-test.
- The Jarvis and The Plan MCP servers are Obsidian on Windows at 127.0.0.1:27123 and :27124. WSL reaches them only because networking is mirrored. Keep mirrored. The CheckConnection log noise is a known side effect to measure, not a reason to switch to NAT.
- sudo needs a password you cannot type. Put every sudo step in a script for me to run, and do not stall on it or work around it.
- A parallel session (Build 2) configures VS Code on the WSL side. Do not modify ~/.vscode-server extensions, data or settings, ~/.vscode, ~/.config/vscode-env, or the global git and Claude Code config. Build 2 may ask you to apply .wslconfig keys it records for an always-on SSH host (vmIdleTimeout and similar).
- Do not run wsl --shutdown or anything else that restarts WSL. It would kill this session. Windows-host steps go in a .ps1 file that I run.

# Target state
1. .wslconfig (edit through /mnt/c, back up the old file first). Target values:
   memory=20GB, processors=10, swap=8GB, swapfile=D:\\WSL\\swap.vhdx, networkingMode=mirrored, firewall=true.
   Add autoMemoryReclaim=gradual and sparseVhd=true in whichever section the current Microsoft WSL docs place them. Check the docs and `wsl --version` first. If the docs disagree with any value above, follow the docs and log why.
   Use whole numbers with units and doubled backslashes. Write the file from bash and read it back right after, because an earlier .wslconfig write failed silently.
2. WSL toolchain parity: diff what is installed against the Acer list in Installations. Install what is missing, in user space where possible. The list includes direnv, wslu, delta, lazygit, zoxide, sesh, atuin, gh-dash, starship, yazi, tmux with TPM and its plugins, win32yank, ncdu, semgrep, a chafa binary of 1.16 or newer, and rustup. For config parity, use a dotfile snapshot if the vault has one (search the Old Laptop Rebuild folder and Acer Live State). Otherwise rebuild each config from what the notes describe, and label it "from notes, not from Acer".
3. Fresh-install policy: never copy another machine's AI-platform home directories, SSH keys, tokens or .mcp.env here. Leave ~/.claude and ~/.codex credentials alone.
4. Disk: shrink what WSL occupies and make sure nothing WSL-related defaults back to C:. Cover swap, crash dumps, editor servers, package caches, regenerable build output inside projects, and Docker.

# What you may do without asking
- Read-only inspection of anything, including /mnt/c and /mnt/d.
- Writing notes under the Old Laptop Rebuild vault folder.
- Backing up and editing .wslconfig, and writing WSL-side config files.
- Installing user-space tools.
- Clearing regenerable package caches: npm, pnpm store, uv, pip, cargo registry cache.
- Running `fstrim` only if it needs no sudo, otherwise put it in the script.

# Ask first (show the list with sizes, then wait for my reply)
- Deleting anything under ~/projects, including node_modules, .venv, target, .next and other build dirs.
- Deleting from ~/.codex-archive, ~/.claude, ~/.codex, and the editor server folders. Never touch editor servers while an editor is attached.
- Any change on /mnt/c or /mnt/d other than .wslconfig and the host script below.
- Docker prune, and git commit, push, reset or rebase in any repo.
- Any wsl --unregister, --import or --export.
Never print secret values (.mcp.env, auth.json, .credentials.json, gh hosts, ssh keys). Checking file permissions is fine.

# Work plan
Phase 1, audit (read-only). Cover:
- Health: dmesg, journalctl, `systemctl --failed`, how often CheckConnection errors fire, and the root cause of the wsl-crashes dumps.
- Versions of every tool, and sizes by directory (use ncdu or du).
- Repo inventory: for each repo under ~/projects, `git status --short --branch`, ahead/behind, and the size of ignored or regenerable artifacts.
- Cache sizes, and what is left in the editor server folders.
- The WSL footprint on C:, and `docker system df` if Docker responds.

Phase 2, plan and checkpoint. Write your findings and proposed changes to the vault (see Logging), then stop and present:
- (a) Repair in place or rebuild. Default to in place. Recommend a rebuild only if every repo has been pushed and the audit found real corruption.
- (b) A removal manifest with sizes and the GB each item should reclaim.
- (c) The exact .wslconfig diff.
- (d) The parity diff.
Wait for my reply before changing anything beyond the pre-authorized items above.

Phase 3, execute what I approve. Verify each change as you make it. Write D:\WSL\ops\wsl-host-step.ps1 for me to run. It should do `wsl --update`, back up the .wslconfig, `wsl --shutdown`, enable sparse mode on the distro (`wsl --manage Ubuntu --set-sparse true`), print the vhdx size before and after, and print the verification commands. Save it as a file, because pasted long lines have corrupted commands on this machine before. After I run it, give me a short list of commands to paste back and check.

# Logging in Jarvis (required)
Write all notes under 40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/. Follow the vault write contract: never create files at the vault root, keep each note's frontmatter, patch by heading. Create "Old Laptop Rebuild - Build 1 WSL Findings.md" in the same style as the Cross-Laptop Sync Build Findings notes (frontmatter, One-Line Answer, Mechanism, Failure Modes, Flashcards). It must include:
- A before/after table: top WSL home directories, vhdx size, swap location, C: free and D: free.
- Every command that changed state, and every error hit with its root cause.
- Each decision and the reason for it.
- Open items handed to later sessions (Windows host, D: offload, terminal, VS Code), with the numbers you found.
- A "Growth rules" section. For everything that grew (swap on C:, crash dumps, editor servers, caches, project build output, Docker vhdx), give the standing rule and the one command that checks it, so the same growth cannot return silently.
Also add one line to 60_Claude/07_AI_Information/Session Logs/log.md and update the status line in "Old Laptop Rebuild - Index". Propose a monthly check list, but do not build tooling I did not ask for.

# Stop rules
- If the live machine contradicts anything above, trust the machine and log the difference.
- If one step fails twice for the same reason, stop and report the cause and the smallest next check.
- If you notice yourself re-reading the same files without progress, stop and summarize.

# Final message
Lead with the result in a few lines: GB reclaimed (measured), what changed, what is waiting for me, and the host script path. List open decisions as short bullets. Do not paste the notes back.
~~~

## Follow-up 1: execute the approved plan (2026-10-04, after the audit checkpoint)

Send this to the same Codex session that returned the audit. It answers each open decision from the checkpoint, adds the two idle-timeout keys that the original target list missed (see [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]], Decision 3), and turns every step that sandbox or sudo blocks into a script with exact commands. Pasting it approves the project-artifact deletions in item 4, so delete that item first if you want a smaller set.

~~~text
Your audit checkpoint is accepted. Below are my answers to your open decisions. Execute Phase 3 now, one numbered step at a time, verifying each step before starting the next. Re-read your own Build 1 WSL Findings note first, and read the "Decision 3" section of Codebases/Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem (same vault folder tree, 40_Resources/CS/Concepts/New Laptop/). It changes one thing in your plan: this laptop becomes an always-on SSH host for Build 2.

# Approved
1. .wslconfig: apply your exact diff, plus two keys you did not have. The final file must contain, under [wsl2]: networkingMode=mirrored, firewall=true, memory=20GB, processors=10, swap=8GB, swapfile=D:\\WSL\\swap.vhdx, vmIdleTimeout=-1. Under [general]: instanceIdleTimeout=-1. Under [experimental]: autoMemoryReclaim=gradual, sparseVhd=true. Confirm each key name and section against the current Microsoft WSL configuration reference and against the WSL version that exists after `wsl --update`. If the updated WSL does not recognize a key, tell me instead of guessing. Both idle keys are required together: vmIdleTimeout alone does not keep the distro alive past the 15-second instanceIdleTimeout. This means the VM never auto-shuts down. That is deliberate, and autoMemoryReclaim keeps memory in check.
2. Cache cleanup: npm, pnpm store, pip, cargo, uv, using each tool's own cleanup command. Record sizes before and after.
3. Toolchain parity: install everything on your "missing or incomplete" list in user space, plus Antigravity (agy), and update uv, rustup and Kiro CLI if their installers support it. Prefer GitHub release binaries over `cargo install` (delta, lazygit, yazi, sesh, zoxide, atuin, starship, win32yank), because compiling creates new cache. Verify each tool with its own --version right after installing it. Build configs "from notes, not from Acer" and label them. Add shell hooks only after the binary is verified. fd and bat need the `fdfind` and `batcat` symlinks in ~/.local/bin. For wslu: re-test after the WSL update. If wslview is still broken because of WSLInterop-late, set a BROWSER wrapper in the shell block that uses powershell.exe or cmd.exe to open URLs, and log it. Do not patch system files.
4. Project artifacts: delete the verified Git-ignored, regenerable directories from your manifest, with these rules:
   - Re-verify each path at deletion time with `git check-ignore`, and require a lockfile or manifest that can rebuild it (package-lock, pnpm-lock, yarn.lock, uv.lock, pyproject, requirements, Cargo.lock).
   - Skip both gstack copies and both gbrain copies. They are installed tools whose dist and node_modules are used at runtime.
   - Skip any path referenced by an MCP config, an agent or hook config, a systemd unit or a cron entry (search ~/.claude.json, ~/.claude/settings.json, ~/.codex/config.toml, ~/.mcp.json, ~/.config/systemd and crontab). Skip any directory with an open file or a running process.
   - Hold the 1.03 GiB no-enclosing-repo project and ai/claude/claude-ai/node_modules.
   - Write the manifest of what you actually deleted into the findings note, with sizes. Delete largest first and measure free space after each group.
   - umn/boom/target is approved even though it is the largest.
5. Hold, do nothing: ~/.codex-archive, ~/.claude, ~/.codex, all git operations, and the C: items. Editor servers (.vscode-server, .cursor-server, .vscode-remote-containers) and Miniconda go to Build 2. Docker, vscode-remote-wsl, the old quarantine, %TEMP%\wsl-crashes and the ConversationCapture-Backfill-WSL scheduled task go to the Windows-host session. Record each with its current numbers as handoffs.

# Order of work
1. Preflight: confirm no VS Code or Cursor server process is attached, and record C: and D: free space and both VHDX sizes.
2. Item 3 installs, with --version checks and a log line per tool.
3. Item 3 configs.
4. Item 4 project artifact deletion.
5. Item 2 cache cleanup (last, so install caches are included).
6. Write the sudo script, then the .wslconfig edit, then the host scripts (details below).
7. Finish all vault logging before you hand me the host script. The WSL restart ends this session.

# Where something is blocked
Do not retry a blocked command and do not look for a workaround. If the sandbox or sudo blocks a step, write the exact commands to a script file and give me the one command to run it.
- /mnt/d/WSL/ops/build1-sudo-step.sh: `apt install -y fd-find bat ncdu direnv`, any other apt package parity needs, and `fstrim -av` as the last line. Begin with `set -euo pipefail` and print each step. I run it with `sudo bash /mnt/d/WSL/ops/build1-sudo-step.sh`.
- .wslconfig: back up the existing file, write the new one from bash, and read it back. If the write is blocked, save the full file as /mnt/d/WSL/ops/wslconfig.new and give me the one PowerShell command that backs up and replaces it.
- D:\WSL\ops\wsl-host-step.ps1 (I run it from PowerShell after closing every editor and other WSL session): print sizes, `wsl --update`, `wsl --shutdown`, wait, then `wsl --manage Ubuntu --set-sparse true`. If updated WSL refuses to convert the existing disk, stop and print the documented manual compaction commands for my decision. Never use an unsafe override. Then start the distro, and print the verification block: `wsl -l -v`, `wsl --status`, `free -h`, `nproc`, `swapon --show`, `Get-Item D:\WSL\swap.vhdx`, the Ubuntu VHDX length, and the CheckConnection count for the first minutes.
- D:\WSL\ops\wsl-idle-test.ps1: after the host script, start the distro with a command that exits at once, wait 60 seconds, then run `wsl -l -v` and print PASS if the distro is still Running and FAIL if not. The test is valid only when no other WSL terminal, VS Code window or Codex session is open, so print that precondition first.
Give me the exact run order in your final message: sudo script, close everything, host script, idle test.

# Logging
Update "Old Laptop Rebuild - Build 1 WSL Findings" in place by heading: a measured "after" table, the manifest of what was deleted, each install with its version, the final .wslconfig, every error and its root cause, and the handoffs to Build 2 and to the Windows-host session. Update the Index status line and add one line to Session Logs/log.md. Record that Build 2's prompt was rewritten around the Locked Decisions note.

# Stop rules
- If anything you are about to delete is not what the manifest says, skip it and log why.
- If one step fails twice for the same reason, stop and report the cause.
- Do not touch anything on the hold list.

# Final message
Lead with the measured reclaim (GiB, per category), what changed, and the exact commands I must run, in order. Then list anything you skipped and why.
~~~
