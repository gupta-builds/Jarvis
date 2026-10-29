---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - the-plan
  - ui
reference_kind: tool-profile
area:
  - "[[Daily Operating System]]"
notes:
  - "[[The Plan Overview]]"
  - "[[The Plan Dashboard Architecture and Infrastructure]]"
  - "[[The Plan Dashboard Daily Workflow and AI Loop]]"
  - "[[The Plan Dashboard State and Gaps 2026-10-25]]"
---
# The Plan Dashboard UI and What Appears
This note lists everything on The Plan's dashboard, where each number comes from, and how each part is drawn. Read it before changing the view, judging a screenshot, or deciding what the Jarvis dashboard should copy. It describes the built view in `src/ui/` as read on 2026-10-26, and marks what the design promised but nobody built. The data path behind it is in [[The Plan Dashboard Architecture and Infrastructure]].
## The surfaces
| Surface | What it is | Status |
|---|---|---|
| Home | The plugin view, command "Open dashboard", opened at launch by Homepage | Built, deployed 2026-10-13, shows zeros today because the engine finds no valid daily note |
| Monthly Dashboard | `00_Live/Monthly Dashboard.md`: one `dataviewjs` block, 17.7 KB, no `innerHTML`, built 2026-10-14 | Exists. It re-implements the parsing in JavaScript, so it is a second copy of rules the engine owns |
| Map canvas | `00_Live/Map Canvas.canvas`: 38 nodes and 34 edges linking domains, goals and the notes that own them | Exists. Jarvis's own canvas had zero edges |
| Life OS | `00_Live/Life OS.md`, the index of the personal domains | Exists |
| `00_Dashboard.md` | The old markdown page, a link list | Deleted 2026-10-14 (Decision 47). Its links moved to `Dashboards Hub.md` |
## Home: layout
One view, no page scroll. The root is a CSS grid with `overflow: hidden`, and long text is clamped to a set number of lines, so nothing can push the page past the pane. The layout is chosen from the pane's measured size:
- **Wide** when the pane is at least 720 px wide and its width is at least 1.1 times its height. Twelve columns and three rows with heights in the ratio 1.4 : 1.05 : 0.5.
- **Compact** otherwise, which includes the phone. Two columns and five rows in the ratio 1.2 : 1.6 : 1 : 0.8 : 1. The Trackers card is not drawn.
- **Type size scales with the pane.** Wide: the smaller of width/78 and height/40, between 10 and 22 px. Compact: the smaller of width/30 and height/56, between 10 and 15 px.
Placement in the wide grid:

| Card | Columns, row |
|---|---|
| Streak (hero) | 1 to 3, row 1 |
| Today | 4 to 12, row 1 |
| Last 30 days | 1 to 4, row 2 |
| Career line | 5 to 7, row 2 |
| Study line | 8 to 9, row 2 |
| Next actions | 10 to 12, row 2 |
| Trackers | 1 to 6, row 3 |
| Links | 7 to 12, row 3 |
In compact, Streak and Today and Last 30 days each take a full row, then Career and Study share row 4, and Next actions and Links share row 5.
## Home: each card
| Card | Shows | Reads | How it behaves |
|---|---|---|---|
| Streak | A large number (current streak), "Best N", "Next: 21 in 6 days", an at-risk line, and the score ring | `computeStreak` over every ISO-named daily note | "Streak breaks if today is not MET." appears in red when yesterday was a MISS and today is not yet MET. With no counted day it says the streak starts at the first note that has category actions |
| Today | Five columns, one per category, each listing that category's actions with a count such as `2/3`. The card header reads "N of 5 done" | The action lines of today's note | A tap flips the box at once, then the file write confirms or the redraw from disk reverts it. A complete category gets a green border and a faint green fill. A missing note shows "Today's note is missing (date). The evening close creates it." |
| Last 30 days | A heatmap and the legend "Darker is more categories done. Dashed outline is a forgiven miss." | The same streak result, 30 cells | Tap a cell to open that day's note, if it exists |
| Career line | The one named task, or "Not set. Use the QuickAdd choice Set tomorrow's career line." | `- Career line:` under `## Targets` | Read-only. Header shows done or open from the Career category |
| Study line | Hours as a big number and the topic | `study_hours` and `- Study topic:` | Read-only |
| Next actions | Up to five lines, each with a small pill for its `[type:: ...]` | Today's note, or yesterday's if today has none; the header then says "from 2026-10-25" | Read-only |
| Trackers | The latest line of the Health and Finance trackers, each a link | `Health Tracker.md` "Weekly log", `Finance Tracker.md` "Snapshot log" | Wide layout only |
| Links | Chips for Month, Year, Life OS, Streak rule, Daily schema, Hub | `CONFIG.links` plus the current month and year notes | Only links whose file exists are drawn |
## How the parts are drawn
- **Score ring.** An SVG circle of radius 48 in a 120 by 120 box. The arc length is done/5 of the circumference, starting at the top. The centre reads `3/5` with "TODAY" under it. The stroke is red under 3, orange at 3 and 4, green at 5, and eases over 350 ms. A single pulse plays when the count first crosses 3 and again at 5.
- **Heatmap.** An SVG of 30 rounded squares, 11 units wide with a 2-unit gap, ten per row. The fill is one of six shades by categories done (0 to 5). A forgiven miss has a dashed amber outline. Today has a solid outline in the text colour. A missing note has a faint diagonal line. Every cell has a tooltip such as "2026-10-12: 3 of 5".
- **Cards.** A 1 px hairline border, 0.7 em radius, and a background that mixes 4 percent of the accent into the Obsidian background. Titles are small uppercase letters with wide tracking in the accent colour.
- **Type.** JetBrains Mono, then the system monospace stack. Numbers use the same face, ported from the `gupta-builds` README card (large number over a small label).
- **Theme.** The view reads the `theme-light` class on the page body and watches it, so it switches with Obsidian. Surfaces and text use Obsidian's variables; the meaningful colours are fixed.

| Token | Dark | Light | Used for |
|---|---|---|---|
| accent | `#a78bfa` | `#7c5cdb` | Titles, ticks, links, pills |
| bad | `#E5534B` | `#D63B33` | Ring under 3, at-risk line |
| warn | `#F0A63A` | `#D98A12` | Ring at 3 and 4, forgiven outline |
| ok | `#5BC98A` | `#2E9E63` | Ring at 5, completed categories |
| heat 0 to 5 | `#23282F` `#1F3B31` `#25523F` `#2E7050` `#3F9468` `#5BC98A` | `#E8ECEF` `#CFE9DB` `#A7DBC1` `#7CCBA2` `#4FB583` `#2E9E63` | Heatmap shades |
The colour choices came from Anant on 2026-10-12: red, golden orange, and a light dark green. The hex values were proposed by the assistant and are still listed as not confirmed in the Decisions Log.
## How the screen was checked
- `npm test` includes view tests rendered in jsdom. They check the ring, the streak number, the at-risk text, ticking, and that nothing scrolls.
- `npm run preview` renders the real app in headless Edge and saves screenshots to `.preview-out/` at 1100x620, 1280x720 (dark and light), 1366x768, 1920x1080, and 390x844 compact. It reports clipped content and page scroll.
- Not checked: the phone, Homepage cold start, and a tick on the phone reaching the desktop.
## Promised, not built
The month strip (`Met 17 · Lost 4 · Forgiven 1` and the top cause), milestone level titles on the number, the letter grade, the Explore map, a "create today's note" button, a banner for notes in the daily folder that are not ISO-named, a screen-versus-CLI debug command, and a "next step" card that names the one command due now. The titles and grade exist in `CONFIG` and the engine, and the screen does not show them. See [[The Plan Dashboard State and Gaps 2026-10-25]].