---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
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
  - "[[Daily Workflow Standard]]"
  - "[[Periodic Review Note Standard]]"
  - "[[Frontmatter Standard]]"
---
# Daily Note Standard
==A daily note is the day's plan first and its record second: the plan sections make it fit, and closing the day only adds to it.==
This is the Standard for the note in `10_Areas/Life/Enumerate/Daily/`. `/startday` writes the plan, `/closeday` may add a record, and the note fits whether or not the day is ever closed. Standing plans are [[Daily Workflow Standard]]; weekly, monthly, and yearly notes are [[Periodic Review Note Standard]].
## Spec
```json
{
  "family": "daily-note",
  "tier": 2,
  "match": {"type": "thought", "kind": "daily", "path": "^10_Areas/Life/Enumerate/Daily/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "active", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "thought_kind", "day_state"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "lc_count": "number", "study_today": "number", "wins_done": "number", "habits_done": "list"},
  "headings": ["Morning Plan", "Daily Wins", "Daily Floor"],
  "optional_headings": ["Carryover from Previous Sessions", "Productivity", "End of Day"],
  "legacy_match": [{"path": "^10_Areas/Life/Enumerate/Daily/"}]
}
```
## Headings
The title is the fixed prompt `# Did you get better today?`, which `/startday` patches under.
### Frontmatter
`type: thought`, `thought_kind: daily`, `status` (`active` while the day runs, `complete` once closed), `day_state` (`planned` or `closed`), `created`, `updated`, `tags: [daily]`. Optional tracking keys: `lc_count`, `study_today`, `wins_done` (numbers), `habits_done` (list), the toggles `win_project`, `win_career`, `win_cleanup`, `win_review`, and `floor_1` to `floor_3`.
> [!WARNING]
> A `created` that still holds `<% tp.date.now("YYYY-MM-DD") %>`. Four dailies carry it, and every date query skips them.
### Morning Plan
`*Goal*:` one line. Under it, `### 80 — The One Thing` holds one sentence ("I will ... at ... in ...") and one checkbox; `### 20 — Supporting Work` holds two to four checkboxes; `**Do NOT do today:**` is copied from the active plan's anti-drift rules.
*Density:* the 80 is a single task.
> [!WARNING]
> Leaving the template's bracketed sentence unfilled. Five dailies are untouched shells.
### Daily Wins
Four rows: Project, Career, Cleanup, Review. The target comes from the plan; Done is a toggle.
### Daily Floor
Rows come from the active plan's Systems table, not from the template. Each row has a track, a target, today's topic, and a `floor_n` toggle.
> [!WARNING]
> A heading that names the term ("Fall Daily Floor", "Summer OS Checklist"). The note then breaks the next term, and a skill that patches by name stops finding it.
### Carryover from Previous Sessions (optional)
Items the last session-log entries left open and nothing closed.
### Productivity (optional)
Inputs bound to `lc_count`, `study_today`, `wins_done`, and habit checkboxes from the active board in `10_Areas/Life/Habits/`. No meals, water, or other health tracking: that belongs in The Plan ([[AGENTS]], golden rule 6).
### End of Day (optional)
Appended by `/closeday`: a scorecard of the plan's tracks, `Day Status` GREEN or RED, `What Actually Happened` in two or three honest sentences, a `Friction Fix` when RED, and `Preview Tomorrow`. Never written from memory after the day; an unclosed day stays `planned`.
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
| Meals and Water table, a Physical win row | Remove; it belongs in The Plan | judgment |
## Done Conditions
- Frontmatter passes the Spec, and `day_state: closed` appears only when End of Day exists.
- Morning Plan has a filled 80 and at least two 20 items.
- No heading names a term.
- A closed day has the tracking keys written, End of Day appended, and `status: complete`.
- A day left `planned` is counted in the weekly review, not failed ([[Daily Close Loop]]).
## Gold Standard Example
None yet: no daily has the new keys. The closest is [[2026-10-05]], a filled Morning Plan with a named blocker and a deadline callout, in the old shape. The first daily made from [[Better Today]] and closed with `/closeday` should be named here.
