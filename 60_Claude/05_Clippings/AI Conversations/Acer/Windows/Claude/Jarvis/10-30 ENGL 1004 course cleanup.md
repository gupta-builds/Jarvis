---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "ENGL 1004 course cleanup"
started_at: 2026-10-30T20:23:11
ended_at: 2026-10-30T20:28:29
exported_at: 2026-10-30T21:03:03
duration_minutes: 5.3
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: 762edbcb-524b-4872-b6dd-333cdc87b770
status: seed
review_state: raw
created: 2026-10-30
updated: 2026-10-30
turn_count: 2
tools_used:
  Bash: 11
  Glob: 1
  Grep: 3
tokens:
  input: 26
  output: 14130
  cache_creation: 70593
  cache_read: 1032882
  total: 1117631
cost_usd: 0.527012
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# ENGL 1004 course cleanup

## You

This course was dropped: ENGL 1004 this semester. There should be no board notes or anything mentioned in the current semester about this course. Just a dropped course which was never studied. Just noted down in the resources and the plans that this course was dropped this semester (already done). You are required to clean out anything else that is left over for this course. Another session mentioned this to me: ```- ENGL 1004 Board: The UMN Board says it retains an inactive record. No file exists at 20_Progress/Degree/ENGL 1004/, only a Syncthing version under .stversions. I left it unlinked.```. Which is why you are doing this task. Make sure to delete everything regarding this course.

## Claude

I'll start by finding everything that mentions the course.

I've mapped where the course shows up. Next I'm cleaning the live notes: dailies, weekly, boards, syllabus, skills. I'm also deleting the dedicated files.

Python isn't installed, so I'll do the same edits with Node.

Those edits applied. Now the Course Production Board, which has the most ENGL content.

I removed ENGL 1004 from the live current-semester notes and deleted the course's own files. I left the historical records alone, plus your real course folder outside the vault.

**Deleted**
- The Syncthing version folder `.stversions/20_Progress/Degree/ENGL 1004/`. It held the old Board and a Journal Entry 3 copy. No `ENGL 1004/` folder exists in the vault itself.
- The clipping `10-02 ENGL 1004 Journal Entry 3.md` (185 mentions, wholly about this course). I left its `.exported/*.done` marker so the exporter won't recreate it.

**Cleaned**
- **Dailies and habits:** removed "/ ENGL 1004" from the class-step line in 8 daily notes (09-15 to 10-12) and from `Habit Tracker Board.md`.
- **Weekly:** `2026-W41.md` no longer mentions the course.
- **Degree notes:**
  - `UMN Board.md` and `Every Week.md`: removed the dead `[[ENGL 1004 Board]]` link and the exclusion notes.
  - `Fall'26 Syllabus.md`: removed the dead Board link.
  - `MGMT 3015 Board.md`, `MGMT 3015/Weekly/Week - 1.md` and `CSCI 4521 Board.md`: removed the comparisons to ENGL 1004 and the dead links.
  - `Hit or Miss - Miss.md`: cut the made-up late-journal and attendance ledger down to "Dropped, never studied, no grade cost."
- **Course Production Board:** removed the ENGL section, its handoff prompts, its workflow entry, and the roster note. Counts now say four courses instead of five.
- **Weekly-review skill:** all three copies now list 5 courses.
- **Sync findings note:** removed the one ENGL Board mention.

**Kept**
The drop notes in `APAS.md`, `Entrepreneurship Minor.md`, the Fall'26 Syllabus roster and Literature lines, and the one-line heading in `Hit or Miss - Miss.md`. That is the "already done" part.

**Not touched, your call**
- **Historical records:** about 80 AI-conversation clippings, the session logs and their `.bak` copies, and the Weekly Synthesis notes (W40, W41, W43, plus the index) mention the course. These are raw or append-only history, and most also contain other content, so scrubbing them would rewrite history and destroy unrelated material. I can strip the ENGL lines from them if you want.
- **Outside the vault:** `D:\_Anant\10_Areas\UMN\Classes\Lib Eds & More\ENGL 1004\` holds the syllabus PDF, `Lecture/`, `Journal Entries/` and `Readings/`. I didn't delete it because it's outside the vault and unrecoverable.

I didn't append a session-log entry, per your rule against writing unrequested files.

### Tool Calls

- `Grep` -- pattern `ENGL[ _-]?1004|ENGL1004` path ` `
- `Glob` -- pattern `**/*ENGL*1004*` path ` `
- `Grep` -- pattern `ENGL[ _-]?1004` path ` `
- `Grep` -- pattern `ENGL(?![ _-]?1004)|Journal Entr|Lib Eds` path ` `
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls "D:/_Anant/10_Areas/UMN/Classes/Lib Eds & More/" 2>&1 | head; ls -d "20_Progress/Degree/ENGL 1004" 2>&1; git ls-files .stversions | head -3; git check-ignore -v ".stversions/20_Progress/Degree/ENGL 1004/ENGL 1004 Board~20261009-224822.md"; ls ".stversions/20_Progress/Degree/ENGL 1004/" 2>&1; find . -path ./50_Archive -prune -o \( -iname "*ENGL*" \) -print 2>/dev/null | grep -v "05_Clippings" | head
```
```
BBE 1002
BBE 1201
BIOL 1012
CSE 1001
ENGL 1004
GEOG 1502
MUS 1013
OUE1102
Writing
ls: cannot access '20_Progress/Degree/ENGL 1004': No such file or directory
.gitignore:223:.stversions/	.stversions/20_Progress/Degree/ENGL 1004/ENGL 1004 Board~20261009-224822.md
Asssignments
ENGL 1004 Board~20261009-224822.md
./.stversions/20_Progress/Degree/ENGL 1004
./.stversions/20_Progress/Degree/ENGL 1004/ENGL 1004 Board~20261009-224822.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && find ".stversions/20_Progress/Degree/ENGL 1004" | head -20; echo ---; ls -la "D:/_Anant/10_Areas/UMN/Classes/Lib Eds & More/ENGL 1004" | head; echo ---; grep -rIl "ENGL" --exclude-dir=50_Archive --exclude-dir=05_Clippings --exclude-dir=.git --exclude-dir=.stversions --exclude-dir=node_modules . 2>/dev/null | grep -v -E "log\.md|\.bak" | head -50
```
```
.stversions/20_Progress/Degree/ENGL 1004
.stversions/20_Progress/Degree/ENGL 1004/Asssignments
.stversions/20_Progress/Degree/ENGL 1004/Asssignments/Journal Entry - 3~20261003-001149.md
.stversions/20_Progress/Degree/ENGL 1004/ENGL 1004 Board~20261009-224822.md
---
total 220
drwxr-xr-x 1 anant 197609      0 Sep 21 22:59 .
drwxr-xr-x 1 anant 197609      0 Sep 17 08:58 ..
-rw-r--r-- 1 anant 197609 246956 Sep 17 08:52 ENGL 1004-003 syllabus fall 2026.pdf
drwxr-xr-x 1 anant 197609      0 Oct  2 12:03 Journal Entries
drwxr-xr-x 1 anant 197609      0 Oct  2 10:36 Lecture
drwxr-xr-x 1 anant 197609      0 Sep 21 23:04 Readings
---
./.agents/skills/weekly-review/weekly-review.md
./.claude/skills/weekly-review/weekly-review.md
./.obsidian/plugins/lean-terminal/data.json
./.obsidian/plugins/multi-column-markdown/main.js
./.obsidian/plugins/recent-edits/data.json
./10_Areas/Career/Internships/List/Dossiers/_Today/Manual Internship Listings.md
./10_Areas/Life/Enumerate/Daily/2026-09-15.md
./10_Areas/Life/Enumerate/Daily/2026-09-19.md
./10_Areas/Life/Enumerate/Daily/2026-09-21.md
./10_Areas/Life/Enumerate/Daily/2026-09-28.md
./10_Areas/Life/Enumerate/Daily/2026-09-29.md
./10_Areas/Life/Enumerate/Daily/2026-10-01.md
./10_Areas/Life/Enumerate/Daily/2026-10-05.md
./10_Areas/Life/Enumerate/Daily/2026-10-12.md
./10_Areas/Life/Enumerate/Weekly/2026-W41.md
./10_Areas/Life/Habits/Habit Tracker Board.md
./20_Progress/AI/Claude Code/Jarvis/.claude/skills/weekly-review/weekly-review.md
./20_Progress/Degree/Course Production Board — Fall'26.md
./20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md
./20_Progress/Degree/Every Week.md
./20_Progress/Degree/Fall'26 Syllabus.md
./20_Progress/Degree/Hit or Miss - Miss.md
./20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md
./20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md
./20_Progress/Degree/UMN Board.md
./30_Order/System/claude-workflow/logs/git-auto-sync.log
./40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 8 Findings.md
./40_Resources/UMN/The Plan/APAS.md
./40_Resources/UMN/The Plan/Entrepreneurship Minor.md
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis Index.md
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W40.md
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W41.md
./60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W43.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n -o -E ".{300}ENGL 1004.{300}" "10_Areas/Life/Enumerate/Weekly/2026-W41.md" "20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md" "20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md" "60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W41.md" "60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W40.md" "40_Resources/UMN/The Plan/APAS.md"
```
```
60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W40.md:24:tes — PEAS Framework, Rational Agent, Informed Search, Uninformed Search — and Chapters 3-4 of the textbook merged and fact-checked against the PDF). CSCI 5304 has Weeks 2-4 and Lectures 2-8 written. CSCI 4061 has Weeks 1-4, Project 1's board/assignment/code, and nine C-Refresher concept notes. ENGL 1004 has its board, readings log, and a journal entry. **Caveat that matters**: 299 of this week's 306 commits are auto-sync or merge noise, and a single 2026-10-01 merge ("reconcile 10-day cross-laptop backlog") touched most of these files at once — file mtimes this week cannot cleanly separate "writ
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 95,110p "20_Progress/Degree/Hit or Miss - Miss.md"; echo ----; sed -n 20,34p "20_Progress/Degree/UMN Board.md"; echo ----; sed -n 15,25p "20_Progress/Degree/Every Week.md"
```
````
| Item | What happened | Cost |
|---|---|---|
| Attendance | Low, by an unknown amount | Class participation is a 20% category on this course |
| Business Idea For A New Company | 4.75 of 5 | -0.25 |
| Quiz 1 | 51 of 52 | -1 |

### ENGL 1004 (dropped)
Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. These entries came from the earlier version of this ledger. They carry no Fall'26 grade cost and stay here only as a record: attendance missed for 2 weeks, and Journal Entries 1 and 3 submitted late.

## Known gaps
Per [[Degree Control Standard]], these are listed and not resolved by guess.

1. **CSCI 4511W, "36 points."** The report says the missed Problem Set 2 code review is worth 36 points. The four problem sets together are 36% of the course, so "36" may be that category weight and not a count of points lost. Which one is meant is unresolved.
2. **CSCI 4511W, unnamed items.** The 2.4 and 3.3 homework deductions do not say which assignments they belong to (Problem Set 1 and 2 are the likely pair, unconfirmed). The 0.5 short quiz is not identified.
3. **CSCI 4511W, stale vault state.** [[20_Progress/Degree/CSCI 4511W/Assignments/Written/Problem Set 2|Problem Set 2]] still says the PDF assigns no code review and that no submission, grade, or code review is recorded. The report contradicts that. The Board's ten-day window after the 10/9 due date also ended 10/19.
4. **CSCI 4061, which two labs.** The report does not say which two labs were submitted but ungraded. [[20_Progress/Degree/CSCI 4061/Labs/Lab - 5|Lab 5]], [[20_Progress/Degree/CSCI 4061/Labs/Lab - 6|Lab 6]], and [[20_Progress/Degree/CSCI 4061/Labs/Lab - 7|Lab 7]] each say the Gradescope upload and attendance were unverified. No Lab 1 note exists.
----
---
# Degree — How This Folder Works
This is the one note that governs everything created under `20_Progress/Degree/`. Every class folder here carries its own `<Course> Board` note; this note is the layer above those, tying the semester's coursework back to [[APAS]] — the actual degree-completion tracker — instead of treating each class as an island.
## Map
[[APAS]] owns degree-audit facts, credits, and verification gaps. [[Fall'26 Syllabus#Path to Graduation]] owns course decisions and semester allocation through **May 2028**. Four semesters remain including Fall'26; Spring'27, Fall'27, and Spring'28 are the three future planning terms.
The active Fall'26 roster is five courses: [[CSCI 4511W Board]], [[CSCI 4061 Board]], [[CSCI 5304 Board]], [[MGMT 3015 Board]], and [[CSCI 4521 Board]]. ENGL 1004 was dropped, confirmed on 2026-10-09. [[ENGL 1004 Board]] retains its inactive record; one Literature/liberal education course remains.
Each class folder holds its Board and preparation/source notes. [[Fall'26 Syllabus]] lists active courses and grading criteria; [[Every Week]] is the active calendar. Update the existing planning workspace as decisions happen.
## Standards this folder follows
New class material should not invent its own shape. [[Weekly Standard]] governs weekly lecture-synthesis notes once a course starts meeting. `30_Order/Templates/Classes/` holds templates for homework, labs, discussions, projects, and exam sheets. A course Board note is not a Dataview shell — it states, in prose, what's known and what's still missing, per [[MOC Standard]]'s same "map, not index" logic even though Boards use `type: class` rather than `type: index`.
## Status
As of 2026-10-09, five Fall'26 weeks have been completed; Week 6 starts Monday, 2026-10-12. All five retained courses are in progress. The existing Board/Preparation/Textbook Map layer is available; lecture-note coverage was not re-audited in this session.
Projected active load: 18 credits, pending confirmation of CSCI 4511W's credit value. The latest recorded official APAS audit is 2026-09-10. [[APAS#Planning reconciliation before course selection]] records allocation discrepancies to settle before course choices.
[[Every Week]] excludes ENGL 1004 from active scheduling. The previously referenced external semester spreadsheet was not located or updated in this session; a surviving copy may retain the old roster.
## Dataview
```dataview
----
  - "[[20_Progress/Degree/CSCI 4061/CSCI 4061 Board|CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 5304/CSCI 5304 Board|CSCI 5304 Board]]"
  - "[[20_Progress/Degree/MGMT 3015/MGMT 3015 Board|MGMT 3015 Board]]"
next: "Confirm CSCI 5304's midterm date (printed 10/15 vs. stated 10/22 - see that Board's anomaly warning) and MGMT 3015's two date anomalies (Session 6, Session 16) before those weeks arrive"
---
# UMN
ENGL 1004 was dropped, confirmed on 2026-10-09, and its entries are excluded from this active calendar. Five weeks are complete; Week 6 starts Monday, 2026-10-12. The referenced external spreadsheet was not located or updated and may retain the old roster.

==One master weekly calendar for every Fall'26 class - what's due, on what day, at what time, and whether it repeats. Each course's own Board note is the deep source (grading rationale, policies, full context); this note is the checkable cross-class view, the Obsidian counterpart to `Fall'26 Semester Calendar.xlsx` at `10_Areas/UMN/Plan/In Semester Review/`.==

## Course Quick Reference
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && for f in "10_Areas/Life/Enumerate/Weekly/2026-W41.md:14" "20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md:90" "20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md:57" "20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md:112"; do n=${f##*:}; p=${f%:*}; echo "=== $p:$n"; sed -n "${n}p" "$p" | grep -o -E ".{0,350}ENGL 1004.{0,350}"; done; echo; sed -n 21p "10_Areas/Life/Enumerate/Weekly/2026-W41.md"
```
```
=== 10_Areas/Life/Enumerate/Weekly/2026-W41.md:14
> **[/weekly-review, 2026-10-11, merged from two review runs]**: Real class progress (ENGL 1004 dropped, grading criteria filled in, PS2 and the midterm both landed) and a real engineering win (Obsidian's OOM crash root-caused and fixed), set against a live git-auto-sync conflict that kept recurring and a daily-note floor that collapsed to zero for six straight days. The sync conflict grew to 653 failed rebase attempts before being fixed 202
=== 20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md:90
> The professor's schedule sheet lists both "5.3" and "5.4" under a single Dec 14 week entry with no Tuesday/Thursday column split (unlike every other week). The vault's own Fall'26 calendar (used consistently across CSCI 4061, 5304, MGMT 3015, ENGL 1004) has **Wednesday 12/16 as the last day of instruction**, which would put Thursday 12/17 inside finals period, not instruction - meaning a TTh course's real last class is Tuesday 12/15, with both 5.3 and 5.4 covered that single day. This is a reasonable inference from a confirmed calendar fact, not the source's own explicit statement - confirm agai
=== 20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md:57
ged - lighter weeks: reading, scanning relevant news, networking, idea-journal entries; heavier weeks: case or quiz preparation, venture planning, and presentation/business-plan preparation. Against [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]'s 80/20 split, this is a mid-weight Fall'26 course - heavier than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s ~8.5 hrs but lighter than [[20_Progress/Degree/CSCI 4061/CSCI 4061 Board|CSCI 4061]]'s ~12.
=== 20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md:112
MGMT 3015's AI policy boundary::AI is allowed for research, ideation, and acknowledged assistance — but the report itself must be the student's own writing; this is stricter than "no restriction" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s total ban.

4. Keep the rest of the course load moving alongside the midterm push: CSCI 4521 (HW-1 Mon, Lecture Tue/Thu, Quiz-2 Thu), CSCI 4511W (Lecture Mon/Wed, Discussion Fri, HW-2 Fri, Mentorship Mon), MGMT 3015 (Lecture Mon/Wed, Quiz Wed), CSCI 5304 (Lecture Tue/Thu, Quiz Thu), ENGL 1004 (Lecture Tue/Thu).
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.py" <<'EOF'
import glob, io
def sub(path, pairs):
    with io.open(path, encoding='utf-8', newline='') as f: s = f.read()
    o = s
    for a, b in pairs:
        if a not in s: print("MISSING in", path, ":", a[:60])
        s = s.replace(a, b)
    if s != o:
        with io.open(path, 'w', encoding='utf-8', newline='') as f: f.write(s)
        print("edited", path)

# dailies + habit tracker
for p in glob.glob('10_Areas/Life/Enumerate/Daily/2026-*.md') + ['10_Areas/Life/Habits/Habit Tracker Board.md']:
    with io.open(p, encoding='utf-8', newline='') as f: t = f.read()
    if ' / ENGL 1004' in t: sub(p, [(' / ENGL 1004', '')])

sub('10_Areas/Life/Enumerate/Weekly/2026-W41.md', [
 ('Real class progress (ENGL 1004 dropped, grading criteria filled in,', 'Real class progress (grading criteria filled in,'),
 (', CSCI 5304 (Lecture Tue/Thu, Quiz Thu), ENGL 1004 (Lecture Tue/Thu).', ', CSCI 5304 (Lecture Tue/Thu, Quiz Thu).'),
])
sub('20_Progress/Degree/UMN Board.md', [
 (' ENGL 1004 was dropped, confirmed on 2026-10-09. [[ENGL 1004 Board]] retains its inactive record; one Literature/liberal education course remains.', ' One Literature/liberal education course remains to be chosen.'),
 ('[[Every Week]] excludes ENGL 1004 from active scheduling. The previously', 'The previously'),
])
sub('20_Progress/Degree/Every Week.md', [
 ('ENGL 1004 was dropped, confirmed on 2026-10-09, and its entries are excluded from this active calendar. Five weeks', 'Five weeks'),
])
sub("20_Progress/Degree/Fall'26 Syllabus.md", [
 (' [[ENGL 1004 Board]] is retained as an inactive record after the drop.', ''),
])
sub('20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md', [
 ('CSCI 4061, 5304, MGMT 3015, ENGL 1004)', 'CSCI 4061, 5304, MGMT 3015)'),
])
sub('20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md', [
 ("this is a mid-weight Fall'26 course - heavier than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s ~8.5 hrs but lighter than", "this is a mid-weight Fall'26 course, lighter than"),
])
sub('20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md', [
 ('; this is stricter than "no restriction" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]\'s total ban.', '; this is stricter than "no restriction".'),
 ('this is stricter than "no restriction" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]\'s total ban.', 'this is stricter than "no restriction".'),
])
for p in ['.claude/skills/weekly-review/weekly-review.md', '.agents/skills/weekly-review/weekly-review.md', '20_Progress/AI/Claude Code/Jarvis/.claude/skills/weekly-review/weekly-review.md']:
    sub(p, [('the 6 Fall\'26 courses (ENGL 1004, CSCI 4511W, CSCI 4061, CSCI 5304, MGMT 3015, CSCI 4521)', 'the 5 Fall\'26 courses (CSCI 4511W, CSCI 4061, CSCI 5304, MGMT 3015, CSCI 4521)'),
            (' (ENGL 1004 replaced AMES 1201 and CSCI 4511W replaced CSCI 3081W, 2026-09-09 - both archived under their old names)', ' (CSCI 4511W replaced CSCI 3081W, 2026-09-09 - archived under its old name)')])
sub('40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 8 Findings.md', [
 ('`CSCI 4061 Board.md` and `ENGL 1004 Board.md` — canonical', '`CSCI 4061 Board.md` — canonical'),
])
sub('20_Progress/Degree/Hit or Miss - Miss.md', [
 ("Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. These entries came from the earlier version of this ledger. They carry no Fall'26 grade cost and stay here only as a record: attendance missed for 2 weeks, and Journal Entries 1 and 3 submitted late.", "Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. Never studied; no Fall'26 grade cost."),
])
EOF
python -I "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.py" 2>&1 | tail -40; grep -n "ENGL" "20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md" | head
```
```
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
112:MGMT 3015's AI policy boundary::AI is allowed for research, ideation, and acknowledged assistance — but the report itself must be the student's own writing; this is stricter than "no restriction" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s total ban.
```
- `Bash`
```bash
which python3 py node 2>&1 | head
```
```
which: no py in (/c/Users/anant/bin:/mingw64/bin:/usr/local/bin:/usr/bin:/bin:/mingw64/bin:/usr/bin:/c/Users/anant/bin:/c/Users/anant/AppData/Local/Microsoft/WindowsApps/Microsoft.[REDACTED]:/c/WINDOWS/system32:/c/WINDOWS:/c/WINDOWS/System32/Wbem:/c/WINDOWS/System32/WindowsPowerShell/v1.0:/c/WINDOWS/System32/OpenSSH:/c/Program Files/NVIDIA Corporation/NVIDIA App/NvDLISR:/c/Program Files (x86)/NVIDIA Corporation/PhysX/Common:/c/Program Files/starship/bin:/c/Program Files/nodejs:/cmd:/c/Program Files/Tailscale:/c/Program Files/GitHub CLI:/c/Program Files/WSL:/c/Users/anant/.local/bin:/d/Apps/Hermes/bin:/c/Users/anant/AppData/Local/agy/bin:/c/Users/anant/AppData/Local/Programs/Jan/resources/bin:/c/Users/anant/AppData/Local/Microsoft/WindowsApps:/c/Users/anant/AppData/Local/PowerToys/DSCModules:/d/Apps/Microsoft VS Code/bin:/d/Apps/Cursor/resources/app/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe/ripgrep-15.2.[REDACTED]:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-9.0.1-full_build/bin:/c/Users/anant/AppData/Local/Programs/Cua/cua-driver/bin:/c/Users/anant/AppData/Local/Programs/DockerDesktop/resources/bin:/c/Users/anant/AppData/Local/Programs/Ollama:/c/Users/anant/AppData/Local/Microsoft/WinGet/Links:/c/Users/anant/AppData/Roaming/npm:/d/Apps/Hermes/git/cmd:/d/Apps/Hermes/git/bin:/d/Apps/Hermes/git/usr/bin:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/jqlang.jq_Microsoft.Winget.Source_8wekyb3d8bbwe:/d/AI/npm-global:/d/Apps/Obsidian:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/junegunn.fzf_Microsoft.Winget.Source_8wekyb3d8bbwe:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/sharkdp.fd_Microsoft.Winget.Source_8wekyb3d8bbwe/fd-v10.5.[REDACTED]:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/sharkdp.bat_Microsoft.Winget.Source_8wekyb3d8bbwe/bat-v0.26.[REDACTED]:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/dandavison.delta_Microsoft.Winget.Source_8wekyb3d8bbwe/delta-0.20.[REDACTED]:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/ajeetdsouza.zoxide_Microsoft.Winget.Source_8wekyb3d8bbwe:/c/Users/anant/AppData/Local/Microsoft/WinGet/Packages/pnpm.pnpm_Microsoft.Winget.Source_8wekyb3d8bbwe:/d/Apps/Microsoft VS Code/bin/copilot-shim:/usr/bin/vendor_perl:/usr/bin/core_perl)
/c/Users/anant/AppData/Local/Microsoft/WindowsApps/python3
/c/Program Files/nodejs/node
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.js" <<'EOF'
const fs = require('fs'), path = require('path');
function sub(p, pairs) {
  let s = fs.readFileSync(p, 'utf8'); const o = s;
  for (const [a, b] of pairs) { if (!s.includes(a)) console.log('MISSING in', p, ':', a.slice(0, 60)); s = s.split(a).join(b); }
  if (s !== o) { fs.writeFileSync(p, s); console.log('edited', p); }
}
const dd = '10_Areas/Life/Enumerate/Daily';
for (const f of fs.readdirSync(dd).filter(f => f.startsWith('2026-') && f.endsWith('.md')).map(f => path.join(dd, f)).concat(['10_Areas/Life/Habits/Habit Tracker Board.md'])) {
  if (fs.readFileSync(f, 'utf8').includes(' / ENGL 1004')) sub(f, [[' / ENGL 1004', '']]);
}
sub('10_Areas/Life/Enumerate/Weekly/2026-W41.md', [
 ['Real class progress (ENGL 1004 dropped, grading criteria filled in,', 'Real class progress (grading criteria filled in,'],
 [', CSCI 5304 (Lecture Tue/Thu, Quiz Thu), ENGL 1004 (Lecture Tue/Thu).', ', CSCI 5304 (Lecture Tue/Thu, Quiz Thu).'],
]);
sub('20_Progress/Degree/UMN Board.md', [
 [' ENGL 1004 was dropped, confirmed on 2026-10-09. [[ENGL 1004 Board]] retains its inactive record; one Literature/liberal education course remains.', ' One Literature/liberal education course remains to be chosen.'],
 ['[[Every Week]] excludes ENGL 1004 from active scheduling. The previously', 'The previously'],
]);
sub('20_Progress/Degree/Every Week.md', [['ENGL 1004 was dropped, confirmed on 2026-10-09, and its entries are excluded from this active calendar. Five weeks', 'Five weeks']]);
sub("20_Progress/Degree/Fall'26 Syllabus.md", [[' [[ENGL 1004 Board]] is retained as an inactive record after the drop.', '']]);
sub('20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md', [['CSCI 4061, 5304, MGMT 3015, ENGL 1004)', 'CSCI 4061, 5304, MGMT 3015)']]);
sub('20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md', [["this is a mid-weight Fall'26 course - heavier than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s ~8.5 hrs but lighter than", "this is a mid-weight Fall'26 course, lighter than"]]);
sub('20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md', [[" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s total ban.", '.']]);
for (const p of ['.claude/skills/weekly-review/weekly-review.md', '.agents/skills/weekly-review/weekly-review.md', '20_Progress/AI/Claude Code/Jarvis/.claude/skills/weekly-review/weekly-review.md'])
  sub(p, [["the 6 Fall'26 courses (ENGL 1004, CSCI 4511W,", "the 5 Fall'26 courses (CSCI 4511W,"],
          [" (ENGL 1004 replaced AMES 1201 and CSCI 4511W replaced CSCI 3081W, 2026-09-09 - both archived under their old names)", " (CSCI 4511W replaced CSCI 3081W, 2026-09-09 - archived under its old name)"]]);
sub('40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 8 Findings.md', [['`CSCI 4061 Board.md` and `ENGL 1004 Board.md` — canonical', '`CSCI 4061 Board.md` — canonical']]);
sub('20_Progress/Degree/Hit or Miss - Miss.md', [["Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. These entries came from the earlier version of this ledger. They carry no Fall'26 grade cost and stay here only as a record: attendance missed for 2 weeks, and Journal Entries 1 and 3 submitted late.", "Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. Never studied; no Fall'26 grade cost."]]);
EOF
node "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.js"
```
```
edited 10_Areas\Life\Enumerate\Daily\2026-09-15.md
edited 10_Areas\Life\Enumerate\Daily\2026-09-19.md
edited 10_Areas\Life\Enumerate\Daily\2026-09-21.md
edited 10_Areas\Life\Enumerate\Daily\2026-09-28.md
edited 10_Areas\Life\Enumerate\Daily\2026-09-29.md
edited 10_Areas\Life\Enumerate\Daily\2026-10-01.md
edited 10_Areas\Life\Enumerate\Daily\2026-10-05.md
edited 10_Areas\Life\Enumerate\Daily\2026-10-12.md
edited 10_Areas/Life/Habits/Habit Tracker Board.md
edited 10_Areas/Life/Enumerate/Weekly/2026-W41.md
edited 20_Progress/Degree/UMN Board.md
edited 20_Progress/Degree/Every Week.md
edited 20_Progress/Degree/Fall'26 Syllabus.md
edited 20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md
edited 20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md
edited 20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md
edited .claude/skills/weekly-review/weekly-review.md
edited .agents/skills/weekly-review/weekly-review.md
edited 20_Progress/AI/Claude Code/Jarvis/.claude/skills/weekly-review/weekly-review.md
edited 40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 8 Findings.md
edited 20_Progress/Degree/Hit or Miss - Miss.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && f="20_Progress/Degree/Course Production Board — Fall'26.md"; sed -n 15,20p "$f"; echo ....; sed -n 44,48p "$f"; echo ....; sed -n 55,70p "$f"; echo ....; sed -n 83,125p "$f"; echo ....; sed -n 296,350p "$f"
```
````
next: "Dispatch the Mechanical Fixes prompt first (small, unblocks nothing else but is a five-minute win), then CSCI 4061 Week 1/Week 2 since that course has the most real unused source material sitting in its source folder already"
---
# Course Production Board - Fall'26
> [!IMPORTANT] Roster correction, 2026-10-09
> ENGL 1004 has been dropped. The active roster is CSCI 4511W, CSCI 4061, CSCI 4521, CSCI 5304, and MGMT 3015. ENGL handoff prompts below are historical and must not be dispatched. Five weeks are complete; Week 6 starts Monday, 2026-10-12. Degree planning is fixed for May 2028 in [[APAS]] and [[Fall'26 Syllabus#Path to Graduation]].

....

## Mechanical Fixes (one small handoff, covers all 5 in-scope courses)

- [ ] Fix stale `D:\Users\_Anant\...` → `D:\_Anant\...` path in the Source of Truth section of: `CSCI 4061 Board.md`, `CSCI 4521 Board.md`, `CSCI 5304 Board.md`, `MGMT 3015 Board.md`, `ENGL 1004 Board.md`.
- [ ] Fix `20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md` — page title is literally `# Untitled` (line 14 of the raw [[Week Template]] that was never renamed); change to `# Week - 1`.
....
In the Jarvis vault, fix five small, verified bugs — no content production, just these fixes:
1. In each of these five files, find the "Source of Truth" section and replace every occurrence of
   the path "D:\Users\_Anant\" with "D:\_Anant\" (the old laptop had an extra "Users" folder that
   no longer exists on the current machine — the real folders now live directly under D:\_Anant\):
   - 20_Progress/Degree/CSCI 4061/CSCI 4061 Board.md
   - 20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md
   - 20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md
   - 20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md
   - 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md
   Do not touch CSCI 4511W Board.md — that course is being worked on live elsewhere.
2. In 20_Progress/Degree/CSCI 4061/Weekly/Week - 1.md, the page reads "# Untitled" on line 14 —
   change it to "# Week - 1" (a leftover from the raw Week Template that was never renamed).
3. 20_Progress/Degree/CSCI 5304/Weekly/Week - 1.md exists but is completely empty. Copy the real
   scaffold from 30_Order/Templates/Classes/Week Template.md into it (frontmatter: type: class,
   input_kind: lecture, status: seed, area: [[UMN Board]] and [[CSCI 5304 Board]], tags: #class
   #Lecture). Do not add invented lecture content — this is the scaffold-fix only.
....
- [ ] `30_Order/Workflows/Courses/Per Class/CSCI 4061 Workflow.md`
- [ ] `30_Order/Workflows/Courses/Per Class/CSCI 4521 Workflow.md`
- [ ] `30_Order/Workflows/Courses/Per Class/CSCI 5304 Workflow.md`
- [ ] `30_Order/Workflows/Courses/Per Class/MGMT 3015 Workflow.md`
- [-] `30_Order/Workflows/Courses/Per Class/ENGL 1004 Workflow.md` - course dropped; do not create.

```text
HANDOFF PROMPT — Per-Class Workflow files (do all 5 in one session; they're short and mechanical
once the pattern is clear)
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md and AGENTS.md first, then read
30_Order/Workflows/Courses/Per Class/CSCI 4511W Workflow.md in full — that is the exact shape and
depth to match for each of the five files below. Also read 30_Order/Workflows/Courses/Course
Production Workflow.md (the generic version this course-specific file sits on top of).
For each of these five courses, write 30_Order/Workflows/Courses/Per Class/<Course> Workflow.md,
built entirely from that course's own real Board note (read it in full first — it has the source
folder path, grading breakdown, schedule, and every policy needed):
- CSCI 4061 (source: 20_Progress/Degree/CSCI 4061/CSCI 4061 Board.md)
- CSCI 4521 (source: 20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md)
- CSCI 5304 (source: 20_Progress/Degree/CSCI 5304/CSCI 5304 Board.md)
- MGMT 3015 (source: 20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md)
- ENGL 1004 (source: 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md)
Each file needs: frontmatter matching the 4511W Workflow's shape (type: evergreen, tags include
the course code); a "Course shape" paragraph; an assessment-routing table (which template/workflow
each graded item uses — Weekly, Textbook, Homework, Discussion, Project, Exam Sheet as fits this
course's actual assessments, not a copy of 4511W's); a "Source hierarchy and trust" section citing
this course's real source folder; a "Weekly operating rhythm" (before/during/after lecture) section;
an assignment-workflow section per this course's actual assignment types; a "Status and handoff"
section; and "Stop-and-ask conditions" specific to this course's real unresolved questions (pull
these directly from the Board note's own flagged warnings/anomalies — CSCI 5304 has three real date
anomalies, CSCI 4521 has an unconfirmed Fall-2025-dated syllabus, MGMT 3015 has two date anomalies,
etc. — do not invent generic ones).
For ENGL 1004 specifically: this course has no Weekly/ or Textbook/ folder by design (no textbook,
whole novels assigned by date, confirmed intentional in its Preparation note) and runs on discussion
sessions, not lecture-synthesis weeks. Flag explicitly in that Workflow file whether session notes
should use the Weekly Standard shape (like MGMT 3015's Lecture/ convention) or something lighter —
this is a real open design call, not something to silently decide; state your recommendation and
mark it for user confirmation rather than just picking one silently.
Cross-link each new Workflow file from its Standard's "## Used By Workflow" list is NOT required
(the generic Standards stay course-agnostic) — but do link each new Workflow to its course Board.
Report back: which 5 files were created, and for ENGL 1004, what recommendation you left for the
user to confirm.
```

....
   own Mon/Wed pattern — preserve that flag, don't silently correct the date) the same way.
Update 20_Progress/Degree/MGMT 3015/Lecture/Weekly Board.md's Map/Status and MGMT 3015 Board.md's
next: field afterward. Do not touch Concepts/Entrepreneurship Concepts Board.md.
Report back what you found (or didn't) in the Lecture/ source folder, and whether either
assignment's rubric was locatable locally.
```

---

## ENGL 1004 - Dropped; historical handoff

**Status snapshot (2026-09-21):** Board/Preparation excellent. No `Weekly/` or `Textbook/` folder exists — **confirmed intentional**, stated directly in the course's own Preparation note (no textbook, whole novels assigned by date). This is the course that most deviates from the standard shape, and it genuinely needs a design decision before content gets produced (see the Per-Class Workflow handoff above, which is dispatched first and should resolve this). Source folder holds the syllabus PDF plus empty `Journal Entries/` and `Lecture/` folders — nothing saved locally yet for either. As of today (9/21, a Monday, this TTh course has no class), Sessions on 9/8, 9/10, 9/15, 9/17 have already happened with zero notes written.

- [-] **Blocked on the ENGL 1004 Workflow file's design recommendation** (see System Work section above) — do not create session/journal notes until that call is made (Weekly-Standard-shaped session notes vs. something lighter).
- [-] Once unblocked: session notes for 9/8 (Introduction), 9/10 (case law/state laws), 9/15 (state laws; Huckleberry Finn ch. 1-6; Journal 1 due), 9/17 (*The Camp of the Saints*).
- [-] Journal Entry tracking — needs its own design decision too (one Homework-standard note per entry vs. one consolidated tracker); flag for user alongside the Workflow file's recommendation rather than deciding silently.
- [-] No textbook notes for this course — it has none, confirmed by design.
- [-] Update Board `next:` once session notes exist.

```text
HANDOFF PROMPT — ENGL 1004 (run only after the Per-Class Workflow handoff has resolved the session-
note-shape question for this course)
Read D:\_Anant\20_Progress\Documents\Jarvis\CLAUDE.md and AGENTS.md first. Read 30_Order/Workflows/
Courses/Per Class/ENGL 1004 Workflow.md — it should already state a recommendation for how session
notes and Journal Entry tracking should be shaped for this course (it has no textbook and no
Weekly/ folder by design). If that file doesn't yet exist or doesn't contain a clear
recommendation, stop and ask the user before creating anything — do not invent a note-type
convention for this course silently.
Once the shape is confirmed: read 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md in full, and
create session notes for the four sessions that have already happened (9/8 Introduction, 9/10 case
law/state laws intro, 9/15 state laws + Huckleberry Finn ch. 1-6 + Journal 1, 9/17 The Camp of the
Saints ch. 1-3/6/11) using whichever shape was confirmed. Check
D:\_Anant\10_Areas\UMN\Classes\Lib Eds & More\ENGL 1004\Lecture\ and \Journal Entries\ for any real
saved material first — as of this board's writing both are empty, so most likely these will be
pre-session scaffolds (reading assignment, discussion questions from the syllabus) with the
in-class discussion content explicitly marked pending the user's own notes.
Update ENGL 1004 Board.md's next: field afterward.
Report back what shape was used and why.
```

---

## Execution order (recommended, not mandatory)

1. Mechanical Fixes (5 min, unblocks nothing but clears real bugs).
2. Per-Class Workflow files for the four active courses other than CSCI 4511W; exclude ENGL 1004 from historical prompts above.
3. CSCI 4061 Week 1/2 + Lab 1 — richest real source material already on disk, highest-value single session.
4. CSCI 4521 Week 1/2 — the real Jupyter notebook makes this fast and low-risk.
5. MGMT 3015 Sessions 1-3 + the two urgent homework notes (Profile is due *today*).
6. CSCI 5304 Week 1/2 — genuinely blocked on textbook notes landing first; lower priority until the user pastes Gemini output for Lectures 1-4.
7. ENGL 1004 work is cancelled because the course was dropped.
8. Textbook notes for every course, as the user pastes Gemini Notebook output per chapter — ongoing, not a one-time pass.

## Links
- [[CSCI 4511W Workflow]] — the depth/shape model every Per-Class Workflow file below should match.
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/cpb.js" <<'EOF'
const fs = require('fs');
const p = "20_Progress/Degree/Course Production Board — Fall'26.md";
let s = fs.readFileSync(p, 'utf8');
const nl = s.includes('\r\n') ? '\r\n' : '\n';
function rep(a, b) { if (!s.includes(a)) { console.log('MISSING:', a.slice(0, 70)); return; } s = s.split(a).join(b); }
rep("> [!IMPORTANT] Roster correction, 2026-10-09" + nl + "> ENGL 1004 has been dropped. The active roster is CSCI 4511W, CSCI 4061, CSCI 4521, CSCI 5304, and MGMT 3015. ENGL handoff prompts below are historical and must not be dispatched. Five weeks",
    "> [!IMPORTANT] Roster, 2026-10-09" + nl + "> The active roster is CSCI 4511W, CSCI 4061, CSCI 4521, CSCI 5304, and MGMT 3015. Five weeks");
rep("(one small handoff, covers all 5 in-scope courses)", "(one small handoff, covers the in-scope courses)");
rep(", `MGMT 3015 Board.md`, `ENGL 1004 Board.md`.", ", `MGMT 3015 Board.md`.");
rep("In each of these five files, find", "In each of these four files, find");
rep("   - 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md" + nl, "");
rep("- [-] `30_Order/Workflows/Courses/Per Class/ENGL 1004 Workflow.md` - course dropped; do not create." + nl, "");
rep("(do all 5 in one session;", "(do all 4 in one session;");
rep("For each of these five courses, write", "For each of these four courses, write");
rep("- ENGL 1004 (source: 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md)" + nl, "");
rep("Report back: which 5 files were created, and for ENGL 1004, what recommendation you left for the" + nl + "user to confirm.", "Report back: which 4 files were created.");
// drop ENGL design-call paragraph
let a = s.indexOf("For ENGL 1004 specifically:"); let b = s.indexOf("Cross-link each new Workflow file");
if (a < 0 || b < 0) console.log('MISSING para'); else s = s.slice(0, a) + s.slice(b);
// drop ENGL section
a = s.indexOf("## ENGL 1004 - Dropped; historical handoff"); b = s.indexOf("## Execution order");
if (a < 0 || b < 0) console.log('MISSING section'); else s = s.slice(0, a) + s.slice(b);
rep("other than CSCI 4511W; exclude ENGL 1004 from historical prompts above.", "other than CSCI 4511W.");
rep("7. ENGL 1004 work is cancelled because the course was dropped." + nl + "8. Textbook", "7. Textbook");
fs.writeFileSync(p, s);
EOF
node "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/cpb.js"; grep -n -i "ENGL" "20_Progress/Degree/Course Production Board — Fall'26.md"; grep -n "five\|all 5\|5 files" "20_Progress/Degree/Course Production Board — Fall'26.md" | head -20; sed -n '/^## Execution order/,$p' "20_Progress/Degree/Course Production Board — Fall'26.md" | head -14; grep -n -B3 "^## Execution order" "20_Progress/Degree/Course Production Board — Fall'26.md"
```
```
15:next: "Dispatch the Mechanical Fixes prompt first (small, unblocks nothing else but is a five-minute win), then CSCI 4061 Week 1/Week 2 since that course has the most real unused source material sitting in its source folder already"
21:==This is the single dispatch board for catching all five active Fall'26 courses up to real, source-grounded weekly/textbook/assignment notes — one task list and one ready-to-paste handoff prompt per unit of work, so any session (this one or a fresh one, any model) can pick up exactly one row and execute it correctly without re-deriving context.== This note does not execute anything itself. It is the coordination layer between the planning pass that produced it and the execution sessions that will consume it.
55:In the Jarvis vault, fix five small, verified bugs — no content production, just these fixes:
80:`30_Order/Workflows/Courses/Per Class/` currently holds only `CSCI 4511W Workflow.md`. This is the piece the user specifically flagged as needing to spread to the other five courses — the course-specific routing contract (source hierarchy, weekly rhythm, per-assessment-type routing, stop-and-ask conditions) layered on top of the generic Standards.
92:depth to match for each of the five files below. Also read 30_Order/Workflows/Courses/Course
## Execution order (recommended, not mandatory)

1. Mechanical Fixes (5 min, unblocks nothing but clears real bugs).
2. Per-Class Workflow files for the four active courses other than CSCI 4511W.
3. CSCI 4061 Week 1/2 + Lab 1 — richest real source material already on disk, highest-value single session.
4. CSCI 4521 Week 1/2 — the real Jupyter notebook makes this fast and low-risk.
5. MGMT 3015 Sessions 1-3 + the two urgent homework notes (Profile is due *today*).
6. CSCI 5304 Week 1/2 — genuinely blocked on textbook notes landing first; lower priority until the user pastes Gemini output for Lectures 1-4.
7. Textbook notes for every course, as the user pastes Gemini Notebook output per chapter — ongoing, not a one-time pass.

## Links
- [[CSCI 4511W Workflow]] — the depth/shape model every Per-Class Workflow file below should match.
- [[Course Production Workflow]], [[Weekly Workflow]] — the generic process every row above follows.
- `20_Progress/Degree/Repetitive Things.md` — the reusable Gemini Notebook chapter-production prompt (currently written for CSCI 4511W; generalizable to any course by swapping the bracketed textbook/chapter/lecture names).
292-
293----
294-
295:## Execution order (recommended, not mandatory)
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && f="20_Progress/Degree/Course Production Board — Fall'26.md" && sed -i 's/needing to spread to the other five courses/needing to spread to the other four courses/; s/depth to match for each of the five files below/depth to match for each of the four files below/' "$f" && grep -n "other four\|four files below" "$f" | cut -c1-80
# delete dedicated files
rm -rf ".stversions/20_Progress/Degree/ENGL 1004"
rm -f "60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-02 ENGL 1004 Journal Entry 3.md"
ls ".stversions/20_Progress/Degree/" | head; echo ---
grep -rIn "ENGL" --exclude-dir=50_Archive --exclude-dir=05_Clippings --exclude-dir=.git --exclude-dir=.stversions --exclude-dir=node_modules --exclude-dir=.obsidian . 2>/dev/null | grep -v -E "log\.md|\.bak|git-auto-sync\.log|Weekly Synthesis|Manual Internship" | cut -c1-200
```
```
25:Five active Fall'26 courses need their weekly notes, textbook notes, and assi
80:`30_Order/Workflows/Courses/Per Class/` currently holds only `CSCI 4511W Work
92:depth to match for each of the four files below. Also read 30_Order/Workflows
CSCI 4061
CSCI 4511W
CSCI 5304
Course Production Board — Fall'26~20261009-224822.md
Every Week~20261009-224822.md
Fall'26 Syllabus~20261009-224822.md
Repetitive Things~20261002-160319.md
UMN Board~20261009-224822.md
_Courses
---
./20_Progress/Degree/Fall'26 Syllabus.md:22:Projected active load: **18 credits across five courses**, using the existing 4-credit CSCI 4511W assumption. Verify that value against enrollment/APAS. ENG
./20_Progress/Degree/Fall'26 Syllabus.md:72:| Liberal education Literature | One course remains after ENGL 1004 was dropped | Choose an approved replacement; actual credits remain undecided. |
./20_Progress/Degree/Hit or Miss - Miss.md:34:- [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]: all five courses' grading side by side, plus the drop of ENGL 1004.
./20_Progress/Degree/Hit or Miss - Miss.md:101:### ENGL 1004 (dropped)
./40_Resources/UMN/The Plan/APAS.md:12:next: "Reconcile a fresh APAS audit after the ENGL 1004 drop, then build the Spring 2027 shortlist in Fall'26 Syllabus."
./40_Resources/UMN/The Plan/APAS.md:16:**Confirmed by Anant on 2026-10-09:** graduation is **May 2028**; ENGL 1004 has been dropped from Fall'26; one liberal education course remains. These updates su
./40_Resources/UMN/The Plan/APAS.md:20:Earned: 76 · Projected in progress after the ENGL 1004 drop: 18 · Projected remaining to reach 120 after successful F26 completion: 26.
./40_Resources/UMN/The Plan/APAS.md:24:> [!NOTE] September swaps and the subsequent ENGL 1004 drop
./40_Resources/UMN/The Plan/APAS.md:25:> AMES 1201 → ENGL 1004, and CSCI 3081W → CSCI 4511W. The September audit assigned ENGL 1004 to Literature; its subsequent drop reopens that gap. **CSCI 3081
./40_Resources/UMN/The Plan/APAS.md:60:`IP` = in progress, Fall'26. BBE 1002 (W) and MATH 1371 (D, repeated) are excluded from earned credits. ENGL 1004 is excluded from the active ledger and earns no
./40_Resources/UMN/The Plan/APAS.md:68:	- *Arts/Humanities & Literature* - **Open after the ENGL 1004 drop**. The September audit assigned ENGL 1004 to Literature; that course no longer contributes. O
./40_Resources/UMN/The Plan/APAS.md:72:**One liberal education course remains after the drop**, for the Literature gap previously assigned to ENGL 1004. The September audit also records an outstanding
./40_Resources/UMN/The Plan/APAS.md:113:The ENGL 1004 drop changes the total-credit projection and reopens Literature. CS and general-elective figures above remain the recorded September baseline; the
./40_Resources/UMN/The Plan/APAS.md:120:- [ ] Capture a fresh APAS report and verify ENGL 1004's removal, actual Fall'26 credits, Literature and WI status, CSCI 4511W's technical-elective allocation, 
./40_Resources/UMN/The Plan/Entrepreneurship Minor.md:73:MGMT 4171W remains a candidate for minor credit and upper-division WI. After ENGL 1004 was dropped, one Literature/liberal education course als
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls "D:/_Anant/10_Areas/UMN/Classes/Lib Eds & More/" 2>&1 | head; ls -d "20_Progress/Degree/ENGL 1004" 2>&1; git ls-files .stversions | head -3; git check-ignore -v ".stversions/20_Progress/Degree/ENGL 1004/ENGL 1004 Board~20261009-224822.md"; ls ".stversions/20_Progress/Degree/ENGL 1004/" 2>&1; find . -path ./50_Archive -prune -o \( -iname "*ENGL*" \) -print 2>/dev/null | grep -v "05_Clippings" | head`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && find ".stversions/20_Progress/Degree/ENGL 1004" | head -20; echo ---; ls -la "D:/_Anant/10_Areas/UMN/Classes/Lib Eds & More/ENGL 1004" | head; echo ---; grep -rIl "ENGL" --exclude-dir=50_Archive --exclude-dir=05_Clippings --exclude-dir=.git --exclude-dir=.stversions --exclude-dir=node_modules . 2>/dev/null | grep -v -E "log\.md|\.bak" | head -50`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n -o -E ".{300}ENGL 1004.{300}" "10_Areas/Life/Enumerate/Weekly/2026-W41.md" "20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md" "20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md" "60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W41.md" "60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W40.md" "40_Resources/UMN/The Plan/APAS.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 95,110p "20_Progress/Degree/Hit or Miss - Miss.md"; echo ----; sed -n 20,34p "20_Progress/Degree/UMN Board.md"; echo ----; sed -n 15,25p "20_Progress/Degree/Every Week.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && for f in "10_Areas/Life/Enumerate/Weekly/2026-W41.md:14" "20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md:90" "20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md:57" "20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md:112"; do n=${f##*:}; p=${f%:*}; echo "=== $p:$n"; sed -n "${n}p" "$p" | grep -o -E ".{0,350}ENGL 1004.{0,350}"; done; echo; sed -n 21p "10_Areas/Life/Enumerate/Weekly/2026-W41.md"`
- ``cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.py" <<'EOF' import glob, io def sub(path, pairs):     with io.open(path, encoding='utf-8', newline='') as f: s = f.read()     o = s     for a, b in pairs:         if a not in s: print("MISSING in", path, ":", a[:60])         s = s.replace(a, b)     if s != o:         with io.open(path, 'w', encoding='utf-8', newline='') as f: f.write(s)         print("edited", path)  # dailies + habit tracker for p in glob.glob('10_Areas/Life/Enumerate/Daily/2026-*.md') + ['10_Areas/Life/Habits/Habit Tracker Board.md']:     with io.open(p, encoding='utf-8', newline='') as f: t = f.read()     if ' / ENGL 1004' in t: sub(p, [(' / ENGL 1004', '')])  sub('10_Areas/Life/Enumerate/Weekly/2026-W41.md', [  ('Real class progress (ENGL 1004 dropped, grading criteria filled in,', 'Real class progress (grading criteria filled in,'),  (', CSCI 5304 (Lecture Tue/Thu, Quiz Thu), ENGL 1004 (Lecture Tue/Thu).', ', CSCI 5304 (Lecture Tue/Thu, Quiz Thu).'), ]) sub('20_Progress/Degree/UMN Board.md', [  (' ENGL 1004 was dropped, confirmed on 2026-10-09. [[ENGL 1004 Board]] retains its inactive record; one Literature/liberal education course remains.', ' One Literature/liberal education course remains to be chosen.'),  ('[[Every Week]] excludes ENGL 1004 from active scheduling. The previously', 'The previously'), ]) sub('20_Progress/Degree/Every Week.md', [  ('ENGL 1004 was dropped, confirmed on 2026-10-09, and its entries are excluded from this active calendar. Five weeks', 'Five weeks'), ]) sub("20_Progress/Degree/Fall'26 Syllabus.md", [  (' [[ENGL 1004 Board]] is retained as an inactive record after the drop.', ''), ]) sub('20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md', [  ('CSCI 4061, 5304, MGMT 3015, ENGL 1004)', 'CSCI 4061, 5304, MGMT 3015)'), ]) sub('20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md', [  ("this is a mid-weight Fall'26 course - heavier than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s ~8.5 hrs but lighter than", "this is a mid-weight Fall'26 course, lighter than"), ]) sub('20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md', [  ('; this is stricter than "no restriction" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]\'s total ban.', '; this is stricter than "no restriction".'),  ('this is stricter than "no restriction" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]\'s total ban.', 'this is stricter than "no restriction".'), ]) for p in ['.claude/skills/weekly-review/weekly-review.md', '.agents/skills/weekly-review/weekly-review.md', '20_Progress/AI/Claude Code/Jarvis/.claude/skills/weekly-review/weekly-review.md']:     sub(p, [('the 6 Fall\'26 courses (ENGL 1004, CSCI 4511W, CSCI 4061, CSCI 5304, MGMT 3015, CSCI 4521)', 'the 5 Fall\'26 courses (CSCI 4511W, CSCI 4061, CSCI 5304, MGMT 3015, CSCI 4521)'),             (' (ENGL 1004 replaced AMES 1201 and CSCI 4511W replaced CSCI 3081W, 2026-09-09 - both archived under their old names)', ' (CSCI 4511W replaced CSCI 3081W, 2026-09-09 - archived under its old name)')]) sub('40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 8 Findings.md', [  ('`CSCI 4061 Board.md` and `ENGL 1004 Board.md` — canonical', '`CSCI 4061 Board.md` — canonical'), ]) sub('20_Progress/Degree/Hit or Miss - Miss.md', [  ("Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. These entries came from the earlier version of this ledger. They carry no Fall'26 grade cost and stay here only as a record: attendance missed for 2 weeks, and Journal Entries 1 and 3 submitted late.", "Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. Never studied; no Fall'26 grade cost."), ]) EOF python -I "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.py" 2>&1 | tail -40; grep -n "ENGL" "20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md" | head``
- `which python3 py node 2>&1 | head`
- ``cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.js" <<'EOF' const fs = require('fs'), path = require('path'); function sub(p, pairs) {   let s = fs.readFileSync(p, 'utf8'); const o = s;   for (const [a, b] of pairs) { if (!s.includes(a)) console.log('MISSING in', p, ':', a.slice(0, 60)); s = s.split(a).join(b); }   if (s !== o) { fs.writeFileSync(p, s); console.log('edited', p); } } const dd = '10_Areas/Life/Enumerate/Daily'; for (const f of fs.readdirSync(dd).filter(f => f.startsWith('2026-') && f.endsWith('.md')).map(f => path.join(dd, f)).concat(['10_Areas/Life/Habits/Habit Tracker Board.md'])) {   if (fs.readFileSync(f, 'utf8').includes(' / ENGL 1004')) sub(f, [[' / ENGL 1004', '']]); } sub('10_Areas/Life/Enumerate/Weekly/2026-W41.md', [  ['Real class progress (ENGL 1004 dropped, grading criteria filled in,', 'Real class progress (grading criteria filled in,'],  [', CSCI 5304 (Lecture Tue/Thu, Quiz Thu), ENGL 1004 (Lecture Tue/Thu).', ', CSCI 5304 (Lecture Tue/Thu, Quiz Thu).'], ]); sub('20_Progress/Degree/UMN Board.md', [  [' ENGL 1004 was dropped, confirmed on 2026-10-09. [[ENGL 1004 Board]] retains its inactive record; one Literature/liberal education course remains.', ' One Literature/liberal education course remains to be chosen.'],  ['[[Every Week]] excludes ENGL 1004 from active scheduling. The previously', 'The previously'], ]); sub('20_Progress/Degree/Every Week.md', [['ENGL 1004 was dropped, confirmed on 2026-10-09, and its entries are excluded from this active calendar. Five weeks', 'Five weeks']]); sub("20_Progress/Degree/Fall'26 Syllabus.md", [[' [[ENGL 1004 Board]] is retained as an inactive record after the drop.', '']]); sub('20_Progress/Degree/CSCI 4521/CSCI 4521 Board.md', [['CSCI 4061, 5304, MGMT 3015, ENGL 1004)', 'CSCI 4061, 5304, MGMT 3015)']]); sub('20_Progress/Degree/MGMT 3015/MGMT 3015 Board.md', [["this is a mid-weight Fall'26 course - heavier than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s ~8.5 hrs but lighter than", "this is a mid-weight Fall'26 course, lighter than"]]); sub('20_Progress/Degree/MGMT 3015/Weekly/Week - 1.md', [[" and looser than [[20_Progress/Degree/ENGL 1004/ENGL 1004 Board|ENGL 1004]]'s total ban.", '.']]); for (const p of ['.claude/skills/weekly-review/weekly-review.md', '.agents/skills/weekly-review/weekly-review.md', '20_Progress/AI/Claude Code/Jarvis/.claude/skills/weekly-review/weekly-review.md'])   sub(p, [["the 6 Fall'26 courses (ENGL 1004, CSCI 4511W,", "the 5 Fall'26 courses (CSCI 4511W,"],           [" (ENGL 1004 replaced AMES 1201 and CSCI 4511W replaced CSCI 3081W, 2026-09-09 - both archived under their old names)", " (CSCI 4511W replaced CSCI 3081W, 2026-09-09 - archived under its old name)"]]); sub('40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 8 Findings.md', [['`CSCI 4061 Board.md` and `ENGL 1004 Board.md` — canonical', '`CSCI 4061 Board.md` — canonical']]); sub('20_Progress/Degree/Hit or Miss - Miss.md', [["Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. These entries came from the earlier version of this ledger. They carry no Fall'26 grade cost and stay here only as a record: attendance missed for 2 weeks, and Journal Entries 1 and 3 submitted late.", "Dropped, confirmed 2026-10-09, per [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]]. Never studied; no Fall'26 grade cost."]]); EOF node "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/clean.js"``
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && f="20_Progress/Degree/Course Production Board — Fall'26.md"; sed -n 15,20p "$f"; echo ....; sed -n 44,48p "$f"; echo ....; sed -n 55,70p "$f"; echo ....; sed -n 83,125p "$f"; echo ....; sed -n 296,350p "$f"`
- ``cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat > "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/cpb.js" <<'EOF' const fs = require('fs'); const p = "20_Progress/Degree/Course Production Board — Fall'26.md"; let s = fs.readFileSync(p, 'utf8'); const nl = s.includes('\r\n') ? '\r\n' : '\n'; function rep(a, b) { if (!s.includes(a)) { console.log('MISSING:', a.slice(0, 70)); return; } s = s.split(a).join(b); } rep("> [!IMPORTANT] Roster correction, 2026-10-09" + nl + "> ENGL 1004 has been dropped. The active roster is CSCI 4511W, CSCI 4061, CSCI 4521, CSCI 5304, and MGMT 3015. ENGL handoff prompts below are historical and must not be dispatched. Five weeks",     "> [!IMPORTANT] Roster, 2026-10-09" + nl + "> The active roster is CSCI 4511W, CSCI 4061, CSCI 4521, CSCI 5304, and MGMT 3015. Five weeks"); rep("(one small handoff, covers all 5 in-scope courses)", "(one small handoff, covers the in-scope courses)"); rep(", `MGMT 3015 Board.md`, `ENGL 1004 Board.md`.", ", `MGMT 3015 Board.md`."); rep("In each of these five files, find", "In each of these four files, find"); rep("   - 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md" + nl, ""); rep("- [-] `30_Order/Workflows/Courses/Per Class/ENGL 1004 Workflow.md` - course dropped; do not create." + nl, ""); rep("(do all 5 in one session;", "(do all 4 in one session;"); rep("For each of these five courses, write", "For each of these four courses, write"); rep("- ENGL 1004 (source: 20_Progress/Degree/ENGL 1004/ENGL 1004 Board.md)" + nl, ""); rep("Report back: which 5 files were created, and for ENGL 1004, what recommendation you left for the" + nl + "user to confirm.", "Report back: which 4 files were created."); // drop ENGL design-call paragraph let a = s.indexOf("For ENGL 1004 specifically:"); let b = s.indexOf("Cross-link each new Workflow file"); if (a < 0 || b < 0) console.log('MISSING para'); else s = s.slice(0, a) + s.slice(b); // drop ENGL section a = s.indexOf("## ENGL 1004 - Dropped; historical handoff"); b = s.indexOf("## Execution order"); if (a < 0 || b < 0) console.log('MISSING section'); else s = s.slice(0, a) + s.slice(b); rep("other than CSCI 4511W; exclude ENGL 1004 from historical prompts above.", "other than CSCI 4511W."); rep("7. ENGL 1004 work is cancelled because the course was dropped." + nl + "8. Textbook", "7. Textbook"); fs.writeFileSync(p, s); EOF node "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/762edbcb-524b-4872-b6dd-333cdc87b770/scratchpad/cpb.js"; grep -n -i "ENGL" "20_Progress/Degree/Course Production Board — Fall'26.md"; grep -n "five\|all 5\|5 files" "20_Progress/Degree/Course Production Board — Fall'26.md" | head -20; sed -n '/^## Execution order/,$p' "20_Progress/Degree/Course Production Board — Fall'26.md" | head -14; grep -n -B3 "^## Execution order" "20_Progress/Degree/Course Production Board — Fall'26.md"``
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && f="20_Progress/Degree/Course Production Board — Fall'26.md" && sed -i 's/needing to spread to the other five courses/needing to spread to the other four courses/; s/depth to match for each of the five files below/depth to match for each of the four files below/' "$f" && grep -n "other four\|four files below" "$f" | cut -c1-80 # delete dedicated files rm -rf ".stversions/20_Progress/Degree/ENGL 1004" rm -f "60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-02 ENGL 1004 Journal Entry 3.md" ls ".stversions/20_Progress/Degree/" | head; echo --- grep -rIn "ENGL" --exclude-dir=50_Archive --exclude-dir=05_Clippings --exclude-dir=.git --exclude-dir=.stversions --exclude-dir=node_modules --exclude-dir=.obsidian . 2>/dev/null | grep -v -E "log\.md|\.bak|git-auto-sync\.log|Weekly Synthesis|Manual Internship" | cut -c1-200`

