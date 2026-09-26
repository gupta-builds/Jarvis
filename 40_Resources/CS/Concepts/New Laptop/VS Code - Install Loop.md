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
  - "[[VS Code - WSL]]"
  - "[[Installations]]"
next: "Run the check block after every install on either side"
---
# VS Code - Install Loop
## One-Line Answer
==Settings Sync keeps the editor identical, but nothing syncs extensions, MCP config for Claude Code, conda envs, or toolchains into WSL, so every install is done twice on purpose and checked with the same block of commands afterwards.== Baseline established 2026-09-26; this note is the procedure for keeping it.
## The Loop
1. **Install on the side you are working on**
	Extension, CLI tool, conda package, or MCP server.
2. **Mirror it on the other side** using the matching command below.
3. **Record it**
	Extensions: update the list in this note. Conda: run the `conda: export jupyter-base spec` task (or the project export task). Toolchains: [[Installations]].
4. **Run the check block** and compare with the expected numbers.
## Extension Policy
- *Hard limit:* 40 on Windows. Currently 39, one slot free.
- *Same working set on both sides.* Windows-only: the six remote-connection extensions (they run in the UI) and PowerShell. WSL-only: `semgrep.semgrep` (its CLI lives in WSL) and `rust-lang.rust-analyzer` (Rust is only installed in WSL).
- *Never uninstall a pack entry* (`...extension-pack`, `vscode-remote-extensionpack`): the CLI removes every member with it. This removed the C/C++ set and, on 2026-09-26, briefly removed WSL, Dev Containers and Remote-SSH.
- *To add one, remove one first* if the Windows count is at 40.
## Current Extension List
| Area | Both sides | Windows only | WSL only |
|---|---|---|---|
| Agents | `anthropic.claude-code`, `openai.chatgpt` (+ its dependency `openai.codex-audio`) | | |
| Python | `ms-python.python`, `vscode-pylance`, `debugpy`, `vscode-python-envs`, `charliermarsh.ruff` | | |
| Notebooks and data | `ms-toolsai.jupyter`, `jupyter-keymap`, `jupyter-renderers`, `ms-toolsai.datawrangler`, `mechatroner.rainbow-csv` | | |
| Web | `biomejs.biome`, `dbaeumer.vscode-eslint`, `bradlc.vscode-tailwindcss`, `ms-playwright.playwright` | | |
| APIs | `anweber.vscode-httpyac` | | |
| Git and GitHub | `eamodio.gitlens`, `github.vscode-pull-request-github`, `github.vscode-github-actions` | | |
| Config formats | `redhat.vscode-yaml`, `tamasfe.even-better-toml`, `davidanson.vscode-markdownlint`, `editorconfig.editorconfig`, `dotenv.dotenv-vscode` | | |
| Shell | `timonwong.shellcheck`, `foxundermoon.shell-format` | `ms-vscode.powershell` | |
| Quality | `usernamehw.errorlens`, `streetsidesoftware.code-spell-checker`, `gruntfuggly.todo-tree` | | `semgrep.semgrep` |
| Containers and remotes | `ms-azuretools.vscode-containers` | `ms-vscode-remote.remote-wsl`, `remote-containers`, `remote-ssh`, `remote-ssh-edit`, `ms-vscode.remote-explorer`, `ms-vscode.remote-server` | |
| Languages | | | `rust-lang.rust-analyzer` |
## Why These and Not Their Competitors
- *httpYac over REST Client:* same `.http` file format, but REST Client's last release was 0.25.1 in September 2022 while httpYac shipped 6.16.7 on 2026-09-23 and adds GraphQL, gRPC and WebSocket. Thunder Client keeps collections in its own format and gates features behind a paid tier.
- *`dotenv.dotenv-vscode` over `mikestead.dotenv`:* published by the dotenv authors, and it cloaks secret values in `.env` files by default. That matches the rule of never surfacing secrets on screen.
- *Data Wrangler:* views and cleans DataFrames straight from a notebook variable. It is the missing piece for pandas work in conda envs.
- *Biome over Prettier + ESLint alone:* one fast formatter and linter; ESLint stays for projects that ship their own config.
- *Semgrep:* the static-analysis backstop already decided in [[Code Review & Eval Gap]]; the extension surfaces it in the editor.
- *Removed:* `npm-intellisense` (TypeScript already completes imports), `mikestead.dotenv` (replaced), `ms-azuretools.vscode-docker` 2.0.0 (a shim for Container Tools), `vscode-chat-customizations-evaluations` (niche, came from the Dell), `jupyter-cell-tags` and `jupyter-slideshow` (unused), and the C/C++ set (the CSCI 4061 dev container installs `ms-vscode.cpptools` inside itself).
## MCP Layout
| Where | Servers | Config |
|---|---|---|
| Claude Code, Windows, user scope | `jarvis`, `the-plan` | `~\.claude.json` via `claude mcp add-json --scope user` |
| Claude Code, WSL, user scope | `jarvis`, `the-plan`, `jarvis-fs` | `~/.claude.json` via the same command |
| VS Code, all windows | Context7, GitHub (official remote), Firecrawl, `jarvis`, `the-plan` | `%APPDATA%\Code\User\mcp.json`, synced |
- *Auth:* headers reference `${JARVIS_API_KEY}` / `${THE_PLAN_API_KEY}` (VS Code uses `${env:...}`). The Windows user variable `WSLENV=JARVIS_API_KEY:THE_PLAN_API_KEY` passes them into WSL without writing them anywhere.
- *GitHub:* one server only, GitHub's official remote MCP in VS Code, signed in through the VS Code GitHub account. The old `@modelcontextprotocol/server-github` was deprecated on npm and had no token set, so it was removed on both sides.
- *No home `.mcp.json`:* user scope makes the servers work from any directory; project `.mcp.json` files are for repo-specific servers only.
## Environment Rule
- *Notebook or library work:* a conda env, used through Jupyter cells. Shared default is `jupyter-base` (spec: `D:\conda\specs\jupyter-base.yml` on Windows, `~/conda/specs/jupyter-base.yml` in WSL). A course or project that needs its own set gets its own env and an `environment.yml` in the repo.
- *Everything else:* a uv project (`pyproject.toml` + `uv.lock` + `.venv`).
- *Growth:* install, then export. `conda install -n <env> <pkg>` followed by the export task; `uv add <pkg>` updates `pyproject.toml` and `uv.lock` itself.
- *Warnings:* Pylance reports unresolved imports as warnings (`reportMissingImports`, `reportMissingModuleSource`), which is the signal that a package is missing from the selected env. `uv: lock check` fails when `uv.lock` drifts from `pyproject.toml`. Jupyter hides base and loose interpreters from the kernel picker, so a notebook cannot silently land on `base`.
## Mirror Commands
Extensions (Windows PowerShell, then WSL bash):
```powershell
code --install-extension <publisher.name>
```
```bash
code --install-extension <publisher.name>   # run inside WSL: installs into the WSL server
```
Conda package into the shared env:
```powershell
& "$env:USERPROFILE\miniconda3\Scripts\conda.exe" install -n jupyter-base <pkg>
```
```bash
~/miniconda3/bin/conda install -n jupyter-base <pkg>
```
MCP server for Claude Code (both sides, from bash):
```bash
claude mcp add-json <name> '<json with ${ENV_VAR} references>' --scope user
```
## Check Block
Run after any change. Expected values as of 2026-09-26 in the comments.
```powershell
(code --list-extensions).Count                         # 39
code --version | Select-Object -First 1                # matches WSL server commit
& "$env:USERPROFILE\miniconda3\Scripts\conda.exe" env list   # base, jupyter-base on D:\conda\envs
uv --version                                           # resolves to ~\.local\bin\uv.exe
```
```bash
code --list-extensions | wc -l                         # 34
ls ~/.vscode-server/bin                                # one folder = client commit
~/miniconda3/bin/conda env list                        # base, jupyter-base
cd /tmp && claude mcp list | grep jarvis               # Connected
```
## Log
| Date | Change |
|---|---|
| 2026-09-24 | Baseline extensions installed on both sides, WSL server brought up to client version |
| 2026-09-25 | C/C++ set removed on both sides |
| 2026-09-26 | Sync pulled 9 Dell extensions; audit to 39/34; MCP moved to user scope; miniconda configured on Windows and installed in WSL; `jupyter-base` on both; standalone uv on Windows |