---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-26
tags:
  - system
  - standards
system_kind: standard
family: daily-note
tier: 2
maps_to:
  - "[[Better Today]]"
used_by:
  - "[[Daily Close Loop]]"
gold_standard: none
notes:
  - "[[Plan Standard]]"
  - "[[Periodic Review Note Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[How to Use Google Calendar]]"
---
# Daily Note Standard
==A daily note is the day's plan first and its record second: the toggles and Daily Loses keep the record honest.==
The Standard for `10_Areas/Life/Enumerate/Daily/` notes. `/startday` writes the plan and carries open Loses forward, `/closeday` counts the toggles and writes the Loses, and the note fits even if the day is never closed. Standing plans are [[Plan Standard]]; weekly, monthly, and yearly notes are [[Periodic Review Note Standard]].
## Spec
```json
{
  "family": "daily-note",
  "tier": 2,
  "match": {"type": "thought", "kind": "daily", "path": "^10_Areas/Life/Enumerate/Daily/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "active", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "thought_kind", "day_state"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "lc_count": "number", "study_today": "number", "wins_done": "number", "floors_done": "number", "win_project": "bool", "win_career": "bool", "win_cleanup": "bool", "win_review": "bool", "floor_1": "bool", "floor_2": "bool", "floor_3": "bool"},
  "headings": ["Morning Plan", "Daily Wins", "Daily Loses", "Daily Floor"],
  "optional_headings": ["Carryover from Previous Sessions", "Productivity", "End of Day"],
  "legacy_match": [{"path": "^10_Areas/Life/Enumerate/Daily/"}]
}
```
## What the toggles do
A toggle is a Meta Bind input bound to one frontmatter boolean. It is evidence, and three things read it:
- **Dashboard.** `00_Dashboard.md` counts `win_*` out of 4 and `floor_*` out of 3 live, and stores no copy.
- **`/closeday`.** It counts them into `wins_done` and `floors_done`, never asks, and turns every toggle still `false` into a Daily Loses line.
- **Weekly review.** It sums `wins_done` and `floors_done` across the week.
Nobody types the two totals. An unclosed day has them at 0 while the dashboard shows the live count.
## Headings
The title is the fixed prompt `# Did you get better today?`.
### Frontmatter
`type: thought`, `thought_kind: daily`, `status` (`active` while the day runs, `complete` once closed), `day_state` (`planned` or `closed`), `created`, `updated`, `tags: [daily]`. Tracking keys: the toggles `win_project`, `win_career`, `win_cleanup`, `win_review`, `floor_1` to `floor_3` (booleans); `lc_count` and `study_today` (typed numbers); `wins_done` and `floors_done` (counted at close).
> [!WARNING]
> A `created` that still holds `<% tp.date.now("YYYY-MM-DD") %>`. Periodic Notes copies the template, and Templater resolves the placeholder only when "Trigger Templater on new file creation" is on. Otherwise date queries skip the note. `/startday` resolves it to the file name's date.
### Morning Plan
`*Goal*:` one line. Under it, `### 80 - The One Thing` holds one checkbox ("I will ... at ... in ..."); `### 20 - Supporting Work` holds two to four; `### Blocks` lists the day's calendar events, time then deliverable; `**Do NOT do today:**` is copied from the plan's anti-drift rules. All of it comes from the weekly Goals and the calendar, not memory.
*Density:* the 80 is a single task.
> [!WARNING]
> Leaving the template's empty checkbox unfilled.
### Daily Wins
Four rows: Project, Career, Cleanup, Review. The target comes from the weekly Goals and is a deliverable ("CSCI 4061 P2: Part 1 tests pass"), not a topic; Done is a toggle.
### Daily Loses
==Promises not kept, written the day they slip, until made up.== One task line each, with inline fields:
```
- [ ] CSCI 4041: 5 problems logged in Weekly Set [why:: opened YouTube first, no slot] [fix:: laptop opens on DSA.md at 9:30] [from:: weekly] [since:: 2026-10-26]
```
| Field | Holds |
|---|---|
| text | The promise, as the weekly note, the calendar or the toggle named it. |
| `why` | Why, how and where it slipped, in Anant's words. The assistant asks and never invents it. If unanswered, `(unanswered)`. |
| `fix` | One concrete change that makes the same loss less likely. Not a wish. |
| `from` | `weekly` (a Goal or Friday checkpoint), `calendar` (a block that passed), `win`, `floor`, or `other`. |
| `since` | The date it first slipped. It never changes, so age is `today - since`. |
The checkbox mark is the state:

| Mark | Meaning |
|---|---|
| `[ ]` | Open. Counts on the dashboard and ages one day each midnight. |
| `[x]` | Made up. It stays in the note as a record, and the dashboard drops it. |
| `[>]` | Carried. `/startday` copied it to the new day and marked the old line. Only the newest copy is open. |
| `[-]` | Dropped on purpose. Needs a reason in `why`. |
Sources: a weekly Goal or Friday checkpoint not met, a calendar block that passed without its deliverable, a toggle still `false` at close, an open Lose from an earlier day. Lines are never deleted.
### Daily Floor
Rows come from the active plan's Systems table, not the template: track, target, topic, and a `floor_n` toggle.
> [!WARNING]
> A heading that names the term ("Fall Daily Floor"). It breaks next term, and a skill that patches by name stops finding it.
### Carryover from Previous Sessions (optional)
Work the session log left open. Broken promises go in Daily Loses.
### Productivity (optional)
Inputs bound to `lc_count` and `study_today`, no totals. No meals, water, or health tracking: that belongs in The Plan ([[AGENTS]], golden rule 6).
### End of Day (optional)
Appended by `/closeday`: a scorecard, `Day Status` GREEN or RED, `What Actually Happened` in two or three honest sentences, a `Friction Fix` when RED, and `Preview Tomorrow`. Never written from memory; an unclosed day stays `planned`.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `thought_kind: reflection` | `daily` | mechanical |
| `status: seed` | `active`, or `complete` if End of Day exists | mechanical |
| No `day_state` | `closed` if End of Day exists, else `planned` | mechanical |
| `tags: ["#journal"]` | `[daily]` | mechanical |
| `created` empty or an unresolved `<% %>` | The date in the file name | mechanical |
| `## Fall Daily Wins`, `## Summer OS Checklist` | `## Daily Wins` | mechanical |
| `## Fall Daily Floor`, `## Academic Stack` | `## Daily Floor` | mechanical |
| `ac_application`, `ac_leetcode`, `ac_class`, and the Summer `ac_*` toggles | `floor_1`, `floor_2`, `floor_3` by row order, in frontmatter and in the `INPUT[toggle:...]` cells | mechanical |
| `### 80 — The One Thing` (em dash) | `### 80 - The One Thing` | mechanical |
| `**Wins hit:** INPUT[number:wins_done]` typed by hand | Remove the line; `/closeday` writes the count | mechanical |
| `habits_done` | Not written any more; the floor toggles replace it | mechanical |
| Daily Loses as a bare numbered list | Task lines with `why`, `fix`, `from`, `since` | judgment: the why is Anant's |
| Meals and Water table, a Physical win row | Remove; it belongs in The Plan | judgment |
## Done Conditions
- Frontmatter passes the Spec, and `day_state: closed` appears only when End of Day exists.
- Morning Plan has a filled 80, at least two 20 items, and Blocks or "connector unavailable".
- Every open Lose has `since`; a missing `why` reads `(unanswered)`.
- No heading names a term.
- A closed day has `wins_done` and `floors_done` equal to the toggle count, End of Day, and `status: complete`.
- A day left `planned` is counted in the weekly review, not failed ([[Daily Close Loop]]).
## Gold Standard Example
None yet. Name the first daily made from [[Better Today]] and closed with `/closeday`. The closest old-shape note is [[2026-10-05]].