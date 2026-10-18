---
created: 2026-09-21
type: project
status: active
tags:
  - laptop
  - codebase-sync
  - wsl
  - git
  - claudekit
related:
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
  - "[[Cross-Laptop Sync - Jarvis Wrap-Up]]"
  - "[[Jarvis MCP and REST API Setup]]"
next: "[[second-brain-claudekit-git-clone-and-bootstrap]]"
---

# second-brain-claudekit — New Laptop Directive

## One-Line Answer

Clone this repository into WSL, install only its real runtime prerequisites, authenticate GitHub, install Unison, run the named Jarvis sync entry, and verify the mirror. Git clone restores the repository and the sync scripts; it does not recreate secrets, Unison, the Jarvis mirror, or Windows Scheduled Tasks.

## Current verified baseline — 2026-09-21

The current Acer WSL state is the source of truth for this build. The earlier
baseline in this note described a different or planned checkout and must not be
used as evidence:

- WSL user: `anant_gupta`
- WSL OS: Ubuntu 24.04, WSL 2, systemd enabled
- Working area: `/home/anant_gupta/projects/ai`
- Future repository path: `/home/anant_gupta/projects/ai/second-brain-claudekit`
- Current checkout: absent by design; do not clone during the MCP/environment build
- Tools confirmed in the live interactive shell: Git, Git LFS, jq, flock, curl, tar, gh, Node, pnpm, uv, Rust, Claude Code, Codex, Antigravity CLI, direnv, and supporting terminal tools
- Not confirmed or absent in the live shell: Unison, `pwsh`, Bun, Kiro CLI, and Docker WSL integration
- Jarvis MCP configuration exists in the WSL environment, but the next session must verify its actual connected tools and live Obsidian endpoint
- Sync processes and scheduled sync tasks are paused; do not reopen them in this build

The repository clone, dependencies, hooks, credentials, and mirror are all
separate future gates. The source-laptop push gate below remains mandatory before
any later migration is treated as backed up.

## What Git clone restores

Git clone restores:

- All committed repository files
- Git history available from GitHub
- `.claude/settings.json`
- Project agents, commands, hooks, documentation, scripts, and the qualification pipeline
- `60_Claude/scripts/sync-all.sh`
- `60_Claude/scripts/sync-manifest.json`
- `60_Claude/scripts/install_unison.sh`

Git clone does not restore:

- `.git` from the old laptop — it creates a new local checkout from GitHub
- `.claude/settings.local.json`
- `60_Claude/Sessions/_today-edits.md`
- `.claude/scheduled_tasks.lock`
- Any `.mcp.json`, `.mcp.env`, API key, credential file, or SSH private key
- The Unison binary in `~/.local/bin/`
- The Jarvis vault or its mirror
- Windows Scheduled Tasks
- The ignored `sandbox/` clones, dependencies, virtual environments, caches, or build outputs

## Source-laptop gate — complete before using the new laptop

Run this from the existing authoritative checkout:

```bash
cd "$HOME/projects/ai/claude/second-brain-claudekit"

git status --short --branch
git fetch origin
git push origin main

test -z "$(git status --porcelain)"
test "$(git rev-parse HEAD)" = "$(git rev-parse origin/main)"

git status --short --branch
```

Do not begin the migration if this fails. Resolve every modified, untracked, ahead, behind, or divergent state first.

## New-laptop execution order

Follow these notes in order:

1. [[second-brain-claudekit-git-clone-and-bootstrap]]
2. [[second-brain-claudekit-jarvis-unison-sync]]
3. [[second-brain-claudekit-ignored-state-and-sandbox]]

The first two notes are required to operate ClaudeKit. The sandbox note is a separate reconstruction phase and is not a dependency of the core repository.

## Final completion gate

The migration is complete only when all are true:

- `git status --short --branch` is clean.
- `gh auth status` succeeds without exposing a token.
- `git lfs version`, `jq --version`, `pwsh --version`, and `unison -version` succeed.
- Claude Code or Codex starts from the repository root and loads the project-local `.claude/`.
- `./60_Claude/scripts/sync-all.sh second-brain-claudekit` exits successfully.
- The Jarvis mirror matches the manifest-selected paths.
- No secret-bearing file was copied from the old laptop.
- The all-project Scheduled Task is not registered until its path and manifest preconditions are satisfied.

## Related

- [[second-brain-claudekit-wsl-session-and-jarvis-mcp-build]]
- [[second-brain-claudekit-git-clone-and-bootstrap]]
- [[second-brain-claudekit-jarvis-unison-sync]]
- [[second-brain-claudekit-ignored-state-and-sandbox]]
