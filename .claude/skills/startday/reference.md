# startday - reference

Loaded on demand from SKILL.md. Contents:
1. Per-heading patch formats for the daily note
2. Step 4 output template

## §1 Per-heading patch formats

All patches go into `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`. Use `vault_patch` by heading where possible. Heading names are exact, with a hyphen and never an em dash.

**Under `# Did you get better today?` (the callout):**

Fill `> [!NOTE] Summary:` with one line: today's headline objective.

**Under `## Morning Plan`:**

Set `*Goal*:` to the day's primary objective, taken from the weekly note's Goals and the day-of-week focus.

**Under `### 80 - The One Thing`:**

```
- [ ] I will [specific task] at [time block] in [location].
```

One task. It is the weekly Goal or One Hard Thing that makes today a success.

**Under `### 20 - Supporting Work`:**

Two to four checkboxes. Academic minimums and secondary items only, not full expansion.

**Under `### Blocks`:**

One line per event from today's calendar, in time order:

```
- 9:00-10:30 CSCI 5304 Weeks 1-4: weekly notes written (Todoist calendar)
```

A meeting owned by someone else is listed as `(meeting)` and never summarized as work. If the connector failed: `Connector unavailable, no blocks read.`

**Do NOT line:** last line under Morning Plan. Read `10_Areas/Life/Plans/Fall 2026/Anti-Drift Rules.md`, section `The "Do NOT do today" list`, and copy today's exclusions. Keep the rules in that file; never hardcode them here.

```
**Do NOT do today:** [today's exclusions]
```

**Under `## Daily Wins`:**

Fill the Target column with a deliverable per win, taken from the weekly Goals. "CSCI 4061 P2: Part 1 tests pass locally", not "work on project". Leave the toggles alone.

**Under `## Daily Loses`:** carry the open Loses (see below).

**Under `## Daily Floor`:**

Fill the Track, Target and Topic columns from the Fall 2026 Plan's Systems table:
- Application: which company from `Current/` is the target to move today, per [[10_Areas/Career/Internships/Tracker/Tracker|Tracker]]
- LeetCode/CodePath or CSCI 4041: today's set from the weekly note's Goals
- Class step: which class gets today's step and what the step is, per that class's board and any deadline inside 7 days

**Deadline alert:** directly under the Floor table if anything is due within 7 days:

```
> [!WARNING] Deadline: [Course] - [item] due [date]
```

**Carryover:** after the Floor table, only for work that session history left open (not for broken promises, which are Loses):

```
## Carryover from Previous Sessions
- [ ] [item] - from session [date]
```

**Under `## Productivity`:** the template already carries the Meta Bind inputs for `lc_count` and `study_today`. Do not duplicate them and do not add a wins or floor total.

### The Loses carry

1. Collect every line under `## Daily Loses` in earlier notes that starts with `- [ ]`.
2. For each, append the identical line to today's `## Daily Loses` section. Keep `why`, `fix`, `from` and the original `since` unchanged. If today's section already holds an identical line, do not add it again.
3. In the older note, change only that line's `[ ]` to `[>]`.
4. Report the count and the oldest `since` in the output block.

Never add, reword or remove a field. Never write a `why`.

## §2 Step 4 output template

```
**Today - [Day of Week], [Date]**

Goal: [one-line objective]

80: [the one task]
20: [the supporting tasks]

Blocks:
- [time] [deliverable]

Daily Floor:
- [track]: [target] ([topic])

Open Loses: [N], oldest [N] days ([text])
[Deadline alert if any]
[Carryover if any]

Note updated: [[10_Areas/Life/Enumerate/Daily/YYYY-MM-DD]]
Dashboard updated: [[00_Dashboard]]
```
