---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-13
course: Life
track:
  - laptop
  - windows
  - terminal
tags:
  - note
  - laptop
  - prompt
related:
  - "[[_Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]]"
  - "[[C Drive Bloat - Failure Log and Prevention Rules]]"
  - "[[Installations]]"
next: Run in Claude Code (PowerShell, Dell, Sonnet 5.5, high effort). It resumes at the Phase 2 checkpoint; answer D1 to D12.
---
# Old Laptop Rebuild - Build 4 Prompt (Windows Toolkit)

Version 3, written 2026-10-13. It replaces the Build 4 section of the old combined prompt note (kept as history in `Runs/Build 3 Windows Cleanup/`). What changed since version 2: Build 3 is finished (C: has about 136 GiB free), Phases 1 and 2 of this build were already done in an earlier session and are written to the findings note, Chocolatey and Python 3.13.5 are approved for removal once the standalone uv is in place, and the lessons from Build 3's scripts are part of the rules.

## How to run
- **Where:** Claude Code in PowerShell on the Dell, started from `C:\Users\Anant Gupta`. `/model` Sonnet 5.5, effort `high`.
- **What it starts from:** the findings note already holds the audit and a design checkpoint with 12 open decisions. The session re-checks the live state, shows the checkpoint and waits for your answers (D1 to D12, or "all recommended").
- **WSL is not in this build.** Build 5 owns the Dell's WSL config replacement and tools (it used to be here). This session reads WSL only for the catalog.
- **You run scripts, it writes them.** Admin steps go in scripts for an elevated PowerShell. The Acer run comes later from the Acer Run Sheet.
- **Images:** none.
- **After it:** the WSL session ([[Old Laptop Rebuild - Build 5 Prompt (WSL Parity and D Drive)]]) is independent of this one and can run before or after; both write to their own findings notes.

---

~~~text
<situation>
You are Claude Code running in Windows PowerShell, started in C:\Users\Anant Gupta, on my old laptop (Dell Latitude 5530, Windows 11 Pro, host DESKTOP-3VBG0JH). This is Build 4 of a rebuild that makes the Dell and my newer Acer laptop match for development work. Build 1 aligned the Dell's WSL side, Build 2 covered WSL VS Code and the SSH workflow, and Build 3 cleaned C: (it is finished). This build covers the Windows toolkit on both laptops. You produce two things. The Dell's WSL config replacement is not part of this build: Build 5 (a separate WSL session) owns every WSL edit, so you only read WSL for the catalog.
1. Scripts, config files and a verify script, stored in the vault, that install and configure the same Windows terminal toolkit, AI-platform tooling and MCP prerequisites on each laptop, and prove it.
2. A catalog of what is installed on each machine, plus an agent guide, so a smarter AI agent knows what is installed, where it lives, what each tool is for and how to use it.
This is a resumed build. An earlier session already finished Phase 1 (audit) and Phase 2 (design checkpoint) and wrote them to "Old Laptop Rebuild - Build 4 Windows Toolkit Findings". I never answered its decisions D1 to D12. You verify that note against the live machine, show me the checkpoint again, and wait for my answers before writing scripts.
How we work: you write the scripts and I run them. Run only read-only checks and dry runs yourself. For every script, and for every single command better run by hand (a UAC prompt, a browser login, a one-time choice), give me the exact command to paste, then wait. After I run it, read the log and result files, fix the script if needed, and give me the next command.
</situation>

<facts>
Verified 2026-10-12 night. Re-measure anything that drives a decision.
Dell, Windows side, after Build 3:
- C: has about 136 GiB free (it had 39.5 at the start of Build 3), D: about 450 GiB. The pagefile is C: only, 16 to 32 GB. Hibernate is off. TEMP and TMP point to D:\Cache\Temp. Caches are redirected to D:\Cache\<tool> by user environment variables (UV_CACHE_DIR, PIP_CACHE_DIR, HF_HOME, NUGET_PACKAGES, GRADLE_USER_HOME, PLAYWRIGHT_BROWSERS_PATH, PUPPETEER_CACHE_DIR; npm through ~/.npmrc) and OLLAMA_MODELS=D:\AI\ollama-models.
- Layout contract from Build 3 (read "Build 3b C Drive Snapshot Structure and Watch"): C: holds Windows, Program Files, ProgramData, the profile, the pagefile and anything with a driver or service. D:\Apps for apps that accept an install path, D:\Cache\<tool>, D:\AI, D:\WSL, D:\Backup, D:\Quarantine. A new tool sets its environment variable first; no new junctions where a variable exists.
- Scheduled tasks Toolkit-Weekly-Clean (Sunday 03:30) and Toolkit-Watch-C (daily 08:00) exist; scripts live in D:\WSL\ops\windows (04-admin-remove.ps1, weekly-clean.ps1, watch-c.ps1, logs\, watch\, archive\). Do not move weekly-clean.ps1 or watch-c.ps1.
- Windows PowerShell 5.1 only. Not installed: PowerShell 7, Starship, fzf, fd, bat, zoxide, delta, pnpm, NanaZip, the Iosevka Nerd Font (Cascadia only). WinRAR is gone, so NanaZip is the archive tool. Windows Terminal 1.24 on defaults.
- Present: Git 2.52.0, GitHub CLI 2.89.0, ripgrep 15.1.0, jq 1.8.2, FFmpeg 8.1.2, Node 22.16 (winget), Python 3.13.5 plus Python Launcher in C:\Python313 (installed by Chocolatey package python313, on the Machine PATH), uv 0.11.26 installed with pip into C:\Python313\Scripts (it shadows ~\.local\bin because Machine PATH comes first), Claude Code 2.1.296 (native), Codex CLI (npm, Roaming\npm), Docker Desktop (disk on D:\WSL\Docker), Claude Desktop, Cursor, Kiro, Antigravity, VS Code. Chocolatey 2.4.3 is still installed.
- Moved in Build 3, working through junctions you must keep: Miniconda at D:\Apps\miniconda3 with C:\Users\Anant Gupta\miniconda3 as a permanent junction (conda environments hold absolute paths; conda is not on PATH); opam at D:\Apps\opamroot with C:\opamroot as a junction (OPAMROOT unset); Syncthing at D:\Apps\Syncthing; hermes at D:\AI\hermes; .codex\packages at D:\Cache\codex\packages.
- Ollama: the Windows install is 0.40.3 at D:\Apps\Ollama, but the WSL Ollama 0.18.3 holds port 11434 under mirrored networking, so the Windows server is not the one answering (decision D8). A Windows Ollama startup shortcut still exists.
- The Windows PowerShell profile is D:\Users\_Anant\10_Areas\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 (Documents is redirected to D:). It loads an opam environment, Kiro shell integration and a New-PyEnv helper, and has no Starship. Resolve profile paths with [Environment]::GetFolderPath('MyDocuments').
- Tailscale runs only inside this laptop's WSL and is not on the Dell's Windows side. Do not touch it on either machine.
Acer, Windows side (from its snapshot, user C:\Users\anant): Windows Terminal on defaults except font IosevkaTerm Nerd Font, scheme One Half Dark, 85 percent acrylic, cursor #98C379; no PowerShell profile found (the snapshot may have missed it because Documents is redirected to D:); git config has only core.longpaths, core.fsmonitor, core.untrackedCache. Its winget export lists Starship, PowerShell 7, NanaZip, Node LTS, Tailscale and the rest. The Acer's vault root is D:\_Anant\20_Progress\Documents\Jarvis; the Dell's is D:\Users\_Anant\10_Areas\Documents\Jarvis. Syncthing carries the vault between them.
Dell, WSL side (for the catalog and the parity matrix only; Build 5 replaces these files): 13 of 17 comparable config files differ from the Acer's real ones (atuin, gh-dash, git ignore, lazygit, ncdu, sesh, starship.toml, Yazi init.lua, keymap.toml, theme.toml, yazi.toml, .gitconfig, .tmux.conf); 3 Yazi files are missing (flavors/tokyonight-storm.yazi, package.toml). The Dell's .wslconfig, gh-dash repoPaths and the WSL .gitconfig identity are intentionally machine-specific. wsl.exe prints UTF-16.
Constraints that stay:
- Settings Sync is live between the laptops. Any Windows VS Code user file written here reaches the Acer. VS Code, the MCP registry and Claude Code settings are Build 6's; leave them alone. You may read MCP configuration and list server names, never values.
- Windows Terminal, PowerShell profiles and tool configs do not sync, so they are in scope.
- Never run wsl --shutdown. Admin steps go in scripts for me to run elevated.
</facts>

<lessons_from_build_3>
Apply these to every script you write.
- Check elevation with [Security.Principal.WindowsPrincipal]::IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator), never the string 'Administrator'. That string asks for a group that does not exist and fails in an elevated shell.
- Make destructive steps reversible: move to D:\Quarantine\<name>-review-<date> instead of deleting, and delete only regenerable caches. A script that bulk-deletes can be blocked by the harness; a script that quarantines is accepted and safer.
- Dry run first, always, and print a planned total. Test every wildcard filter in a dry run: the filter .wslconfig.* also matched the live .wslconfig. Prefer a regex on Name plus an explicit exclusion.
- Check for running processes before touching an app's folder, and say what to close.
- A silent exit code is not a result: print exit codes (1605 on an MSI uninstall means already gone, 3010 means reboot).
- Opam and Cygwin files carry the System attribute: deleting them needs takeown, icacls, attrib -s and cmd rd with the \\?\ prefix from an elevated shell. Long node_modules paths break Get-ChildItem; use the \\?\ prefix.
- PowerShell 5.1: no ternary, no &&, Set-Content writes CRLF and a BOM, Get-AppxPackage -AllUsers throws without elevation (wrap it in try/catch and fail safe).
</lessons_from_build_3>

<reading_list>
Read in full, in this order, before acting. Vault root (Dell): D:\Users\_Anant\10_Areas\Documents\Jarvis. Notes are in 40_Resources\CS\Concepts\New Laptop\ (the Old Laptop Rebuild folder was reorganised on 2026-10-13: finished runs are under Old Laptop Rebuild\Runs\, living notes sit directly in Old Laptop Rebuild\). Read the vault's AGENTS.md before writing there.
1. Old Laptop Rebuild\Old Laptop Rebuild - Build 4 Windows Toolkit Findings (the audit and the unanswered checkpoint; your starting point).
2. Old Laptop Rebuild\Runs\Build 3 Windows Cleanup\Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch, and the Build 3 Windows Cleanup Findings in the same folder.
3. Old Laptop Rebuild\Acer Dotfile Snapshot\: every file, including hashes-windows.txt, hashes-wsl.txt, excluded-windows.txt, the winget export, VERSIONS.md, MANIFEST.md and the two scripts in _scripts\ (reuse their secret scan, hash logging and ASCII-only patterns).
4. Installations (the "Old Laptop" section and the install-placement buckets); Old Laptop Rebuild\Old Laptop Rebuild - Index and C Drive Bloat - Failure Log and Prevention Rules.
5. Ubuntu - WSL, Acer Live State, Codebases\windows-home\VS Code - Windows, VS Code - Terminal Environments, VS Code - MCP and Secrets, VS Code - Install Loop.
6. For context only: Old Laptop Rebuild\Runs\Build 1 WSL\ and Runs\Build 2 VS Code and Two-Laptop\ findings.
The vault can be stale and the live machine wins. Log each contradiction.
</reading_list>

<design>
Apply every rule to every script.
- One manifest drives everything: Old Laptop Rebuild\Windows Toolkit\toolkit.json. Each tool has id, display name, category, install method (winget id or other), optional version pin, machines (both, dell, acer), install-location policy, verify command, expected-version pattern, owned config files, and use-case fields (purpose, when to reach for it, key commands, where it runs, agent notes). The install, verify and catalog scripts read this one file. Install policies: install, latest, verify, absent.
- Scripts in Windows Toolkit\_scripts\: 00-preflight.ps1, 10-install-toolkit.ps1, 20-apply-configs.ps1, 40-build-catalog.ps1, 99-verify.ps1 and a README with run order and rollback. Add scripts only when a step cannot live in one of these.
- Every script: ASCII only, safe to run twice, -DryRun, detects the machine and the vault root (environment variable first, then candidate paths that contain AGENTS.md), logs to D:\WSL\ops\windows\logs\, writes a result JSON to Windows Toolkit\results\<host>\, never prints secrets, never deletes except replacing a config after a timestamped backup, exits non-zero on a required failure, continues past one failed package and prints a summary table.
- Installs use winget: --exact --accept-package-agreements --accept-source-agreements --disable-interactivity, and --location D:\Apps\<Name> only when the installer supports it. Record each tool's size and drive. Machine-wide installers raise UAC; say so first. Honour the Build 3 layout contract.
- The Dell run records versions in toolkit.lock.json; the Acer run installs those versions where winget has them.
- Configs are written once into Windows Toolkit\configs\ as UTF-8 without BOM and LF using [IO.File]::WriteAllText, copied by the apply script, with tools pointed at the shared location through user environment variables, and a SHA-256 table. "Identical" means the hash matches the source.
- Machine differences are explicit guarded blocks, never edited copies. The Dell's profile keeps its opam, Kiro and New-PyEnv blocks.
- Checks that mean something: parse every script with [System.Management.Automation.Language.Parser]::ParseFile, dry-run each, and let 99-verify.ps1 compare the manifest with reality (version matches, config hash, env vars, font family registered, profile loads in a new shell, Starship renders).
Design notes carried over from the earlier session, verify before use: no winget package exists for the font, so use Nerd Fonts v3.5.1 IosevkaTerm.tar.xz (about 87.5 MB, sha256 054a4a369cdcc5d57e9bc91ea56dfefd66c71c253dcb0c0d7b72c0810373da26, check the published SHA-256.txt), extract only the IosevkaTermNerdFontMono-* TTFs with bsdtar, install per user (%LOCALAPPDATA%\Microsoft\Windows\Fonts plus an HKCU registry entry); it registers as "IosevkaTerm NFM", verify through System.Drawing.Text.InstalledFontCollection. The PowerShell 7 Windows Terminal profile GUID is {574e775e-4f2a-5b96-ac1e-a2962a402336}. Verify the Tokyo Night Storm palette from folke/tokyonight extras. Profile design: one managed block between markers (UTF-8 output, STARSHIP_CONFIG, Starship init guarded by $env:STARSHIP_SHELL, a once-only zoxide init, the VS Code hook behind Test-Path ~/.config/vscode-env/init.ps1 when $env:TERM_PROGRAM -eq 'vscode'). Terminal settings: merge a shared fragment (defaults, scheme, actions, keybindings) into each machine's settings.json and preserve per-machine profiles. Machine PATH precedes user PATH, so the pip uv in C:\Python313\Scripts wins until Python is removed.
</design>

<toolkit_candidates>
Start the manifest from these; the snapshot's winget export decides membership and I approve the list at the checkpoint. WSL-only tools stay out of Windows.
- Shell and terminal, both: PowerShell 7, Windows Terminal (settings below), Starship, IosevkaTerm Nerd Font Mono ("IosevkaTerm NFM"), zoxide, fzf, fd, bat.
- Core CLI, both: Git (Dell 2.52 to current), delta, GitHub CLI (2.89 to current), ripgrep, jq, FFmpeg, NanaZip.
- Runtimes, both: Node LTS with Corepack and pnpm, uv by its standalone installer so it comes first on PATH, then Python through uv. After the standalone uv is verified on PATH, removing the Chocolatey Python 3.13.5 and Chocolatey itself is approved: write the commands as the already existing D:\WSL\ops\windows\04-admin-remove.ps1 -IncludePython (read it first; it refuses to run until a standalone uv exists), and .NET 8 only with -IncludeDotnet8 after Dell Command Update is confirmed to open. Do not change a runtime manager other than that without asking (Node 22 to LTS, Miniconda placement and the junction are decisions).
- AI platforms, both: verify Claude Code, Codex CLI (pinned), Claude Desktop, Cursor, Kiro, Antigravity, Docker Desktop, Ollama.
- MCP prerequisites, both: npx, uvx, mcp-remote, Docker. Check by name only that each configured server's launch command resolves.
- Per machine: Tailscale on the Acer's Windows side only (verify; never install on the Dell).
- Optional WSL-first tier, catalog only: Yazi, lazygit, tmux, atuin, sesh, ncdu.
</toolkit_candidates>

<config_set>
Propose at the checkpoint; write after I approve. The Acer's real files are the source for anything it has.
- starship.toml: the Acer's, LF endings, one file for Windows and both WSLs.
- Windows Terminal: PowerShell 7 default, font IosevkaTerm Nerd Font Mono, a Tokyo Night Storm scheme, the Acer's opacity, acrylic, cursor and keybindings kept, Ubuntu profile named per machine, Miniconda profiles left alone.
- PowerShell 7 and 5.1 profiles: the managed block above, nothing else.
- Git (Windows global): core.longpaths, core.fsmonitor, core.untrackedCache, pull.rebase true, push.autoSetupRemote true, fetch.prune true, rerere.enabled true, init.defaultBranch main, GitHub CLI credential helper, a shared delta include, the global ignore file with eight secret patterns. core.autocrlf is a decision.
- User environment variables: STARSHIP_CONFIG and the config-location variables; verify, do not change, the Build 3 cache variables.
- Dell WSL: not edited here. Build 5 replaces the 13 differing files, adds the 3 Yazi items and installs the WSL linters. Read WSL state only to fill the catalog and the parity matrix.
</config_set>

<task>
Work in phases, finishing and checking each before the next. Keep going until the work is done; stop to ask only when you cannot continue or before a risky step. Do not add tools or files I did not ask for; mention good ideas at the end.
Phase 1, verify (read-only, short). Read the reading list. Re-check live: C: and D: free, PATH order, the versions in the facts, the profile path, Windows Terminal settings, WSL config hashes against the snapshot. List what changed since the findings note was written. Do not redo the whole audit.
Phase 2, checkpoint. Show me: the final manifest table (tool, why, machines, install method); the decisions D1 to D12 below, each with its recommendation; the script list and the order I will run them; the catalog outline; the Acer plan. Then wait for my reply.
Phase 3, write. Write the scripts, manifest and configs to the vault. Parse-check each, run each in -DryRun on the Dell, then give me the Dell run order as copy-ready commands (quoted full path, run as a file) and say which need an elevated shell. Wait.
Phase 4, Dell run. I run them one at a time. After each, read the log and result JSON, fix the script, give me the next command and the by-hand commands. Repeat until 99-verify.ps1 passes, then write toolkit.lock.json. Then, with uv verified, give me the 04-admin-remove.ps1 -IncludePython command.
Phase 5, catalog and agent guide. Run 40-build-catalog.ps1 (Tool Catalog - <host>.md and tool-catalog-<host>.json). Then write one authored note next to Installations, "Machine Toolkit - Tool Use Cases and Agent Guide": an agent front page (which shell for what; where projects live and why never under /mnt; where the vault is; which AI platform for what; MCP servers by name and purpose; sync boundaries between Git, Syncthing and Google Drive; secrets rules) and one card per tool (what, when, three to six copyable commands, config path, gotchas, a one-line instruction for an agent), grouped by task. Propose, but do not write, a pointer line for the Windows home AGENTS.md.
Phase 6, Acer. Write "Acer Run Sheet" in Windows Toolkit\: copy-ready commands in order, where the scripts are on the Acer, how the vault path differs, what each prints, what differs from the Dell and why, and that Tailscale is on the Acer's Windows side only. When I say it ran, read both result sets and write the parity matrix (PASS or DIFF with a reason).
Phase 7, close. Update the "Old Laptop" section of Installations, add an "Acer, Windows side" section, add Growth rules (standing rule plus one check command each for tool versions, config hashes, font registration, environment variables, startup time, catalog freshness), finish the findings note, update the Index status and move this build's prompt and findings under Runs\ when it is closed.

Decisions D1 to D12, with the recommendations from the earlier session (re-check and present them):
D1 Node: LTS 24 (uninstall 22 by hand after verify). D2 uv: standalone installer pinned to the Acer's 0.12.19, then remove the pip copy (and Python, see above). D3 Miniconda: leave in place with the junction. D4 core.autocrlf=input on the Dell's and the Acer's Windows git (the WSL value is Build 5's). D5 Terminal: Tokyo Night Storm and font face IosevkaTerm NFM, PowerShell 7 default, Acer's opacity and keybindings kept, one visual glyph check by me. D6 Profile: one managed block. D7 to D10 (WSL config files, the WSL Ollama service, PowerShell 7 in WSL, ruff/shfmt/shellcheck) moved to Build 5 as E1 to E4; the only Windows-side part is that the Windows Ollama startup shortcut stays until Build 5 settles which Ollama serves. D11 Adopt installed versions into the lock except Git and GitHub CLI, which go to current; Windows Terminal stays on 1.24. D12 No Bun, Yazi or lazygit on Windows.
</task>

<authorization>
Without asking: reading, queries, writing scripts, manifest, configs and notes under the vault (Windows Toolkit\ and the notes named above), -DryRun runs, parse checks.
Ask first, by showing the list and waiting: running any install or config change yourself instead of through my scripts; uninstalling or replacing anything that exists (including Chocolatey, Python 3.13.5 and the pip-installed uv, which are approved only through the gated 04-admin-remove.ps1 -IncludePython path after the standalone uv works); changing a runtime manager; changing anything on the Acer (you cannot reach it; the run sheet is the only route); changing anything inside WSL (Build 5 owns it); any VS Code, MCP or Claude Code settings file.
Do not install Tailscale on the Dell. Do not print secret values. If a config, profile or log you are about to write contains a token, key or password, stop and tell me.
</authorization>

<working_rules>
- Write scripts to files and run them as files. Pasted long commands have corrupted before on these machines.
- Before each phase write one line saying what you are about to do; between phases one or two sentences. Do not narrate routine commands.
- When you change something runnable, run a real check that exercises it. A check that failed to start does not count. If a check cannot run, say which and why.
- If two attempts at one step fail for the same reason, stop and report the cause and the smallest next check.
</working_rules>

<logging>
Write under the vault's Old Laptop Rebuild folder and follow the vault write contract (no files at the vault root, keep frontmatter, patch by heading).
- Continue "Old Laptop Rebuild - Build 4 Windows Toolkit Findings": before and after tables for both laptops, the final manifest, every state-changing command I ran with its result, every error with root cause, decisions with reasons, the parity matrix, and what is left for later builds.
- Keep the Windows Toolkit folder tidy: _scripts, configs, catalog, results, toolkit.json, toolkit.lock.json, the Acer Run Sheet.
- Add one line to 60_Claude\07_AI_Information\Session Logs\log.md and update the Index status line.
</logging>

<final_report>
Lead with the result: what is installed and configured on the Dell, what waits for me on the Acer, which configs match and which differ and why, and the first command to run next. Open decisions as short bullets. Do not paste the notes back.
</final_report>
~~~
