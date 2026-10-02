---
type: evergreen
status: sprout
created: 2026-10-02
tags:
  - evergreen
  - laptop
  - ai-infrastructure
notes:
  - "[[Cross-Laptop Sync - Build Roadmap]]"
  - "[[Cross-Laptop Sync - Known Failure Modes and Prevention]]"
  - "[[Cross-Laptop Sync - Build 9 Findings]]"
  - "[[Cross-Laptop Sync - Rollback Procedure]]"
next: "Re-check this note's cadence table and Part 6 after the Dell receives the Build 9 patch and the 2026-10-04 first-fire of Jarvis-WeeklyReview"
---
# Cross-Laptop Sync - Operations Reference
## Why This Note Exists
Builds 1 through 9 each dug into one incident and wrote up what they found — real, necessary forensic work, but it means the operating knowledge for this system is spread across nine dated documents, in the order they were discovered rather than the order a person actually needs them. **This note is the one to read first.** It explains what the four moving pieces actually do, how to tell in under a minute whether something is wrong, and the exact safe procedure for fixing the one error type that recurs: a live `.sync-conflict-*` file. The Build Findings notes stay as the historical record and the deep-dive source for *why* each rule exists; this note is the *what to do right now*.
## Part 1: The Four Moving Pieces
| Piece | What it does | Runs | Where it lives |
|---|---|---|---|
| **Syncthing** | Mirrors the `jarvis` folder between the Dell and the Acer in near-real-time. The actual content-sync layer. | Continuously, as a background service | Installed app; config at `%LOCALAPPDATA%\Syncthing\config.xml` (per-machine, never synced) |
| **`Jarvis-GitAutoSync`** | `git pull --rebase --autostash`, commit any real diff, push, retry once on rejection. Gives the vault real version history and a GitHub backup independent of Syncthing. | Every 30 minutes (widened from 15 in Build 9) | `30_Order/System/claude-workflow/scripts/git-auto-sync.ps1` |
| **`Jarvis-Syncthing-Health`** | Queries Syncthing's own REST API plus a filesystem scan for `.sync-conflict-*`/`~syncthing~*.tmp` debris. As of Build 9, a failure also writes a banner into `00_Dashboard.md` and fires a Windows toast. | Every 5 minutes | `30_Order/System/sync-workflow/scripts/check-syncthing-status.ps1` |
| **`Jarvis-WeeklyReview`** | Runs the full `/weekly-review` skill headlessly, including Step 7.6's sync-health reconciliation and a first-of-month deep check (Task Scheduler + versioning + watcher-delay settings on both machines). | Sundays 06:00 | `30_Order/System/claude-workflow/scripts/run-weekly-review.ps1`; skill at `.claude/skills/weekly-review/weekly-review.md` |
**Staggered File Versioning** is not a separate task — it is a Syncthing folder setting (`versioning.type: staggered`, `maxAge: 0`, indefinite retention). Every file Syncthing overwrites or deletes gets a timestamped copy in `.stversions/` first. This is the undo button for Scenario 3 below.
## Part 2: The One Error That Recurs, And Why
The recurring error is a live `.sync-conflict-*` file. It happens because `Jarvis-GitAutoSync`'s own `pull --rebase --autostash` writes files to disk as a normal part of applying the other laptop's commits — and that write is indistinguishable, to Syncthing's file watcher, from a person editing the file. When both laptops' independent 30-minute ticks (or a tick and a live hand-edit) land close enough in time, Syncthing correctly detects real byte-level divergence and does exactly what it is designed to do: keep both sides, renaming the losing one to `*.sync-conflict-<timestamp>-<device>.<ext>`.
**This is not a bug and will not be fully eliminated.** Build 8's fix (pausing this machine's Syncthing folder for the duration of its own git operations, checking Syncthing is idle before starting) narrows the race window; Build 9's cadence change (15 → 30 minutes) roughly halves how often that window opens per day. Neither makes two laptops editing near-simultaneously conflict-proof — Syncthing's conflict-copy mechanism is the correct, intended safety behavior for that case, not a failure to engineer away.
**The dangerous part is not the conflict file itself** — Syncthing already preserved both sides, nothing is silently gone the moment a conflict file appears. **The dangerous part is the git rebase that produced it sometimes checking out the *stale* side as canonical**, with no signal anywhere in the live vault that this happened. The conflict file sitting next to it is the only reason the real content wasn't permanently lost. This has happened twice, confirmed directly both times (Build 8: 7 of 31 reconciled files; Build 9: 1 of 4). Treat every conflict file as "canonical might be the wrong one" until actually checked, never as housekeeping.
## Part 3: How To Tell Something Is Wrong, In Under A Minute
In order, fastest signal first:
1. **Open `00_Dashboard.md`.** If a `[!danger] SYNC ALERT` callout appears right after the frontmatter, `Jarvis-Syncthing-Health` found a real problem *right now* and listed exactly what. It clears itself automatically once fixed — its mere presence is the single fastest "something is wrong" signal in this entire system, faster than running any command.
2. **Check for a Windows toast.** Best-effort, may not always fire, but if one appeared titled "Jarvis sync problem detected," same source as #1.
3. **Run the health check directly:** `powershell.exe -File "30_Order\System\sync-workflow\scripts\check-syncthing-status.ps1"` from the vault root. Read the `Overall:` line.
4. **Search the vault for `*sync-conflict*`.** Zero hits outside `.stversions/` is healthy.
None of these alone are sufficient on their own for the *monthly* question ("has a safety net silently turned itself off") — see Part 6.
## Part 4: The Safe Procedure For Clearing A Conflict File
**Never bulk-delete. Never bulk-archive. Never trust file size or timestamp to tell you which side is correct.** This is the one rule every past incident comes back to.
1. Find the conflict file and its canonical counterpart (same path, minus the `.sync-conflict-<timestamp>-<device>` suffix).
2. Read both in full. For text notes, `diff` them; for JSON, parse and compare meaningfully (a settings file's trivial field differing is not the same as its actual content differing). For anything you cannot quickly reason about byte-for-byte, read both and decide which one is actually more complete/current — not which one looks newer.
3. **If canonical is missing, truncated, or stale relative to the conflict copy:** overwrite canonical with the conflict copy's content before doing anything else with that file. This is the regression case — it has happened twice and will happen again.
4. **If canonical is correct and current:** the conflict copy is safe to retire, but still archive it, don't delete it outright.
5. Either way, move (never delete) the conflict file to `D:\_Anant\99_Archive\Syncthing Conflict Reconciliation <today's date>\`, preserving its relative path under the vault. Create the dated folder if it's the first one that day.
6. Verify afterward: re-run the health check (`check-syncthing-status.ps1`), confirm `Overall: IN SYNC`, and confirm the Dashboard banner (if one was showing) has cleared.
This exact procedure is also what `/weekly-review` Step 7.6 runs automatically every Sunday — reconciling a conflict file by hand and reconciling one found by the weekly review are the same operation.
## Part 5: What Changed In Build 9, And Why
- **`git-auto-sync` cadence widened 15 → 30 minutes.** A full audit of `git-auto-sync.log` (425 logged runs) found every "CONFLICT" entry outside the original 2026-09-20 bootstrap period traced to a transient DNS/network blip (`Could not resolve host: github.com`), not a real rebase conflict — those self-resolve on the next tick regardless of cadence. The actual content-loss risk (Part 2) scales with how often the rebase/checkout runs, which cadence directly controls. Halving run frequency halves that exposure.
- **`.gitignore` now excludes `*.sync-conflict-*`.** Before this, `git-auto-sync`'s `git add -A` was sweeping unreconciled conflict files straight into permanent history on a public GitHub repo — 18+ were found already committed. A conflict file is by definition not yet reconciled; it has no business in git history before someone runs Part 4 on it. This does not touch `.stignore` — Syncthing still needs to be able to create these files, this only keeps git out of the picture until a human (or the weekly review) has looked.
- **`check-syncthing-status.ps1` now alerts instead of just exiting.** The guard itself was never broken this time (unlike Build 8, where it was silently `Disabled`) — it had been correctly detecting a real problem for three days with `LastTaskResult: 1`, and nothing surfaced that to a person. See Part 3's banner/toast mechanism, full detail in [[Cross-Laptop Sync - Build 9 Findings]].
## Part 6: Why This Isn't Run By A Claude Cloud Routine
The natural instinct is "schedule a Claude Code cloud agent to watch this." It cannot do this job, for a structural reason worth writing down so it doesn't get re-proposed and silently fail: a cloud routine runs in an isolated cloud sandbox with a GitHub clone and whatever MCP connectors are attached — it has **no network path to `http://127.0.0.1:8384`** (Syncthing's local REST API, only reachable from the machine it runs on) and **no access to `git-auto-sync.log`** (deliberately `.gitignore`d as a per-machine artifact, so it never reaches GitHub at all). A cloud routine could only ever see what's already in the GitHub repo after the fact — it cannot see live Syncthing state, cannot see Task Scheduler state, and a routine that pushed commits back to the same branch `git-auto-sync` also pushes to would recreate the exact race this whole build exists to reduce.
**The correct mechanism is the one already built and already local:** `Jarvis-WeeklyReview`, a Windows Scheduled Task running `claude -p` headlessly on this machine, with full local access to Syncthing's REST API, the real log, and Task Scheduler itself. It already runs the full reconciliation protocol (Step 7.6) weekly and the deeper settings-drift check (Step 7.6, point 7) on the first review of each month. This is "autonomous and weekly reviewable" within what's actually possible here — autonomy that needs local state has to run locally.
**Status as of 2026-10-02: this task has never actually fired yet.** It was registered 2026-09-28 (a Monday); the next Sunday 06:00 slot is 2026-10-04. Check `Get-ScheduledTaskInfo -TaskName "Jarvis-WeeklyReview"` after that date — a `LastRunTime` in the past and `LastTaskResult: 0` is the first real proof this works unattended. Before that date, every claim about this task "working" is design intent, not verified fact — don't repeat it as settled.
## Part 7: Known, Accepted Limits (Not Bugs)
- **Both laptops editing the same file at the same time will still, occasionally, produce a real conflict file.** This is Syncthing's correct behavior, not a defect. The goal of this whole system is to make that event rare, visible, and safely recoverable — not impossible.
- **Per-machine settings do not travel with Syncthing.** `%LOCALAPPDATA%\Syncthing\config.xml` (watcher delay, versioning) and Windows Task Scheduler registrations are local to each laptop. A script fix inside the vault (like Build 9's patch to `check-syncthing-status.ps1`) reaches both machines automatically; a *setting* or *registration* change (like the cadence change in Part 5, or re-enabling a disabled Scheduled Task) does not, and needs the same deliberate step run on each machine. Check this explicitly after any infra change here — it is the single most repeated root cause across Builds 4 through 9.
- **A toast notification is best-effort.** It depends on Windows' WinRT toast plumbing working unelevated in a Scheduled Task context, which was not independently confirmed visible (only confirmed to not throw). The Dashboard banner does not share this dependency and is the fallback that always works if the script itself runs at all.
## Sources
- [[Cross-Laptop Sync - Build 9 Findings]] — the audit and fixes this note consolidates
- [[Cross-Laptop Sync - Known Failure Modes and Prevention]] — the full 12-failure-mode history and the live-health verification recipe
- [[Cross-Laptop Sync - Build Roadmap]] — build-by-build chronology
- [[Cross-Laptop Sync - Rollback Procedure]] — what to do if sync itself needs to be paused or reconfigured, not just a conflict file reconciled
