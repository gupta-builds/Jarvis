---
type: note
status: sprout
created: 2026-10-15
updated: 2026-10-15
course: Life
track:
  - laptop
  - windows
tags:
  - note
  - laptop
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Machine Toolkit - Tool Use Cases and Agent Guide]]"
  - "[[Installations]]"
  - "[[Acer Session Handoff - Toolkit Sync (Build 5b)]]"
next: "Acer Parts 0 to 3 are done. The Dell session writes the parity matrix and runs 20-apply-configs.ps1 once to pick up the promoted bat and fd files."
---
# Acer Run Sheet - Windows Toolkit

## One-Line Answer
==Run Part 0 on the Acer first (it changes nothing), paste the tables back, and only then run the install and config steps; the Dell has already been through all of them and its versions are recorded in `toolkit.lock.json`.==

## Who this is for
The Claude session or the user on the Acer, Windows side, in a **normal** (not elevated) PowerShell. The Dell session has no access to the Acer. This sheet covers the Windows toolkit only. The WSL toolkit is a separate visit note: [[Acer Session Handoff - Toolkit Sync (Build 5b)]]. Do both in one Acer visit.

## What is different on the Acer (read this first)
| Item | Dell | Acer | Why it matters |
|---|---|---|---|
| Vault root | `D:\Users\_Anant\10_Areas\Documents\Jarvis` | `D:\_Anant\20_Progress\Documents\Jarvis` | The scripts find the vault by environment variable, then by candidate paths that contain `AGENTS.md`. The role (`acer`) is detected from this path. Pass `-Machine acer` anyway. |
| Computer name | `DESKTOP-3VBG0JH` | blank in the manifest | Role detection must not rely on the name. |
| Tailscale | absent on Windows (runs inside the Dell's WSL as `dell-wsl`) | installed on Windows as `gupta-builds` | Verify only. Never install it in the Acer's WSL. Never reinstall or sign out on Windows. |
| GPU | Intel Iris Xe only | RTX 5070 Ti | Heavy local models belong here, not on the Dell. |
| Kiro, Miniconda, opam | present (Dell-only in the manifest) | not part of this toolkit | Do not install them. |
| Chocolatey and Python 3.13.5 | retired on the Dell | not part of this toolkit | Do not run `04-admin-remove.ps1` or `11-node-lts-swap.ps1` on the Acer. Both are Dell-only. |
| Font | per-user install on C: (about 760 MB, two sets) | system-wide | The install script adopts what exists. |
| VS Code | on C: | on D:\Apps | The scripts only verify it. They never write VS Code, MCP or Claude Code settings. Settings Sync is live. |
| Terminal Ubuntu profile | `Ubuntu (Dell)` | `Ubuntu-24.04 (Acer)` | Machine profiles are preserved by the Terminal merge. |
| Node | LTS 24 (was 22) | check; the sheet does not change it | `10-install-toolkit.ps1` installs LTS if missing. Any Node major change is a decision for the user. |

## Where the scripts are on the Acer
Syncthing carries the vault. Wait until it finishes, then:
```powershell
$V  = 'D:\_Anant\20_Progress\Documents\Jarvis'
$TK = "$V\40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\Windows Toolkit"
Test-Path "$TK\_scripts\00-preflight.ps1"      # must print True
Test-Path "$V\AGENTS.md"                        # must print True
```
If the vault is elsewhere: `ls D:\_Anant\*\Documents` and set `$V` to the folder that contains `AGENTS.md`, or set the user variable `TOOLKIT_VAULT_ROOT` to it.

Command template for every script (quote the full path, run as a file):
```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\<script>.ps1" -Machine acer [switches]
```
Every script prints a result table (`ID STATUS DETAIL`), writes a log to `D:\WSL\ops\windows\logs\` and a result JSON to `$TK\results\<host>\`. A script that fails a required check exits non-zero. Statuses: `PASS`, `INFO`, `PLAN` (dry run), `PENDING`, `DIFF` (differs from the source, nothing was overwritten), `WARN`, `FAIL`.

## Part 0 - read-only paste-back (run this first, nothing changes)
The Acer already has parts of the toolkit from 2026-10-12 (fzf, fd, bat, delta, zoxide, PSFzf), so start by finding out exactly what is present.
```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\00-preflight.ps1" -Machine acer
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\10-install-toolkit.ps1" -Machine acer -DryRun
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\20-apply-configs.ps1" -Machine acer -DryRun
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\99-verify.ps1" -Machine acer
```
Do not pass `-WriteLock` on the Acer: only the Dell writes `toolkit.lock.json`. `00` prints the machine, vault, manifest, a secret scan of the shared configs and the plan. `10 -DryRun` lists what it would install or adopt. `20 -DryRun` lists each config as MATCH, DIFF or MISSING without writing. `99-verify` compares the manifest with reality; Dell-only rows show as skipped.

**Paste back** the four result tables (the `ID STATUS DETAIL` blocks) plus the four result JSON paths, and this one-liner:
```powershell
winget list --disable-interactivity | Select-String -Pattern 'Tailscale|PowerShell|Starship|NanaZip|Docker|Ollama|Cursor|Antigravity|Visual Studio Code|Claude'
```
The Dell session reads both result sets and writes the parity matrix (PASS or DIFF with a reason). Do Part 1 only after that, or if the user says go.

## Part 1 - install and adopt (normal shell, UAC prompts)
Close editors first (the Git upgrade replaces files in use). UAC prompts appear for Git, GitHub CLI, Starship and Node; accept them.
```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\10-install-toolkit.ps1" -Machine acer
```
Prints one line per tool (`installed=... version=...`) and a summary. It continues past a single failed package. It never installs Tailscale, never removes anything and never touches Node's major version. Needs: internet, `winget`.

## Part 2 - apply the shared configs
```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\20-apply-configs.ps1" -Machine acer
```
Writes (after a timestamped backup to `D:\Backup\Toolkit\<timestamp>\`): the managed profile block in both PowerShell profiles, `starship.toml`, the global git ignore, the shared delta include, bat and fd configs, the Terminal fragment merged into `settings.json` (Acer profiles preserved), git settings and the toolkit environment variables, and the user PATH order (standalone uv first). An existing bat or fd file is kept and reported as `DIFF`: the Acer's real files are the source, so a DIFF there means the shared copy in the vault needs updating, not the Acer. Tell the Dell session. Roll back with `-RestoreFrom "D:\Backup\Toolkit\<timestamp>"`.

## Part 3 - verify and catalog
Open a **fresh** terminal window (PATH and profile must reload), then:
```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\99-verify.ps1" -Machine acer
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "$TK\_scripts\40-build-catalog.ps1" -Machine acer
```
The second writes `$TK\catalog\Tool Catalog - <host>.md` and `.json`. It never prints secrets or `.bashrc`. Paste back the `99-verify` table and the catalog's file name; Syncthing carries the catalog to the Dell.

## Do not run on the Acer
`11-node-lts-swap.ps1`, `04-admin-remove.ps1`, `60-build5b-host.ps1`, `05-startup-cleanup.ps1`, `06-ollama-check.ps1` and anything in `D:\WSL\ops` that belongs to the Dell. Never `wsl --shutdown` from inside WSL.

## After it ran
Say so in the Dell session. It reads both result sets (`results\DESKTOP-3VBG0JH` and the Acer's folder) and writes the parity matrix into [[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]. Known differences to expect: Terminal version (the Dell stays on 1.24), VS Code location, font scope, Kiro and the Dell-only runtimes, and pnpm: the Windows winget pnpm is 12.11.2 on the Dell while the WSL pnpm on both laptops is Corepack-pinned to 12.4.2.

## Acer run log, 2026-10-15
Run from the Acer, Windows side, by a Claude Code session started from WSL. Order followed: Part 0, then Part 2. Part 1 and Part 3 are waiting for the user (UAC prompts, closed editors).
**Gotcha that stopped the first attempt:** when the scripts are started from a session or shell that inherited PowerShell 7's `PSModulePath`, Windows PowerShell 5.1 loads PowerShell 7's `Microsoft.PowerShell.Utility` first and every script fails with "The term 'Get-FileHash' is not recognized". Nothing had run. Fix: before starting a script from such a shell, reset the variable: `$env:PSModulePath = [Environment]::GetEnvironmentVariable('PSModulePath','Machine')`. A normal Windows PowerShell 5.1 window does not need it. Not a toolkit bug, but worth a line in `_lib.ps1` (`Initialize-Toolkit`) if you want it to guard itself.
**Part 0 results (read-only):** preflight 47 manifest entries, 5 planned actions; `10 -DryRun` would upgrade Git (2.55.0 to latest) and GitHub CLI (2.101.0 to latest), install pnpm 12.11.2, install a uv-managed Python and install mcp-remote 0.2.1; Node is reported MANUAL because the manifest looks for `OpenJS.NodeJS.22` (the Acer has Node 24.19.0 and the sheet says not to change it). `99-verify` before Part 2 (versions compared with the Dell lock): the Acer is ahead on PowerShell 7.6.7, ripgrep 15.2.0, ffmpeg 9.0.1, Claude Code 2.1.301, Codex 0.162.1, Cursor 3.24.9, Docker Desktop 4.91.0, Docker CLI 29.8.0 and VS Code 1.142.0; it is behind on GitHub CLI 2.101.0 (lock 2.102.0), Node 24.19.0 (lock 24.20.0), npm 11.17.0, Ollama 0.34.1 (lock 0.40.3) and Antigravity 2.13.0 (lock 2.22.0). Tailscale 1.104.1 PASS.
**Part 2 results (applied):** starship and git ignore unchanged (hashes equal); delta include written; both profile blocks written; Terminal merged; 9 git settings changed (3 were already correct); user PATH now has `C:\Users\anant\.local\bin` first; `STARSHIP_CONFIG` and `TOOLKIT_VAULT_ROOT` set. bat and fd are DIFF and were kept (below). Backups: `D:\Backup\Toolkit\20261015-170556` (restore with `-RestoreFrom`).
**bat and fd (promotion decision for the Dell session):** the shared copies are reconstructed. Real Acer bat config is the same three options but quotes the style value (`--style="numbers,changes,header"`) and has no header comment; the real Acer fd ignore has trailing slashes on directories and also lists `venv/`, `.conda/`, `.ipynb_checkpoints/` and `*.pyc`, which the shared copy lacks. Promote the Acer's files into `configs/` if you want them as the source; the Dell then re-runs `20-apply-configs.ps1`.
**Still to run (user):** Part 1, then a fresh terminal and Part 3. Remaining `99-verify` FAILs before Part 2 that Part 2 should clear: profile blocks, git keys, the two environment variables, delta include, Terminal Ubuntu profile name and the single extra scheme. Re-run `99-verify` after Part 1 and check which remain.

### Acer run log, continued (2026-10-15 17:19 to 17:45)
- **Part 1 (user, UAC):** `INSTALLED=3 MANUAL=1 OK=30 UPGRADED=1`, exit 0, no required failure. Installed: pnpm 12.11.2 (Windows copy), uv-managed Python 3.13.15, mcp-remote 0.2.1. Upgraded: GitHub CLI 2.101.0 to 2.102.0 (Git was already 2.55.0). Manual by design: Node (Acer stays on 24.19.0; moving it to 24.20.0 is a user decision). Result JSON: `results/GUPTA-BUILDS/10-install-toolkit-20261015-171821.json`.
- **Part 3:** the user's first attempt failed only because `$TK` was undefined in the new window ("The argument '\_scripts\99-verify.ps1' ... does not exist"); define `$V` and `$TK` (see "Where the scripts are on the Acer") in every new terminal, or paste them first. The session then ran both scripts. `99-verify.ps1`: 0 FAIL. Every config, git, profile, Terminal, font, environment-variable and shell-startup check is PASS (PowerShell 5.1 and 7 start in about 1.5 s with Starship and zoxide). Remaining DIFF rows are version drift against the Dell lock (Acer ahead: pwsh 7.6.7, ripgrep 15.2.0, ffmpeg 9.0.1, Claude Code 2.1.301, Codex 0.162.1, Cursor 3.24.9, Docker 4.91.0, VS Code 1.142.0; Acer behind: Node 24.19.0 vs 24.20.0, npm 11.17.0 vs 11.19.0, Ollama 0.34.1 vs 0.40.3, Antigravity 2.13.0 vs 2.22.0) and `cfg-bat`, `cfg-fd-ignore`. `40-build-catalog.ps1` PASS: `catalog/Tool Catalog - GUPTA-BUILDS.md` and `tool-catalog-GUPTA-BUILDS.json` (41 manifest tools). The Dell session can now write the parity matrix from `results/GUPTA-BUILDS` and `results/DESKTOP-3VBG0JH`.
- **bat and fd promoted (done):** the Acer's real files were copied byte for byte into `configs/bat/config` and `configs/fd/ignore` (SHA-256 `F613417D...` and `6A549EAF...`, no secret-like text). Old shared copies: `Runs/_backups/acer-visit-20261015/bat-config.pre-promotion` and `fd-ignore.pre-promotion`. `toolkit.json` was NOT edited (the Dell lock is tied to the manifest); the Acer keeps `onExisting: keep`, which is harmless now that the hashes are equal. **Dell action:** run `20-apply-configs.ps1` once so the Dell's bat and fd files match the promoted Acer files; its `99-verify` will show `cfg-bat` and `cfg-fd-ignore` as PASS afterwards. The Acer's `99-verify` should show both as PASS on its next run.
- **What is deliberately not on the Acer (more Windows installs may follow):** Kiro, Miniconda, opam, Chocolatey retirement and the Dell-only scripts, per the table at the top. Further Windows builds for the remote-SSH workflow (client-side tooling, SSH config, VS Code Remote settings) are part of the planned discussion and Build 6, not of this run.
