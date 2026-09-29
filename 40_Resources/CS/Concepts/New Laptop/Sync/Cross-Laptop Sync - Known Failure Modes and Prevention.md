---
type: evergreen
status: sprout
created: 2026-09-28
tags:
  - evergreen
  - laptop
  - ai-infrastructure
notes:
  - "[[Cross-Laptop Sync - Build Roadmap]]"
  - "[[Cross-Laptop Sync - Build 8 Findings]]"
  - "[[Cross-Laptop Sync - Rollback Procedure]]"
next: "[[Cross-Laptop Sync - Build Roadmap]]"
---
# Cross-Laptop Sync - Known Failure Modes and Prevention
## One-Line Answer
Every conflict-file incident this sync setup has had, across Builds 1-8, traces to one of four patterns: a platform/type mismatch Syncthing can't materialize identically on both machines, a secret that nearly or actually left the machine, a safety-net setting that silently reverted or got disabled without anyone noticing, or two independent write mechanisms touching the same file without coordinating. This note is the checklist to run before assuming sync is healthy, and the list of what's already been fixed so the same root cause doesn't get re-diagnosed from scratch next time.
## Failure Mode 1: Platform-Incompatible Paths
**What happened (Build/post-7, 2026-09-20):** 20 Windows junction aliases under `.claude/skills/` and `.opencode/skills/` had no equivalent structure on the other machine (junctions aren't portable the way Syncthing materializes directories), producing 106 `not a directory` / `file modified but not rescanned` folder errors.
**Fix:** the 20 exact alias paths excluded in `.stignore`; canonical content under `copilot/skills/` still syncs normally.
**Prevention:** never add a Windows-specific filesystem construct (junction, symlink, reparse point) inside a Syncthing-shared folder without an explicit `.stignore` exclusion for the alias path at the same time it's created.
## Failure Mode 2: Reserved/Invalid Filenames
**What happened (Build 6, 2026-09-19):** a file literally named `NUL` (from a WSL-to-cmd.exe `2>NUL` redirect landing as a real file instead of the null device) got indexed by Syncthing and permanently stuck both sides at 99% — deletion plus a forced rescan did not clear the stale index entry on its own.
**Fix:** `/NUL` excluded in `.stignore`; the originating hook bug fixed separately.
**Prevention:** any of `NUL`/`CON`/`PRN`/`COM1-9`/`LPT1-9` appearing as a real filename anywhere in the vault is itself the bug (no Windows filesystem can legitimately hold one) — treat its existence as a signal to find and fix the tool that created it, not just delete the file.
## Failure Mode 3: Secrets Committed Or Left On Disk
**What happened, twice:**
- **Build 7 (2026-09-19):** a live OpenAI API key sat in two untracked `.codex/*.bak` backup files, caught by GitHub's push protection before reaching GitHub.
- **Build 8 (found 2026-09-28, occurred ~2026-09-20):** an Obsidian Copilot plugin credentials-backup file (`.obsidian/plugins/copilot/data-v3-credentials-backup-843e8d02.json`) was caught by the same push protection, but — unlike the OpenAI key — was never added to `.stignore`, so it kept being replicated to the Dell via Syncthing independently of git for over a week after the git side was already fixed.
**Fix:** both times, `git rm --cached` (or the commit was never made permanent) plus a `.gitignore` wildcard; the second time additionally required a matching `.stignore` wildcard, since git and Syncthing exclusion lists are separate and one being fixed does not fix the other.
**Prevention — the actual lesson, not yet fully closed:** any credential-bearing file needs the exclusion added to **both** `.gitignore` and `.stignore` in the same sitting, or it leaks through whichever list was forgotten. **Still open as of this note:** `data-v3-credentials-backup-843e8d02.json` itself needs deleting from both machines and its underlying key rotating — see Pending Actions below.
## Failure Mode 4: A Safety-Net Setting Silently Reverted Or Got Disabled
**What happened (found live, 2026-09-28):** two independent regressions, neither logged anywhere, neither caught by monitoring:
- `Jarvis-Syncthing-Health` (the 5-minute REST/conflict-file guard built specifically after the Sep 20 incident) was found `Disabled` in Task Scheduler, last real run six days earlier. Task Scheduler's own operational event log was also disabled on this machine, so there's no record of when or how it got turned off.
- The `jarvis` folder's Staggered File Versioning, documented in [[Cross-Laptop Sync - Rollback Procedure]] as active with `maxAge: 0`, was actually `type: ""` (none) live via REST — meaning a plain overwrite had zero `.stversions/` recovery for an unknown period.
**Fix:** versioning restored via REST (verified live). Health task re-enable is blocked by Windows UAC in this session — see Pending Actions.
**Prevention:** a documented safety net is not a guarantee it's still active. **Re-verify the live state directly (REST/Task Scheduler), not the documentation, on some regular cadence** — this is exactly what `Jarvis-Syncthing-Health` is for, which is why item 1 below matters more than it looks like on paper.
## Failure Mode 5: Two Uncoordinated Writers On The Same Files (the main one)
**What happened:** `Jarvis-GitAutoSync` runs every 15 minutes, independently on each laptop, doing `git pull --rebase --autostash` directly against the same working tree Syncthing also actively mirrors in real time. The rebase/autostash checkout is itself a disk write indistinguishable, to Syncthing's fs watcher, from a real edit. When both machines' independently-scheduled runs land close together in time, or either machine's git operation overlaps a live Syncthing transfer, the two sides can hold genuinely different bytes for the same path within the propagation window — a real conflict, not a bug, from Syncthing's point of view. Confirmed directly against timestamps (a same-minute conflict cluster across six-plus unrelated files, two minutes before a genuine 84-file auto-sync commit) and confirmed the pattern recurred once more, on the Dell's side, at 01:33 and 01:48 on 2026-09-28 (`.obsidian/plugins/file-explorer-plus/data.json`, device tag `2D4OE4D`) — after the Acer-side fix landed but before the Dell had received or applied the matching change.
**Fix (2026-09-28):** `git-auto-sync.ps1` patched to check Syncthing's own live `db/status` before touching the working tree (skips the run if not `idle`/`needBytes: 0`/`errors: 0`, deferring to the next tick), and to pause this machine's Syncthing folder for the exact duration of its own pull/rebase/commit/push, resuming in a `finally` block. This script lives inside the synced vault, so the fix reaches the Dell automatically once Syncthing delivers it and the Dell's own scheduled task next fires — **but the Dell's own Syncthing `config.xml` (watcher delay, versioning) is a separate, per-machine file that this fix cannot reach**, which is exactly why the 01:33/01:48 recurrence happened on the Dell after the Acer was already fixed.
**Prevention:** the debounce window (`fsWatcherDelayS`) narrows the race; the pause/resume coordination in the script closes it structurally, on whichever machine is actually running the patched script with a live Syncthing instance to talk to. Both machines need the same watcher-delay and versioning settings — this is a standing gap in the design (per-machine `config.xml` isn't and shouldn't be synced, since it holds each machine's own API key and GUI credentials), so **any future Syncthing-level setting change made on one laptop needs a deliberate matching step on the other**, not an assumption that the vault sync carries it over.
## Failure Mode 6: The `obsidian-kanban` Plugin Rewrites Full Files On Interaction
**What happened:** Board notes (`*Board.md`) are Kanban-plugin-managed. The plugin is documented upstream to rewrite the entire markdown file's content on most interactions with the board view — drag, checkbox, sometimes a view switch — not only on a deliberate typed edit. This is why Board and weekly notes specifically are overrepresented in the conflict list even when "nobody was editing that file."
**Not fixed, not fixable at the sync layer:** this is normal plugin behavior, not a bug. It means Board notes are inherently more collision-prone than prose notes whenever both laptops have the vault open in the same rough window. Failure Mode 5's fix reduces how often this manifests as an actual conflict; it doesn't change how often the plugin writes.
**Prevention:** if a specific Board note keeps colliding after Failure Mode 5's fix is live on both machines, treat that as a signal to avoid having the same board open on both laptops at once, not as a sign the sync fix failed.
## How To Verify Sync Is Actually Healthy Right Now (Not Just "Looks Fine")
Run these directly rather than trusting the GUI's "Up to Date" label alone — this is the exact sequence used to find every live gap in this note:
1. **Live REST status**: `GET http://127.0.0.1:8384/rest/db/status?folder=jarvis` (header `X-API-Key: <from config.xml>`) — want `state: idle`, `errors: 0`, `needBytes: 0`, `needFiles: 0`.
2. **Live completion against the other device**: `GET /rest/db/completion?folder=jarvis&device=<other device's full ID>` — want `completion: 100`, `needBytes: 0`, `remoteState: valid`.
3. **Folder errors**: `GET /rest/folder/errors?folder=jarvis` — want an empty `errors` array.
4. **Live conflict-file count on disk**: search the vault for `*sync-conflict*` and compare the count to the last known figure — a rising count with an otherwise-clean REST status means new conflicts are still being generated even though Syncthing itself looks healthy (this is exactly what caught the 01:33/01:48 recurrence above).
5. **`Jarvis-Syncthing-Health` task state**: `Get-ScheduledTask -TaskName "Jarvis-Syncthing-Health"` — must read `State: Ready`, not `Disabled`, and `Get-ScheduledTaskInfo` must show a `LastRunTime` within the last 5-10 minutes.
6. **`git-auto-sync.log` tail**: the last several `=== git-auto-sync ... ===` pairs should read `success` or `nothing to do`, never `CONFLICT` or `FAILED`, on both machines.
None of steps 1-3 alone are sufficient — they were all green while 5 and 6 were silently broken for a week.
## Pending Actions (Not Yet Done, Named Precisely)
1. **Re-enable `Jarvis-Syncthing-Health` on the Acer.** Blocked by Windows UAC elevation in an automated session. Do one of:
   - Task Scheduler GUI: Start menu → search "Task Scheduler" → right-click → **Run as administrator** → Task Scheduler Library → find `Jarvis-Syncthing-Health` → right-click → **Enable**.
   - Elevated PowerShell: right-click PowerShell → **Run as administrator** → `Enable-ScheduledTask -TaskName "Jarvis-Syncthing-Health"`.
   - Verify after: `Get-ScheduledTask -TaskName "Jarvis-Syncthing-Health" | Select State` should read `Ready`.
2. **Mirror the Acer's Syncthing folder settings onto the Dell** (per-machine `config.xml`, not vault-synced): on the Dell, open `http://127.0.0.1:8384` → folder **Jarvis** → **Edit** → **Advanced** tab → set **File Watcher Delay (s)** to `120` → Save. Then **File Versioning** tab → **Staggered File Versioning** → **Max Age** `0` → Save. (Or the REST equivalent from the Dell itself, using that machine's own API key from its own `config.xml`: `PATCH /rest/config/folders/jarvis` with `{"fsWatcherDelayS": 120}` and separately `{"versioning": {"type": "staggered", "params": {"maxAge": "0"}}}`.)
3. **Find, delete, and rotate the leaked Copilot credentials backup on both machines.** On each laptop, in the vault root: check for any file matching `.obsidian/plugins/copilot/data-*backup*.json` (confirmed present on the Acer as `data-v3-credentials-backup-843e8d02.json` as of this note). Before deleting, open Obsidian → Settings → Copilot plugin → note which AI provider key(s) it has configured, generate a new key from that provider's own dashboard, replace it in the plugin settings, revoke the old key at the provider, then delete the backup file(s) on both machines.
4. **Reconcile the 29 (now higher, see Build 8 Findings addendum) existing `.sync-conflict-*` files**, once 1-3 are done — compare each against its canonical counterpart and archive per the pattern already established in [[Cross-Laptop Sync - Build Roadmap]]'s Sep 20 incident (`D:\_Anant\99_Archive\Syncthing Conflict Reconciliation ...`), not a blind delete. Not done yet, per explicit instruction to leave them for now.
## Links
[[Cross-Laptop Sync - Build 8 Findings]] · [[Cross-Laptop Sync - Build Roadmap]] · [[Cross-Laptop Sync - Rollback Procedure]] · [[Cross-Laptop Sync - Jarvis Wrap-Up]]
