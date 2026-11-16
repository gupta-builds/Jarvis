---
type: review
status: complete
created: 2026-11-15
updated: 2026-11-15
review_kind: capability
week: 2026-W46
tags:
  - review
  - weekly
notes:
  - "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index]]"
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan]]"
  - "[[10_Areas/Life/Enumerate/Weekly/2026-W46]]"
---
# Weekly Synthesis: 2026-W46
**Headless run on `gupta-builds`, the machine with the live git writer.** Fired by the `Jarvis-WeeklyReview` scheduled task, which started at 18:56 on Sunday 11-15 instead of the 06:00 slot, with no human present. Step 7.5 is flag-only: nothing was deleted from any log. Unlike W45 (the Dell, frozen branch), git history is live here, so activity below comes from commits and file times together.
The week was coursework again: eleven course notes landed and the 11-09 daily note names Uber as the first application, but the tracker is still 29/0/0 (eighth review at zero, 52 days since the last commit touching `Current/`) and the Uber note has not left `Current/`.
## What Was Built
Checked against file contents and frontmatter, not against what the notes claim.
- **CSCI 4061.** Three textbook notes written 11-09 and 11-10: `Chapter - 11` (1,199 lines), `Chapter - 14` (391) and `Chapter - 16` (807), all `status: seed`, empty `next:`, zero wikilinks. `Project - 2 Oral Exam Drills` (201 lines, sprout, 11-09). `Lab - 9` (145 lines, sprout, 11-11): its `next:` says to upload `lab09-code.zip` before 11:59 pm on 11-11 and confirm the remote autograder, and nothing records either. The 4061 Board was last edited 2026-10-22, and the Weekly folder still stops at `Week - 4`, so the Weeks 5 to 8 notes that W44 and W45 asked for still do not exist. Midterm 2 was Thu 11-12 and no note records how it went.
- **CSCI 5304.** `Quiz - 4` (95 lines, 11-09) and `Homework - 3` (325 lines, 11-14), both sprout, both with a `next:` that says to hand-copy the answers into the PDF and confirm the due date on Canvas. This is the first 5304 output since W43.
- **CSCI 4521.** `Homework - 3` (226 lines, 11-10 and 11-11). Its `next:` says to export the PDF and upload by Thu 11-12; no upload is recorded. W45 had it due 11-03, so the note landed late.
- **MGMT 3015.** `Reflection on Group Idea Pitches` (68 lines, seed, 11-11). Its `next:` is to paste it into Word and upload before class that day.
- **CSCI 4511W.** Nothing changed. There is no `Week - 9`, and `Problem Set - 3` (95 lines) still has its PDF, `ps3.py` and TA code review open.
- **MGMT 3001 (previous class).** One batch at 11:04 on 11-09 touched `Week - 10`, the `Conflict and Negotiation` concept, `Master Summary` and `Board`. `Week - 10` still carries `updated: 2026-04-27`, so this reads as a bulk touch, not new work.
- **Daily note.** `2026-11-09.md` exists and is the only daily note this week. Its frontmatter still reads `day_state: planned`, `lc_count: 0` and every win and floor toggle `false`, so `/closeday` never ran on it. Its Morning Plan is the standard the review should be measured against: Uber out of `Current/` by 9:00, the ISSS email, the OPT fee comments, Lab 7 to 9 upload status on the 4061 Board, and Midterm 2 prep.
- **Not built:** any internship application, `Main Cover Letter.md`, an `Applied/` folder, any LeetCode row, any note under `Portfolio`, `TradingView` or `Hackathon`, a scholarship note, any change under `10_Areas/Career/VISAs & Work Auth/`, and any session log entry after 11-08.
## Three-Month Plan Status
The Three-Month Research Engine Master Plan is `status: paused` (per W45), so nothing on it is scored. The Fall 2026 Plan governs. Its Week-by-Week rows for this window:

| Week of | Planned hard thing | Status |
|---|---|---|
| 2026-11-09 | Scholarship shortlist built, first 2 applications submitted | ❌ No scholarship note exists under `10_Areas/` or `20_Progress/`. The only filename matches are Deloitte "Summer Scholar" internship postings |
| 2026-11-16 | LinkedIn and blog cadence check: confirm 4 real weekly posts since the plan started | ⚠️ Starts tomorrow. No `Portfolio`, blog or LinkedIn note changed this week, so there is nothing yet to count |
| 2026-11-23 | Keep the application floor alive at reduced volume (Thanksgiving 11-26 to 11-29) | ❌ At risk. The floor has no applications to reduce from |
The plan is behind on every count it checks. No review was missed (W42 to W45 all ran), so the two-missed-reviews re-scope rule does not apply, although the 11-08 run on this machine died on a sign-in warning and the Dell wrote W45 (see Vault Health).
## Fall Execution Audit
- ❌ **Internship application floor:** `Tracker/Each One/Current/` holds 29 notes, and `Applied/` and `Result/` still do not exist. The newest file in `Current/` was modified 2026-09-26 and the last commit touching `Tracker/` is `5abeb5f8` of 2026-09-24, 52 days ago. `2027 Software Engineering Internship - Uber.md` is still in `Current/`. Eighth consecutive review at zero. The 11-09 daily note named Uber and 9:00 am, the first time the plan named a company and an hour, so the miss is now an execution failure and not a planning one.
- ❌ **LeetCode/CodePath:** `LeetCode & CodePath.md` was last modified 2026-09-15 and its Daily Log has no solved-count rows. `Weekly Set.md` is under `20_Progress/Degree/CSCI 4041/Problems/` (last edited 2026-10-23) with 0 boxes checked and 20 open. The 11-09 daily note has `lc_count: 0`.
- ➖ **System Design:** correctly not started, gated behind a LeetCode floor with no record.
- ❌ **Daily floor:** one daily note for the week (`2026-11-09`), planned and not closed. The Daily folder holds nothing for 11-10 to 11-15.
- ⚠️ **Classes:** real output on CSCI 4061, 5304, 4521 and MGMT 3015, none on 4511W. Still unrecorded on any Board: CSCI 4061 Midterm 2 (11-12), the Lab 7, 8 and 9 uploads, the 4521 HW3 upload, and the four outcomes W43 listed (5304 midterm, 4521 Quiz 3, 4511W Long Quiz 1, 4061 Midterm 1). I did not re-read the syllabus for deadlines in the next 7 days, so the only dated items I can cite are the plan rows above and the open `next:` lines.
- ❌ **Projects (TradingView, Portfolio v2, ClaudeKit):** no TradingView, Portfolio or ClaudeKit note changed. `Claude Kit/Log.md` still has no entry after 2026-09-05.
- ⚠️ **Career pipeline (broader):** nothing under `VISAs & Work Auth/` changed, so whether the ISSS email went out on 11-09 is not recorded anywhere in the vault. `Mentorship Board.md` (last edited 10-28) still says "Not yet sent" for the Jesse outreach on line 44, and the Dashboard footer (line 191) still lists "send the Jesse outreach email, deadline 2026-11-02" as the current must-do. Third review flagging this. I did not re-check `Networking Strategies.md` or `Hackathons.md`.
## Enrichment and Drills
No notes enriched this week. Zero notes vault-wide carry `enrichment_status: enriched`. The same five notes carry the only dated `next_drill` values (four in `60_Claude/20_Distilled_Notes/` and `TradingView/Research/Trading Tools and Platforms.md`), now 190 to 197 days overdue. The restart-or-drop question first asked in W39 is nine reviews old. The capture folders under `60_Claude/05_Clippings/AI Conversations/` exist (Acer, Dell, Windows) and hold 64 files modified since 11-08, but nothing was distilled this week: no changed note in `10_Source_Summaries/`, `20_Distilled_Notes/` or `40_Project_Briefs/`.
## Vault Health
**Sync state (`gupta-builds`).**
- **Live conflicts:** none. A scan outside `.git/`, `.stversions/` and `50_Archive/` found no `*sync-conflict*` file.
- **Dashboard banner:** `Sync Alert Banner.md` was written at 18:56 as this run started, reading "needFiles=8, needBytes=6212, errors=0". Minutes later `check-syncthing-status.ps1` returned `Overall: IN SYNC` (12,965 local and 12,965 global files, 0 needed, 0 errors, 100% completion against the other laptop) and the banner file was 0 bytes again. A transient catch-up that cleared by itself, not an outage.
- **Git:** branch `master`, no stashes. One tracked file is modified and uncommitted, `.obsidian/plugins/obsidian-spaced-repetition/data.json`. `git-auto-sync.log` since the W45 review (11-08 06:19): 209 nothing to do, 20 success, 4 deferred (Syncthing converging), 1 FAILED. The FAILED run (11-11 17:34) was logged "pull --rebase conflict" but the log line under it reads `Could not resolve host: github.com`, a network drop, the same mislabel W43 found. The 18:03 run was clean. Nothing unresolved, and the last run (04:03 on 11-15) ended `nothing to do`.
- **Self-heal cache:** `.syncthing-exe-path.txt` exists, was rewritten at 18:57 by this run's check, and names `D:\Apps\syncthing-windows-amd64-v2.1.5\syncthing.exe`, which exists. Leftover stashes: none.
- **Hardcoded-path audit:** clean. No hit for either literal path in `.ps1`, `.vbs`, `.py` or `.json` under `30_Order/System/` or `.claude/`.
- **Ignore-file symmetry:** one gap, not edited. `.obsidian/plugins/lean-terminal/data.json` is in `.stignore` but not `.gitignore`, and `git ls-files` still tracks it. Third sighting (W44, W45, now). The fix is a `.gitignore` line plus `git rm --cached`, which touches `.obsidian/` and tracked state, so a human decides. The comparison also listed `.git`, `.trash`, `.venv` and several `.claude/skills` and `.opencode/skills` entries as in `.stignore` only; their spelling differs between the two files, so I did not treat them as gaps and did not check each one.
- **Directory-emptiness check:** every file in `claude-workflow/logs/` (`git-auto-sync.log`, `.log.1`, `weekly-review.log`, `internship-note-guard.jsonl`, `capture-health-*.json`) has a `(?d)` pattern in `.stignore`. `cursor-workflow/logs/` does not exist on this machine, so there is nothing to check there. No deadlock risk.
- **Obsidian-git settings:** `autoSaveInterval: 0`, `refreshSourceControlTimer: 30000`. Stable for a sixth review in a row.
- **Weekly-review task on this machine:** `weekly-review.log` shows the 11-08 06:00:04 run ended in `EXCEPTION`, a warning that the sign-in ends between 11-10 and 11-13 and that `claude setup-token` is the fix for unattended jobs. That is consistent with the Dell having written W45. Today's run started at 18:56:22, about 13 hours after the Sunday slot, so it was either a missed-start catch-up or the sign-in lapsed and was renewed in between. A human should confirm the sign-in is a long-lived token, or this task fires and fails again next Sunday.
- **Python:** `python3` and `python` both resolve to the Windows Store stub on this machine ("Python was not found"). I used `node` for the structural counts. This plausibly bears on the Cursor sweep and any Python-based exporter; not investigated.
- **Monthly deep check:** done in W44 (first review of November). The Staggered Versioning and `fsWatcherDelayS` values remain unread and are due again in December.
**Structure.**
- **Orphans:** by a name-based search (any `[[Name` in a note outside the clippings), 70 of 520 notes in `40_Resources/` and `60_Claude/20_Distilled_Notes/` have no inbound link. The oldest are `MATH 2230` homework and quiz notes, `HIST 1103` assignments and `CSCI 2041` `Chapter - 5 & 6`. Approximate: it does not read aliased or path-only links as precisely as Obsidian does.
- **Projects with no `next:`:** 29 of 153 active `type: project` notes under `20_Progress/` (W44 found 30). The list includes `Portfolio.md`, `Resq`, `AIIS MedTech Hackathon`, `2026-HRT-Sophomore`, `Learning Tracker tool`, `claude-code-prompts` and the nine `Prompts - Acer` P0 to P8 notes.
- **New notes this week with no wikilinks:** `CSCI 4061/Textbook/Chapter - 11`, `Chapter - 14` and `Chapter - 16`. The `2026-10-26` daily note also shows a birth time this week (edited 11-09 06:35) and has no links.
- **Metadata gaps:** `2026-W46` in `Enumerate/Weekly/` was created 11-04 from the template with empty `week:` and `next:`; this review fills it. The 11-09 daily note has a `type` and `status`, but its day was never closed.
- **Session log gap.** `Session Logs/log.md` has no entry between the W45 review (11-08) and this one. The eleven course notes, the 11-09 daily plan and the 11-11 network failure produced no log line.
**Log Maintenance (Step 7.5), headless run: flagged, nothing deleted.** This machine's copies; the aggregate summary is in `Log Review.md`.

| Log | Cap | Actual | Content | Action |
|---|---|---|---|---|
| `git-auto-sync.log` | 300 lines | 4,891 lines (452 KB) | 2026-11-05 06:03 to 2026-11-15 04:03; the file was rotated on 11-05 (`.log.1` holds 1,237 lines, 4.1 MB). 339 completed runs: 272 nothing to do, 53 success, 10 deferred, 4 FAILED (2 could not commit, 1 `Could not resolve host`, 1 unsafe name `nul` in a temp scratchpad) | Flagged only |
| `cursor-workflow/logs/sweep-*.log` | last 14 days | directory does not exist here | Nothing to trim | None |
| `Sync-Log-Archive-2026-09-19.md` (×2, `.claude_windows`, `.claude_wsl`) | one-time cleanup, should be 0 | 6,991 and 7,966 lines | Unchanged, eighth week flagged | Flagged only |
| `.claude_windows/Sync-Log.md`, `.claude_wsl/Sync-Log.md` | 300 lines | 534 and 3,056 lines | Last written 2026-09-20, silent for eight weeks | Flagged only |
The curated Session Log is 1,902 lines against its 3,000 cap and `Claude Kit/Log.md` is 192; neither needs action. The Log Review registry still describes files deleted on 2026-10-04 and cites the Session Log at 1,441 lines.
**Order health (Step 7.7).**
### Order health (2026-11-15)
Read-only: `node vault-lint.js` and `node vault-lint.js --kit`, plus `30_Order/Note Type Registry.md`. Nothing was fixed.
**Fit:** 256/5677 = 4.5% (target 90%). Below target.
**Kit consistency:** 0 errors, 8 warnings (exit 0).
**Families below 100% fit (67), with the top 3 failure reasons:**

| Family | Fit | Failing | Top reasons |
|---|---|---|---|
| (unmapped) | 0/2907 = 0.0% | 2907 | 6:unmapped (2907), 1:legacy-generated-type:code (1215), 1:legacy-generated-type:rationale (591) |
| ai-conversation-export | 0/717 = 0.0% | 717 | 5:blank-after-frontmatter (717), 5:extra-blank-lines (717), 5:trailing-blank (639) |
| internship-dossier | 0/354 = 0.0% | 354 | 6:legacy-shape (354), 1:no-type (354), 1:missing-key:type (354) |
| course-concept | 0/200 = 0.0% | 200 | 2:missing-heading:Mechanism (185), 2:missing-heading:Contrast / What It Is Not (185), 2:missing-heading:Failure Modes / Misconceptions (185) |
| dashboard | 0/96 = 0.0% | 96 | 1:missing-key:dashboard_kind (96), 5:extra-blank-lines (83), 1:missing-key:updated (80) |
| repo-card | 0/94 = 0.0% | 94 | 6:legacy-shape (94), 1:missing-key:verdict (94), 5:extra-blank-lines (93) |
| project | 1/91 = 1.1% | 90 | 6:legacy-shape (89), 1:missing-key:project_kind (89), 2:missing-heading:Current State (82) |
| machine-runbook | 1/91 = 1.1% | 90 | 6:legacy-shape (90), 2:missing-heading:Checkpoints (90), 2:missing-heading:Steps (89) |
| course-week | 5/90 = 5.6% | 85 | 6:legacy-shape (78), 1:missing-key:class_kind (78), 1:hash-in-tags (67) |
| reference-resource | 35/118 = 29.7% | 83 | 1:missing-key:area (80), 1:missing-key:reference_kind (76), 6:legacy-shape (67) |
| course-textbook | 10/89 = 11.2% | 79 | 6:legacy-shape (72), 1:missing-key:class_kind (72), 1:hash-in-tags (68) |
| course-homework | 3/54 = 5.6% | 51 | 6:legacy-shape (44), 1:missing-key:class_kind (44), 5:extra-blank-lines (44) |
| source-summary | 0/45 = 0.0% | 45 | 1:kind-off-vocab:input_kind=pdf (28), 2:missing-heading:Full Content (23), 3:dead-frontmatter-links (22) |
| technical-concept | 0/43 = 0.0% | 43 | 2:missing-heading:Mechanism (43), 2:missing-heading:Contrast / What It Is Not (43), 2:missing-heading:Failure Modes / Misconceptions (43) |
| moc | 7/42 = 16.7% | 35 | 2:missing-heading:Purpose (31), 2:missing-heading:Map (30), 5:extra-blank-lines (27) |
| internship-tracker | 0/32 = 0.0% | 32 | 1:no-status (32), 1:missing-key:status (32), 1:missing-key:created (32) |
| tool-setup | 0/32 = 0.0% | 32 | 6:legacy-shape (32), 1:missing-key:reference_kind (32), 2:missing-heading:What's actually here (23) |
| internship-program | 0/31 = 0.0% | 31 | 6:legacy-shape (31), 1:no-type (31), 1:no-status (31) |
| internship-contact | 0/30 = 0.0% | 30 | 1:no-status (30), 1:missing-key:status (30), 1:missing-key:created (30) |
| code-mirror-doc | 0/28 = 0.0% | 28 | 6:legacy-shape (28), 1:status-off-vocab:sprout (28), 1:missing-key:updated (28) |
| daily-note | 2/27 = 7.4% | 25 | 5:extra-blank-lines (24), 6:legacy-shape (23), 1:missing-key:updated (23) |
| clipping | 0/24 = 0.0% | 24 | 1:missing-key:updated (24), 6:legacy-shape (23), 1:no-type (23) |
| course-board | 1/18 = 5.6% | 17 | 6:legacy-shape (17), 1:missing-key:class_kind (17), 1:hash-in-tags (17) |
| project-spec | 6/23 = 26.1% | 17 | 2:missing-heading:Current State (17), 5:extra-blank-lines (4), 6:legacy-shape (3) |
| agent-prompt | 0/16 = 0.0% | 16 | 2:missing-heading:Implementation Order (12), 2:missing-heading:Report Back (12), 2:missing-heading:Why This Exists (11) |
| distilled | 0/15 = 0.0% | 15 | 6:legacy-shape (14), 1:missing-key:evergreen_kind (14), 2:missing-heading:Core Claim (14) |
| course-project-companion | 0/14 = 0.0% | 14 | 5:extra-blank-lines (12), 6:legacy-shape (11), 1:missing-key:class_kind (11) |
| course-discussion | 0/13 = 0.0% | 13 | 6:legacy-shape (13), 1:missing-key:class_kind (13), 1:hash-in-tags (13) |
| course-project | 0/12 = 0.0% | 12 | 6:legacy-shape (9), 1:missing-key:class_kind (9), 1:hash-in-tags (9) |
| transcript | 2/12 = 16.7% | 10 | 5:extra-blank-lines (10), 4:wrong-folder (9), 1:missing-key:updated (8) |
| course-control | 0/9 = 0.0% | 9 | 6:legacy-shape (8), 5:extra-blank-lines (8), 1:missing-key:class_kind (7) |
| periodic-review-note-weekly | 1/9 = 11.1% | 8 | 5:extra-blank-lines (7), 6:legacy-shape (5), 1:missing-key:period (5) |
| course-subboard | 1/9 = 11.1% | 8 | 6:legacy-shape (7), 1:missing-key:class_kind (7), 2:missing-heading:Purpose (5) |
| audit-report | 5/13 = 38.5% | 8 | 5:extra-blank-lines (6), 6:legacy-shape (6), 1:missing-key:review_kind (6) |
| capability-review | 1/8 = 12.5% | 7 | 6:legacy-shape (7), 1:missing-key:updated (7), 1:missing-key:review_kind (7) |
| course-exam-material | 0/6 = 0.0% | 6 | 6:legacy-shape (6), 1:missing-key:class_kind (6), 2:missing-heading:Scope (6) |
| plan | 1/6 = 16.7% | 5 | 1:missing-key:review_cadence (4), 2:missing-heading:Goal (4), 2:missing-heading:Timeframe (4) |
| course-preparation | 1/6 = 16.7% | 5 | 6:legacy-shape (5), 1:missing-key:class_kind (5), 1:hash-in-tags (5) |
| course-track | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:missing-key:class_kind (5), 5:extra-blank-lines (3) |
| project-plan | 7/12 = 58.3% | 5 | 2:missing-heading:Sequence (5), 6:legacy-shape (4), 1:missing-key:project_kind (4) |
| ai-conversation-summary | 0/5 = 0.0% | 5 | 1:missing-key:updated (5), 5:blank-after-frontmatter (5), 5:extra-blank-lines (5) |
| depth-ladder | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| field-os | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| question-bank | 0/5 = 0.0% | 5 | 6:legacy-shape (5), 1:status-off-vocab:tree (5), 1:missing-key:dashboard_kind (5) |
| course-lab | 4/8 = 50.0% | 4 | 6:legacy-shape (4), 1:missing-key:class_kind (4), 1:hash-in-tags (4) |
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
**Files git cannot add (0):** none.
**Template, Standard and Workflow names in tooling files that no kit file carries (0):** none.
**Proposed, not applied:**
- For the largest gap in a mapped family (ai-conversation-export), run `node 30_Order/System/vault-lint/vault-lint.js --family ai-conversation-export --list 20` and fix the top reason by hand.
- For each family with no notes, confirm the Standard is still needed or that its `match.path` still points at real notes.
- For each file with no registry row, add a row to the Note Type Registry or link it from an existing row.
Fit movement: 4.5% (256/5,677) against W45's 4.2% (253/6,094), a gain of three passing notes (about 0.3 points) while the linted set shrank by 417 notes, so the percentage moved mostly because the denominator fell, not because notes were brought to Standard. The 76 files git could not add in W45 are gone from the count (0 now).
## Suggested Links
1. Mentorship Board line 44 should link Meet Your Partner and the Jesse Meeting brief and drop "Not yet sent", because the 10-28 call already happened. Third week flagged, last edited 10-28.
2. The 00_Dashboard footer (line 191) should replace the 2026-11-02 Jesse outreach deadline with a link to Meet Your Partner, which holds the real next step.
3. CSCI 4061 Board should link Lab - 9, Project - 2 Oral Exam Drills and the Project - 3 notes in its `next:`, because it was last updated 10-22 and still points at the Lab 6 deadline of 10-21.
4. CSCI 4061 Textbook Chapter - 11, Chapter - 14 and Chapter - 16 should each link the 4061 Board and Project - 2 Oral Exam Drills, since all three are `status: seed` with zero outbound links and are only reachable by folder.
## Cleanup Candidates
1. **`10_Areas/Life/Enumerate/Daily/2026-10-12.md`, `2026-10-18.md`, `2026-10-26.md` and `2026-11-04.md`:** the four stub dailies W45 named. All four still exist (10-26 was touched on 11-09 at 06:35). Anything that checks for a note by filename counts them as days that happened. Delete or fill.
2. **`Sync-Log-Archive-2026-09-19.md` (two files under `20_Progress/AI/Claude Code/.claude_windows` and `.claude_wsl`):** flagged every review since 2026-09-20, now eight weeks. Needs an interactive session to run Step 7.5 point 4 (summarize, then delete).
3. **Log Review registry rows for the 10 per-project `Sync-Log.md` files and the combined log:** still describe files deleted on 2026-10-04, with no row for the two surviving `.claude_*` Sync-Logs, and the Session Log row still cites 1,441 lines. A human should retire or rewrite them.
4. **`.obsidian/plugins/lean-terminal/data.json` from git tracking:** `git rm --cached` plus a `.gitignore` line, to match `.stignore`. Third sighting.
## Promotion Candidates
None this week. The only `status: tree` note modified in the past 7 days is the Weekly Synthesis Index, an index, which fails the stability and usefulness bar. Every course note written this week is `seed` or `sprout`.
## Next Week Priorities
Priority: Send the Uber application. Why now: it is the plan's One Thing, the 11-09 daily plan already named Uber and 9:00 am and it did not happen, and the tracker has been frozen 52 days. Output: an `Applied/` folder exists with the Uber note moved into it, sent on the existing `Main Resume.md` with a letter written for that one company, and `Main Cover Letter.md` left for later.
Priority: Open and close a real daily note on Mon 11-16, and write down the outcomes that have piled up. Why now: one planned and unclosed note a week means `/closeday` and the Dashboard count nothing, and Midterm 2 (11-12), the Lab 7 to 9 and HW3 uploads, the Jesse event and the four W43 assessment outcomes are written on no Board. Output: `2026-11-16.md` closed with toggles ticked or honestly false, one line on each Board, and Mentorship Board line 44 plus the Dashboard footer corrected.
Priority: Log the first LeetCode solved-count row. Why now: five problems a day has had no record since 2026-09-15 (61 days), and two trackers disagree about where it goes. Output: one tracker chosen and the other archived (`Weekly Set.md` under `CSCI 4041/Problems/` or `LeetCode & CodePath.md`), and a dated row with a solved count of at least one.
**Also due:** the Fall plan's 11-16 LinkedIn and blog cadence check, CSCI 4511W Problem Set 3 and its TA code review, the ISSS email and OPT fee comments (status unrecorded since 11-09), the `Jarvis-WeeklyReview` sign-in on this machine before next Sunday, the November monthly review note (`60_Claude/30_Reviews/Monthly/` holds only June, so October has none either), and Thanksgiving 11-26 to 11-29, when the floor pauses.
## Open Questions
1. **What stopped the Uber application at 9:00 am on 11-09?** W45 asked whether `Main Cover Letter.md` was too high a bar, and the 11-09 daily plan answered it (existing resume, one-company letter, `Applied/` folder). The plan changed and the number did not, so the blocker is something the notes do not name: the letter, the resume's evidence tagging, or time. This needs an answer before another week is scheduled around it.
2. **Which LeetCode tracker is canonical?** Fourth sighting (W43, W44, W45, now). `/closeday` reads one file that is empty, and the one with content has 0 of 20 checked and lives in a course folder. By the weekly rule a question seen twice in a row is an immediate action: pick one and archive the other.
3. **Should the Dell's git state be reset?** W45 raised it: its branch tracks a deleted upstream, is 1,217 commits ahead and has 925 dirty paths. I cannot see the Dell from here, so this is carried, not re-checked. Nobody has decided.
*Generated by /weekly-review, headless run via the Jarvis-WeeklyReview scheduled task on `gupta-builds`, no human present.*
