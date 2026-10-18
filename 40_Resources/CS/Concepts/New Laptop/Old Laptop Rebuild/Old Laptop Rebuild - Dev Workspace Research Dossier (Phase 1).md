---
type: note
status: seed
created: 2026-10-17
updated: 2026-10-17
course: Life
track:
  - laptop
  - wsl
  - vscode
tags:
  - note
  - laptop
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Installations]]"
  - "[[Ubuntu - WSL]]"
  - "[[WSL Toolkit Config Reference]]"
  - "[[Machine Toolkit - Tool Use Cases and Agent Guide]]"
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - WSL]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - Install Loop]]"
  - "[[VS Code - MCP and Secrets]]"
  - "[[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]]"
  - "[[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]]"
next: "Finish the open research list at the bottom, then start Phase 2 (implement in second-brain-claudekit and write the cross-repo SOP). Nothing in any repo or config has been changed by this phase."
---
# Old Laptop Rebuild - Dev Workspace Research Dossier (Phase 1)

## One-Line Answer
==The Dell's toolchain and the Jarvis notes agree far more than they disagree; the problems that matter are a handful of config keys that do not do what the notes assume (Claude `autoCompact`, EditorConfig versus trim-on-save, Acer paths inside synced VS Code settings), three corrupted files in the first repo-contract attempt, and a use-case documentation gap for about 25 tools.==

## Scope, method, status
Phase 1 of a two-phase job: research only, no repo or config edits. Evidence comes from three layers, each used for what it is best at.
- **Jarvis notes** (treated as confirmed working): about 20 notes read, listed under Sources.
- **Live Dell state** (`dell-wsl`, host `DESKTOP-3VBG0JH`, 2026-10-17): versions, files, settings, extension manifests, MCP health, timers.
- **Official sources only** for claims about how a tool behaves: vendor docs and READMEs, the tool's own `--help`, and the `package.json` and README that ship inside each installed extension (version-exact). Third-party blogs were not used.

Status: about 70 percent. Open items are listed at the end.

## Where each package is recorded in Jarvis (answers "are these documented?")
Three separate questions get blurred under "documented", so they are split here.

| Category | Meaning | Tools |
|---|---|---|
| A. Recorded as installed, with a config where one exists | In [[Installations]] and the build notes | git, git-lfs, jq, ripgrep, fd, bat, fzf, gh, gh-dash, wslu, nvm/node, pnpm, uv, rustup/cargo, kiro-cli, codex, claude, agy, starship, yazi, tmux (+6 plugins), win32yank, ncdu, semgrep, delta, lazygit, zoxide, sesh, atuin, chafa, direnv, bubblewrap, socat, unison, bun, cargo-watch, code2prompt, graphify, specify-cli, supabase, vercel, clerk, context7, git-filter-repo, miniconda, ruff, shellcheck, shfmt, Tailscale |
| B. Recorded as installed, but no "when and how to use it" card in [[Machine Toolkit - Tool Use Cases and Agent Guide]] | The guide covers shells, starship, zoxide, fzf, fd, bat, rg, jq, git, delta, lazygit, yazi, tmux, sesh, atuin, ncdu, node/pnpm, uv, conda, the AI CLIs, docker, ollama, tailscale, winget | gh-dash, direnv, chafa, bun, semgrep, ruff, shellcheck, shfmt, win32yank, wslu, unison, bubblewrap, socat, git-filter-repo, cargo-watch, code2prompt, graphify, specify-cli, supabase, vercel, clerk, context7, agy (one line only), VS Code extensions as a set |
| C. Present on the Dell WSL but not in the Jarvis WSL inventory at all | Found with `apt-mark showmanual`, `ls ~/.local/bin`, `uv tool list` | apt: `pre-commit`, `ocaml` (4.14.1), `tree`, `librdkafka-dev`, `libsasl2-dev`, `libssl-dev`, `pkg-config`, `python3.12-venv`, `zstd`. Binaries: `q`, `qchat`, `kiro-cli-chat`, `kiro-cli-term` (extra binaries from the Kiro installer), `numpy-config`, `f2py`, `agy.*.old` (stale), `wsl-browser`. The Windows Dell catalog mentions pre-commit; the WSL inventory does not |

Reading: nothing is lost. Category A is accurate. B is the real documentation gap for Phase 2. C needs a decision per item (keep and record, or remove after approval).

## Dell facts verified live
| Item | Value |
|---|---|
| Host, user | `DESKTOP-3VBG0JH`, `anant_gupta`, Ubuntu 24.04, kernel 6.18.54.1 (WSL 3.0.3.0) |
| `.wslconfig` | mirrored, firewall true, memory 20GB, processors 10, swap 8GB at `D:\WSL\swap.vhdx`, `vmIdleTimeout=-1`, `[general] instanceIdleTimeout=-1`, `[experimental] autoMemoryReclaim=gradual`, `sparseVhd=true` |
| `/etc/wsl.conf` | systemd true, default user, interop true, appendWindowsPath true |
| Tailscale | 1.104.1 in WSL only (`dell-wsl` 100.94.129.113); Acer `gupta-builds` on Windows only |
| VS Code | 1.142.0, server commit `6d62b1d5`, `.vscode-server` 5.5 GB |
| Core CLI versions | tmux 3.8, node 24.21.0, pnpm 12.4.2, uv 0.12.23, ruff 0.17.0, shellcheck 0.11.0, shfmt 3.14.1, semgrep 1.179.0, claude 2.1.302, codex 0.162.1, gh 2.102.0, starship 1.26.0, atuin 18.23.0, sesh 2.33.0, lazygit 0.66.1, delta 0.20.1, fzf 0.74.5, fd 10.5.0, rg 15.2.0, bat 0.26.1, zoxide 0.10.0, chafa 1.18.3, direnv 2.32.1, bun 1.3.14, pwsh 7.6.4 |
| Timers | `claude-capture-backfill` (30 min), `wsl-clean` (Sun), `wsl-watch` (daily) |
| Docker | `docker` not on PATH in this WSL right now (Docker Desktop not running or integration not exposing it) |
| MCP (Claude, from `/tmp`) | jarvis, jarvis-fs, graphify connected; the-plan timed out; pencil ENOENT; gbrain connection closed |

## VS Code on the Dell: what is actually configured
**Layers** (later overrides earlier: default, user, remote/machine, workspace): Windows user `settings.json` (synced, inherited by WSL windows except machine-scoped keys), WSL Machine settings, home workspace `~/.vscode/settings.json`, and per-repo `.vscode/`.

**Windows user settings, summarized** (`C:\Users\Anant Gupta\AppData\Roaming\Code\User\settings.json`): format on save, sticky scroll, no minimap, wrap on; autosave on focus change, trim trailing whitespace, final newline, `files.eol` LF; Ruff for Python (fix and organize on save), Biome for JS/TS/JSON, rust-analyzer, shell-format, Even Better TOML, Red Hat YAML, Markdown format-on-save off; Python Environments with uv as default manager and three `pythonProjects` entries; git autofetch, prune, protected main/master, GitLens code lens off; PowerShell default terminal, `IosevkaTerm NFM`, `VSCODE_WORKSPACE` env for both OS sides; ErrorLens error and warning only; cSpell diagnostics as hints; untrusted files in a new window, automatic tasks off; Claude harness and dev container agent sessions on, terminal auto-approve for read-only git and `uv run pytest|ruff` and `pnpm|npm test|run lint`; Remote-SSH platform and four default extensions.

**WSL Machine settings** (`~/.vscode-server/data/Machine/settings.json`): bash default terminal, `VSCODE_WORKSPACE`, `python-envs.terminal.autoActivationType` = `shellStartup` (the notes say `command`, see F-12), conda path, interpreter `/usr/bin/python3`, Jupyter hides system Python and base conda, watcher excludes, Semgrep experimental language server on with excludes, agent sandbox off, Claude `initialPermissionMode default`, `allowDangerouslySkipPermissions false`.

**Other user files**: `keybindings.json` (Ctrl+Alt layer), `tasks.json` (env and MCP sync tasks), `mcp.json`, a profiles folder, `snippets`.

Every setting key in these files was checked: all exist in VS Code 1.142 (core, the git extension, or the Agents/sessions bundle) or in an installed extension's schema. No typos or retired keys.

### Extension inventory (Dell)
Active WSL set is 33, not 34 (GitLens is flagged obsolete). Windows has 39 extensions. "Always-on" means the manifest declares `onStartupFinished` or `*`, so it loads in every window of that host regardless of project.

| Extension | Ver | Runs | Always-on | MB | Role here | Official notes that matter |
|---|---|---|---|---|---|---|
| anthropic.claude-code | 2.1.301 | both | yes | 267 | Primary agent panel | `initialPermissionMode` and `claudeProcessWrapper` are machine scope; permission mode is read from user settings only |
| openai.chatgpt (+ codex-audio) | 26.1007.21434 | both (audio is UI) | yes | 919 | Codex IDE panel | Largest extension; docs at developers.openai.com/codex/ide |
| semgrep.semgrep | 1.17.0 | WSL | yes | 373 | Static analysis | README: scans changed lines by default (`onlyGitDirty` true); experimental language server only on Semgrep's recommendation |
| github.vscode-pull-request-github | 0.170.0 | both | yes | 9 | PR review | Needs GitHub sign-in per host; default remotes origin and upstream |
| streetsidesoftware.code-spell-checker | 4.10.0 | both | yes | 8 | Spelling | `cSpell.diagnosticLevel` Hint keeps ErrorLens quiet |
| bradlc.vscode-tailwindcss | 0.16.0 | both | yes | 6 | Tailwind | Loads everywhere, only useful in Tailwind repos |
| dotenv.dotenv-vscode | 1.5.8 | both | yes (`*`) | 3 | Secret cloaking | Auto-cloak default on; peek hover can reveal values |
| biomejs.biome, dbaeumer.vscode-eslint, gruntfuggly.todo-tree, editorconfig.editorconfig, usernamehw.errorlens | various | both | yes | under 2 each | JS lint/format, TODO tree, EditorConfig, inline diagnostics | See F-4 (EditorConfig) and F-7 (Todo Tree path) |
| ms-python.python, vscode-pylance, debugpy, vscode-python-envs | 2026.10.0, 2026.4.1, 2026.6.0, 1.40.0 | both | lazy | 57, 88, 42, 39 | Python | `python-envs` `alwaysUseUv` default true; `terminal.autoActivationType` values command, shellStartup, off |
| charliermarsh.ruff | 2026.88.0 | both | lazy | 25 | Lint and format | Ships ruff 0.17.1; resolves the binary from the environment, then PATH, then bundled |
| ms-toolsai.jupyter, jupyter-keymap, jupyter-renderers | 2025.9.1, 1.1.2, 1.3.0 | both | lazy | 19, 0, 24 | Notebooks | The Jupyter pack pulls cell-tags and slideshow if reinstalled (removed on purpose earlier) |
| ms-toolsai.datawrangler | 1.24.2 | both | lazy | 54 | DataFrame viewer | Needs a Python kernel |
| timonwong.shellcheck | 0.48.1 | both | lazy | 29 | Shell lint | Bundles native ShellCheck, runs on type, reads `.shellcheckrc`, `executablePath` overrides |
| foxundermoon.shell-format | 7.2.8 | both | lazy | 0 | Shell format | Depends on shfmt; settings `shellformat.path` and `shellformat.flag` |
| tamasfe.even-better-toml, redhat.vscode-yaml, davidanson.vscode-markdownlint, mechatroner.rainbow-csv, anweber.vscode-httpyac, ms-azuretools.vscode-containers, ms-playwright.playwright, github.vscode-github-actions, rust-lang.rust-analyzer | various | both (rust-analyzer WSL only) | lazy | small | Formats and tools | github-actions does not support remote repositories (github.dev, vscode.dev) |
| Windows only (UI) | | | | | ms-vscode-remote.remote-wsl, remote-ssh, remote-ssh-edit, remote-containers, ms-vscode.remote-explorer, remote-server (all `extensionKind ui`), ms-vscode.powershell, yzhang.markdown-all-in-one | markdown-all-in-one is on the Dell Windows side and in no note |
| eamodio.gitlens | 19.4.0 | | | | Flagged obsolete in `.obsolete` on both sides | See F-6 |

Disk: 2306 MB of active extensions on WSL. Stale older versions of claude-code (2.1.224, 2.1.215) and chatgpt (26.803, 26.602) still sit on disk, roughly 190 MB.

## Findings register
Severity: H = a documented behavior is probably not happening; M = drift or conflict worth fixing; L = informational.

| ID | Sev | Finding | Evidence | Source |
|---|---|---|---|---|
| F-1 | H | `autoCompact` is not a documented Claude Code setting. The documented key is `autoCompactEnabled`. The repo `.claude/settings.json` has `autoCompact:false` (and CLAUDE.md states autoCompact is disabled); the user file has `autoCompact:true`. Neither is in the official reference, so the repo rule may be inert. Test with `/config` before relying on it | `jq` of both files; zero hits for `autoCompact` in the settings reference | code.claude.com/docs/en/settings-reference |
| F-2 | H | All three `.vscode/*.json` files from the earlier Gemini run fail `jq` (unquoted keys and values; `"$s"` became `""`). VS Code will not load them. Its PASS checks only covered `.claude/settings.json` and the sync manifest | `jq empty` errors on line 2 of each | VS Code tasks doc: a single `command` string goes to the shell unchanged |
| F-3 | H | Task "ClaudeKit Sync Test (Dry Run)" runs `sync-all.sh --list`. The script has no `--list`; the argument is treated as an entry name, nothing matches, it exits 0. A false-positive check | `sync-all.sh` lines 44 to 76 | script source |
| F-4 | H | EditorConfig versus trim-on-save. The golden `.editorconfig` sets `trim_trailing_whitespace=false` for Markdown, but the user setting `files.trimTrailingWhitespace=true` wins (documented known issue 153), so Markdown hard line breaks get trimmed | extension README "Known Issues"; user settings | editorconfig-vscode README |
| F-5 | H | The Dell `.bashrc` sources `~/.mcp.env` into every interactive shell, so the MCP keys reach every process. The Acer fixed this with `_ai_run` wrappers and the notes say to port it | `.bashrc` lines 149 to 151 | [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]] |
| F-6 | M | GitLens 19.4.0 is in `.obsolete` on WSL and Windows, so it is effectively not installed, yet notes list it for both sides and a setting configures it | `.obsolete` files, `extensions.json` (33 entries) | VS Code extension docs |
| F-7 | M | Synced Windows settings carry Acer paths: `todo-tree.ripgrep.ripgrep = C:\Users\anant\.local\bin\rg.exe` (does not exist; the Dell user is `Anant Gupta`; the scope is window, so WSL windows inherit a Windows path), `python.defaultInterpreterPath` Windows `.venv\Scripts`, `python-envs.pythonProjects` under `D:\_Anant` (the Dell uses `D:\Users\_Anant`), `remote.SSH.*` aliases | `ls /mnt/c/Users`; extension schema scope | Build 2 findings already flagged these keys |
| F-8 | M | Semgrep experimental language server is on (Machine settings). The extension README says experimental options are only for use on Semgrep's recommendation. The extension is also 373 MB and startup-activated | README, `package.json` | semgrep extension README |
| F-9 | M | `shfmt` default style reports a diff on `60_Claude/scripts/sync-all.sh` (`>>` redirect spacing). A format-check task would fail on existing code, and reformatting touches a script that runs on a schedule | `shfmt -d` | shfmt docs |
| F-10 | M | Extension set drift: WSL has 33 active (notes say 34); Windows has `yzhang.markdown-all-in-one` (undocumented) and lacks the GitLens the notes expect | CLI lists versus [[VS Code - Install Loop]] | n/a |
| F-11 | M | 16 extensions load at startup in every window. Official levers: Disable or Enable (Workspace), and Profiles tied to a folder. Extensions are not synced into remote windows | `activationEvents` scan | VS Code Extension Marketplace and Profiles docs |
| F-12 | M | The WSL Machine file sets `python-envs.terminal.autoActivationType` to `shellStartup`; [[VS Code - Terminal Environments]] and [[VS Code Modifications]] say it is `command` and that `shellStartup` was never enabled | file content versus notes | n/a |
| F-13 | M | MCP: `the-plan` times out (127.0.0.1:27124), `pencil` points at a missing `.cursor-server` path, `gbrain` connection closed. Only jarvis, jarvis-fs and graphify are healthy from WSL | `claude mcp list` from `/tmp` | Claude Code MCP doc |
| F-14 | M | Tailscale SSH policy is `check`; the default check period is 12 hours, after which a Remote-SSH reconnect can stall on a browser URL | Tailscale SSH docs | tailscale.com/docs/features/tailscale-ssh |
| F-15 | M | The Gemini SOP differs from the existing mechanism: `63-repo-contract-apply.sh` already adds `.editorconfig` and a minimal per-stack `extensions.json` to clean repos only, dry-run by default. The SOP also recommends blanket pnpm pins (your audit says pnpm 12 needs `allowBuilds` and only real pnpm repos get the pin) and skipped the repo write contract | scripts and write-contract | local notes |
| F-16 | M | The `.semgrepignore` written by Gemini excludes `.claude/`, `.codex/`, `.agents/` (the hook scripts) from scanning | file content | n/a |
| F-17 | L | Ruff has three sources of truth: extension bundled 0.17.1, `uv tool` 0.17.0, Acer 0.17.1 | version checks | ruff extension README |
| F-18 | L | tmux 3.8 adds floating panes, `mouse on` by default and new default bindings including prefix `g` and `T`; the golden config overrides `g` (lazygit) and `T` (sesh picker) | CHANGES 3.8 | tmux CHANGES |
| F-19 | L | The repo has `.codex/hooks.json` and hooks but no `.codex/config.toml`; repo-level Codex behavior is read from `.codex/config.toml` per the Codex manual | repo tree; manual | learn.chatgpt.com/docs/codex-manual.md |
| F-20 | L | Atuin has only 97 interactive history rows over 12 days, so shell history cannot prove which packages are used; most tool use happens inside agent sessions | atuin DB (counts only) | n/a |

### Corrections to my own earlier statements
- "Undocumented tools" was shorthand. Most are recorded as installs; the gap is the missing use card (category B) plus the category C items.
- The Semgrep setting names in the Gemini file are valid (`semgrep.useExperimentalLS` and `semgrep.scan.exclude` exist in the extension schema). Only the file around them was broken.

## What the official sources confirm (no action needed)
- `.wslconfig` sections are correct on the Dell: `[wsl2]` for memory, processors, swap, swapFile, vmIdleTimeout, networkingMode, firewall; `[general] instanceIdleTimeout` (`-1` disables); `[experimental]` for `autoMemoryReclaim` and `sparseVhd` (new VHDs only). `localhostForwarding` is ignored under mirrored mode. Source: learn.microsoft.com/windows/wsl/wsl-config.
- Tailscale SSH servers run only on Linux (and macOS open source), which is why Tailscale lives in the Dell's WSL. Running Tailscale on both the Windows host and inside WSL on the same machine breaks WSL traffic; the Acer-Windows plus Dell-WSL split avoids that. Tailscale SSH distributes host keys itself, and any OS user on the client can connect. Source: tailscale.com/docs/features/tailscale-ssh and /docs/install/windows/wsl2.
- VS Code Remote-SSH: `remote.SSH.defaultExtensions` installs listed extensions on every host; `remote.extensionKind` can force UI or workspace placement; extensions are not synced into remote windows. Source: code.visualstudio.com/docs/remote/ssh and /docs/configure/extensions/extension-marketplace.
- VS Code tasks run non-login and non-interactive, so shell startup files (nvm) are not read; the recommended fix is to make commands resolvable without startup scripts. A single `command` string reaches the shell unchanged, so quoting is the author's job. Source: code.visualstudio.com/docs/debugtest/tasks.
- Claude Code hooks: exit 0 means no objection, exit 2 blocks, other codes are non-blocking errors; the repo's `; exit 0` suffix on `pwsh` hooks is consistent with that. `claudeMdExcludes`, `enabledMcpjsonServers`, `effortLevel`, `modelSettings`, `statusLine` and `enabledPlugins` are documented keys. Source: code.claude.com/docs/en (hooks-guide, settings-reference, memory, mcp).
- Golden tool configs: every checked key exists in current docs: atuin (`auto_sync`, `update_check`, `secrets_filter`, `history_filter`, `filter_mode`, `filter_mode_shell_up_key_binding`, `enter_accept`), starship (`scan_timeout`, `command_timeout`, `ignore_base`), sesh (`sort_order`, `dir_length`, `default_session`, `[[session]]`, `preview_command`), lazygit `git.diffRenderers`, fzf `--bash` (recent versions only), ripgrep `RIPGREP_CONFIG_PATH`, fd global `~/.config/fd/ignore`, bat `bat cache --build` after adding themes, delta with `merge.conflictStyle=zdiff3`, tmux-continuum 15 minute save interval and restore on server start only, tmux-resurrect `prefix Ctrl-s` and `Ctrl-r`.
- Core VS Code settings used here all exist in 1.142, including the `chat.*` and `sessions.*` ones (found in the Agents/sessions bundle).

## Tool reference (official source per tool; use-case card status)
Card status: A = card exists in the Machine Toolkit guide, B = no card yet (Phase 2).

| Tool | Official source | One-line use here | Gotcha to record | Card |
|---|---|---|---|---|
| direnv 2.32.1 | github.com/direnv/direnv (README, man/direnv.1.md) | Load per-folder env from `.envrc` | `.envrc` must be `direnv allow`ed; the hook in `.bashrc` is guarded by `~/.config/wsl/direnv-verified`; never add a hook before the binary exists | B |
| zoxide 0.10.0 | github.com/ajeetdsouza/zoxide | `z` jumps; sesh ranks by it | Only learns directories you visit | A |
| ncdu 1.19 | dev.yorhel.nl/ncdu/man | Disk usage browser | `d` deletes; configured with `-e`, dark, confirm-quit | A |
| chafa 1.18.3 | hpjansson.org/chafa | Yazi image preview fallback | Yazi needs 1.16 or newer; apt 1.14 is too old | B |
| bun 1.3.14 | bun.sh docs | Runtime and package manager (gbrain and gstack prerequisite) | Not the project default; pnpm via Corepack is | B |
| pre-commit (apt) | pre-commit.com | Git hook framework | Category C; no repo contract mentions it | B |
| cargo-watch 8.5.3 | github.com/watchexec/cargo-watch | Rerun cargo on change | README points to Watchexec as the general tool | B |
| code2prompt 4.2.0 | github.com/mufeedvh/code2prompt | Pack a repo into one prompt | Built from `~/projects/code2prompt`, not crates.io | B |
| specify-cli 0.16.5 | github.com/github/spec-kit | Spec-driven development scaffolding | Installed via `uv tool` | B |
| graphify (`graphifyy` 0.9.69) | PyPI metadata: github.com/Graphify-Labs/graphify | Code and vault knowledge graph, MCP server | Package name has a double y; confirm it is the intended project | B |
| git-filter-repo | github.com/newren/git-filter-repo | History rewrite | Destructive by design; use on a fresh clone | B |
| gh-dash 4.26.1 | github.com/dlvhdr/gh-dash | Multi-repo PR and issue TUI | `repoPaths` is machine-specific; needs a TTY | B |
| win32yank 0.1.1 | github.com/equalsraf/win32yank | tmux copy to the Windows clipboard | Has no `--version` or `--help` | B |
| wslu 3.2.3 | github.com/wslutilities/wslu | `wslview` browser handoff | Was broken by `WSLInterop-late` before WSL 3.0.3.0; works now | B |
| unison 2.54.0 | github.com/bcpierce00/unison | Jarvis mirror sync engine | Run through `sync-all.sh`, never directly | B |
| bubblewrap, socat | github.com/containers/bubblewrap | Prerequisites for the VS Code agent sandbox | Sandbox is off | B |
| semgrep 1.179.0 | semgrep.dev docs | Static analysis | Per-repo `.semgrepignore`; the extension has its own scan settings | B |
| ruff 0.17.0, shellcheck 0.11.0, shfmt 3.14.1 | docs.astral.sh/ruff, github.com/koalaman/shellcheck, github.com/mvdan/sh | Lint and format Python and shell | shfmt reads `.editorconfig` unless flags are given | B |
| kiro-cli 2.27.1, agy 1.3.3 | kiro.dev/docs/cli, antigravity.google | Other agent CLIs | Binary names differ from install URLs; Kiro also installs `q` and `qchat` | partial |
| supabase 2.101.0, vercel 54.9.1, @clerk/agent-toolkit, context7-mcp | supabase.com/docs/guides/cli, vercel.com/docs/cli, github.com/upstash/context7 | Project CLIs and MCP helpers | Record which projects need them before keeping | B |
| tmux 3.8 and 6 plugins, sesh, atuin, yazi, lazygit, delta, starship, fzf, fd, rg, bat | see [[WSL Toolkit Config Reference]] | Daily terminal layer | Golden configs, all keys verified | A |

## Decisions already made by you
- The dossier lives in `New Laptop/Old Laptop Rebuild/` (this note).
- Phase 1 changes nothing in any repo, config or extension.
- Extension policy: 34 is not a target. The aim is a lean set; research should show what can be per-workspace or per-profile.
- Jarvis notes are treated as correct and working; official sources decide how tools behave.

## Open research before Phase 1 closes
1. Per-extension official docs for the lazy group not yet read line by line: Pylance (settings that interact with Ruff), cSpell, YAML, rust-analyzer, httpYAC, Playwright, Containers, Data Wrangler, Rainbow CSV, Tailwind, Jupyter, GitLens.
2. Official docs for Yazi (`yazi.toml`, plugins, image preview), Docker Desktop WSL integration, Kiro CLI, Antigravity CLI, Supabase, Vercel, Clerk, Context7, Bun and pre-commit.
3. Jarvis notes not yet read: Build 3, Build 4 and 4b, Windows Toolkit catalog and `toolkit.json`, WSL Session Briefing, Jarvis MCP and REST API Setup, New Laptop Setup, the internship and windows-home directives.
4. Decide, from evidence, a lean extension tiering: always-on core, per-language, per-repo.
5. Decide how to resolve F-1, F-4, F-5 and F-7 in Phase 2 without touching synced Windows settings unless asked.

## Sources
Jarvis: [[Installations]], [[Ubuntu - WSL]], [[WSL Toolkit Config Reference]], [[Machine Toolkit - Tool Use Cases and Agent Guide]], [[VS Code Professional Setup]], [[VS Code - WSL]], [[VS Code - Windows]], [[VS Code - Install Loop]], [[VS Code - MCP and Secrets]], [[VS Code - Terminal Environments]], [[VS Code Modifications]], [[Acer Live State — 2026-09-16]], the Build 1, 2, 5 and 5c findings, [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]], [[Codebases - Two-Laptop SSH Workflow - Locked Decisions and Postmortem]].
Official: learn.microsoft.com/windows/wsl/wsl-config; code.visualstudio.com/docs/remote/ssh, /docs/debugtest/tasks, /docs/configure/profiles, /docs/configure/extensions/extension-marketplace; tailscale.com/docs/features/tailscale-ssh and /docs/install/windows/wsl2; github.com/tmux/tmux (CHANGES 3.8); code.claude.com/docs/en (settings-reference, hooks-guide, memory, mcp, vs-code); learn.chatgpt.com/docs/codex-manual.md; READMEs and docs for lazygit, sesh, fzf, delta, bat, ripgrep, fd, uv, Corepack, the tmux plugins, direnv, zoxide, ncdu, spec-kit, git-filter-repo, atuin and starship; and the `package.json` and README bundled in each installed VS Code extension.
