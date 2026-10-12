---
type: concept
status: sprout
created: 2026-10-11
updated: 2026-10-12
tags:
  - concept
  - laptop
  - vscode
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - WSL]]"
  - "[[VS Code - Install Loop]]"
  - "[[VS Code - Terminal Environments]]"
  - "[[VS Code - MCP and Secrets]]"
  - "[[Installations]]"
  - "[[Ubuntu - WSL]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
next: "[[VS Code Professional Setup]]"
---
# VS Code - Windows Environment Build Prompt

## Build 1 — closed 2026-10-12

The first run of this prompt (terminal integration, Python/Jupyter/conda/uv environments, five CLI tools) executed and reported done, with two items it flagged as needing a live GUI VS Code window it didn't have: whether `terminal.integrated.defaultProfile.windows: "PowerShell"` actually launches `pwsh.exe`, and whether the CSCI 4521 interpreter picker shows the right env without manual selection. Both carry forward into Build 2 below. Everything else it touched (PowerShell 7 profile created, `D:\conda` → `D:\Apps\Miniconda` fixed, CSCI 5304's channel fixed, CSCI 4521 added to `python-envs.pythonProjects`, five CLI tools installed) is treated as done here, not re-verified from scratch.

A second, ad hoc pass in this same session (outside either prompt) found the five CLI tools were installed by winget but never got a PATH link, fixed that with hard links in `WinGet\Links`, installed PSFzf for both PowerShell editions, wired `fzf`/`fd`/`bat` together with a preview pane and keybindings, added a global `fd` ignore file and a `bat` config, and closed a `diff.colorMoved` gap between the Windows and WSL `.gitconfig`. One real bug came out of that pass: PSFzf's `-EnableAliasFuzzySetLocation` defines an alias literally named `fd`, which would have shadowed the real `fd.exe` — dropped that flag before it shipped.

## Build 2 — Home directory and remaining VS Code completion

**Run this on the Acer, in a fresh Claude Code session opened on the Windows side**, ideally at the home folder `C:\Users\anant` itself since this build is largely about that folder. Recommended effort: **high**.

This build was written after reading `C:\Users\anant\AGENTS.md` (the home directory's own design doc, the Windows-side counterpart to [[Ubuntu - WSL]]'s conceptual role for the WSL home), the home workspace's `.vscode\settings.json` and `.vscode\env.ps1`, VS Code's live `mcp.json`, and a direct audit of the home directory tree — not copied from older notes. Still read [[Ubuntu - WSL]] and [[VS Code - MCP and Secrets]] first for the design rationale; you don't need the others to execute this.

```
You are hardening the Windows home directory (C:\Users\anant) as this laptop's AI-engineering home base, and closing out the small number of real VS Code gaps still open after Build 1. This machine is the Acer (hostname gupta-builds, user anant, Windows 11). The home directory is not a project-hosting folder — real project code lives in D:\_Anant\10_Areas\UMN\Classes (Windows course work) or WSL's ~/projects (everything else) — it is the machine-management workspace: agent configs for every AI tool (Claude Code, Codex, Copilot, Cursor, Kiro, Gemini), VS Code's own settings/extensions, the global MCP registry, and the scripts and conda base that back all of it. Treat it with real caution: a wrong move here (a deleted dotfile, a misread config, a reflexive cleanup) can break every tool on the machine at once, not just one project. Confirm before deleting anything; prefer adding a line to AGENTS.md's map over guessing what an undocumented folder is for.

Read C:\Users\anant\AGENTS.md in full before touching anything in that directory — it is this machine's own living description of what's there and why, read by every AI tool that opens a shell at home, not just Claude Code.

## Known state (verified live, 2026-10-12 — re-check before acting, don't take this on faith either)

1. **`AGENTS.md`'s conda path is stale.** It currently says conda envs live on "`D:\conda\envs`". The real, confirmed path (via `~/.condarc` and `conda env list`) is `D:\Apps\Miniconda\envs` and `...\pkgs`. This is the same drift Build 1 already fixed in the vault's own notes and in tasks.json — AGENTS.md itself was missed. Fix the one line.

2. **Settings Sync is confirmed ON and actively syncing on Windows.** `%APPDATA%\Code\User\sync\settings\lastSyncsettings.json` and `...\sync\tasks\lastSynctasks.json` have timestamps today that track real edits made during this session (not a stale cache from setup). This is the same account-level sync already active from the WSL side — there was never a question of whether it needed separately turning on here. No action needed; just confirm this is still true and record it plainly in VS Code - Windows.md and VS Code Professional Setup.md so this question doesn't get re-asked later.

3. **VS Code's native MCP config already has more than jarvis/the-plan.** `%APPDATA%\Code\User\mcp.json` (the "servers" schema VS Code's own MCP support uses, distinct from the registry's "mcpServers" schema) has `jarvis` and `the-plan` written by the registry sync script, plus `context7`, `io.github.github/github-mcp-server`, and `firecrawl` added separately through VS Code's MCP gallery (these three use `${input:...}` prompts, not the registry's `${env:VAR}` convention — that's expected, they're not registry-managed). GitHub MCP is already present; nothing to add there.
   - Reading `~/.config/mcp/sync-mcp.ps1`'s actual logic shows it only replaces entries whose name matches the registry (`jarvis`, `the-plan`) and only *reports* (via an `$extra` list) names present in `mcp.json` but absent from the registry — it does not appear to delete them. This was confirmed by reading the script, not by watching a real run touch the file. Do one real dry run before trusting it fully: copy `mcp.json` aside, run the sync script, diff the result, confirm `context7`/`github-mcp-server`/`firecrawl` are untouched and `jarvis`/`the-plan` are refreshed. Record the result in [[VS Code - MCP and Secrets]].

4. **Extensions: 39 installed, matches the documented list exactly.** GitHub Copilot's own extension is deliberately absent — Claude Code is this machine's chosen agent (see VS Code - Install Loop.md's "Why These and Not Their Competitors"). Don't add it back without being asked; this is not an oversight.

5. **`gh auth status` is already correct** (HTTPS, account `gupta-builds`, scopes gist/read:org/repo/workflow). No action.

6. **The home workspace's `.vscode\settings.json` already has a real privacy layer** (`files.exclude`/`search.exclude`/`files.watcherExclude` hiding AppData, credentials, caches, `.ssh`/`.aws`/`.azure`/`.kube`/`.docker`, etc. — someone already thought carefully about this). It has real gaps found by direct audit, not by assumption:
   - `.mcp-auth\mcp-remote-v1\` is not excluded anywhere. By name and location this is the OAuth/session cache the MCP gallery servers (context7, github-mcp-server, firecrawl — all remote, auth-prompting servers) use. It belongs in the same exclude tier as `.ssh`/`.aws`.
   - `.vscode-shared\sharedStorage\` is not excluded either.
   - Three top-level folders exist that AGENTS.md's home directory map never mentions: `ansel\` (empty), `pdf_survey\` (empty), `vscode-remote-wsl\stable\` (not empty — looks like a Windows-side Remote-WSL server cache, which normally belongs inside WSL's own filesystem, not here).

7. **`~/Scripts` (statusline.js, weekly-cache-cleanup.ps1) is deliberately not on the persistent User PATH** — it's only prepended inside the home workspace's own `.vscode\env.ps1`, which is correct for how those two scripts are actually invoked (by full path / by Task Scheduler). Don't add it to the system or user PATH; that would be solving a problem that doesn't exist.

8. **`.wslconfig` vs `.wslconfig.bad` is a real, unresolved inconsistency, not dead clutter.** The active `.wslconfig` caps WSL at `memory=16GB, processors=8` with no `swapfile=` line. `.wslconfig.bad` specifies `memory=20GB, processors=18, swapfile=D:\WSL\swap.vhdx, swap=8GB` plus several settings the active file lacks entirely. Live-checking WSL directly: `free -h`/`nproc` inside WSL match the *active* file's lower numbers (16GB/8 cores) — but `D:\WSL\swap.vhdx` exists and `/proc/swaps` inside WSL shows a 4GiB swap partition actually in use, which only the `.bad` file specifies at all. Neither file fully matches live reality. This changes a shared resource budget on a machine doing real AI/dev work — don't silently pick a side. Surface it to the user as an explicit decision (keep the leaner active config, or restore something closer to the richer `.bad` one with the swap settings reconciled) rather than resolving it yourself.

## Task 1 — The two checks that need a live GUI window

Build 1 could not run these from a headless session. If this session also cannot open a real VS Code window, say so explicitly and hand both back in your final report as still open — don't infer an answer from settings alone.

1. Open a brand-new VS Code integrated terminal. Run `$PSVersionTable.PSVersion` and `$host.Name`. Record which binary `terminal.integrated.defaultProfile.windows: "PowerShell"` actually launches. Patch VS Code - Windows.md's "Not confirmed" line in its "PowerShell Profiles and Terminal Default" section with the real, observed answer.
2. Open a `.py` file under `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4521\Code`. Confirm the interpreter picker / status bar shows `csci-4521` without manual selection, and that a new terminal opened there auto-activates it.

## Task 2 — Fix the home AGENTS.md conda path

Read `C:\Users\anant\AGENTS.md` first to confirm its current exact wording (it may have shifted since this prompt was written), then patch the `.condarc` line: `D:\conda\envs` → `D:\Apps\Miniconda\envs`. This file is read by every AI tool on this machine at every session start — treat the fix with the same care as a vault note, patch the one line, don't rewrite the file.

## Task 3 — Close the home workspace privacy gaps

All changes are to `C:\Users\anant\.vscode\settings.json` unless noted.

1. Add `.mcp-auth` to `files.exclude` and `search.exclude`, same tier as `.ssh`/`.aws`/`.azure`/`.kube`/`.docker`. Before writing it, confirm at a listing level (never open or print anything inside it) that `.mcp-auth\mcp-remote-v1\` really does hold auth/session state, so any comment you leave next to the entry is accurate rather than assumed.
2. Add `.vscode-shared` to the same exclude lists.
3. Investigate `ansel\`, `pdf_survey\`, and `vscode-remote-wsl\stable\` enough to know what each actually is (a dead leftover from some app's first run, vs. something still in use). For each: if it's genuinely dead — confirm nothing on the machine references it, then remove it, no exclude-list entry needed since it won't exist. If it serves a real purpose, add one line to `AGENTS.md`'s home directory map describing it, and exclude it if it's not something that should show up in Explorer/search day to day. If you can't determine confidently which case applies, say so in the report and leave it alone — don't delete something you're not sure about.
4. Surface the `.wslconfig`/`.wslconfig.bad` discrepancy from Known State item 8 to the user as a decision point. Do not edit either file yourself; this changes a live resource budget (memory/CPU/swap) for the whole machine, not just the Windows home workspace's own settings.

## Task 4 — Confirm the MCP gallery entries survive a real sync run

Per Known State item 3: snapshot `%APPDATA%\Code\User\mcp.json`, run `~/.config/mcp/sync-mcp.ps1`, diff the result against the snapshot. Confirm `jarvis`/`the-plan` refresh correctly and `context7`/`github-mcp-server`/`firecrawl` are untouched. Record the confirmed (not just inferred) behavior in [[VS Code - MCP and Secrets]].

## Task 5 — Record Settings Sync's actual state

Per Known State item 2: add one line to VS Code - Windows.md and VS Code Professional Setup.md stating Settings Sync is confirmed active on Windows (account-level, same as WSL), with how to re-verify it (`%APPDATA%\Code\User\sync\*\lastSync*.json` timestamps should track recent real edits). This closes a question that's been asked twice now.

## Task 6 — Re-read AGENTS.md end to end once the above is done

After Tasks 1 through 5, re-read `C:\Users\anant\AGENTS.md` in full and confirm every remaining claim in it is still true against the live machine — not just the conda line from Task 2. This file carries more weight than an ordinary vault note; every AI tool on this machine treats it as ground truth.

## Operating rules for this session

**Verification, not assumption.** Run a real check that exercises the actual behavior before reporting anything done — open the real terminal, run the real command, read the real output. If something genuinely can't be verified from here, say so plainly instead of inferring it.

**Scope discipline.** Work through Tasks 1 through 6 until done and checked. Stop only if genuinely blocked on a decision only the user can make (Task 3.4's `.wslconfig` question is exactly this kind), or before an irreversible step. Do not add tools, config, or documentation beyond what these tasks ask for; name anything else you notice in your final report instead of acting on it. Do not spawn reviewer subagents or extra verification rounds beyond what each task already asks for.

**Safety.** Never read, print, or quote the contents of `.env*`, `.mcp.env`, `.credentials.json`, anything under `.ssh`/`.aws`/`.azure`/`.kube`/`.docker`, or anything inside `.mcp-auth`. The home directory is the one place on this machine where a wrong move affects every tool at once — one extra confirmation before any delete or overwrite here is always worth it. Never delete a file you have not independently confirmed is unreferenced and dead.

**End of session.** Append a session entry to `60_Claude/07_AI_Information/Session Logs/log.md`. Final report structure: what changed, what you verified and how, what you deliberately left out of scope or handed back as a decision for the user (the `.wslconfig` question, and either live-GUI check if you couldn't run it), and any open item.
```
