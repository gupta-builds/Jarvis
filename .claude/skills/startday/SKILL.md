---
name: starting-day
description: Fills today's daily note from the weekly note's Goals, the calendar and the Fall 2026 plan, carries open Daily Loses forward, then patches the dashboard's focus lines. Use at the start of each working day, after the daily note exists (or to create it from the template).
---
# startday

**Usage:** `/startday`

Deep detail (exact patch formats, the Loses carry, the output block) lives in [reference.md](reference.md). This file is the step sequence; load reference.md when actually patching. The rules for the note are [[Daily Note Standard]] and the loop is [[Daily Close Loop]].

## When to Invoke

At the start of the day. The Periodic Notes plugin normally creates today's note at `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`; this skill fills it and updates `00_Dashboard.md`.

## Instructions

### Step 0 - Find Today's Note

Locate `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md` (today's date).

- Exists → Step 1.
- Missing → create it from `30_Order/Templates/Enumerate/Better Today.md` (copy frontmatter and structure verbatim), then Step 1.
- Template also missing → stop and say so. Do not improvise a shape.

Then repair the note. If `created` or `updated` still holds `<% tp.date.now(...) %>`, replace both with today's date. If a toggle or tracking key from the template is missing (`win_*`, `floor_1` to `floor_3`, `lc_count`, `study_today`, `wins_done`, `floors_done`), add it at its template default. Never create the note anywhere else. `60_Claude/30_Reviews/` is not the target.

### Step 1 - Read Plan Context

Read these files. No other reads. No vault dump.

| File | What to extract |
|------|-----------------|
| This week's note in `10_Areas/Life/Enumerate/Weekly/` (the one whose `period` is the current week; Periodic Notes names weeks `YYYY-[W]ww`, Sunday start) | `## Goals`: the day's defaults, the 80s, the Friday checkpoints, the carried table |
| `10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing.md` | The one goal and what is mandatory vs. in-service, to arbitrate a conflict |
| `10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md`: Week by week and Systems tables | This week's One Hard Thing and the daily or weekly floor per track |
| `10_Areas/Career/Internships/Tracker/Tracker.md` | Researched-vs-applied count |
| `10_Areas/Life/Habits/`: the file with a `## Daily` heading | Active daily habits |

If a file is missing, say so and continue. The Summer 2026 plan folder is closed; do not read it.

### Step 1b - Read Today's Calendar

Read only, never write. Follow [[How to Use Google Calendar]]: list today on the working calendar (the one whose id starts `c_2195`) and the primary calendar. If the connector's tools are deferred, load them first. If they are unavailable, write `Blocks: connector unavailable` and continue; never plan from memory.

### Step 2 - Read Session History and Open Loses

Read `60_Claude/07_AI_Information/Session Logs/log.md`. Take the 10 most recent `## [YYYY-MM-DD]` entries: sessions 1 to 5 in depth, 6 to 10 headline only. Build a carryover list of work left open and not closed later.

Then find every line under `## Daily Loses` in any earlier daily note that is still `- [ ]`. These are the open Loses. Never read `50_Archive`.

### Step 3 - Patch the Daily Note

Patch by heading. Never overwrite frontmatter keys that hold a value; never delete content. Exact formats: [reference.md §1](reference.md).

Fill: the summary callout; Morning Plan goal; `### 80 - The One Thing` (this week's One Hard Thing or the day's weekly Goal); `### 20 - Supporting Work`; `### Blocks` (from Step 1b); the Do NOT line (from `Anti-Drift Rules.md`); Daily Wins targets as deliverables, from the weekly Goals; Daily Floor rows from the Systems table; a deadline alert if something is due within 7 days; carryover if any.

Carry the open Loses: copy each to today's `## Daily Loses` as `- [ ]` with its original `why`, `fix`, `from` and `since`, and change the old line's `[ ]` to `[>]`. Never edit anything else in the old note.

### Step 3b - Patch the Dashboard

Patch `00_Dashboard.md` frontmatter only, no body edits, no other fields:

- `today_focus:` today's one-line headline objective
- `today_80:` the one task
- `today_20:` comma-separated supporting tasks

### Step 4 - Present the Plan

Output the compact block from [reference.md §2](reference.md), including the open Loses with their ages and the line `Dashboard updated: [[00_Dashboard]]`.

## Constraints

- Never create notes in `60_Claude/30_Reviews/` for the daily plan.
- Fill placeholders; never paste whole plan documents into the note.
- Leave room: `/closeday` appends End of Day later.
- If the Morning Plan is already filled, confirm with the user before overwriting.
- Never write a `why` for a Lose. Carry it exactly as the user wrote it.
- Never write to the calendar from this skill.
- In Step 3b touch only the three named frontmatter fields.
