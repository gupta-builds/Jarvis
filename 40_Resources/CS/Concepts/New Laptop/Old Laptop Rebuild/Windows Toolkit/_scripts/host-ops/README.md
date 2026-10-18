---
type: note
status: sprout
created: 2026-10-17
updated: 2026-10-17
course: Life
track:
  - laptop
  - windows
tags:
  - note
  - laptop
related:
  - "[[Old Laptop Rebuild - Index]]"
  - "[[Old Laptop Rebuild - Build 3b C Drive Snapshot Structure and Watch]]"
  - "[[Old Laptop Rebuild - Build 4 Windows Toolkit Findings]]"
  - "[[Old Laptop Rebuild - Build 5 WSL and D Drive Findings]]"
---
# Host-ops scripts (Dell): what they are and when to use them

These are the Windows-host and WSL-host scripts that ran on the Dell during Builds 3 to 5. The running copies live in `D:\WSL\ops` (and `D:\WSL\ops\windows`); the copies here are the documentation backup, so the process can be repeated if the disk is lost. They are separate from the toolkit scripts one folder up, which are driven by `toolkit.json`. Every script is ASCII-only, a dry run unless `-Apply` (or `--apply`/`--remove` for the shell ones), writes a log under `D:\WSL\ops\windows\logs`, and prints no secrets. Run them as files: `powershell -ExecutionPolicy Bypass -File <path> [-Apply]`.

| Script | Run in | Purpose | Status |
|---|---|---|---|
| `weekly-clean.ps1` | scheduled task `Toolkit-Weekly-Clean` (Sundays 03:30) | removes only regenerable caches: old Temp, kernel dumps, WER, updater caches, crash reports. Supports `-DryRun` | live; first scheduled run 2026-10-18 |
| `watch-c.ps1` | scheduled task `Toolkit-Watch-C` (daily 08:00) | read-only watcher: appends `watch\watch-history.csv`, writes `watch\latest.json` and `watch\ALERTS.txt` | live |
| `04-admin-remove.ps1` | elevated | removes Logi Options+, old VC++ and .NET 9; `-IncludeDotnet8` and `-IncludePython` are gated (the dry run also needs elevation) | used in Builds 3 and 4; .NET 8 deliberately kept |
| `08-finish-cleanup.ps1` | elevated | Build 3 finishing step (empty leftovers, installers, Spotify offline storage) | ran 2026-10-12 |
| `60-build5b-host.ps1` | normal | WSL export host script. `-Stages` is a comma list (`ChatGPT`, `Cursor`, `Export`, `Verify`, `Quarantine`); dry run unless `-Apply`; never force-kills Cursor; verifies the tar with GNU tar through `verify-tar.sh` and writes an 8-line manifest | used 2026-10-14 to 10-15 |
| `verify-tar.sh` | WSL, called by the script above | lists a tar with GNU tar and prints `entries=`, `rc=`, `notes=` | live |
| `05-startup-cleanup.ps1` | normal | quarantines dead startup shortcuts and `~\.openclaw`, uninstalls the `openclaw` npm package, disables the Ollama startup shortcut reversibly | ran 2026-10-14 |
| `06-ollama-check.ps1` | normal | starts the Windows Ollama server and checks `OLLAMA_MODELS`, the port owner and `ollama list` | ran 2026-10-15 |
| `07-build5-leftovers.ps1` and `build5-leftovers.sh` | normal (calls the helper in WSL) | quarantines Cursor's WSL server data and the old pnpm v10 stores, disables the backfill task; refuses to run while a Cursor server process exists | ran 2026-10-15 |
| `firecrawl-key-move.sh` | WSL | removes an API key line from `~/.bashrc` (`--remove`) or moves it to `~/.mcp.env` (`--apply`); checks the key against the provider's status endpoint without printing it | `--remove` ran 2026-10-15 |
| `09-remove-leftover-apps.ps1` | elevated for `-Apply` | removes Rize, the GitKraken CLI folders and the stale Python 3.13.5 registrations | ran 2026-10-17 |
| `08-quarantine-purge.ps1` | normal | checks the surviving WSL backup and the machine, writes a context record, deletes the quarantine | ran 2026-10-17 |

**Patterns worth reusing:** keep a dry run as the default; make a destructive script refuse to run until its safety conditions hold (a verified export, no running updater); write a text record before deleting; test against dummy data first (the key script has `FC_TEST_*` overrides); never put quoted multi-word commands through `wsl.exe` from PowerShell 5.1, use a helper `.sh`.