---
type: concept
status: sprout
created: 2026-09-26
updated: 2026-09-26
course: Life
track:
  - laptop
  - vscode
tags:
  - concept
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - Install Loop]]"
  - "[[VS Code - MCP and Secrets]]"
next: "Port init.ps1 to init.sh for WSL once the Windows side is confirmed in daily use"
---
# VS Code - Terminal Environments
## One-Line Answer
==Every terminal VS Code opens loads the same base environment, then the folder's own `.vscode/env.ps1` if it has one, then prints one status line and any drift warnings; the home folder has its own `env.ps1` that shows space, knowledge, memory and tooling.== Built and tested on Windows on 2026-09-26; WSL gets the same design later.
## Why It Hooks From the Profile, Not From Terminal Args
The obvious route is a terminal profile whose `args` run a script. VS Code's docs say shell integration activates by injecting its own arguments and may not activate in complex setups. That would lose command decorations, sticky scroll, cwd detection, and the Python Environments activation that relies on them. So the hook lives in the PowerShell profile behind `$env:TERM_PROGRAM -eq 'vscode'` (VS Code sets that in every terminal), and VS Code settings steer it:
- `terminal.integrated.env.windows.VSCODE_WORKSPACE = ${workspaceFolder}` (user settings): the workspace root, even for terminals opened in a subfolder. The docs confirm variables resolve in terminal `env`.
- `VSCODE_ENV_KIND = home` (home workspace settings) marks the home folder.
- `VSCODE_ENV_DISABLE = 1` turns it off for one window.
These `terminal.integrated.*` settings are marked `restricted` in VS Code 1.139, so a workspace can only set them once you trust it.
## What Runs, In Order
1. **Profile** (`D:\_Anant\20_Progress\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`): Starship, UTF-8, then dot-sources `~/.config/vscode-env/init.ps1` when inside VS Code.
2. **Base**: conda `base` is never left active (conda `auto_activate` is also off).
3. **Detect**: `pyproject.toml` (uv project), `environment.yml` (conda project), a bare `.venv`, `requirements.txt`, notebooks. Only file checks, no conda or uv processes, so it stays fast.
4. **Header**: `env | <folder> | <what was detected> | .vscode/env.ps1 loaded` (or `no .vscode/env.ps1`).
5. **Workspace hook**: `<folder>\.vscode\env.ps1`, dot-sourced so its variables, PATH changes and functions stay in the session.
6. **Warnings**: missing `.venv`, missing or stale `uv.lock`, conda env not created, `defaults` channel in `environment.yml`, untracked `.venv`, notebooks without an env.
Tasks run `powershell -Command` without `-NoExit`, so the script stays silent there but still applies the environment. Verified: a task-style run printed only its own output and still had `~\Scripts` on PATH.
## Measured Behaviour (Windows, 2026-09-26)
| Folder | Status line | Warning |
|---|---|---|
| `C:\Users\anant` | `env \| home \| .vscode/env.ps1 loaded` + home block | none |
| CSCI 5304 | `conda env 'csci-5304'` | `defaults` channel needs Anaconda ToS |
| CSCI 4511W practice code | `.venv (no pyproject.toml)` | untracked `.venv`, cannot be rebuilt |
| scratch uv project | `uv project` | no `.venv`, no `uv.lock` |
Startup cost: 773 to 869 ms per terminal against a 734 ms baseline for plain PowerShell 5.1 with Starship, so the environment adds roughly 40 to 135 ms.
## The Home Environment
`C:\Users\anant` is the machine-management workspace, so its environment is about the base, not a language:
- *No Python env activated.* Projects bring their own.
- *Room:* `~\Scripts` on PATH (`weekly-cache-cleanup.ps1`, `statusline.js`); free space on C: and D:, with a warning under 30 GB on C:.
- *Knowledge:* Jarvis (27123) and The Plan (27124) reachability, and the size of the MCP registry.
- *Memory:* confirms `AGENTS.md` and `.claude\CLAUDE.md`. `AGENTS.md` now carries a home directory map (what each folder is, what is off limits), which every agent reads here.
- *Privacy:* `~/.vscode/settings.json` hides Windows profile plumbing, `OneDrive`, `miniconda3` and caches from the Explorer; keeps `.mcp.env`, `.env*`, `.credentials.json`, `.ssh`, `.aws`, `.azure`, `.kube` and agent session logs out of search; and stops watching heavy trees.
- *Helpers:* `home-status`, `mcp-sync`, `mcp-check`.
`~/.vscode` doubles as VS Code's extensions folder; only `settings.json` and `env.ps1` in it are workspace files.
## Every Other Folder
Folders start with the default: base plus detection. A folder gets its own environment only when you ask, with the task `env: create workspace environment (.vscode/env.ps1)`, which copies `~/.config/vscode-env/templates/env.ps1`. It is not created automatically. Writing `.vscode/` into every folder VS Code opens would leave untracked files in cloned repos and course folders, and would put executable code into folders that have not been reviewed.
*Growing it:* add variables, PATH entries and functions to that folder's `env.ps1`. Python packages grow through the environment tools, not this file: `uv add` for uv projects, `conda install` plus the export task for conda projects.
## Files
| Path | Role |
|---|---|
| `~/.config/vscode-env/init.ps1` | shared entry, every VS Code terminal |
| `~/.config/vscode-env/templates/env.ps1` | seed for a workspace's `env.ps1` |
| `~/.vscode/env.ps1`, `~/.vscode/settings.json` | home workspace environment and privacy |
| `%APPDATA%\Code\User\tasks.json` | `env: create workspace environment`, `mcp: sync registry to all tools`, conda and uv tasks |
## Sources
[Terminal profiles](https://code.visualstudio.com/docs/terminal/profiles), [Shell integration](https://code.visualstudio.com/docs/terminal/shell-integration), [Variables reference](https://code.visualstudio.com/docs/reference/variables-reference), [Workspace Trust](https://code.visualstudio.com/docs/editing/workspaces/workspace-trust).