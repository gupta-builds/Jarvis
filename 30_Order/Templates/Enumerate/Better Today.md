---
type: thought
thought_kind: daily
status: active
day_state: planned
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - daily
notes: []
next:
win_project: false
win_career: false
win_cleanup: false
win_review: false
floor_1: false
floor_2: false
floor_3: false
lc_count: 0
study_today: 0
wins_done: 0
floors_done: 0
---
# Did you get better today?
> [!NOTE] Summary:
## Morning Plan
<!-- From the weekly Goals. 80 and 20: I will [BEHAVIOR] at [TIME] in [LOCATION]. Blocks: today's calendar events, time then deliverable. -->
*Goal*: ==You get to do==
### 80 - The One Thing
- [ ] 
### 20 - Supporting Work
- [ ] 
### Blocks
**Do NOT do today:**
## Daily Wins
<!-- Four rows. Targets come from the weekly note and the active plan; Done is a toggle. -->

| Win     | Target | Done                        |
| ------- | ------ | --------------------------- |
| Project |        | `INPUT[toggle:win_project]` |
| Career  |        | `INPUT[toggle:win_career]`  |
| Cleanup |        | `INPUT[toggle:win_cleanup]` |
| Review  |        | `INPUT[toggle:win_review]`  |
## Daily Loses
<!-- One line per promise not kept: - [ ] what [why:: ] [fix:: ] [from:: weekly] [since:: YYYY-MM-DD] -->
## Daily Floor
<!-- Rows come from the active plan's Systems table. Never put the term in a heading. -->

| Track | Target | Topic | Done                    |
| ----- | ------ | ----- | ----------------------- |
|       |        |       | `INPUT[toggle:floor_1]` |
|       |        |       | `INPUT[toggle:floor_2]` |
|       |        |       | `INPUT[toggle:floor_3]` |
## Productivity
<!-- Typed numbers only. Wins and floor totals are counted from the toggles by /closeday and the dashboard. -->
**LeetCode today:** `INPUT[number:lc_count]`
**Study hours:** `INPUT[number:study_today]`
