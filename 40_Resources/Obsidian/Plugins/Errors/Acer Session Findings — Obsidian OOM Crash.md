---
type: evergreen
status: sprout
created: 2026-10-09
tags:
  - evergreen
  - system
  - obsidian
  - plugins
  - crash
notes:
  - "[[40_Resources/Obsidian/Plugins/Errors/Dell Handoff — Obsidian OOM Crash Fix]]"
  - "[[Cross-Laptop Sync - Known Failure Modes and Prevention]]"
  - "[[40_Resources/Obsidian/Plugins/Omnisearch and Retrieval]]"
  - "[[40_Resources/Obsidian/Plugins/Tasks Kanban and Project Tracking]]"
next: "[[40_Resources/Obsidian/Plugins/Errors/Dell Handoff — Obsidian OOM Crash Fix]]"
---
# Acer Session Findings — Obsidian OOM Crash

## One-Line Answer
Obsidian was crashing (blank window, needs force-reopen) because Omnisearch could never finish a single full-vault index without running out of memory, and obsidian-tasks-plugin and obsidian-hover-editor were adding further load and a genuine uncaught error on top — confirmed by watching actual memory growth and Chrome DevTools, not inferred. Fixed by physically renaming all three plugins' folders so Obsidian's loader cannot find them, after discovering that config-file edits alone do not survive `lazy-plugins`' own re-scan behavior.

## What "Obsidian blanks out" actually was
Not a hang, not a Windows-detected crash, not a sync collision. Direct observation: total Obsidian process memory climbed from ~2.9GB to ~5.6GB over roughly 60 seconds on a fresh launch, then the process count dropped and memory collapsed — a clean, silent termination. Zero Crashpad reports, zero Windows Error Reporting events, zero Application Hang events, ever, for any of these crashes — consistent with Chromium's own internal out-of-memory guard killing the renderer, not an OS-level fault. Confirmed directly once: the user caught Chrome DevTools' real "Paused before potential out-of-memory crash" heuristic firing, mid-crash, with the breakpoint sitting inside Obsidian's own core file-read code (`app.js`, stripping a UTF-8 BOM from file content it had just read) — not inside any plugin.

## False leads chased and ruled out — read this before re-investigating
- **`.git/index.lock` contention with `obsidian-git`'s background polling.** Real, fixed (`git-auto-sync.ps1` now checks for the lock before starting), but never actually confirmed as a crash cause. Obsidian's plugin architecture normally sandboxes a plugin's thrown exception rather than crashing the whole renderer, so this was always a weaker theory than it felt at the time.
- **Dataview's startup timing.** Deferred it from `instant` to `short` in `lazy-plugins`, disabled DataviewJS entirely. The actual console log showed Dataview indexing 5000+ files in 1.8–10 seconds, mostly from its own on-disk cache — it was never the bottleneck. This was chasing the wrong plugin for a session and a half.
- **`community-plugins.json`/`lazy-plugins` being captured and corrupted by `git-auto-sync.ps1`.** This is a real, directly-proven bug (a commit literally shows `git-auto-sync` silently removing `"dataview"` from the enabled list and permanently committing that transient state) and worth having fixed — but it turned out not to be the OOM trigger either. Confirmed by watching a live crash happen with Syncthing in `idle` state and zero `git-auto-sync` activity in that window. The sync process is genuinely buggy in its own right; it just isn't what was crashing Obsidian.

## The three real, confirmed causes
1. **Omnisearch, `useCache: false`.** Rebuilt its entire full-text index — reading full file *content*, not just frontmatter — on every single launch. Confirmed in console: 29.3–38.2 seconds of indexing time across multiple attempts, and it never once produced a cache file on disk (checked directly, zero cache files ever existed). Setting `useCache: true` didn't hold, because **Omnisearch's own failure-recovery logic resets `useCache` back to `false` every time its index build is interrupted** (confirmed via `git diff` showing the setting flip back on its own) — it never survived long enough to benefit from caching in the first place.
2. **obsidian-tasks-plugin**, scanning `60_Claude/05_Clippings/AI Conversations/` — 859 files of raw AI-session transcripts, many containing shell/WSL command text (`wsl.exe -e bash -lc "..."`, `tail -12 ...`, `echo "---source---"`). Tasks' line parser tried to read every line of these files as potential task syntax and failed on nearly all of them, logging a cache-miss warning per failure — 300+ per launch on one file alone. This plugin has **no folder-exclusion setting of its own** in this version; it only respects Obsidian's core "Excluded files" list, and even that didn't stop it (see below).
3. **obsidian-hover-editor**, a genuine uncaught `TypeError: Cannot read properties of null (reading 'createDiv')` thrown from inside its own code while wrapping `obsidian-spaced-repetition`'s "Review Queue" view during workspace restore. This is not about anyone actually triggering a hover-preview — hover-editor patches Obsidian's view-opening machinery globally, and that patch breaks specifically on this one view type. The Dell had already disabled this plugin for the same reason, independently, before this session.

## The two meta-bugs that made every earlier attempt look like it failed
These matter more than the three plugins above for understanding *why this took so many attempts*.

**Meta-bug 1: `lazy-plugins` re-adds any installed plugin missing from its own tracking list.** It doesn't just read its config — on load it checks every folder under `.obsidian/plugins/` and, for any plugin folder it finds that isn't in its internal tracking object, adds a default entry back in. Deleting a plugin's entry from `lazy-plugins/data.json` or from `community-plugins.json` does nothing durable as long as the plugin's folder still physically exists on disk. This is why Omnisearch, Tasks, and hover-editor all "came back" after being removed from config — the config was never the actual source of truth, the folder's presence was.

**Meta-bug 2: editing these files while Obsidian is still running doesn't hold either.** A running Obsidian process keeps its own settings in memory and periodically flushes them back to disk (on its own save cycle, on close, on various triggers). An external file edit made while *any* Obsidian process for this vault is still alive can be silently overwritten the next time that live process saves its own in-memory state — confirmed directly: an edit that was correct on disk reverted on its own with no human action, traced to a live process's own save cycle. **The fix only actually holds if every Obsidian.exe process is confirmed closed (`tasklist`, zero results) before the file is touched, and stays closed until verified.**

## The actual, durable fix
Renamed the plugin folders themselves — the only thing Obsidian's plugin loader actually checks:
- `.obsidian/plugins/obsidian-tasks-plugin/` → `obsidian-tasks-plugin.disabled/`
- `.obsidian/plugins/omnisearch/` → `omnisearch.disabled/`
- `.obsidian/plugins/obsidian-hover-editor/` → `obsidian-hover-editor.disabled/`

A folder that isn't named exactly as Obsidian expects cannot be loaded, regardless of what `community-plugins.json` or `lazy-plugins/data.json` claim. This survives `lazy-plugins`' re-scan (nothing to find) and survives a live process's save cycle (there's no plugin instance to hold stale settings for an ID that was never loaded this session). Done with every Obsidian process confirmed killed first (`taskkill /IM Obsidian.exe /F`, verified zero remaining), then the folder renames, then the leftover config entries cleaned up for tidiness (not strictly required once the folders are gone, but removes confusing stale references).

## Files changed this session (Acer)
- `.obsidian/plugins/{obsidian-tasks-plugin,omnisearch,obsidian-hover-editor}/` → renamed to `*.disabled/`, git-untracked, excluded from `.gitignore` and `.stignore`.
- `.obsidian/community-plugins.json` and `.obsidian/plugins/lazy-plugins/data.json` — cleaned of all three entries; both already git-untracked from a prior sync-corruption fix (see below), so this specific change is **Acer-only and will not reach the Dell on its own.**
- `.obsidian/workspace.json` — the specific `review-queue-list-view` leaf was removed once, reverted on its own (Obsidian re-saves its own workspace layout constantly), and was left alone after the hover-editor folder rename made the underlying crash structurally impossible regardless of workspace contents.
- `30_Order/System/claude-workflow/scripts/git-auto-sync.ps1` — multiple real fixes this session: refuses to commit autostash-pop conflict markers instead of silently corrupting files; checks `.git/index.lock` before starting; auto-recovers from the "untracked file collides with incoming commit" abort loop; logs a proper end-state on every exit path (a prior version silently had two exit paths that never logged, which is why an earlier real sync failure went undetected by monitoring for ~25 hours).
- `30_Order/System/sync-workflow/scripts/check-syncthing-status.ps1` — now also watches for leftover `git stash` entries and a FAILED `git-auto-sync` run, surfaced through the existing Dashboard alert; the Syncthing self-heal path was found completely non-functional on this machine (wrong assumption about a Scheduled Task name) and fixed with a self-populating per-machine executable-path cache.
- `.gitignore` / `.stignore` — `community-plugins.json`, `lazy-plugins/data.json`, `.copilot/model-catalog-cache.json`, the three `*.disabled/` plugin folders, and a `.syncthing-exe-path.txt` cache file all added to both lists this session, each because an external process (git or Syncthing) was blindly capturing per-machine churn and causing real damage.
- `40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Known Failure Modes and Prevention.md` — patched in place with dated, live-verified findings; no new numbered entry added, per standing instruction in that note.
- `.claude/skills/weekly-review/weekly-review.md` — Step 7.6 extended with three new sub-steps (leftover-stash check, sync-log/cache spot-check, obsidian-git settings-drift check) so these specific failure classes get caught on a weekly cadence instead of requiring a dedicated crisis session.

## Confirmed current state (Acer, end of session)
- Obsidian open 15+ minutes with no crash, before being closed manually by the user to read this note.
- Zero Tasks/Omnisearch/hover-editor console output on the relaunch after the Obsidian-fully-closed fix.
- `git status` clean and even with origin; zero leftover `git stash` entries; zero live `.sync-conflict-*` files.
- **Not independently re-verified after the very last fix** (the lazy-plugins cleanup redone with Obsidian confirmed closed) — this was the last action taken before writing this note. The next launch on this machine is the real test of that specific edit.

## What's still genuinely open
- The OpenAI key and GitHub Copilot tokens from a 2026-09-19/09-28 leak still need rotation at the provider — no automation can do this, it needs the user directly.
- Whether Omnisearch, Tasks, or hover-editor are worth ever re-enabling is an open product decision, not a bug — Omnisearch in particular may become viable again if the AI Conversations folder's size is substantially reduced (a separate cleanup already in progress elsewhere this session, unrelated to this crash investigation, that happens to help).
