---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - ui
project_kind: spec
next: "Design final. A build session measures the real full-screen pane size on each laptop first"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Carry Forward]]"
  - "[[Jarvis Research - Outside Sources]]"
---
# Jarvis Spec - Dashboard Page
## What This Is
==The Jarvis dashboard is one page that never scrolls vertically, shows the whole working day at a glance, lets Anant tick and edit in place, and rewards a day done right with a number that grows.==
It is a view inside the `jarvis-dashboard` plugin. It replaces `00_Dashboard.md` and `10_Areas/Jarvis OS Dashboard.canvas` ([[Jarvis Decisions Log]] D23). The data it reads is defined in [[Jarvis Spec - Day Model and Streak]]. What it keeps from the old page is in [[Jarvis Spec - Carry Forward]].

## Current State
Checked on 2026-10-26.
- The page is a markdown note with DataviewJS, Meta Bind and Multi-Column Markdown, plus a canvas. Homepage opens the canvas. Both hold the same queries by hand, which [[Jarvis Dashboard Build Record]] lists as known drift.
- The plugin is not built. The Plan's plugin is the reference: a React view with a scaled grid and inline SVG. Its screens have never been shown real data, because its notes were misnamed ([[Jarvis Research - The Plan Parallel Builds]]).
- It opens only inside Obsidian, full screen, on the Dell and the Acer ([[Jarvis Decisions Log]] D2, D28).

## The rules of the page
1. **No vertical scroll, anywhere.** The root and every card use `overflow: hidden` on the vertical axis. No `overflow-y: auto` or `scroll` exists in the styles.
2. **Horizontal scroll only for written text.** A line Anant wrote (an 80, a 20, a Lose, a block title, a proof line) is one row with `white-space: nowrap` and `overflow-x: auto`, scrollbar hidden. It scrolls by wheel, drag, touchpad or keyboard. Numbers, labels, rings, the heatmap, chips and buttons never scroll in either direction.
3. **The page scales to fit.** The grid and the font size follow the pane size, so every card fits at any full-screen size above a minimum. Below the minimum a plain banner reads "Window too small". Nothing is hidden to make it fit.
4. **Everything that ticks stays live.** A tick is one click or the space key. The row changes at once, and the redraw from disk confirms or reverts it.
5. **Everything written can be edited in place.** Double-click a line to edit its text. Enter saves, Escape cancels. The save uses the same stale-line check as a tick, and fields such as `[for:: 80]` are kept ([[Jarvis Decisions Log]] D45).
6. **Plain words.** No praise and no guilt. A miss reads "Day 2 of miss. Streak breaks tomorrow." with numbers.
7. **Every number comes from the engine.** The page computes nothing the engine does not.

## Blocks on the page
| Block | Shows | Source | Interaction |
|---|---|---|---|
| Hero | Streak number, builder level with the next milestone and days to go, floor ring (rows done of rows), wins ring (0 to 4), an at-risk line, the seven day row (Monday to Sunday, today outlined) and one line of week totals (wins, floors, problems, study hours) | Engine | None |
| Today | The 80, then the 20, each a tick row with its plan pointer | Daily note | Tick, double-click to edit, click the pointer to open the plan |
| Blocks | The block running now, the next one, planned against tracked minutes, then deadlines due in 7 days | `### Blocks` and `[due::]` on weekly Goals | Tick a block, click to open |
| Loses and carryover | Open Loses oldest first with age and the count out of 7, then carried work from the session log | `## Daily Loses`, `## Carryover from Previous Sessions` | Tick a Lose to `[x]`, double-click to edit |
| Pipeline | Applications today and this week out of 10, LeetCode out of 5, study hours | Tracker `date_applied`, `lc_count`, `study_today` | Plus and minus on the two numbers |
| Projects | Three chips, each an active project's `next:` line | Project notes' frontmatter | Click opens the project note |
| Heatmap | The last 30 days of floor rows done, today outlined, forgiven days dashed, missing notes faint | Engine | Click a day to open its note |
| Proof | Yesterday's proof line and today's proof field | `[proof::]` | Type one line, Enter saves |
| Health chip | Green when clean, red with a count otherwise | `validate`, `doctor` | Click opens the list as a note |
| Links | Chips for the system notes, Mentorship Board and the plan notes | Config | Click opens |

Not on the page: the clippings count (weekly review), the areas table and the old sync banner ([[Jarvis Spec - Carry Forward]]).

## Layout
Two layouts chosen by pane shape. The wide layout is the target, because the page runs in full-screen Obsidian.

```
+------------------+----------------------------------+------------------+
| HERO             | TODAY: the 80 and the 20         | LOSES, n of 7    |
| streak, level    |                                  | and carryover    |
| floor ring       +----------------------------------+                  |
| wins ring        | BLOCKS: now, next, due soon      |                  |
| 7 day row        |                                  |                  |
+------------------+----------------------------------+------------------+
| PIPELINE: applications, LeetCode, study hours | PROJECTS chips          |
+-----------------------------------------------+-------------------------+
| HEATMAP, 30 days             | PROOF            | HEALTH chip | LINKS   |
+------------------------------+------------------+-------------+---------+
```

The compact layout is two columns. It holds the same blocks and appears only when a split or sidebar makes the pane narrow, below about 720 px wide. It is not a phone layout ([[Jarvis Decisions Log]] Correction 7).

Row limits keep each card inside its cell at the minimum font size: the 80 is one row, the 20 at most four, blocks at most eight, visible Loses at most seven (the cap itself), project chips three.

## Scaling and window sizes
- The root measures its pane with a ResizeObserver. Font size is the smaller of a width term and a height term, clamped between 11 px and 22 px. The constants are fixed in the build against the sizes below.
- CSS container query units (`cqw`, `cqh`) are an alternative. They are supported in current Chromium, Safari and Firefox ([[Jarvis Research - Outside Sources]]), and Obsidian's embedded Chromium version is unverified, so the plan is measured scaling as The Plan does.
- Sizes to hold: full-screen Obsidian on each laptop with sidebars closed. Each laptop's real view size is read once with a debug command that prints the view's `clientWidth` and `clientHeight`. Until then the fixtures are 1920 by 1080, 1536 by 864 and 1366 by 768 less about 40 px of window chrome, which are common Windows laptop sizes and are an assumption.
- Below 11 px the "Window too small" banner shows.

## Visual system
- Colours are CSS variables defined in `styles.css` under the class prefix `jd-`, mapped to Obsidian's theme variables so light and dark follow the theme. No colour is hard coded in a script, and a test greps the bundle for hex colours, because The Plan's build broke this rule.
- Tokens: surface, text, muted text, accent, good, warning, bad, and a six step ramp for the heatmap.
- The floor ring is red at 0 rows done, orange from 1 row to all rows minus one, and green when all rows are done.
- Big numbers use the monospace font with tabular digits.
- The ring animates over 350 ms and pulses once when it completes. `prefers-reduced-motion` turns both off.
- Every interactive row is a button with a visible focus ring and works from the keyboard. The plugin ships no default hotkeys.
- Text contrast meets 4.5 to 1 in both themes. A test computes it for each token pair.
- No `innerHTML`, no inline colour styles.

## Delight, kept small
- **Builder levels.** The title sits beside the streak and changes at 3, 7, 21, 66 and 100. The research on intact streaks is in [[Jarvis Research - Outside Sources]]. The page shows the intact streak and never a "broken" count.
- **Proof of the day.** Yesterday's proof shows as "Yesterday you proved: ...". Writing today's takes one line.
- **Heatmap.** Thirty days, ten columns by three rows in the wide layout and six by five in the compact one.
- **Pipeline momentum.** "Applications this week: 4 of 10", with the gap stated plainly.

## States and errors
| State | What the page shows |
|---|---|
| Today's note is missing | An empty floor ring and a "Create today's note" button that builds `YYYY-MM-DD.md` from the template |
| A note in the Daily folder is misnamed | A red banner with the file name and the correct name. The engine ignores the note. |
| A note has a leftover `<% %>` date | A banner naming the note |
| The window is too small | The banner from rule 3 |
| Blocks are missing or the calendar was unavailable | "Blocks not loaded today. Run /startday." |
| More than 7 open Loses | The chip shows 7 of 7 in red and the eighth is refused at close. If older notes already hold more, the page shows the oldest 7 and a "+N more" chip that opens the oldest in its note. |
| Time records are not defined or unreadable | The Blocks card shows planned time only |
| The engine and the screen disagree | The health chip turns red and a debug command prints both |
| The term has ended | A red health chip until the config has a new term |

## Performance
Cold launch to a visible page in under 2 seconds on both laptops, as in The Plan's budget. A tick redraws the Hero, Today, Pipeline and Heatmap within one second. The Hero and Today render first and the rest follow.

## How the page is tested
A layout engine is needed, which jsdom does not have. Three layers:
1. A style test: no `overflow-y: auto` or `scroll` anywhere, and every card has `overflow: hidden`.
2. A real-browser test: the built bundle in a static harness page under headless Chromium, at the three fixture sizes, asserting that the root and each card have `scrollHeight` not above `clientHeight`, with worst-case fixtures (7 Loses, 4 twenties, 8 blocks, long text lines). Playwright is the candidate. It has not been verified here.
3. A live check: a debug command in Obsidian prints `scrollHeight` and `clientHeight` for the root and each card at the laptop's real full-screen size.

## Non-Goals
- No vertical scroll, no tabs and no pop-up pages that scroll.
- No calls to Google, Todoist, Toggl or any outside service from the plugin.
- No personal-life content: no health, meals, water or relationships.
- No phone build and no phone layout.
- No chart that cannot be read at the minimum size.
- No default hotkeys.

## Open Questions
None blocking the build. The real pane sizes are measured at the start of the build, as planned above.
