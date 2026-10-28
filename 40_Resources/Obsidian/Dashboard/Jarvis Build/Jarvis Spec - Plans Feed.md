---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - plans
project_kind: spec
next: "Design final. The 2026-12-24 term review is the first real use"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Automation Layer]]"
---
# Jarvis Spec - Plans Feed
## What This Is
==Every plan keeps one owner note, and the daily note holds only a one-line pointer to it, so planning feeds the day without a second copy.==
This note says how the standing plans (the Fall 2026 plan, the weekly note, project plans, mentorship plans, UMN course boards and the career pipeline) become the 80, the 20 and the floor of one day, and how a day's Loses shape the next one. It follows [[Plan Standard]] for what a plan is.

## Current State
Checked on 2026-10-26.
- The Fall 2026 Plan has a Systems table of 22 tracks, each with a cadence and a done-definition. Three run daily: the application floor, LeetCode and CodePath, and the class step. The rest run weekly, monthly or once. It also has a week-by-week One Hard Thing table. Source: `10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md`.
- [[2026-W44]] holds the week: daily Goals, three groups of "The 80" (UMN, Development, Others), Friday checkpoints, carried items and a calendar format.
- The [[Daily Note Standard]] says the 80 and the 20 come from the weekly Goals and the calendar, not from memory.
- The Plans Board says the Fall plan ends 2026-12-14. Anant's answer is 2026-12-24 ([[Jarvis Decisions Log]] D14).
- Mentorship plans are `Plan - Ahnaf` and `Plan - Jesse` in `20_Progress/Mentorship Program/Plans/`. The dashboard note records one must-do: the Jesse outreach email, due 2026-11-02.
- Course material is under `20_Progress/Degree/`, with a board per course and `_Courses/_Courses Board.md`.
- Nothing in this note is built.

## Single ownership
Each plan family has one owner, one thing it supplies and one pointer in the day.

| Plan family | Owner note | Supplies | Surfaces as | Written by | Drift guard |
|---|---|---|---|---|---|
| Term plan | Fall 2026 Plan | The floor rows, the One Thing frame, the One Hard Thing of the week | `[plan:: Fall 2026 Plan]` on the 80 or a floor row | Anant | The health chip turns red at the term end |
| The week | The weekly note | Goals, Friday checkpoints, deadlines | The chosen Goal as the 80, one line | Anant, with Claude proposing | A 20 whose 80 is gone fails `validate` |
| Project plans | The project note's `next:` and Log | The next action of each project | An 80 or 20 line with `[plan:: project]`, and a project chip | Anant | The chip shows the live `next:` |
| Mentorship | `Plan - Ahnaf`, `Plan - Jesse` | Meetings, outreach, the actions from each meeting | A 20 from `/note-to-actions`, a `[due::]` line | Anant | The meeting actions go to the weekly note, not a second list |
| UMN courses | Course boards, `Fall'26 Syllabus` | Assignment and exam dates | `[due::]` on a weekly Goal | Anant | Dates come from the board, never from a calendar title |
| Career pipeline | Tracker notes in `Each One/` | Applications and their dates | Nothing in the note. The page reads `date_applied`. | Anant | `date_applied` only on a finished application |
| Courses and certifications | `_Courses Board` | The course queue | A 20 or a floor `class` line | Anant | The board owns the order |
| Clubs, hackathons, networking | The Fall plan rows, the Hackathons note | Counts and dates | A weekly Goal | Anant | One count in one place |
| Dev projects | Project notes under `20_Progress/Projects` | The development 80 | An 80 line with a plan pointer | Anant | Dev work starts after 6 pm, per [[2026-W44]] |

Personal plans, including resolutions, belong to The Plan and do not appear here ([[Jarvis Decisions Log]] D7).

## How the 80 is chosen
1. `/startday` reads the previous day's preview (below), the weekly Goals, the week-by-week table, today's Blocks and any `[due::]` within seven days.
2. It proposes up to three candidates. The order is the Fall plan's One Thing first, then a hard deadline, then the open Goal that has slipped longest.
3. Anant picks or edits one. It is written as one line: "I will [behavior] at [time] in [place]."
4. If the One Thing is applications, the 80 is the day's application count. The floor row still reads one company moved.
Anant decides the 80. The skill never chooses alone.

## How the 20 is chosen
1. The 20 supports the 80 on that day. It is the set of tasks without which the 80 cannot finish, so the extra work is done with respect to it ([[Jarvis Decisions Log]] D13). If the 80 is five applications, the 20 is the cover letters, the resume edits and the other Jarvis work that make those five ready.
2. The skill derives candidates by reading the 80's own plan note and listing its unfinished prerequisites.
3. It writes two to four lines, each with `[for:: 80]`.
4. A task that does not serve the 80 is not a 20. It goes to the weekly Goals or becomes a Lose.
5. When the 80 changes during the day, the 20 is rewritten to match and the old lines are marked `[-]` with a reason.

## Recalculation from the day's Loses
A Lose is not pushed to the next day ([[Jarvis Decisions Log]] D24). The next day is recalculated from it.
1. At `/closeday`, for each new Lose the skill reads its `why` and `fix`.
2. It writes a preview under End of Day, as the Standard's `Preview Tomorrow`: the 80 candidate that follows from what slipped, and at most four 20 lines, each derived from a `fix` that is an action.
3. A `fix` that is a change of environment, such as "laptop opens on DSA.md", becomes a 20 line only when it can be done in the day. Otherwise it stays in the Lose.
4. In the morning `/startday` builds the day from the preview, the weekly Goals and the calendar. Anant approves the 80 and the 20.
5. The Lose stays open in its own note until made up or dropped. The cap is 7.

## Pipeline momentum
- The weekly target is 10 applications, each complete and correct ([[Jarvis Decisions Log]] D15).
- The count is the number of tracker notes whose `date_applied` falls in the current ISO week, Monday to Sunday ([[Jarvis Decisions Log]] D33). The page shows "n of 10".
- The daily floor row is one application. The gap to 10 is shown, not enforced.

## The term end
On 2026-12-24 the Fall 2026 plan closes. Whatever is done is done. A short review, written in the weekly note, decides which Systems rows continue, which stop and which floor rows change ([[Jarvis Decisions Log]] D42). The config table in [[Jarvis Spec - Day Model and Streak]] then gets a new term. The streak carries over, because it counts the floor and not the term.

## Failure modes
| Trigger | Effect | Smallest fix |
|---|---|---|
| The weekly note has no Goals for the week | The 80 has no source | `/startday` says so and asks for the 80 by hand |
| The 80 has no plan note | The 20 cannot be derived | The skill asks for the prerequisites once and writes them |
| A plan changes and the daily line keeps the old text | Two versions exist | The line holds a pointer, and `validate` flags a 20 whose 80 was dropped |
| The term ends and the config is not updated | The page shows rows of a closed plan | The health chip is red from 2026-12-24 |
| An application is counted before it is complete | The count overstates | `date_applied` only on a finished application |
| A Lose's `fix` is a wish | The preview has nothing to derive | `/closeday` asks for one concrete change and writes `(unanswered)` otherwise |
| Dev work starts before 6 pm | The weekly rule breaks | It shows as a missed Blocks line and becomes a Lose |

## Non-Goals
- No plan text is copied into the daily note.
- No new plan is created and no existing plan note is edited by this design.
- No automatic choice of the 80.
- No personal plan in Jarvis.
- No copying of Loses between days.

## Open Questions
None blocking the build. The 2026-12-24 review is scheduled by the plan itself.
