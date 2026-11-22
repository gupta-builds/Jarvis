---
type: review
status: complete
created: 2026-11-22
updated: 2026-11-22
review_kind: capability
week: 2026-W47
tags:
  - review
  - weekly
notes:
  - "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index]]"
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan]]"
  - "[[10_Areas/Life/Enumerate/Weekly/2026-W47]]"
  - "[[20_Progress/Internship/Building System/Weekend Build]]"
---
# Weekly Synthesis: 2026-W47
**Headless run on `gupta-builds`, the machine with the live git writer.** Fired by the `Jarvis-WeeklyReview` scheduled task, which started at 14:20 on Sunday 11-22 instead of the 06:00 slot, with no human present. Step 7.5 is flag-only: nothing was deleted from any log. The window is 11-15 19:02 (the W46 run) to now, read from file times and 44 commits.
The week went into building the machine that applies, not into applying: the internship kit in `30_Order` was rebuilt on 11-21, while the tracker is still 29/0/0 (ninth review at zero, 59 days since its last commit) and Uber has still not left `Current/`.
## What Was Built
Checked against file times, commit stats and frontmatter, not against what the notes claim.
- **Internship kit and System records (11-21).** The session log entry for the day says the kit went from 31 files to 20 (seven Standards rewritten, Application Documents Standard added, eight Templates and four Workflows rebuilt, eight files cut, 31 wikilinks retargeted) and four loop records were written under `30_Order/System/internship-loop/`. The same entry says the research loop's `run` workflow shows a `failure` on 2026-11-21 and no scheduled run between 08-29 and then, cause unknown. `System - Build Log.md`, `System Rebuild Plan.md`, `Weekend Build.md` and about twenty `Building System` notes changed on 11-21. `Weekend Build.md` states its own goal: by Sunday morning the loop runs, the stale dossiers are archived and a ranked apply queue exists, "so Sunday is spent applying". As of this run `Apply Today.md` has an empty table, `Applications-to-Create.md` was only restructured, and no `Applied/` folder exists.
- **Course notes.** CSCI 4061: `Lab - 10` (20 KB, 11-16), `Project - 3 Code Explaination` (104 KB, 11-20) and `Project - 3 Implementation` (63 KB, 11-20). CSCI 4511W: `Short Quiz - 10` and `Writing - 3` (11-16) and `Code Review - 3` (11-19). CSCI 5304: `Homework - 3` touched again on 11-16. MGMT 3015: only the Board, 11-18. CSCI 4521: 41 files carry 11-19 13:30 to 13:47 times and arrived in one commit (`1246f572`, +1,175 and −111), and the one I diffed, `Week - 4`, changed by a single deleted line, so this reads as a batch pass over existing notes and not new study. I did not read the other 40 diffs.
- **Batch edits.** One commit on 11-19 (`f936a962`) changed 30 files under `VISAs & Work Auth` (+794, −238) and 75 under `Projects/CS/Portfolio` (+900, no deletions). I did not read the diffs, so I count neither as new content. Individual Portfolio notes did change: `Portfolio.md` and `06 - Cursor Agent System.md` on 11-20, and the `Session Findings` note on the 11-18 localhost dev errors.
- **Daily note.** `2026-11-20.md` is the only daily note this week, and it is the unrendered template: `created: <% tp.date.now("YYYY-MM-DD") %>` is still literal in its frontmatter, the Morning Plan is empty and every toggle is `false`. It has 57 lines and no content.
- **Machine setup notes.** Five `New Laptop` notes (Cursor and VS Code parity, MCP and secrets, Machine Toolkit, Rebuild Index) and a Dell WSL health-fix prompt changed 11-18 to 11-21.
- **Not built:** any internship application, `Main Cover Letter.md`, an `Applied/` folder, any LeetCode row, any blog or LinkedIn note, a scholarship note, any CSCI 4511W `Week - 9`, and any session log entry other than the 11-21 build entry.
## Three-Month Plan Status
The Three-Month Research Engine Master Plan is `status: paused` (per W45) and its file no longer sits at the path the skill names, so nothing on it is scored. The Fall 2026 Plan governs. Its Week-by-Week rows for this window:

| Week of | Planned hard thing | Status |
|---|---|---|
| 2026-11-16 | LinkedIn and blog cadence check: confirm 4 real weekly posts since the plan started | ❌ No blog, LinkedIn or Portfolio post note exists, so there is nothing to count |
| 2026-11-23 | Keep the application floor alive at reduced volume (Thanksgiving 11-26 to 11-29) | ❌ Starts tomorrow with no applications to reduce from |
| 2026-11-30 | Pre-interview cram pass on every LeetCode concept below mastery 7 | ❌ No LeetCode record exists to rank concepts by |

The plan is behind on every count it checks. No review was missed, so the two-missed-reviews re-scope rule does not apply, but `/startday` has not refreshed the Dashboard since 10-26.
## Fall Execution Audit
- ❌ **Internship application floor:** `Tracker/Each One/Current/` holds 29 notes, and `Applied/` and `Result/` do not exist. The newest file in `Current/` was modified 2026-09-26 and the last commit touching `Each One/` is `5abeb5f8` of 2026-09-24, 59 days ago. `Uber` is still in `Current/`. Ninth consecutive review at zero. The 11-21 rebuild was real work on the application system, but it is the application system that moved this week and not an application.
- ❌ **LeetCode/CodePath:** `LeetCode & CodePath.md` was last modified 2026-09-15 and `CSCI 4041/Problems/Weekly Set.md` on 2026-10-23. Neither changed. The 11-20 daily note has `lc_count: 0`.
- ➖ **System Design:** correctly not started, gated behind a LeetCode floor with no record.
- ❌ **Daily floor:** one daily note for the week and it is an empty template. The Daily folder holds nothing for 11-16 to 11-19, 11-21 or today.
- ⚠️ **Classes:** real output on CSCI 4061 (Lab 10, Project 3), 4511W (quiz, Writing 3, Code Review 3), 5304 (Homework 3) and a batch pass on 4521. The 4511W Weekly folder still stops at `Week - 8`. I did not re-read the syllabus for deadlines in the next 7 days, so I cannot say what is due. Unrecorded on any Board since W46: CSCI 4061 Midterm 2, the Lab 7 to 9 uploads and the 4521 HW3 upload.
- ❌ **Projects (TradingView, Portfolio v2, ClaudeKit):** no TradingView note changed and `Claude Kit/Log.md` is unchanged (192 lines, no entry since 2026-09-05). Portfolio shows documentation edits and one dev-error session finding, with no blog post and no shipped artifact I could find.
- ⚠️ **Career pipeline (broader):** `Mentorship Board.md` was last edited 10-28 and the Dashboard footer (line 191) still lists the Jesse outreach deadline of 2026-11-02 as the must-do. Fourth review flagging it. The Dashboard's `today_focus` still reads "Ship the first application: Uber from Current/ to Applied/", set 10-26. The VISAs batch edit touched 30 files, but no ISSS outcome is recorded in any note I opened.
## Enrichment and Drills
No notes enriched this week. Zero notes vault-wide carry `enrichment_status: enriched`. The same five notes carry the only dated `next_drill` values (four in `60_Claude/20_Distilled_Notes/`, one under `TradingView/Research/`), now 197 to 204 days overdue. The restart-or-drop question first asked in W39 is ten reviews old. Nothing was distilled: no changed note in `10_Source_Summaries/`, `20_Distilled_Notes/` or the Source Summary layer, and the 11-21 build session produced no distillation. Enriched-to-date is 0 against the 100-note target, which belonged to the paused plan.
## Vault Health
**Sync state (`gupta-builds`).**
- **Live conflicts:** none. A scan outside `.git/`, `.stversions/` and `50_Archive/` found no `*sync-conflict*` file.
- **Syncthing, unresolved at the end of this run:** `check-syncthing-status.ps1` returned `Overall: NOT IN SYNC` at 14:23 and again at 14:25 with identical numbers: 13,573 local and 13,573 global files, 0 needed locally, 0 errors, and the other laptop at 99.915% completion, needing 23 items and 364,019 bytes. The count did not move in two minutes, so this is not a transient catch-up like W46's. It most likely means the other laptop is asleep, offline or paused and has not pulled the 11-21 batch, but I cannot see that machine, so the cause is unconfirmed. The Dashboard banner `Sync Alert Banner.md` is non-empty (475 bytes, detected 14:23). If it is still there after the other laptop wakes, treat it as a real problem.
- **Git:** branch `master` tracking `origin/master`, no stashes, one tracked file modified and uncommitted (`.obsidian/plugins/obsidian-spaced-repetition/data.json`). `git-auto-sync.log` since the W46 review: 121 nothing to do, 43 success, 4 deferred (Syncthing converging), 83 deferred (git index locked), 1 FAILED. The FAILED run (11-16 11:30) was logged "pull --rebase conflict" but the line above it reads `Could not resolve host: github.com`, a network drop, the same mislabel W43 and W46 found, and the next run at 11:33 was clean. Nothing unresolved: the last run (03:33 today) ended `nothing to do`.
- **New anomaly, index locked:** 83 runs deferred because git's own `index.lock` was held, 1 on 11-17, 66 on 11-18 and 16 on 11-19, none after. W46 had none. The log's own wording blames obsidian-git's background poll, but its settings below are unchanged, so another process held the lock for roughly two days. It stopped on its own. Cause not investigated.
- **Self-heal cache:** `.syncthing-exe-path.txt` exists and names `D:\Apps\syncthing-windows-amd64-v2.1.5\syncthing.exe`, which exists. Leftover stashes: none.
- **Hardcoded-path audit:** clean. No hit for either literal path in `.ps1`, `.vbs`, `.py` or `.json` under `30_Order/System/` or `.claude/`.
- **Ignore-file symmetry:** I did not re-run the `.gitignore` against `.stignore` comparison this week. The `.obsidian/plugins/lean-terminal/data.json` gap W44 to W46 reported (in `.stignore`, tracked by git) is therefore carried, not re-confirmed.
- **Directory-emptiness check:** the files in `claude-workflow/logs/` are the same set as in W46 (`git-auto-sync.log`, `.log.1`, `weekly-review.log`, `internship-note-guard.jsonl`, two `capture-health-*.json`), and `cursor-workflow/logs/` does not exist here. I did not re-read the `(?d)` prefixes, so this is carried from W46.
- **Obsidian-git settings:** `autoSaveInterval: 0`, `refreshSourceControlTimer: 30000`. Stable for a seventh review in a row.
- **Weekly-review task on this machine:** `weekly-review.log` shows the 11-15 run ended `OK exit=0` and today's started at 14:20:55, about eight hours after the 06:00 slot. No `EXCEPTION` since 11-08, so the sign-in lapse that W46 flagged did not recur this week. The late start has now happened twice running.
- **Monthly deep check:** done in W44 (first review of November). The Staggered Versioning and `fsWatcherDelayS` values are due again in December.
- **Stray files, new:** `60_Claude/40_Project_Briefs/Internship/` holds 1,862 files, of which 1,750 were written on 11-21 (mostly 21:44 and 21:45). Their names are code fragments and heading text, for example `.increase_indent().md`, `1. Full test suite_2.md` and `(b) Columbia University SEAS Career Center` followed by `verified live 2026-09-06`, with `_1` suffixes for duplicates, and the one I opened has `graphify/code` tags and a `[[_FrontmatterDumper]]` link to a Python class. That is the output of a code-graph export (graphify) aimed at the wrong folder. 463 of them were already committed in `4f631e66` and `9f115b01`, so they are in git history and syncing to the other laptop, which is a plausible reason Syncthing has 23 items still to move. They sit in a folder that should hold project briefs, they inflate the unmapped count in the order health block below by several hundred notes, and nothing here deletes them, since this is a headless run. A human should find the exporter, fix its output path and remove the files.
**Structure.**
- **Orphans:** by a name-based search (any `[[Name` in a note outside the clippings), 74 of 553 notes in `40_Resources/` and `60_Claude/20_Distilled_Notes/` have no inbound link (W46: 70 of 520). The oldest by file birth time are `MATH 2230` `Answers` and `Practice Quiz - 4`, `HIST 1103` `Assignment - 12`, `CSCI 2041` `Chapter - 5 & 6` and `SAO` `General Program Overview`, all dated 2026-09-19. Approximate: it does not read aliased or path-only links as precisely as Obsidian does.
- **Projects with no `next:`:** 34 of 164 active `type: project` notes under `20_Progress/` (W46: 29 of 153). I did not list them this week.
- **New notes this week with no wikilinks:** four, out of 211 notes with a birth time after the W46 run (clippings and the stray `Internship` briefs excluded): `Run Log.md`, `2026-11-20.md`, `P1 Baseline - Git and Worktree Cleanup (2026-11-21)` and `P1.5a Deterministic PR Gates (2026-11-21)`. The two `Runs/` notes also have no `type` or `status`.
- **Metadata gaps:** the scan finds 2,682 notes with no `type` or `status`, almost all legacy, and four modified this week: `Repetitive Things.md`, the two `Runs/` notes above and `ui-fixes-index.md`. `2026-W47` in `Enumerate/Weekly/` did not exist and this review creates it.
- **Session log gap.** Only one entry exists between the W46 review and this one, the 11-21 build. The course work, the 4521 batch, the VISAs and Portfolio batch edits, the 11-18 to 11-19 index-lock run and the stray-file export produced no log line.
**Log Maintenance (Step 7.5), headless run: flagged, nothing deleted.** This machine's copies; the aggregate summary is in `Log Review.md`.

| Log | Cap | Actual | Content | Action |
|---|---|---|---|---|
| `git-auto-sync.log` | 300 lines | 7,244 lines (635 KB) | 2026-11-05 06:03 to 2026-11-22 03:33. Since the W46 review: 252 completed runs, 121 nothing to do, 43 success, 87 deferred (83 of them index locked), 1 FAILED (a `Could not resolve host` network drop) | Flagged only |
| `git-auto-sync.log.1` | none stated | 43,566 lines | W46 recorded 1,237 lines for this file. I did not read it, so I cannot say why the count moved | Flagged only |
| `cursor-workflow/logs/sweep-*.log` | last 14 days | directory does not exist here | Nothing to trim | None |
| `Sync-Log-Archive-2026-09-19.md` (×2, `.claude_windows`, `.claude_wsl`) | one-time cleanup, should be 0 | 6,991 and 7,966 lines | Unchanged, ninth week flagged | Flagged only |
| `.claude_windows/Sync-Log.md`, `.claude_wsl/Sync-Log.md` | 300 lines | 534 and 3,056 lines | Last written 2026-09-20, silent for nine weeks | Flagged only |

The curated Session Log is 1,909 lines against its 3,000 cap, `Claude Kit/Log.md` is 192, `Run Log.md` is 17 and `Main Log.md` is 15; none needs action. The Log Review registry still describes files deleted on 2026-10-04 and cites the Session Log at 1,441 lines.
**Order health (Step 7.7).**
### Order health (2026-11-22)
Read-only: `node vault-lint.js` and `node vault-lint.js --kit`, plus `30_Order/Note Type Registry.md`. Nothing was fixed.
**Fit:** 322/6233 = 5.2% (target 90%). Below target.
**Kit consistency:** 0 errors, 7 warnings (exit 0).
**Families below 100% fit (65), with the top 3 failure reasons:**

| Family | Fit | Failing | Top reasons |
|---|---|---|---|
| (unmapped) | 0/3340 = 0.0% | 3340 | 6:unmapped (3340), 1:legacy-generated-type:code (1320), 1:legacy-generated-type:document (661) |
| ai-conversation-export | 0/765 = 0.0% | 765 | 5:blank-after-frontmatter (765), 5:extra-blank-lines (765), 5:trailing-blank (681) |
| internship-dossier | 0/354 = 0.0% | 354 | 6:legacy-shape (354), 1:no-type (354), 1:missing-key:type (354) |
| course-concept | 0/221 = 0.0% | 221 | 2:missing-heading:Mechanism (206), 2:missing-heading:Contrast / What It Is Not (206), 2:missing-heading:Failure Modes / Misconceptions (206) |
| dashboard | 7/102 = 6.9% | 95 | 1:missing-key:dashboard_kind (95), 5:extra-blank-lines (85), 1:missing-key:updated (80) |
| repo-card | 0/94 = 0.0% | 94 | 6:legacy-shape (94), 1:missing-key:verdict (94), 5:extra-blank-lines (93) |
| project | 1/92 = 1.1% | 91 | 6:legacy-shape (90), 1:missing-key:project_kind (90), 2:missing-heading:Current State (83) |
| machine-runbook | 1/92 = 1.1% | 91 | 6:legacy-shape (91), 2:missing-heading:Checkpoints (91), 2:missing-heading:Steps (90) |
| reference-resource | 44/126 = 34.9% | 82 | 1:missing-key:area (78), 1:missing-key:reference_kind (74), 6:legacy-shape (67) |
| course-week | 16/94 = 17.0% | 78 | 6:legacy-shape (76), 1:missing-key:class_kind (76), 1:hash-in-tags (65) |
| course-textbook | 22/97 = 22.7% | 75 | 6:legacy-shape (70), 1:missing-key:class_kind (70), 1:hash-in-tags (66) |
| course-homework | 5/57 = 8.8% | 52 | 5:extra-blank-lines (45), 6:legacy-shape (43), 1:missing-key:class_kind (43) |
| source-summary | 0/45 = 0.0% | 45 | 1:kind-off-vocab:input_kind=pdf (28), 2:missing-heading:Full Content (23), 3:dead-frontmatter-links (22) |
| technical-concept | 0/43 = 0.0% | 43 | 2:missing-heading:Mechanism (43), 2:missing-heading:Contrast / What It Is Not (43), 2:missing-heading:Failure Modes / Misconceptions (43) |
| moc | 10/42 = 23.8% | 32 | 2:missing-heading:Purpose (27), 5:extra-blank-lines (26), 2:missing-heading:Map (26) |
| internship-tracker | 0/32 = 0.0% | 32 | 1:no-status (32), 1:missing-key:status (32), 1:missing-key:created (32) |
| tool-setup | 0/32 = 0.0% | 32 | 6:legacy-shape (32), 1:missing-key:reference_kind (32), 2:missing-heading:What's actually here (23) |
| internship-program | 0/31 = 0.0% | 31 | 6:legacy-shape (31), 1:no-type (31), 1:no-status (31) |
| internship-contact | 0/30 = 0.0% | 30 | 1:no-status (30), 1:missing-key:status (30), 1:missing-key:created (30) |
| code-mirror-doc | 0/28 = 0.0% | 28 | 6:legacy-shape (28), 1:status-off-vocab:sprout (28), 1:missing-key:updated (28) |
| daily-note | 2/28 = 7.1% | 26 | 5:extra-blank-lines (24), 6:legacy-shape (23), 1:missing-key:updated (23) |
| clipping | 0/24 = 0.0% | 24 | 1:missing-key:updated (24), 6:legacy-shape (23), 1:no-type (23) |
| project-spec | 7/25 = 28.0% | 18 | 2:missing-heading:Current State (18), 5:extra-blank-lines (5), 2:missing-heading:What This Is (4) |
| course-board | 1/18 = 5.6% | 17 | 6:legacy-shape (16), 1:missing-key:class_kind (16), 1:hash-in-tags (16) |
| agent-prompt | 0/16 = 0.0% | 16 | 2:missing-heading:Implementation Order (12), 2:missing-heading:Report Back (12), 2:missing-heading:Why This Exists (11) |
| distilled | 0/15 = 0.0% | 15 | 6:legacy-shape (14), 1:missing-key:evergreen_kind (14), 2:missing-heading:Core Claim (14) |
| course-project-companion | 2/16 = 12.5% | 14 | 5:extra-blank-lines (12), 6:legacy-shape (11), 1:missing-key:class_kind (11) |
| course-control | 0/13 = 0.0% | 13 | 5:extra-blank-lines (12), 6:legacy-shape (7), 1:missing-key:class_kind (6) |
| course-discussion | 0/13 = 0.0% | 13 | 6:legacy-shape (13), 1:missing-key:class_kind (13), 1:hash-in-tags (13) |
| course-project | 0/12 = 0.0% | 12 | 6:legacy-shape (9), 1:missing-key:class_kind (9), 1:hash-in-tags (9) |
| transcript | 2/13 = 15.4% | 11 | 5:extra-blank-lines (11), 4:wrong-folder (10), 1:missing-key:updated (8) |
| audit-report | 5/13 = 38.5% | 8 | 5:extra-blank-lines (6), 6:legacy-shape (6), 1:missing-key:review_kind (6) |
| periodic-review-note-weekly | 2/9 = 22.2% | 7 | 5:extra-blank-lines (7), 6:legacy-shape (4), 1:missing-key:updated (4) |
| course-subboard | 3/10 = 30.0% | 7 | 6:legacy-shape (7), 1:missing-key:class_kind (7), 2:missing-heading:Purpose (5) |
| capability-review | 2/9 = 22.2% | 7 | 6:legacy-shape (7), 1:missing-key:updated (7), 1:missing-key:review_kind (7) |
| plan | 1/7 = 14.3% | 6 | 1:missing-key:review_cadence (4), 2:missing-heading:Goal (4), 2:missing-heading:Timeframe (4) |
| course-exam-material | 3/9 = 33.3% | 6 | 6:legacy-shape (6), 1:missing-key:class_kind (6), 2:missing-heading:Scope (6) |
| course-track | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:missing-key:class_kind (5), 5:extra-blank-lines (3) |
| project-plan | 10/15 = 66.7% | 5 | 2:missing-heading:Sequence (4), 6:legacy-shape (3), 1:missing-key:project_kind (3) |
| ai-conversation-summary | 0/5 = 0.0% | 5 | 1:missing-key:updated (5), 5:blank-after-frontmatter (5), 5:extra-blank-lines (5) |
| depth-ladder | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| field-os | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| question-bank | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| course-lab | 5/9 = 55.6% | 4 | 6:legacy-shape (4), 1:missing-key:class_kind (4), 1:hash-in-tags (4) |
| course-preparation | 2/6 = 33.3% | 4 | 6:legacy-shape (4), 1:missing-key:class_kind (4), 1:hash-in-tags (4) |
| career-fair | 0/4 = 0.0% | 4 | 1:missing-key:updated (4), 1:empty-key:created (3), 1:bad-date:created (3) |
| system-guide | 8/12 = 66.7% | 4 | 5:extra-blank-lines (3), 3:dead-body-links (2), 4:wrong-folder (2) |
| synthesis | 0/4 = 0.0% | 4 | 6:legacy-shape (4), 1:missing-key:evergreen_kind (4), 2:missing-heading:Core Claim (4) |
| course-textbook-map | 2/5 = 40.0% | 3 | 6:legacy-shape (3), 1:missing-key:class_kind (3), 1:hash-in-tags (3) |
| log | 1/4 = 25.0% | 3 | 6:legacy-shape (2), 5:extra-blank-lines (2), 1:no-frontmatter (1) |
| output-story | 0/3 = 0.0% | 3 | 6:legacy-shape (3), 1:kind-off-vocab:output_kind=interview-story (3), 5:blank-after-frontmatter (2) |
| periodic-review-note-yearly | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:period (2), 1:hash-in-tags (2) |
| identity-note | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:evergreen_kind (2), 5:extra-blank-lines (2) |
| output-one-pager | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:kind-off-vocab:output_kind=project-brief (2), 4:wrong-folder (1) |
| course-audit | 0/2 = 0.0% | 2 | 5:extra-blank-lines (2), 6:legacy-shape (1), 1:missing-key:class_kind (1) |
| ai-review-weekly | 0/2 = 0.0% | 2 | 5:extra-blank-lines (1), 6:legacy-shape (1), 1:missing-key:review_kind (1) |
| internship-loop-review-monthly | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:review_kind (2), 2:missing-heading:Tier Changes (2) |
| internship-loop-review-weekly | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:review_kind (2), 2:missing-heading:Dossiers Written by Tier (2) |
| action | 4/5 = 80.0% | 1 | 3:dead-body-links (1) |
| periodic-review-note-monthly | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:missing-key:period (1), 1:hash-in-tags (1) |
| internship-applying | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:status-off-vocab:Withdrawn (1), 1:missing-key:project_kind (1) |
| prompt-queue | 1/2 = 50.0% | 1 | 5:extra-blank-lines (1) |
| output-bullet | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:kind-off-vocab:output_kind=portfolio-bullet (1), 5:blank-after-frontmatter (1) |
| course-exam | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:status-off-vocab:active (1), 1:missing-key:class_kind (1) |
| graphify-note | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:missing-key:reference_kind (1), 1:missing-key:repo (1) |
**Families with a Spec and no notes (3):** cover-letter, interview-prep, resume-alteration.
**Standards, Templates and Workflows with no row in the Note Type Registry (6):**
- 30_Order/Templates/For Everything.md
- 30_Order/Workflows/Courses/Per Class/CSCI 4061 Workflow.md
- 30_Order/Workflows/Courses/Per Class/CSCI 4511W Workflow.md
- 30_Order/Workflows/Courses/Per Class/CSCI 4521 Workflow.md
- 30_Order/Workflows/Courses/Per Class/CSCI 5304 Workflow.md
- 30_Order/Workflows/Enrichment/Enrichment.md
**Files git cannot add (0):** none.
**Template, Standard and Workflow names in tooling files that no kit file carries (0):** none.
**Proposed, not applied:**
- For the largest gap in a mapped family (ai-conversation-export), run `node 30_Order/System/vault-lint/vault-lint.js --family ai-conversation-export --list 20` and fix the top reason by hand.
- For each family with no notes, confirm the Standard is still needed or that its `match.path` still points at real notes.
- For each file with no registry row, add a row to the Note Type Registry or link it from an existing row.
Fit movement: 5.2% (322/6,233) against W46's 4.5% (256/5,677), a gain of 66 passing notes while the linted set grew by 556, so unlike W46 the rise comes from notes brought to Standard (course-week 5 to 16 passing, course-textbook 10 to 22, dashboard 0 to 7) and not from a shrinking denominator, even though the unmapped count grew from 2,907 to 3,340, a share of which is the stray graphify files. Kit warnings fell from 8 to 7 and registry gaps from 9 to 6.
## Suggested Links
1. Weekend Build should link the Apply Today note and the Tracker's `Applied/` folder in its `next:`, because its stated goal is that Sunday is spent applying and its `next:` still points at Saturday's first block.
2. The 00_Dashboard footer (line 191) should replace the 2026-11-02 Jesse outreach deadline with a link to Meet Your Partner, which holds the real next step. Fourth week flagged.
3. Mentorship Board line 44 should link Meet Your Partner and the Jesse Meeting brief and drop "Not yet sent", because the 10-28 call already happened. Fourth week flagged.
4. The two `Runs/` notes from 11-21 (`P1 Baseline` and `P1.5a Deterministic PR Gates`) should link System - Build Log and Weekend Build, because both have zero outbound links, no `type` and no `status`, and are reachable only by folder.
5. CSCI 4061 Board should link Lab - 10 and the two Project - 3 notes in its `next:`, because it was last edited 10-22 and still points at the Lab 6 deadline.
## Cleanup Candidates
1. **The stray graphify export in `60_Claude/40_Project_Briefs/Internship/`:** 1,750 files written 11-21, 463 already committed. Reason: wrong folder, code-graph nodes and not briefs, duplicates with `_1` and `_2` suffixes, and they depress the order fit and the unmapped count. Find the exporter and its output path first, then remove them and the matching git history only with a human present.
2. **`10_Areas/Life/Enumerate/Daily/2026-11-20.md`, with `2026-10-12.md`, `2026-10-18.md`, `2026-10-26.md` and `2026-11-04.md`:** five stub dailies. The 11-20 one still has a literal `<% tp.date.now %>` in `created`, so the Templater run never executed. Anything that checks for a note by filename counts them as days that happened. Delete or fill.
3. **`Sync-Log-Archive-2026-09-19.md` (two files under `20_Progress/AI/Claude Code/.claude_windows` and `.claude_wsl`):** flagged every review since 2026-09-20, now nine weeks. Needs an interactive session to run Step 7.5 point 4 (summarize, then delete).
4. **Log Review registry rows for the 10 per-project `Sync-Log.md` files and the combined log:** still describe files deleted on 2026-10-04, with no row for the two surviving `.claude_*` Sync-Logs, and the Session Log row still cites 1,441 lines. A human should retire or rewrite them.
## Promotion Candidates
None this week. Five `status: tree` notes changed in the past 7 days: the two `Prompts - Archive` notes and `Source of Truth` under `Building System`, `APAS` under `UMN/The Plan`, and the Weekly Synthesis Index. The archives and the index fail the stability bar (an archive is not reusable knowledge and an index is not distilled), `Source of Truth` is a live internal system record that the rebuild is still rewriting, and `APAS` was a one-minute batch touch on 11-19 that I did not read.
## Next Week Priorities
Priority: Send the Uber application. Why now: it is the plan's One Thing, `Weekend Build.md` set Sunday as the apply day, and the tracker has been frozen 59 days with the apply machinery now rebuilt. Output: an `Applied/` folder exists with the Uber note moved into it, sent on the existing `Main Resume.md` with a letter for that one company, and a row in `Apply Today.md` while it is in flight.
Priority: Open and close one real daily note, and fix what the 11-20 stub shows. Why now: the only daily note this week is an unrendered template, so `/closeday` and the Dashboard count nothing, and `today_focus` has said "Uber" since 10-26. Output: `2026-11-23.md` created from the template with the Templater fields rendered, closed with honest toggles, the Dashboard focus lines refreshed, and the Jesse deadline in the footer replaced.
Priority: Find and stop the graphify export, and settle why the other laptop is 23 items behind. Why now: 1,750 stray files are syncing and committing, the order fit is being measured against them, and Syncthing reads NOT IN SYNC with no change in two minutes. Output: the exporter's output path fixed, the stray files removed in a session with a human, and `check-syncthing-status.ps1` returning `IN SYNC`.
**Also due:** the Thanksgiving floor pause 11-26 to 11-29, the CSCI 4511W `Week - 9` and `Week - 10` notes, the Weekend Build's own step 2 (diagnosing the failed `run` workflow), and the November monthly review note (`60_Claude/30_Reviews/Monthly/` holds only June).
## Open Questions
1. **Is the system the work, or is it standing between you and the application?** Nine reviews of the same frozen number, and the one week that moved a lot of files moved the tooling. `Weekend Build.md` bet that a ranked queue and a classified letter per application would make Sunday an apply day. It is Sunday and the queue and `Apply Today.md` are empty. The answer decides whether next week schedules more build or sets a cap on it.
2. **Which LeetCode tracker is canonical?** Fifth sighting (W43 to W46, now). `/closeday` reads one file that is empty, and the one with content has 0 of 20 boxes checked and sits in a course folder. By the weekly rule a question seen twice in a row is an immediate action: pick one and archive the other.
3. **Should the Dell's git state be reset?** W45 raised it: its branch tracked a deleted upstream, was 1,217 commits ahead and had 925 dirty paths. I cannot see the Dell from here, so this is carried, not re-checked, and the Syncthing lag above may be related.
*Generated by /weekly-review, headless run via the Jarvis-WeeklyReview scheduled task on `gupta-builds`, no human present.*
