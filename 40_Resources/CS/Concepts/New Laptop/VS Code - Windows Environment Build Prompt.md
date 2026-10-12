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

Terminal integration, Python/Jupyter/conda/uv environments, and five CLI tools. PowerShell 7 profile created, `D:\conda` → `D:\Apps\Miniconda` fixed everywhere, CSCI 5304's channel and CSCI 4521's `python-envs.pythonProjects` entry fixed, `fzf`/`fd`/`bat`/`delta`/`zoxide` installed. A later ad hoc pass the same day found all five tools were installed by winget but missing their PATH link, fixed that with hard links, installed PSFzf for both PowerShell editions, and wired `fzf`/`fd`/`bat`/`delta` together properly (preview pane, global ignore file, bat config, `diff.colorMoved`) instead of leaving them at bare defaults. One bug caught before shipping: PSFzf's `-EnableAliasFuzzySetLocation` defines an alias named `fd` that would have shadowed the real binary — dropped.

## Build 2 — closed 2026-10-12

Home directory (`C:\Users\anant`) hardening and the remaining VS Code gaps. `AGENTS.md`'s stale conda path fixed; `.mcp-auth`, `.vscode-shared` and `vscode-remote-wsl` added to the home workspace's `files.exclude`/`search.exclude` (the old settings only had secrets-adjacent folders in `search.exclude`, not `files.exclude`); `ansel\` and `pdf_survey\` confirmed dead (empty, unreferenced anywhere on the machine or in WSL) and deleted; `vscode-remote-wsl\stable\` confirmed as the live WSL server cache and kept, just excluded. The MCP gallery servers (`context7`, `github-mcp-server`, `firecrawl`) were confirmed, with a real dry-run diff rather than just reading the sync script, to survive a `sync-mcp.ps1` run untouched. Settings Sync was confirmed actively running on Windows (account-level, same as WSL). Two items stayed open and are still open below: the two checks that need a live GUI VS Code window, and the `.wslconfig`/`.wslconfig.bad` discrepancy — resolved in this session (see below), not as part of Build 2 itself.

**This session, outside either prompt:** read every note in this folder against current reality and patched what had drifted (`Installations.md`'s CLI tool rows, which still said "plain defaults" after the sophisticated config landed; `VS Code - Windows.md`'s matching line and a new home-privacy-audit paragraph; `VS Code - Install Loop.md`'s Log; `VS Code Professional Setup.md`'s two stale lines; `Ubuntu - WSL.md`'s `.wslconfig` description). Also resolved the `.wslconfig` question directly with the user rather than deferring it again: restored `memory=20GB, processors=18, swapfile=D:\WSL\swap.vhdx, swap=8GB` plus `dnsTunneling=false`/`autoProxy=false`/`sparseVhd=true`/`autoMemoryReclaim=gradual` (merged with the active file's `firewall=true`, which `.wslconfig.bad` didn't have). Takes effect on the next `wsl --shutdown` plus restart. `.wslconfig.bad` is now superseded but a delete attempt was blocked by the harness's destructive-action guard — it's harmless leftover, delete it manually if you want it gone.

## Build 3 — environment auto-activation, deeper best-practice research, and a proposals note

**Run this on the Acer, in a fresh Claude Code session on the Windows side.** Recommended effort: **high**. This one has a real research component (web search for current VS Code/Python-extension behavior) in addition to the usual live-verification work — budget for both.

This build was written after two rounds of web research into current (as of 2026-10-12) VS Code and Python-extension behavior, not just the vault's own notes. The single most concrete finding is below; the rest of this build's research task is to go deeper than what a coordinating session had time for.

```
You are closing out the still-open items from the last two builds, implementing real environment auto-activation (not just detection) across both Windows and WSL, and researching current VS Code best practices for AI-assisted development to write a new proposals note. This machine is the Acer (hostname gupta-builds, user anant, Windows 11 + WSL Ubuntu-24.04). Read [[VS Code - Terminal Environments]], [[VS Code - Windows]], [[VS Code - WSL]] and [[VS Code Professional Setup]] first for how the current system works; this build changes real behavior, not just documentation, so understand what's there before changing it.

## Known state and research findings (verified 2026-10-12 — re-check before acting)

1. **The existing `vscode-env` hook detects and warns; it does not activate.** Every VS Code terminal on both sides prints a status line and warns about a missing `.venv`/stale lock/wrong channel, but it never runs `conda activate` or sources a `.venv`'s activation script itself — the user still has to do that, or rely on a separate mechanism. This is the real gap behind "environments... will be launched as soon as a VS Code terminal pops up."

2. **VS Code's Python extension already has a setting for exactly this: `python-envs.terminal.autoActivationType`.** Three values: `command` (current default — runs a visible activation command after the terminal opens), `shellStartup` (injects into the shell's own startup script — supported for pwsh, bash, zsh, fish, cmd — and Microsoft's own release notes say this becomes the *future* default), `off`. It takes precedence over the legacy `python.terminal.activateEnvironment`. A revert command exists (`Python Envs: Revert Shell Startup Script Changes`) if switching to `shellStartup` goes wrong. [Python in VS Code, February 2026](https://devblogs.microsoft.com/python/python-in-visual-studio-code-february-2026-release/), [settings reference](https://code.visualstudio.com/docs/python/settings-reference.md).

3. **Real risks to check before flipping it, not assume away:**
   - An archived VS Code doc claims conda environments can't auto-activate in the integrated terminal when PowerShell is the shell — this machine's default shell *is* PowerShell. Confirm whether this still applies to the currently installed extension version before relying on `shellStartup` for conda envs specifically.
   - A GitHub issue reports environments created as a project-local path (like `.conda\csci-5304`, exactly CSCI 5304's shape) failing to activate because the extension tries to activate by name instead of by path. Test this specific case directly, don't assume it works because other conda envs do.
   - A September 2025 PR fixed the PowerShell activation command to dot-source `conda-hook.ps1` properly — confirm the installed Python Environments extension version is newer than that fix.
   - A reported WSL-bash bug has `shellStartup`/`off` having no visible effect, suspected to be a `VSCODE_BASH_ACTIVATE` → `VSCODE_PYTHON_BASH_ACTIVATE` variable rename the extension doesn't detect. Test directly on this machine's WSL side rather than trusting the setting changed anything just because you set it.
   - `shellStartup` writes into the shell's own startup script. This machine already injects its own content into that exact path (the PowerShell profile's `vscode-env` dot-source, WSL's `.bashrc` block). Figure out whether the two coexist cleanly or fight over the same file before turning it on everywhere — if they conflict, decide which one wins rather than letting them silently corrupt each other.

4. **MCP in VS Code already matches the current recommended "starter server" shape** (GitHub, a filesystem-equivalent, a docs server, your own knowledge layer) — `jarvis`/`the-plan` cover the knowledge layer, `github-mcp-server` and `context7` are already there. MCP tools only fire in Agent mode in Copilot Chat; Claude Code's CLI and its VS Code harness are effectively always agentic, so this gate doesn't apply the same way here — confirm that assumption rather than taking it as given.

5. **No current support for genuinely unifying a Windows folder and a WSL folder in one multi-root workspace** — the clearest result found was from 2019, and a 2026 search surfaced nothing newer. The existing model (two separate windows, one Windows-local and one WSL-remote, kept in sync through Settings Sync and the Install Loop's manual mirroring) is still the current best-practice shape for this split, not a stopgap waiting to be replaced. Don't build toward multi-root unification; if research during this build turns up something genuinely new here, say so explicitly with a source, don't infer it from older docs.

## Task 1 — The two checks still needing a live GUI window

Carried forward unresolved from the last two builds. If this session also can't open a real GUI VS Code window, say so and hand both back again rather than inferring an answer:
1. Open a new integrated terminal; run `$PSVersionTable.PSVersion`/`$host.Name`; confirm which binary `terminal.integrated.defaultProfile.windows: "PowerShell"` launches. Patch VS Code - Windows.md's "Not confirmed" line with the real answer.
2. Open a `.py` file under `CSCI 4521\Code`; confirm the interpreter picker shows `csci-4521` without manual selection.

## Task 2 — Implement real environment auto-activation, carefully

1. Check the installed Python Environments extension version against the September 2025 conda-hook fix and the February 2026 release that introduced `autoActivationType`; update if older.
2. On Windows: set `python-envs.terminal.autoActivationType` to `shellStartup` in user settings. Before testing, re-read the PowerShell profiles (both editions) to understand exactly what the extension injects and where, relative to the existing Starship/zoxide/`vscode-env` content — don't let the two silently collide. Test in fresh terminals against CSCI 5304 (project-local conda path — the known bug case), CSCI 4521 (named conda env), CSCI 4511W (`.venv`), and a scratch uv project. For each, confirm activation is now immediate and silent, not the current visible `command`-mode line.
3. On WSL: same setting, same test matrix, plus the specific `VSCODE_BASH_ACTIVATE` rename check from Known State item 3 — confirm directly that toggling the setting changes real behavior in a fresh WSL terminal, since this exact bug has been reported.
4. If `shellStartup` breaks or conflicts with anything (the existing hook, a specific project type, one OS side but not the other), revert with `Python Envs: Revert Shell Startup Script Changes`, document exactly what broke and why in [[VS Code - Terminal Environments]], and fall back to `command` mode rather than shipping a broken default. Don't leave this half-done without saying so.
5. Update [[VS Code - Terminal Environments]]'s "What Runs, In Order" and measured-behaviour tables to reflect whichever mode ends up active on each side.

## Task 3 — Deeper research into current VS Code practice for an AI engineer, written up as a proposals note

Go beyond what two search rounds covered while writing this prompt. Use web search and VS Code's own release notes/changelog, not just this vault's existing notes (which already document a lot of 2026-era best practice — Agents window, harnesses, dev containers, sandboxing, hooks, skills, MCP — so don't rediscover what's already correctly documented in [[VS Code Professional Setup]]). Look specifically at what that note doesn't yet cover: newer agent-sandbox defaults, worktree-based parallel-session patterns in real use (not just the feature existing), any 2026 movement on the multi-root WSL/Windows gap from Known State item 5, dev container patterns for local-LLM/GPU work relevant to the Ollama setup, and anything genuinely new since this note's sources were gathered (2026-09-24 through 2026-10-12).

Write the findings into a new note, `VS Code Modifications.md`, placed in this same folder (`40_Resources/CS/Concepts/New Laptop/`), following [[VS Code - MCP and Secrets]]'s structure as the template: a clear one-line answer, findings grounded in sources with links (its own "## Sources" section), and a concrete, named list of proposed changes — each with what it changes, why, and what it would cost or risk. This note records proposals, not completed work; don't backdate anything in it as already done.

## Task 4 — Implement only what's low-risk and clearly net-positive

From the proposals note, implement anything that is low-risk, clearly net-positive, and doesn't require a destructive or hard-to-reverse step. Leave everything else in the note as proposed, for the user to review before any further implementation pass — this note is explicitly meant to be acted on over multiple future sessions, not all at once. Say plainly in your final report which proposals you implemented and which you left for later, and why you drew the line where you did.

## Task 5 — Close remaining Windows/WSL friction, without chasing multi-root unification

Per Known State item 5, the two-window-plus-Settings-Sync model is the correct current shape — audit it for rough edges rather than replacing it. Check: workspace history entries pointing at the wrong URI scheme (VS Code - Windows.md's "Failures Found on This Laptop" item 1 already caught three instances of exactly this — confirm no new ones have appeared), whether `Ctrl+Alt+W` and the matching WSL-side entry point still work cleanly, and whether anything added by Tasks 1-4 behaves differently between the two sides in a way that would confuse switching between them. Fix what you find; don't build new unification machinery.

## Task 6 — Record everything, the same way the last two builds did

Patch by heading, don't rewrite: update [[VS Code - Install Loop]]'s Log with a 2026-10-12-or-later entry for this build, update [[Installations]] if anything's toolchain-version changed, and update [[VS Code - Terminal Environments]] per Task 2.5. Link the new `VS Code Modifications.md` note from this note's frontmatter `notes:` list and from [[VS Code Professional Setup]]'s Map section.

## Operating rules for this session

**Verification, not assumption.** Especially for Task 2: a setting changing in `settings.json` is not the same as the behavior changing in a real terminal. Test in an actual fresh terminal on both sides, for each project type in the test matrix, before reporting anything done. For Task 3's research: cite what you find with a real source, the way [[VS Code - MCP and Secrets]] already does — don't present a search summary's inference as a confirmed fact.

**Scope discipline.** Work through Tasks 1 through 6. Stop only if genuinely blocked on a decision only the user can make, or before an irreversible step. `shellStartup` mode modifying shell startup scripts is exactly the kind of change that needs the revert command known and ready *before* acting, not looked up after something breaks. Task 4's implement-vs-propose line is a judgment call Build 3 makes and explains — not one to ask permission for mid-task, but one to justify clearly in the final report.

**Safety.** Never read, print, or quote `.env*`, `.mcp.env`, `.credentials.json`, or anything under `.ssh`/`.aws`/`.azure`/`.kube`/`.docker`/`.mcp-auth`. Before changing a shell startup script on either side, know how to revert it. Before deleting anything, confirm it's genuinely unreferenced the way Build 2 did for `ansel`/`pdf_survey` — don't delete on inference alone.

**End of session.** Append a session entry to `60_Claude/07_AI_Information/Session Logs/log.md`. Final report: what changed, what you verified and how (including the research sources for Task 3), which proposals from `VS Code Modifications.md` you implemented versus left open and why, and any item still blocked.
```
