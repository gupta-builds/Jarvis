---
type: system
status: sprout
created: 2026-10-25
updated: 2026-10-25
tags:
  - system
  - guide
  - calendar
system_kind: guide
notes:
  - "[[10_Areas/Life/Enumerate/Weekly/2026-W44|2026-W44]]"
  - "[[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - What Was Done (2026-10-25)|W44 Calendar Rebuild - What Was Done]]"
  - "[[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - Actions (2026-10-25)|W44 Calendar Rebuild - Actions]]"
  - "[[60_Claude/07_AI_Information/How to Use Claude/Track Conversations|Track Conversations]]"
---
# How to Use Google Calendar
This guide covers what the Google Calendar connector is for, what it can and cannot touch, which of the ten calendars on the account matter, and the rules any Claude model follows before writing to one. Everything here was checked against the live account on 2026-10-25 during the W44 rebuild ([[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - What Was Done (2026-10-25)|What Was Done]]). If a calendar name or count below no longer matches, re-run `list_calendars` before trusting the rest.
## What it is
The connector is the claude.ai Google Calendar integration. In Claude Code its tools are named `mcp__claude_ai_Google_Calendar__*`, and it acts as `gupt0479@umn.edu`, the UMN Google account. It is not the `jarvis` or `the-plan` Obsidian MCP, and it cannot read the vault.

Calendar is the time layer: when a task happens, where, and for how long. What the task is comes from Obsidian: the weekly note, the plans in `10_Areas/Life/Plans/`, and the course boards. An event is a pointer to that work, never the only place the work is described.
## Use when
- Sunday planning, after the new weekly note's Goals exist: placing the week's tasks as blocks.
- Before `/startday`, to read what is on today, or before agreeing to a new deadline, to see what it collides with.
- Rewriting a vague block ("CSCI 4521 Catch Up") into the event format below.
- During `/closeday`, moving a missed block into the next free slot.

Not for task content that belongs in a note, for one-off timed reminders (see the platform split in [[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - Actions (2026-10-25)|Actions]]), or for the 12-week map, which lives in Todoist and [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]].
## What it can do

| Tool | What it does | Used on 2026-10-25 |
|---|---|---|
| `list_calendars` | Lists calendars the account owns or subscribes to. This is a subset; a calendar outside the list is reachable only by its exact id. | Yes |
| `list_events` | Events on one calendar in a time range. By default it returns only regular, out-of-office, focus-time, and Gmail events. | Yes, three calendars |
| `search_events` | Semantic search on the primary calendar only. | Yes, found nothing for lecture names |
| `get_event` | One event by id. | Yes, to confirm an edit stuck |
| `create_event` | A new event: title, times, description, location, color, reminders, recurrence, attendees. | 19 created |
| `update_event` | Changes any field on one event, or on one date of a recurring series. | 43 updated |
| `delete_event` | Deletes an event. | Not used |
| `respond_to_event` | Accept, decline, or tentative on an invite. | Not used |
| `suggest_time` | Finds free slots across calendars. | Not used yet; it is the right tool for placing buffers |

Three fields matter more than the rest:
- **`overrideReminders`** sets popup or email reminders per event. This is the lever for phone notifications. The working calendar has no default reminder, as the calendar table below shows.
- **`colorId`** colors one event, which allows color-coding by kind of block.
- **`notificationLevel: NONE`** stops Google from emailing attendees about an edit. Every write on 2026-10-25 used it.
## What it cannot do
- Rename, create, delete, hide, or recolor a whole calendar, or change a calendar's default notifications. Those are settings in the Google Calendar app.
- Read or write Google Tasks, phone reminders, or Todoist. None of the three has a tool in this session.
- See the UMN class blocks (lectures, the CSCI 4061 lab, the CSCI 4511W discussion). They show in the app, but no listed calendar holds them and `search_events` finds nothing. Their source is unknown. Treat them as fixed anchors, read from a screenshot or the course boards.
- Change a meeting someone else owns for everyone (see Meetings).
- See the "Office" working-location bar unless working-location events are requested explicitly.
- Confirm that a reminder actually buzzed the phone.
- Edit a whole recurring series by editing one date. Six of the W44 edits were single dates of recurring events (Short Quiz, Quiz & Lab, Lab Due, CSCI 5304 Quiz, Mass Apply, CSCI 4511W Homework - 2). Next week those dates show the old title again.
## The calendars
The account has ten calendars. Two are in active use, and the class schedule comes from somewhere the connector cannot see.

| Calendar | Time zone | What it holds | How to treat it |
|---|---|---|---|
| `gupt0479@umn.edu` (primary) | America/Chicago | Gym and calisthenics (recurring, 6am), plus every invite: CodePath, TIP103, cricket, AIIS, the CSCI 4511W office-hour booking | Read it. Write only to events you own. Default reminder: popup at 10 minutes. |
| "Todoist" (id starts `c_2195`) | America/Chicago | Every red work block. Despite the name, it is a plain Google calendar, filled by hand and by Claude. It stopped syncing with the Todoist app long ago. | The working calendar. Read and write here. The API reports no default reminder. |
| "Todoist" (id starts `2a35`) | Asia/Kolkata | Nothing in W44; last changed 2026-10-13 | Ignored. Candidate to hide. |
| VIT | Asia/Kolkata | A VIT (India) class timetable, created by another account and shared with full rights. Almost all of it lands overnight in Chicago. BSSC102N (8:20-9pm IST) lands Wed 9:50-10:30am. | Ignored for planning. It caused the Wednesday overlap. |
| Holidays in United States | America/Chicago | Public holidays (Halloween shows Sat 10/31) | Read only, ignored |
| DataTalks.Club events | Europe/Berlin | Community events | Ignored, not read |
| CSE Student Groups' Events Calendar | America/Chicago | Shared student-group meetings | Ignored, not read |
| Goldy's Winter Break Calendar 2025-26 | America/Chicago | Last winter's campus events | Ignored, stale |
| Partiful | UTC | Imported event invites | Ignored, not read |
| UMN.LOL Schedule | UTC | A club schedule | Ignored, not read |

"Not read" means the row describes the calendar from its own name and description only.
## Meetings
A meeting is any event that someone else organizes or that has other attendees. In W44 those are:
- the CodePath 1:1 Resume Review (organizer: CodePath's review calendar, on Zoom)
- the TIP103 live classes (the Technical Interview Prep calendar)
- UMN Cricket practice
- the AIIS Leadership meet
- the CSCI 4511W office-hour booking

Meetings are anchors. Claude never moves, renames, or rewrites them, because a change either does not reach the organizer or notifies other people. The one allowed action is an RSVP through `respond_to_event`, when asked. Preparation for a meeting goes in a separate block you own, placed before it. "Resume: 3 questions ready for the 11:30 CodePath 1:1" is that pattern: your own 10:30 event, ahead of CodePath's 11:30 one.
## Time zones
The calendar's zone is America/Chicago. The app shows GMT+04 as the main column and U.S. as the second, so screenshots carry both; read the U.S. column. The tools take local times with no offset (`2026-10-26T07:30:00`) and resolve them in America/Chicago. Some events store another zone ("Rate yourself" is in Asia/Kolkata, TIP103 in America/Los_Angeles), but their timestamps carry correct offsets, so trust the offset over the zone label.
## The event format
Every block has a title made of the course or project, a verb, and the deliverable: `CSCI 4061 P2: all tests pass locally`, not `CSCI 4061 Project Completed`. The description is five plain-text lines, with no HTML:

```
WHAT:  the thing that exists when the block ends
WHY:   one line on what it unblocks
HOW:   the source to open, the steps, the time cap
WHERE: the place, plus the vault path the output lands in
BY:    the hard stop, and what proves it is done
```

Friday blocks are checkpoints, titled "By Fri: ...", not work sessions. The Saturday 4pm block audits them in the weekly note.
## Rules for Claude models
1. **Read before writing.** List the week on the primary and working calendars first. Never plan from memory or from an old screenshot.
2. **Write to the working calendar.** Work blocks go only to the `c_2195` "Todoist" calendar. The primary calendar is for events the user already owns there. Never write to VIT, holidays, or any subscribed calendar.
3. **Leave meetings alone** except for an RSVP the user asked for.
4. **Silence every write** with `notificationLevel: NONE`.
5. **Format every block.** Use a deliverable title and the five lines. If you cannot fill WHAT, ask instead of inventing it. "Laptop Builds - 6 & more" was left alone for that reason.
6. **Apply the buffer rules before placing anything.** They are in [[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - Actions (2026-10-25)|Actions]]: 10 minutes between blocks, travel time, meals, at most 3 hours without a break, one overflow block a day, and one dev task per evening.
7. **Propose, then write.** For a whole week, put the block table in the weekly note and get a yes before bulk-creating. A single move during `/closeday` can go straight in.
8. **Set reminders explicitly.** Pass a popup at 5 minutes, because the working calendar has none by default.
9. **Edit one date of a recurring event** unless the user asks for the whole series, and say that next week will revert.
10. **Do not delete.** Rename, move, or ask.
11. **Count after writing.** Re-list the week and report exact numbers. On 2026-10-25 the chat reply said 36 events were rewritten when the real number was 43.
12. **Take dates from the board, not a block.** Exam and due dates come from the course board, never from a calendar title. W43's CSCI 5304 midterm block said Wednesday; the midterm was Tuesday 10/20 ([[20_Progress/Degree/CSCI 5304/CSCI 5304 Board|CSCI 5304 Board]]).
13. **Keep descriptions shareable.** They reach the phone and anyone the calendar is shared with, so no secrets and no personal-life content.
## Suggestions
- Rename the `c_2195` calendar from "Todoist" to "Blocks" in the app. The name led a model (this one) to assume a sync that does not exist.
- Hide VIT and the empty second "Todoist" calendar from the main view.
- In the app, set the working calendar's default event notification to 5 minutes, then confirm one test event buzzes the phone.
- Color by kind with `colorId`: classes and meetings as anchors, prep, coursework, dev, daily defaults, and Friday checkpoints.
- Keep phone reminders for one-off actions that are too small for a block. If Claude should place those too, a separate "Reminders" calendar is the way, because the connector cannot reach any reminders app.
## Do not
- Do not let an event title define a task. The weekly note does.
- Do not place blocks edge to edge.
- Do not expect an event on the "Todoist" calendar to create a Todoist task. Nothing syncs.
