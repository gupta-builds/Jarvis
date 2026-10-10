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
  - "[[40_Resources/Obsidian/Plugins/Errors/Acer Session Findings — Obsidian OOM Crash]]"
  - "[[Cross-Laptop Sync - Known Failure Modes and Prevention]]"
next: "[[40_Resources/Obsidian/Plugins/Errors/Acer Session Findings — Obsidian OOM Crash]]"
---
# Dell Handoff — Obsidian OOM Crash Fix

**Read [[40_Resources/Obsidian/Plugins/Errors/Acer Session Findings — Obsidian OOM Crash]] first for the full mechanism and evidence. This note is the action checklist only.**

## Why this note exists
The Acer had the same "Obsidian blanks out and needs force-reopening" crash. Root-caused and fixed there this session. The fix cannot reach the Dell through normal sync — the two files that actually control it were deliberately untracked from git earlier this session (see Known Failure Mode 5's update), specifically because git was found corrupting their transient state. The Dell needs this exact fix applied locally, by hand.

## What you already did, and why it's probably not durable yet
You toggled off Tasks and Omnisearch as community plugins on the Dell during this session, following an earlier instruction. **That was the same first attempt the Acer made, and on the Acer it did not hold** — `lazy-plugins` re-added both after the very next relaunch, because it re-scans installed plugin folders and re-adds any plugin it finds present but missing from its own tracking config. A plugin is only truly disabled when its *folder* can't be found by Obsidian's loader, not when it's merely absent from a settings list. Assume the Dell's toggle-off has the same fragility until verified otherwise — check Step 2 below before trusting it.

## Action checklist, in order

**1. Fully close Obsidian. Verify zero processes, don't just trust the window closed.**
Any Obsidian.exe process still alive for this vault will silently overwrite a file-level edit to `community-plugins.json` or `lazy-plugins/data.json` the next time it saves its own settings — confirmed directly on the Acer, an edit reverted with no human action, traced to exactly this. Check with a process list, not by eye.

**2. Check whether Tasks and Omnisearch's plugin folders still exist under their normal names.**
Look at `.obsidian/plugins/`. If `obsidian-tasks-plugin/` and `omnisearch/` are still there (not renamed), the earlier toggle-off is cosmetic and will not survive a relaunch, regardless of what `community-plugins.json` currently shows.

**3. Rename the plugin folders — this is the only disable that actually holds.**
```
obsidian-tasks-plugin  →  obsidian-tasks-plugin.disabled
omnisearch              →  omnisearch.disabled
```
Do this with Obsidian fully closed (step 1). Obsidian's plugin loader finds plugins by folder name; a renamed folder cannot be loaded no matter what any config file says.

**4. Check `obsidian-hover-editor` too, even though you said it was already disabled here a while back.**
Confirm the same way — is the folder actually gone/renamed, or just toggled off in a config list? If it's config-only, it has the same fragility and should get the same folder-rename treatment, since `lazy-plugins` doesn't distinguish "disabled a long time ago" from "disabled five minutes ago" — it will re-add either one if the folder exists.

**5. Clean the stale config entries (optional, but do it while you're in there).**
With Obsidian still fully closed, open `.obsidian/community-plugins.json` and `.obsidian/plugins/lazy-plugins/data.json` and remove any leftover `"obsidian-tasks-plugin"`, `"omnisearch"`, or `"obsidian-hover-editor"` entries. Not required for the fix to work once the folders are renamed, but leaves a confusing stale reference otherwise.

**6. Exclude the renamed folders from sync, matching the Acer.**
Add to both `.gitignore` and `.stignore` (both lists, same sitting — this exact vault has a documented history of fixes failing because only one of the two was updated):
```
.obsidian/plugins/obsidian-tasks-plugin.disabled/
.obsidian/plugins/omnisearch.disabled/
.obsidian/plugins/obsidian-hover-editor.disabled/
```
These are local-only backups and were never meant to sync.

**7. Relaunch and watch the Console tab (Ctrl+Shift+I) for the first ~90 seconds.**
Confirm: no `[tasks.Cache]` warnings, no `omnisearch` indexing-time log line, no `ReviewQueueListView`/`createDiv` error, and memory (Task Manager or `tasklist`) stays flat rather than climbing toward multiple GB. Let it sit open at least 10-15 minutes before trusting it, since the Acer's crashes took anywhere from under a minute to several minutes to manifest.

**8. If it's still unstable after all of the above, it is not the same bug.**
Everything in steps 1-7 addresses the three plugins directly confirmed as causes on the Acer. If the Dell still crashes after this, the next step is the same one that actually worked on the Acer: open DevTools, relaunch, and get either a live memory-growth-to-crash capture or (better) an actual Console error/exception at the moment it happens. Inference without that evidence produced several wrong turns this session (chasing Dataview, `.git/index.lock`, and `git-auto-sync` capturing plugin state) before the real causes were found — don't restart that cycle, get the direct evidence first.

## What's shared automatically vs. what needs doing by hand here
**Already reaches the Dell through normal sync (verify, don't redo):** the `git-auto-sync.ps1` and `check-syncthing-status.ps1` fixes, the `.gitignore`/`.stignore` additions for `.copilot/model-catalog-cache.json` and the sync-corruption fixes, the `Cross-Laptop Sync - Known Failure Modes and Prevention.md` updates, the `/weekly-review` skill's new Step 7.6 sub-steps. Confirm these actually landed (`git log` should show the Acer's recent commits) rather than assuming.

**Cannot reach the Dell automatically, must be done by hand (this note, steps 1-6):** disabling the three plugins. `community-plugins.json` and `lazy-plugins/data.json` are both git-untracked by design now — there is no "pull the fix," it has to be redone locally, once, the same way it was done here.

## Dell result (2026-10-09, executed by Claude on DESKTOP-3VBG0JH)
**Step 2, was the earlier toggle-off durable?** Partly. The three plugin folders were already renamed to `*.disabled` (21:33) and none existed under their normal names, so the rename itself held. `community-plugins.json` was already clean. But `lazy-plugins/data.json` still listed all three, and `.stignore` was missing the three `.disabled` entries (`.gitignore` had them). Obsidian was running, so I closed it (0 `Obsidian.exe` processes confirmed), removed the three stale entries from `lazy-plugins/data.json` (29 to 26 plugins, valid JSON), and added the three `(?d)` entries to `.stignore`.

**Step 4, relaunch result.** Launched with a remote-debugging port and captured the Jarvis window's Console. No `[tasks.*]` line, no Omnisearch indexing line, no `ReviewQueueListView`/`createDiv` error, no debugger pause, no crash. Memory across both open vault windows (Jarvis plus The Plan) rose to about 5.0 GB within 3 minutes, then stayed flat for 8+ more minutes (largest single process 3.77 GB). Flat, not climbing, but high: the Acer crashed at roughly 5.6 GB total, so there is little headroom.

**Step 5, sync-side fixes did not fully arrive.** The working-tree files (`.gitignore`, scripts, these notes) came through Syncthing, but git `HEAD` is missing the Acer's commits (for example `2465b435`, `2a5746fa`, `dba13794`, `85d77cb1`). `git-auto-sync` has ended `FAILED, pull --rebase conflict` on every run since at least 20:48. The conflicts are rename/rename and modify/delete across `60_Claude/05_Clippings/AI Conversations/` (this machine moved files to `Dell/Windows/Claude/Cowork/...`, the incoming side to `Dell/Windows/Cowork/...`). Each failed run adds a "pre-pull commit" and needs a decision on which folder layout wins. Not fixed here.

**Side effects seen in the Console that are not the OOM bug:**
- **239 ENOENT errors on `Dell/WSL/...` notes.** They come from the failing auto-sync rebase. Each run replays the local pre-pull commits (`e39960bb` carries 1072 `Dell/` files), briefly writes those files into the vault, then `rebase --abort` deletes them. Obsidian queues reads for the new files and they are gone when it reads them. Bursts matched the 22:03 and 22:18 runs. Not a note or plugin problem.
- **Homepage plugin fails on every launch.** `homepage` data points at `10_Areas/Jarvis OS Dashboard`, but the file is `Jarvis OS Dashboard.canvas`, so the plugin reports "Cannot find the file" and the workspace opens empty. Separately, `homepage` patches `runOpeningBehavior` before it finishes loading its settings, so a cold launch can throw `Cannot read properties of undefined (reading 'data')`. That one did not reproduce on a reload.
- `file-explorer-plus` threw `Cannot read properties of undefined (reading 'fileItems')` once on load.
