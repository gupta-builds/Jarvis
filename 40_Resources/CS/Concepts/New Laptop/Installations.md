---
type: note
status: sprout
created: 2026-09-13
updated: 2026-10-15
course: Life
track:
  - laptop
prerequisites:
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[VS Code Professional Setup]]"
  - "[[Google Drive Sync Policy]]"
related:
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[VS Code Professional Setup]]"
  - "[[Old Laptop Decommission Checklist]]"
  - "[[Google Drive Sync Policy]]"
tags:
  - note
---
# Installations

## Why this note exists

Every other note in this folder documents a slice of the new-laptop rebuild (WSL internals, MCP wiring, VS Code, drive architecture) but none of them is a single flat list of "every app/package that needs to exist on the Acer, and exactly which directory/drive it lands in." This note is that list. It exists because a 2026-09-13 session ran a Chris Titus Tech (Windows Toolbox) batch install of five communication apps and asked, correctly, "where did those actually go" — a question none of the existing notes could answer directly. Treat this note as the living inventory; update it every time something new gets installed, don't let installs drift ahead of documentation the way they did on the Dell (see [[New Laptop Setup#New findings this pass (not in any existing note)]] — "a long tail of OEM/incidental installs... that no note mentions").

**2026-09-15 update:** confirmed real Acer partition split is **~310GB C: / ~690GB D:** (supersedes the earlier ~250GB/~700GB figure carried over from the Old Laptop Decommission Checklist). This turned into a real capacity-planning question — see the WSL section below, which reverses this note's own 2026-09-13 decision.

## One-Line Answer

==Anything whose installer offers no location choice — Electron/Squirrel apps (Discord, Slack, Zoom, Telegram, **Claude Desktop**) and Microsoft Store packages (WhatsApp, **PowerToys when installed via Store**) — is permanently stuck on C: inside `AppData\Local`/`AppData\Roaming` or `Program Files\WindowsApps`, no matter what winget, Chris Titus Tech, or any drive policy says; everything with a *real* installer-provided location choice (confirmed 2026-09-15: **VS Code is in this bucket, not the forced one** — its Inno Setup installer has an actual destination page) should be explicitly redirected to D:; and WSL, after two reversals, ends up back on **D:** given the real 310GB/690GB split.==

## Mechanism — the one placement rule, stated once

1. **Forced to C:, no exceptions:** any installer that is Electron/Squirrel-based with no directory prompt, or anything delivered through the Microsoft Store. Confirmed members: Discord, Slack, Zoom, Telegram, WhatsApp (Store), **Claude Desktop** (Squirrel-style, no location prompt — confirmed 2026-09-15), **PowerToys** (only when installed via the Microsoft Store, as happened this time — the standalone MSI installer is a separate question, see below). These are genuinely non-relocatable — not a policy choice, a technical constraint.
2. **Deliberately placed on D:** every tool that does offer a real install-path choice, plus every *data* directory regardless of where the app binary lives. **Correction, 2026-09-15: VS Code belongs here, not in bucket 1.** The Windows "User Installer" build of VS Code is Inno Setup-based and does present a "Select Destination Location" page (defaulting to `%LOCALAPPDATA%\Programs\Microsoft VS Code`, but overridable) — confirmed directly, since it asked on the Acer and D: was chosen. The earlier claim in this note ("VS Code — C: (no choice)") was wrong and is corrected here. Also in this bucket: Miniconda (`D:\conda`, explicit custom path required), npm cache, Ollama models, Docker's WSL disk image, and — as of this correction — WSL itself.
3. **WSL — decided 2026-09-15, reversing the 2026-09-13 reversal:** WSL and Docker's WSL disk image go on **D:** (`D:\WSL\Ubuntu`, `D:\WSL\Docker`), overturning the 2026-09-13 "put it on C:" call. Reasoning: the WSL VHDX has unbounded growth (no auto-shrink, see [[Ubuntu - WSL#Failure Modes / Misconceptions]]) and on the Dell alone reached ~102GB, with Docker's own VHDX adding another ~39GB — ~140GB combined under a *lighter* workload than the "completely professional... using containers" usage explicitly planned for this machine. Against a 310GB C: that also has to carry Windows itself (40-60GB and growing via updates), the pagefile, and every forced-C: app in bucket 1 above, WSL+Docker realistically reaching 150-250GB on C: risks reproducing the exact failure state this whole rebuild exists to avoid (the Dell hit 91% capacity, 23GB free). There is no performance reason to prefer C: over D: — both are volumes on the same physical NVMe in the one-SSD branch — so the only cost of D: is "one more path to remember," which is smaller than a capacity crisis. The "no confusion" goal from the 2026-09-13 decision is still satisfied: WSL/Docker live in exactly one place, D:, with zero exceptions.
4. **Chris Titus Tech / Windows Toolbox** is a WinGet/Chocolatey batch-install and Windows-tweak wrapper. It calls the same winget backend as a manual `winget install`, so it does not change install location — apps with no location choice still land wherever their own installer defaults to. **New finding, 2026-09-15:** winget's silent/unattended install mode generally also *skips* an interactive location prompt even for installers that would otherwise show one, defaulting to that installer's own default path (usually C:). This means mass-installing through Chris Titus Tech or a bare `winget install <id>` can silently forfeit a D: placement that the same installer *would* have offered if run manually or with an explicit `--location` override. See the install-method framework below.

## Install-method framework (added 2026-09-15) — how to handle the remaining app list

Three buckets, decide once per app, not per install session:

| Bucket | Behavior | How to install |
|---|---|---|
| **A — forced to C:, no decision possible** | Electron/Squirrel apps, Microsoft Store packages. Manual install produces the identical result to a mass install. | Safe to batch-install via Chris Titus Tech/winget — no downside, saves time. |
| **B — real location choice, winget supports an override** | Installer is MSI/Inno Setup/NSIS-based and winget's manifest exposes `--location` (or `--override` with the installer's own silent-args, e.g. NSIS `/D=`). | Install individually via `winget install <id> --location "D:\Apps\<Name>"` — do **not** use Chris Titus Tech's batch button for these, since its one-click flow doesn't expose per-app overrides and will silently take the C: default. |
| **C — real location choice, no winget override support** | Older or nonstandard installers with no scriptable location flag. | Download and run the GUI installer manually, pick D: at the "Choose install location" step — exactly what already happened for VS Code. |

Practical read of what you've described: apps that "asked for permission" and got pointed at D: were run this way (bucket B/C, manually or with override); apps that "didn't ask at all" and landed on C: were either genuinely bucket A, or were bucket B/C run through a silent mass-installer that suppressed the prompt. Before installing the rest of the list, sort each remaining app into a bucket rather than reflexively reaching for the mass installer.

**Before continuing the install queue**, get a real accounting rather than guessing what's done. Paste back the output of, run on the Acer:
```powershell
winget list | Out-String -Width 300
Get-ChildItem "$env:LOCALAPPDATA\Programs","$env:LOCALAPPDATA","$env:APPDATA" -Directory -ErrorAction SilentlyContinue |
  Select-Object Name, @{n='SizeMB';e={[math]::Round((Get-ChildItem $_.FullName -Recurse -File -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum/1MB,1)}} |
  Sort-Object SizeMB -Descending | Format-Table -AutoSize
```
This reconciles against the Full software list below and turns "a huge list of applications we need to install" into a concrete diff.

## Installed 2026-09-13 via Chris Titus Tech — verified placement

| App | winget/store ID | Actual install target | Drive |
|---|---|---|---|
| Discord | `Discord.Discord` | `%LOCALAPPDATA%\Discord\` | C: (forced) |
| Slack | `SlackTechnologies.Slack` | `%LOCALAPPDATA%\slack\` | C: (forced) |
| WhatsApp Desktop | `msstore:9NKSQGP7F2NH` | `C:\Program Files\WindowsApps\...` | C: (forced, OS-enforced) |
| Zoom | `Zoom.Zoom` | `%APPDATA%\Zoom\bin\` | C: (forced) |
| Telegram Desktop | `Telegram.TelegramDesktop` | `%APPDATA%\Telegram Desktop\` | C: (forced) |

Combined footprint: roughly 500MB-700MB installed. Immaterial against a 310GB C: allocation.

## Installed since (by 2026-09-15) — verified/reported placement

| App | Install method | Target | Drive | Notes |
|---|---|---|---|---|
| VS Code | Manual/GUI, asked for location | User-chosen | **D:** | Corrects this note's earlier "forced to C:" claim — see Mechanism #2 |
| Claude Desktop | Direct installer, no prompt | `%LOCALAPPDATA%\AnthropicClaude\` (Squirrel-style) | C: (forced) | New addition to the forced-C: list |
| PowerToys | Microsoft Store | `C:\Program Files\WindowsApps\...` | C: (forced, this install method) | Note: the non-Store MSI installer is a separate question, not evaluated here since Store was used |
| "DevTools" (Microsoft Store) | Microsoft Store | `Program Files\WindowsApps` | C: (forced) | Name ambiguous as reported — flag for confirmation (DevToys? Dev Home?) |
| Vivaldi | winget/direct | `AppData\Local` | C: (forced) | **Done** — installed, synced (unchanged from prior) |

## Full software list — Windows side

| App/Tool | Purpose | Source | Target | Drive | Status |
|---|---|---|---|---|---|
| Git | version control | git-scm.com installer | `C:\Program Files\Git` | C: (no choice, small) | Planned — bucket A/small |
| nvm-windows | Node version manager | GitHub release | installs itself + Node under its own dir | C: (small) | Planned |
| Claude Code CLI | primary AI dev surface | `npm install -g` via nvm-windows Node | inside nvm's node install path | C: | Planned |
| VS Code | primary editor | code.visualstudio.com | user-chosen | **D:** | **Done** |
| Docker Desktop | containers | docker.com | app on C: (bucket A), disk image redirected | App C:, disk image **D:\WSL\Docker** (corrected back from C:) | Planned |
| Obsidian | Jarvis/The Plan vaults | obsidian.md | `AppData\Local\Programs` (app), vaults opened from D: | App C:, data D: | Planned |
| Ollama | local LLM runtime | ollama.com | app C:, models redirected via `OLLAMA_MODELS` | App C:, models D:\AI\ollama-models | Planned |
| uv | Python package/env manager | astral.sh installer | `%USERPROFILE%\.local\bin` | C: (tiny) | Planned |
| Miniconda | Jupyter/notebook exception only | Anaconda installer | base `C:\Users\anant\miniconda3`; envs, pkgs and specs on **D:\Apps\Miniconda** (corrected 2026-10-12, `D:\conda` never existed) | base C:, envs **D:** | **Done** |
| GitHub CLI (`gh`) | Windows-side git auth | official winget package | `Program Files` | C: (small) | Recommended addition |
| Windows Terminal | shell host | pre-installed / Store | n/a | C: | Verify present, set default |
| NanaZip or 7-Zip | archive utility | winget, bucket B | `Program Files` (default) or D: if redirected | C: default, small either way | Recommended, avoid WinRAR |
| Everything (voidtools) | instant file search | voidtools.com, bucket B/C | installer-chosen | D: recommended | Recommended addition |
| Postman | API testing | winget, bucket A (Electron) | `AppData\Local` | C: (forced, small) | Decide per-app |
| NVIDIA driver | GPU driver | Acer support or NVIDIA | n/a | n/a | Verify current driver; Studio vs Game Ready per actual use |
| CUDA Toolkit | only if compiling custom PyTorch/TF kernels | nvidia.com | custom | D: if installed | Don't install speculatively — Ollama/llama.cpp GPU accel works off the driver alone |
| Discord, Slack, WhatsApp, Zoom, Telegram, Claude Desktop | comms/AI | see tables above | see tables above | C: (forced) | **Done** |
| PowerToys | productivity | Microsoft Store | see above | C: (forced, this method) | **Done** |
| fzf (`junegunn.fzf`) | fuzzy search over files and history; driven by PSFzf in both PowerShell profiles (`Ctrl+T`/`Ctrl+R`/`Alt+C` chords, `-EnableFd`, `-GitKeyBindings`, `-TabExpansion`), with `FZF_DEFAULT_OPTS` opening a `bat`-rendered preview pane | winget | `%LOCALAPPDATA%\Microsoft\WinGet\Packages` (portable, hard-linked into `WinGet\Links`) | C: (forced, tiny) | **Done** 2026-10-12, 0.74.4 |
| fd (`sharkdp.fd`) | fast file search for course folders and snippets; pairs with fzf and ripgrep; respects a global ignore file at `%APPDATA%\fd\ignore` (`.git`, `node_modules`, `__pycache__`, `.venv`, caches, build dirs) | winget | `%LOCALAPPDATA%\Microsoft\WinGet\Packages` | C: (forced, tiny) | **Done** 2026-10-12, 10.5.0 |
| bat (`sharkdp.bat`) | syntax-highlighted file viewing from the terminal and fzf's preview pane; config at `%APPDATA%\bat\config` (`--style=numbers,changes,header`, `--paging=auto`, `--italic-text=always`); no theme override, matching WSL's own unthemed `bat` config | winget | `%LOCALAPPDATA%\Microsoft\WinGet\Packages` | C: (forced, tiny) | **Done** 2026-10-12, 0.26.1 |
| delta (`dandavison.delta`) | readable `git diff` and `git log -p`; `core.pager`, `interactive.diffFilter`, the `[delta]` navigate/side-by-side/line-numbers block, and `diff.colorMoved = default` in `~\.gitconfig`, matching WSL's `.gitconfig` in full | winget | `%LOCALAPPDATA%\Microsoft\WinGet\Packages` | C: (forced, tiny) | **Done** 2026-10-12, 0.20.1 |
| zoxide (`ajeetdsouza.zoxide`) | `z <dir>` jumps across scattered course folders, vaults and snippet projects; initialised in both PowerShell profiles | winget | `%LOCALAPPDATA%\Microsoft\WinGet\Packages` | C: (forced, tiny) | **Done** 2026-10-12, 0.10.0 |
| PSFzf (PowerShell module) | gives `fzf` its PowerShell keybindings and aliases (`fe`/`fh`/`fkill`); installed separately for Windows PowerShell 5.1 and PowerShell 7 (they don't share a module path) | PowerShell Gallery (`Install-Module -Scope CurrentUser`) | `Documents\{WindowsPowerShell,PowerShell}\Modules` | D: (Documents is redirected) | **Done** 2026-10-12, 2.7.12 |

**Explicitly not carrying forward from the Dell's undocumented long tail** unless a concrete current need justifies it: IntelliJ IDEA, MongoDB Shell, Malwarebytes (Windows Defender is the accepted baseline), WinRAR (replaced by NanaZip), Respondus LockDown Browser (course-specific), Dell-specific OEM apps (N/A on Acer; equivalent is PredatorSense — keep only if fan/RGB control is actually used), superwhisper/WisprFlow/Voquill (re-add only if actually still in use).

## Full software list - WSL side (Ubuntu 24.04, inside the distro)

Real installed state as of 2026-09-19, confirmed via each tool's own `--version` unless noted otherwise. Full build history and the debate behind each pick: [[Acer Live State — 2026-09-16#WSL configuration round 2 - 2026-09-19]].

| Tool | Purpose | Install method | Status |
|---|---|---|---|
| git 2.43.0, git-lfs 3.4.1 | base toolchain | `apt` | Done |
| ripgrep 14.1.0, fd (symlinked from `fdfind`), bat (symlinked from `batcat`), fzf, jq | fast CLI search/preview/JSON | `apt` | Done |
| `gh` 2.45.0 | GitHub auth + git operations | Ubuntu's own default apt repo, not GitHub's separate signed repo | Done - HTTPS credential helper, no SSH key |
| `wslu` | gives WSL a real browser opener for `gh auth login --web` and similar | `apt` | Done |
| nvm + Node 24.21.0 (LTS) | Node version management | nvm install script | Done |
| pnpm 12.4.2 | JS package manager | Corepack | Done |
| uv 0.12.17 | Python env/package manager | astral.sh install script | Done - per-project `.venv`, lazy-created |
| rustup/cargo | Rust toolchain | rustup install script | Done - needed for a couple of the tools below |
| `kiro-cli` 2.22.0, `codex`, `claude` 2.1.277, `agy` (Antigravity) 1.2.6 | AI dev CLIs | each tool's own install script | Done - command names don't all match their install URLs |
| Cursor CLI | - | - | Deliberately not installed - Cursor stays the Windows-native IDE |
| Starship 1.26.0 | shell prompt | official install script | Done - Tokyo Night config, tuned: `[status]`, `[cmd_duration]`, `$shlvl`/`$jobs`, `scan_timeout` raised to 500ms |
| Yazi 26.9.1 | terminal file manager | GitHub-release binary (its crates.io package can't build directly) | Done - full config (git-status plugin, full-border, smart-filter, Tokyo Night Storm) |
| tmux 3.4 | terminal multiplexer | `apt` + TPM plugins | Done - `Ctrl-a` prefix, `\|`/`-` splits (WezTerm-matched), `pane-border-status`, `base-index 1`, `tmux-resurrect`/`continuum`, `tmux-fzf` |
| win32yank | WSL-to-Windows clipboard bridge for tmux copy-mode | GitHub release binary | Done - verified real clipboard round-trip |
| ncdu | disk usage browser | `apt` | Done - configured (`-e`, dark, excludes, confirm-quit) |
| semgrep 1.177.0 | static analysis (real bugs, not "AI slop") | `uv tool install` | Done - no global config needed, per-repo setup deferred |
| delta 0.19.2 | git/lazygit diff pager | `cargo install` (newer than apt's 0.16.5) | Done - wired as `core.pager` |
| lazygit | TUI git client | GitHub-release binary | Done - uses delta, bound into tmux as a popup |
| zoxide 0.10.0 | fast directory jumper | official install script | Done |
| sesh | tmux session manager, integrates with zoxide | GitHub-release binary | Installed, real config (`sesh.toml`) queued not confirmed |
| atuin | shell history search + optional sync | official install script | Installed, history imported, local-only (no sync); `filter_mode` tuning queued not confirmed |
| gh-dash | multi-repo PR/issue dashboard | `gh extension install dlvhdr/gh-dash` | Installed and working; `repoPaths`/delta-pager wiring queued not confirmed |
| `samleeney/tmux-agent-status` | per-pane AI agent status | TPM plugin | Done - vetted against a same-named competing repo (281 stars, active) |
| `CRThaze/tmux-handlr` | AI agent status + push notification when away from terminal | TPM plugin | Installed alongside the plugin above (not a replacement); ntfy topic wiring queued not confirmed |
| chafa | Yazi image-preview fallback | `apt` (1.14.0) | **Insufficient** - Yazi needs >=1.16.0; a static-binary upgrade is queued, not confirmed |
| direnv | per-directory env loading | `apt` | **Not installed** - blocked twice by a sudo password unavailable in the install session; needs a human-run `sudo apt install -y direnv` |
| Docker | containers | Docker Desktop's WSL integration (not installed yet) | Planned - see [[WSL New Laptop Master Plan — Verified 2026-09-11#Maintenance Cadence]] for the separate disk-image redirect it will need |

## Drive placement — quick reference (corrected 2026-09-15)

| Lives on C: | Lives on D: |
|---|---|
| Windows OS, drivers, Program Files | PARA data (Documents/Downloads/Desktop/Pictures, redirected) |
| Electron/Squirrel apps with no location choice (Discord, Slack, Zoom, Telegram, Claude Desktop) | Two Obsidian vaults (Jarvis, The Plan) |
| Microsoft Store apps (WhatsApp, PowerToys as installed) | Ollama models, npm cache, Miniconda envs (`D:\Apps\Miniconda`), Everything |
| Obsidian, Ollama app binaries (bucket A) | **VS Code** (corrected — real location choice, chosen D:) |
| — | **WSL + Docker's WSL disk image** (`D:\WSL\Ubuntu`, `D:\WSL\Docker`) — reversed back to D: 2026-09-15 |
| System-managed pagefile (unless C: capacity becomes a measured problem) | Games, large standalone installs with a real path picker |

## Failure Modes / Misconceptions

> [!WARNING]
> Assuming VS Code has no install-location choice. It does (Inno Setup "Select Destination Location" page) — this note claimed otherwise until 2026-09-15, when the Acer install itself disproved it.

> [!WARNING]
> Treating "WSL goes on C:" (the 2026-09-13 decision) as current. It's reversed again as of 2026-09-15, back to D: — see Mechanism #3 for the capacity math that drove this. If executing old command blocks verbatim from [[New Laptop Setup]] or [[WSL New Laptop Master Plan — Verified 2026-09-11]], use D: - moot now anyway, since the Acer's WSL is already installed on D:, confirmed in [[Ubuntu - WSL#Current State - Acer, as of 2026-09-18]].

> [!WARNING]
> Mass-installing an app through Chris Titus Tech/winget and assuming it would have gone to D: if the installer supports a location picker. Silent/unattended install modes generally skip that prompt and take the C: default — bucket B apps need an explicit `--location` override or a manual GUI run.

> [!WARNING]
> Batch-accepting an entire Chris Titus Tech preset list the way the old Dell accumulated an undocumented long tail of apps. Apply "decide per-app" per the install-method framework above.

> [!WARNING]
> `winget list` reporting a package as installed does not mean it runs from any shell. On 2026-10-12, `fzf`, `fd`, `bat`, `delta` and `zoxide` all showed installed versions in `winget list` but had no PATH entry at all — only `jq.exe` and `yazi.exe` had a link in `%LOCALAPPDATA%\Microsoft\WinGet\Links` (the one folder winget-installed portable tools actually resolve through). Fixed with `New-Item -ItemType HardLink` into that same `Links` folder (symlinks need admin; hard links don't, since everything is on C:). Check `(Get-Command <tool>).Source` after any winget install of a portable (non-MSI) package — don't trust `winget list` alone.

> [!WARNING]
> A PowerShell alias can silently shadow a real binary of the same name. PSFzf's `-EnableAliasFuzzySetLocation` option defines an alias literally named `fd`, which would have taken over every unqualified `fd` call instead of running `fd.exe`. Caught before it shipped by checking `(Get-Command fd).CommandType` after enabling PSFzf's options — not assumed safe from the module's own naming.

## Evidence From This Vault

- [[New Laptop Setup]] — original drive-layout decisions, now twice-amended for WSL here
- [[WSL New Laptop Master Plan — Verified 2026-09-11]] — the Phase 2 WSL install commands; use D: per this note's current decision
- [[Google Drive Sync Policy]] — the parallel "what belongs where" rule for synced content
- [[Old Laptop Decommission Checklist]] — the undocumented long-tail-of-installs problem this note exists to prevent repeating
- [[VS Code Professional Setup]] — extension list, separate from this note's OS-level app list

## Open items / next parts of this session

1. Live Acer `winget list` + AppData-size audit (paste-back — command block above).
2. WSL fresh install on the Acer at `D:\WSL\Ubuntu` (commands adapted from [[WSL New Laptop Master Plan — Verified 2026-09-11]], drive corrected to D:).
3. Docker Desktop install + disk image redirect to `D:\WSL\Docker`.
4. Obsidian + Jarvis/The Plan MCP wiring ([[Jarvis MCP and REST API Setup#New Laptop Checklist]]).
5. VS Code Day-2 build-out ([[VS Code Professional Setup#Suggested build order for the next VS Code session (for discussion, not started)]]).
6. Decide per-app on the "not carrying forward" list once actual current usage is confirmed.
7. Confirm what "DevTools" (Microsoft Store) actually refers to.

## Old Laptop

`Old Laptop`: `40_Resources/CS/Concepts/New Laptop/Installations`. Everything above this heading describes the Acer (new laptop). This section is the installed-tool record for the Dell Latitude 5530, written 2026-10-11 from live queries on the machine and reconciled with [[Old Laptop Rebuild - Build 1 WSL Findings]], [[Old Laptop Rebuild - Build 2 VS Code and Two-Laptop Findings]] and [[Old Laptop Rebuild - Build 3 Windows Cleanup Findings]]. Where a build note and the machine disagreed, the machine is shown.

Machine: i7-1255U (10 cores, 12 threads), 32 GB RAM, Intel Iris Xe only (no NVIDIA GPU), one 1 TB NVMe split into C: (252 GB) and D: (700 GB). Windows 11 Pro build 26300, user `C:\Users\Anant Gupta`. WSL 3.0.3.0 (stable, 2026-10-09), kernel 6.18.54.1, distro `Ubuntu` (Ubuntu 24.04.4), Linux user `anant_gupta`, mirrored networking, swap on `D:\WSL\swap.vhdx`. This is the always-on SSH host for the Acer: Tailscale runs inside this WSL only and is never installed on this laptop's Windows side.

### Where things stand
- WSL is rebuilt and configured (Builds 1, 2 and 5). Since Build 5 (2026-10-13) its terminal configs are the Acer's real files, copied from the dotfile snapshot with `30-wsl-config-parity.sh` (see "Config parity" below); systemd runs with zero failed units; Miniconda and `jupyter-base` match the Acer.
- The Windows side was rebuilt by Build 4 (2026-10-13) and finished by Build 4b (2026-10-15): PowerShell 7 (default shell), Starship, IosevkaTerm Nerd Font, zoxide, fzf, fd, bat, delta, NanaZip, pnpm, Node 24, standalone uv, Git 2.55 and GitHub CLI 2.102, with shared configs written by `Windows Toolkit\_scripts`. The tables below are the live 2026-10-15 state, generated from [[Tool Catalog - DESKTOP-3VBG0JH]] and `toolkit.lock.json`. How to use each tool: [[Machine Toolkit - Tool Use Cases and Agent Guide]].
- Build 3 and Build 4 removed most of the "not carrying forward" list (Microsoft 365, OneDrive, WinRAR, Respondus, Dell Optimizer, MongoDB Shell, Logi Options+, Teams, LinkedIn, Netflix, HP Printer Control, Epic, Python 3.13.5 and Chocolatey). Build 4b removed the OpenClaw gateway (npm package, startup entry and `~\.openclaw`) and the dangling E START App shortcut on 2026-10-14. Malwarebytes (two entries) and Edge are still installed.
### Windows side (live 2026-10-15, from the catalog and `toolkit.lock.json`)
Source: `winget` is a winget package id, `Store` an MSIX package, `direct` an installer without a winget id, `npm` a global package. Per-tool purpose, commands and gotchas are in [[Machine Toolkit - Tool Use Cases and Agent Guide]]; exact paths and sizes are in the catalog.

**Shell, terminal and fonts**
| Tool | Version | Source | Location | Note |
|---|---|---|---|---|
| PowerShell 7 | 7.6.7 | winget | WindowsApps alias | default shell and Terminal profile; profile block in `Documents\PowerShell` (Documents is on D:) |
| Windows PowerShell | 5.1 | built in | System32 | legacy scripts only; profile in `Documents\WindowsPowerShell`; keeps the opam, Kiro and `New-PyEnv` blocks |
| Windows Terminal | 1.24.12741.0 | winget / Store | WindowsApps | One Half Dark scheme and IosevkaTerm Nerd Font, same as the Acer; Tokyo Night Storm kept as an extra scheme; stays on 1.24 on purpose |
| Starship | 1.26.0 | winget | `C:\Program Files\starship` | one `starship.toml` for Windows and both WSLs |
| IosevkaTerm Nerd Font | v3.5.1 | direct (Nerd Fonts archive) | per-user fonts on C: (about 760 MB, 54 TTFs) | no winget package; Terminal uses the normal set, VS Code the Mono set (NFM) |
| zoxide, fzf, PSFzf, fd, bat, delta | 0.10.0, 0.74.4, 2.7.12, 10.5.0, 0.26.1, 0.20.1 | winget (PSFzf: PowerShell Gallery) | WinGet Packages | configs from the toolkit: `%APPDATA%\fd\ignore`, `%APPDATA%\bat\config`, shared delta include |

**CLI tools, runtimes and package managers**
| Tool | Version | Source | Location | Note |
|---|---|---|---|---|
| Git | 2.55.0 | winget | `C:\Program Files\Git` | `core.autocrlf=input`; identity and safe.directory entries are machine-specific |
| GitHub CLI | 2.102.0 | winget | `C:\Program Files\GitHub CLI` | credential helper for github.com |
| ripgrep, jq, FFmpeg | 15.1.0, 1.8.2, 8.1.2 | winget | WinGet Packages | |
| NanaZip | 7.0.1843.0 | Store | WindowsApps | no console exe; scripts use `tar.exe` |
| Node.js LTS, npm | 24.20.0, 11.19.0 | winget | `C:\Program Files\nodejs` | moved from 22 to 24 in Build 4; npm cache `D:\npm-cache` |
| pnpm | 12.11.2 | winget | WinGet Packages | Windows copy only; WSL pnpm is 12.4.2 through Corepack. Do not run `corepack enable` on Windows |
| uv, uv-managed Python | 0.12.19, 3.13.15 | standalone installer | `C:\Users\Anant Gupta\.local\bin` | first on PATH; `python` on PATH currently resolves to the Hermes agent venv, so use `uv run python` |
| Miniconda | py313_25.11.1-1 | winget | `D:\Apps\miniconda3`, junction `C:\Users\Anant Gupta\miniconda3` | notebooks only; not on PATH; keep the junction |
| opam (OCaml) | 2.5.0 | winget | `D:\Apps\opamroot`, junction `C:\opamroot` | OCaml coursework; opam files carry the System attribute |
| winget | 1.29.380 | built in | WindowsApps | |
| npm globals | `@openai/codex` 0.162.1, `firecrawl-cli` 1.19.21, `mcp-remote` 0.2.1, `opencode-ai` 1.18.31 | npm | `AppData\Roaming\npm` | `openclaw` was removed 2026-10-14 |
| Python 3.13.5, Chocolatey | gone | | | files are gone since Build 4; 11 stale Python uninstall registrations still show in `winget list` (open item) |
| .NET runtimes | 8.0.25 / 8.0.26 and 10.0.9 | winget | `C:\Program Files\dotnet` | the 8.x set is kept on purpose: WSL Settings is pinned to the .NET 8 desktop runtime. Dell apps (TechHub, DTP, MyDell) run on 10 |

**AI platforms, agents and models**
| Tool | Version | Source | Location | Note |
|---|---|---|---|---|
| Claude Code | 2.1.300 | native installer | `C:\Users\Anant Gupta\.local\bin\claude.exe` | WSL copy is 2.1.299 |
| Codex CLI | 0.162.1 | npm | `AppData\Roaming\npm` | pinned in the lock |
| Claude Desktop | 2.37337.1.0 | winget | `AppData` (forced to C:) | MCP names: jarvis, the-plan, jarvis-fs, github |
| Cursor | 3.24.18 | winget | `AppData\Local\Programs\cursor` | reinstalled 2026-10-14 after an interrupted self-update; auto-update stays on |
| Kiro, Antigravity | 1.0.395, 2.22.0 | winget | `AppData\Local\Programs` | `agy` shim needs the one-time in-app step |
| ChatGPT (Store, package OpenAI.Codex) | 26.1007 | Store | WindowsApps | ChatGPT Classic is removed |
| Ollama | 0.40.3 | winget | `D:\Apps\Ollama` | serves `127.0.0.1:11434` when started by hand; models in `D:\AI\ollama-models` (two cloud models and `nomic-embed-text`); startup shortcut disabled; WSL Ollama is disabled |
| Jan | 0.8.6 | winget | AppData | |
| Docker Desktop, Docker CLI | 4.56.0, 29.1.3 | winget | `C:\Program Files\Docker`; disk image `D:\WSL\Docker` | auto-start is off |
| VS Code | 1.142.0 | winget | `AppData\Local\Programs\Microsoft VS Code` | on C: here, on D: on the Acer; Settings Sync is live |
| MCP prerequisites | npx 11.19.0, uvx 0.12.19, mcp-remote 0.2.1 | | | all resolve; 24 MCP entries across Claude Desktop, Claude Code, VS Code and Codex (names only in the catalog) |

**Productivity, communication and media**
Obsidian 1.9.12, Slack, Discord, Zoom, Telegram, WhatsApp (Store), Spotify, Vivaldi 8.2, Todoist, Loom, Bitwarden, Postman, Google Drive for desktop 132, Syncthing (`D:\Apps\Syncthing`), PowerToys 0.100, WizTree 4.31, Revo Uninstaller 2.7.2, CrystalDiskInfo, Voquill, Wispr Flow, 16x Prompt, Mail and Calendar. Also present and not in the manifest: Hermes agent (on PATH).

**Microsoft and Dell packages**
Microsoft Edge 155, Dell Command Update (Store 5.7.42 and Universal 5.7.2), Dell Core Services, Dell SupportAssist OS Recovery plugin, Intel graphics software, Realtek audio, two Malwarebytes entries (5.0.0.113 Store and 5.7.1.346), WhatsApp and Windows system components.

**Startup behavior**
All seven Run-key entries (Discord, GoogleDriveFS, Rize, Spotify, Docker Desktop, Voquill, Slack) are disabled through `StartupApproved`, and the Startup-folder items Wispr Flow and Ollama are disabled too. The E START App and OpenClaw Gateway shortcuts were quarantined on 2026-10-14. Reversible: the values and an `undo.txt` are in `D:\Backup\Quarantine\startup-cleanup-2026-10-14`.

**Open Windows items:** Malwarebytes (two entries), WhatsApp, Rize and GitKrakenCLI keep-or-remove; stale Python 3.13.5 uninstall registrations; Defender exclusions and the BIOS battery cap (need admin or BIOS).
### WSL side (Ubuntu 24.04.4, live 2026-10-11)
`systemctl is-system-running` reports `running` with zero failed units since WSL 3.0.3.0 (the `systemd-binfmt` failure of 3.0.1 is fixed). Root filesystem about 52 GB used of 1007 GB after the Build 5 cache cleanup.

**apt packages (manual)**
git 2.43.0, git-lfs 3.4.1, gh 2.45.0 (Ubuntu repo), ripgrep 14.1.0, fd-find 9.0.0 (`fd` symlink in `~/.local/bin`), bat 0.24.0 (`bat` symlink), fzf 0.44.1, jq 1.7, tmux 3.4, ncdu 1.19, direnv 2.32.1, bubblewrap, wslu 3.2.3, build-essential, curl, wget, unzip, python3-pip, Tailscale 1.104.1 (Tailscale apt repository; `RunSSH=true`, node `dell-wsl`).

**User-space binaries in `~/.local/bin`**
| Tool | Version | Note |
|---|---|---|
| Starship | 1.26.0 | |
| Yazi and ya | 26.9.1 | |
| lazygit | 0.65.1 | |
| delta | 0.20.1 | Acer note records 0.19.2 |
| zoxide | 0.10.0 | |
| atuin | 18.23.0 | local-only, no sync |
| sesh | 2.32.0 | |
| gh-dash | 4.26.0 | `gh dash` is discovered by `gh extension list` |
| chafa | 1.18.3 | static binary (Yazi needs 1.16 or newer) |
| win32yank | 0.1.1 | clipboard bridge for tmux |
| unison | 2.54.0 | |
| PowerShell 7 | 7.6.4 | present in WSL; no build note records the install |
| uv | 0.12.23 | updated in Build 1 |
| git-filter-repo | present | |
| Semgrep | 1.179.0 | `uv tool install` |

**Runtimes and package managers**
nvm with Node 24.14.1 (default `lts/*`), npm 11.11.0, pnpm 10.33.2 (Corepack), Bun 1.3.14, Python 3.12.3 (system), rustup 1.29.1 with rustc and cargo 1.99.0, `cargo-watch` 8.5.3 and `code2prompt` 4.2.0 (built from `~/projects/code2prompt`). Installed in Build 5 (2026-10-13): Miniconda (conda 26.7.1 at `~/miniconda3`, conda-forge only, `jupyter-base` with Python 3.12), ruff 0.17.0 (`uv tool`), shellcheck 0.11.0 and shfmt 3.14.1 (`~/.local/bin`, checksum-verified). `socat` is added by the user-run sudo step.

**Global packages**
npm: `@clerk/agent-toolkit` 0.2.33, `@modelcontextprotocol/server-filesystem` 2026.1.14, `@modelcontextprotocol/server-github` 2025.4.8 (deprecated upstream), `@openai/codex` 0.162.1, `@upstash/context7-mcp` 3.2.1, `@upstash/mcp-server` 0.2.3, `supabase` 2.101.0, `vercel` 54.9.1. uv tools: `graphifyy` 0.9.69 (graphify, graphify-mcp), `semgrep` 1.179.0, `specify-cli` 0.16.5.

**AI CLIs and agents**
claude 2.1.296, codex 0.162.1, kiro-cli 2.27.1, agy (Antigravity) 1.3.3. Ollama 0.18.3 is installed at `/usr/local/bin/ollama` with cloud models only; Build 5 decided to stop and disable the service (`31-wsl-sudo-step.sh`, run by the user) and keep the binary so the Windows Ollama can own port 11434. MCP servers: user scope in `~/.claude.json` are graphify, jarvis, jarvis-fs, pencil and the-plan; `~/.mcp.json` still lists github, jarvis, jarvis-fs and the-plan. Claude skills: 78 folders in `~/.claude/skills`; Codex skills: 13.

**tmux, shell and editor**
tmux plugins: tpm, tmux-resurrect, tmux-continuum, tmux-fzf, tmux-agent-status, tmux-handlr. VS Code Server 1.141.0 with 34 extensions (agents: anthropic.claude-code, openai.chatgpt, openai.codex-audio; Python: python, pylance, debugpy, python-envs, ruff; notebooks: jupyter, keymap, renderers, datawrangler, rainbow-csv; web: biome, eslint, tailwindcss, playwright; Git: gitlens, pull-request-github, github-actions; config formats: yaml, even-better-toml, markdownlint, editorconfig, dotenv; shell: shellcheck, shell-format; quality: errorlens, code-spell-checker, todo-tree, semgrep; others: httpyac, containers, rust-analyzer). Git global config: `pull.rebase true`, `push.autoSetupRemote true`, `fetch.prune true`, `rerere.enabled true`, `core.autocrlf input`, `init.defaultBranch main`, `gh auth git-credential` helper, `~/.config/git/ignore` with the eight secret patterns.


**Build 5b toolkit upgrade (2026-10-13, Dell WSL):** gh 2.102.0 and gh-dash 4.26.1 (`~/.local/bin`), fzf 0.74.5, ripgrep 15.2.0, fd 10.5.0, bat 0.26.1, lazygit 0.66.1, sesh 2.33.0, node 24.21.0, pnpm 12.4.2 (pinned with Corepack, matches the Acer; decided 2026-10-14), tmux 3.8 (built into `~/.local/bin`, no sudo; apt 3.4 stays as fallback). Configs come from the golden set; see [[WSL Toolkit Config Reference]].

### Config parity with the Acer snapshot (2026-10-11)
Build 5 (2026-10-13) replaced the Dell's reconstructed files with the Acer's real ones from `Old Laptop Rebuild/Acer Dotfile Snapshot/`: starship (LF), Yazi (yazi, init, keymap, theme, package.toml and the `tokyonight-storm` flavor), atuin, sesh, lazygit, ncdu, git ignore and `.tmux.conf` match by SHA-256; gh-dash is the Acer file with the Dell's empty `repoPaths`; `.gitconfig` keeps the Dell identity, credentials and Build 2 keys and adds the Acer's delta, pager, merge and diff keys. `.wslconfig` and `/etc/wsl.conf` differ on purpose (the Dell uses swap on D:, idle timers off and spacing). Backups are in `~/.config/.toolkit-backups/20261013-151328`. Tool versions that stay different: tmux 3.4 (Acer 3.7c), node 24.14.1 (24.21.0), pnpm 10.33.2 (12.4.2); the Dell is newer on uv, claude, delta, atuin and sesh.

### Windows terminal on the Acer (from its snapshot)
The Acer's Windows side is also incomplete: Windows Terminal is on defaults (One Half Dark, `IosevkaTerm Nerd Font`, 85 percent acrylic, default profile Windows PowerShell), no PowerShell profile exists, the global git config has only `longpaths`, `fsmonitor` and `untrackedCache` (plus redacted identity), and Yazi, lazygit, bat, delta and gh-dash exist only inside its WSL. Its winget export includes PowerShell 7, Starship, Tailscale, NanaZip, ripgrep, jq, Yazi (installed, unconfigured), Node LTS, Docker Desktop, Ollama, VS Code, Cursor, Claude and Antigravity. Build 4 completes this side on both laptops.

### Acer, WSL side (live 2026-10-15, after Build 5b)
Host `gupta-builds`, Ubuntu 24.04 on WSL 2.7.14.0 (kernel 6.18.33.2), user `anant_gupta`, `.wslconfig` 20 GB, 18 CPUs, 8 GiB swap at `D:\WSL\wsl-swap.vhdx`, mirrored networking. The versions below replace the 2026-09-19 table above where they differ.
| Tool | Version | Source |
|---|---|---|
| tmux | 3.8 | built from source into `~/.local/bin` (no sudo); the 3.7c binary is in `~/.local/bin/.prev` |
| node, npm, pnpm | 24.21.0, 11.19.0, 12.4.2 | nvm; pnpm pinned through Corepack (`~/.cache/node` is no longer deleted by the weekly clean) |
| uv, ruff, conda | 0.12.23, 0.17.1, 26.7.1 | `uv self update`, `uv tool`, Miniconda in `~/miniconda3` |
| shellcheck, shfmt | 0.11.0, 3.14.1 | release binaries, checksum verified |
| gh, gh-dash | 2.102.0, 4.26.1 | release binary in `~/.local/bin`, gh extension |
| fzf, ripgrep, fd, bat | 0.74.5, 15.2.0, 10.5.0, 0.26.1 | release binaries (bat theme `tokyonight_storm` built) |
| lazygit, sesh, delta, atuin | 0.66.1, 2.33.0, 0.20.1, 18.23.0 | release binaries; delta and atuin replaced in place, old copies in `.prev` |
| claude, codex | 2.1.301, 0.162.1 | own installer, npm |
| starship, yazi/ya, zoxide, chafa, direnv, bubblewrap | 1.26.0, 26.9.1, 0.10.0, 1.18.2, 2.32.1, 0.9.0 | unchanged |
| socat | missing | needs `sudo apt-get install -y socat` (user) |
Configs are the golden set in [[WSL Toolkit Config Reference]] (`37-toolkit-apply.sh`, `changed=13 same=21 fails=0`); git has the shared include (`core.pager=delta`, `zdiff3`, `autocrlf=input`, no `core.fsmonitor`); the `.bashrc` JARVIS block is guarded and loads `~/.config/toolkit/env.sh` through one source line. Tailscale is not installed in this WSL (it runs on Windows only).

### Acer, Windows side (2026-10-15: Part 0 and Part 2 of the run sheet done; Part 1 and Part 3 waiting)
The Acer is the reference for the toolkit's configs, so the Dell was built to match it. On 2026-10-15 Part 0 (read-only) and Part 2 (apply configs) ran on the Acer: PowerShell 7.6.7, Terminal 1.24, Starship 1.26.0, zoxide, fzf 0.74.4, fd 10.5.0, bat 0.26.1, delta 0.20.1, ripgrep 15.2.0, NanaZip, Git 2.55.0, standalone uv 0.12.19, Claude Code 2.1.301, Codex 0.162.1, Docker 4.91.0 and Tailscale 1.104.1 were already present. Part 2 wrote the managed profile block in both PowerShell profiles, the delta include, nine git settings, the Terminal merge, `STARSHIP_CONFIG`, `TOOLKIT_VAULT_ROOT` and the user PATH order. Part 1 still has to install: Git and GitHub CLI upgrades (UAC), pnpm 12.11.2 (Windows copy), uv-managed Python and mcp-remote. Its bat and fd files are the real ones and differ from the shared reconstructed copies (kept by design). Differences to expect: vault root `D:\_Anant\20_Progress\Documents\Jarvis`, Tailscale installed on Windows as `gupta-builds` (never in the Acer's WSL), the RTX 5070 Ti, VS Code on D:\Apps, the font installed system-wide, and no Kiro, Miniconda, opam or Chocolatey retirement. The run order, with a read-only first step, is in `Windows Toolkit\Acer Run Sheet - Windows Toolkit` ([[Acer Run Sheet - Windows Toolkit]]). When the Acer ran it, this section gets the parity matrix (PASS or DIFF with a reason).

### Growth rules
The standing rules and one check command each (tool versions, config hashes, font registration, environment variables, startup time, catalog freshness, no secrets in shell rc files) are in [[Machine Toolkit - Tool Use Cases and Agent Guide#Growth rules]].
### How to refresh this section
Run on the Dell and re-read: `winget list`, `choco list`, `npm ls -g --depth=0` (Windows and WSL), `uv tool list`, `cargo install --list`, `code --list-extensions --show-versions` (Windows and WSL), `apt-mark showmanual`, and `ls ~/.local/bin`. The inventory scripts used for this section were `wsl-inventory.sh` and `win-inventory.ps1`; They are superseded by `40-build-catalog.ps1` (Windows Toolkit), which regenerates `Tool Catalog - <host>` on demand; re-run it and re-read the catalog instead of these commands.

## Flashcards

Why can't Discord/Slack/Zoom/Telegram/WhatsApp/Claude Desktop be installed to D: even with Chris Titus Tech or winget?::Their installers (Squirrel-based Electron, or Microsoft Store) expose no location option — a technical constraint of the installer, not a policy choice.
#cards/laptop

As of 2026-09-15, which drive does WSL live on, and why did it change twice?::D: (`D:\WSL\Ubuntu`). Originally planned for D:/a dedicated disk (2026-09-11), moved to C: (2026-09-13) to avoid drive-confusion, then reversed back to D: (2026-09-15) once the real 310GB/690GB split made C:'s capacity risk (WSL+Docker's unbounded VHDX growth) outweigh that convenience.
#cards/laptop

Does a silent/unattended winget install still show an installer's location picker if one exists?::Generally no — silent mode skips the prompt and takes the installer's own default (usually C:), even for installers that would ask interactively. Apps with a real location choice need an explicit `winget install --location` override or a manual GUI run to land on D:.
#cards/laptop
