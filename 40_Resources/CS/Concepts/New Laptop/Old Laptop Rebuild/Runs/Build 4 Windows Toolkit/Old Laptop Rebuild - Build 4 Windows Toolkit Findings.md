---
type: note
status: sprout
created: 2026-10-11
updated: 2026-10-17
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
  - "[[Old Laptop Rebuild - Runs Index]]"
  - "[[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]]"
  - "[[Old Laptop Rebuild - Build 1 WSL Findings]]"
  - "[[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]"
  - "[[Machine Toolkit - Tool Use Cases and Agent Guide]]"
  - "[[Installations]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - Terminal Environments]]"
next: "Closed. Open: Codex node_repl path and the Windows VS Code, MCP and Claude Code wiring (Build 6); remaining pnpm-pin repos (per repo); Firecrawl revocation at the provider."
---
# Old Laptop Rebuild - Build 4 Windows Toolkit Findings

## Verified outcome (checked 2026-10-17)
**Purpose.** Make the Dell's Windows side match the Acer's for daily work, through one manifest and repeatable scripts: PowerShell 7 and Windows Terminal, Starship, the Nerd Font, the shell and search tools, Git and GitHub CLI, runtimes (Node LTS, standalone uv), shared configs with SHA-256 checks, a catalog of everything installed, an authored guide for AI agents, and a way to repeat it on the Acer.
**What ran.** Phases 1 to 4 on 2026-10-11 to 2026-10-13 (audit, design, build, Dell run), then **Build 4b** on 2026-10-14 to 2026-10-17 (the Phase 5 to 7 remainder plus the Dell leftovers and the Tailscale/SSH decisions), and the Acer's Parts 0 to 3 on 2026-10-15.
**Result.** `99-verify.ps1 -WriteLock` gave **104 PASS, 0 FAIL, 1 WARN** and wrote `toolkit.lock.json` (2026-10-13). The catalog (46 tools, 24 MCP entries, 34 WSL tools) and the agent guide exist, `Installations` is current, the Acer ran the same toolkit with 0 FAIL, and the Windows parity matrix is in [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]].

| Decision | Final |
|---|---|
| D1 Node | LTS 24.20.0 via `11-node-lts-swap.ps1` (elevated); npm globals survived |
| D2 uv | standalone 0.12.19 first on PATH; uv-managed Python 3.13.15; the pip uv and Python 3.13.5 and Chocolatey are gone |
| D3 Miniconda | left in place; Build 3 moved it to `D:\Apps\miniconda3` behind a junction |
| D4 `core.autocrlf` | `input` (Dell Windows and WSL, Acer Windows); the Acer WSL was set to `input` by hand |
| D5 Terminal | **revised by the user:** scheme **One Half Dark** (identical to the Acer; Tokyo Night Storm stays defined as an extra scheme) and font **`IosevkaTerm Nerd Font`** (the `NFM` Mono set stays installed for VS Code); default profile PowerShell 7 |
| D6 Profile | one managed block between markers in both PowerShell profiles; the Dell keeps its opam, Kiro and `New-PyEnv` blocks |
| D7 to D10 | moved to Build 5: WSL config replacement, WSL Ollama off (done), PowerShell 7 kept in WSL, ruff/shfmt/shellcheck installed |
| D11 | adopt installed versions, except Git and GitHub CLI (`latest`); Windows Terminal stays on 1.24 |
| D12 | no Bun, Yazi, lazygit on Windows |
| D13 to D16 | PSFzf as a manifest module, shared `bat` and `fd` configs, one `_lib.ps1`, the gated Node swap script |

| Item | Final state (verified 2026-10-17) |
|---|---|
| Versions on the Dell | PowerShell 7.6.7, Git 2.55.0, GitHub CLI 2.102.0, Node 24.20.0, pnpm 12.11.2 (winget copy), uv 0.12.19, Claude Code 2.1.300, Codex 0.163.0 (the lock says 0.162.1: self-updated), Starship 1.26.0, Cursor 3.24.18 |
| Terminal | default profile `{574e775e-...}` (PowerShell 7), scheme One Half Dark, font IosevkaTerm Nerd Font |
| Shared configs | starship, git ignore, delta include, bat, fd ignore: MATCH (bat and fd now the Acer's real files, applied 2026-10-17); both profile blocks present |
| Catalog and guide | `Windows Toolkit/catalog/Tool Catalog - DESKTOP-3VBG0JH.md` and `.json`; [[Machine Toolkit - Tool Use Cases and Agent Guide]] |
| .NET 8 | kept on purpose (WSL Settings is pinned to the .NET 8 desktop runtime) |
| Open | Codex `node_repl` path in the Windows config does not resolve (Build 6); the lock lags self-updating tools (Codex, Cursor, Claude). `agy` resolves on Windows (1.3.5), so its one-time shim step is done |

**Corrections to the log below (the live machine wins).**

| The log says | What is true now |
|---|---|
| "Nothing has been changed on either laptop"; 12 decisions waiting | Phases 1 to 4 and Build 4b ran; all decisions answered (table above) |
| D5 recommends Tokyo Night Storm and `IosevkaTerm NFM` | revised by the user to One Half Dark and `IosevkaTerm Nerd Font` |
| Windows Ollama is not the server on 11434; WSL Ollama 0.18.3 answers | WSL Ollama is disabled; Windows Ollama 0.40.3 from `D:\Apps\Ollama` serves `127.0.0.1:11434` when started; its startup shortcut is disabled |
| `VERSIONS.md` and `MANIFEST.md` do not exist | they exist; the 10-11 audit looked too early |
| The Acer has no PowerShell profile | it has one (the snapshot looked under the redirected Documents folder); the managed block was merged without touching its other content |
| Node 22.16.0, npm 10.9.2, Python 3.13.5, Chocolatey, `openclaw` npm global | Node 24.20.0, npm 11.19.0; Python and Chocolatey removed; `openclaw` removed 2026-10-14 |
| Index and Build 4b claims that the Run-key apps start at logon | all six remaining entries are disabled in `StartupApproved`; none started at the last boot |
| Closing-status rows "OPEN" for catalog, guide, Acer run sheet, Installations | all DONE (rows below updated) |

**Reading guide.** Phase 1 and Phase 2 are the original audit and design, kept as evidence; the Phase 3 to 4 sections are the build and the Dell run; "Build 4b" and "Build 4b follow-up" are the closing work. The run order and rollback for every script are in `Windows Toolkit/_scripts/README.md`.
## One-Line Answer
==The Dell's Windows side was rebuilt to match the Acer in Builds 4 and 4b: one manifest drives the installs, configs, verification and catalog, the Dell passed verification (104 PASS, 0 FAIL), and the same toolkit ran on the Acer with 0 FAIL; what follows is the audit, design, build and run record, corrected at the top for what changed later.==

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

## Phase 2: design (proposed 2026-10-11; decisions revised, see the outcome table)

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

### `wsl ~` failure in PowerShell 7 (2026-10-13)
| Item | Detail |
|---|---|
| Symptom | `wsl ~` printed `/bin/bash: line 1: C:\Users\Anant Gupta: command not found` |
| Root cause | PowerShell 7 expands a bare `~` (also one passed through a variable or splat) to the Windows home before `wsl.exe` sees it, so WSL tried to run the Windows path as a command. Windows PowerShell 5.1 does not expand it, which is why it used to work. Reproduced: `wsl ~ pwd` fails, `wsl '~' pwd` and `wsl --cd '~' -- pwd` print `/home/anant_gupta` |
| Fix | the managed profile block now defines `function wsl` that turns a leading `~` into `--cd '~'` (a quoted literal is not expanded) and passes everything else straight to `wsl.exe`; `wsl -e`, `wsl -d Ubuntu -- ...`, `wsl --cd /tmp` and `wsl -l -q` were tested through it |
| To apply | `20-apply-configs.ps1 -Only profile-ps5,profile-pwsh`, then open a new window |
| Until then | `wsl --cd '~'` works in any shell |

The Build 5 readiness audit (what the Build 1 to 3 notes claimed versus the live machine) is recorded in [[Old Laptop Rebuild - Index]], section "Readiness audit, 2026-10-13".
## Left for later builds (renumbered 2026-10-14: WSL items went to Build 5)
VS Code settings and extensions, the MCP registry and `sync-mcp.ps1`, Claude Code settings, Miniconda relocation, the pagefile, and all Build 3 items.

## Closing status of Build 4 (live check, 2026-10-14)
Phases 1 to 4 ran on the Dell on 2026-10-13. The run is filed here under `Runs/`. What is left becomes **Build 4b** (prompt not written yet).

| Item | State | Evidence |
|---|---|---|
| Toolkit installed (PowerShell 7, Starship, font, zoxide, fzf, fd, bat, delta, NanaZip, pnpm, Node 24, standalone uv) | DONE | `99-verify.ps1 -WriteLock` 104 PASS, 0 FAIL, 1 WARN (`node_repl`, Build 6); `Windows Toolkit\toolkit.lock.json` written |
| Python 3.13.5 and Chocolatey | REMOVED | `C:\Python313` and `C:\ProgramData\chocolatey` absent on 2026-10-14 |
| Windows Terminal | DONE | default profile PowerShell 7, scheme `One Half Dark`, font `IosevkaTerm Nerd Font` (live settings file) |
| `wsl ~` fix in the PowerShell 7 profile block | DONE | `function wsl` present in the live profile |
| .NET 8 | KEPT ON PURPOSE (Build 4b, 2026-10-15) | WSL Settings is pinned to the .NET 8 desktop runtime; dry run lists 5 packages and nothing was removed |
| Phase 5: catalog (`40-build-catalog.ps1`, real run) | DONE (Build 4b) | `catalog\Tool Catalog - DESKTOP-3VBG0JH.md` and `.json`, PASS 2026-10-15 |
| Phase 5: "Machine Toolkit - Tool Use Cases and Agent Guide" note | DONE (Build 4b) | written next to `Installations` |
| Phase 6: Acer run sheet and Acer paste-back | DONE | the Acer ran Parts 0 to 3 on 2026-10-15 with 0 FAIL; the parity matrix is in [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]] |
| Phase 7: rewrite the Windows half of `Installations`, log line, close the build | DONE (Build 4b) | Windows tables rewritten from the catalog; Acer and Growth-rules pointers added |
| Codex config carries a WSL path (`node_repl`) | OPEN, Build 6 | reported by `99-verify` |

## Build 4b (2026-10-14 to 2026-10-15): Dell leftovers and Tailscale
Build 4b was run on 2026-10-14 and 2026-10-15 as a long Dell-side session. Scripts wrote nothing without `-Apply`; the user ran every state-changing script. Results below are live measurements; the work after the first write-up is in "Build 4b follow-up".

### Sources used
Cursor update failure research (community threads, no official fix found): [Windows inno_updater: Access is denied (os error 5)](https://forum.cursor.com/t/windows-inno-updater-access-is-denied-os-error-5-deleting-resources-reproduced-3-times/168867), [Windows auto-updater fails with access denied error](https://forum.cursor.com/t/windows-auto-updater-fails-with-access-denied-error/158940), [Windows updater fails with dual install](https://forum.cursor.com/t/windows-updater-fails-with-dual-install-system-wide-per-user-and-leaks-2gb-of-temp-folders/159479), [Windows updater serves unpublished 3.19.19](https://forum.cursor.com/t/windows-updater-serves-unpublished-3-19-19-fails-to-swap-install/171123). Tailscale SSH and VS Code Tunnel documentation was not re-read: both Part B decisions were skip (B1, B2), so nothing was installed from them.

### Before and after
| Item | Before (brief, 2026-10-14) | After (live, 2026-10-15) |
|---|---|---|
| Cursor | "Moving: resources" error, install described as broken at 3.19.7 | complete install, 3.24.18 (`winget list` and `package.json` agree), launched by Claude, 21 processes for 90 s, updater `checking` then `idle`, closed gracefully to 0 processes |
| Cursor self-update | interrupted twice (2026-09-06, 2026-10-14) | stays on; root cause fixed in `60-build5b-host.ps1` (no force-kill, waits for updater idle) |
| WSL export | none; script printed only "DONE" | `D:\Backup\WSL\ubuntu-20261014-233219.tar`, 58,487,982,080 bytes (54.47 GiB), 1,114,217 entries, SHA-256 `aa82d751d9fe5a66ad418dffbaf5c1730cc1814ff94a416b0eea62bc5508b9c1`, manifest and `.sha256`. **No import test was run** |
| Old `wsl-ubuntu.tar` (36.75 GiB) | `D:\WSL\Installers` | `D:\Backup\Quarantine\wsl-tar-review-2026-11-14` with README; delete only by hand after review |
| WSL after the export | n/a | `systemctl is-system-running` = running, `tailscale status` lists `dell-wsl` and `gupta-builds`, `RunSSH` true, `wsl-clean` and `wsl-watch` timers active |
| .NET 8 | installed | kept on purpose: `C:\Program Files\WSL\wslsettings` is pinned to the .NET 8 desktop runtime; dry run listed exactly 5 packages |
| Windows Ollama | not running | 0.40.3 from `D:\Apps\Ollama`, `OLLAMA_MODELS=D:\AI\ollama-models`, `127.0.0.1:11434` owned by that process, `ollama list` shows 3 models, startup shortcut disabled |
| Startup folder | E START App, OpenClaw Gateway, Ollama, Wispr Flow | E START App and OpenClaw Gateway quarantined; Ollama and Wispr Flow disabled in StartupApproved |
| OpenClaw | npm 2026.3.13 (538 packages), `~\.openclaw` with 31 skill junctions | `npm uninstall -g openclaw` exit 0, `~\.openclaw` quarantined (links removed, targets in `~\.agents\skills` untouched), `openclaw` no longer resolves |
| Run-key apps (7) | said to start at logon | all 7 disabled in StartupApproved; at the 2026-10-14 04:39 boot none started by itself |
| Firecrawl key in WSL `.bashrc` | plaintext at lines 153-154 | removed (0 assignment lines); nothing stored anywhere. **Firecrawl's API still accepted that key at 14:06: revocation not confirmed (open)** |
| Tool catalog | `catalog\` empty | `Tool Catalog - DESKTOP-3VBG0JH.md` and `.json`, 46 tools, 24 MCP entries, 34 WSL tools, PASS |
| Agent guide | none | [[Machine Toolkit - Tool Use Cases and Agent Guide]] |
| `Installations` Windows half | pre-rebuild tables | rewritten from the catalog and lock; Acer and Growth-rules pointers added; backup in `Runs/_backups/` |
| Acer run sheet | none | [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]; its command template was run read-only on the Dell (exit 0, OK=37, PASS=30) |
| Weekly clean | never ran | dry run clean (0.01 GiB); first scheduled run Sunday 2026-10-18 03:30 |
| Build 5 leftovers | Cursor server data 4.0 GB, old pnpm stores, backfill task | **script ready, not yet run:** `07-build5-leftovers.ps1` (dry run clean) |
| C: free / D: free | 140.9 / 451.2 GiB | 138.5 / 404.7 GiB (D: carries the 54.47 GiB export; +36.75 GiB comes back when the old tar is deleted after 2026-11-14) |

### State-changing commands
| When | Who | Command | Result |
|---|---|---|---|
| 2026-10-14 11:51 | Claude | launched Cursor (test), then `CloseMainWindow` on each window | 90 s healthy; first close left the "Cursor Agents" window, second close ended all 15 processes |
| 2026-10-14 23:31 | user | `05-startup-cleanup.ps1 -Apply` | both startup items and their stale registry values handled, `~\.openclaw` quarantined, npm package removed (538 packages, 22 s); `undo.txt` in `D:\Backup\Quarantine\startup-cleanup-2026-10-14` |
| 2026-10-14 23:32 | user | `60-build5b-host.ps1 -Stages Export -Apply` | `wsl --terminate`, export 13.9 min, tar 54.47 GiB; script then died on `tar -tf` (see errors) before restarting the distro |
| 2026-10-14 23:46 | Claude | `wsl -d Ubuntu --exec true` | distro restarted; not `wsl --shutdown` |
| 2026-10-15 12:57 | user | `60-build5b-host.ps1 -Stages Verify -Apply` | GNU tar 1,114,217 entries, exit 0; SHA-256 2.2 min; manifest written (malformed, see errors) |
| 2026-10-15 13:05 | user | `... -Stages Quarantine -Apply` | refused to move the old tar: "does not match its manifest" (correct behavior, bad manifest) |
| 2026-10-15 13:08 | Claude | rewrote the manifest as 8 proper lines, kept the bad one as `.manifest.txt.malformed` | Quarantine dry run reached its confirmation prompt |
| 2026-10-15 13:11 | user | `... -Stages Quarantine -Apply` | old tar moved to `wsl-tar-review-2026-11-14` |
| 2026-10-15 13:18 | user | `06-ollama-check.ps1 -Apply` | server started, owned by `D:\Apps\Ollama\ollama.exe`, `ollama list` ok |
| 2026-10-15 13:37 | user | `04-admin-remove.ps1 -IncludeDotnet8` (elevated, dry run only) | listed the 5 .NET 8 packages; nothing removed |
| 2026-10-15 14:06 | user | `firecrawl-key-move.sh --remove` | `.bashrc` lines 153-154 removed, redacted backup in `D:\Backup\dotfiles-20261015-140633`, no other file in the scan list held the key |
| 2026-10-15 14:07 | user | `40-build-catalog.ps1` | PASS, catalog written |
| 2026-10-15 | Claude | vault writes: the agent guide, the Acer run sheet, the Installations Windows block (backup first), Build 2 handoff step 3b, one pointer line in the Build 5b handoff, runbook and ledger rows, this section | each checked for em dashes, key-like strings and unique-match patches |

### Errors and root causes
| Error | Root cause | Fix |
|---|---|---|
| Cursor "Moving: resources ... os error 5" | the launch test in `60-build5b-host.ps1` force-killed Cursor about 30 s after launch, while the updater was in `downloading` to `updating` (09:42:49 to 09:43:00 in `main.log`); the updater could not finish moving `resources` | script now waits for updater idle, closes windows gracefully, never `Stop-Process`; a later launch finished the update |
| Possible contributing factor | the GitHub MCP server runs on Cursor's own `resources\app\resources\helpers\node.exe`, which holds a handle inside `resources\` (the forum threads name the same cause) | rule in the guide: quit every Cursor window and its child processes before accepting an update |
| `-Stages Export,Quarantine` printed only "DONE" | `powershell -File` passes a comma list as one string; `[string[]]` got `"Export,Quarantine"` and every `-contains` failed | `-Stages` is now a single string split on commas; tested through `-File` |
| First fix still failed | `$Stages` is a typed `[string]` parameter, so assigning the split array back coerced it to one string again | separate variable `$StageList` |
| Export crashed after writing the tar | `tar.exe -tf` wrote "Archive entry has empty or unreadable filename ... skipping" to stderr (56 entries, Windows tar cannot read some pax names); with `$ErrorActionPreference = 'Stop'` in PS 5.1 that became a terminating error even with `2>$null` | verify with GNU tar inside WSL (1,114,217 entries, exit 0), through a helper `.sh`; the distro restarts before verification so a failure cannot leave WSL down |
| Inline `bash -c '...'` returned nothing | PS 5.1 mangles embedded double quotes in native arguments | logic moved into `verify-tar.sh`, `build5-leftovers.sh`; no quoting crosses PowerShell |
| Quarantine refused | the manifest was one long line: in `@('file=' + $tar, 'bytes=' + $size, ...)` the comma binds tighter than `+`, so the array became one string | each element parenthesized; manifest rewritten from the logged values (the `.sha256` file matched the logged hash first) |
| Firecrawl script hung | `bash -ic` for verification blocks without a terminal under the full `.bashrc`; then recursive `grep` over `/mnt/c` is very slow; and a spliced edit fused `fi` and `say` | verification sources only `~/.mcp.env`; scan limited to a fixed list of config files; syntax checked with `bash -n` and a dummy-file test |
| `04-admin-remove.ps1` dry run needs elevation | the script checks admin before it plans | run the dry run elevated |
| Ollama `/api/version` timed out once | first-call warm-up; a retry returned 0.40.3 | none |
| Firecrawl key still accepted after "revocation" | unknown. A fake key and no key both return 401, so the check discriminates; the key in `.bashrc` returned 200 at 13:37, 13:47 and 14:06 | open: revoke the most recently used key in the dashboard; confirm with a status-only check on the key you still hold |
| `sync-check` over a non-interactive shell prints `node`, `pnpm`, `uv` as `not-installed` | nvm and `~/.local/bin` are set up in the interactive `.bashrc` | documented in the Acer handoff (3b); repo lines are the check |
| `pnpm store path` printed `/mnt/c/.pnpm-store/v11` | `wsl.exe --exec` starts in a Windows directory and pnpm picks the store from the current directory's filesystem; from `~` it is `~/.local/share/pnpm/store/v11` | none; do not draw conclusions from `pnpm store path` run from a `/mnt` directory |

### Contradictions logged (live machine won)
| Vault or brief said | Live |
|---|---|
| Index D1: `Cursor.exe` absent, install broken | complete, 3.24.18 |
| Brief: Cursor 3.19.7 and 3.19.13 | 3.24.18 |
| Index D8: Run key still starts Discord, GoogleDriveFS, Rize, Spotify, Docker, Voquill, Slack | all disabled; none started at boot; Spotify and Wispr Flow were started by hand hours later |
| Brief: Docker starts although its setting says off | not reproduced: StartupApproved 03, `AutoStart: false`, no Docker process after boot |
| Index: pnpm 12.4.2 on both laptops | WSL on both is 12.4.2 through Corepack; the Windows winget pnpm is 12.11.2 and is what `toolkit.lock.json` records |
| "Python 3.13.5 is gone" | files gone; 11 stale uninstall registrations still show in `winget list`; `python` on PATH is the Hermes venv |
| Cursor snapshots and globalStorage "1.2 GB each" | 2.0 GB each (`snapshots`, `anysphere.cursor-agent-worker`) |
| Catalog prose (Ollama row: WSL Ollama holds 11434, shortcut stays until Build 5; Docker CLI size) | predates Build 5; manifest and catalog left unchanged so `toolkit.lock.json` stays valid; the agent guide carries the correct facts |
| Build 5: "27 configs exact" | the catalog compares 8 of 29 WSL files as DIFF against the old Acer snapshot (atuin, gh-dash, git ignore, lazygit, sesh, starship.toml, yazi.toml, tmux.conf); likely the golden set deliberately changing them (starship LF, tmux 3.8), not verified file by file |
| Codex `node_repl` | still resolves NO (WSL path in the Windows config), Build 6 |

### Left, and who owns it (as of 2026-10-15; superseded by the follow-up below)
- **You:** run `07-build5-leftovers.ps1 -Apply` (Cursor server data, old pnpm v10 stores, backfill task); revoke the Firecrawl key that is still accepted; keep or remove Malwarebytes (two entries), WhatsApp, Rize, GitKrakenCLI; stale Python uninstall registrations; Defender exclusions and the BIOS battery cap; delete the old tar and the `.malformed` manifest after review; per-repo `packageManager` pins (Decision 11, one repo at a time).
- **The Acer:** [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]] Part 0 onward, [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]], and the Build 2 items in [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]] (host-key comparison, sync-check over SSH, large Git transfer, clone inventory, optional WSL route test).
- **Later builds:** Codex `node_repl`, MCP registry, VS Code and Claude Code settings (Build 6); startup profile and final verification (Build 7); `D:\_Anant` and Drive (Build 8).

### Growth rules
| Standing rule | Check |
|---|---|
| Never kill an app whose updater may be running; read its state first | `Select-String 'update#setState' (newest %APPDATA%\Cursor\logs\*\main.log) \| Select -Last 1` must end in `idle` before any script stops Cursor |
| A comma list through `powershell -File` is one string: take a string parameter and split it, in a new variable | run the script with `-Stages A,B` and read the first log line |
| In PS 5.1 with `$ErrorActionPreference = 'Stop'`, native stderr can abort a script even with `2>$null`: use `Continue` around the call or a helper | grep new scripts for `2>$null` next to a native tool |
| Do not pass quoted multi-word commands through `wsl.exe` from PS 5.1: call a helper `.sh` | the helper prints its own output; parse it |
| Parenthesize every `'key=' + $v` inside an `@(a, b)` list | `($lines).Count` must equal the number of elements |
| Verify a WSL export with GNU tar inside WSL, record entries and SHA-256, and say no import test was run | the `.manifest.txt` next to the tar must have 8 lines |
| Test a destructive script against dummy data first | `FC_TEST_*` style overrides, then the real dry run |
| No key in any shell rc file; revoke at the provider and confirm with a status-only call | `grep -c "API_KEY=" ~/.bashrc` prints 0 |
| Judge startup behavior by process start time versus last boot, not by the Run key | `(Get-CimInstance Win32_OperatingSystem).LastBootUpTime` against `(Get-Process <name>).StartTime` |
| A pnpm store path is only meaningful from the project's own filesystem | run `pnpm store path` from `~` or the repo, never from a `/mnt` directory |

## Build 4b follow-up (2026-10-17)
Work done after the first Build 4b write-up above: the Build 5 leftovers, the config adoption from the Acer, the app removals, the quarantine disposal, and the `packageManager` pin pilot. All state-changing scripts were run by the user; the pilot's local commit was made by Claude.

### State-changing commands and results
| When | Who | Command | Result |
|---|---|---|---|
| 2026-10-15 15:18 to 15:31 | user | `07-build5-leftovers.ps1 -Apply` | moved Cursor's WSL server data (`snapshots` 1.98 GiB, `anysphere.cursor-agent-worker` 1.93 GiB) and the old pnpm v10 stores (0.41 GiB) to quarantine (about 13 minutes, a cross-filesystem move); disabled `ConversationCapture-Backfill-WSL`. Refused to run while a Cursor server process existed (it had exited by then). pnpm store `v3` (1.8 GiB, last written 2026-02-22) was left because it was not approved |
| 2026-10-17 17:55 | user | `20-apply-configs.ps1` | CHANGED=3: `bat` and `fd-ignore` (the Acer's promoted files, hashes match) and `path-order` (`~\.local\bin` was no longer first on the user PATH; restored, old value in `D:\Backup\Toolkit\20261017-175545`) |
| 2026-10-17 17:56 | user, elevated | `09-remove-leftover-apps.ps1 -Apply` | Rize: Squirrel uninstall returned exit -1 with no message, then its folders (3.6 MB local, 166 MB roaming) and both startup values were removed. GitKrakenCLI: `AppData\Local\GitKrakenCLI` (365 MB: `gk.exe` plus 8 stacked versions) and `gk` removed. Python 3.13.5: the bundle uninstaller returned 1603; `msiexec /x` removed Executables, Core Interpreter and Python Launcher (exit 0), 7 hidden component entries returned 1603 and remain; the bundle's registration key was removed; Machine PATH unchanged (ExpandString, length 379, same SHA-256 prefix before and after); `C:\Windows\py.exe` is gone; `winget list` shows 0 Python rows |
| 2026-10-17 17:57 to 18:14 | user | `08-quarantine-purge.ps1 -Apply` | 8 checks passed first (surviving WSL export size and SHA-256 re-verified in 1.7 min, WSL running, Tailscale, Cursor 3.24.18, OpenClaw gone, lock present, no Cursor update in progress); deleted 11 folders (53.77 GiB) and the malformed manifest copy; **D: free 398.7 to 452.8 GiB**; context record written first |
| 2026-10-17 | Claude | `packageManager` pin pilot (below) | one local commit in an isolated worktree; nothing pushed |

### Quarantine disposal record (what existed before it was deleted)
Written by the purge script to `D:\Backup\Quarantine-record\quarantine-record-2026-10-17.txt`; the files themselves are gone. Nothing in it was needed to run the machine.

| Folder | Size | What it held |
|---|---:|---|
| `build5-leftovers-2026-10-15` | 4.33 GiB | Cursor server `snapshots` and agent-worker data, old pnpm v10 stores, `undo.txt` |
| `c-cleanup-review-2026-11-01` | 2.39 GiB | the 2026-09-20 Codex cleanup quarantine (2.34 GiB, 55,449 files), five stray profile-root files (a temp copy of a Claude config, a battery report, an empty `global.yml`, `settings.json`, the mongosh installer), an empty `suspicious` folder |
| `c-deep-clean-review-2026-11-11` | 8.52 GiB | app data and installers of already-removed software: Outlook, Office and Olk caches (2.4 GiB), Medal (0.8), Kingsoft/WPS (0.7), the Brave profile (0.67; bookmarks and any saved logins), Opera (0.5), JetBrains settings (0.23), Steam, Riot, Cluely and Guardian updater caches, Respondus, Teams add-in, `.jdks`, and ten old setup files from Downloads (PowerToys, Kiro, Cursor 2.6.12, Loom, Vivaldi, Dell Command Update, Jan, Miniconda, GitHub CLI 2.89.0) |
| `cursor-broken-install-2026-10-14` | 1.76 GiB | the install Cursor's interrupted self-update broke (33,923 files) |
| `cursor-oldlogs`, `cursor-state-*` (4 folders) | 0.03 GiB | Cursor logs older than 7 days, Crashpad, process monitor, update supervisor, blob storage |
| `startup-cleanup-2026-10-14` | 0.00 GiB | the `E START App` shortcut, the `OpenClaw Gateway` cmd, `~\.openclaw` (31 skill links), and `undo.txt` |
| `wsl-tar-review-2026-11-14` | 36.75 GiB | the old WSL export `wsl-ubuntu.tar`: written 2026-01-15, 39,454,945,280 bytes, 455,976 entries, SHA-256 `d4a23e9195a20ffeed82b7eba706de89474935f502f08224c7203eb013eac326`; 21.7 GB of it was a Rust `target/` folder from `boom`. Replaced by the 2026-10-14 export |
What remains outside the quarantine and was kept on purpose: `D:\Backup\WSL` (the 54.47 GiB export, manifest and `.sha256`), `D:\Backup\Toolkit` (config backups), `D:\Backup\dotfiles-20261015-140633` (a copy of `.bashrc` with the key line blanked), `D:\Backup\GameSaves`.

### `packageManager` pin pilot (what it is, what happened)
**What a pin is.** A repo's `package.json` field `"packageManager": "pnpm@12.4.2"` makes Corepack run exactly that pnpm version in that repo on every machine, whatever is installed globally. On the Dell `pnpm` is a Corepack shim, so the pin is honoured. It stops the version drift that hit the Acer (pnpm floated to 12.11.2 after its weekly cleanup deleted `~/.cache/node`). With pnpm 12 the lockfile also records the pnpm version with integrity hashes. It helps pnpm repos only: npm repos are not pinned, and Python repos need `.python-version` and `uv.lock` instead.
**Method.** One repo at a time, in a separate `git worktree` off `origin/main` on branch `dell-latitude/pin-package-manager` (so the main checkout's uncommitted files are untouched, per Decision 11), then `pnpm install --frozen-lockfile` and the repo's own checks.

| Repo | Result |
|---|---|
| `hub/Learning-Tracker-Tool` | **Done, committed locally** as `51cc182` ("Pin pnpm 12.4.2 through packageManager"), unpushed, upstream unset; worktree at `~/projects/hub/.worktrees/Learning-Tracker-Tool-pin-package-manager`. Diff: `package.json` +1 line, `pnpm-lock.yaml` +158 lines (the new package-manager section), `pnpm-workspace.yaml` +3 lines. Verified: frozen install exit 0 under pnpm 12.4.2, Next.js 16.1.6 starts, eslint exit 0. It is a **team repo** (remote `Shauryya27/Learning-Tracker-Tool`, merges from a collaborator): pushing the pin forces pnpm 12.4.2 on them, and older pnpm versions have not been tested against the new lockfile section, so the push or PR is the user's decision |
| `hub/portfolio` | **Blocked, reverted and removed.** The lockfile on `origin/main` is already broken (duplicate key `@ai-sdk/mistral@3.0.39` at lines 201 and 207), so pnpm discarded it and wanted to regenerate all 5,545 lines, which would also float dependency versions; its `pnpm.onlyBuiltDependencies` block is also ignored by pnpm 12. Needs its own decision on a branch. The main checkout (`post-frontend`, 114 uncommitted files) was never touched |
| `hub/Assisto_website` | Not attempted: it has both `package-lock.json` and `pnpm-lock.yaml`; choose one manager first |
| npm, bun, yarn and Python repos | not pinned (see the register in the Locked Decisions note) |
**What pnpm 12 changed (applies to every pnpm repo, with or without a pin).** The old `ignoredBuiltDependencies` / `pnpm.onlyBuiltDependencies` keys are no longer honoured; `pnpm install` fails with `ERR_PNPM_IGNORED_BUILDS` until each build script is decided in `allowBuilds` (here `sharp: false`, `unrs-resolver: false`, preserving the old intent). With a `packageManager` field present, a frozen install fails until the lockfile has been updated once to record pnpm itself (`pnpm install --lockfile-only`).

### Errors and root causes (follow-up)
| Error | Root cause | Fix |
|---|---|---|
| C: free fell 17.5 GiB in one day (137.8 to 120.3) with no alert | the system-managed pagefile grew from about 16 GB (3b snapshot) to 31 GB under memory use; the alert rules need a week of history | inference, to confirm after a reboot; read C: free after a reboot before suspecting data |
| `gk.exe` keeps returning after deletion | the GitLens extension (VS Code, Kiro, the WSL VS Code server) downloads and self-updates the GitKraken CLI for its MCP feature; no documented opt-out | folders cleared; they return unless GitLens is uninstalled (user decision, extension lists sync) |
| 7 Python registrations survive `msiexec /x` (1603) | they are hidden `SystemComponent` entries of the removed bundle; cause of the failure not established | harmless, invisible in Settings and `winget`; optional registry cleanup |
| `pnpm store path` showed `/mnt/c/.pnpm-store/v11` | `wsl.exe --exec` starts in a Windows directory and pnpm picks its store from the current directory's filesystem | from `~` it is `~/.local/share/pnpm/store/v11`; do not run it from a `/mnt` directory |
| Firecrawl key still accepted by the provider after the user's "revocation" | not established; a fake key and no key both return 401, so the check discriminates | open: revoke the most recently used key in the dashboard |

### Growth rules (added in 4b and its follow-up)
| Standing rule | Check |
|---|---|
| Never kill an app whose updater may be running; read its state first | the last `update#setState` line in the newest Cursor `main.log` must be `idle` before a script stops Cursor |
| A comma list through `powershell -File` is one string; take a string parameter and split it into a new variable (a typed parameter coerces an array back) | run with `-Stages A,B` and read the first log line |
| Native stderr can abort a PS 5.1 script that sets `$ErrorActionPreference = 'Stop'`, even with `2>$null`; and quotes inside `wsl.exe` arguments get mangled | run natives under `Continue`, or call a helper `.sh` file |
| Parenthesize every `'key=' + $v` inside an `@(a, b)` list (the comma binds tighter than `+`) | `($lines).Count` equals the number of elements |
| Verify a WSL export with GNU tar inside WSL, record entries and SHA-256, and say no import test was run | the `.manifest.txt` has 8 lines; `08-quarantine-purge.ps1` re-hashes it |
| A quarantine is temporary: give it a review date, keep a text record of what it held, then delete it | `D:\Backup\Quarantine` should be empty; the record lives in `D:\Backup\Quarantine-record\` |
| No key in any shell rc file; revoke at the provider and confirm with a status-only call | `grep -c "API_KEY=" ~/.bashrc` prints 0 |
| Judge startup behaviour by process start time versus last boot, not by the Run key | compare `(Get-CimInstance Win32_OperatingSystem).LastBootUpTime` with `(Get-Process <name>).StartTime` |
| Before pinning a repo's package manager, run a frozen install in an isolated worktree | `pnpm install --frozen-lockfile` exit code, then the repo's lint/test |
| After the pagefile or memory load changes, read C: free after a reboot | `Get-PSDrive C`; `Win32_PageFileUsage` |