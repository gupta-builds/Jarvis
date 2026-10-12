---
type: concept
status: sprout
created: 2026-09-24
updated: 2026-09-26
course: Life
track:
  - laptop
  - vscode
tags:
  - concept
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - WSL]]"
  - "[[VS Code - Install Loop]]"
  - "[[Installations]]"
  - "[[New Laptop Setup]]"
next: "Keep Windows work to the UMN class folders and the vaults; mirror every install through [[VS Code - Install Loop]]"
---
# VS Code - Windows
## One-Line Answer
==The Windows side owns the one user settings layer every VS Code window inherits, including WSL windows, and it is where course work under `D:\_Anant\10_Areas\UMN\Classes` runs; everything else runs in WSL.== The shared systems are explained in [[VS Code Professional Setup]]; installs are mirrored through [[VS Code - Install Loop]].
## What "Windows Home" Means Here
`C:\Users\anant` is opened as a folder in VS Code and is where Claude Code home-directory sessions run, so the home directory is a workspace in its own right. `C:\Users\anant\.vscode\` is VS Code's extensions and `argv.json` folder and would also be read as this workspace's `.vscode/`. User-wide settings go in `%APPDATA%\Code\User\settings.json`, never in `~\.vscode\`.
## File Map
| Path | What lives there |
|---|---|
| `D:\Apps\Microsoft VS Code\` | the app (1.141.0 on 2026-10-12, was 1.139.1 on 2026-09-26; self-updating) |
| `~\.vscode\extensions\` | Windows-side extensions (39) |
| `%APPDATA%\Code\User\settings.json` | user settings, inherited by WSL windows, synced |
| `%APPDATA%\Code\User\keybindings.json` | custom `Ctrl+Alt` layer, synced |
| `%APPDATA%\Code\User\tasks.json` | user tasks for env export and uv, synced |
| `%APPDATA%\Code\User\mcp.json` | VS Code MCP servers, synced |
| `%APPDATA%\Code\User\workspaceStorage\<hash>\workspace.json` | one file per folder ever opened, with its URI |
| `%APPDATA%\Code\logs\<session>\` | per-session logs, including `userDataSync.log` |
| `%APPDATA%\Code\User-backup-20260924\` | every pre-change backup from 2026-09-24 to 2026-09-26 |
| `~\.condarc`, `D:\Apps\Miniconda\envs`, `D:\Apps\Miniconda\pkgs`, `D:\Apps\Miniconda\specs` | conda config, environments, package cache, env specs (`D:\conda` never existed; corrected 2026-10-12) |
| `~\.config\starship.toml` | prompt config, same file as WSL since 2026-09-26 |
| `D:\_Anant\20_Progress\Documents\PowerShell\` and `...\WindowsPowerShell\` | PowerShell 7 and Windows PowerShell 5.1 profiles (Documents is redirected to D:); see "PowerShell Profiles and Terminal Default" |
## Settings Sync Incident, 2026-09-25/26
Sync was turned on while the cloud already held a copy from another machine, most likely the Dell. The first sign-in hit a settings conflict whose preview was an empty file. After it was resolved, local `settings.json` held only the remote's 2 keys (`claudeCode.hideOnboarding`, `editor.wordWrap`), and at 13:55 and 13:57 on 2026-09-26 that 2-key file was pushed back to the cloud. The extension merge also installed the Dell's 9 extensions (40 total).
*Recovery:* settings restored from the pre-sync backup, keeping both remote keys. The Dell extensions were audited, and every restored file was confirmed pushed in `userDataSync.log` (MCP 14:12, extensions 14:14, settings and keybindings 14:21, tasks 14:22).
> [!WARNING]
> When Sync reports a conflict on a new device, choose **Accept Local** (or "Replace Remote") for settings and extensions, then check `settings.json` before doing anything else. The Dell must not sign in again unless it should receive this laptop's config.

## Applied Configuration
- *Editor:* format on save, sticky scroll, no minimap, whitespace at boundaries, active bracket guides, linked editing, word wrap, file nesting, no preview tabs, no startup editor.
- *Files:* autosave on focus change, trimmed whitespace, LF for new files, caches hidden, `.venv`/`node_modules`/`target`/`.conda` out of watching and search.
- *Formatters:* Ruff for Python (fix and organize imports on save), Biome for JS/TS/JSON, rust-analyzer, shell-format, Even Better TOML, Red Hat YAML. Markdown does not format on save.
- *Python environments:* Python Environments extension with `venv` (uv) as the default manager, `python.condaPath` set, CSCI 5304 mapped to its conda env and CSCI 4511W to its `.venv` through `python-envs.pythonProjects` (fixes the test discovery failure). Pytest on. Unresolved imports are warnings. Pylance and Ruff skip `AppData`, miniconda and `.conda`.
- *Jupyter:* base miniconda, the `~\.local\bin` shim and the two uv-managed CPythons are hidden from the kernel picker, so notebooks pick a named env. Line numbers, scrolling and word-wrapped output in notebooks.
- *Git:* autofetch with prune, protected `main`/`master`, whitespace-sensitive diffs, GitLens code lens off.
- *Terminal:* `'IosevkaTerm NFM', 'IosevkaTerm Nerd Font Mono', Consolas, monospace`, PowerShell default, 10,000 lines scrollback, sticky scroll.
- *Diagnostics:* ErrorLens shows errors and warnings only; spelling issues are hints, so they never flood ErrorLens.
- *Trust and agents:* untrusted files open in a Restricted window, no automatic tasks, Claude harness and dev container sessions on, read-only git and test/lint commands auto-approved, Claude Code in a panel tab.
## Terminal Icons
Two causes, both fixed on 2026-09-26:
1. **Wrong font family name**
	Windows registers the font as `IosevkaTerm NFM` (also `NF` and `NFP`), listed with `System.Drawing.Text.InstalledFontCollection`. The setting used `IosevkaTerm Nerd Font Mono`, which does not match a registered family, so VS Code fell back to a font without Nerd glyphs.
2. **The setting was wiped** by the Sync incident above.
Also cleaned up: `starship init powershell` ran twice in the PowerShell profile (one line removed), and the Windows `starship.toml` was the older untuned copy. It is now the WSL version (exit status, command duration, shell level, jobs, 500 ms scan timeout). `starship print-config` parses it cleanly.
## Environments on Windows
- *Miniconda:* base stays at `C:\Users\anant\miniconda3` (0.99 GB), but new envs and the package cache go to `D:\Apps\Miniconda\envs` and `D:\Apps\Miniconda\pkgs` (set by `envs_dirs`/`pkgs_dirs` in `~\.condarc`; the `D:\conda` path in [[Installations]] and earlier versions of this note never existed). Live envs on 2026-10-12: `base`, `csci-4521` and `jupyter-base`. CSCI 5304's env is a project-local prefix at `CSCI 5304\.conda\csci-5304`, so it does not show in `conda env list`. Channels are conda-forge only with strict priority; Anaconda's `defaults` channels were removed from both `.condarc` files because conda 26 blocks them until their Terms of Service are accepted. `auto_activate` is off (every PowerShell used to start inside `base`), and `changeps1` is off because Starship shows the env.
- *`jupyter-base`:* Python 3.12.14, ipykernel, ipywidgets, numpy 2.5.3, pandas 3.0.6, pyarrow, scipy, scikit-learn 1.9.1, matplotlib, seaborn. Spec at `D:\Apps\Miniconda\specs\jupyter-base.yml`, re-exported 2026-10-12 with the `conda: export jupyter-base spec` task command; all nine packages confirmed live.
- *uv:* standalone 0.12.19 in `~\.local\bin` (Astral installer), now first on the user PATH ahead of `D:\Apps\Hermes\bin`, so `uv self update` works and uv no longer depends on the Hermes bundle.
- *Course mapping:* `python-envs.pythonProjects` maps CSCI 5304 (conda), CSCI 4521's `Code` subfolder (conda, env `csci-4521`) and CSCI 4511W's practice `Code` folder (`.venv`). CSCI 4521 was added 2026-10-12.
> [!NOTE]
> CSCI 5304's `environment.yml` channel line was changed from `defaults` to `conda-forge` plus `nodefaults` on 2026-10-12. The existing `.conda\csci-5304` env was built before the change and was not rebuilt; the edit only matters at the next rebuild.

## PowerShell Profiles and Terminal Default
- *Profiles:* `D:\_Anant\20_Progress\Documents\PowerShell\Microsoft.PowerShell_profile.ps1` (PowerShell 7, created 2026-10-12; it did not exist before, so `pwsh` had no Starship, UTF-8 or `vscode-env` hook) and `...\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` (5.1). Both hold the same content: Starship, zoxide, UTF-8 output, and the `TERM_PROGRAM -eq 'vscode'` guarded dot-source of `~/.config/vscode-env/init.ps1`.
- *Default shell:* `pwsh` (PowerShell 7) in both Windows Terminal (`defaultProfile` is the `PowerShell` GUID `{574e775e-4f2a-5b96-ac1e-a2962a402336}`) and VS Code (`terminal.integrated.defaultProfile.windows` is `PowerShell`). This follows the Dell rebuild's decision D5. Windows PowerShell 5.1 stays available as a second profile.
- *Not confirmed:* that VS Code's `PowerShell` name resolves to `pwsh.exe` was not observed in a live GUI terminal. Check with `$PSVersionTable.PSVersion` in a new integrated terminal; both shells were tested with `TERM_PROGRAM=vscode` and print the `env | home | .vscode/env.ps1 loaded` block.
- *Git pager:* `~\.gitconfig` sets `core.pager = delta`, `interactive.diffFilter = delta --color-only` and a `[delta]` block (navigate, side-by-side, line-numbers), the same as WSL minus its merge and diff lines.
- *uv:* `C:\Users\anant\.local\bin\uv.exe` (0.12.19) is first on PATH; `D:\Apps\Hermes\bin\uv.exe` is second and harmless. No pip shadow copy.
- *CLI tools:* fzf, fd, bat, delta and zoxide, all with default configuration. Listed in [[Installations]].

## Failures Found on This Laptop
Logs go back to 2026-09-21; workspace history to 2026-09-19.
1. **WSL home opened as a Windows path, three times**
	Found in `workspaceStorage\<hash>\workspace.json`: `file://wsl.localhost/Ubuntu-24.04/home/anant_gupta` on 2026-09-19 19:33, 2026-09-21 10:42 and 12:59, before the first correct `vscode-remote://wsl+ubuntu-24.04/...` at 14:14. `Ctrl+Alt+W` opens WSL correctly.
2. **CSCI 4061 dev container would not launch**
	Dev Containers log, 2026-09-24 04:51: `failed to connect to the docker API at npipe:////./pipe/dockerDesktopLinuxEngine`. Docker Desktop was not running (auto-start is off by choice).
3. **Pylance crashed in the home workspace**
	37,012 files enumerated, then exit codes `3221226091` / `1073807364` and `Pylance has crashed 5 times in the last 3 minutes`. Fixed by `python.analysis.exclude`.
4. **Test discovery failed in CSCI 5304 and CSCI 4511W**
	`No Python environment found for project`. Fixed by `python-envs.pythonProjects` in user settings.
5. **Conda only half wired**
	`Conda environment manager is not available`. `python.condaPath` is now set, and `conda init` exists in the Windows PowerShell 5.1 profile.
6. **Scattered interpreters**
	Miniconda base, two uv CPythons, a `~\.local\bin` shim, per-project envs. Now hidden from Jupyter except named envs; uv owns project venvs.
7. **Copilot 403** while the student entitlement is broken.
8. **Ruff config resolution errors in miniconda** (2026-09-24 23:24). CPython's `Tools\i18n\.ruff.toml` extends a file conda does not ship. Fixed by `ruff.exclude`; verified 2 errors to 0 against the bundled Ruff 0.16.9 server.
9. **Settings Sync replaced local settings** (2026-09-25/26). See the incident section.
### Terminal Environment and Home Workspace
Every VS Code terminal on Windows loads `~/.config/vscode-env/init.ps1` from the PowerShell profile, then the folder's `.vscode/env.ps1`. The home folder has its own (`~/.vscode/env.ps1`: space, Jarvis and The Plan, agent memory files, tooling, `~\Scripts` on PATH) and privacy settings (`~/.vscode/settings.json`). Other folders get the default until you run `env: create workspace environment`. Design, test results and timings: [[VS Code - Terminal Environments]].
### MCP and Secrets
Global MCP servers come from `~/.config/mcp/mcp.json` via `sync-mcp.ps1`. Claude Code denies reads of secret files on every drive, `~/.config/git/ignore` keeps them out of every repo, and the dotenv extension cloaks them on screen. Details and the six-month pre-mortem: [[VS Code - MCP and Secrets]].
## Trust Layout
- *Trusted parents:* `D:\_Anant\20_Progress\Documents` (vaults) and `D:\_Anant\10_Areas\UMN\Classes` (course code).
- *Home:* `C:\Users\anant` stays trusted for Claude Code home sessions.
- *Landing zone:* third-party clones go to WSL `~/projects/scratch`.
## Remaining on Windows
- Profiles, once there is more than one kind of Windows work.