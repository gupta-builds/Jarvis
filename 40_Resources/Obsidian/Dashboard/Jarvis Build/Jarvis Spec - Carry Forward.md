---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - migration
project_kind: spec
next: "Design final. Retirement of the old page happens only after a clean fortnight and on Anant's word"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Plugin Retirement List]]"
---
# Jarvis Spec - Carry Forward
## What This Is
==Every block of the current Jarvis dashboard has a decided fate in the plugin, so nothing disappears by accident.==
The current setup is `00_Dashboard.md`, `10_Areas/Jarvis OS Dashboard.canvas`, the `dashboard.css` snippet, the daily template and the skills. This note lists each part and where it goes. [[Jarvis Build Overview]] describes the current setup and [[Jarvis Dashboard Build Record]] gives its history.

## Current State
Checked on 2026-10-26. `00_Dashboard.md` and the canvas were both rebuilt that day to read today's daily note and every note's open Loses. Homepage opens the canvas. Inline DataviewJS is off in settings.

## Blocks of the old page
| Old block | Source today | Fate in the plugin |
|---|---|---|
| Sync alert banner | Embed of a banner note | Folded into the health chip ([[Jarvis Decisions Log]] D29). The embed stays on the old page until it retires. |
| Current focus (`today_focus`, `today_80`, `today_20`) | Three frontmatter fields on the page, patched by the skills | Retired. The page shows the 80 and the 20 from the daily note, so the skills stop patching these fields. |
| Wins `n/4` and Floor `n/3` tiles | Frontmatter booleans | The two rings, counted from checkbox lines |
| Problems and Study Hours | `lc_count`, `study_today` | Pipeline block with plus and minus |
| Open Loses tile and list | Open tasks under Daily Loses in any note | Loses block. Ticking writes back to the source line. Capped at 7. |
| This Week roll-up | Notes from Monday to today | Seven day row and one totals line in the hero ([[Jarvis Decisions Log]] D30). The clippings count goes to the weekly review. |
| Today's Priorities | Open tasks outside Loses | The 80 and the 20, which hold exactly that |
| Wins and Floor bars | Meta Bind and DataviewJS | The two rings |
| Active Projects | Dataview over `20_Progress` | Three chips showing each project's `next:` ([[Jarvis Decisions Log]] D31) |
| Internship Pipeline | Dataview over the tracker | Pipeline block, from `date_applied` |
| Clippings Queue | Count in `60_Claude/05_Clippings` | Moves to the weekly review ([[Jarvis Decisions Log]] D31) |
| Vault Health | Notes missing `type` or `status` | Behind the health chip, as a count ([[Jarvis Decisions Log]] D29) |
| System, Claude OS, AI and Daily OS link rows | Static wikilinks | Links block |
| Mentorship must-do (Jesse outreach, 2026-11-02) | A typed line on the page | A `[due::]` line on a weekly Goal, shown in the Blocks strip |
| 10_Areas Overview table | Typed table | Stays in `00_Dashboard.md` until it retires, then moves into `Jarvis Vault Architecture` ([[Jarvis Decisions Log]] D32) |

Every block has a fate, so nothing is lost. Three leave the daily page on purpose: the clippings count, the areas table and the sync banner strip.

## The canvas
The canvas has ten text nodes and no edges. It retires with the page. No exploration canvas is kept ([[Jarvis Decisions Log]] D23).

## Template and skills
| Part | Change |
|---|---|
| [[Better Today]] | Rewritten to the shape in [[Jarvis Spec - Day Model and Streak]]. The two Meta Bind tables become checkbox lists and the frontmatter booleans go. `## Proof of the day` is added. |
| [[Daily Note Standard]] | Patched: line formats, the new fields, the Loses lifecycle and the cap, the optional Proof heading, the validator rules. A patch to a standard needs Anant's approval first. |
| [[Daily Close Loop]] | Patched: Loses stay in place, the preview for tomorrow, the cap check, the time read. Needs approval. |
| `/startday` | Writes the 80, 20, wins, floor and Blocks as lines. Builds the day from the preview. Stops patching the `today_*` fields. |
| `/closeday` | Counts ticked lines. Asks the why and the fix. Writes the preview. Fills `[spent::]` and proposes `study_today` through `dashboard-cli plan-time`. Refuses to close with more than 7 open Loses. |
| `daily-operator` agent | Updated to the new shape |
| `.agents/skills/startday` and `closeday` | Left alone. `.claude` is canonical ([[Jarvis Decisions Log]] D41). |

## Old notes
- The 87 notes with Meta Bind inputs stay as history ([[Jarvis Decisions Log]] D40). Removing Meta Bind turns their inputs into raw text ([[Jarvis Plugin Retirement List]]).
- The engine ignores old-shape days.

## Retirement order
1. The plugin ships and passes the acceptance list in [[Jarvis Verification and Risks]] on both laptops.
2. It runs clean for a fortnight.
3. Anant says to retire the page. Homepage is repointed by Anant through the settings screen, since the Homepage settings are under `.obsidian`.
4. The areas table moves into `Jarvis Vault Architecture` with a link-aware move.
5. `00_Dashboard.md` and the canvas are moved to the archive folder only on Anant's word, with a link-aware move and a link check.
6. Plugin removals follow, one at a time, from Anant's own decisions on [[Jarvis Plugin Retirement List]].

## Non-Goals
- No change to any note in this design.
- No removal of a plugin, snippet or setting.
- No merge of the canvas and the page before the plugin exists.
- No move of personal-life content into Jarvis.

## Open Questions
None blocking the build.
