---
type: concept
status: sprout
created: 2026-09-24
updated: 2026-09-26
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
next: "Give second-brain-claudekit its .vscode/ folder"
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