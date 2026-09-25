---
type: concept
status: sprout
created: 2026-09-24
updated: 2026-09-24
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
  - "[[Ubuntu - WSL]]"
  - "[[second-brain-claudekit-new-laptop-directive]]"
next: "Record the mirror procedure in the Install Loop note"
---
# VS Code - WSL
## One-Line Answer
==A WSL window is the Windows VS Code UI driving a VS Code Server inside Ubuntu, so settings and keybindings come from Windows but every extension that runs code, every toolchain, and every agent config has to exist again on the Linux side.== The shared systems are in [[VS Code Professional Setup]]; this note records the WSL side's configured state.
## How a WSL Window Works
The WSL extension starts a **VS Code Server** under `~/.vscode-server/bin/<commit>/` and talks to it over a random local port (not SSH). UI extensions (themes, keymaps) stay on Windows. Workspace extensions (language servers, Python, Pylance, debugpy, Claude Code, Codex) run inside WSL and are installed there separately.
- *Right way to open:* `code .` from a WSL shell, `Ctrl+Alt+W`, or `WSL: Connect to WSL`. The window title shows `[WSL: Ubuntu-24.04]`.
- *Wrong way:* opening `\\wsl.localhost\Ubuntu-24.04\...` from a normal Windows window. That runs Windows extensions and Windows git over the 9P share. It happened three times before 2026-09-21 14:14 (evidence in [[VS Code - Windows]]).
- *Where code lives:* the Linux filesystem (`~/projects/...`). Codebases here are their own clones, separate from any Windows clone, and meet the Windows side only through GitHub.
## File Map
| Path | What lives there |
|---|---|
| `~/.vscode-server/bin/<commit>/` | server build, matches the client commit |
| `~/.vscode-server/extensions/` | WSL-side extensions |
| `~/.vscode-server/data/Machine/settings.json` | Remote settings for this distro |
| `~/.vscode-server/server-env-setup` | optional Bourne-shell script run before the server starts (not used) |
| `~/.claude`, `~/.claude.json`, `~/.codex`, `~/.copilot` | WSL copies of agent user config |
| `~/projects/{ai,hub,hackathon,scratch,work}` | codebases |
## Applied Configuration, 2026-09-24
- *Server:* updated from `7debcd0` to `2242ebb` (matches the Windows client 1.139.0) during the extension install.
- *Extensions (33):* the same developer set as Windows: Claude Code, Codex (`openai.chatgpt`), Python, Pylance, debugpy, Python Environments, Ruff, Jupyter pack, Biome, ESLint, the C/C++ pack, `rust-lang.rust-analyzer` (Rust is installed here), GitLens, GitHub PRs, GitHub Actions, YAML, TOML, markdownlint, Rainbow CSV, EditorConfig, ShellCheck, shell-format, Container Tools, ErrorLens. Installed with the WSL `code` shim (`code --install-extension <id>` run inside Ubuntu), which targets the server, not Windows.
- *Remote settings:* `~/.vscode-server/data/Machine/settings.json` sets `terminal.integrated.defaultProfile.linux: bash`, `python-envs.terminal.autoActivationType: command`, and watcher excludes for `.venv`, `node_modules`, `target`. Everything else is inherited from the Windows user settings.
- *Docker:* Docker Desktop's WSL integration for `Ubuntu-24.04` was already on and its data lives at `D:\WSL\DockerDesktopWSL`. With Docker Desktop running, `/usr/bin/docker` in WSL reports client and server 29.8.0 and ran a test container. Auto-start stays off, so start Docker Desktop before container work.
## Toolchain State
| Tool | State |
|---|---|
| `git` | installed, `core.autocrlf=false`, GitHub auth through `gh auth git-credential` |
| `uv` | 0.12.17 in `~/.local/bin` |
| `node` / `pnpm` | v24.21.0 via nvm, loaded by `.bashrc` in interactive shells (VS Code's terminal and environment resolution use it) |
| `gh`, `direnv`, `claude`, `python3` | installed |
| `docker` | works when Docker Desktop runs |
If an extension or task ever reports `node: not found`, the nvm init is only in `.bashrc`; moving it into `~/.profile` is the fix. `remote.WSL.useShellEnvironment` is on by default, which is why it works today.
## Machine-Scoped Settings to Remember
Settings with `machine` scope in Windows user settings do not reach this side. The ones that matter here: `python-envs.terminal.autoActivationType` (set in Remote settings), and Claude Code's `claudeCode.initialPermissionMode`, `environmentVariables`, `allowDangerouslySkipPermissions`. If any of those get set on Windows, set them in Remote settings too (`Preferences: Open Remote Settings (JSON) (WSL: Ubuntu-24.04)`).
## Trust Layout
- *Trusted parents:* `~/projects/ai`, `~/projects/hub`, `~/projects/work`, `~/projects/hackathon`.
- *Landing zone:* `~/projects/scratch` stays untrusted. Third-party clones go there first and open in Restricted Mode.
- *Home:* `/home/anant_gupta` itself is not trusted as a parent.
## Dev Containers From WSL
WSL is the host for container work: the repo lives in WSL, Docker Desktop serves it through WSL integration, and the Agents window can run a session inside the container (`chat.agentHost.devContainer.enabled` is on). The step-by-step and a copyable `devcontainer.json` are in [[VS Code Professional Setup]]. Keep `~/.ssh` and `~/.config/gh` out of every mount.
## First Codebase: second-brain-claudekit
`~/projects/ai/second-brain-claudekit`, clean on `main`, no `.vscode/` yet. It has no root `package.json` or `pyproject.toml`, so no build task. What it would use: a `tasks.json` wrapping its checks from [[second-brain-claudekit-git-clone-and-bootstrap]] (`jq empty` on the JSON configs, `bash -n` on every script). Its project `.claude/` (agents, commands, hooks) is read by the Claude Code extension now that the extension is installed on this side.
## Remaining Steps on WSL
1. `.vscode/` for `second-brain-claudekit`.
2. First dev container on a scratch repo to prove Route A and Route B end to end.
3. Write the Install Loop note (to create) with the exact mirror commands used today.