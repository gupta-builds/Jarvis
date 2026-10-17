---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Daily Note Standard]]"
trigger: The working day starts with /startday or ends with /closeday.
notes:
  - "[[Better Today]]"
  - "[[Daily Workflow Standard]]"
  - "[[Plan Review Cadence]]"
---
# Daily Close Loop
Run the day as plan first and record second, so the note is useful in the morning and honest at night.
## Use when
The day opens with `/startday` or closes with `/closeday`. Closing is optional: the note fits without it.
## Steps
1. `/startday` finds or creates `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md` from [[Better Today]] with dates resolved. It never creates the note anywhere else.
2. It fills the plan sections from the active plan ([[Plan Review Cadence]]) and the latest session-log entries: Morning Plan, Daily Wins targets, Daily Floor rows, Carryover. `day_state` stays `planned`.
3. It patches only the three `today_*` fields of `00_Dashboard.md`.
4. Work the day and tick toggles as things happen.
5. `/closeday` (optional) gathers session-log and file evidence, asks the day's numbers in one block, and writes `lc_count`, `study_today`, `wins_done`, and `habits_done`.
6. It appends End of Day (scorecard, Day Status, What Actually Happened, Friction Fix if RED, Preview Tomorrow), sets `day_state: closed` and `status: complete`, clears the dashboard fields, and adds one session-log line.
7. An unclosed day stays `planned`. The next `/startday` carries its open items forward and does not wait for a close.
8. `/weekly-review` counts unclosed days as a number in the weekly note, not as a failure.
## Do not
Do not fill End of Day from memory after the day. Do not tick a toggle without evidence; write "(unverified)". Do not put a term name in a heading.
## Done when
- Today's note exists in the right folder with `day_state` matching its body.
- A closed day has the tracking keys, End of Day, and a session-log line.
- The weekly review has the count of unclosed days.
