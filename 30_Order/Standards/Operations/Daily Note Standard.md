---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
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
This is the Standard for the notes in `10_Areas/Life/Enumerate/Daily/`. It is not a standing plan ([[Plan Standard]]) and not the weekly, monthly, or yearly note ([[Periodic Review Note Standard]]). The note fits even if the day is never closed, and it holds no health, meal, or money tracking: that belongs in The Plan ([[AGENTS]], golden rule 6).
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

| Item | Rule |
|---|---|
| Allowed folders | `10_Areas/Life/Enumerate/Daily/` |
| File name | The date, `YYYY-MM-DD`. The title line is the fixed prompt `# Did you get better today?`. |
| Kind | `type: thought` with `thought_kind: daily`. |
| Status | `active` while the day runs, `complete` once closed. `day_state` is `planned`, then `closed` when End of Day exists. |
## Headings
### Frontmatter
- **Write:** `thought_kind: daily`, `status`, `day_state`, `created`, `updated`, `tags: [daily]`. The toggles `win_project`, `win_career`, `win_cleanup`, `win_review`, `floor_1` to `floor_3` are booleans; `lc_count` and `study_today` are typed numbers; `wins_done` and `floors_done` are counted at close.
- **Length:** one line per key.
- **Never:** an unresolved date placeholder in `created` or `updated`. Periodic Notes copies the template, and Templater resolves it only when "Trigger Templater on new file creation" is on; date queries then skip the note.
- **Right:** `day_state: planned`
- **Wrong:** `updated: <% tp.date.now("YYYY-MM-DD") %>`
### Morning Plan
- **Write:** `*Goal*:` one line. `### 80 - The One Thing` holds one checkbox ("I will ... at ... in ..."). `### 20 - Supporting Work` holds two to four. `### Blocks` lists the day's calendar events, time then deliverable. `**Do NOT do today:**` is copied from the plan's anti-drift rules. All of it comes from the weekly Goals and the calendar, not memory.
- **Length:** the 80 is a single task.
- **Never:** the template's empty checkbox or `[BEHAVIOR]` placeholder left in place.
- **Right:** `*Goal*: Close the Cover Letter blocker and send the first real application; start Midterm 1 review alongside it.`
- **Wrong:** `> I will [BEHAVIOR] at [TIME] in [LOCATION].`
### Daily Wins
- **Write:** four rows: Project, Career, Cleanup, Review. The target comes from the weekly Goals and is a deliverable, not a topic. Done is a toggle.
- **Length:** four rows.
- **Never:** a topic as a target. A topic cannot be checked.
- **Right:** None yet.
- **Wrong:** `| Project  | shipped something  |`
### Daily Loses
- **Write:** promises not kept, written the day they slip, until made up. One task line each, with inline fields (the two tables below). Sources: a weekly Goal or Friday checkpoint not met, a calendar block that passed without its deliverable, a toggle still `false` at close, an open Lose from an earlier day. Lines are never deleted.
- **Length:** one line per promise.
- **Never:** an invented `why`. It is the owner's words; if unanswered it reads `(unanswered)`.
- **Right:** `- [ ] Did not wake up at 6am, did not follow the morning routine. [why:: (unanswered)] [fix:: (unanswered)] [from:: other] [since:: 2026-10-26]`
- **Wrong:** None seen.

| Field | Holds |
|---|---|
| text | The promise, as the weekly note, the calendar or the toggle named it |
| `why` | Why, how and where it slipped, in Anant's words |
| `fix` | One concrete change that makes the same loss less likely, not a wish |
| `from` | `weekly`, `calendar`, `win`, `floor`, or `other` |
| `since` | The date it first slipped; it never changes, so age is today minus `since` |

| Mark | Meaning |
|---|---|
| `[ ]` | Open. Counts on the dashboard and ages one day each midnight |
| `[x]` | Made up. It stays as a record and the dashboard drops it |
| `[>]` | Carried to a newer day. Only the newest copy is open |
| `[-]` | Dropped on purpose, with a reason in `why` |
### Daily Floor
- **Write:** rows from the active plan's Systems table, not the template: track, target, topic, and a `floor_n` toggle.
- **Length:** up to three rows.
- **Never:** a heading that names the term ("Fall Daily Floor"). It breaks next term, and a skill that patches by name stops finding it.
- **Right:** `## Daily Floor`
- **Wrong:** `## Fall Daily Floor`
### Carryover from Previous Sessions
- **Write:** optional. Work the session log left open. Broken promises go in Daily Loses.
- **Length:** one line per item.
- **Never:** a promise that belongs in Daily Loses.
- **Right:** None yet.
- **Wrong:** None seen.
### Productivity
- **Write:** optional. Inputs bound to `lc_count` and `study_today`, with no totals.
- **Length:** two lines.
- **Never:** meals, water, or health tracking.
- **Right:** `**Study hours:**`
- **Wrong:** None seen.
### End of Day
- **Write:** optional. A scorecard, `Day Status` GREEN or RED, `What Actually Happened` in two or three honest sentences, a `Friction Fix` when RED, and `Preview Tomorrow`.
- **Length:** a short block.
- **Never:** text written from memory on an unclosed day, which stays `planned`.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| A toggle is a Meta Bind input bound to one frontmatter boolean | The dashboard, `/closeday`, and the weekly review all read it as evidence | Lint, check 1 (`bad-bool`) |
| Nobody types `wins_done` or `floors_done`; they are counted at close | An unclosed day shows 0 while the dashboard counts live | Reader |
| Every open Lose has `since`, and a missing `why` reads `(unanswered)` | Age is `today - since` | Reader |
| `day_state: closed` appears only when End of Day exists | A closed flag with no scorecard is a lie | Reader |
| No heading names a term | Skills patch headings by name | Reader |
| The four spec headings appear (Tier 2 does not enforce them) | `/startday` patches by section name | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `thought_kind: reflection` | `daily` | Mechanical |
| `status: seed` | `active`, or `complete` if End of Day exists | Mechanical |
| No `day_state` | `closed` if End of Day exists, else `planned` | Mechanical |
| `tags: ["#journal"]` | `[daily]` | Mechanical |
| `created` or `updated` empty or an unresolved `<% %>` | The date in the file name | Mechanical |
| `## Fall Daily Wins`, `## Summer OS Checklist` | `## Daily Wins` | Mechanical |
| `## Fall Daily Floor`, `## Academic Stack` | `## Daily Floor` | Mechanical |
| `ac_application`, `ac_leetcode`, `ac_class`, and the Summer `ac_*` toggles | `floor_1`, `floor_2`, `floor_3` by row order, in frontmatter and in the `INPUT[toggle:...]` cells | Mechanical |
| An em dash in `### 80` or `### 20` headings | A hyphen: `### 80 - The One Thing` | Mechanical |
| `**Wins hit:** INPUT[number:wins_done]` typed by hand | Remove the line; the close counts it | Mechanical |
| `habits_done` | Not written any more; the floor toggles replace it | Mechanical |
| Daily Loses as a bare numbered list | Task lines with `why`, `fix`, `from`, `since` | Judgment: the why is Anant's |
| Meals and Water table, a Physical win row | Remove; it belongs in The Plan | Judgment |
## Done Conditions
- Frontmatter passes the Spec, and `day_state: closed` appears only when End of Day exists.
- Morning Plan has a filled 80, at least two 20 items, and Blocks or "connector unavailable".
- Every open Lose has `since`; a missing `why` reads `(unanswered)`.
- No heading names a term.
- A closed day has `wins_done` and `floors_done` equal to the toggle count, End of Day, and `status: complete`.
- A day left `planned` is counted in the weekly review, not failed ([[Daily Close Loop]]).
## Gold Standard Example
None yet. Two dailies pass lint (`2026-10-18`, `2026-10-26`) but both are unfilled, so they show the shape and not the content. No note has been closed with `/closeday` and carries an End of Day. The closest filled note is `2026-10-05`, in the old shape.
Measured 2026-11-07 with `--family daily-note`: 26 notes, 2 pass. `2026-11-04` fails on an unresolved `updated` placeholder.
