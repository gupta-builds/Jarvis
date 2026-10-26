---
name: closing-day
description: Verifies today's plan from the toggles, the calendar and the weekly Goals, records every broken promise as a Daily Loses line, writes the tracking frontmatter and the scorecard into the daily note, and clears the dashboard focus lines for tomorrow. Use at the end of each working day.
---
# closeday

**Usage:** `/closeday` (or `/closeday dry-run` to show every planned write and write nothing)

Deep detail (scorecard, Loses rules, log format) lives in [reference.md](reference.md). This file is the step sequence; load reference.md when writing the scorecard. The rules for the note are [[Daily Note Standard]] and the loop is [[Daily Close Loop]].

## When to Invoke

At the end of the work day, by 10:30pm per the week's plan. Works on the daily note that `/startday` filled. The record stays in one place: no separate file is created.

## Instructions

### Step 0 - Find Today's Note

Locate `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md` (today's date).

- Exists with a Morning Plan → Step 1.
- Exists without one → ask: "No morning plan found for today. Did you run `/startday`? I can still close the day from what I can find." Then proceed.
- Missing → say so, create it from `30_Order/Templates/Enumerate/Better Today.md`, proceed with whatever session data exists.

### Step 1 - Auto-Gather (before talking to the user)

Read, in this order:
- Today's note frontmatter: the `win_*` and `floor_*` toggles. These are the evidence for wins and floors.
- Today's `## Daily Loses`, `### Blocks`, Daily Wins targets and Daily Floor rows.
- Today's entries in `60_Claude/07_AI_Information/Session Logs/log.md`
- Files modified in `20_Progress/` and created in `60_Claude/10_Source_Summaries/` today (modification time)
- Today's calendar blocks, read only ([[How to Use Google Calendar]]). If the connector is unavailable, say so and use the Blocks section.
- The weekly note's Goals and Friday checkpoints due today or earlier.

### Step 2 - Work Out the Loses (before asking)

Propose one Lose for each of these, and nothing else:
1. A `win_*` or `floor_*` toggle still `false`.
2. A calendar block that has passed with no evidence it ran (no file change, no log line, no tick).
3. A weekly Goal or Friday checkpoint due today or earlier that is not met.

Skip anything already in today's `## Daily Loses`. For each proposal, set `from` (`win`, `floor`, `calendar` or `weekly`) and `since` today. Never fill `why` or `fix` yourself.

### Step 3 - Ask the User (one block, all at once)

> Closing the day. The toggles show wins N/4 and floor N/3. Quick check:
> 1. LeetCode/CodePath or CSCI 4041 today: how many problems? (target 5)
> 2. Study hours today: total focused time? (e.g., 2.5)
> 3. Anything the toggles miss: something done but not ticked, or ticked without proof?
> 4. For each loss below: why did it slip (why, how, where), and what one change fixes it?
>    - [each proposed Lose, one per line]
> 5. Anything blocked or carried forward?

Accept free text. A missing `why` becomes `(unanswered)`. A missing answer to 1 or 2 leaves the field and marks the scorecard row "(unverified)". Do not tick a toggle for the user.

### Step 4 - Write Tracking Frontmatter to the Daily Note

Update these keys in today's note (they exist from the template; never add duplicates):

```yaml
lc_count: <number>
study_today: <hours>
wins_done: <count of win_* that are true, 0-4>
floors_done: <count of floor_* that are true, 0-3>
day_state: closed
status: complete
updated: <today>
```

`wins_done` and `floors_done` are counted, never asked.

### Step 5 - Write the Loses

Append each confirmed Lose under `## Daily Loses` in the line format of [reference.md §3](reference.md). Never delete or reword an existing Lose. Mark `[x]` on an open Lose only when the user says it was made up today.

### Step 6 - Clear the Dashboard Focus Lines

Patch `00_Dashboard.md` frontmatter only:

```yaml
today_focus: ""
today_80: ""
today_20: ""
```

Touch no other field. The dashboard holds no numbers of its own.

### Step 7 - Score and Append the Scorecard

Append the End of Day section (template and GREEN/RED rules: [reference.md §1](reference.md)) below the Morning Plan. Never modify the Morning Plan itself.

### Step 8 - Log the Session

Append the closeday entry to `60_Claude/07_AI_Information/Session Logs/log.md` using [reference.md §2](reference.md).

## Constraints

- Never create `60_Claude/30_Reviews/Closeday - YYYY-MM-DD.md`. The daily note is the record.
- Only append below the Morning Plan; if a scorecard already exists, ask before overwriting.
- Be honest about what you can and can't verify. Don't fake checkmarks.
- Show every planned write (path, heading, lines) and wait for a yes before Step 4.
- Never write to the calendar. A missed block is a Lose and, if the user wants it moved, a separate step under the calendar guide's rules.
- Steps 4 and 6 touch frontmatter keys only. Step 5 only appends lines.
