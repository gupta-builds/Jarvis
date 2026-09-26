---
type: concept
status: sprout
created: 2026-09-26
updated: 2026-09-26
course: Life
track:
  - laptop
  - vscode
  - ai-infrastructure
tags:
  - concept
notes:
  - "[[VS Code Professional Setup]]"
  - "[[VS Code - Install Loop]]"
  - "[[VS Code - Windows]]"
  - "[[Jarvis MCP and REST API Setup]]"
next: "Store THE_PLAN_API_KEY with sync-mcp.ps1 -SetSecret, then port the registry to WSL"
---
# VS Code - MCP and Secrets
## One-Line Answer
==No single MCP file is read by every AI tool, so the global layer is one registry (`~/.config/mcp/mcp.json`, same `mcpServers` shape as `.mcp.json`) pushed into each tool's own user-level config by `sync-mcp.ps1`, with secret values living only in user environment variables that every config references as `${VAR}`.== Project `.mcp.json` files stay, but only inside repos for repo-specific servers.
## Why the Home `.mcp.json` Was Replaced
The home `.mcp.json` looked like a global config, but tests and config inventories on 2026-09-26 showed it was not:
- *Only Claude Code read it.* Codex keeps its own list in `~\.codex\config.toml` (`jarvis`, `github`, `cua_repl`); Cursor, Kiro, Copilot CLI and Gemini CLI had no global MCP file at all. VS Code read it only when the home folder itself was open.
- *Claude Code treats it as project scope.* A probe `.mcp.json` placed in a parent folder showed up from its child and grandchild folders as `Pending approval`, so every new project under home would ask to approve Jarvis again. Folders outside home, such as `D:\_Anant\10_Areas\UMN\Classes`, never saw it.
- *Precedence works against it.* Claude Code resolves local, then project, then user scope, and uses one whole entry. A stale home `.mcp.json` silently shadows an updated user-scope definition.
- *Its GitHub server was dead.* `@modelcontextprotocol/server-github` is marked deprecated on npm and `GITHUB_PERSONAL_ACCESS_TOKEN` was never set as an environment variable (it only exists inside `.mcp.env`, which no tool loads).
> [!WARNING]
> A claim made during the first move was wrong: that the home `.mcp.json` only worked when Claude Code started in the home folder. The parent-folder probe disproved it. The move to user scope still holds for the four reasons above.

## How It Works Now
| Layer | Where | Role |
|---|---|---|
| Registry | `~/.config/mcp/mcp.json` | the one list of global servers; `targets` per server; `${VAR}` references only |
| Sync | `~/.config/mcp/sync-mcp.ps1` (task `mcp: sync registry to all tools`, or `mcp-sync` in a home terminal) | translates and applies; reports tool-only servers, never deletes them |
| Claude Code | `~\.claude.json` user scope | written with `claude mcp add --scope user` |
| VS Code | `%APPDATA%\Code\User\mcp.json` | `${VAR}` becomes `${env:VAR}`; synced by Settings Sync |
| Codex | `~\.codex\config.toml` | written with `codex mcp add --url --bearer-token-env-var` (HTTP servers only) |
| Project | `<repo>/.mcp.json` | repo-specific servers, committed, `${VAR}` only |
Proven on 2026-09-26 with a throwaway `probe-sync` server: one run added it to all three tools with the token held as a variable reference in each tool's syntax, a second run reported every entry in sync, and the probe was then removed everywhere.
*Current registry:* `jarvis` and `the-plan` (targets Claude Code and VS Code). Codex keeps its own `jarvis`, a stdio server over the vault filesystem, on purpose. VS Code keeps its gallery servers (Context7, GitHub remote, Firecrawl).
*Adding a server:* add it to the registry, run the dry run, apply, run `claude mcp list`.
## Secrets
- *Values:* user environment variables. `.mcp.env` is your written record of them; no tool loads it. Store or rotate a value with `sync-mcp.ps1 -SetSecret NAME`: a hidden prompt, nothing echoed, and the name is added to `WSLENV`.
- *Never readable by Claude Code:* `~/.claude/settings.json` now denies `Read` on `.env`, `.env.local`, `.env.*.local`, `.env.production`, `.mcp.env`, `.credentials.json` anywhere on any drive, plus `~/.ssh`, `~/.aws`, `~/.azure`, `~/.kube`, `~/.codex/auth.json` and the git credential script. Per Claude Code's docs these rules cover its file tools and recognised Bash reads (`cat`, `head`, `tail`, `sed`, redirections). Verified with a dummy `.env`: blocked, while a normal file next to it was read.
- *Never committed:* `~/.config/git/ignore` ignores `.env`, `.env.local`, `.env.*.local`, `.env.production`, `.mcp.env`, `.credentials.json`, `*.pem`, `*.key` in every repo. Verified: `.env.example` still shows up.
- *Never on screen:* the dotenv extension (`dotenv.dotenv-vscode`) cloaks values in env files with a black `█` (`dotenv.enableAutocloaking: true`). It is display-only; the file is unchanged. Hover to peek (`dotenv.enableSecretpeeking`) or run `Dotenv: Toggle auto-cloaking` to copy a value.
- *Other agents:* the deny rules are Claude Code's. Codex, Copilot and others still rely on `AGENTS.md` plus their own sandboxes.
## WSLENV and How WSL Reaches Jarvis
`WSLENV` is a Windows variable listing the names of other variables to share with WSL processes started from Windows. The `/u` flag limits sharing to Windows-to-WSL. It is now `JARVIS_API_KEY/u:THE_PLAN_API_KEY/u`. The value stays in the Windows user environment; WSL receives it as an ordinary variable. Networking is `mirrored`, so `127.0.0.1:27123` inside WSL is Obsidian on Windows: HTTP 401 without the key, 200 with it (tested 2026-09-26).
> [!WARNING]
> WSLENV only reaches WSL processes launched from a Windows process that has the variable: VS Code, Windows Terminal, `wsl.exe`. A cron job or systemd service inside WSL does not get it. Scheduled work in WSL must load its secrets explicitly.

## Six-Month Pre-Mortem
Assume it is March 2027 and the setup has failed. The likely causes, with the guard already in place or still needed:
1. **A server added in one tool only**
	Claude has it, Codex does not. *Guard:* registry plus sync; the sync report lists tool-only servers.
2. **Rotated Obsidian key**
	Every tool starts returning 401, as `the-plan` does today with no key set. *Guard:* `-SetSecret` updates one place; restart VS Code and terminals afterwards.
3. **Scheduled jobs without secrets**
	Task Scheduler and WSL cron do not inherit VS Code or WSLENV. *Needed:* each scheduled script reads its variables explicitly. Windows jobs get user env vars; WSL jobs need a WSL-side source.
4. **Settings Sync overwriting good config** (already happened once, [[VS Code - Windows]]). *Guard:* Accept Local on new devices, backups in `%APPDATA%\Code\User-backup-20260924\`, machine-scoped settings never sync.
5. **VS Code renaming agent settings**
	The `chat.*` settings moved fast through 1.137 to 1.139. *Guard:* check `@modified` settings against release notes monthly.
6. **Registry script vs maturing tools**
	rulesync (v21.0.0, 2026-09-26) claims global MCP output, but its docs do not say which user files it writes or whether it merges `~/.claude.json`. Ruler writes project files only. *Revisit* in three months; the registry format is already the portable `mcpServers` shape.
7. **Secrets outside Claude's deny list**
	A new secret file type, or an agent other than Claude. *Guard:* add patterns to the deny list and the global git ignore together.
8. **WSL drifting behind Windows**
	WSL is not manually verified yet. *Next:* WSL reads the same registry at `/mnt/c/Users/anant/.config/mcp/mcp.json` through a bash port of the sync script.
## Sources
[Claude Code MCP scopes and env expansion](https://code.claude.com/docs/en/mcp), [Claude Code permissions](https://code.claude.com/docs/en/permissions), [VS Code MCP servers](https://code.visualstudio.com/docs/copilot/customization/mcp-servers), [WSLENV](https://learn.microsoft.com/en-us/windows/wsl/filesystems), [rulesync](https://github.com/dyoshikawa/rulesync), [Ruler](https://github.com/intellectronica/ruler), [dotenv for VS Code](https://marketplace.visualstudio.com/items?itemName=dotenv.dotenv-vscode), Codex CLI `codex mcp add --help` (0.155.1).