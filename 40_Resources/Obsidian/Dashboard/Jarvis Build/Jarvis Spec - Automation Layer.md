---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - automation
project_kind: spec
next: "Design final. Nothing is built until the manual versions have run clean for two weeks, and the time reader waits for The Plan's time design"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Plans Feed]]"
  - "[[Jarvis Verification and Risks]]"
  - "[[Jarvis Research - Outside Sources]]"
---
# Jarvis Spec - Automation Layer
## What This Is
==The automation layer makes the Jarvis day easier on the calendar and on later platforms, with no tokens in the plugin, no silent writes and no personal content crossing from The Plan.==
It is a design. It covers how today's calendar reaches the page, how a planned block reaches the calendar, how time spent is read from The Plan, the step-by-step day and what is left open for later transports. Nothing here is built ([[Jarvis Decisions Log]] D21).

## Current State
Checked on 2026-10-26.
- The connector is the claude.ai Google Calendar integration, acting as `gupt0479@umn.edu`. It cannot read the vault and the vault cannot call it. Its tools, limits and the ten calendars on the account are in [[How to Use Google Calendar]], checked against the live account on 2026-10-25.
- The working calendar is a plain Google calendar named "Todoist" (id starts `c_2195`). It does not sync with Todoist. The guide suggests renaming it "Blocks".
- The guide's rules for writes: read before writing, write only to the working calendar, leave meetings alone, silence every write with `notificationLevel: NONE`, use the five-line event format, set a 5 minute popup, propose a week's blocks in the weekly note and get a yes before bulk creation, and re-list the week after writing.
- The UMN class blocks are not visible to the connector.
- The Daily Note Standard already has a `### Blocks` heading, filled by `/startday` from today's calendar, read only.
- Toggl is used in The Plan. The Plan has no note or design for it yet ([[Jarvis Research - The Plan Parallel Builds]]). Time is to be calculated in two places there ([[Jarvis Decisions Log]] D19).
- The Plan's daily template changed on 2026-10-26 and its structure is still open (Decision 51 in The Plan). The Plan says it already reads Jarvis's dashboard, weekly, monthly and plan notes on its own daily, weekly and planned runs. That statement is Anant's and is not verified in the vault.
- Todoist is out of the Jarvis design ([[Jarvis Decisions Log]] D18).

## The principle
The plugin only reads Jarvis. Claude is the bridge to every outside service. The daily note is the hand-off: Claude writes a line and the plugin shows it. Tokens, expiry and failures stay out of the plugin, and a failed call leaves the page honest rather than blank. Jarvis never writes to The Plan.

## The day, step by step
| When | Trigger | Actor | Reads | Writes | Approval | Breaks when |
|---|---|---|---|---|---|---|
| Evening, before close | Anant runs `/closeday` | `/closeday` | Toggles' replacement lines, Blocks, The Plan's time records, the weekly Goals | `wins_done`, `floors_done`, `study_today`, Loses, End of Day, the preview for tomorrow, `[spent::]` on Blocks, `day_state: closed` | One block of questions, then one list of writes and a yes | Node or the CLI is missing: it stops |
| Night | Anant | Nobody | | Tomorrow's note is created by the plugin's Create button or `/startday` | None | The note is missing at midnight and the day is a MISS |
| Morning | Anant runs `/startday` | `/startday` | The preview, weekly Goals, today's calendar, `[due::]` lines | The 80, the 20, wins, floor, `### Blocks` | A proposal for the 80 and the 20, a yes | The connector is down: "connector unavailable" |
| During the day | Anant opens Obsidian | The plugin | The daily note, tracker `date_applied` | A tick, an edit, a number, the proof line | None | A stale line is refused and the row reverts |
| Sunday | Anant runs the weekly review | `/weekly-review`, calendar planning | The week, the Goals | A table of proposed blocks in the weekly note, then calendar events after a yes | A yes before any bulk create | A wrong count after writing: re-list and report |
| 2026-12-24 | The term ends | Anant, Claude | The Fall plan, the floor config | A term review in the weekly note, a new config term | A yes | The config is not updated |

## Layer 1: Today's blocks onto the page
1. `/startday` reads the primary calendar and the working calendar for today, read only, and writes `### Blocks` lines: time, title, `[cal:: id]`.
2. The plugin reads those lines and shows the block that is running now, the next one and the deadlines due in 7 days.
3. If the connector was unavailable, the section says "connector unavailable", as the Standard requires, and the page says "Blocks not loaded today. Run /startday."
4. A block that passed with no tick is not decided by the page. At close it becomes a candidate Lose.
Only the primary calendar and the working calendar are read. The other eight are ignored, as the guide says. The class blocks stay anchors read from the course boards.

## Layer 2: Planned blocks onto the calendar
1. Sunday planning, after the weekly Goals exist: Claude lists the week, proposes the blocks as a table in the weekly note and waits for a yes.
2. After the yes it creates the blocks on the working calendar in the five-line format, then re-lists the week and reports the exact count.
3. `/closeday` may move one missed block into the next free slot without a table, as the guide allows.
4. Meetings are never moved. Prep blocks are placed before them. A block that cannot fill the WHAT line is not created.
Calendar writes stay manual: one tap, one approval, one count.

## Layer 3: Time, read from The Plan
Time is calculated in two places in The Plan, both read only by Jarvis ([[Jarvis Decisions Log]] D19, D20).
1. **The overview** in The Plan's daily note: a summary of what happened that day.
2. **Detailed time logs**, a folder of notes with per-task time, so that Jarvis and The Plan can both take a detailed account.

### The reader
- Skills never open The Plan's notes. They call `dashboard-cli plan-time <date>`.
- The CLI reads the files in Node and prints only fields from an allowlist: the configured time headings and the time log folder. Every other heading is dropped in the same step and never reaches Claude's context or a Jarvis note. Personal content therefore does not appear in the Jarvis workflow.
- The allowlist and The Plan's path are config, set per machine ([[Jarvis Architecture]]).
- The reader never writes, and Jarvis never writes to The Plan.
- Whether Jarvis's own hooks allow the read is tested before the reader is relied on ([[Jarvis Verification and Risks]]).

### What Jarvis uses it for
- `study_today`, proposed at close and confirmed by Anant.
- `[spent:: minutes]` on each Blocks line, so the page shows planned against tracked time.
- The consistency agent, which compares both days read only and reports mismatches: study hours that disagree, a block ticked with no time in The Plan, one piece of work counted twice. It writes nothing.

### What The Plan must define first
The Plan's own build owns these. Until they exist, `plan-time` returns `{"status":"not_defined"}` and the page shows planned time only.
1. The heading in The Plan's daily note that holds the time overview.
2. The path and naming of the time log folder.
3. The entry format. A proposal that matches Blocks lines: `- HH:MM-HH:MM task label [proj:: name]`, so a time entry matches a block by overlap.
4. When entries are written, live or at close.
Toggl's own API is not used by Jarvis. For reference, its time entries list returns at most 1000 entries and detailed reports page at 50 entries ([[Jarvis Research - Outside Sources]]). The Plan decides how Toggl data reaches its notes.

## Layer 4: Later transports
Apple Reminders, Zapier and further MCP servers are not designed. The rule for choosing is fixed now so the choice stays simple:
1. Each type of task has one owner: the daily note, the calendar or one reminders app. Nothing is written to two places.
2. A transport must work with the laptop off, or say plainly that it does not.
3. A transport makes one kind of write, and a failure is visible in the note the next morning.
4. A transport the vault cannot test is not built.
Todoist is not a candidate.

## Scheduling
Everything above is manual or one tap until the manual version has run clean for two weeks. This matches Decision 40 in The Plan's record. A scheduled run, if one ever exists, needs a dry run, a log entry and a kill switch, and writes only the section it owns.

## Failure register
| Trigger | Effect | What Anant sees | Detection | Smallest fix |
|---|---|---|---|---|
| The calendar token expires | `### Blocks` stays empty | "Blocks not loaded today" | `/startday` reports the error | Reconnect the connector |
| A calendar write creates the wrong count | Duplicates or gaps in the week | A wrong count in the report | Re-list after writing, per the guide | Delete the duplicate by hand, since Claude does not delete |
| Time zone mix | A block shows an hour off | The strip is wrong | A test with a Winnipeg and an India event | Trust the offset, not the zone label |
| Two laptops write the same daily note | One edit is lost | A tick reverts | The stale-line check refuses | Re-tick, or use one laptop per day |
| The class blocks are invisible | The strip omits lectures | Missing lectures | Known limit in the guide | Add lecture anchors to the weekly note |
| The Plan has no time records | `study_today` stays typed | No tracked time per block | `plan-time` status | Type the number |
| The Plan's headings change | The allowlist finds nothing | `plan-time` returns an empty result | `doctor` compares the allowlist with the live headings | Update the allowlist in config |
| The reader leaks a non-allowlisted heading | Personal text enters Jarvis | Text in a Jarvis note | A test feeds a Plan note with private headings and asserts none are in the output | Fix the reader before use |
| A skill writes the wrong section | A heading holds foreign lines | The validator reports it | `validate` | Fix by hand, the validator never rewrites |
| The Plan's path differs on the other laptop | The reader finds nothing | `not_defined` or an error | `doctor` | Set the path per machine |

## Non-Goals
- No Toggl, Todoist or other service called by the plugin.
- No scheduled or unattended run in this build.
- No deleting of calendar events.
- No writes to The Plan.
- No reading of any Plan heading outside the allowlist.
- No phone reminders until a transport is chosen.

## Open Questions
None blocking the build. The four items under What The Plan must define first are The Plan's design work, tracked in [[Jarvis Build Hub]] as dependencies.
