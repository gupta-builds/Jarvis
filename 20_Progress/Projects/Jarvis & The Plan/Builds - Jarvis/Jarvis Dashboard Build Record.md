---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - jarvis
  - dashboard
  - build-record
project_kind: spec
next: Turn on Templater's "Trigger Templater on new file creation", run /startday and /closeday once on a real day, and name the first closed daily as the Daily Note Standard's gold example.
related_progress:
  - '[[Jarvis Build History - July to October 2026]]'
  - '[[Jarvis Build Overview]]'
  - '[[The Plan Overview]]'
  - '[[Daily Note Standard]]'
  - '[[Daily Close Loop]]'
---
# Jarvis Dashboard Build Record
## What This Is
==This is the dated record of how Jarvis's daily dashboard and daily-note workflow were built and rebuilt, July to October 2026, kept so the next change starts from what exists and not from a memory of it.==
It covers `00_Dashboard.md`, the homepage canvas, the daily note and its template, and the `/startday` and `/closeday` skills. What each part is and what it shows is in [[Jarvis Build Overview]]. The infrastructure around it (sync, tasks, memory) is in [[Jarvis Build History - July to October 2026]] and [[Jarvis Current State - 2026-10-17]]. The Plan's dashboard is a separate build: [[The Plan Overview]].
## Current State
### Chronology
| Date | Build | How | Evidence |
|---|---|---|---|
| 2026-04-23 | `00_Dashboard.md` created | A markdown page with a Dataview list | Frontmatter `created` |
| 2026-07-02 and 07-03 | First dashboard pass with Fable 5 | Meta Bind inputs bound to frontmatter targets, a weekly DataviewJS roll-up, `dashboard.css` with `.stat-tile` and `.card`, a write-guard allowlist for daily-operations paths, directory skills, five agents | `Fable Prompt - Dashboard and Ingestion Pass`, "What was done in Pass 1" |
| 2026-07-04 | Visual rebuild | `10_Areas/Jarvis OS Dashboard.canvas` rebuilt at 1600 px with ten text nodes and no edges. The brief's Meta Bind syntax `file(00_Dashboard)` does not exist; the session read the plugin docs and used `INPUT[text:00_Dashboard#today_focus]`. Homepage was repointed at the canvas by editing `.obsidian/plugins/homepage/data.json`. A second canvas, an Excalidraw Claude OS map, and `dashboard.css` additions for the progress bar and tile colours followed. `00_Dashboard.md` was rebuilt as a Multi-Column Markdown page | `07-04 Rebuild Jarvis dashboard canvas and Excalidraw OS map` |
| 2026-07-08 | Skill repair | `startday` still read a deleted habit board; both skills counted five wins after the Physical win moved to The Plan. Fixed to four wins and the current board | `07-08 Fix corrupted daily note template and habit tracker` |
| 2026-07-10 | Tickable Done column | Obsidian does not render checkboxes inside table cells. Each Done cell became a Meta Bind toggle bound to a frontmatter boolean (`win_project`, `win_career`, `win_cleanup`, `win_review`, then Summer `ac_*`) | `07-10 Fix untickable checklist in table` |
| 2026-09-15 | Fall 2026 layout | Headings `Fall Daily Wins` and `Fall Daily Floor`, three floor rows (application, LeetCode/CodePath, class step) | `09-15 Fall 2026 semester planning and vault setup` |
| 2026-09-20 | DataviewJS risk audit | Every dashboard block read and judged read-and-render. The `innerHTML` pattern is safe only while the interpolated values are numbers | [[Dataview and Dashboards]] |
| 2026-10-04 | Sync banner | Competing dashboard writers replaced by per-machine banner files and a stable embed at the top of `00_Dashboard.md` | Sync Build 11 in [[Jarvis Build History - July to October 2026]] |
| 2026-10-16 | Standard and Workflow | [[Daily Note Standard]] and [[Daily Close Loop]] created; the template mapped to the registry | Both notes' `created` |
| 2026-10-25 | Time layer | The W44 calendar rebuild and [[How to Use Google Calendar]]: events in a five-line format on the working calendar | The guide's frontmatter |
| 2026-10-26 | Daily workflow rebuild | See below | This note |
### The 2026-10-26 findings
1. **The Done toggles fed nothing.** No skill, query, script or canvas read `win_*` or `floor_*`. `wins_done` was a number typed by hand, and `/closeday` asked for it in chat.
2. **Two dashboards, one stale.** `00_Dashboard.md` and the homepage canvas held the same queries by hand. Both read `lc_today`, `wins_done` and `study_today` from the dashboard's own frontmatter, last set on 2026-10-09, while the daily notes used `lc_count`. The week total never saw today.
3. **Unrendered dates.** Six dailies carried `<% tp.date.now(...) %>` in `created` or `updated`, including today's. Periodic Notes copies the template, and Templater's "Trigger Templater on new file creation" is off in `data.json`, so the placeholder is never resolved.
4. **Template and Standard disagreed.** The template had the invalid key `wins:loses (ratio):`, used `study_hours` where everything else used `study_today`, and had no `win_*` or `floor_*` keys to bind to.
5. **Daily Loses was free text.** Nothing carried an unfinished promise forward or showed its age.
6. **The skills did not know the week.** `/startday` and `/closeday` read the Fall plan and the session log, not the weekly note's Goals or the calendar.
### What changed
- **Template** [[Better Today]]: frontmatter now holds the seven toggles, `lc_count`, `study_today`, `wins_done`, `floors_done`. Morning Plan gains a `### Blocks` heading and checkbox 80 and 20 lines. Daily Loses gets its line format. The typed "Wins hit" input is gone.
- **Standard and Workflow**: [[Daily Note Standard]] now says what each toggle feeds and defines Daily Loses: a task line with `why`, `fix`, `from` and `since`, and four marks (`[ ]` open, `[x]` made up, `[>]` carried, `[-]` dropped). [[Daily Close Loop]] was rewritten around the weekly note, the calendar, the toggles and the Loses. Both pass `vault-lint --kit` apart from the template's old table-body warnings.
- **Dashboard and canvas**: both now read only today's daily note and every note's open Loses. Wins `n/4`, Floor `n/3`, problems, study hours and open Loses are tiles; the old habit bar and static habit list are replaced by a Wins and Floor bar and an aged Loses list. `lc_today`, `study_today` and `wins_done` were removed from the dashboard's frontmatter, which now holds only the three `today_*` lines.
- **Skills**: `/startday` repairs leftover placeholders, reads the weekly Goals and today's calendar (read only), and carries open Loses forward by copying the line and marking the old one `[>]`. `/closeday` reads the toggles as evidence, proposes a Lose for each false toggle, passed block and unmet Goal, asks only for counts and each `why` and `fix`, and writes `wins_done` and `floors_done` as counts. The `daily-operator` agent and two skill-table notes were updated to match.
- **Notes repaired**: today's note was moved to the new shape with the existing Lose kept word for word, and the five older dailies had their dates resolved from the file name.
### Not done
- Templater's setting is under `.obsidian`, so it is Anant's to switch on.
- The copies in `.agents/skills/startday` and `.agents/skills/closeday` already differed from the `.claude` skills and were left alone.
- Nothing was run end to end on a real day. The `dataviewjs` blocks were syntax-checked with Node and not rendered in Obsidian. Ticking a task from `dv.taskList` is not yet confirmed to write back.
- Changes are not committed.
## Non-Goals
- The automation layer: Toggl time, phone screen time, calendar writes. It is designed in a separate step and nothing here depends on it.
- Any change to The Plan's vault. Cross-vault reads go through `/jarvis-dump` there, never writes.
- Merging the canvas and the markdown page into one landing page. That is worth doing and was not asked.
## Open Questions
- [ ] Should Jarvis keep two landing pages, or point the canvas at the markdown page?
- [ ] Does a tick from the Daily Loses list on the dashboard write back to its source note?
- [ ] Should the weekly review use the Sunday-start week that Periodic Notes names, or an ISO week as The Plan's standard says?
