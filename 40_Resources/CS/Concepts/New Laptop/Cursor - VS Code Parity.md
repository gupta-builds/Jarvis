---
type: concept
status: sprout
created: 2026-11-18
updated: 2026-11-18
course: Life
track:
  - laptop
  - vscode
  - ai-infrastructure
tags:
  - concept
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - Windows]]"
  - "[[VS Code - WSL]]"
  - "[[VS Code - Install Loop]]"
  - "[[VS Code - MCP and Secrets]]"
  - "[[VS Code - Terminal Environments]]"
  - "[[Installations]]"
next: "Reload Cursor and run the four checks below; decide how Cursor gets FIRECRAWL_API_KEY and CONTEXT7_API_KEY; remove and rotate the stale plaintext MCP file"
---
# Cursor - VS Code Parity
## One-Line Answer
==On 2026-11-18 Cursor was made to follow the VS Code setup (settings, keybindings, tasks, WSL machine settings, MCP, extensions) with VS Code as the single source of truth, and VS Code itself was not changed in that pass.==
This note records what a separate Cursor session did, taken from that session's own report. It was not re-checked from the WSL session that wrote this note, so every item under "What was copied" is the report's claim until the four checks below pass.
## The rule
VS Code is the source of truth. Cursor-only keys (`cursor.*`, `kilo-code.*`) were kept and everything else in the Cursor user file now mirrors the VS Code user file. Change a setting in VS Code, then re-run the parity, instead of editing Cursor by hand. Cursor needs **Developer: Reload Window** (or a restart) before any of it loads.
Backup of the old Cursor settings: `%APPDATA%\Cursor\User\backups\settings.json.20261118T221813.bak`.
## What was copied onto Cursor
| Layer | What carried over |
|---|---|
| User settings | Format on save, Biome and Ruff, terminal font and the `VSCODE_WORKSPACE` hook, file excludes, Git, Python projects, Error Lens, cSpell, Claude Code panel preferences, and the rest of the VS Code user file |
| Keybindings | All of them, including `Ctrl+Alt+R`, `Ctrl+Alt+T` and `Ctrl+Alt+L` for tasks |
| User tasks | Conda export, environment scaffold, MCP sync, uv |
| WSL machine settings | Bash as the default shell, conda path, watcher excludes, Semgrep |
| MCP | `jarvis` and `the-plan` stay on the existing WSL bridge; Context7 and Firecrawl were added to match VS Code; GitHub stays on the npx server |
## Extensions
- **Cursor WSL** now has the VS Code WSL set: Ruff, Biome, Todo Tree, YAML, TOML, Spell Checker, ShellCheck, Error Lens, Jupyter, Claude Code, Codex and the rest.
- **Windows Cursor** has the same set plus PowerShell and Markdown All in One.

Differences that are intentional, because Cursor cannot match VS Code one to one:

| VS Code | Cursor | Why |
|---|---|---|
| Pylance | `cursorpyright` | Pylance is not offered in Cursor |
| Remote SSH, WSL, Containers | `anysphere.remote-*` | Cursor ships its own remote extensions |
| Data Wrangler | Sideloaded in WSL Cursor; rebuilt VSIX on Windows Cursor | Not in Cursor's marketplace. The first Windows package had an invalid layout and failed to install; the VSIX was rebuilt with the correct layout and installed. Reload if it does not show |
| rust-analyzer | Installed in WSL Cursor only | The Cursor marketplace lists it as unavailable for Windows 64-bit |
| GitHub MCP (Copilot HTTP) | GitHub via the npx server | Cursor does not use VS Code's Copilot HTTP MCP |
## MCP and keys
- `jarvis` and `the-plan` still go through the vault bridge ([[VS Code - MCP and Secrets]], [[Jarvis MCP and REST API Setup]]). Nothing about them changed.
- Context7 and Firecrawl read `CONTEXT7_API_KEY` and `FIRECRAWL_API_KEY` from the environment Cursor inherits. If they are not there, Cursor's MCP servers start without a key.
- **Not copied on purpose:** `~/.vscode-server/data/User/mcp.json`. The report calls it a stale VS Code-remote MCP list that contains a plaintext Obsidian key.
## Checks after reload
1. Cursor Settings, MCP: `jarvis`, `the-plan`, Context7, Firecrawl and GitHub are listed and connected.
2. Format on save still uses Biome (JS and TS) and Ruff (Python).
3. `Ctrl+Alt+R` shows the user tasks.
4. Data Wrangler appears in both Cursor WSL and Windows Cursor.
## Open items
- **Keys for Cursor in WSL.** The WSL key store (`~/.mcp.env`, loaded by the `launch.sh` wrappers for `claude`, `codex`, `kiro-cli`, `agy`, `opencode` and `firecrawl`) has no wrapper for Cursor, and a Cursor window started from Windows only receives variables listed in `WSLENV`. So a key stored for WSL does not reach Cursor's Context7 and Firecrawl servers by itself. Decide one route: set the Windows user variable with `sync-mcp.ps1 -SetSecret NAME` (which adds it to `WSLENV`), or move the two servers into the MCP registry, where `${VAR}` references are resolved per tool. `FIRECRAWL_API_KEY` does not exist on the Dell yet (see [[VS Code - MCP and Secrets]]).
- **Registry drift.** Context7 and Firecrawl were added directly to Cursor's MCP file, outside the registry. The sync reports tool-only servers and never deletes them, so this is safe, but the registry is no longer the whole list for Cursor.
- **The stale plaintext key.** A file holding a plaintext Obsidian key exists in `~/.vscode-server/data/User/`. It was not opened for this note. Delete the file once nothing needs it, and rotate that Obsidian key, since a plaintext copy may have been synced or backed up. Rotation follows the `-SetSecret` steps in [[VS Code - MCP and Secrets]].
- **Parity is a snapshot.** Nothing re-applies it automatically. Re-run it after any VS Code settings change.
## Links
[[VS Code Professional Setup]], [[VS Code - Windows]], [[VS Code - WSL]], [[VS Code - Install Loop]], [[VS Code - MCP and Secrets]], [[VS Code - Terminal Environments]], [[Installations]]
