---
created: 2026-09-21
type: project
status: active
tags:
  - laptop
  - wsl
  - git
  - claudekit
related:
  - "[[second-brain-claudekit-new-laptop-directive]]"
  - "[[New Laptop Setup]]"
  - "[[WSL New Laptop Master Plan — Verified 2026-09-11]]"
---

# second-brain-claudekit — Git Clone and Bootstrap

## One-Line Answer

This repository is a project-local Claude Code kit and qualification workspace. Clone it into WSL, install the small shell/runtime dependency set, authenticate GitHub over HTTPS, install Unison, then launch Claude Code from the repository root. Do not copy the repository's `.claude/` into the global `~/.claude/`.

## 1. Verify the WSL base

Run inside Ubuntu WSL:

```bash
test "$(id -un)" = "anant_gupta"
. /etc/os-release
test "$ID" = "ubuntu"
test "$VERSION_ID" = "24.04"
printf 'WSL base verified: %s %s\n' "$NAME" "$VERSION_ID"
```

If any test fails, stop and correct WSL before cloning.

## 2. Install the base command dependencies

```bash
sudo apt update
sudo apt install -y git git-lfs curl jq util-linux tar ca-certificates gh wslu
```

Verify:

```bash
command -v git git-lfs curl jq flock tar gh
git --version
git lfs version
jq --version
gh --version | head -1
```

PowerShell 7 is required by this repository's project hooks. Verify the WSL-native executable:

```bash
command -v pwsh
pwsh --version
```

If `pwsh` is missing, follow the current WSL installation instructions in [[Installations]] and [[Acer Live State — 2026-09-16]]. Do not substitute Windows PowerShell for WSL `pwsh`.

## 3. Authenticate GitHub before cloning private or future repositories

```bash
gh auth login --hostname github.com --web --git-protocol https
gh auth setup-git
gh auth status
```

Use HTTPS. Do not copy a private SSH key or credential file from the old laptop.

## 4. Clone the codebase

```bash
mkdir -p "$HOME/projects/ai/claude"

git clone   https://github.com/gupta-builds/second-brain-claudekit.git   "$HOME/projects/ai/claude/second-brain-claudekit"

cd "$HOME/projects/ai/claude/second-brain-claudekit"
git lfs install
```

If the destination already exists, do not clone over it. Inspect it first:

```bash
git -C "$HOME/projects/ai/claude/second-brain-claudekit" status --short --branch
git -C "$HOME/projects/ai/claude/second-brain-claudekit" remote -v
```

## 5. Install the repository's only special runtime

```bash
cd "$HOME/projects/ai/claude/second-brain-claudekit"
./60_Claude/scripts/install_unison.sh
unison -version
```

The repository has no root `package.json`, `pyproject.toml`, `uv.lock`, or application build. Do not run `npm install`, `pnpm install`, or `uv sync` at the repository root.

## 6. Validate the checkout

```bash
git status --short --branch
jq empty .claude/settings.json 60_Claude/scripts/sync-manifest.json

for script in 60_Claude/scripts/*.sh; do
  bash -n "$script"
done

test -d .claude/agents
test -d .claude/commands
test -d .claude/hooks
test -f CLAUDE.md
test -f README.md
test -f PRD.md
test -f Architecture.md
```

## 7. Start ClaudeKit

Start the coding agent from this directory:

```bash
cd "$HOME/projects/ai/claude/second-brain-claudekit"
claude
```

Or use Codex from the same directory:

```bash
cd "$HOME/projects/ai/claude/second-brain-claudekit"
codex
```

The project-local `.claude/settings.json` and `.claude/commands/`, `.claude/agents/`, and `.claude/hooks/` are loaded because the agent is started inside the repository. Global AI tool folders remain machine-local.

## 8. Recreate secrets and machine-local state separately

Recreate only after the base checkout works:

- `.claude/settings.local.json`: create only the new laptop's local overrides.
- WSL `~/.mcp.json`: create from the current WSL-native template with fresh Jarvis and GitHub credentials.
- Obsidian Local REST API keys: generate fresh keys in the new Obsidian installation.
- GitHub authentication: use `gh auth login`.
- Any tool-specific `.env`: create from its `.env.example`; never copy live values.

Never copy `.credentials.json`, `.mcp.json`, `.mcp.env`, `.env`, API keys, or private keys from the old laptop.

## Related

- [[second-brain-claudekit-new-laptop-directive]]
- [[second-brain-claudekit-jarvis-unison-sync]]
