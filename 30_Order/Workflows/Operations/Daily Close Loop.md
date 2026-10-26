---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-26
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Daily Note Standard]]"
trigger: The working day starts with /startday or ends with /closeday.
notes:
  - "[[Better Today]]"
  - "[[Plan Standard]]"
  - "[[Plan Review Cadence]]"
  - "[[How to Use Google Calendar]]"
  - "[[2026-W44]]"
---
# Daily Close Loop
Plan first, record second. The weekly note says what was promised, the calendar says when, the daily note says what happened, and Daily Loses holds the gap.
## Use when
The day opens with `/startday` or closes with `/closeday`. Closing is optional: the dashboard still shows live toggle counts and open Loses, and holds no number of its own.
## Steps
1. `/startday` finds or creates today's note from [[Better Today]], resolves any leftover `<% %>` date, and never creates it elsewhere.
2. It reads the weekly Goals, the Systems table and today's calendar blocks, read only ([[How to Use Google Calendar]]).
3. It carries each open Lose forward: the line is copied with its original `since`, and the old line becomes `[>]`.
4. It fills Morning Plan, Wins targets and Floor rows, and patches only the three `today_*` fields of `00_Dashboard.md`. `day_state` stays `planned`.
5. Work the day. Tick a toggle only with evidence. Write a Lose when a promise slips.
6. `/closeday` reads the toggles, calendar, session log and weekly Goals. It proposes a Lose for each false toggle, passed block without evidence, or unmet Goal, then asks for the counts and each `why` and `fix` in one block.
7. It writes `lc_count`, `study_today`, `wins_done` and `floors_done` (counted), the confirmed Loses and End of Day, sets `day_state: closed`, clears the `today_*` fields, and logs one line.
8. An unclosed day stays `planned` and its Loses carry on. `/weekly-review` counts unclosed days, sums wins and floors, and lists open Loses with ages.
## Do not
Do not fill End of Day from memory, type `wins_done` or `floors_done`, write a `why` for Anant, or write to the calendar. Do not tick a toggle without evidence. Do not delete a Lose: make it up with `[x]` or drop it with `[-]` and a reason.
## Done when
- Today's note has a real `created` date and a matching `day_state`.
- A closed day has the counts equal to the toggles, every slipped promise in Daily Loses, and a session-log line.
- The dashboard's numbers match the note.
