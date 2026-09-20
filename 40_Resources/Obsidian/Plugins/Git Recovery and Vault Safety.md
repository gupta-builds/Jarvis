---
type: evergreen
status: sprout
created: 2026-05-15
updated: 2026-05-15
tags:
  - evergreen
  - system
  - obsidian
  - git
  - safety
notes:
  - "[[AI_CONTEXT]]"
  - "[[HUMAN_WRITING]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[60_Claude/07_AI_Information/Plugins]]"
  - "[[00 Plugin Reference Index]]"
---
# Git Recovery and Vault Safety

Obsidian Git and File Recovery protect the vault, but they are not permission to make broad edits.

## Current Obsidian Git Settings
**Fixed 2026-09-20 — this plugin's own automatic push/pull was genuinely colliding with the cross-laptop `Jarvis-GitAutoSync` scheduled task**, confirmed live: both processes independently pull, commit, and push the same repo on their own timers with zero coordination between them. Current state, read directly from `.obsidian/plugins/obsidian-git/data.json`:
- Installed and lazy-loaded with short delay.
- Auto-commit (local, on file change) interval: `120` minutes — **kept on.** This only stages and commits locally; it never pushes or pulls, so it has no collision risk with the scheduled script and usefully catches fast edits between the script's own 15-minute sweeps.
- Auto-push interval: **`0` (disabled)** — was `121` minutes. `Jarvis-GitAutoSync` now owns all pushing, exclusively.
- Auto-pull interval: **`0` (disabled)** — was `120` minutes. Same reasoning, the scheduled script owns all pulling.
- Auto-pull on boot: **`false`** — was `true`. This was the most dangerous of the three: an automatic pull firing the instant Obsidian opens, before anyone (or the scheduled script) can supervise it.
- Merge strategy: **`none`** (git's real default, conflict markers on a real conflict) — was `"ours"`, which would have silently kept the local side and discarded the incoming side on any real conflict, with no warning. Confirmed via the plugin's own source (`Vinzent03/obsidian-git`, `src/setting/settings.ts`) that `"none"` is a real, selectable option, not assumed.
- Pull before push: enabled — harmless now that auto-push/pull are both off; still relevant if a manual push is triggered from the plugin's UI.
- Push disabled: `false` — deliberately left alone. The automatic timers are off, so this doesn't matter for automation; a manual push button in the UI still works if ever wanted deliberately.
- Commit message pattern: `auto: {{date}} | {{numFiles}} files`.
- Diff style: split.
- Changed files shown in status bar.

Implication, now genuinely resolved rather than just flagged: this plugin can no longer race `Jarvis-GitAutoSync` for a push or pull, and its own auto-commit is complementary, not competing. Agents should still check `git status` before broad work — Obsidian Git's auto-commit means the working tree is rarely dirty for long, but "rarely" is not "never."

## Dirty Worktree Rules

Before broad edits, commits, pushes, moves, or deletes:

1. Check `git status`.
2. Identify which files belong to the current task.
3. Preserve unrelated user changes.
4. Do not stage unrelated files.
5. Do not run destructive Git commands unless explicitly asked.

Never run broad reset, checkout, clean, or history-rewrite operations without explicit approval.

## File Recovery

File Recovery is enabled and is useful when Obsidian has a better local snapshot than Git.

Use it for:

- a note accidentally damaged in the editor
- recovering a recent uncommitted version
- inspecting a narrow previous state

Do not rely on File Recovery as a normal editing strategy. It does not justify risky bulk edits.

## `.gitignore` Role

Current ignore rules protect:

- `.obsidian/workspace.json`
- `.obsidian/workspace-mobile.json`
- `.obsidian/cache`
- `.trash/`
- Copilot plugin `data.json`
- QuickAdd plugin `data.json`
- Local REST API plugin `data.json`
- Claude local settings
- Kiro settings
- Copilot vector indexes
- OS junk and temporary files

This matters because several plugin data files can contain credentials or regenerated machine state. Do not remove these ignores for convenience.

## Restore Boundaries

If an edit goes wrong:

1. Stop editing.
2. Identify the affected file and whether it was changed by this task.
3. Inspect a narrow diff.
4. Restore only the damaged content.
5. Ask before using Git checkout/reset or touching unrelated files.

The repair target is one file or one section, not the whole vault.

## Pre-Large-Edit Checklist

Before a future broad documentation pass:

- Read [[AI_CONTEXT]], [[00_Dashboard]], and recent session log entries.
- Check `git status`.
- Confirm destination folder and files.
- Confirm raw clippings and archive paths are excluded.
- Confirm no plugin settings will be edited.
- Use patches rather than uncontrolled rewrites when possible.
- Append a concise continuity log entry afterward.

## Agent Safety

Agents should not:

- commit automatically
- push automatically
- change Obsidian Git settings
- stage unrelated files
- rewrite `.gitignore` for convenience
- edit `.obsidian` plugin settings
- delete or move notes without permission
- touch `60_Claude/05_Clippings` unless explicitly asked
- treat `50_Archive` as normal write space

## Integration Map
- **Obsidian Git ↔ agent edits:** auto-commit-on-change (no auto-push/pull as of 2026-09-20) means the working tree can get locally committed *while an agent is mid-edit*, but never pushed or pulled out from under it. So an agent must still check `git status` before broad work — a local commit landing mid-task is milder than a sync happening mid-task, but still worth knowing about.
- **Obsidian Git ↔ `Jarvis-GitAutoSync`:** the scheduled script owns all push/pull; this plugin owns only local auto-commit. Two processes touching the same repo used to mean two uncoordinated actors; now it means one fast local committer feeding one scheduled remote synchronizer, a division of labor, not a race.
- **`.gitignore` ↔ plugin secrets:** the ignore list covers `copilot`, `quickadd`, and `local-rest-api` `data.json`, plus Copilot vector indexes and workspace state. This is the safety net behind the "document behavior, never values" rule in [[AI Automation and Local Interfaces]] — do not remove these ignores for convenience.
- **Git ↔ session log:** the session log in `60_Claude/07_AI_Information/Session Logs/log.md` is the human-readable audit trail; Git is the byte-level one. After meaningful edits, the agent appends to the log but does **not** commit unless asked.
## Gold-Standard Example
The correct example is a process, not a note: the repo at the start of this very session had ~100 unrelated dirty files (plugin updates, Excalidraw, archive moves). The right handling is to edit only the task's files, stage nothing unrelated, leave the rest of the dirty tree untouched, and never run a broad `add -A` or `reset`. That restraint *is* the gold standard for Git in a vault that multiple tools edit.
## File Recovery Snapshot Retention
Confirmed from Obsidian's own help page: snapshots save a minimum of 5 minutes apart and are kept for 7 days by default ([Obsidian Help — File Recovery](https://obsidian.md/help/plugins/file-recovery)). "Use File Recovery for a recent uncommitted version" means "recent" = within the last week, checked every 5+ minutes, not an open-ended promise. The defaults already cover every realistic single-session recovery case this vault has hit — no reason to change them.
## Verified Open State
- Should agents ever be allowed to commit, or remain commit-free by default? — current rule is commit-free; unchanged by this fix
## Sources
- [Obsidian Git docs - Features](https://publish.obsidian.md/git-doc/Features) — confirms commit and push are bundled as "commit-and-sync" in the documented feature set, fetched 2026-09-19
- [Obsidian Git README](https://github.com/Vinzent03/obsidian-git)
- [`Vinzent03/obsidian-git` — `src/setting/settings.ts`](https://github.com/Vinzent03/obsidian-git/blob/master/src/setting/settings.ts) — confirms the real `mergeStrategy` options (`none`/`ours`/`theirs`) and `syncMethod` options (`merge`/`rebase`/`reset`), fetched 2026-09-20
- [Obsidian Help - File Recovery](https://obsidian.md/help/plugins/file-recovery) — 5-minute minimum snapshot spacing, 7-day retention, fetched 2026-09-19
- Direct read of this vault's Obsidian Git `data.json`, before and after the fix — this session, 2026-09-20
- [[Cross-Laptop Sync - Build Roadmap]], [[Cross-Laptop Sync - Build 7 Findings]] — the `Jarvis-GitAutoSync` script this plugin's automation now defers to
- [[AI_CONTEXT]]
- [[40_Resources/Obsidian/Vault Operating System]]
