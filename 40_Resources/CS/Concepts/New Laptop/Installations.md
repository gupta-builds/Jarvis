---
type: note
status: sprout
created: 2026-09-13
updated: 2026-09-19
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
| Miniconda | Jupyter/notebook exception only | Anaconda installer | explicit custom path | **D:\conda** | Planned |
| GitHub CLI (`gh`) | Windows-side git auth | official winget package | `Program Files` | C: (small) | Recommended addition |
| Windows Terminal | shell host | pre-installed / Store | n/a | C: | Verify present, set default |
| NanaZip or 7-Zip | archive utility | winget, bucket B | `Program Files` (default) or D: if redirected | C: default, small either way | Recommended, avoid WinRAR |
| Everything (voidtools) | instant file search | voidtools.com, bucket B/C | installer-chosen | D: recommended | Recommended addition |
| Postman | API testing | winget, bucket A (Electron) | `AppData\Local` | C: (forced, small) | Decide per-app |
| NVIDIA driver | GPU driver | Acer support or NVIDIA | n/a | n/a | Verify current driver; Studio vs Game Ready per actual use |
| CUDA Toolkit | only if compiling custom PyTorch/TF kernels | nvidia.com | custom | D: if installed | Don't install speculatively — Ollama/llama.cpp GPU accel works off the driver alone |
| Discord, Slack, WhatsApp, Zoom, Telegram, Claude Desktop | comms/AI | see tables above | see tables above | C: (forced) | **Done** |
| PowerToys | productivity | Microsoft Store | see above | C: (forced, this method) | **Done** |

**Explicitly not carrying forward from the Dell's undocumented long tail** unless a concrete current need justifies it: IntelliJ IDEA, MongoDB Shell, Malwarebytes (Windows Defender is the accepted baseline), WinRAR (replaced by NanaZip), Respondus LockDown Browser (course-specific), Dell-specific OEM apps (N/A on Acer; equivalent is PredatorSense — keep only if fan/RGB control is actually used), superwhisper/WisprFlow/Voquill (re-add only if actually still in use).

## Full software list - WSL side (Ubuntu 24.04, inside the distro)

Real installed state as of 2026-09-19, confirmed via each tool's own `--version` unless noted otherwise. Full build history and the debate behind each pick: [[Acer Live State - 2026-09-16#WSL configuration round 2 - 2026-09-19]].

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
| Docker | containers | Docker Desktop's WSL integration (not installed yet) | Planned - see [[WSL New Laptop Master Plan - Verified 2026-09-11#Maintenance Cadence]] for the separate disk-image redirect it will need |

## Drive placement — quick reference (corrected 2026-09-15)

| Lives on C: | Lives on D: |
|---|---|
| Windows OS, drivers, Program Files | PARA data (Documents/Downloads/Desktop/Pictures, redirected) |
| Electron/Squirrel apps with no location choice (Discord, Slack, Zoom, Telegram, Claude Desktop) | Two Obsidian vaults (Jarvis, The Plan) |
| Microsoft Store apps (WhatsApp, PowerToys as installed) | Ollama models, npm cache, Miniconda (`D:\conda`), Everything |
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

## Flashcards

Why can't Discord/Slack/Zoom/Telegram/WhatsApp/Claude Desktop be installed to D: even with Chris Titus Tech or winget?::Their installers (Squirrel-based Electron, or Microsoft Store) expose no location option — a technical constraint of the installer, not a policy choice.
#cards/laptop

As of 2026-09-15, which drive does WSL live on, and why did it change twice?::D: (`D:\WSL\Ubuntu`). Originally planned for D:/a dedicated disk (2026-09-11), moved to C: (2026-09-13) to avoid drive-confusion, then reversed back to D: (2026-09-15) once the real 310GB/690GB split made C:'s capacity risk (WSL+Docker's unbounded VHDX growth) outweigh that convenience.
#cards/laptop

Does a silent/unattended winget install still show an installer's location picker if one exists?::Generally no — silent mode skips the prompt and takes the installer's own default (usually C:), even for installers that would ask interactively. Apps with a real location choice need an explicit `winget install --location` override or a manual GUI run to land on D:.
#cards/laptop
