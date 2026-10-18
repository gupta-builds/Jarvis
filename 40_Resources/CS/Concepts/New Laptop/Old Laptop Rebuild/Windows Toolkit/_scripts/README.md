---
type: note
status: sprout
created: 2026-10-13
updated: 2026-10-17
course: Life
track:
  - laptop
  - windows
tags:
  - note
  - laptop
related:
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]]"
  - "[[Installations]]"
---
# Windows Toolkit scripts: run order and rollback

One manifest (`..\toolkit.json`) drives every script. Run them as files, one at a time, in a **normal** (not elevated) shell unless a row says otherwise. Quote the full path. All scripts are ASCII only, safe to run twice, take `-DryRun` (except `11`, which is dry by default and needs `-Apply`), log to `D:\WSL\ops\windows\logs\`, and write a result JSON to `..\results\<host>\`.

Command template (Windows PowerShell 5.1 or PowerShell 7):

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "<full path to script>" [switches]
```

## Run order (Dell, then Acer)
| Step | Script | Shell | Does | Notes |
|---|---|---|---|---|
| 1 | `00-preflight.ps1` | normal | read-only: machine, vault, manifest, scripts, config secret scan, plan | no changes |
| 2 | `10-install-toolkit.ps1` | normal | installs and adopts tools, the font, PSFzf, standalone uv, uv Python | UAC prompts for Git, GitHub CLI, Starship, Node. Close editors first (Git upgrade) |
| 3 | `11-node-lts-swap.ps1 -Apply` | **elevated**, Claude Code and editors closed | Dell only: Node 22 to LTS 24 | the Node 22 MSI refuses a non-elevated removal (error 1730); npm globals survive; dry run works in a normal shell |
| 4 | `20-apply-configs.ps1` | normal | profiles (managed block), Starship, git ignore, delta include, bat, fd, Terminal merge, git settings, env vars, user PATH order (standalone uv first) | backups to `D:\Backup\Toolkit\<timestamp>\`; the old user PATH is saved as `user-path-before.txt` there |
| 5 | `99-verify.ps1 -WriteLock` | normal, fresh window | manifest versus reality; Dell writes `toolkit.lock.json` | PENDING items wait for step 6 |
| 6 | `04-admin-remove.ps1 -IncludePython -Apply` | **elevated** | Dell only: retires Python 3.13.5 and Chocolatey | lives in `D:\WSL\ops\windows`; refuses until a standalone uv exists |
| 7 | `99-verify.ps1` again | normal, fresh window | PENDING items turn into PASS | |
| 8 | `40-build-catalog.ps1` | normal | writes `..\catalog\Tool Catalog - <host>.md` and `.json` | Phase 5 |

Steps 3 and 6 need an elevated shell. Closing order on the Dell: 10 (also `-Only uv-python`), 20, then 3 and 6 elevated with Claude Code closed, then 99 `-WriteLock` in a fresh normal window. `04-admin-remove.ps1` was patched on 2026-10-13 (backup in `D:\WSL\ops\windows\archive\`): its uv gate now checks every uv on PATH and requires a uv-managed Python 3.13, and it rewrites the Machine PATH from the raw registry value so `%SystemRoot%` entries and the REG_EXPAND_SZ type survive; the old value is saved to `D:\WSL\ops\windows\logs\machine-path-before-<time>.txt`.

## What each script never does
- `10` never installs Tailscale, never touches Node 22 (step 3 does), never removes anything.
- `20` never deletes: a replaced file is copied to `D:\Backup\Toolkit\<timestamp>\` first. It never touches VS Code, MCP or Claude Code settings, identity or `safe.directory` entries in git, or the Build 3 cache variables.
- `40` never prints `.bashrc`, environment values of secrets, MCP arguments or URLs, and never shuts WSL down.

## Placement (Build 3 layout contract)
Every tool here is small, installer-forced to C: (MSIX, MSI, per-user portable) or already placed by Build 3. Per-user fonts (27 TTFs, about 380 MB) cannot be redirected. Nothing in this toolkit creates a junction. Caches stay on D: through the Build 3 variables, which the scripts verify but never change.

## Deviations from the earlier design notes (live check won)
- The Starship and zoxide guards use a PowerShell global variable, not `$env:STARSHIP_SHELL`. Starship's init sets that environment variable, and child processes inherit it, so a guard on it would leave a nested `pwsh` inside `pwsh` without a prompt.
- The uv standalone installer is the official `uv-installer.ps1` for 0.12.19, downloaded and checked against a pinned SHA-256, run with `UV_NO_MODIFY_PATH=1`; the script adds `~\.local\bin` to the user PATH itself.
- Corepack is not enabled (needs admin under Program Files); pnpm comes from winget.
- The `bat` and `fd` configs were reconstructions until 2026-10-15, when the Acer's real files were promoted into `configs/` (SHA-256 `F613417D...` and `6A549EAF...`) and the Dell applied them on 2026-10-17. `toolkit.json` was not edited, so the lock stays valid.

## Rollback
- Files: `powershell.exe -NoProfile -ExecutionPolicy Bypass -File "...\20-apply-configs.ps1" -RestoreFrom "D:\Backup\Toolkit\<timestamp>"` copies every backed-up file back.
- Git: `git config --global --unset <key>` for each key in `toolkit.json` `gitSettings`; remove the `include.path` line and the `credential.https://github.com.helper` entries with `git config --global --edit`.
- Environment variables: remove `STARSHIP_CONFIG` and `TOOLKIT_VAULT_ROOT` in System Properties, Environment Variables (user).
- Tools: `winget uninstall --id <Id> --exact`. The per-user font files are in `%LOCALAPPDATA%\Microsoft\Windows\Fonts` (names start `IosevkaTermNerdFontMono-`) with matching values under `HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Fonts`.
- Node: `winget install --id OpenJS.NodeJS.22 --exact` brings Node 22 back.

## Test overrides (for maintenance only)
`20-apply-configs.ps1` accepts `-TerminalSettingsPath`, `-TestProfileDir` and `-BackupBase` so the Terminal merge and the profile block can be exercised on copies. `-Only` takes config ids (`starship,git-ignore,git-delta,bat,fd-ignore,profile-ps5,profile-pwsh,terminal,git-settings,env`) or tool ids for `10`.

## Running on the Acer (from the 2026-10-15 visit)
- Set `$V` (the vault root) and `$TK` (this toolkit folder) in every new terminal window; the role (`acer` or `dell`) is detected from the vault path, and `-Machine acer` overrides it. The Acer vault root is `D:\_Anant\20_Progress\Documents\Jarvis`.
- Start the scripts from a normal Windows PowerShell 5.1 window. From a shell that inherited PowerShell 7's `PSModulePath`, 5.1 fails with "The term 'Get-FileHash' is not recognized"; reset it first: `$env:PSModulePath = [Environment]::GetEnvironmentVariable('PSModulePath','Machine')`.
- Order: `00-preflight.ps1`, `10-install-toolkit.ps1 -DryRun`, `20-apply-configs.ps1 -DryRun`, `99-verify.ps1` (all read-only), then `10-install-toolkit.ps1` (UAC), `20-apply-configs.ps1`, a fresh window, `99-verify.ps1`, `40-build-catalog.ps1`. Never `-WriteLock` on the Acer; never `11-node-lts-swap.ps1` or `04-admin-remove.ps1` there.
- Result of the 2026-10-15 run and the parity matrix: [[Old Laptop Rebuild - Acer Visit Findings (2026-10-15)]].

## Host-ops scripts
The scripts that ran during Builds 3 to 5 outside this manifest (weekly clean, watcher, WSL export, startup and quarantine cleanup) are in `host-ops/` with their own README.