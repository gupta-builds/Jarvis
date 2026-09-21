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

The live WSL checkout was inspected directly:

- WSL user: `anant_gupta`
- WSL OS: Ubuntu 24.04
- Repository path: `/home/anant_gupta/projects/ai/claude/second-brain-claudekit`
- Remote: `https://github.com/gupta-builds/second-brain-claudekit.git`
- Worktree: clean on `main`
- Observed commit: `a0226a7` (`just one edit`)
- Required tools present: Git, Git LFS, jq, flock, curl, tar, pwsh, gh, Node, pnpm, uv, and Unison
- Jarvis mirror exists at `D:\\Users\\_Anant\\10_Areas\\Documents\\Jarvis\\20_Progress\\AI\\Claude Code\\second-brain-claudekit`
- The configured mirror paths currently match the WSL source

The local `origin/main` ref matched the working HEAD during this inspection, but a fresh network fetch was not possible from this session. The source-laptop push gate below is therefore mandatory before treating the migration as backed up.

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

- [[second-brain-claudekit-git-clone-and-bootstrap]]
- [[second-brain-claudekit-jarvis-unison-sync]]
- [[second-brain-claudekit-ignored-state-and-sandbox]]
