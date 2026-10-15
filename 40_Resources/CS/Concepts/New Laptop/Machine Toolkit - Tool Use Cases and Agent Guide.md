---
type: note
status: sprout
created: 2026-10-15
updated: 2026-10-15
course: Life
track:
  - laptop
  - windows
  - wsl
tags:
  - note
  - laptop
related:
  - "[[Installations]]"
  - "[[Tool Catalog - DESKTOP-3VBG0JH]]"
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[WSL Toolkit Config Reference]]"
  - "[[VS Code - MCP and Secrets]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
---
# Machine Toolkit - Tool Use Cases and Agent Guide

## One-Line Answer
==Start every task in PowerShell 7 on Windows or bash in WSL, keep code on the WSL ext4 disk, reach the vault through the Jarvis MCP, and treat the generated catalog as the version truth and this note as the "when and how" truth.==

Written for the Dell Latitude 5530 (host `DESKTOP-3VBG0JH`) on 2026-10-15 from the live catalog [[Tool Catalog - DESKTOP-3VBG0JH]] and `toolkit.lock.json`. The Acer runs the same toolkit; where it differs, the card says so. Versions live in the catalog, never here, so this note does not rot when a tool updates. Regenerate the catalog with `40-build-catalog.ps1`.

## Agent front page

### Which shell for what
| Job | Shell | Why |
|---|---|---|
| Windows admin, winget, app installs, scheduled tasks, anything under `C:\` or `D:\Apps` | PowerShell 7 (`pwsh`) | Default shell and Windows Terminal profile. Profile block is managed by the toolkit. |
| Legacy scripts written for 5.1, the toolkit `.ps1` files | `powershell.exe` (5.1) | Toolkit scripts are ASCII-only and 5.1-safe. Run them with `-File`. |
| Code, git, Node, Python projects, tmux sessions | bash in WSL (`Ubuntu`, user `anant_gupta`) | Projects live on ext4 where git and file watchers are fast. |
| Reaching the Dell from the Acer | `ssh` over Tailscale (node `dell-wsl`) or VS Code Remote-SSH | Tailscale runs inside the Dell's WSL only. |

### Where things live
- **Projects:** `~/projects/<group>/<repo>` inside WSL. Never work on code under `/mnt/c` or `/mnt/d`: it is slow, breaks file watching, and mixes line endings. The canonical checkout of each shared repo is on the Dell.
- **Vault (Jarvis):** `D:\Users\_Anant\10_Areas\Documents\Jarvis`, from WSL `/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis`. Prefer the `jarvis` MCP server for notes. Never write to the vault root or `50_Archive/` ([[AGENTS]] has the write contract).
- **Drive layout contract:** C: holds Windows, installers, drivers and the profile. `D:\Apps`, `D:\Cache\<tool>`, `D:\AI`, `D:\WSL`, `D:\Backup` hold the rest. A new tool sets its environment variable first (`UV_CACHE_DIR`, `PIP_CACHE_DIR`, `HF_HOME`, `NUGET_PACKAGES`, `GRADLE_USER_HOME`, `PLAYWRIGHT_BROWSERS_PATH`, `PUPPETEER_CACHE_DIR`, `OLLAMA_MODELS`).
- **Quarantine, not delete:** `D:\Backup\Quarantine`. Only regenerable caches are ever deleted. `~/.cache/node` in WSL is never deleted (it holds the Corepack pin).
- **WSL backups:** `D:\Backup\WSL\ubuntu-<stamp>.tar` plus a manifest. No import test has been run, so treat it as verified-listing only.
- **Ops scripts and logs:** `D:\WSL\ops\` and `D:\WSL\ops\windows\logs\`.

### Which AI platform for what
| Platform | Use it for |
|---|---|
| Claude Code (Windows and WSL) | Primary agent: coding, file work, vault tasks, scripts. |
| Codex CLI | Second-opinion runs and sandboxed tasks. Pinned in `toolkit.lock.json`. |
| Claude Desktop | Chat with MCP servers and Cowork. |
| Cursor | Editor sessions with its agent. Sessions are archived by the Jarvis Cursor pipeline. Auto-update stays on: close every Cursor window, including "Cursor Agents", before accepting an update. |
| Kiro, Antigravity (`agy`) | Spec-driven and agent-first editor sessions. Dell only for Kiro. |
| Ollama | Local models. The Dell has no discrete GPU, so heavy local work belongs on the Acer (RTX 5070 Ti). |

### MCP servers by name and purpose
`jarvis` (Jarvis vault over the Local REST API, `127.0.0.1:27123`), `the-plan` (The Plan vault, `127.0.0.1:27124`), `jarvis-fs` and `the-plan-fs` (filesystem access to those vault folders), `github` (issues, PRs, repos), `firecrawl` (web search and scrape), `pencil` (`.pen` design files), `gbrain` (runs through `wsl.exe`), `context7` (library docs, VS Code), `cua_repl` and `node_repl` (Codex helpers; the Codex `node_repl` path points into WSL and does not resolve on Windows). Names only: values are never read or printed. WSL reaches the Windows-side REST APIs on `127.0.0.1` because networking is mirrored.

### Sync boundaries
| Channel | Carries | Never carries |
|---|---|---|
| Git and GitHub | Code. Backup and PR channel. Parallel work uses worktrees on `<machine>/<topic>` branches. | Secrets, build output. |
| Syncthing | The vaults between the laptops. A `*.sync-conflict-*` file means two writers: diff, merge, move it to `Runs/_backups/`. | Code and cache trees. |
| Google Drive for desktop | Nothing yet. No mirror is on until codebases and cache trees leave the mirrored root. | Jarvis and The Plan stay out of any Drive mirror. |
| Settings Sync (VS Code) | Windows VS Code user files, live between the laptops. | Do not write Windows VS Code, Cursor, MCP or Claude Code settings from a script unless asked. |
No sync daemon ever touches a code checkout.

### Secrets rules
- Secret values live in user environment variables (Windows) or `~/.mcp.env` (WSL, mode 600, sourced by `.bashrc`). Store or rotate with the hidden-prompt scripts, never by pasting into a chat or a note.
- Claude Code is denied `Read` on `.env`, `.mcp.env`, `.credentials.json`, `~/.ssh` and similar. Do not work around it.
- Never print `gh auth token`, environment values or any key. Print names and lengths only. Never put a key in `.bashrc` again (a plaintext Firecrawl key was removed from it on 2026-10-15).
- Scheduled jobs and WSL services do not inherit the Windows environment: they must load secrets themselves.

### Gotchas that bite agents
- `python` on the Windows PATH currently resolves to the Hermes agent venv, not a system Python. Use `uv run python` or a project `.venv`. The old Python 3.13.5 and Chocolatey are gone (their uninstall registrations linger in winget).
- `winget list` showing a tool does not mean it is on PATH. Check `(Get-Command <tool>).Source`.
- Do not run `corepack enable` on Windows. In WSL, pnpm comes from Corepack and is pinned.
- Never run `wsl --shutdown` from inside a session. Host steps go into a script the user runs.
- A PowerShell alias can shadow a binary (PSFzf's fuzzy `fd` alias is kept off for this reason).
- Native tools writing to stderr can abort a PowerShell 5.1 script that sets `$ErrorActionPreference = 'Stop'`, even with `2>$null`. Capture with `Continue` or run through a helper.
- `powershell -File` passes a comma list as one string. Take a single string parameter and split it.

## Cards by task

### Move around and look at things
**PowerShell 7 and Windows Terminal.** Default interactive shell, hosted in Windows Terminal (One Half Dark, IosevkaTerm Nerd Font, same as the Acer). Use 5.1 only for legacy scripts.
```powershell
pwsh -NoProfile -File script.ps1
wt new-tab -p "Ubuntu (Dell)"
notepad $PROFILE
```
Config: managed profile block in `Documents\PowerShell` and `Documents\WindowsPowerShell` (Documents is on D:). Gotcha: do not hand-edit Terminal defaults, `20-apply-configs.ps1` merges them. *Agent: run scripts with `pwsh -NoProfile -File`; never edit the managed profile block.*

**Starship, zoxide, fzf (+PSFzf), fd, bat.** Prompt, directory jumping, fuzzy picking, file finding, file viewing. All interactive except fd.
```powershell
z <part-of-path>            # jump
fd -e md <name>             # find files
bat --plain <file>          # view
fd -t f | fzf --preview "bat --color=always {}"
starship explain
```
Config: `~\.config\starship.toml`, `%APPDATA%\fd\ignore`, `%APPDATA%\bat\config`. Gotchas: fzf and zoxide do nothing in non-interactive shells; `fd -H -I` shows hidden and ignored files. *Agent: use `rg` and `fd` directly, never fzf or z.*

**ripgrep and jq.** Search contents and reshape JSON.
```powershell
rg -n -i "<pattern>" -g "*.md"
rg -l "<pattern>"
jq -r '.items[].name' file.json
jq 'keys' file.json
```
Gotcha: on JSON that holds secrets, print key names only. *Agent: prefer `rg` over `Select-String` for big trees.*

**NanaZip and tar.** Archives. NanaZip has no console exe; scripts use `tar.exe` (bsdtar).
```powershell
tar -tf file.tar.xz
tar -xf file.tar.xz -C <dir>
```
Gotcha: Windows `tar.exe` cannot read every pax name in a WSL export (56 entries skipped in the 2026-10-14 tar); list WSL exports with GNU tar inside WSL. *Agent: verify WSL tars with GNU tar in WSL, not `tar.exe`.*

### Read and change code (git)
**Git, delta, GitHub CLI.** Windows-side repos only. Code lives in WSL.
```powershell
git status -sb
git --no-pager diff
git switch -c <machine>/<topic>
git worktree add ../<topic> <branch>
gh pr create --fill
gh auth status
```
Config: `~\.config\git\ignore`, `~\.config\git\delta.gitconfig`, global gitconfig (identity and safe.directory are machine-specific and never touched). Gotchas: one worktree per concurrently active task; delta paginates, so pass `--no-pager`. *Agent: always `git --no-pager`; never print `gh auth token`.*

**lazygit, yazi, tmux, sesh, atuin, ncdu (WSL only).** Terminal tooling inside Ubuntu.
```bash
lazygit
yazi
tmux new -s <name>      # prefix is Ctrl-a
sesh list
ncdu -x ~
```
Config: `~/.config/{lazygit,yazi,sesh,atuin,ncdu}`, `~/.tmux.conf`, all from the golden set ([[WSL Toolkit Config Reference]]). Gotchas: atuin history can hold secrets; ncdu `d` deletes. *Agent: these are interactive, do not drive them; use plain git and `rg`.*

### Run code (runtimes)
**Node, npm, npx, pnpm.** Windows has Node LTS; WSL has its own (nvm, Corepack-pinned pnpm). Projects run in WSL.
```powershell
node --version
npx -y <package>
npm ls -g --depth=0
pnpm store path
```
Gotchas: npm cache is `D:\npm-cache`; do not run `corepack enable` on Windows; `~/.cache/node` in WSL is never deleted. *Agent: run project commands in WSL, not through `/mnt`.*

**uv and uv-managed Python.** All Python work, standalone uv first on PATH.
```powershell
uv run python script.py
uv venv
uv add <pkg>
uv tool install <tool>
uvx <tool>
```
Gotchas: no system `python.exe` for projects; the PATH `python` is the Hermes venv. *Agent: use `uv run`, create a project `.venv`, never `pip install` globally.*

**Miniconda and opam.** Notebook coursework only (conda) and OCaml coursework (opam). Neither is on PATH.
```powershell
& "$env:USERPROFILE\miniconda3\Scripts\conda.exe" env list
opam switch list
```
Gotchas: the `C:\Users\Anant Gupta\miniconda3` junction and the `C:\opamroot` junction point to D: and must stay; opam files carry the System attribute, so never bulk-delete them. *Agent: use uv for anything that is not a notebook or OCaml.*

### Talk to AI agents
**Claude Code.**
```powershell
claude
claude mcp list
claude -p "<prompt>"
claude update
```
Gotchas: the Windows and WSL copies differ slightly in version; settings and MCP registry belong to the Build 6 wiring. *Agent: read before editing; follow the vault write contract.*

**Codex CLI.**
```powershell
codex exec "<prompt>"
codex mcp list
codex doctor
```
Gotcha: the config's `node_repl` entry points into WSL and does not resolve on Windows (known, tracked for Build 6). *Agent: use `codex exec` for bounded, explicitly specified tasks.*

**Cursor.** `cursor .` opens the editor. Updates arrive as a popup: quit all Cursor windows (including "Cursor Agents") and any process Cursor started, then accept. An interrupted update broke the install twice (2026-09-06, 2026-10-14); the cause was a force-kill while the updater ran. *Agent: never kill Cursor processes; never run a script that stops Cursor while its updater state is checking, downloading or updating.*

**Claude Desktop, Kiro, Antigravity.** App-based. `agy` exists only after the one-time in-app "install agy command" step. *Agent: not drivable from a shell.*

### Containers and local models
**Docker Desktop and Docker CLI.** Containers and Dev Containers. Auto-start is off by choice (the Run-key entry is disabled in StartupApproved).
```powershell
docker version
docker ps
docker system df
```
Gotchas: if the engine pipe is missing, start Docker Desktop, do not reinstall. The disk image is on `D:\WSL\Docker`. *Agent: check the engine is up before any `docker run`.*

**Ollama (Windows).** The Windows server owns `127.0.0.1:11434`; the WSL Ollama service is disabled. Models are in `D:\AI\ollama-models`. It is started by hand when needed; its Startup shortcut is disabled.
```powershell
powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\06-ollama-check.ps1 -Apply
ollama list
ollama ps
```
Gotchas: installed models are two cloud models and `nomic-embed-text`; the Iris Xe has no GPU acceleration for big models. *Agent: ask before pulling any model (disk and RAM).*

### Reach the Dell, keep it healthy
**Tailscale SSH (Dell WSL).** Node `dell-wsl`, Acer node `gupta-builds`. Tailscale is installed inside WSL only; never on the Dell's Windows side, never in the Acer's WSL.
```bash
tailscale status
tailscale debug prefs | grep RunSSH
~/tools/sync-check          # repo divergence and dirty-file check
```
Gotcha: a WSL export or restart takes the Dell offline for 10 to 25 minutes; Tailscale returns by itself. *Agent: do not restart WSL; ask the user to run the host script.*

**Maintenance jobs.** Windows: `Toolkit-Weekly-Clean` (Sundays 03:30, regenerable caches only) and `Toolkit-Watch-C` (daily, read-only C: watcher). WSL: user timers `wsl-clean.timer` and `wsl-watch.timer`.
```powershell
powershell -ExecutionPolicy Bypass -File D:\WSL\ops\windows\weekly-clean.ps1 -DryRun
Get-ScheduledTaskInfo -TaskName Toolkit-Weekly-Clean
```
```bash
systemctl --user list-timers --all
```
*Agent: run dry runs only; anything that deletes goes into a script the user runs.*

**winget.** Install and upgrade everything on Windows.
```powershell
winget upgrade
winget install --id <Id> --exact --source winget
winget show --id <Id> --exact
```
Gotchas: silent installs skip the location picker (use `--location D:\Apps\<Name>` where supported); a portable package may have no PATH entry. *Agent: ask before installing or uninstalling anything.*

## Growth rules
| Standing rule | Check command |
|---|---|
| Tool versions match `toolkit.lock.json` | `powershell -ExecutionPolicy Bypass -File "<toolkit>\_scripts\99-verify.ps1"` |
| Config hashes match the shared source | the "Config files and hashes" table in the catalog; `99-verify.ps1` compares them |
| The font is registered | `(New-Object System.Drawing.Text.InstalledFontCollection).Families \| ? Name -like 'Iosevka*'` |
| Environment variables are set | the "Environment variables" table in the catalog; `[Environment]::GetEnvironmentVariable('OLLAMA_MODELS','User')` |
| Shell startup stays fast | `Measure-Command { pwsh -NoProfile -Command exit }` versus `Measure-Command { pwsh -Command exit }` |
| The catalog is fresh | `facts.generated` in `tool-catalog-<host>.json`; rebuild with `40-build-catalog.ps1` when older than the last install |
| New secrets never enter a shell rc | `grep -c "API_KEY=" ~/.bashrc` must print 0 |
