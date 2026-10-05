---
name: reviewing-weekly
description: Full weekly vault review aligned with the Jarvis Three-Month Research Engine Master Plan; tracks what was built, what's overdue, what needs linking, and what next week should prioritize.
---
# weekly-review

**Usage:** `/weekly-review` or invoked automatically by the Cowork weekly scheduled task.

---

## Pre-flight: Read These First

Before touching anything else, read these files in order:

1. `60_Claude/07_AI_Information/AI_CONTEXT.md`
2. `60_Claude/07_AI_Information/Session Logs/log.md` — tail: last 100 lines
3. `00_Dashboard.md`
4. `20_Progress/Projects/AI Second Brain/Jarvis Three-Month Research Engine Master Plan.md` — sections: "Three-Month Build Map" and "The Weekly Operating Rhythm" (moved out of `60_Claude/40_Project_Briefs/` once it became the live execution plan)
5. The most recent weekly synthesis: `60_Claude/30_Reviews/Weekly Synthesis/` — list directory, read the latest file

Determine the current ISO week number from today's date. Format: `YYYY-WXX`.

---

## Step 1: Find Recent Vault Activity

Calculate the date 7 days ago. Then search for recently modified notes:

- Use `mcp__jarvis-fs__search_files` or `mcp__jarvis__search_simple` to find notes modified in the past 7 days
- Search across: `10_Areas/`, `20_Progress/`, `40_Resources/`, `60_Claude/`
- Exclude: `50_Archive/`, `60_Claude/05_Clippings/`, `.obsidian/`, `.claude/`, `.kiro/`, `.cursor/`

Group what you find by area:

- **Coursework** (`10_Areas/`): course notes, concept notes, lab/project notes
- **Projects + Career** (`20_Progress/`): project notes, career notes, UROP progress
- **Resources** (`40_Resources/`): enriched concept notes, reference material
- **Claude layer** (`60_Claude/`): distillations, summaries, project briefs, reviews

For each group, note: what was created vs. what was updated, and whether the work has a clear `next:` or outcome.

---

## Step 2: Fall Execution Audit

Check execution tracks against the Systems table and Week-by-Week table in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]. The frame that arbitrates priority is [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]]. The Summer 2026 plan folder is closed — do not read from it here.

Do not re-read all plan files — use these specific checks:

### Internship application floor (the one thing)
- Check `10_Areas/Career/Internships/Tracker/Each One/` — count `Current/` vs `Applied/` vs `Result/`, compare to last week's count
- Target: at least one company moves `Current/` → `Applied/` most days
- Flag if the Applied count didn't move this week

### Technical interview prep (CodePath + LeetCode) and System Design
- Check whether a Fall LeetCode/CodePath daily log exists yet (per Fall 2026 Plan's Systems table, this was an open task as of 2026-09-07) — if still missing, flag it every week until created
- If it exists, read its daily log for this week's solved count against the floor of 5/day
- Check for a logged System Design session (2x/week target, starting 2026-09-14)

### Classes
- Read [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]] — Grading Criteria section, and whether it's been filled in with real rubrics yet
- Any of the 6 Fall'26 courses (ENGL 1004, CSCI 4511W, CSCI 4061, CSCI 5304, MGMT 3015, CSCI 4521) with a deadline in the next 7 days? (ENGL 1004 replaced AMES 1201 and CSCI 4511W replaced CSCI 3081W, 2026-09-09 - both archived under their old names)

### Projects (TradingView, Portfolio v2, ClaudeKit)
- Check `20_Progress/` — any project notes modified in the past 7 days?
- Against the Fall 2026 Plan's Systems table done-definitions: did TradingView's `tasks.md` checkpoints move, did Portfolio v2 publish a real blog post, did the ClaudeKit sync permission-bit issue get worked?
- What shipped this week? (code pushed, document finalized, demo done — concrete artifacts only)

### Career Pipeline (broader)
- Any applications submitted, outreach sent, or interviews scheduled beyond the daily floor?
- AIIS, mentorship, scholarships, networking/hackathons, LinkedIn — check each Systems-table row's done-definition against what actually happened this week
- Check if `20_Progress/` has any career-related notes touched this week

For each track mark: ✅ on target, ⚠️ partial, ❌ missed. One line per track explaining the verdict.

---

## Step 3: Enrichment Queue Health

Check the enrichment pipeline status:

1. Count notes where `enrichment_status` is missing or not `"enriched"` — these are candidates
2. Check for notes where `next_drill < today` — these are overdue drills
3. Identify which tracks (ai, systems, algorithms, career, trading) are most behind
4. Note how many notes were enriched this week vs. the target of 10/week

Key enrichment locations:
- `40_Resources/CS/AI/` — AI track
- `40_Resources/CS/` — algorithms/systems track
- `60_Claude/20_Distilled_Notes/` — distilled knowledge layer
- `20_Progress/UROP/` — UROP/BOOM/systems track

---

## Step 4: Structural Health Check

Check four things:

**Orphans:** Notes in `40_Resources/` or `60_Claude/20_Distilled_Notes/` with zero backlinks (`length(file.inlinks) = 0`). These are knowledge islands. List the top 5 by age.

**Missing next actions:** Project notes in `20_Progress/` where `type = "project"`, `status != "archived"`, and `next` is missing. A project without a next action is stalled.

**Metadata gaps:** Notes in active areas missing `type` or `status`. These break Dataview queries.

**New notes without outbound links:** Notes created this week with no wikilinks in their content. New notes should connect to at least one existing note.

---

## Step 4.5: Promotion Scan

Simplified replacement for the old 6-check promotion gate — manual-promote-on-request plus this weekly safety net.

1. Search Jarvis for notes with `status: tree` that were created or modified in the past 7 days (reuse Step 1's activity scan; filter by frontmatter status).
2. For each candidate, apply a short 3-line bar: (a) source-grounded — points at real evidence, not invented claims; (b) stable — not a raw transcript, clipping, or dashboard/index file; (c) useful outside Jarvis — would change a decision or preserve reusable knowledge in The Plan.
3. List survivors under a new "Promotion Candidates" section in this week's synthesis note (Step 6) — one line each: note path, one-sentence reason.
4. Do not write into The Plan automatically. Promotion means Anant (or a session with `the-plan` MCP access) reviews the list, writes a grounded summary into The Plan, and logs a row in `60_Jarvis/40_Promoted_Notes/Promoted From Jarvis Index.md`. This step only surfaces candidates.

---

## Step 5: Session Log Summary

Extract from `60_Claude/07_AI_Information/Session Logs/log.md` all entries from the past 7 days.

Summarize:
- Sessions run: how many, what types (build/enrich/distill/review/setup/audit)
- Notes created this week: count
- Notes enriched: count
- Conversations captured or distilled: count (0 is worth flagging)
- Whether any session lacked a clear `next:` action

---

## Step 6: Write the Review Note

Create `60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — YYYY-WXX.md` using this template.

After creating it, also patch the weekly periodic note at `10_Areas/Life/Enumerate/Weekly/YYYY-Www.md` (where `YYYY-Www` matches the ISO week, e.g. `2026-W24`). If the note doesn't exist, create it using `30_Order/Templates/Enumerate/Better Weekly.md`. Patch its `> [!NOTE] Summary:` callout with a one-sentence summary of the week, and fill the Goals and Fixes sections with the top items from the synthesis note. Keep it brief — the weekly periodic note is a quick-glance record, not a duplicate of the full synthesis.

```markdown
---
type: review
status: complete
created: YYYY-MM-DD
week: YYYY-WXX
tags:
  - review
  - weekly
notes:
  - "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index]]"
---

# Weekly Synthesis — YYYY-WXX

[One sentence: the defining theme of this week. Not a list — a statement.]

## What Was Built

[Describe actual completed work. Be specific: file names, note counts, which skill/agent/command now works. Skip anything that was just planned but not done.]

## Three-Month Plan Status

[Current month and week in the plan. Table of this month's milestones with ✅ / ⚠️ / ❌ status. One sentence on whether the plan is on track, ahead, or behind, and what the main blocker is.]

## Enrichment and Drills

[How many notes enriched this week. Overdue drills if any. Which track needs the most attention next week. Total enriched-to-date vs. the 100-note end-of-three-months target.]

## Vault Health

[Orphaned notes count. Projects missing next actions (list them). Metadata gaps. Any new notes created this week that have zero links.]

## Suggested Links

[3–5 concrete link suggestions: "[[Note A]] should link to [[Note B]] because..." Only suggest links that don't already exist and that would add genuine navigational value.]

## Cleanup Candidates

[2–4 notes that should be deleted, merged, or archived. Must state the specific reason — duplicate, stale, superseded, orphan that nobody will ever read.]

## Promotion Candidates

[From Step 4.5 — status:tree notes from this week that pass the 3-line bar (grounded, stable, useful outside Jarvis). One line each: note path + one-sentence reason. "None this week" is a valid, honest answer.]

## Next Week Priorities

[Exactly 3 priorities, tied to the master plan. Each one is a specific action, not a vague theme. Format: "Priority: [what]. Why now: [reason tied to plan]. Output: [what file or command exists when it's done]."]

## Open Questions

[2–3 genuine unresolved questions this week surfaced — about the build plan, the vault, or Anant's direction. Not rhetorical. Things that need a decision or more information before proceeding.]
```

**Writing rules:** Follow `HUMAN_WRITING.md`. Every sentence in this note must carry information. No filler. If a section has nothing meaningful to say, write one honest sentence saying so ("No conversations were captured this week. The capture folders still don't exist.") rather than padding.

---

## Step 7: Update the Weekly Synthesis Index

Read `60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index.md`. Add the new review to the index table.

---

## Step 7.5: Log Maintenance

Read `60_Claude/30_Reviews/Weekly Synthesis/Logs/Log Review.md` in full — it holds the managed-logs registry (which logs, their line/file caps, and the trim rule for each) and the exact entry format. For every log in that registry:

1. Check its current size against its cap (line count for line-based logs, file count/age for the dated-file logs like `cursor-workflow/logs/sweep-*.log`).
2. If under the cap, do nothing — no entry, no action. A quiet log this week is not worth logging.
3. If over the cap: read the portion beyond the cap, write a real aggregate summary (success/failure/conflict counts, date range, any genuine anomaly — not a restated line count) as a new dated entry in `Log Review.md`, then actually delete the excess from the source log. Never move it to a second file — that recreates the exact bloat this step exists to remove.
4. The 10 `Sync-Log-Archive-2026-09-19.md` files are a one-time cleanup, not a recurring check: if any still exist, summarize each in full into `Log Review.md` and delete the archive file entirely, then remove that file's row from the registry table in `Log Review.md` since it no longer exists to manage.
5. Logs marked "Curated" or "Monitor only" in the registry never get trimmed by this step, even if they cross their cap — flag it as a line in this week's synthesis note instead (Step 6's "Vault Health" section) so a human decides, rather than auto-deleting dense, hand-quality content.
6. **Headless-run exception, added 2026-09-28:** if the invoking prompt states this is an unattended/headless run (the `Jarvis-WeeklyReview` scheduled task passes this explicitly), treat every over-cap log as flag-only regardless of its registry setting — summarize it into `Log Review.md` as usual, but do not delete the excess from the source log. An interactive `/weekly-review` run (a human present) keeps deleting as designed. This exists because unattended bulk deletion is exactly the failure class the 2026-09-28 sync-conflict reconciliation found and fixed elsewhere in the vault (see [[Cross-Laptop Sync - Known Failure Modes and Prevention]], Failure Mode 6) — never resolve destructively without a human able to catch a mistake.

This step is independent of Steps 1-6's narrative synthesis — run it regardless of whether the rest of the review found anything notable.

---

## Step 7.6: Sync Health Check

Added 2026-09-28 after Build 8 found real content silently lost in a sync-conflict race; revised 2026-10-02 after Build 9 found the guard that was supposed to catch this correctly running and correctly failing for three days with nobody noticing. See [[Cross-Laptop Sync - Operations Reference]] first — it is the single consolidated playbook this step follows; [[Cross-Laptop Sync - Known Failure Modes and Prevention]], [[Cross-Laptop Sync - Build 8 Findings]], and [[Cross-Laptop Sync - Build 9 Findings]] hold the full history if deeper context is ever needed. This step exists so a `.sync-conflict-*` file or a correctly-detected-but-unseen problem is never sitting unnoticed in the live vault for more than a week between reviews.

0. **Check `00_Dashboard.md` first, before searching anything.** If it currently shows a `<!-- SYNC-ALERT:BEGIN -->` banner, that is `check-syncthing-status.ps1` actively reporting a real, current problem — read the banner's own problem list, treat it as the starting point for steps 1-4 below, and confirm after fixing that the banner has cleared itself (it should, automatically, on the next clean run — if it is still there after reconciliation, something above this step is still broken, flag that explicitly).
1. Search the vault for any file matching `*sync-conflict*`. If none exist (and no Dashboard banner from Step 0), write one line in this week's synthesis note's Vault Health section ("No live sync conflicts.") and move on — nothing else to do.
2. If any exist, for **each one**, read it and its canonical counterpart in full and compare — never assume file size or timestamp tells you which side is correct. A conflict copy can hold the only current copy of real work (confirmed directly twice now: 7 of 31 reconciled on 2026-09-28, 1 of 4 reconciled on 2026-10-02 — both times a canonical file had silently regressed to stale content). Never bulk-delete or bulk-archive without this per-file read.
3. If canonical is missing entirely, or the conflict copy is clearly more complete/current, restore canonical from the conflict copy's content before doing anything else with that file.
4. Once canonical is confirmed correct, move (never delete) the conflict file to **this machine's own `99_Archive\Syncthing Conflict Reconciliation <today's date>` folder, outside the vault entirely** (create the dated folder if this is the first one found this week), preserving its relative path under the vault. **Never write this inside the vault itself** — AGENTS.md's golden rule #1 forbids a new top-level folder at vault root, and Build 11 (2026-10-04) found a session do exactly that on the Acer when it couldn't resolve the other machine's hardcoded archive path, which then synced the mistake back to the Dell. The two laptops' real archive roots have different drive layouts (confirmed Build 10/11: one is `D:\Users\_Anant\99_Archive`, the other `D:\_Anant\99_Archive`) — check this machine's own actual path before writing, never assume either literal string, and if it's genuinely unclear, ask rather than falling back to a vault-relative path. (As of Build 9, `.gitignore` excludes `*.sync-conflict-*`, so these never reach git in the first place — the archive step is still required, since that's the only durable record outside Syncthing's own `.stversions`.)
5. List what was found and restored/archived in this week's synthesis note's Vault Health section — a conflict silently found and fixed is exactly the kind of thing that section exists to surface.
6. Also run (or ask a session with shell access to run) `30_Order/System/sync-workflow/scripts/check-syncthing-status.ps1` and note its `Overall:` line (`IN SYNC` or `NOT IN SYNC`) in the same section. A non-`IN SYNC` result with zero conflict files found in step 1 means Syncthing itself has a live problem (errors, unsynced bytes) — flag it explicitly as more urgent than a normal conflict file, since it usually means something is actively broken right now, not just a past collision to clean up.
7. **First review of the month only:** additionally run the full "How To Verify Sync Is Actually Healthy Right Now" checklist from [[Cross-Laptop Sync - Known Failure Modes and Prevention]] (all 7 points — Task Scheduler enabled-state for all three Jarvis scheduled tasks, Staggered Versioning's live `type`/`maxAge`, both machines' `fsWatcherDelayS`). These are exactly the settings Build 8 found had silently reverted with zero file-level trace — a weekly conflict-file scan alone cannot catch a safety net that quietly turned itself off. Note the result in Vault Health even when everything checks out ("Monthly deep check: all clear") so a skipped month is visible in the synthesis history, not just a silent gap.
8. **If this is the first review since a Dashboard-banner incident actually fired for real** (confirmed by Step 0 finding a banner, or `.sync-alert-state.json`'s `consecutiveFailures` being nonzero when checked), this is the signal the alerting path itself is proven live, not just tested manually — note that confirmation once, since Known Failure Mode 12's fix had not yet had a real unattended trigger as of 2026-10-02.
9. **Hardcoded-absolute-path audit (every review, not just monthly).** Added Build 11 (2026-10-04) after finding `.claude/settings.json`'s two hook commands and 12 scripts under `30_Order/System/` all hardcoded to one laptop's drive layout (`D:\_Anant\20_Progress\Documents\Jarvis`), broken on the other the entire time, silently - this was the *second* time this exact bug class hit this many files (first found and supposedly fixed 2026-09-28, Known Failure Mode 10/11). Run a vault-wide search for both known literal path strings (`D:\_Anant\20_Progress\Documents\Jarvis` and `D:\Users\_Anant\10_Areas\Documents\Jarvis`) across `.ps1`/`.vbs`/`.py`/`.json` files under `30_Order/System/` and `.claude/`. Any hit in a real script (not a log file or a findings/history note citing it as past-tense evidence) is a live bug - fix it using `$PSScriptRoot`-relative resolution (`.ps1`), the script's own folder via `WScript.ScriptFullName` (`.vbs`), `Path(__file__).resolve().parent`-relative (`.py`), or `$CLAUDE_PROJECT_DIR` (`.claude/settings.json` hook commands) - never a third hardcoded literal for either machine. Functionally test any hook you touch with a real payload (a vault-root write denied, a normal write allowed) before considering it fixed, per Known Failure Mode 10's own standard.
10. **Ignore-file symmetry audit (every review).** Added Build 11 after finding 14 files already excluded from Syncthing (`.stignore`, "proven machine-local state") that had never gotten the matching `.gitignore` line, which let `Jarvis-GitAutoSync` silently fail for two days straight on one of them. Read both `.gitignore` and `.stignore` and confirm every entry under a "machine-local"/"per-machine artifact" comment block in one file has the identical path in the other - a file excluded from only one of the two sync mechanisms is a live bug waiting to happen, not a style inconsistency. Also check: did this week's own session work (or any other AI platform's build - Claude Code, Codex, Cursor, Kiro, or whatever gets added next) create any new per-machine-only file (a state file, a cache, a rate-limiter, a local log) that isn't in either list yet? Add it to both, in the same sitting, following the existing comment-block convention (what the file is, which build found it, why it's per-machine). This step exists specifically so onboarding a new AI tool's automation never repeats this exact gap a third time.

---

## Step 8: Log the Session

Append to `60_Claude/07_AI_Information/Session Logs/log.md`:

```
## [YYYY-MM-DD] review | Weekly Synthesis YYYY-WXX

[2–3 sentences: what the review surfaced, what's most behind, what next week's top priority is.]
```

---

## Execution Notes for Future Claude

- **Trigger, status as of 2026-10-02:** the task is registered and `State: Ready`, but `Get-ScheduledTaskInfo` shows it has never actually fired (`LastRunTime` reads the Windows "never run" sentinel) — expected, not broken, since the registration landed 2026-09-28 (a Monday) and the next Sunday 06:00 slot is 2026-10-04. **The first real unattended fire on 2026-10-04 is the actual verification Known Failure Mode 11 asks for — check `LastRunTime`/`LastTaskResult` after that date before trusting this trigger at all; do not extend that trust backward to any date before then.**
- **Trigger, corrected again 2026-09-28:** the 2026-09-20 fix below was itself never actually true. `run-weekly-review.ps1` hardcoded the old laptop's vault path (`D:\Users\_Anant\...`) from whenever it was written, so every scheduled fire would have failed at its very first `Set-Location` call — and the `Jarvis-WeeklyReview` Scheduled Task did not actually exist on the Acer at all when checked live on 2026-09-28 (confirmed via a full `Get-ScheduledTask` listing, not assumed). Both bugs fixed 2026-09-28: the path corrected, and the task registered for real via `register-weekly-review-task.ps1` (Sundays 06:00, hidden VBS launcher, matching the pattern already proven for `Jarvis-GitAutoSync`). **Do not trust this note's own claim that the trigger works — re-verify live (`Get-ScheduledTask -TaskName "Jarvis-WeeklyReview"`, check `LastRunTime`/`LastTaskResult` after the next Sunday) rather than assuming this fix held**, per the exact lesson [[Cross-Laptop Sync - Known Failure Modes and Prevention]] documents for every other "fixed" safety net in this vault.
- ~~Trigger, corrected 2026-09-20~~ (superseded by the entry above, kept for history): the previously-documented "Cowork scheduled task every Monday morning" was never actually verified and had been silently dead for 13 weeks (last real run: 2026-W22). Because both laptops may have `Jarvis-WeeklyReview` registered, **check `60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index.md` for this week's ISO week number before doing any real work** — if this week's entry already exists, stop, this is a duplicate fire from the other laptop, not an error.
- You start cold with no prior context. The pre-flight reads are not optional.
- The three-month plan started April 24, 2026. Use that anchor to calculate which phase and week you're in.
- The master plan's "Weekly Operating Rhythm" section defines the expected weekly cadence. Compare actual vault activity against it honestly.
- Fall 2026 Plan's own cadence rule: two consecutive missed `/weekly-review` runs means a full re-scope conversation before that plan continues, per [[30_Order/Standards/Daily Workflow Standard|Daily Workflow Standard]] — flag this explicitly if it applies.
- If conversation capture folders (`60_Claude/05_Clippings/AI Conversations/` and `60_Claude/10_Source_Summaries/AI Conversations/`) don't exist yet, flag this every week until they're created. This is the most critical missing piece of the build spine.
- If it's the last week of a month, also check whether a monthly review note belongs in `60_Claude/30_Reviews/Monthly/`.
- Do not modify raw clippings, archive notes, `.obsidian/`, `.claude/`, `.kiro/`, or `.cursor/` directories.
- Prefer patching existing notes (vault_patch by heading) over full rewrites.
