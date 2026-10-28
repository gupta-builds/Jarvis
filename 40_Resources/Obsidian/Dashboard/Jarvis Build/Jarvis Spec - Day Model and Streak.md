---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
project_kind: spec
next: "Design final. A build session patches the Daily Note Standard and the template, with Anant's approval for each edit"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Spec - Plans Feed]]"
---
# Jarvis Spec - Day Model and Streak
## What This Is
==A Jarvis day is a daily note made of checkbox lines that the plugin can flip, and a streak that counts the days on which every floor row was done.==
This note defines the daily note shape the plugin reads, the fields on each line, the Loses lifecycle, the streak rule and the checks that guard them. It sits on top of the [[Daily Note Standard]] and keeps its headings, its Daily Loses line format and its frontmatter keys. It changes how wins and the floor are recorded and how Loses carry. The page rules are in [[Jarvis Spec - Dashboard Page]].

## Current State
Checked on 2026-10-26.
- The template [[Better Today]] holds seven frontmatter booleans (`win_project`, `win_career`, `win_cleanup`, `win_review`, `floor_1`, `floor_2`, `floor_3`) shown by Meta Bind toggles inside two tables. `lc_count` and `study_today` are typed. `wins_done` and `floors_done` are written by `/closeday`.
- The 80 and the 20 are checkbox lines under `### 80 - The One Thing` and `### 20 - Supporting Work`. `### Blocks` is a plain list.
- Daily Loses are task lines with `[why::]`, `[fix::]`, `[from::]` and `[since::]`, and four marks: `[ ]` open, `[x]` made up, `[>]` carried, `[-]` dropped. `/startday` copies an open Lose forward.
- The dashboard counts the toggles with DataviewJS. Nothing else reads them.
- Application progress is a field on each tracker note: `date_applied` in `10_Areas/Career/Internships/Tracker/Each One/Current/`. The folder holds 29 notes. [[2026-W44]] records 29 researched and 0 applied. There is no `Applied/` folder.
- Nothing in this note is built.

## The new daily note shape
Headings stay as the Standard names them. Only the line formats under them change.

```markdown
(frontmatter starts)
type: thought
thought_kind: daily
status: active
day_state: planned
created: 2026-10-27
updated: 2026-10-27
tags:
  - daily
lc_count: 0
study_today: 0
wins_done: 0
floors_done: 0
(frontmatter ends)
# Did you get better today?
## Morning Plan
*Goal*: one line
### 80 - The One Thing
- [ ] I will submit 5 applications at 2 pm at my desk. [plan:: Fall 2026 Plan]
### 20 - Supporting Work
- [ ] Cover letter for Uber is final. [for:: 80]
- [ ] Resume tailored for Deloitte. [for:: 80]
### Blocks
- [ ] 14:00-16:00 Internship: 5 applications sent [cal:: abc123] [spent:: 95]
**Do NOT do today:**
## Daily Wins
- [ ] Project: Portfolio UI repolished [win:: project]
- [ ] Career: one application sent [win:: career]
- [ ] Cleanup: inbox at zero [win:: cleanup]
- [ ] Review: close the day by 10:30 pm [win:: review]
## Daily Loses
- [ ] CSCI 4041: 5 problems logged [why:: opened YouTube first] [fix:: laptop opens on DSA.md] [from:: weekly] [since:: 2026-10-26]
## Daily Floor
- [ ] One company moved to Applied [track:: application]
- [ ] 5 problems logged in Weekly Set [track:: practice]
- [ ] One class step for CSCI 4061 [track:: class]
## Productivity
## Carryover from Previous Sessions
## End of Day
## Proof of the day
- [proof:: Shipped 5 applications with the final cover letter]
```

## Fields
| Field | On which line | Holds |
|---|---|---|
| `[plan:: name]` | The 80, optional on a 20 | The plan or board note that owns the task, so the line holds no copy of the plan |
| `[for:: 80]` | Every 20 line | The 80 it serves. A 20 line without it is invalid. |
| `[cal:: id]` | A Blocks line | The Google Calendar event id, so a moved event updates its line and does not duplicate |
| `[spent:: minutes]` | A Blocks line | Minutes of tracked time, written at close from The Plan's time records ([[Jarvis Spec - Automation Layer]]) |
| `[win:: project, career, cleanup, review]` | A wins line | Which win it is. Each value appears once. |
| `[track:: name]` | A floor line | A floor row name from the term's config table |
| `[why::]`, `[fix::]`, `[from::]`, `[since::]` | A Lose | Unchanged from the Standard. `from` is `weekly`, `calendar`, `win`, `floor` or `other`. |
| `[due:: YYYY-MM-DD]` | A weekly Goal line | A deadline the Blocks strip lists for the next 7 days |
| `[proof:: text]` | One line under `## Proof of the day` | One line of evidence, written at close |

Blocks marks: `[ ]` open, `[x]` done, `[-]` missed with a `[why::]`. Win and floor marks: `[ ]` and `[x]`.

## Floor rows per term
The rows live in a config table, not in code. A new term changes the table and the plan note.

| Term | Row | Track | Done when |
|---|---|---|---|
| Fall 2026 | 1 | `application` | A tracker note has `date_applied` equal to today |
| Fall 2026 | 2 | `practice` | LeetCode or CodePath reps logged, at least 5 |
| Fall 2026 | 3 | `class` | One class step finished |
| Term end | | | 2026-12-24 |

Anant ticks a floor line with evidence. Nothing ticks it for him. The validator warns when the `application` line is ticked and no tracker note has today's `date_applied`, and when `practice` is ticked with `lc_count` under 5. A warning never changes a tick.

## Daily Loses lifecycle
1. A Lose is written the day it slips, in that day's note, with `since` set to that date.
2. It is never copied forward. It stays where it happened. The `[>]` carried mark is retired.
3. It is open until made up (`[x]`) or dropped (`[-]` with a reason in `why`).
4. The page counts every open Lose across all daily notes, oldest first, with its age (today minus `since`).
5. The cap is 7 open Loses. At close, an eighth cannot be added until one is made up or dropped. `/closeday` refuses to set `day_state: closed` while more than 7 are open.
6. At close, `/closeday` recalculates tomorrow from the day's Loses and writes a preview ([[Jarvis Spec - Plans Feed]]). A Lose informs tomorrow. It does not become tomorrow's task by copying.
7. The plugin can tick a Lose to `[x]`. Everything else about a Lose is written by `/closeday`, which asks for the why and the fix and never invents them.
8. Older notes may hold `[>]`. The engine treats it as closed history.

## Streak rule
It is the rule from The Plan's Streak Rule with the floor as the unit.
1. A day is MET when it has at least one floor line and every floor line is ticked.
2. A day is MISS when a floor line is open at the day's end, or the note is missing. A missing note is a MISS.
3. Today is PENDING until midnight, unless it is already MET. The rollover is midnight. A tick after midnight belongs to the new date.
4. The streak starts on the earliest day whose note has at least one floor line.
5. Walk from the start day to yesterday. A MET day adds one. An isolated MISS is forgiven: it adds nothing and does not reset. A second MISS in a row resets the run to zero.
6. The current streak is the run, plus one when today is MET.
7. The best streak counts closed days only. Today joins it the next day.
8. A forgiven day counts as a lost day in the month totals.
9. At risk means yesterday was a MISS and today is not yet MET.
10. Milestones are 3, 7, 21, 66 and 100, with the titles in [[Jarvis Decisions Log]] D16.
11. The week is ISO, Monday to Sunday ([[Jarvis Decisions Log]] D33).

The wins score is the count of ticked win lines, from 0 to 4, and is separate. The research behind a forgiven miss and the 66 day milestone is in [[Jarvis Research - Outside Sources]].

## Write primitives
The plugin has three ways to change a file and no others.
1. **Replace one line.** Used for a tick, an edit in place and the proof line. It runs inside `Vault.process`, checks that the line at the index still equals the text the page saw, and refuses otherwise. It keeps LF or CRLF as found and changes nothing else.
2. **Change a frontmatter number.** `lc_count` and `study_today` only, through `processFrontMatter`, with plus and minus buttons.
3. **Create today's note.** From the template, named `YYYY-MM-DD`, refused if the note exists or the name is not an ISO date.

## Validator rules
`validate` reports each breach with the line and the rule. It never rewrites a note.
1. The file name is `YYYY-MM-DD.md`. Any other name in the Daily folder is reported as misnamed.
2. `created` and `updated` are real dates. A leftover `<% %>` is reported.
3. Exactly one 80 line.
4. Two to four 20 lines, each with `[for:: 80]`.
5. Each floor line has a `[track::]` that is in the term's config table.
6. Four win lines, one per `[win::]` value.
7. Each Lose has `[since::]`. A missing `[why::]` reads `(unanswered)`.
8. On a closed day, `wins_done` and `floors_done` equal the ticked lines, and an End of Day exists.
9. Each Blocks time reads `HH:MM-HH:MM` and ends after it starts.
10. A mark other than `[ ]`, `[x]`, `[X]` or `[-]` is reported. A `[>]` in a note from before 2026-10-26 is accepted.
11. Across all notes, open Loses number at most 7. This is a `doctor` and close-time check, not a per-note check.

## Migration
Old notes keep the old shape and stay as history ([[Jarvis Decisions Log]] D40). The engine reads only the new shape. A day in the old shape has no floor lines, so it never starts or extends a streak. The page shows the streak start as the first day with a floor line. The template and the Standard patch are listed in [[Jarvis Spec - Carry Forward]].

## Non-Goals
- No streak for the wins, and no separate streak for a single track.
- No automatic ticking from a count, a tracker note or a calendar event.
- No health, meals, water or personal habits. Those belong to The Plan.
- No copying of an open Lose into another day.
- No change to any note while this is a design.

## Open Questions
None blocking the build. Every question was answered or defaulted on 2026-10-26, see [[Jarvis Decisions Log]].
