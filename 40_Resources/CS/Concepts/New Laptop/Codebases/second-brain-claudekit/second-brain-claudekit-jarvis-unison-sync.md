---
created: 2026-09-21
type: project
status: active
tags:
  - laptop
  - jarvis
  - unison
  - codebase-sync
related:
  - "[[second-brain-claudekit-new-laptop-directive]]"
  - "[[Cross-Laptop Sync - Jarvis Wrap-Up]]"
  - "[[Jarvis MCP and REST API Setup]]"
  - "[[New Laptop Setup]]"
---

# second-brain-claudekit — Jarvis and Unison Sync

## One-Line Answer

Git clone restores this repository's tracked sync machinery, but it does not recreate the Jarvis mirror or the Windows Scheduled Task. On the new laptop, install Unison, verify the WSL and Windows paths, run the named manifest entry once, compare the mirror, and only then consider unattended scheduling.

## What the live manifest actually syncs

The current entry in `60_Claude/scripts/sync-manifest.json` is:

```json
{
  "name": "second-brain-claudekit",
  "status": "live",
  "source": "/home/anant_gupta/projects/ai/claude/second-brain-claudekit",
  "mirror": "/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/20_Progress/AI/Claude Code/second-brain-claudekit",
  "paths": [
    ".claude/agents",
    ".claude/commands",
    ".claude/hooks",
    "CLAUDE.md",
    "README.md",
    "_docs"
  ],
  "instructions_paths": [
    "CLAUDE.md",
    "README.md",
    "PRD.md",
    "Architecture.md"
  ],
  "needs_fat": true,
  "force_source": true
}
```

This means:

- `_docs/`, the selected `.claude/` directories, `CLAUDE.md`, and `README.md` are synchronized to the Jarvis mirror.
- The four root instruction files are copied one-way into `instructions/second-brain-claudekit/`.
- The `.claude/agents`, `.claude/commands`, and `.claude/hooks` directories are copied one-way into the repository's staging folders.
- `force_source: true` makes the codebase win a genuine source/mirror conflict.
- `needs_fat: true` is required for the Windows DrvFs destination because it avoids POSIX permission and symlink assumptions.

The live manifest does not sync the entire repository. It does not sync `.git/`, `sandbox/`, dependencies, `.claude/settings.local.json`, generated locks, or secrets. `.claude/settings.json` is tracked by Git and is restored by `git clone`, but it is not listed in the current live Unison entry, so the Jarvis mirror does not receive it through this project sync.

## First sync on the new laptop

Run inside WSL after the clone/bootstrap note succeeds:

```bash
cd "$HOME/projects/ai/claude/second-brain-claudekit"

test -d /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis
test -d /mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/20_Progress/AI/Claude Code

./60_Claude/scripts/install_unison.sh
./60_Claude/scripts/sync-all.sh second-brain-claudekit
status=$?

tail -40   "/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/20_Progress/AI/Claude Code/second-brain-claudekit/Sync-Log.md"

exit "$status"
```

Do not use the legacy `sync-jarvis.sh` for the normal workflow. It remains only as rollback/reference code. The live engine is `sync-all.sh`.

## Verify the mirror, not only the exit code

```bash
mirror="/mnt/d/Users/_Anant/10_Areas/Documents/Jarvis/20_Progress/AI/Claude Code/second-brain-claudekit"

diff -qr .claude/agents "$mirror/.claude/agents"
diff -qr .claude/commands "$mirror/.claude/commands"
diff -qr .claude/hooks "$mirror/.claude/hooks"
diff -q CLAUDE.md "$mirror/CLAUDE.md"
diff -q README.md "$mirror/README.md"
diff -qr _docs "$mirror/_docs"
```

A successful exit code without matching downstream files is not proof of a successful migration.

## Do not run the all-project task yet

`sync-all.sh` without a name processes every manifest entry marked `live`. A new laptop that has only this repository will produce missing-source failures for the other projects. Use the named command:

```bash
./60_Claude/scripts/sync-all.sh second-brain-claudekit
```

Register the all-project Scheduled Task only after every live source in `sync-manifest.json` has been deliberately restored and path-verified.

## Scheduled Task portability gate

The repository includes `60_Claude/scripts/register-sync-task.ps1`, but it currently contains two portability hazards that must be resolved before running it on another laptop:

1. Its WSL launcher source path uses the distro name `Ubuntu`, while the current Acer documentation identifies the distro as `Ubuntu-24.04`.
2. The PowerShell string currently begins with a single backslash (`\wsl.localhost...`) rather than a validated UNC path beginning with two backslashes.

Verify from an elevated-or-normal Windows PowerShell prompt:

```powershell
wsl.exe -l -v
Test-Path '\\wsl.localhost\\Ubuntu-24.04\\home\\anant_gupta\\projects\\ai\\claude\\second-brain-claudekit\\60_Claude\\scripts\\sync-all-silent.vbs'
```

Do not register the task until the actual distro name and UNC path pass `Test-Path`. The correct task must:

- Launch the current `sync-all.sh`.
- Run hidden through the VBS launcher.
- Wait for completion.
- Return the real inner exit code.
- Be checked against the actual Sync-Log after firing.

This is a source-script repair gate, not a reason to improvise a second sync architecture.

## Current source of truth

- GitHub is the backup and distribution source for committed code.
- The WSL checkout is the source of truth for the codebase sync.
- The Jarvis mirror is view-facing and source-wins on conflicts.
- Secrets and machine-local config are recreated on each laptop.

## Related

- [[second-brain-claudekit-new-laptop-directive]]
- [[second-brain-claudekit-git-clone-and-bootstrap]]
- [[second-brain-claudekit-ignored-state-and-sandbox]]
