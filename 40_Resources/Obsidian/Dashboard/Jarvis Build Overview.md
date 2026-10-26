---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
reference_kind: resource
area:
  - "[[Daily Operating System]]"
notes:
  - "[[The Plan Overview]]"
  - "[[Jarvis Dashboard Build Record]]"
  - "[[Daily Note Standard]]"
  - "[[Daily Close Loop]]"
  - "[[Dataview and Dashboards]]"
---
# Jarvis Build Overview
This note says what the Jarvis dashboard is made of, what appears on it, and how the daily workflow feeds it. Read it before changing `00_Dashboard.md`, the homepage canvas, `Better Today`, or the `/startday` and `/closeday` skills. The dated history of how it got here is in [[Jarvis Dashboard Build Record]]. The Plan's dashboard is a different build: [[The Plan Overview]].
## Layers
| Layer | What it is | Where |
|---|---|---|
| Data | One daily note per day. Frontmatter booleans for the toggles, typed numbers for problems and study hours, and a `## Daily Loses` list | `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`, shaped by [[Daily Note Standard]] and [[Better Today]] |
| Query | DataviewJS blocks that read today's note and every note's open Loses. Nothing is stored in the dashboard | `00_Dashboard.md` and `10_Areas/Jarvis OS Dashboard.canvas` |
| Input | Meta Bind `INPUT[...]` fields: toggles bound to frontmatter booleans, numbers for `lc_count` and `study_today`, text for the three focus lines | The daily note and the dashboard's own frontmatter |
| Look | `.obsidian/snippets/dashboard.css` (`.stat-grid`, `.stat-tile`, `.progress-wrap`), the AnuPpuccin theme, Multi-Column Markdown for the two-column page | `.obsidian/snippets/` |
| Open | Homepage opens the canvas on startup, replacing open notes. `00_Dashboard.md` is the markdown twin, linked from the canvas | `.obsidian/plugins/homepage/data.json` |
| Writers | `/startday` fills the plan and carries Loses. `/closeday` counts the toggles and writes Loses. Both patch the three `today_*` focus lines | `.claude/skills/startday/`, `.claude/skills/closeday/` |
Plugin versions on 2026-10-26: Dataview 0.5.68, Meta Bind 1.5.1, Multi-Column Markdown 0.9.1, Homepage 4.5.0, Templater 2.26.0, Periodic Notes 0.0.17, QuickAdd 2.32.1.
## What appears, and where each number comes from
| On screen | Source | Rule |
|---|---|---|
| Today's focus, the 80, the 20 | `today_focus`, `today_80`, `today_20` in `00_Dashboard.md` | Patched by `/startday`, cleared by `/closeday`. The only fields the dashboard owns |
| Wins `n/4`, Floor `n/3` | `win_*` and `floor_*` toggles in today's note | Counted live. A tile turns green at 4 of 4 wins or 3 of 3 floor |
| Problems | `lc_count` in today's note | Typed. Green at 5 |
| Study hours | `study_today` in today's note | Typed |
| Open Loses | Every unchecked task under `## Daily Loses` in any daily note | Sorted oldest first, with the age from `since`. Ticking in the list should write back to the source line, as Dataview task queries do; not yet confirmed for `dv.taskList` here |
| This week | Notes from Monday to today | Sums problems and study hours, counts toggles against `days x 4` and `days x 3` |
| Today's priorities | Unchecked tasks in today's note outside Daily Loses | First eight |
| Active projects, internship pipeline, clippings queue, vault health | Dataview over `20_Progress`, `10_Areas/Career/Internships`, `60_Claude/05_Clippings`, and notes missing `type` or `status` | Unchanged by the 2026-10-26 rebuild |
## Why the toggles are frontmatter
Obsidian does not render task checkboxes inside table cells. On 2026-07-10 the Wins and Floor tables used plain `[ ]` text that never ticked. The fix put a Meta Bind toggle in each cell, bound to a boolean such as `win_project`, so a tick persists in the note. The cost is that a toggle is only evidence if something reads it. Until 2026-10-26 nothing did: `wins_done` was a number typed by hand and `/closeday` asked for it in chat. Now the dashboard counts the booleans and `/closeday` writes the counts from them.
## What Anant does to run it
1. `/startday` in the morning. Read the plan, the blocks and the open Loses it prints.
2. Tick a toggle only when the thing is done. Write a Lose when a promise slips, with the `why` in your own words.
3. `/closeday` before 10:30pm. Answer one question block: the counts, and a `why` and a `fix` for each proposed Lose.
4. Turn on Templater's "Trigger Templater on new file creation" so new daily notes get a real `created` date. Today `/startday` repairs the date, and that setting is the permanent fix.
## Known drift to watch
- Two landing pages hold the same queries: the canvas and `00_Dashboard.md`. Both were updated on 2026-10-26. Keep one and link to it when convenient.
- `.agents/skills/startday` and `closeday` are older copies of the `.claude` skills and already differed before 2026-10-26. They were not changed.
- Inline DataviewJS is off in settings. Daily notes must not rely on a `$=` expression.