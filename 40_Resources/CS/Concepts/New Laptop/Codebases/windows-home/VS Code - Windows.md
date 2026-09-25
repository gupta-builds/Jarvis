---
type: concept
status: sprout
created: 2026-09-24
updated: 2026-09-24
course: Life
track:
  - laptop
  - vscode
tags:
  - concept
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - WSL]]"
  - "[[Installations]]"
  - "[[New Laptop Setup]]"
next: "Turn on Settings Sync from the Acer only, then write the Install Loop note"
---
# VS Code - Windows
## One-Line Answer
==The Windows side owns the one user settings layer every VS Code window inherits, including WSL windows, so this base sets editor behavior everywhere; it does not own code that runs inside WSL.== The shared systems are explained in [[VS Code Professional Setup]]; this note records what is configured on Windows and what went wrong before it was.
## What "Windows Home" Means Here
`C:\Users\anant` is opened as a folder in VS Code and is where Claude Code home-directory sessions run, so the home directory is a workspace in its own right. One collision to remember: `C:\Users\anant\.vscode\` is VS Code's extensions and `argv.json` folder, and it would also be read as this workspace's `.vscode/`. User-wide settings go in `%APPDATA%\Code\User\settings.json`, never in `~\.vscode\`.
## File Map
| Path | What lives there |
|---|---|
| `D:\Apps\Microsoft VS Code\` | the app (user install, `code` CLI in `bin\`) |
| `~\.vscode\argv.json` | runtime flags |
| `~\.vscode\extensions\` | Windows-side extensions |
| `%APPDATA%\Code\User\settings.json` | user settings, inherited by WSL windows |
| `%APPDATA%\Code\User\keybindings.json` | custom `Ctrl+Alt` layer |
| `%APPDATA%\Code\User\mcp.json` | user MCP servers (Context7, GitHub, Firecrawl; keys via inputs) |
| `%APPDATA%\Code\User\workspaceStorage\<hash>\workspace.json` | one file per folder ever opened, with its URI |
| `%APPDATA%\Code\logs\<session>\` | per-session logs, the first place to look when something breaks |
| `%APPDATA%\Code\User-backup-20260924\` | pre-change backup of settings, MCP, snippets and the extension list |
## Applied Configuration, 2026-09-24
==The user settings now carry a full developer baseline: format-on-save with one formatter per language, Ruff fix and import sorting on save, pytest on, Pylance kept out of `AppData` and conda trees, git hygiene, trust and task safety, and the agent settings.==
- *Editor:* format on save, sticky scroll, no minimap, whitespace at boundaries, active bracket guides, linked editing, file nesting, no preview tabs, no startup editor.
- *Files:* autosave on focus change, trim trailing whitespace and final newlines, LF for new files, caches hidden (`__pycache__`, `.pytest_cache`, `.ruff_cache`, `.mypy_cache`), `.venv`/`node_modules`/`target`/`.conda` excluded from watching and search.
- *Formatters:* Ruff for Python (plus `source.fixAll.ruff` and `source.organizeImports.ruff`), Biome for JS/TS/JSON, cpptools for C/C++, rust-analyzer, shell-format, Even Better TOML, Red Hat YAML. Markdown does not format on save and wraps lines.
- *Python:* Python Environments extension on (it uses `uv` for venvs when available), pytest enabled, `python.analysis.exclude` adds `**/AppData`, `**/miniconda3`, `**/.conda` to Pylance's defaults.
- *Git:* autofetch with prune, fetch on pull, no sync confirmation, commit protection on `main` and `master`, whitespace-sensitive diffs, GitLens code lens off.
- *Terminal:* Iosevka Nerd Font, PowerShell default (the `Ubuntu-24.04 (WSL)` profile is auto-detected in the `+` menu), 10,000 lines of scrollback, sticky scroll.
- *Trust:* files outside a trusted folder open in a new Restricted window; `task.allowAutomaticTasks: off` so no repo runs a task on open unless turned on for that repo.
- *Agents:* Claude harness on (`github.copilot.chat.claudeAgent.enabled`), Dev Container sessions on, session archive nudge and taskbar badge on, terminal auto-approve for read-only git, `uv run pytest|ruff`, and `pnpm|npm test|run lint`, Claude Code in a panel tab.
- *Sync:* `settingsSync.keybindingsPerPlatform: false`, ready for when Sync is turned on.
Every setting ID was checked against the 1.139 install or the extension's own `package.json` before writing.
## Extensions (36)
The same developer set is installed on the WSL side (see [[VS Code - WSL]]).

| Area | Extensions |
|---|---|
| Agents | `anthropic.claude-code`, `openai.chatgpt` (Codex, pulls in `openai.codex-audio`) |
| Python and notebooks | `ms-python.python`, `vscode-pylance`, `debugpy`, `vscode-python-envs`, `charliermarsh.ruff`, `ms-toolsai.jupyter` (+ keymap, renderers, cell tags, slideshow) |
| JS/TS | `biomejs.biome`, `dbaeumer.vscode-eslint` |
| C/C++ | `ms-vscode.cpptools` pack (`cmake-tools`, `cpp-devtools`, themes) |
| Git and GitHub | `eamodio.gitlens`, `github.vscode-pull-request-github`, `github.vscode-github-actions` |
| Config and data formats | `redhat.vscode-yaml`, `tamasfe.even-better-toml`, `davidanson.vscode-markdownlint`, `mechatroner.rainbow-csv`, `editorconfig.editorconfig` |
| Shell | `timonwong.shellcheck`, `foxundermoon.shell-format`, `ms-vscode.powershell` |
| Environments | `ms-vscode-remote.remote-wsl`, `ms-vscode-remote.remote-containers`, `ms-azuretools.vscode-containers`, `ms-azuretools.vscode-docker` |
| Diagnostics | `usernamehw.errorlens` |
## Failures Found on This Laptop
Logs only go back to the session of 2026-09-21 13:56 (older ones were rotated), and workspace history goes back to 2026-09-19. Each failure below was found from those files, not assumed.
1. **WSL home opened as a Windows path, three times**
	*How it was found:* every folder VS Code opens gets a `workspaceStorage\<hash>\workspace.json` holding its URI. Three of them hold `file://wsl.localhost/Ubuntu-24.04/home/anant_gupta` (2026-09-19 19:33, 2026-09-21 10:42 and 12:59) before the first correct `vscode-remote://wsl+ubuntu-24.04/home/anant_gupta` at 2026-09-21 14:14. A `file://wsl.localhost` window runs Windows extensions and Windows git over the 9P share. `Ctrl+Alt+W` now opens WSL the right way.
2. **CSCI 4061 dev container would not launch**
	*Cause:* the Dev Containers log from 2026-09-24 04:51 ends with `failed to connect to the docker API at npipe:////./pipe/dockerDesktopLinuxEngine` and `Exit code 1`. The engine was not running. Docker Desktop's auto-start is off by choice, so it has to be started before any container work. With it running, `docker` works from WSL (29.8.0, verified with a test container).
3. **Pylance crashed in the home workspace**
	With `C:\Users\anant` open, Pylance enumerated 37,012 "source files" (all of `AppData`, miniconda, tool installs), logged `Enumeration of workspace source files is taking longer than 10 seconds` repeatedly, then crashed with exit codes `3221226091` and `1073807364` in every open window at once on 2026-09-22 00:56, ending with `Pylance has crashed 5 times in the last 3 minutes. Pylance will not be restarted.` The new `python.analysis.exclude` removes those trees from indexing.
4. **Test discovery failed in two course projects**
	`Python.log`: `Failed to create adapter ... No Python environment found for project` for CSCI 5304 and CSCI 4511W. Both folders set `python.defaultInterpreterPath` in their `.vscode/settings.json`, a legacy setting the Python Environments extension does not use to map a project to an environment. *Fix in each folder:* `Python Envs: Set Project Environment` (or `Ctrl+Alt+E`) once, which records the mapping.
5. **Conda is only half wired**
	`Python Environments.log` repeats `Conda environment manager is not available, using default conda activation paths`, and its shell check shows `conda init` has not run for bash, zsh, fish or pwsh. CSCI 5304 works around this with a hand-built terminal profile that runs the conda hook. The conda env itself (`.conda\csci-5304`) is discovered and resolved correctly.
6. **Python interpreters are scattered**
	Discovered: miniconda base (`C:\Users\anant\miniconda3`, first `python` on PATH), uv-managed CPython 3.12.14 and 3.14.7 under `%APPDATA%\uv\python\`, a `python3.14.exe` shim in `~\.local\bin`, and per-project `.venv` and `.conda` envs. The home workspace resolved to uv's 3.14.7. `uv` itself runs from the Hermes bundle (`D:\Apps\Hermes\bin\uv.exe`).
7. **Copilot 403**
	`not licensed to use Copilot` while the student entitlement is broken. Nothing to fix in VS Code.

8. **Ruff failed to resolve config inside miniconda (2026-09-24 23:24)**
	Right after Ruff was installed, its language server walked the home workspace and hit `c:\Users\anant\miniconda3\Tools\i18n\.ruff.toml` (and the same file in `pkgs\python-3.14.7...`). That file comes from CPython's source tree and `extend`s a parent `.ruff.toml` that conda never ships, so it logged `Failed to load extended configuration ... (os error 2)`. Harmless, since the workspace still registered, but noise every time the home folder opens. *Fix:* user-level `ruff.exclude` for `AppData`, `miniconda3`, `.conda` plus Ruff's usual skips. *Verified* by starting the bundled Ruff 0.16.9 server on `C:\Users\anant` with the same settings: 2 ERROR lines without the exclude, 0 with it, and no miniconda paths touched.
## Trust Layout
- *Trusted parents:* `D:\_Anant\20_Progress\Documents` (the two vaults) and `D:\_Anant\10_Areas\UMN\Classes` (course code).
- *Home:* `C:\Users\anant` stays trusted because Claude Code home sessions run there.
- *Landing zone:* third-party clones go to WSL `~/projects/scratch`.
Trust is granted from the Restricted Mode banner or `Workspaces: Manage Workspace Trust`, not from settings.json.
## Remaining Steps on Windows
1. Settings Sync on, from the Acer only (the Dell's first sign-in would merge its 28 extensions in).
2. Set the project environment once in CSCI 5304 and CSCI 4511W.
3. Decide on conda: run `conda init powershell` so the conda manager works, or keep the per-project terminal profile.
4. Profiles, once there is more than one kind of Windows work.
5. Write the Install Loop note (to create) from this baseline.