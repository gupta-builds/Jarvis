# startday — reference

Loaded on demand from SKILL.md. Contents:
1. Per-heading patch formats for the daily note
2. Step 4 output template

## §1 Per-heading patch formats

All patches go into `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`. Use `vault_patch` by heading where possible.

**Under `# Did you get better today?` (the callout):**

Fill `> [!NOTE] Summary:` with one line: today's headline objective.

**Under `## Morning Plan`:**

Set `*Goal*:` to the primary objective — derived from 01 (4 wins) + 02 (day-of-week focus).

**Under `### 80 — The One Thing`:**

```
> I will [specific task] at [time block] in [location].
- [ ] [the one task that makes today a success]
```

**Under `### 20 — Supporting Work`:**

2–4 supporting tasks as checkboxes — academic minimums and secondary items only, not full expansion.

**Anti-Drift** — last line under Morning Plan. Read `10_Areas/Life/Plans/Fall 2026/Anti-Drift Rules.md` → `## The "Do NOT do today" list` and copy today's specific exclusions. Keep the rules in that file; never hardcode them here.

```
**Do NOT do today:** [today's exclusions from Fall 2026/Anti-Drift Rules]
```

**Under `## Fall Daily Wins`:**

Fill the Win column with today's specific target per win. Example: Project = "ship the auth endpoint", not just "work on project".

**Under `## Fall Daily Floor`:**

Fill the Topic column per row:
- Application: which company from `Current/` is the target to move today, per [[10_Areas/Career/Internships/Tracker/Tracker|Tracker]]
- LeetCode/CodePath: today's topic from `10_Areas/Life/Plans/Fall 2026/LeetCode & CodePath.md`'s unit/company rotation + current weekly count
- Fall'26 class step: which of the six classes gets today's step, and what the step is (per that class's Board/Preparation note and any deadline inside 7 days)

**Deadline alert** — immediately under the Fall Daily Floor table if anything is due within 7 days:

```
> [!WARNING] Deadline: [Course] — [item] due [date]
```

**Carryover** — after the Fall Daily Floor if session history left open items:

```
## Carryover from Previous Sessions
- [ ] [item] — from session [date]
```

**Under `## Productivity`:**

The template already carries the Meta Bind inputs (`lc_count`, `study_today`, `wins_done`) — do not duplicate them. Add habit checkboxes from the active board in `10_Areas/Life/Habits/` (check the folder for the current board — don't hardcode a filename, it has changed before) below the Meals/Water table as separate checkboxes. Personal/health habits (gym, etc.) are tracked in The Plan, not here.

## §2 Step 4 output template

```
**Today — [Day of Week], [Date]**

Goal: [one-line objective]

80: [the one task]
20: [list the supporting tasks]

Fall Daily Floor:
- Application: [target company] (18 researched / [N] applied)
- LeetCode/CodePath: [topic] (at [current]/35 this week)
- Fall'26 class step: [class] — [step]

[Deadline alert if any]
[Carryover if any]

Note updated: [[10_Areas/Life/Enumerate/Daily/YYYY-MM-DD]]
Dashboard updated: [[00_Dashboard]]
```
