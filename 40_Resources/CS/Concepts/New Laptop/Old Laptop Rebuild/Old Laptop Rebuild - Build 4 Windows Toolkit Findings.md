---
type: note
status: seedling
created: 2026-10-11
updated: 2026-10-13
course: Life
track:
  - laptop
  - windows
tags:
  - note
  - laptop
  - terminal
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]]"
  - "[[Old Laptop Rebuild - Build 1 WSL Findings]]"
  - "[[Installations]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - Terminal Environments]]"
  - "[[Old Laptop Rebuild - Windows Prompts (Build 3 C Drive Cleanup and Build 4 Terminal Parity)]]"
next: "Phase 4: user runs the Dell scripts in README order (10, 11, 20, 99, 04-admin-remove, 99) and pastes the outputs; then Phase 5 catalog and guide"
---
# Old Laptop Rebuild - Build 4 Windows Toolkit Findings

## One-Line Answer
==Phase 1 (read-only audit) and the Phase 2 design are done and nothing has been changed on either laptop: the Dell has no PowerShell 7, Starship, Nerd Font or shell tools on Windows, 13 of its 17 comparable WSL configs are reconstructions that differ from the Acer's real ones, Build 3 has not yet changed anything, and 12 decisions are waiting for the user before any script is written.==

## Phase 1: Dell, Windows side (live 2026-10-11)
| Item | Live value |
|---|---|
| Host | `DESKTOP-3VBG0JH`, user `C:\Users\Anant Gupta`, Windows PowerShell 5.1.26100, no `pwsh` |
| Drives | C: 39.53 GiB free (Build 3 baseline 39.58), D: 363.91 GiB free |
| Pagefile | `C:\pagefile.sys` 26,030 MB (peak 1,246 MB); configured `d:\pagefile.sys 0 0` that does not exist |
| Windows Terminal | 1.24.12741.0; default profile Windows PowerShell; `profiles.defaults` empty; no scheme, no font; Ubuntu profile named `Ubuntu` (guid `a2e4d0f9-...`); user `actions` use `User.*` ids |
| Fonts | Cascadia Code and Cascadia Mono only; no Iosevka or Nerd font |
| Git | 2.52.0, global: `core.autocrlf=false`, `pull.rebase=true`, `init.defaultbranch=main`, `windows.appendatomically=false`, identity, 8 WSL `safe.directory` entries; no `push.autoSetupRemote`, `fetch.prune`, `rerere` or pager settings. `~\.config\git\ignore` exists (not yet compared to the Acer's) |
| Present tools | gh 2.89.0, rg 15.1.0, jq 1.8.2, ffmpeg 8.1.2, Node 22.16.0 (`C:\Program Files\nodejs`), npm 10.9.2, Python 3.13.5, uv 0.11.26 (`C:\Python313\Scripts`), opam, choco 2.4.3, Docker CLI 29.1.3, claude 2.1.296, codex 0.160.0 (npm), VS Code, Cursor, Kiro, wt, winget 1.29.380 |
| Absent | pwsh, starship, zoxide, fzf, fd, bat, delta, lazygit, yazi, 7z/NanaZip, pnpm, bun, conda (not on PATH), agy, tailscale (correct) |
| npm globals | `@openai/codex` 0.160.0, `firecrawl-cli` 1.19.21, `mcp-remote` 0.2.1, `openclaw` 2026.3.13, `opencode-ai` 1.18.31; npm cache `D:\npm-cache` |
| User env vars | `OLLAMA_MODELS=D:\AI\ollama-models`, `OLLAMA_CONTEXT_LENGTH`, `OLLAMA_ORIGINS`, Obsidian and Jarvis URL/key variables, `GITHUB_PERSONAL_ACCESS_TOKEN` (names only, values never read), `HERMES_*`. Not set: `STARSHIP_CONFIG`, `YAZI_CONFIG_HOME`, `UV_CACHE_DIR`, `PIP_CACHE_DIR`, `PLAYWRIGHT_BROWSERS_PATH` (Build 3 owns the cache ones) |
| Profile | `D:\Users\_Anant\10_Areas\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1` (secret scan clean): opam env block, Kiro integration, `New-PyEnv`. The PowerShell 7 profile would be `...\Documents\PowerShell\Microsoft.PowerShell_profile.ps1` (absent). `C:\Users\Anant Gupta\Documents\...` resolves to the same file (redirect). |
| PATH | Machine PATH starts `C:\Python313\Scripts`, `C:\Python313`, `C:\Program Files\nodejs`, chocolatey; user PATH has `~\.local\bin`. Machine entries come first, so a standalone `uv` in `~\.local\bin` would lose to the pip `uv.exe` until that one is removed. |
| Execution policy | `LocalMachine=RemoteSigned`, others undefined |
| winget | no `Iosevka` package exists; `jesseduffield.lazygit` id not found (case differs); `Anthropic.ClaudeCode` 2.1.292 exists (the native install is 2.1.296, newer); `OpenAI.Codex` 0.161.0 exists |

### Build 3 status (what it has changed so far)
Nothing. The pagefile is unchanged, `Local\npm-cache` (stale), the 2026-09-20 quarantine folder, Microsoft 365, WinRAR, Malwarebytes, Respondus, Dell Optimizer, MongoDB Shell and the two suspicious `.exe` files in the profile root are all still present. The only new artifact is `D:\WSL\ops\windows\diag-pagefile-bitlocker.ps1`. Scheduled tasks `ConversationCapture-Backfill-WSL` and the Jarvis tasks are still Ready. This build does not touch any of these.

## Phase 1: Acer, Windows side (from the snapshot, not live)
| Item | Value | Source |
|---|---|---|
| User / vault | `C:\Users\anant`, `D:\_Anant\20_Progress\Documents\Jarvis` | prompt, VS Code - Windows |
| Windows Terminal | font `IosevkaTerm Nerd Font`, scheme `One Half Dark`, opacity 85, acrylic, cursor `#98C379`, scrollbar hidden, default profile Windows PowerShell, built-in-id keybindings, Ubuntu profile `Ubuntu-24.04` (guid `a136339a-...`), two Miniconda profiles under `C:\Users\anant\miniconda3`, a PowerShell Core profile (guid `574e775e-4f2a-5b96-ac1e-a2962a402336`) | `terminal/settings.json` |
| Git (Windows) | only `windows.appendAtomically=false`, `core.longpaths`, `core.fsmonitor`, `core.untrackedCache` (identity redacted) | `windows/home/.gitconfig` |
| Config files | `starship.toml` (2,260 bytes, SHA `9EF71378...`), `~\.config\git\ignore` (8 patterns, SHA `546B86DB...`) | `hashes-windows.txt` |
| winget export | Git, GitHub CLI, Starship, Node LTS, Tailscale, ripgrep, jq, Yazi, NanaZip, Docker, Ollama, VS Code, Cursor, Claude, Antigravity, Miniconda, FFmpeg, PowerShell, Windows Terminal, WSL, WizTree, Revo, plus apps. Not in the export: Kiro, fzf, fd, bat, delta, zoxide, pnpm, uv (standalone), Claude Code and Codex (not winget) | `winget-export.json` |
| Versions | **Unknown.** `VERSIONS.md` and `MANIFEST.md` do not exist and the export carries no versions. The Dell run's lock file becomes the reference. | snapshot folder |

## Phase 1: WSL config parity (Dell vs Acer snapshot, SHA-256, live)
| File | Result | Note |
|---|---|---|
| `starship.toml` | DIFF | Dell is a reconstruction; Acer's LF copy wins |
| `yazi/yazi.toml`, `init.lua`, `keymap.toml`, `theme.toml` | DIFF (4) | Dell theme uses flavor `tokyo-night`, Acer `tokyonight-storm` |
| `yazi/plugins/*` (3 plugins, 10 files) | MATCH | |
| `yazi/package.toml`, `flavors/tokyonight-storm.yazi/*` (7 files) | MISSING | Dell has `flavors/tokyo-night.yazi` and a 25-folder `plugins-src/` clone instead |
| `atuin/config.toml`, `sesh/sesh.toml`, `gh-dash/config.yml`, `lazygit/config.yml`, `ncdu/config`, `git/ignore`, `.tmux.conf` | DIFF (7) | all carry "reconstructed from notes" headers except git ignore |
| `.gitconfig` | DIFF | handled by merge, see D7 |
| `/etc/wsl.conf` | DIFF (cosmetic) | Dell writes `enabled = true`, Acer `enabled=true`; same meaning; left alone |
| Total | 13 differ as the prompt said, 4 match (plugin Lua files), 3 Yazi items missing, plus 1 cosmetic | |

Other WSL facts: the Dell `.bashrc` block is `# >>> JARVIS_WSL_ENV_BLOCK (Build 1: from notes, not from Acer) >>>` (guards on each tool, a direnv-verified flag, a browser fallback flag) while the Acer block is plain (`# JARVIS_WSL_ENV_BLOCK`, unguarded, adds nvm and cargo lines inside the block); the tmux plugin list is **identical** (tpm, resurrect, continuum, tmux-fzf, tmux-agent-status, tmux-handlr), the Acer's `.tmux.conf` points at `agent-ntfy-notify.sh` which exists on the Dell. Tool versions with a login-style PATH: starship 1.26.0, yazi 26.9.1, lazygit 0.65.1, delta 0.20.1, zoxide 0.10.0, atuin 18.23.0, sesh 2.32.0, chafa 1.18.3, pwsh 7.6.4, uv 0.12.23, node 24.14.1, pnpm 10.33.2, claude 2.1.296, codex 0.162.1, kiro-cli 2.27.1, agy 1.3.3, semgrep 1.179.0, fd 9.0.0, bat 0.24.0, ncdu 1.19, direnv 2.32.1. Missing: ruff, shfmt, shellcheck, conda. Ollama 0.18.3 is `active` under systemd, listens on `127.0.0.1:11434`, and only has cloud models (`kimi-k2.6:cloud`, `kimi-k2.5:cloud`, `qwen3-coder-next:cloud`; `~/.ollama` is 8 KB).

## Contradictions with the vault and prompt (live wins)
1. Windows `ollama --version` prints `0.18.3` plus "client version is 0.24.0": the server answering on 11434 is the WSL one (mirrored networking), so the Windows Ollama server is not the one running and `D:\AI\ollama-models` is not being served.
2. The prompt says the Acer has no PowerShell profile. [[VS Code - Windows]] and [[VS Code - Terminal Environments]] describe an Acer profile (Starship, conda init, VS Code hook) under `D:\_Anant\20_Progress\Documents\WindowsPowerShell\`. The snapshot looked under the redirected `C:\Users\anant\Documents` and recorded "not present", which is probably a false negative. The Acer preflight must resolve the profile path with `[Environment]::GetFolderPath('MyDocuments')` and report what it finds before the apply script touches it.
3. The Acer Windows Terminal says font `IosevkaTerm Nerd Font`, but [[VS Code - Windows]] proved Windows registers the Mono build as `IosevkaTerm NFM` (and also `NF`, `NFP`), and that `IosevkaTerm Nerd Font Mono` did not match in VS Code.
4. The prompt asks for a winget font package. None exists (`winget search iosevka` returns nothing); the font comes from the Nerd Fonts GitHub release v3.5.1.
5. `.wslconfig`, `wsl.conf` content: `wsl.conf` differs only by spaces around `=`; not part of the 13.
6. [[Installations]] lists Bun 1.3.14 in WSL; `bun` is not on a non-interactive PATH (the `.bashrc` sets `BUN_INSTALL`, binary not confirmed). Not used by this build.
7. Build 1 told us the Dell `.bashrc` holds a plaintext Firecrawl export (still present, line redacted in every read here). Rotation is still open from Build 1; the catalog must never print that line.

## Phase 2: design

### Toolkit manifest (proposed membership)
Policies: `install` = install if missing (adopt the installed version into the lock), `latest` = bring to current, `verify` = check only, `absent` = must not exist.
| Tool | Why it is there | Machines | Method and policy |
|---|---|---|---|
| PowerShell 7 | modern shell, profile and Terminal target | both | winget `Microsoft.PowerShell`, install (UAC) |
| Windows Terminal | shell host | both | winget `Microsoft.WindowsTerminal`, verify (1.24 stays) |
| Starship 1.26.0 | prompt, same version as both WSLs | both | winget `Starship.Starship`, install (MSI, UAC) |
| IosevkaTerm Nerd Font Mono | glyph font, registers as "IosevkaTerm NFM" | both | Nerd Fonts v3.5.1 `IosevkaTerm.tar.xz` (87.5 MB, SHA-256 `054a4a36...`), Mono TTFs only, per-user, checksum verified |
| zoxide 0.10.0 | directory jumping, same as WSL | both | winget `ajeetdsouza.zoxide`, install (portable) |
| fzf, fd, bat | fuzzy finder, file find, file viewer | both | winget `junegunn.fzf`, `sharkdp.fd`, `sharkdp.bat`, install (portable) |
| NanaZip | one archive tool; replaces WinRAR (Build 3 removes it) | both | winget `M2Team.NanaZip`, install (MSIX) |
| Git | version control | both | winget `Git.Git`, latest (2.52.0 to 2.55.0.5, UAC) |
| delta 0.20.1 | git pager, same as Dell WSL | both | winget `dandavison.delta`, install (portable) |
| GitHub CLI | GitHub auth and credential helper | both | winget `GitHub.cli`, latest (2.89.0 to 2.102.0) |
| ripgrep, jq, FFmpeg | search, JSON, media | both | present on the Dell; winget `BurntSushi.ripgrep.MSVC`, `jqlang.jq`, `Gyan.FFmpeg`, install (adopt installed) |
| Node.js LTS + Corepack | runtime, `npx` for MCP | both | winget `OpenJS.NodeJS.LTS` (24.20.0), see D1 |
| pnpm | JS package manager | both | winget `pnpm.pnpm`, install (portable) |
| uv | Python tool and project manager | both | standalone installer, pinned URL, see D2 |
| Python (system 3.13.5), Miniconda, opam, Chocolatey | existing, not managed | dell | verify only (see D3) |
| Claude Code (native) | primary agent CLI | both | verify (`~\.local\bin`) |
| Codex CLI | OpenAI agent CLI | both | npm `@openai/codex`, pinned in lock, install if missing |
| Claude Desktop, Cursor, Antigravity, VS Code, Docker Desktop, Ollama | AI platforms and runtimes | both | winget ids `Anthropic.Claude`, `Anysphere.Cursor`, `Google.Antigravity`, `Microsoft.VisualStudioCode`, `Docker.DockerDesktop`, `Ollama.Ollama`, verify only |
| Kiro | IDE agent | dell | `Amazon.Kiro`, verify (not in the Acer export) |
| mcp-remote, npx, uvx | MCP launch prerequisites | both | npm global `mcp-remote` install; `npx` from Node; `uvx` from uv |
| MCP launch check | every configured server's command resolves (names only) | both | verify |
| Tailscale | tailnet SSH | acer | `Tailscale.Tailscale` verify only on the Acer; `absent` on the Dell; never installed by a script |
| Yazi, lazygit, tmux, atuin, sesh, ncdu | WSL-first tier | catalog only | not installed on Windows |

Catalog-only: everything else found on the machine (winget list, npm globals, `~/.local/bin`, apt manual, uv tools, cargo) is listed as "unmanifested" with the same fields minus the use-case text.

### Decisions I need from you
| # | Decision | Recommendation and reason |
|---|---|---|
| D1 | Node 22 or LTS on the Dell | **LTS (24.x).** Acer is on LTS and both WSL installs are on 24.14. It means uninstalling `OpenJS.NodeJS.22` (UAC) then installing LTS as one hand-run step after the verify passes; npm globals in `AppData\Roaming\npm` survive. Node 22 stays until you say go. |
| D2 | uv | **Standalone installer, pinned URL (0.12.19 to match the Acer), then remove the pip copy** (`python -m pip uninstall uv`, one command, you run it). The pip `uv.exe` is in the machine PATH, which wins over `~\.local\bin`, so both cannot coexist. This is the one install that is not winget (you listed it). |
| D3 | Miniconda | **Leave it where it is** (`C:\Users\Anant Gupta\miniconda3`, 7.09 GiB), do not reinstall. The Acer's real pattern is base on C: and envs plus package cache on `D:\conda`; the Dell should follow it through `.condarc` later (Build 3 Tier B owns the 7 GiB). Not in this build's scripts. |
| D4 | `core.autocrlf` | **`input` on the Dell's Windows git and WSL** (and the Acer's Windows side). Everything here is LF (vault, WSL, configs). `input` never rewrites checkouts but normalizes CRLF to LF on commit, which stops PowerShell and Windows editors from committing CRLF. `false` (Acer WSL today) silently commits CRLF; `true` fights WSL checkouts. The Acer's WSL stays `false` unless you change it later. |
| D5 | Terminal scheme and font | **Scheme Tokyo Night Storm** (matches Starship palette, Yazi flavor `tokyonight-storm`, tmux), taken from the official folke/tokyonight extras and checked in Phase 3. **Font face `IosevkaTerm NFM`**, the name Windows registers, because the Acer's `IosevkaTerm Nerd Font` and your `IosevkaTerm Nerd Font Mono` can fail to match. Opacity 85, acrylic, cursor `#98C379`, hidden scrollbar and keybindings kept from the Acer. Default profile becomes PowerShell 7. |
| D6 | Profile contents | Exactly your list inside one managed block (UTF-8 output, `STARSHIP_CONFIG`, Starship once, zoxide once, VS Code hook behind `Test-Path`). The block is inserted or replaced between markers; nothing outside it is touched, so the Dell keeps opam, Kiro and `New-PyEnv`. Nothing added. |
| D7 | Which WSL configs are replaced | **All 13 plus the 3 missing Yazi items**, with backups. Two are merges, not replacements: `.gitconfig` keeps the Dell's `[user]`, `[credential]` and `[filter "lfs"]` and takes the Acer's delta, pager, merge and diff settings plus the Build 2 keys (via an include file); `gh-dash/config.yml` takes the Acer file but keeps the Dell's `repoPaths: {}`. `/etc/wsl.conf`, `.wslconfig` untouched. The Dell's old `flavors/tokyo-night.yazi` and the `plugins-src/` clone stay (listed in the report, removal is your call). |
| D8 | Ollama inside the Dell's WSL | **Stop and disable the service, keep the binary.** It holds `127.0.0.1:11434` for both sides under mirrored networking, blocks the Windows Ollama server that owns `D:\AI\ollama-models`, and has only cloud models. One hand-run `sudo systemctl disable --now ollama`. Not scripted. |
| D9 | PowerShell 7 in the Dell's WSL | **Keep** (user-space, 7.6.4, harmless); record it in the catalog. |
| D10 | ruff, shfmt, shellcheck in WSL | **Install all three, user-space, no sudo**: `uv tool install ruff`, shfmt and shellcheck release binaries with checksum into `~/.local/bin`. The VS Code extensions installed in Build 2 expect them. Added behind `--with-tools` in `30-wsl-config-parity.sh`. |
| D11 | Update policy | **Adopt, don't upgrade, except Git and GitHub CLI** (`latest`). Everything installed on the Dell is recorded into `toolkit.lock.json` as it is; the Acer run installs those versions. Windows Terminal stays on 1.24. |
| D12 | Bun, Yazi, lazygit on Windows | **No.** No Windows tool needs Bun; Yazi, lazygit, tmux, atuin, sesh and ncdu stay WSL-first (the Acer's installed Windows Yazi is left alone). |

### Scripts (all ASCII, rerunnable, `-DryRun`, logs in `D:\WSL\ops\windows\logs\`, results in `Windows Toolkit\results\<host>\`)
| Order | Script | Runs as | What it does |
|---|---|---|---|
| 1 | `00-preflight.ps1` | you, normal | read-only: machine and vault detection, manifest vs reality, plan, secret scan of every config it will write |
| 2 | `10-install-toolkit.ps1` | you, normal (UAC prompts appear for MSI installers, announced first) | installs per manifest, continues past a failed package, prints a summary table, records versions |
| 3 | `20-apply-configs.ps1` | you, normal | profiles (managed block), Starship config, Terminal merge, git settings, env vars, SHA-256 table, backups |
| 4 | `30-wsl-config-parity.sh` | you, inside WSL via `wsl -d Ubuntu -- bash` | the 13 replacements, 3 additions, report of `.bashrc` and tmux differences, `--with-tools` |
| 5 | `99-verify.ps1` | you, normal | manifest vs reality: versions, hashes, env vars, font registered, profile loads in a fresh shell, Starship renders, MCP commands resolve |
| 6 | `40-build-catalog.ps1` | you, normal | catalog Markdown and JSON for Windows and WSL |
No script needs an elevated PowerShell; the UAC consent prompts come from individual installers. Hand-run lines (separate): `pip uninstall uv`, Node 22 to LTS, `sudo systemctl disable --now ollama`, the one-time Terminal visual check.

### Catalog outline (Phase 5)
`Windows Toolkit\catalog\Tool Catalog - <host>.md` and `tool-catalog-<host>.json`: header (host, drives, generated time, manifest hash); per category a table with tool, version, path, drive, owner config, purpose, when to reach for it, key commands, where it runs; an "unmanifested" table; WSL section (apt manual, `~/.local/bin`, npm, uv tools, cargo); MCP servers by name with "command resolves"; config files with hashes. The authored note "Machine Toolkit - Tool Use Cases and Agent Guide" sits next to [[Installations]]: agent front page, then cards grouped by task.

### Acer plan (Phase 6)
The scripts are already in the vault. The run sheet gives: `00-preflight`, `10-install-toolkit` (installs the Dell's lock versions where winget has them), `20-apply-configs`, `99-verify`, `40-build-catalog`. It prints the Acer's profile path and content hash first (contradiction 2), keeps the existing profile outside the managed block, and never touches Tailscale (already on the Acer's Windows side, never added to its WSL). The Acer's WSL is not in scope except for the optional `30-` parity checks the run sheet may offer read-only.

## State-changing commands
None so far. Files created: this note only. Scratch audit scripts live in the session scratchpad.

## Errors and root causes
| Error | Root cause | Status |
|---|---|---|
| First WSL audit showed most tools "NOT FOUND" | `wsl.exe -- bash script` is non-interactive and does not load `~/.local/bin`, nvm or cargo | rerun with an explicit PATH; toolkit scripts set PATH themselves |
| Git Bash mangled `/mnt/c/...` path to `C:/Program Files/Git/mnt/...` | MSYS path conversion | run `wsl.exe` from PowerShell |
| 2026-10-12: Dell, `codex` CLI: `Error: daemon executable not found at C:\Users\Anant Gupta\.codex\packages\app-server-daemon\current\bin\codex.exe`, plus a Windows sandbox install that failed on every retry | Same C:-space cleanup that created the `codex-cleanup-quarantine-2026-09-20` folder (see [[C Drive Bloat - Failure Log and Prevention Rules]], failure #8) also redirected `.codex\packages` to `D:\Cache\codex\packages` via a directory junction, but the `app-server-daemon` package under that target was left with a populated `releases\` folder, a stale 0-byte `install.lock` (dated 2026-09-26), and no `current` pointer. The daemon binary and the Windows sandbox setup exe (`codex-windows-sandbox-setup.exe`) both live under `releases\<version>\`, reachable only through `current`, so both failed the same way regardless of retries. The separate npm-vendored `codex.exe` used for one-shot commands was unaffected, which is why `codex doctor` ran fine while the persistent daemon did not. | Fixed: removed the stale `install.lock`, created `current` as a directory junction to `releases\0.162.1-x86_64-pc-windows-msvc` (matching `auto-update-version`), confirmed via `codex app-server daemon start` and `codex doctor` that the background server now reports `running (persistent mode)`, `appServerVersion 0.162.1`. No admin, no reinstall, no file deleted other than the stale lock. |
| 2026-10-12: `agy` (Antigravity CLI) unrecognized on the Dell's Windows side | Antigravity the GUI app was installed (2.12.2, `%LOCALAPPDATA%\Programs\antigravity`) but outdated, and its CLI shim has never been created. Like VS Code and Cursor, Antigravity only writes a `resources\app\bin\agy(.cmd)` shim and puts it on PATH after the user runs "Install 'agy' command in PATH" from its own Command Palette (Ctrl+Shift+P) at least once; nothing in the installed tree ships that shim up front. | Partially fixed: `winget upgrade --id Google.Antigravity --exact` brought it to 2.22.0 (matches the Acer's export and the D12 "no Bun/Yazi/lazygit on Windows" tier's sibling decision to adopt installed versions). Still open: launch Antigravity once and run "Install 'agy' command in PATH" from the Command Palette; this step cannot be scripted since it is a one-time in-app action, not a filesystem change. |

## Resumed run, 2026-10-13: Phase 1 verification, decisions, Phase 3 build

### Decisions (answered 2026-10-13: "implement every D")
D1 to D6, D11 and D13 to D16 are implemented as recommended; D7 to D10 moved to Build 5 (E1 to E4); D12 stands. Extra scope the user approved: PSFzf as a manifest module (D13), bat and fd configs (D14), and one shared `_lib.ps1` plus `11-node-lts-swap.ps1` (the Node swap is a replacement, so it is a gated script of its own).

### Live changes since the 2026-10-11/12 audit
| Item | Audit | Live 2026-10-13 |
|---|---|---|
| C: / D: free | 39.5 / 363.9 GiB | 145.4 / 450.2 GiB (Build 3 done) |
| Cache variables | unset | all set (D:\Cache\...); npm cache is `D:\Cache\npm`, not `D:\npm-cache` |
| Windows Ollama | 0.24.0 | 0.40.3 at D:\Apps\Ollama; port 11434 still answered by the WSL 0.18.3 |
| Tailscale, PowerShell 7, Starship, font, zoxide, fzf, fd, bat, delta, NanaZip, pnpm | absent | still absent (as designed) |
| Dell Command Update | not checked | 5.7.0 installed |
| `C:\Users\Anant Gupta\AGENTS.md` | not checked | does not exist (pointer line target for Phase 5) |
| WSL configs vs Acer snapshot | 13 of 17 differ | catalog probe: 29 comparable files, 10 match, 12 differ, 7 missing |

### Contradictions logged (live machine won)
1. The Acer snapshot (10-11) is stale. Vault notes written 2026-10-12 say the Acer already has PowerShell 7 and 5.1 profiles (Starship, zoxide, UTF-8, VS Code hook), fzf, fd, bat, delta, zoxide, PSFzf, `%APPDATA%\bat\config`, `%APPDATA%\fd\ignore`, delta in its Windows `.gitconfig`, standalone uv 0.12.19 and VS Code on `D:\Apps`. The Acer run therefore starts with a read-only paste-back and keeps its own bat and fd files.
2. `VERSIONS.md` and `MANIFEST.md` exist in the snapshot (the 10-11 audit said they did not).
3. `04-admin-remove.ps1 -IncludePython` deletes `C:\Python313`, so the separate `pip uninstall uv` step in D2 is dropped.
4. winget portables may install without a PATH entry (Acer, 2026-10-12): `10` repairs it with a hard link in `WinGet\Links`.
5. The design guard `$env:STARSHIP_SHELL` would suppress the prompt in nested shells (the variable is inherited by child processes); the block uses a global PowerShell variable.
6. Font archive extracts to 27 TTFs, 379 MB (not the 60 MB estimate).
7. The Dell's Codex config carries a WSL path (`/mnt/c/.../node_repl`) that does not resolve on Windows; reported by `99-verify`, owned by Build 6.
8. `Md` is a built-in alias of `mkdir` in PowerShell, so a helper function with that name silently called `New-Item`.

### Files written (vault: `Old Laptop Rebuild\Windows Toolkit\`)
`toolkit.json` (47 entries), `_scripts\` (`_lib.ps1`, `00-preflight.ps1`, `10-install-toolkit.ps1`, `11-node-lts-swap.ps1`, `20-apply-configs.ps1`, `40-build-catalog.ps1`, `99-verify.ps1`, `README.md`), `configs\` (`starship.toml` and `git\ignore` byte-identical to the Acer's, SHA-256 `9EF71378...` and `546B86DB...`; `git\delta.gitconfig`; `powershell\managed-block.ps1`; `terminal\toolkit-fragment.json`; `bat\config`; `fd\ignore`), empty `results\` and `catalog\`.

### Checks run in Phase 3 (all read-only or on copies)
| Check | Result |
|---|---|
| Parse every script with `Parser::ParseFile`; ASCII-only byte scan | 7 of 7 clean, 0 non-ASCII bytes |
| `00-preflight.ps1` (real run) | exit 0; 16 install/upgrade actions planned, 2 PENDING (Python, Chocolatey), 1 MANUAL (Node 22) |
| `10-install-toolkit.ps1 -DryRun`, `20-apply-configs.ps1 -DryRun`, `11-node-lts-swap.ps1`, `40-build-catalog.ps1 -DryRun` | all exit 0 |
| Terminal merge on a copy of the Dell settings and on the Acer snapshot settings | scheme, font, defaults, keybindings, pwsh profile, Ubuntu rename all applied; Acer conda profiles kept; second run UNCHANGED |
| Profile block on the Dell profile copy | opam, Kiro and `New-PyEnv` kept; second run UNCHANGED |
| Profile block on an Acer-style profile (BOM, CRLF, duplicate Starship/zoxide/PSFzf/VS Code hook) | duplicates commented with `# [toolkit-superseded]`, BOM and CRLF kept, result parses clean |
| Profile with two statements on one line | MANUAL, file untouched |
| Managed block executed in clean Windows PowerShell 5.1 | loads, UTF-8 set, no error |
| uv 0.12.19 installer | downloaded to scratch, SHA-256 `F44CF877...` pinned, `UV_NO_MODIFY_PATH` supported |
| Font archive | SHA-256 matches the published `SHA-256.txt`; bsdtar wildcard extracts exactly 27 Mono TTFs |
| `99-verify.ps1` before any install | runs end to end; 47 expected FAILs (nothing installed yet), 24 MCP entries read by name only |

### Errors found while building, with root cause
| Error | Root cause | Fix |
|---|---|---|
| `Resolve-Cmd` returned `C` for every tool | a one-element array returned from a function is unrolled to a string, then `[0]` took its first character | wrap in `@()` and cast |
| "Argument types do not match" writing result JSON | `@(<List[object]>)` inside an `[ordered]` literal | use `.ToArray()` |
| winget version always empty for `--id` queries | with `--id`, winget prints a single-space table, so splitting on two spaces found nothing | regex `Id\s+Version` |
| Backup file name too long | flattened full path in the leaf name | 8-char hash plus leaf name |
| `-Only a,b` matched nothing | `powershell -File` passes the comma list as one string | split on commas |
| `Md` helper created directories | alias precedence over functions | renamed `MdCell` |
| WSL probe returned no hashes | a probed tool read stdin, which was the piped script itself | `</dev/null` on each probe |
| `Contains` overload error reading MCP JSON | `Dictionary` has `ContainsKey`, not `Contains` | test `Keys -contains` |
| Stderr "#< CLIXML" counted as a profile error | PowerShell wraps progress in CLIXML on redirected stderr | strip it, keep real error text |

## Phase 4: Dell run review (2026-10-13, 00:52 to 01:06)

### State-changing commands the user ran, with results
| Time | Command | Result |
|---|---|---|
| 00:52 | `10-install-toolkit.ps1` | exit 0. Installed: PowerShell 7.6.6, Starship 1.26.0, IosevkaTerm NFM (27 TTFs, 379.2 MB, SHA-256 verified), zoxide 0.10.0, fzf 0.74.4, PSFzf 2.7.12 (5.1 and 7), fd 10.5.0, bat 0.26.1, delta 0.20.1, NanaZip 7.0.1843, pnpm 12.11.2, standalone uv 0.12.19. Upgraded: Git 2.52.0 to 2.55.0, GitHub CLI 2.89.0 to 2.102.0. Node left MANUAL |
| 01:00 | `11-node-lts-swap.ps1 -Apply` (twice) | first stopped on 12 running `node.exe` (children of `cmd`, started by MCP servers); second reached the uninstall and failed, see errors |
| 01:02 | `20-apply-configs.ps1` | exit 0. 11 CHANGED: starship.toml, git ignore, delta include, bat, fd, both profiles (backup of the Dell profile in `D:\Backup\Toolkit\20261013-010211\`), Terminal merge, 10 git settings, `STARSHIP_CONFIG`, `TOOLKIT_VAULT_ROOT`. Build 3 cache variables untouched and correct |
| 01:04 | `99-verify.ps1 -WriteLock` | 97 PASS, 3 FAIL, 3 PENDING, 1 WARN; lock not written |
| 01:06 | `04-admin-remove.ps1 -IncludePython` (elevated, dry run) | printed `STOP: no standalone uv found yet` |

Confirmed good by the run: all hashes match the Acer's (starship `9EF71378...`, ignore `546B86DB...`), both profiles load with one Starship init (5.1 in 2.5 s because of opam, 7 in 1.3 s), `starship prompt` renders, font family registered in a fresh process, Terminal shows the new scheme and font (user confirmed visually).

### Errors found in the run, with root cause
| Error | Root cause | Fix |
|---|---|---|
| Node 22 uninstall: winget exit 1603 | the event log says MSI error 1730, "You must be an Administrator to remove this application"; the MSI was installed per machine and the non-elevated removal is refused | `11 -Apply` now requires an elevated shell and refuses early otherwise |
| `uv-python` reported "present 3.13.5" | `uv python list` also lists system interpreters; 3.13.5 is the Chocolatey `C:\Python313`. uv's own folder holds only 3.11.15, so removing Python would have left no 3.13 | detection now counts only folders in `uv python dir`; `10 -Only uv-python` installs 3.13 |
| `git-pager` FAIL | `git config --global --get` does not follow includes; the pager is set in `delta.gitconfig`. Delta is active (`git config --get core.pager` returns `delta`) | check uses `--includes` |
| 04 dry run: "no standalone uv found" | `Get-Command uv` returns only the first match, the pip copy being removed, so the gate could never pass | script patched (backup `D:\WSL\ops\windows\archive\04-admin-remove.ps1.bak-20261013`): `Get-Command -All` plus the standalone folder, and a uv-managed Python 3.13 is now required |
| (found by review) Machine PATH rewrite | `04` wrote the expanded PATH back with `SetEnvironmentVariable`, which turns a REG_EXPAND_SZ value with `%SystemRoot%` entries into plain text | rewrites the raw registry value as ExpandString and saves the old value |
| (found by review) wrong uv would win after Python is gone | Hermes' uv 0.11.28 is entry 2 of the user PATH, the standalone uv entry 11 | new `path-order` step in `20` moves `~\.local\bin` to the front of the user PATH, old value saved |
| Syncthing conflict copy of a result JSON | two quick writes of the same `latest` file; byte-identical | removed |

### Machine difference noted by the user
Terminal font face: the Dell uses `IosevkaTerm NFM` (Mono build); the Acer uses `IosevkaTerm Nerd Font` (normal build). Recorded as a DIFF with this reason for the parity matrix; no script change was made for it. Open for Phase 6: whether the Acer run keeps its own face.

### Phase 4 second round (01:46 to 01:56)
| Step | Result |
|---|---|
| `10 -Only uv-python` | uv-managed CPython 3.13.15 installed (21 MB download) |
| `20-apply-configs.ps1` | everything UNCHANGED except the Terminal merge and `path-order`: `~\.local\bin` is now first on the user PATH (old value in `D:\Backup\Toolkit\20261013-014706\user-path-before.txt`) |
| `11-node-lts-swap.ps1 -Apply` (elevated) | Node 22.16.0 removed, Node 24.20.0 installed, npm 11.19.0, all 5 npm globals survived |
| `04-admin-remove.ps1 -IncludePython` dry run, then `-Apply` (elevated) | Python 3.13.5 and Chocolatey gone; Machine PATH rewritten from the raw value (still ExpandString, 5 `%` entries kept, saved to `logs\machine-path-before-20261013-0152.txt`); C: free 144.76 to 145.20 GiB |
| `99-verify.ps1 -WriteLock` | 102 PASS, 1 WARN (`node_repl`, Build 6), 12 INFO, 1 FAIL (Terminal scheme); lock not written |

**Terminal scheme, decided 2026-10-13:** the live file had `One Half Dark` at 01:47:06 and again at 01:47:44, after the apply script set Tokyo Night Storm twice; something in the Terminal Settings screen saved it back. D5 is revised by the user: **One Half Dark is the standard on both laptops** (identical to the Acer, so no difference); Tokyo Night Storm stays defined in `schemes` as an extra choice. `toolkit-fragment.json`, `20-apply-configs.ps1` and `99-verify.ps1` now read the scheme name from the fragment.

**Result at 01:57:** the user ran `99-verify.ps1 -WriteLock` again: 104 PASS, 0 FAIL, 1 WARN (`node_repl`, Build 6); `toolkit.lock.json` written.

**Terminal font, revised by the user 2026-10-13:** the Dell's face becomes `IosevkaTerm Nerd Font`, identical to the Acer (the Mono set stays installed for VS Code, which uses `IosevkaTerm NFM`). Facts read from the font files with `GlyphTypeface`: `IosevkaTermNerdFont-*.ttf` has Windows family `IosevkaTerm NF` and typographic family `IosevkaTerm Nerd Font` (the name Windows Terminal matches); the Mono set has `IosevkaTerm NFM` and `IosevkaTerm Nerd Font Mono`. The same verified archive holds both sets (27 files each). `10` now installs both sets and skips files already present; `toolkit-fragment.json`, `20` and `99` read the face from the fragment.

Known quirk: the Terminal step compares JSON text, so it can report CHANGED when Windows Terminal reorders keys in its own file. It is harmless.

## Left for Build 5 and later
VS Code settings and extensions, the MCP registry and `sync-mcp.ps1`, Claude Code settings, Miniconda relocation, the pagefile, and all Build 3 items.
