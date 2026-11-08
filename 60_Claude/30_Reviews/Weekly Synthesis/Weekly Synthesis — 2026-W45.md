---
type: review
status: complete
created: 2026-11-08
updated: 2026-11-08
review_kind: capability
week: 2026-W45
tags:
  - review
  - weekly
notes:
  - "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index]]"
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan]]"
  - "[[10_Areas/Life/Enumerate/Weekly/2026-W45]]"
---
# Weekly Synthesis: 2026-W45
**Headless run on the Dell.** Fired by the `Jarvis-WeeklyReview` scheduled task at 06:00:00 with no human present, the first real run after the 2026-11-05 local-start fix. Step 7.5 is flag-only: nothing was deleted from any log. The Dell's git writer is disabled (Failure Mode 20) and its branch is frozen at 2026-10-22, so every activity claim below comes from file modification times and note frontmatter, not from commits. No W45 note, Index row or log entry had synced in from the Acer by 06:13, so this run wrote the review.
The week was a coursework and paperwork week that left the one number the Fall plan exists to move exactly where it was: the internship tracker is still 29/0/0 (seventh review at zero applications, 45 days since the last commit touching `Current/`), and the week again has exactly one daily note, an unfilled stub.
## What Was Built
Checked against file contents and frontmatter, not against what the notes claim.
- **Coursework.**
  - CSCI 4061: new `Lab - 8` (144 lines, status sprout, local autograder 1.0/1.0 per its `next:`), `Project - 3 Assignment` (566 lines) and `Project - 3 Quiz` (346 lines), both `status: seed` with an empty `next:`. The upload of `lab08-code.zip` was due 11-04 and no note records it. The 4061 Board was last updated 2026-10-22 and its `next:` still names the Lab 6 deadline of 10-21. The Weekly folder stops at `Week - 4`, so the Weeks 5 to 8 notes the W44 plan asked for do not exist.
  - CSCI 4511W: new `Week - 8` (124 lines) and `Problem Set - 3` (95 lines, `next:` says to write the PDF, submit `ps3.py` and book the TA code review within 10 days). There is no `Week - 9`. The Board was last updated 10-14 and still points at Long Quiz 1.
  - MGMT 3015: a seven-minute batch on 11-04 (02:43 to 02:49) wrote `Weekly/Week - 5` and edited Weeks 1 to 4, `Textbook/Chapter - 1 & 2`, `Chapter - 3 & 4`, `Chapter - 8`, `Textbook Map`, `Preparation`, `Weekly Board` and the Board. Its `next:` is Week 6 once the Chapter 6 note lands.
  - TIP103: `Unit - 8 Problems Transcript` landed 11-03 (287 lines, no wikilinks, empty `next:`).
  - CSCI 4521 and CSCI 5304: nothing under either folder changed. The 4521 Board was last touched 10-30 and has no `Homework - 3` (due Tue 11-03) or `Week - 8` note. The 5304 Board was last touched 10-22.
- **Mentorship.** `Jesse - Conversation Guide` was written and `Meet Your Partner` edited at 18:50 on 11-04, before the 7 pm event. Its `next:` still reads "Attend the event tonight", so nothing records whether the event happened or what Jesse said. `Mentorship Board.md` (last edited 10-28) still says "Not yet sent" on line 44, and `00_Dashboard.md` (last edited 10-26) still lists "send the Jesse outreach email, deadline 2026-11-02" as the current must-do. Both were flagged in W44 and neither moved.
- **Work authorization.** Eleven notes under `10_Areas/Career/VISAs & Work Auth/` were written or edited 11-05 to 11-07, including a new `ISSS November Meeting Prep`. `VISA Plan` carries the actions: send the ISSS email by Mon 11-09, book the meeting for the week of 11-09, and send applications now. The Fall plan's 11-05 entry makes the same point, that authorization is needed at acceptance and gates nothing before an application.
- **Internship system.** `Resume & Cover Letter - System Map` was edited 11-07 21:37; its `next:` says the one blocker is rebuilding `Main Resume.md` into evidence-tagged bullets. `Main Resume.md` exists under `20_Progress/Internship/Resumes/`. `Main Cover Letter.md` does not exist anywhere under `10_Areas/Career/` or `20_Progress/Internship/`.
- **Vault standards and tooling.** The session log has entries for 11-05 (system layer repair pass), 11-06 (Standards research) and 11-07 (55 Standards rewritten to one anatomy, 3 removed, `vault-lint.js` word caps changed). The files agree: 55 Standards plus Templates and Workflows were modified, and `Jarvis Order Rebuild Design` and `Vault Lint` are new or edited.
- **Conversation layer.** `Conversation Loop Design`, `Conversation Loop Build Plan`, `Conversation Layer` and the design postmortem were edited 11-05 to 11-07. These are documents; the log's 10-22 note that the exporter's token and cost fix covers only part of build B1 still stands.
- **Bulk edits, content not checked.** Single-minute sweeps touched several unrelated notes: 21:37 on 11-07 (`Claude Kit/Log.md`, `Humanizer`, `tailoring-application` SKILL, `internship-research-loop`, `Conversation Layer Logs`, `Log Review`), 20:46 on 11-05 (six `Capability` notes, `Plugins`, `Claude Optimization Master Setup`) and 20:40 on 11-07 (the CSCI 2021 and 2011 Previous Classes notes and the `Prompts - Acer` files). They count as modified, not as work.
Not built this week: any internship application, `Main Cover Letter.md`, any LeetCode or `Weekly Set.md` row, any note under `Portfolio`, `TradingView` or `Hackathon`, and any entry in `Claude Kit/Log.md` (its last dated entry is still 2026-09-05).
## Three-Month Plan Status
The Three-Month Research Engine Master Plan is `status: paused` (updated 2026-11-05), so nothing on it is scored. The Fall 2026 Plan governs. Its Week-by-Week rows for this window:

| Week of | Planned hard thing | Status |
|---|---|---|
| 2026-10-26 | Second mentor: first real contact | ✅ Call held 10-28 |
| 2026-11-02 | Networking push, log a real running count | ⚠️ `Networking Strategies.md` is 0 bytes. Meet Your Partner was scheduled 11-04 with no outcome recorded |
| 2026-11-09 | Scholarship shortlist built, first 2 applications submitted | ❌ No scholarship note exists anywhere under `10_Areas/` or `20_Progress/`. Starts tomorrow |
The plan is behind on every count it checks (applications, LeetCode, daily floor) and on track only for the mentor row. The blocker named in W44 has changed shape: the cover letter is still missing, but the System Map now puts the root one step earlier, in the unfinished evidence tagging of the resume. No review was missed (W42 to W45 all ran), so the two-missed-reviews re-scope rule does not apply.
## Fall Execution Audit
- ❌ **Internship application floor:** `Tracker/Each One/Current/` holds 29 notes. `Applied/` and `Result/` do not exist as folders. The newest note in `Current/` was modified 2026-09-26, and the last commit touching it is `5abeb5f87` of 2026-09-24, 45 days ago. Seventh consecutive review at zero applications.
- ❌ **LeetCode/CodePath:** `LeetCode & CodePath.md` was last modified 2026-09-15 and its Daily Log has no solved-count rows. `Weekly Set.md` (last edited 10-23) has 0 boxes checked and 20 unchecked. The 11-04 daily note has `lc_count: 0`. What exists is the TIP103 Unit 8 transcript, which is course material, not logged practice.
- ➖ **System Design:** correctly not started, gated behind a LeetCode floor with no record.
- ❌ **Daily floor:** the Daily folder holds `2026-11-04.md` as the only note for the week, an unfilled template (all toggles false, `lc_count: 0`, `day_state: planned`) whose `updated:` still holds an unrendered Templater expression. Nothing exists for 11-02, 11-03 or 11-05 to 11-08. The folder now holds four such stubs (10-12, 10-18, 10-26, 11-04).
- ⚠️ **Classes:** real output on CSCI 4061, 4511W and MGMT 3015, none on 5304 and 4521. The `Fall'26 Syllabus` Grading Criteria section is filled in (Midterm Exam 2, Thu 11-12, is listed at 15%). Unconfirmed from the vault: the Lab 7, Lab 8 and Project 2 uploads, the 4521 HW3 (due 11-03) and the MGMT 3015 pitch slides (11-04). The four assessment outcomes W43 listed (5304 midterm, 4521 Quiz 3, 4511W Long Quiz 1, 4061 Midterm 1) are still unrecorded on any Board. Next 7 days: CSCI 4061 Midterm 2 (Thu 11-12), the ISSS email and the OPT fee comment close (Mon 11-09).
- ❌ **Projects (TradingView, Portfolio v2, ClaudeKit):** no TradingView or Portfolio note was modified. `Claude Kit/Log.md` was in a bulk edit but its last dated entry is 2026-09-05.
- ⚠️ **Career pipeline (broader):** the one real outreach event is the Jesse relationship, plus the large work-authorization pass. `Networking Strategies.md` is empty, `Hackathons.md` was last edited 2026-07-29, and no scholarship tracker exists.
## Enrichment and Drills
Zero notes vault-wide carry `enrichment_status: enriched`. The same five notes carry the only dated `next_drill` values, four in `60_Claude/20_Distilled_Notes/` (Mentorship and Networking, Index Fund Investing, Career Strategy, AI-Assisted Trading) and `TradingView/Research/Trading Tools and Platforms.md`. They are now 183 to 190 days overdue (due 2026-05-02 and 2026-05-09). Nothing was drilled or enriched this week. The restart-or-drop question first asked in W39 is eight reviews old.
## Vault Health
**Sync state (Dell).**
- **Live conflicts:** none. A scan of the whole vault outside `.git/`, `.stversions/` and `50_Archive/` found no `*sync-conflict*` file. `Sync Alert Banner.md` was 0 bytes at 06:01, so no banner is showing.
- **Syncthing:** `check-syncthing-status.ps1` returned `Overall: IN SYNC`. Folder `jarvis` read 12,918 local and 12,918 global files, 0 needed, 0 errors, 100% completion against the Acer, and the folder state was `scanning` at that moment. It printed "Port 8384 is not listed as LISTENING right now, but the API answers and Syncthing is running; treating it as running", which is the 11-05 socket-flap fix working on this machine. This closes W44's Dell item: `.sync-alert-state.json` reads `consecutiveFailures: 0` (it read 625 on 11-01) and the check no longer reports a false outage.
- **Task states (Dell):** `Jarvis-GitAutoSync` Disabled (last run 2026-10-22 22:18, result 1), `Jarvis-Syncthing-Health` Running (6:00 run, in progress at the time of the query), `Jarvis-Cursor-Session-Export` Ready (last run 05:50, result 0), `Jarvis-WeeklyReview` Running (this run, started 06:00:00). `weekly-review.log` shows the last three runs ended `OK exit=0`. The 10-25 SessionEnd hook exception from W44 does not recur in the log tail.
- **Dell git state:** branch `infra/cross-laptop-sync`, 1,217 commits ahead of `origin/master`, 925 paths different from HEAD, no stashes. That is the frozen-branch state Failure Mode 20 accepted; the Acer deleted this branch locally and on GitHub on 11-05, so the Dell's copy now tracks nothing live. The 11-05 log entry's warning stands: the Dell must not pull the untracking commit before its AI Conversations folder is copied aside. I did not touch git.
- **Acer git, not verifiable here:** I cannot read the Acer's `git-auto-sync.log`, so the 11-05 changes (1 MB cap, `FAILED` on reserved file names) and last week's 0/0 state are carried from the log, not re-checked. The first Acer session that reads that log should confirm the new error lines are sane.
- **Hardcoded-path audit:** clean. No hit for `D:\_Anant\20_Progress` or `D:\Users\_Anant\10_Areas\Documents\Jarvis` in `.ps1`, `.vbs`, `.py` or `.json` under `30_Order/System/`. Under `.claude/` the only hit is a Bash permission-allow rule in `settings.local.json` line 5, not a script.
- **Ignore-file symmetry: two gaps, neither edited.**
  - `.obsidian/plugins/lean-terminal/data.json` is in `.stignore` (line 51, `(?d)`) but not in `.gitignore`, and `git ls-files` still lists it as tracked in the Dell's HEAD. Second sighting after W44. The fix is a `.gitignore` line plus `git rm --cached`, which touches `.obsidian/` and tracked state, so it stays for a human.
  - The Dell's `.stignore` was last modified 2026-10-22 22:18 and lacks the `git-auto-sync.log.1` and `.log.tmp` lines that `.gitignore` gained on 11-05 (lines 103 and 104). Syncthing never carries `.stignore`, and git no longer reaches the Dell, so it will not catch up on its own. Latent while the Dell's git task is Disabled; whoever re-enables it must bring `.stignore` current first.
- **Directory-emptiness check:** every file in `claude-workflow/logs/` (`git-auto-sync.log`, `internship-note-guard.jsonl`, `weekly-review.log`, `capture-health-*.json`) and `cursor-workflow/logs/*.log` is covered by a `(?d)` pattern. No deadlock risk.
- **Obsidian-git settings:** `autoSaveInterval: 0` and `refreshSourceControlTimer: 30000`. Stable for a fifth review in a row.
- **Self-heal cache:** `.syncthing-exe-path.txt` exists, was rewritten at 06:06 by this run's status check, and names `D:\Apps\Syncthing\syncthing-windows-amd64-v2.1.5\syncthing-windows-amd64-v2.1.5\syncthing.exe`, which exists. Leftover stashes: none.
- **Monthly deep check:** W44 was the first review of November and did it, so it is not repeated here. The Staggered Versioning and `fsWatcherDelayS` values were never read (they sit behind the API key) and are due again in December.
**Structure.**
- **Orphans:** the six `20_Distilled_Notes` orphans named in W44 still show no `[[Name` inbound link in a text search of `60_Claude/`. I did not re-run the vault-wide search.
- **Projects with no `next:`:** not recounted. W44 found 30, including `Portfolio.md`, a named Fall 2026 Systems-table project. New this week: `Project - 3 Assignment` and `Project - 3 Quiz` (`status: seed`, empty `next:`) and the `Unit - 8 Problems Transcript`.
- **New notes this week with no wikilinks:** `Unit - 8 Problems Transcript`, the `2026-11-04` daily stub and the generated `Jarvis Ops Report - 2026-11-04`.
- **Metadata gaps:** the `2026-11-04` daily note's `updated:` holds raw template text, and `2026-W45` and `2026-W46` in `Enumerate/Weekly/` were created 11-04 02:14 from templates with empty `week:`, `review:` and `next:` fields. Every other note created this week has a `type:`.
- **Session log gap.** The log has entries for 11-01, 11-05, 11-06 and 11-07, all system work. Nothing is logged for the 11-02 to 11-04 coursework, the MGMT 3015 batch, the Jesse event or the work-authorization pass (11-05 to 11-07).
**Log Maintenance (Step 7.5), headless run: flagged, nothing deleted.** The Dell's copies are per-machine and differ from the Acer's. The aggregate summary is in `Log Review.md`.

| Log (Dell copy) | Cap | Actual | Content | Action |
|---|---|---|---|---|
| `git-auto-sync.log` | 300 lines | 91,421 lines (9.4 MB) | 2026-09-20 14:03 to 2026-10-22 22:18, then frozen when the task was disabled. 1,602 runs: 516 nothing to do, 437 FAILED (plus 3 needing manual attention and 1 autostash-pop), 354 success, 291 deferred. The last run ended `FAILED, pull --rebase conflict` | Flagged only |
| `cursor-workflow/logs/sweep-*.log` | last 14 days | 34 files (10-06 to 11-08), 20 over the cap | 1,162 clean exits and 77 runs that exited 101 because `C:\Python313\python.exe` could not be found (2026-10-13 02:05 to 10-14 09:05; first clean exit 22:35). No sweep has written an export since 10-06 | Flagged only |
| `Sync-Log-Archive-2026-09-19.md` (×2, `.claude_windows`, `.claude_wsl`) | one-time cleanup, should be 0 | 6,991 and 7,966 lines | Unchanged | Flagged only |
| `.claude_windows/Sync-Log.md`, `.claude_wsl/Sync-Log.md` | 300 lines | 687 and 3,164 lines | Neither file changed since 2026-09-21 | Flagged only |
The Sync-Log counts match W42's, not the 534 and 3,056 that W43 and W44 reported; the files have not been written since 09-21, so the difference is how lines were counted, not content. The curated Session Log is 1,899 lines against its 3,000 cap and `Claude Kit/Log.md` is 192 lines against 3,000; neither needs action. The Log Review registry still describes files deleted on 2026-10-04 and has no row for the two surviving `.claude_*` Sync-Logs.
**Order health (Step 7.7).**
### Order health (2026-11-08)
Read-only: `node vault-lint.js` and `node vault-lint.js --kit`, plus `30_Order/Note Type Registry.md`. Nothing was fixed.
**Fit:** 253/6094 = 4.2% (target 90%). Below target.
**Kit consistency:** 0 errors, 8 warnings (exit 0).
**Families below 100% fit (67), with the top 3 failure reasons:**

| Family | Fit | Failing | Top reasons |
|---|---|---|---|
| (unmapped) | 0/3352 = 0.0% | 3352 | 6:unmapped (3352), 1:legacy-generated-type:code (1215), 5:extra-blank-lines (709) |
| ai-conversation-export | 0/700 = 0.0% | 700 | 5:blank-after-frontmatter (700), 5:extra-blank-lines (700), 5:trailing-blank (622) |
| internship-dossier | 0/354 = 0.0% | 354 | 6:legacy-shape (354), 1:no-type (354), 1:missing-key:type (354) |
| course-concept | 0/200 = 0.0% | 200 | 2:missing-heading:Mechanism (185), 2:missing-heading:Contrast / What It Is Not (185), 2:missing-heading:Failure Modes / Misconceptions (185) |
| dashboard | 0/96 = 0.0% | 96 | 1:missing-key:dashboard_kind (96), 5:extra-blank-lines (83), 1:missing-key:updated (80) |
| repo-card | 0/94 = 0.0% | 94 | 6:legacy-shape (94), 1:missing-key:verdict (94), 5:extra-blank-lines (93) |
| project | 1/91 = 1.1% | 90 | 6:legacy-shape (89), 1:missing-key:project_kind (89), 2:missing-heading:Current State (82) |
| machine-runbook | 1/91 = 1.1% | 90 | 6:legacy-shape (90), 2:missing-heading:Checkpoints (90), 2:missing-heading:Steps (89) |
| course-week | 5/90 = 5.6% | 85 | 6:legacy-shape (78), 1:missing-key:class_kind (78), 1:hash-in-tags (67) |
| reference-resource | 35/118 = 29.7% | 83 | 1:missing-key:area (80), 1:missing-key:reference_kind (76), 6:legacy-shape (67) |
| course-textbook | 10/86 = 11.6% | 76 | 6:legacy-shape (72), 1:missing-key:class_kind (72), 1:hash-in-tags (68) |
| course-homework | 2/50 = 4.0% | 48 | 6:legacy-shape (44), 1:missing-key:class_kind (44), 5:extra-blank-lines (41) |
| source-summary | 0/45 = 0.0% | 45 | 1:kind-off-vocab:input_kind=pdf (28), 2:missing-heading:Full Content (23), 3:dead-frontmatter-links (22) |
| technical-concept | 0/43 = 0.0% | 43 | 2:missing-heading:Mechanism (43), 2:missing-heading:Contrast / What It Is Not (43), 2:missing-heading:Failure Modes / Misconceptions (43) |
| moc | 7/42 = 16.7% | 35 | 2:missing-heading:Purpose (31), 2:missing-heading:Map (30), 5:extra-blank-lines (27) |
| internship-tracker | 0/32 = 0.0% | 32 | 1:no-status (32), 1:missing-key:status (32), 1:missing-key:created (32) |
| tool-setup | 0/32 = 0.0% | 32 | 6:legacy-shape (32), 1:missing-key:reference_kind (32), 2:missing-heading:What's actually here (23) |
| internship-program | 0/31 = 0.0% | 31 | 6:legacy-shape (31), 1:no-type (31), 1:no-status (31) |
| internship-contact | 0/30 = 0.0% | 30 | 1:no-status (30), 1:missing-key:status (30), 1:missing-key:created (30) |
| code-mirror-doc | 0/28 = 0.0% | 28 | 6:legacy-shape (28), 1:status-off-vocab:sprout (28), 1:missing-key:updated (28) |
| daily-note | 2/26 = 7.7% | 24 | 6:legacy-shape (23), 1:missing-key:updated (23), 1:missing-key:day_state (23) |
| clipping | 0/24 = 0.0% | 24 | 1:missing-key:updated (24), 6:legacy-shape (23), 1:no-type (23) |
| course-board | 1/18 = 5.6% | 17 | 6:legacy-shape (17), 1:missing-key:class_kind (17), 1:hash-in-tags (17) |
| project-spec | 6/23 = 26.1% | 17 | 2:missing-heading:Current State (17), 5:extra-blank-lines (4), 6:legacy-shape (3) |
| agent-prompt | 0/16 = 0.0% | 16 | 2:missing-heading:Implementation Order (12), 2:missing-heading:Report Back (12), 2:missing-heading:Why This Exists (11) |
| distilled | 0/15 = 0.0% | 15 | 6:legacy-shape (14), 1:missing-key:evergreen_kind (14), 2:missing-heading:Core Claim (14) |
| course-project-companion | 0/13 = 0.0% | 13 | 6:legacy-shape (11), 1:missing-key:class_kind (11), 1:missing-key:project_role (11) |
| course-discussion | 0/13 = 0.0% | 13 | 6:legacy-shape (13), 1:missing-key:class_kind (13), 1:hash-in-tags (13) |
| course-project | 0/12 = 0.0% | 12 | 6:legacy-shape (9), 1:missing-key:class_kind (9), 1:hash-in-tags (9) |
| transcript | 2/12 = 16.7% | 10 | 5:extra-blank-lines (10), 4:wrong-folder (9), 1:missing-key:updated (8) |
| course-control | 0/9 = 0.0% | 9 | 6:legacy-shape (8), 5:extra-blank-lines (8), 1:missing-key:class_kind (7) |
| periodic-review-note-weekly | 1/9 = 11.1% | 8 | 5:extra-blank-lines (7), 6:legacy-shape (5), 1:missing-key:period (5) |
| course-subboard | 1/9 = 11.1% | 8 | 6:legacy-shape (7), 1:missing-key:class_kind (7), 2:missing-heading:Purpose (5) |
| audit-report | 5/13 = 38.5% | 8 | 5:extra-blank-lines (6), 6:legacy-shape (6), 1:missing-key:review_kind (6) |
| capability-review | 0/7 = 0.0% | 7 | 6:legacy-shape (7), 1:missing-key:updated (7), 1:missing-key:review_kind (7) |
| course-exam-material | 0/6 = 0.0% | 6 | 6:legacy-shape (6), 1:missing-key:class_kind (6), 2:missing-heading:Scope (6) |
| plan | 1/6 = 16.7% | 5 | 1:missing-key:review_cadence (4), 2:missing-heading:Goal (4), 2:missing-heading:Timeframe (4) |
| course-preparation | 1/6 = 16.7% | 5 | 6:legacy-shape (5), 1:missing-key:class_kind (5), 1:hash-in-tags (5) |
| course-track | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:missing-key:class_kind (5), 5:extra-blank-lines (3) |
| project-plan | 7/12 = 58.3% | 5 | 2:missing-heading:Sequence (5), 6:legacy-shape (4), 1:missing-key:project_kind (4) |
| ai-conversation-summary | 0/5 = 0.0% | 5 | 1:missing-key:updated (5), 5:blank-after-frontmatter (5), 5:extra-blank-lines (5) |
| depth-ladder | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| field-os | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| question-bank | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| course-lab | 3/7 = 42.9% | 4 | 6:legacy-shape (4), 1:missing-key:class_kind (4), 1:hash-in-tags (4) |
| career-fair | 0/4 = 0.0% | 4 | 1:missing-key:updated (4), 1:empty-key:created (3), 1:bad-date:created (3) |
| system-guide | 8/12 = 66.7% | 4 | 5:extra-blank-lines (3), 3:dead-body-links (2), 4:wrong-folder (2) |
| synthesis | 0/4 = 0.0% | 4 | 6:legacy-shape (4), 1:missing-key:evergreen_kind (4), 2:missing-heading:Core Claim (4) |
| course-textbook-map | 2/5 = 40.0% | 3 | 6:legacy-shape (3), 1:missing-key:class_kind (3), 1:hash-in-tags (3) |
| log | 1/4 = 25.0% | 3 | 6:legacy-shape (2), 5:extra-blank-lines (2), 1:no-frontmatter (1) |
| output-story | 0/3 = 0.0% | 3 | 6:legacy-shape (3), 1:kind-off-vocab:output_kind=interview-story (3), 5:blank-after-frontmatter (2) |
| intake-log | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:no-frontmatter (2), 5:extra-blank-lines (1) |
| periodic-review-note-yearly | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:period (2), 1:hash-in-tags (2) |
| identity-note | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:evergreen_kind (2), 5:extra-blank-lines (2) |
| output-one-pager | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:kind-off-vocab:output_kind=project-brief (2), 4:wrong-folder (1) |
| prompt-queue | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:project_kind (2), 1:missing-key:prompt_shape (2) |
| course-audit | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:class_kind (2), 2:missing-heading:Requirements (2) |
| ai-review-weekly | 0/2 = 0.0% | 2 | 5:extra-blank-lines (1), 6:legacy-shape (1), 1:missing-key:review_kind (1) |
| internship-loop-review-monthly | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:review_kind (2), 2:missing-heading:Deadline Sweep Reconciliation (2) |
| internship-loop-review-weekly | 0/2 = 0.0% | 2 | 6:legacy-shape (2), 1:missing-key:review_kind (2), 2:missing-heading:Deadline Sweep Citation (2) |
| action | 4/5 = 80.0% | 1 | 3:dead-body-links (1) |
| deadline-tracker | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:no-frontmatter (1), 3:dead-body-links (1) |
| periodic-review-note-monthly | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:missing-key:period (1), 1:hash-in-tags (1) |
| internship-applying | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:status-off-vocab:Withdrawn (1), 1:missing-key:project_kind (1) |
| output-bullet | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:kind-off-vocab:output_kind=portfolio-bullet (1), 5:blank-after-frontmatter (1) |
| course-exam | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:status-off-vocab:active (1), 1:missing-key:class_kind (1) |
| graphify-note | 0/1 = 0.0% | 1 | 6:legacy-shape (1), 1:missing-key:reference_kind (1), 1:missing-key:repo (1) |
**Families with a Spec and no notes (3):** cover-letter, interview-prep, resume-alteration.
**Standards, Templates and Workflows with no row in the Note Type Registry (9):**
- 30_Order/Templates/Career/Tracking/Internship Postings Log Template.md
- 30_Order/Templates/For Everything.md
- 30_Order/Workflows/Courses/Per Class/CSCI 4061 Workflow.md
- 30_Order/Workflows/Courses/Per Class/CSCI 4511W Workflow.md
- 30_Order/Workflows/Courses/Per Class/CSCI 4521 Workflow.md
- 30_Order/Workflows/Courses/Per Class/CSCI 5304 Workflow.md
- 30_Order/Workflows/Enrichment/Enrichment.md
- 30_Order/Workflows/Internship/Application Document Preparation 1.md
- 30_Order/Workflows/Internship/Internship - Design Rationale.md
**Files git cannot add (76):**
- 20_Progress/AI/Claude Code/.claude_windows/skills/synced/9f8878c6-5e85-4313-8450-e158b8949926_a3ddc74f-5d7e-42cc-b2f0-e2fdb16f754d/docx/scripts/office/schemas/ISO-IEC29500-4_2016/shared-documentPropertiesVariantTypes.xsd: path is 262 characters (limit 259 without long-path support)
- 20_Progress/AI/Claude Code/.claude_windows/skills/synced/9f8878c6-5e85-4313-8450-e158b8949926_a3ddc74f-5d7e-42cc-b2f0-e2fdb16f754d/pptx/scripts/office/schemas/ISO-IEC29500-4_2016/shared-documentPropertiesVariantTypes.xsd: path is 262 characters (limit 259 without long-path support)
- 20_Progress/AI/Claude Code/.claude_windows/skills/synced/9f8878c6-5e85-4313-8450-e158b8949926_a3ddc74f-5d7e-42cc-b2f0-e2fdb16f754d/xlsx/scripts/office/schemas/ISO-IEC29500-4_2016/shared-documentPropertiesVariantTypes.xsd: path is 262 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/extensions/ms-python.python-2025.6.1-win32-x64/python_files/lib/jedilsp/jedi/third_party/django-stubs/django-stubs/contrib/contenttypes/management/commands/remove_stale_contenttypes.pyi: path is 265 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/extensions/ms-python.python-2025.6.1-win32-x64/python_files/lib/jedilsp/jedi/third_party/typeshed/third_party/2and3/requests/packages/urllib3/packages/ssl_match_hostname/_implementation.pyi: path is 269 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/extensions/ms-python.python-2025.6.1-win32-x64/python_files/lib/jedilsp/jedi/third_party/typeshed/third_party/2and3/requests/packages/urllib3/packages/ssl_match_hostname/__init__.pyi: path is 262 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/d-Users-Anant-10-Areas-Documents-Jarvis/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_8e877291f8bd94a95566335cb4ad3f93_images_Screenshot_2026-05-28_172648-15e933ba-b04e-4ae1-bc9e-7b26f6fd299e.png: path is 311 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/d-Users-Anant-10-Areas-Documents-Jarvis/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_empty-window_images_image-3bee0106-c757-4218-bd3d-709954d71eca.png: path is 268 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/d-Users-Anant-10-Areas-Documents-Jarvis/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_empty-window_images_image-4782abd6-708a-43f0-8c78-7d631c09aada.png: path is 268 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/d-Users-Anant-10-Areas-Documents-Jarvis/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_empty-window_images_image-5d24a1a5-47d6-44df-9f20-4731f75f9ca2.png: path is 268 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/d-Users-Anant-10-Areas-Documents-Jarvis/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_empty-window_images_image-78546a13-d9c0-4999-9ac0-de214b897fdb.png: path is 268 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/d-Users-Anant-10-Areas-Documents-Jarvis/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_empty-window_images_image-a8172777-b84e-4485-b3cf-6856d3d6ded9.png: path is 268 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/d-Users-Anant-10-Areas-Documents-Jarvis/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_empty-window_images_image-acbc6a77-dfee-4281-b492-644c1d09c88f.png: path is 268 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_windows/projects/wsl-Ubuntu-home-anant-gupta-projects-hackathon-opspilot/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_0285a46fc91d1f76c6729e937340a451_images_image-eabda812-15b8-45fe-8ed8-551fb57f36c6.png: path is 304 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_wsl/projects/home-anant-gupta-projects/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_69991f8fff76fc7b5295823d5cd41d42_images_image-43de728c-cbd7-493b-857e-80bc9570fdd3.png: path is 270 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_wsl/projects/home-anant-gupta-projects/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_69991f8fff76fc7b5295823d5cd41d42_images_image-5757f523-11d0-4f92-b544-4a1dc8d5c19f.png: path is 270 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_wsl/projects/home-anant-gupta-projects-hackathon-opspilot/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_5aa5417c9ede2f8d2a719334cd66da6a_images_image-043649cb-86f6-4039-b790-627ed4c482c4.png: path is 289 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_wsl/projects/home-anant-gupta-projects-hackathon-opspilot/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_5aa5417c9ede2f8d2a719334cd66da6a_images_image-04a875b2-d668-4a81-8e72-8720416a6879.png: path is 289 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_wsl/projects/home-anant-gupta-projects-hackathon-opspilot/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_5aa5417c9ede2f8d2a719334cd66da6a_images_image-07440d59-bae9-4166-8f04-abe9bc49ab99.png: path is 289 characters (limit 259 without long-path support)
- 20_Progress/AI/Cursor/.cursor_wsl/projects/home-anant-gupta-projects-hackathon-opspilot/assets/c__Users_Anant_Gupta_AppData_Roaming_Cursor_User_workspaceStorage_5aa5417c9ede2f8d2a719334cd66da6a_images_image-084600c5-b6b2-45b8-b3ba-60c74c02352c.png: path is 289 characters (limit 259 without long-path support)
- and 56 more
**Template, Standard and Workflow names in tooling files that no kit file carries (0):** none.
**Proposed, not applied:**
- For the largest gap in a mapped family (ai-conversation-export), run `node 30_Order/System/vault-lint/vault-lint.js --family ai-conversation-export --list 20` and fix the top reason by hand.
- For each family with no notes, confirm the Standard is still needed or that its `match.path` still points at real notes.
- For each file with no registry row, add a row to the Note Type Registry or link it from an existing row.
- Remove or rename each file git cannot add before the next git-auto-sync run (a reserved name needs the `\\?\` form of its path to delete), because one such file stops the sync.
Fit movement: first recorded week in a synthesis note. The session log put the whole-vault fit at 4.2% on 2026-10-29 (238/5,628) and again on 2026-11-07 (252/5,647), so the percentage is flat at 4.2% while this run lints 6,094 notes; I did not establish why the denominator is 447 higher than the day before. The 76 files git cannot add are over the path limit on the Dell, and the Acer's 11-05 `git-auto-sync.ps1` change now refuses to run on a reserved or unsafe name, so confirm whether a long path counts as unsafe before the Dell's git task is ever re-enabled.
## Suggested Links
1. Mentorship Board should drop "Not yet sent" for the Jesse outreach and link Meet Your Partner and Jesse Meeting - 28th Oct Brief, because its `next:` still sends a message that already got a reply. Second week running.
2. The 00_Dashboard footer should replace the Jesse outreach deadline of 2026-11-02 with a link to Meet Your Partner, which holds the real next step.
3. CSCI 4061 Board should link Lab - 8, Project - 3 Assignment and Project - 3 Quiz in its `next:` and status block, because it still points at the Lab 6 deadline of 10-21.
4. Unit - 8 Problems Transcript should link LeetCode & CodePath and Technical Interview, since it has no wikilinks and is the only TIP103 artifact this week.
## Cleanup Candidates
1. **`10_Areas/Life/Enumerate/Daily/2026-10-12.md`, `2026-10-18.md`, `2026-10-26.md` and `2026-11-04.md`:** four unfilled daily notes. The 11-04 one holds an unrendered template expression in `updated:`. Anything that checks for a note by filename counts them as days that happened. Delete or fill.
2. **`Sync-Log-Archive-2026-09-19.md` (two files under `20_Progress/AI/Claude Code/.claude_windows` and `.claude_wsl`):** flagged every review since 2026-09-20, now seven weeks. Needs an interactive session to run Step 7.5 point 4 (summarize, then delete).
3. **Log Review registry rows for the 10 per-project `Sync-Log.md` files and the combined log:** still describe files deleted on 2026-10-04, with no row for the two surviving `.claude_*` Sync-Logs. A human should retire or rewrite them.
4. **`.obsidian/plugins/lean-terminal/data.json` from git tracking:** `git rm --cached` plus a `.gitignore` line, to match `.stignore`. Second sighting.
## Promotion Candidates
None this week. The only `status: tree` notes modified in the past 7 days are the six `Capability` notes (five `AI Roles` notes and `Capability Engine Guide`), all rewritten in the same minute on 11-05 at 20:46: internal role scaffolding that would not change a decision in The Plan.
## Next Week Priorities
Priority: Send one application. Why now: it is the plan's One Thing and the number has not moved in 45 days; the VISA Plan settled that work authorization gates nothing before an offer, and the Fall plan's own 11-09 row (scholarships) cannot outrank it. Output: an `Applied/` folder exists with one company note moved into it, using the existing `Main Resume.md` and a letter written for that one company, with `Main Cover Letter.md` left for later.
Priority: Open and close a real daily note on Monday 11-09 and write down what happened since 11-02. Why now: the Daily folder has had one stub per week for three weeks, so `/closeday` and the Dashboard count nothing. Output: `2026-11-09.md` filled and closed, and one line each on the Boards for the Lab 7, Lab 8 and Project 2 uploads, the Jesse event on 11-04, and the four assessment outcomes.
Priority: Send the ISSS email and prepare for CSCI 4061 Midterm 2. Why now: the email is due Mon 11-09 per the VISA Plan, and the midterm is Thu 11-12, with the Weeks 5 to 8 notes still unwritten. Output: the email sent and the ISSS meeting booked for the week of 11-09, and the 4061 Board `next:` rewritten to point at Midterm 2.
**Also due:** OPT fee comments close Mon 11-09, CSCI 4511W Problem Set 3 and its TA code review, the October monthly review note (`60_Claude/30_Reviews/Monthly/` holds only June), and Thanksgiving 11-26 to 11-29, when the floor pauses.
## Open Questions
1. **Can an application go out without `Main Cover Letter.md`?** Seven reviews have scheduled the letter first. The System Map now says the real blocker is evidence-tagging the resume, so the prerequisite may be set higher than the first application needs. This is a decision about the bar, not about time.
2. **What should the Dell's git state be?** Its branch tracks a deleted upstream, is 1,217 commits ahead, has 925 dirty paths, and has a stale `.stignore`. Leaving it frozen is the accepted Failure Mode 20 cost, but a reset to `origin/master` after copying the AI Conversations folder aside would remove a standing hazard. Nobody has decided.
3. **Should `Weekly Set.md` replace `LeetCode & CodePath.md` as the tracker?** Third sighting (W43, W44, now). The file `/closeday` reads is empty and the file with content has 0 of 20 checked. By the weekly rule, a question seen twice in a row becomes an immediate action: pick one and archive the other.
*Generated by /weekly-review, headless run via the Jarvis-WeeklyReview scheduled task on the Dell, no human present.*
