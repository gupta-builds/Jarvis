---
type: index
status: sprout
created: 2026-08-26
updated: 2026-09-26
course: Life
track:
  - laptop
  - vscode
prerequisites:
  - "[[New Laptop Setup]]"
used_in: []
evidence: []
tags:
  - moc
  - concept
related:
  - "[[New Laptop Setup]]"
  - "[[Ubuntu - WSL]]"
  - "[[WSL Session Briefing]]"
notes:
  - "[[VS Code - Windows]]"
  - "[[VS Code - WSL]]"
  - "[[VS Code - Terminal Environments]]"
  - "[[VS Code - MCP and Secrets]]"
  - "[[VS Code - Install Loop]]"
  - "[[Installations]]"
  - "[[second-brain-claudekit-new-laptop-directive]]"
next: Give second-brain-claudekit its .vscode/ folder; keep every install
  mirrored through the Install Loop
---
# VS Code Professional Setup
## Purpose
==VS Code is the home base for every piece of work on the Acer, and this note is the map for how it is configured: what is shared across Windows and WSL, what exists twice, and which VS Code system owns which job.== Read this first, then go to the platform note for whichever side you are changing. The developer baseline (settings, keybindings, extensions on both sides, WSL Remote settings) was applied on 2026-09-24.
## Map
The setup splits into two platform notes because VS Code genuinely runs two different installations on this laptop. [[VS Code - Windows]] covers the Windows home (`C:\Users\anant`), the client app, the user settings layer that every window inherits, the Windows environments (miniconda on `D:\conda`, standalone uv), the Settings Sync incident, and the log evidence for every failure found on this laptop so far. [[VS Code - WSL]] covers the WSL home (`/home/anant_gupta`), the VS Code Server inside Ubuntu, the Remote settings layer, and the Linux toolchain where the main codebases live. Windows is the side verified first; WSL copies it once Windows is confirmed in daily use.
Three cross-cutting notes hold the systems both sides share. [[VS Code - Terminal Environments]] explains how every VS Code terminal loads a base environment plus the folder's `.vscode/env.ps1`, and what the home environment contains. [[VS Code - MCP and Secrets]] explains the global MCP registry and sync script, where secret values live, how WSL reaches Jarvis, and a six-month pre-mortem. [[VS Code - Install Loop]] owns the recurring job of keeping both sides aligned: the 40-extension limit and current list, mirror commands, and a check block with expected numbers.
This note holds everything else that is the same on both sides: settings precedence, Workspace Trust, the `.vscode/` folder, the agent customization files, the Agents window and dev containers, approvals and sandboxing, profiles, and Settings Sync.
Upstream, [[New Laptop Setup]] is the pinned index for the laptop, [[Installations]] records which drive each app landed on, and [[Ubuntu - WSL]] holds the WSL terminal tooling. The first real codebase to receive a `.vscode/` folder is `second-brain-claudekit`, documented in [[second-brain-claudekit-new-laptop-directive]].
## Where VS Code Keeps State
VS Code's UI always runs on Windows. What changes between a local window and a WSL window is where code executes and which extensions run.

| Layer | Windows | WSL | Settings Sync | In git |
|---|---|---|---|---|
| App + runtime flags | `D:\Apps\Microsoft VS Code`, `~\.vscode\argv.json` | none (client is always Windows) | no | no |
| User settings, keybindings, snippets, user tasks, MCP, profiles | `%APPDATA%\Code\User\` | inherited from Windows (same files) | yes | no |
| Remote (machine) settings | n/a | `~/.vscode-server/data/Machine/settings.json` | no | no |
| Extensions | `~\.vscode\extensions\` | `~/.vscode-server/extensions/` | Windows only | no |
| VS Code Server binary | n/a | `~/.vscode-server/bin/<commit>/` | no | no |
| Workspace config | `<repo>\.vscode\` | `<repo>/.vscode/` | no | yes |
| Agent user config | `~\.claude`, `~\.codex`, `~\.copilot` | `~/.claude`, `~/.codex`, `~/.copilot` (separate copies) | no | no |

> [!WARNING]
> `C:\Users\anant\.vscode\` is the extensions and `argv.json` folder, not a user settings folder. But the Windows home is also opened as a workspace (it is in VS Code's workspace history), so any `settings.json` or `tasks.json` dropped into `~\.vscode\` becomes that one workspace's config. User-wide settings belong in `%APPDATA%\Code\User\settings.json`.

## Settings Precedence
==Later scopes override earlier ones: Default, then User, then Remote, then Workspace, then Workspace Folder, with language-specific overrides at each level and policy settings above everything.== Two consequences matter here:
- *User settings reach WSL windows:* everything in `%APPDATA%\Code\User\settings.json` applies inside a WSL window too, except settings with `machine` or `machine-overridable` scope. So one user file covers editor behavior on both sides, and only machine-specific values (interpreter paths, Linux terminal profile) go in the WSL Remote settings file.
- *Some settings refuse workspace scope:* `git.path` and `terminal.external.*Exec` are user-only, and VS Code ignores them in `.vscode/settings.json`. The Claude Code extension reads `claudeCode.initialPermissionMode` from user settings only, so a cloned repo cannot pre-set its own permission mode.
Commands: `Preferences: Open User Settings (JSON)`, `Preferences: Open Remote Settings (JSON)`, `Preferences: Open Workspace Settings (JSON)`, `Preferences: Open Default Settings (JSON)`. In the Settings UI, `@modified` shows everything changed from default.
## Parity Contract Between Windows and WSL
==Anything about the editor is shared automatically because the UI is one Windows process; anything that executes code exists twice and must be mirrored by hand.==

| Thing | Shared? | How it stays aligned |
|---|---|---|
| Editor settings, keybindings, snippets, command palette, themes | shared | one user layer on Windows |
| Workspace Trust decisions | shared store, but per folder URI | a WSL folder and the same folder opened via `\\wsl.localhost` are different URIs |
| Codebases | separate clones | Windows and WSL work like two developers: each side has its own clone and they meet through GitHub. Only Jarvis syncs live (Syncthing) |
| Repo `.vscode/` and agent files (`AGENTS.md`, `CLAUDE.md`, `.claude/`) | travel with the repo | git |
| Extensions that run code (language servers, Claude Code, Python) | two installs, same set today | Install Loop (to create) |
| Toolchains (`uv`, `node`, `gh`, `pwsh`, `docker`) | two installs | Install Loop (to create) |
| Agent user config (`~/.claude`, `~/.codex`, `~/.copilot`) | two copies | fresh install per machine, per [[New Laptop Setup]] policy |
| Remote settings (Linux shell, watchers) | WSL only | [[VS Code - WSL]] |
Because each side owns its own clone, the different `core.autocrlf` values (Windows `true`, WSL `false`) are fine: git normalizes to LF in the repository either way. It only breaks if one working tree is edited from both sides.

## Settings Sync and the Old Dell
The worry is right, but for a different reason than expected. ==Settings Sync is tied to the account, not the machine: any VS Code that signs into the same GitHub or Microsoft account pulls and pushes the same cloud copy, and the first sign-in on a device merges local and cloud data automatically.== So if the Dell signs in, its 28 Windows-side extensions and its settings would merge into the Acer's cloud copy and then flow back down to the Acer.
What syncs: user settings (minus machine-scoped ones), keybindings (per OS by default), snippets, user tasks, MCP server configs, UI state, extensions and their global enablement, up to 20 profiles, and user prompts and instructions. What never syncs: workspace tasks, machine-scoped settings, anything excluded, and every extension installed in a remote window (WSL, SSH, dev container).
- *Decision for this laptop:* turn Sync on from the Acer only, and do not sign in on the Dell. The Dell is on the decommission path ([[Old Laptop Decommission Checklist]]), so there is nothing to gain from merging it.
- *If a machine must be excluded partially:* `settingsSync.ignoredSettings` and `settingsSync.ignoredExtensions`. `settingsSync.keybindingsPerPlatform: false` makes Windows and any future Linux or Mac client share one keybinding set.
- *Recovery:* `Settings Sync: Show Synced Data` keeps the latest 20 remote versions per category; `Settings Sync: Open Local Backups Folder` keeps 30 days locally.
- *WSL is never covered:* WSL extensions stay a manual mirror, which is the reason the Install Loop note exists.

*What actually happened (2026-09-25/26):* the cloud already held a copy from another machine. The first sign-in produced a settings conflict with an empty preview, local settings ended up as the remote's 2 keys, and the Dell's 9 extensions merged in. Settings were restored from backup and the extensions were audited; the cloud now holds this laptop's files. The full timeline is in [[VS Code - Windows]]. The rule stands: on a new device, choose Accept Local for settings and extensions, and check `settings.json` right after.
## Workspace Trust: the Base for Untrusted and Trusted Repos
VS Code's defaults on this machine: `security.workspace.trust.enabled` is on, `startupPrompt` is `never` (new folders open in Restricted Mode with a banner rather than a dialog), `emptyWindow` is trusted, `untrustedFiles` prompts. ==Restricted Mode blocks agents, the terminal, tasks, debugging, workspace settings that point at executables, and extensions that have not declared trust support, so an untrusted clone cannot execute anything just by being opened.==
Trust works best by location. Trusting a parent folder trusts everything under it, so the layout decides the policy:
- *Trusted parents:* folders where only your own code lands. Proposed per platform in [[VS Code - Windows]] and [[VS Code - WSL]].
- *Untrusted landing zone:* one folder where every third-party clone goes first, never trusted as a parent.
Procedure for a new untrusted repo:
1. Clone into the landing zone and open it. It opens in Restricted Mode.
2. Read before trusting: `.vscode/tasks.json` (look for `runOn: folderOpen`), `.vscode/settings.json`, `.devcontainer/`, `.mcp.json` and `.vscode/mcp.json`, `.claude/settings.json` (hooks run shell commands), `.github/hooks/`, `AGENTS.md`/`CLAUDE.md` (prompt-injection surface), and `package.json` scripts.
3. If it needs to run, run it in a dev container, not on the host.
4. Move it to a trusted parent only once it is actually yours to work in.
> [!WARNING]
> Claude Code's own docs warn that with auto-edit on, the agent can modify `settings.json` or `tasks.json`, which VS Code may then execute. Keep untrusted work in Manual mode or inside a container.

## The `.vscode` Folder and Its Neighbours
Each repo carries its own environment contract. Add a file only when the project actually needs it.

| File | Job | Notes |
|---|---|---|
| `.vscode/settings.json` | workspace settings | interpreter, formatter, file excludes for this repo |
| `.vscode/tasks.json` | named commands (`Ctrl+Shift+B` default build) | `runOn: folderOpen` needs trust and `task.allowAutomaticTasks` |
| `.vscode/launch.json` | debug configs, `compounds` for multi-process | Python uses `type: debugpy` |
| `.vscode/mcp.json` | workspace MCP servers (`servers`, `inputs`) | VS Code format |
| `.mcp.json` (repo root) | portable MCP config (`mcpServers`) | read by VS Code and Claude Code, the better choice for shared repos |
| `.vscode/*.code-snippets` | project snippets | |
| `.vscode/extensions.json` | recommended extensions | out of scope for now |
| `.devcontainer/devcontainer.json` | container environment | also enables Dev Container agent isolation |

Secrets never go in these files. MCP keys use `${input:id}` with `"password": true`, which the current user `mcp.json` already does for Context7 and Firecrawl.
A corrected `tasks.json` for a WSL `uv` project (the first version of this note used Windows `.venv\Scripts` paths, which do not exist in Linux):
```jsonc
{
  "version": "2.0.0",
  "tasks": [
    { "label": "uv: sync", "type": "shell", "command": "uv sync", "group": { "kind": "build", "isDefault": true } },
    { "label": "ruff: check", "type": "shell", "command": "uv run ruff check --fix .", "problemMatcher": [] },
    { "label": "pytest", "type": "shell", "command": "uv run pytest", "group": { "kind": "test", "isDefault": true }, "problemMatcher": [] }
  ]
}
```
And the matching `launch.json`:
```jsonc
{
  "version": "0.2.0",
  "configurations": [
    { "name": "Python: current file", "type": "debugpy", "request": "launch", "program": "${file}", "console": "integratedTerminal", "python": "${workspaceFolder}/.venv/bin/python" },
    { "name": "Pytest: current file", "type": "debugpy", "request": "launch", "module": "pytest", "args": ["${file}"], "console": "integratedTerminal", "python": "${workspaceFolder}/.venv/bin/python" }
  ]
}
```
Tasks are also the agent contract: if `pytest` and `ruff` are named tasks, the agent and you run exactly the same command.
## Agent Customization Layer
==In 2026 VS Code reads Claude Code's own file conventions, so one set of repo files can steer Claude Code, VS Code's Claude harness, Copilot (once restored), and Codex at the same time.== Instruction sources are additive with no precedence rule, so conflicting instructions across files are a bug to avoid, not something VS Code resolves.

| Type | Workspace location | User location | Controlling setting |
|---|---|---|---|
| Always-on instructions | `AGENTS.md` (root; nested files optional), `CLAUDE.md`, `.claude/CLAUDE.md`, `CLAUDE.local.md`, `.github/copilot-instructions.md` | `~/.claude/CLAUDE.md`, `~/.copilot/copilot-instructions.md` | `chat.useAgentsMdFile`, `chat.useNestedAgentsMdFiles` (off by default), `chat.useClaudeMdFile` |
| File-scoped instructions | `.github/instructions/*.instructions.md` (`applyTo` glob), `.claude/rules/` (`paths`) | profile or agent host folders | `chat.includeApplyingInstructions` |
| Skills | `.github/skills/`, `.claude/skills/`, `.agents/skills/` | `~/.copilot/skills/`, `~/.claude/skills/`, `~/.agents/skills/` | invoked with `/`; progressive disclosure |
| Custom agents | `.github/agents/*.agent.md`, `.claude/agents/*.md` | `~/.copilot/agents`, `~/.claude/agents` | Claude format mapped to VS Code tools |
| Hooks | `.github/hooks/*.json`, `.claude/settings.json` | `~/.copilot/hooks/*.json` | `chat.useHooks` (on), `chat.useClaudeHooks` (off) |
| Prompt files | `*.prompt.md` | profile | deprecated for Agent Host sessions; migrate to skills |

- *Hooks events (Local harness):* `SessionStart`, `UserPromptSubmit`, `PreToolUse`, `PostToolUse`, `PreCompact`, `SubagentStart`, `SubagentStop`, `Stop`. With `chat.useClaudeHooks` on, VS Code parses Claude-format hooks but ignores `matcher` values, so a Claude hook scoped to `Edit` would fire on every tool. Leave it off until that changes.
- *Agent Host sessions* read user-level customizations from `~/.claude` and `~/.copilot`, not from VS Code's profile folder. On this laptop those folders exist twice (Windows and WSL), which is why they appear in the parity table.
- *Skill frontmatter:* `name` (lowercase, hyphens, max 64), `description` (max 1024), optional `argument-hint`, `user-invocable`, `disable-model-invocation`, `context: fork`.
## Agents Window, Harnesses, and Isolation
The **Agents window** is a second, agent-first VS Code window for assigning tasks and tracking sessions across workspaces. Open it with `code --agents`, `Chat: Open Agents window`, or the taskbar jump list. `Ctrl+N` starts a session, `Ctrl+K Ctrl+N` a quick chat with no workspace.
A session is a **harness** plus an **isolation mode**. ==The harness decides which agent runs the loop; the isolation mode decides where its edits and commands land.==
- *Harnesses:* Local (VS Code's own, main editor only), Copilot, Claude (Anthropic's Claude Agent SDK, with Claude's slash commands and its Edit automatically / Request approval / Plan modes), Codex, and Cloud (GitHub-hosted, returns a PR). Claude sessions are toggled by `github.copilot.chat.claudeAgent.enabled`, now on.
- *Folder:* edits land in the open workspace, including uncommitted files.
- *New Worktree:* a separate git worktree from the last commit. Needs a repo with at least one commit, and permissions are fixed at Allow all. Worktrees isolate changes, not security.
- *Dev Container (experimental):* the session runs inside the repo's container. Needs `chat.agentHost.devContainer.enabled` (now on), a `devcontainer.json` in `.devcontainer/` or the repo root, and Docker running on the machine that holds the folder. Since 1.139 that includes WSL, SSH and Tunnel hosts.
- *Review:* the Changes panel shows diffs with range comments back to the agent, then Commit, Create PR, or Agent Merge (`chat.agentMerge.enabled`, experimental: watches the PR and fixes review feedback and CI failures).
- *Limits:* multi-root workspaces are not supported in sessions yet; multiple chats per session work for Copilot and Claude only.
Claude Code is the primary agent. Its agents, hooks, skills and settings live in `~/.claude/` and each repo's `.claude/`, which the extension, the CLI, and VS Code's Claude harness all read. Codex (`openai.chatgpt` extension, `codex` CLI) and Copilot are also available.
## Running an Agent Inside a Dev Container, Step by Step
This is the concrete path for "agents working inside dev containers". There are two routes to the same result: open the repo in the container and run Claude Code there, or start an Agents window session with Dev Container isolation.
1. **Start Docker Desktop**
	Docker Desktop's auto-start is off on purpose, so containers only run when needed. WSL integration for `Ubuntu-24.04` is already on and its disk lives at `D:\WSL\DockerDesktopWSL`. Once started, `docker version` inside WSL shows client and server 29.8.0 (verified 2026-09-24). The CSCI 4061 dev container failure on 2026-09-24 was exactly this step skipped: the log ends in `failed to connect to the docker API at npipe:////./pipe/dockerDesktopLinuxEngine`.
2. **Add `.devcontainer/devcontainer.json` to the repo**
	Minimal version with Claude Code and persisted login:
```json
{
  "name": "project",
  "image": "mcr.microsoft.com/devcontainers/base:ubuntu",
  "features": {
    "ghcr.io/devcontainers/features/node:1": {},
    "ghcr.io/anthropics/devcontainer-features/claude-code:1.0": {}
  },
  "remoteUser": "vscode",
  "mounts": ["source=claude-code-config-${devcontainerId},target=/home/vscode/.claude,type=volume"],
  "containerEnv": { "CLAUDE_CONFIG_DIR": "/home/vscode/.claude" },
  "postCreateCommand": "curl -LsSf https://astral.sh/uv/install.sh | sh"
}
```
3. **Route A: Reopen in Container**
	Open the repo in a WSL window, run `Dev Containers: Reopen in Container`, then run `claude` in the container terminal or use the Claude Code panel. Both run inside the container and share its `~/.claude` volume. Sign in once; the volume keeps the login across rebuilds.
4. **Route B: Agents window session**
	`chat.agentHost.devContainer.enabled` is already on. Open the Agents window, start a session on the repo, pick Dev Container isolation, then prompt.
5. **Verify yourself**
	Review the diff, then run the test task inside the container terminal. Do not trust the agent's own summary of test results.
Hardening, only when running unattended:
- Anthropic's reference container (`anthropics/claude-code/.devcontainer`) adds `init-firewall.sh`, which limits outbound traffic to an allowlist and needs `runArgs` with `NET_ADMIN` and `NET_RAW`.
- `--dangerously-skip-permissions` is refused when running as root, so `remoteUser` must be non-root. Pair it with the firewall.
- Never mount `~/.ssh` or cloud credential files. A bypassed session can still read and exfiltrate whatever is in the container, including the Claude credentials in `~/.claude`.
## Approvals and Sandboxing
Two separate layers. **Approvals** decide whether you are asked before a tool runs. **Sandboxing** decides what a terminal command can reach even when it runs without asking.
- *Permission levels:* Manual (default, uses your approval rules), Assisted (experimental, an LLM judge reviews each call; `chat.assistedPermissions.enabled`), Allow all. Autopilot is Allow all plus automatic retry.
- *Terminal rules:* `chat.tools.terminal.autoApprove` maps a command or `/regex/` to `true` or `false`. Built-in rules approve read-only commands and block `rm` and `del`. The applied rules approve read-only git, `uv run pytest|ruff`, and `pnpm|npm test|run lint`.
- *Global switches to avoid:* `chat.tools.global.autoApprove` and the `/yolo` command approve everything everywhere. `Chat: Manage Tool Approval` and `Chat: Reset Tool Confirmations` undo saved approvals.
- *Sandbox (enable when a use case needs it):* `chat.agent.sandbox.enabled` on Linux and WSL2 (install `bubblewrap` and `socat` first) and `chat.agent.sandbox.enabledWindows` (experimental). Filesystem rules per OS in `chat.agent.sandbox.fileSystem.linux|windows|mac`; network with `chat.agent.sandbox.allowNetwork`. It covers terminal commands and their children, not the agent's file-edit tools.
- *Claude Code's own layer:* its permission modes (plan, acceptEdits, auto, bypass) and allow/deny rules live in `~/.claude/settings.json` and apply to the extension and the CLI together. A `Read` deny rule on `.env` also stops the IDE integration from sending a selected `.env` line as context.
## Profiles
A **profile** bundles settings, keybindings, snippets, tasks, MCP servers, extensions and UI state. Any category can be left out, in which case it falls back to the Default profile, and `Apply Setting to all Profiles` pushes one value into every profile. A profile is associated with the folder it was selected in and reactivates when that folder opens. Profiles live in `%APPDATA%\Code\User\profiles`, launch with `code <path> --profile "<name>"`, and export as `.code-profile` or a secret gist.
- *Limit:* a profile controls which Windows-side extensions load, but it does not install anything into WSL.
- *Proposed set:* keep Default lean (editor behavior only), then add `python-ai`, `web`, and `systems-c` (the C/C++ extensions exist for CSCI 4061). Built-in templates (Python, Data Science, Node.js, Doc Writer) are a starting point.
## Claude Code Inside VS Code
The extension (`anthropic.claude-code` 2.1.282, installed on both Windows and WSL) and the CLI share `~/.claude/settings.json`; the extension's own settings live under `claudeCode.*` in VS Code settings.
- *IDE MCP server:* the extension runs a loopback-only MCP server named `ide` that the CLI joins automatically. The model sees two tools: `mcp__ide__getDiagnostics` (the Problems panel) and `mcp__ide__executeCode` (runs a notebook cell, always behind a VS Code confirmation).
- *Checkpoints:* hover any message to rewind edits.
- *Machine-scoped settings:* `claudeCode.initialPermissionMode`, `environmentVariables`, `allowDangerouslySkipPermissions` and `claudeProcessWrapper` are `machine` scope, so a value in Windows user settings does not reach WSL windows; set them in WSL Remote settings too if needed.
- *Shortcuts:* `Ctrl+Esc` toggles focus between editor and Claude, `Ctrl+Shift+Esc` opens a new Claude tab, `Ctrl+Alt+C` (custom) reopens the last session, `Ctrl+Alt+F` toggles Focus view, `Alt+K` inserts an @-mention of the selection.
## Daily Keyboard Layer
Identical on both platforms because keybindings live on the client. Built in: `Ctrl+Shift+P` command palette (also shows each command's shortcut), `Ctrl+P` file jump, `` Ctrl+` `` terminal, `Ctrl+D` next occurrence, `Ctrl+F2` all occurrences, `Ctrl+Alt+Up/Down` add cursor, `Ctrl+Shift+B` default build task, `F5` debug.
Custom layer in `keybindings.json`, all on `Ctrl+Alt`:

| Key | Command |
|---|---|
| `Ctrl+Alt+R` | Run Task |
| `Ctrl+Alt+T` | Run Test Task |
| `Ctrl+Alt+L` | Rerun Last Task |
| `Ctrl+Alt+W` | Connect to WSL in a new window |
| `Ctrl+Alt+E` | Select Python interpreter |
| `Ctrl+Alt+M` | Maximize or restore the panel |
| `Ctrl+Alt+C` | Open the last Claude Code session |
## How the Pieces Multiply the Work
The gain does not come from any single feature. It comes from making every repo self-describing so agents and you run the same environment and the same checks.
1. **One repo, one environment contract**
	WSL toolchain or a dev container, plus `.vscode/tasks.json` for the checks, plus `AGENTS.md`/`CLAUDE.md` for the rules.
2. **Plan before edit**
	Claude's plan mode or `/plan` in the Agents window, reviewed before any code changes.
3. **Parallel sessions in worktrees**
	Several Agents window sessions on separate worktrees, each reviewed through its Changes panel. The worktree keeps them from colliding.
4. **Closed verification loop**
	Named test and lint tasks, a `PostToolUse` formatter hook, and `mcp__ide__getDiagnostics` so the agent reads the same Problems panel you do.
5. **Skills for repeated procedures**
	Anything done three times becomes a skill in `.claude/skills/`, readable by Claude Code and VS Code alike.
6. **Risky work in containers**
	Untrusted repos and unattended runs go into a dev container with no host secrets mounted.
## What Changed From the 2026-08-26 Version
- The first version audited the Dell (28 extensions, `D:\projects\*`). The Acer has 15 extensions, a 4-key `settings.json`, and its codebases in WSL, so every Windows path example was wrong for real work.
- `pythonTestExplorer.testFramework` is not a real setting. Pytest is enabled with `python.testing.pytestEnabled` or `Python: Configure Tests`.
- Prompt files are deprecated for Agent Host sessions; skills replace them.
- The Agents window, harnesses, worktree and dev container isolation, sandboxing, and Claude-format customization support did not exist in the old note.
- Settings Sync now also covers MCP servers, profiles, and prompts and instructions.
## Status
| Item | State on 2026-09-26 |
|---|---|
| VS Code version | 1.139.1 (self-updated), WSL server on the same commit |
| User settings, keybindings, tasks, MCP | applied and synced; restored after the Sync incident (see [[VS Code - Windows]]) |
| Settings Sync | on, from the Acer; cloud copy verified to hold this laptop's files |
| Extensions | 39 on Windows (limit 40), 34 on WSL, same working set |
| Terminal environments | Windows: every terminal loads base + `.vscode/env.ps1`; home environment live. WSL: pending port |
| Environments | conda `jupyter-base` on both sides for notebook work, uv for everything else |
| MCP | global registry + sync script on Windows; Jarvis global in Claude Code and VS Code; `the-plan` needs `THE_PLAN_API_KEY` |
| Secrets | Claude Code read-deny on secret files, global git ignore, on-screen cloaking |
| Terminal icons | fixed (font family name, Starship parity) |
| Docker for dev containers | working from WSL, auto-start off by choice |
## Links
Official sources used on 2026-09-24: [Settings](https://code.visualstudio.com/docs/configure/settings), [Settings Sync](https://code.visualstudio.com/docs/configure/settings-sync), [Profiles](https://code.visualstudio.com/docs/configure/profiles), [Workspace Trust](https://code.visualstudio.com/docs/editing/workspaces/workspace-trust), [WSL](https://code.visualstudio.com/docs/remote/wsl), [Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers), [Agents window](https://code.visualstudio.com/docs/agents/run/agents-window), [Agent harnesses](https://code.visualstudio.com/docs/agents/run/agent-harnesses), [Remote agent sessions](https://code.visualstudio.com/docs/agents/run/remote-agent-sessions), [Approvals](https://code.visualstudio.com/docs/agents/run/approvals), [Agent sandboxing](https://code.visualstudio.com/docs/agents/run/agent-sandboxing), [Custom instructions](https://code.visualstudio.com/docs/agent-customization/custom-instructions), [Agent skills](https://code.visualstudio.com/docs/agent-customization/agent-skills), [Custom agents](https://code.visualstudio.com/docs/agent-customization/custom-agents), [Hooks](https://code.visualstudio.com/docs/copilot/customization/hooks), [MCP servers](https://code.visualstudio.com/docs/copilot/customization/mcp-servers), [1.139 release notes](https://code.visualstudio.com/updates), [Claude Code in VS Code](https://code.claude.com/docs/en/vs-code), [Claude Code dev containers](https://code.claude.com/docs/en/devcontainer). Related vault notes: [[WSL Session Briefing]], [[Cross-Laptop Sync - Build Roadmap]], [[Jarvis MCP and REST API Setup]], [[Code Review & Eval Gap]].