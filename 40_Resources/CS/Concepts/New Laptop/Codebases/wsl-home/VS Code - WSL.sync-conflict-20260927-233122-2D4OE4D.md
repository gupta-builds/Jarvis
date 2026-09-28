---
type: concept
status: sprout
created: 2026-09-24
updated: 2026-09-27
course: Life
track:
  - laptop
  - vscode
  - wsl
tags:
  - concept
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - Install Loop]]"
  - "[[Ubuntu - WSL]]"
  - "[[second-brain-claudekit-new-laptop-directive]]"
next: Give second-brain-claudekit its .vscode/ folder
---
# VS Code - WSL
## One-Line Answer
==A WSL window is the Windows VS Code UI driving a VS Code Server inside Ubuntu, so settings and keybindings come from Windows but every extension that runs code, every toolchain, every conda env and every Claude Code MCP entry has to exist again on the Linux side.== Main development happens here; installs are mirrored through [[VS Code - Install Loop]].
## How a WSL Window Works
The WSL extension starts a **VS Code Server** under `~/.vscode-server/bin/<commit>/` and talks to it over a random local port. UI extensions stay on Windows; workspace extensions (language servers, Python, Jupyter, Claude Code, Codex) run inside WSL and are installed there separately.
- *Right way to open:* `code .` from a WSL shell, `Ctrl+Alt+W`, or `WSL: Connect to WSL`. The window title shows `[WSL: Ubuntu-24.04]`.
- *Wrong way:* `\\wsl.localhost\...` from a Windows window, which runs Windows extensions and Windows git over 9P (happened three times before 2026-09-21 14:14).
- *Where code lives:* the Linux filesystem (`~/projects/...`). Codebases here are their own clones and meet Windows clones only through GitHub.
## File Map
| Path | What lives there |
|---|---|
| `~/.vscode-server/bin/<commit>/` | server build, matches the client (1.139.1, `04c0d99`) |
| `~/.vscode-server/extensions/` | WSL-side extensions (34) |
| `~/.vscode-server/data/Machine/settings.json` | Remote settings (machine-scoped values) |
| `~/.claude.json` | Claude Code user-scope MCP servers |
| `~/miniconda3/`, `~/.condarc`, `~/conda/specs/` | conda install, config, env specs |
| `~/.config/starship.toml` | prompt config, same file as Windows |
| `~/projects/{ai,hub,hackathon,scratch,work}` | codebases |
## Configured State, 2026-09-26
- *Extensions (34):* the shared working set plus `semgrep.semgrep` and `rust-lang.rust-analyzer`. Full list in [[VS Code - Install Loop]].
- *Remote settings:* bash as the default terminal, Python Environments activation in terminals, `python.condaPath` at `~/miniconda3/bin/conda`, Jupyter hides `/usr/bin/python3`, `/bin/python3` and conda base, watcher excludes for `.venv`, `node_modules`, `target`. Everything else is inherited from Windows.
- *Miniconda:* installed 2026-09-26 (conda 26.7.1) at `~/miniconda3`, conda-forge only, strict priority, `auto_activate` off, `changeps1` off, `conda init bash` added to `.bashrc`. Your decision puts miniconda wherever Jupyter runs, which replaces the WSL master plan's "Windows-only exception" line.
- *`jupyter-base`:* identical to Windows (Python 3.12.14, numpy 2.5.3, pandas 3.0.6, scikit-learn 1.9.1, plus ipykernel, ipywidgets, pyarrow, scipy, matplotlib, seaborn). Spec at `~/conda/specs/jupyter-base.yml`.
- *uv:* 0.12.17 in `~/.local/bin` for every non-notebook project.
- *MCP for Claude Code:* `jarvis`, `the-plan`, `jarvis-fs` at user scope (they work from any directory, verified from `/tmp`). The old `~/.mcp.json` is backed up as `~/.mcp.json.bak-20260926` and removed; its deprecated `server-github` entry was dropped.
- *Jarvis auth:* `JARVIS_API_KEY` reaches WSL through the Windows `WSLENV` variable. It applies to WSL shells started after 2026-09-26 14:05. The network path already worked (networking mode is mirrored), so the earlier failure was the missing key: HTTP 401 without it, 200 with it.
- *Docker:* WSL integration on, data at `D:\WSL\DockerDesktopWSL`, auto-start off. Start Docker Desktop before container work.
## Terminal Environment, Secrets and MCP Platforms, 2026-09-27
The gap this note's own `next:` field named ("port init.ps1 to init.sh") and the one [[VS Code - MCP and Secrets]] named ("port the registry to WSL") are both closed now, verified by running commands rather than assumed:
- *Terminal environment:* `~/.config/vscode-env/init.sh` is a bash port of `init.ps1`, same order (base, detect, header, workspace hook, warnings). Hooked from the end of `~/.bashrc`, guarded by `TERM_PROGRAM=vscode` and `VSCODE_ENV_DISABLE`. Detection uses only bash builtins and file tests on the hot path, no subprocess spawns, so it adds no measurable startup cost (median 0.52 s with or without it, 5 warm runs). A folder with `.envrc` is reported in the header and `.vscode/env.sh` is not also loaded, so direnv and this hook never fight over the same folder. Full measurements: [[VS Code - Terminal Environments]].
- *Task shells:* bash never sources `.bashrc` for a non-interactive, non-login shell, so a VS Code task gets none of this by default; confirmed directly (`bash -c` shows empty `$-` interactive flag and an unset marker variable). `BASH_ENV` would close the gap but runs on every non-interactive bash invocation on the machine, not just VS Code tasks, so it stays undone on purpose rather than being forced in.
- *Home workspace:* `~/.vscode/env.sh` and `~/.vscode/settings.json` are the Linux equivalents of the Windows home files: same status block (space on `/` and `/mnt/d`, Jarvis/The Plan reachability over a sub-200 ms TCP check, memory files, Docker socket, `~/projects` layout), same `mcp-sync`/`mcp-check`/`home-status` helper names, same secret-and-cache exclude lists adapted to Linux paths (`miniconda3`, `.vscode-server`, `.claude/projects`, in place of the Windows profile clutter). `~/.vscode` is not the WSL server's own folder (that is `~/.vscode-server`), so there is no extensions-folder collision the way there is on Windows.
- *Claude Code deny rules:* `~/.claude/settings.json` denies the same file classes as Windows (`.env*`, `.mcp.env`, `.credentials.json`, `~/.ssh`, `~/.aws`, `~/.azure`, `~/.kube`, `~/.codex/auth.json`), in Linux path form, plus two WSL-specific entries replacing the Windows-only credential script: `~/.config/gh/hosts.yml` and `~/.git-credentials` (WSL authenticates through `gh auth git-credential`, so this is the actual secret surface here). Verified: a dummy `/tmp` `.env` was blocked, a normal file beside it was read.
- *Global git ignore:* `~/.config/git/ignore` has the same eight patterns as the Windows file (`.env`, `.env.local`, `.env.*.local`, `.env.production`, `.mcp.env`, `.credentials.json`, `*.pem`, `*.key`). `core.excludesFile` stays unset on both sides; git's own default (`$HOME/.config/git/ignore`) picks it up with no config needed, confirmed with a scratch repo: `.env` and `.mcp.env` ignored, `.env.example` not.
- *MCP registry gets a `platforms` field:* `targets` already said which tool (claude/vscode/codex); `platforms` now says which OS side (default both if omitted). `jarvis-fs` is in the registry for the first time, `platforms: ["wsl"]`, using the same `npx @modelcontextprotocol/server-filesystem` command already live in Claude Code's WSL config, so applying it reports "in sync", not "update". `sync-mcp.ps1` skips anything not for windows and still reports jarvis/the-plan in sync on both Claude Code and VS Code.
- *WSL sync script:* `~/.config/mcp/sync-mcp.sh` reads the Windows registry directly through `/mnt/c` (never copies it) and applies to `claude` (`~/.claude.json` via `claude mcp add --scope user`) and `codex` (`codex mcp add --url --bearer-token-env-var`, http servers only, matching the Windows script's own limit). It refuses `vscode` (there is one VS Code user `mcp.json`, on Windows, read by both window types; writing it from WSL is how drift starts) and refuses `--set-secret` (secrets are set on Windows with `sync-mcp.ps1 -SetSecret` and reach WSL through `WSLENV`, already true for `JARVIS_API_KEY` and `THE_PLAN_API_KEY`). `cd /tmp && claude mcp list` shows `jarvis`, `the-plan` and `jarvis-fs` all connected.
- *User tasks:* `env: create workspace environment (.vscode/env.ps1 / env.sh)` and `mcp: sync registry to all tools` both have real `linux` commands now instead of the earlier "Windows-only task" placeholders, edited as text in the synced `tasks.json` so the file's own comments survived untouched.
## Toolchain State
| Tool | State |
|---|---|
| `git` | `core.autocrlf=false`, GitHub auth through `gh auth git-credential` |
| `uv` | 0.12.17 |
| `conda` | 26.7.1, `jupyter-base` env |
| `node` / `pnpm` | v24.21.0 via nvm in interactive shells |
| `gh`, `direnv`, `claude`, `semgrep`, `starship` 1.26.0 | installed |
| `docker` | works when Docker Desktop runs |
## Trust Layout
- *Trusted parents:* `~/projects/ai`, `~/projects/hub`, `~/projects/work`, `~/projects/hackathon`.
- *Landing zone:* `~/projects/scratch` stays untrusted.
- *Home:* `/home/anant_gupta` is not trusted as a parent.
## Dev Containers From WSL
The repo lives in WSL, Docker Desktop serves it through WSL integration, and the Agents window can run a session inside the container. The step-by-step guide and a copyable `devcontainer.json` are in [[VS Code Professional Setup]]. Keep `~/.ssh` and `~/.config/gh` out of every mount.
## First Codebase: second-brain-claudekit
`~/projects/ai/second-brain-claudekit`, clean on `main`, no `.vscode/` yet. No root `package.json` or `pyproject.toml`, so no build task; its checks from [[second-brain-claudekit-git-clone-and-bootstrap]] (`jq empty` on the JSON configs, `bash -n` on every script) are the natural `tasks.json`. Its project `.claude/` is read by the Claude Code extension on this side.