---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - the-plan
  - workflow
reference_kind: resource
area:
  - "[[Daily Operating System]]"
notes:
  - "[[The Plan Overview]]"
  - "[[The Plan Dashboard Architecture and Infrastructure]]"
  - "[[The Plan Dashboard UI and What Appears]]"
  - "[[The Plan Dashboard State and Gaps 2026-10-25]]"
  - "[[Daily Close Loop]]"
---
# The Plan Dashboard Daily Workflow and AI Loop
This note explains the day as The Plan runs it: the daily note's shape, the streak rule, the skills, agents and hooks around it, and the reviews that read it. Read it to see what the dashboard is a view of, and to compare with Jarvis's own loop in [[Daily Close Loop]]. The rules live in The Plan's `30_Order/Standards/Dashboards/` (`Daily Note Schema`, `Streak Rule`, `Weekly Review`, `Monthly Review`, `Scheduled Review`) and `30_Order/Workflows/Daily Dashboard.md`. This note summarises them as read on 2026-10-26.
## The daily note
File `00_Live/Enumerate/Daily/YYYY-MM-DD.md`. Frontmatter stays at four keys: `type: daily`, `status: seed`, `created`, `study_hours`. Ticking state and scores never go in frontmatter. The body has nine headings in a fixed order:

| Heading | Holds |
|---|---|
| `## Targets` | `- Career line: ...` (one named task, never repeated from yesterday) and `- Study topic: ...` |
| `## Morning`, `## Study`, `## Fitness`, `## Mind`, `## Career` | Action lines that end in a category field |
| `## Evening close` | One line per missed category: `- [miss:: morning] [cause:: sleep]` |
| `## Next actions` | At most five lines for tomorrow, each ending in `[type:: streak]`, `[type:: career]`, `[type:: gym]` or `[type:: failure]` |
| `## Intake` | Reserved for the automation layers, empty |
An action line has one fixed form, taken from Atomic Habits, and ends in its category so that rewording never breaks the count:
`- [ ] I will move around at 8 am in my room so that I can become a morning person. [cat:: morning]`
The default actions: Morning has three (move at 8 am, read 12 pages, plan the day for 20 minutes), Study one (a block at 2 pm), Fitness two (gym at 5:30, water and creatine), Mind two (mindset content instead of doomscrolling, the no-smoking gate before planning, breakfast and the first task), and Career one (the career line). A category is done only when it has at least one action and every action in it is ticked. Tables are never used for ticking.
Cause tags are `sleep`, `no-plan`, `distracted`, `energy`, `other`. A new tag needs a Decisions Log entry first, and the list lives in the QuickAdd picker, the `/closeday` prompt and the validator.
## The streak
A day is MET at 3 of 5 categories and MISS below that or when no note exists. One MISS between two MET days is forgiven: it adds nothing and does not reset the run. Two MISS in a row set the streak to 0. Today is never a MISS until the date has passed. The best streak counts closed days only (Decision 48). Milestones are 3, 7, 21, 66 and 100, with titles "The beginning", "Toward 21", "Now it gets hard", "Work pays off" and "Consistency, discipline, mindset" (Decision 41). The streak starts at the first note that has category actions, so older notes never count. The score ring is red under 3, orange at 3 and 4, green at 5.
## The day
| When | Step | Tool | Result |
|---|---|---|---|
| Night before | Set tomorrow's career line and study topic | `/closeday` or the QuickAdd choice "Set tomorrow's career line" | Tomorrow's note exists with its targets |
| Morning | Open the day | `/startday` | Streak and category counts shown exactly as the engine returns them; a missing career line or study topic flagged; unticked actions listed |
| During the day | Tick actions; log study hours | Home or the note | Ticked boxes; one number in `study_hours` |
| Evening | Close the day | `/closeday` | Missed categories, one cause word each, up to five next actions checked by the engine's `repeat`, tomorrow's note created |
`/startday` writes only a missing target after a yes. `/closeday` shows every planned write (path, heading, lines), waits for a yes, creates tomorrow's note without overwriting one that exists, and then runs `plan-cli validate` on both notes. It never rewrites a note to fix a validation failure. The phone can tick and run the two QuickAdd choices; it cannot run the skills. Phone behaviour has not been tested.
## Skills, agents, hooks
| Kind | Parts | Rule |
|---|---|---|
| Skills (directories with `SKILL.md` and `reference.md`) | `startday`, `closeday`, `weekly-review`, `monthly-review`, `jarvis-dump` | A skill is a command Anant runs and may write one named place. Each supports `dry-run` |
| Agents (read-only, tools `Read, Grep, Glob`) | `daily-auditor`, `review-analyst`, `skeptic`; `vault-curator` as a folder | An agent judges and reports and never writes. The caller supplies engine output |
| Hooks (one program, `plan-cli hook`) | write guard, secrets guard, daily-note validator | A hook blocks or reports and never rewrites. The guards fail closed |
| Engine | `plan-cli` | The only source of numbers. A model never estimates one |
| QuickAdd | "Set tomorrow's career line", "Log a miss" | Phone shortcuts, steps in `30_Order/System/streak/QuickAdd Setup.md` |
`jarvis-dump` copies chosen Jarvis notes into `60_Jarvis/10_Promoted_Notes` with `source_path`, `dumped` and `status: unreviewed`. It copies and never moves, and one approval covers one listed batch. The Monthly review asks for a note named `Jarvis Snapshot YYYY-MM`, which Jarvis writes and `jarvis-dump` carries across.
## Reviews
- **Weekly.** `/weekly-review` runs the engine's `review` for the week and writes one entry under `## Review Log` in the Weekly note: days MET, percent, letter, cause counts, one keep, one stop, one start, one decision. Grade bands: A at 90 percent, B at 75, C at 60, D at 40, F below (Decision 37).
- **Monthly.** `/monthly-review` does the same for the month, adds the trend and a request for the Jarvis snapshot, and writes under `## Review Log` in the Monthly note. A finished month stays in `00_Live/Enumerate` until a new year begins (Decision 46).
- **Cadence.** Due after the Sunday close and on the 1st. These are working defaults. Unattended scheduled runs are decided for the weekly and monthly reviews only and are not built: nothing is scheduled today (Decision 40).
- **Note on weeks.** The Weekly standard defines an ISO week, Monday to Sunday. Periodic Notes names weeks with `YYYY-[W]ww`, a Sunday-start count. The two disagree for one day each week, which matters when a skill looks up "this week's note".
## Automation layers, as designed and not built
`Spec - Automation Layers` reserved the `## Intake` heading and laid out three layers: a daily layer from the vault to phone reminders, a weekly layer that pulls Google Calendar and Todoist into the Weekly note, and a monthly layer on the 1st that closes the previous month. Hard constraints already verified: a cloud job cannot write a note into the vault ([[The Plan Dashboard Architecture and Infrastructure]]), Obsidian's Local REST API needs the app open, and Apple Reminders has no Windows API. Two task systems feeding one note will duplicate tasks, so each task type needs a single owner before both are connected. Sessions 1 (Plans) and 2 (Automation) in `Prompts.md` were written to design this and did not produce their notes.
## What differs from Jarvis
Jarvis counts four wins and three floor rows by toggle, keeps a Loses list, and reads the weekly note and the calendar at `/startday`. The Plan counts categories and keeps a streak with a forgiven miss, and holds the cause of a miss as one word. Neither vault stores a number in a dashboard. Compare [[Jarvis Build Overview]].