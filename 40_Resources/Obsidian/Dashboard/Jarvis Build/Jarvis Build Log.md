---
type: system
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - build-log
system_kind: log
notes:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Verification and Risks]]"
---
# Jarvis Build Log
Handoff between the build prompts. Each prompt reads this note first and appends one entry at the end of its run. An entry holds facts only: what was built, what was checked and the result, decisions made, and what the next prompt must know. Earlier entries are never rewritten.

## Fixed answers (2026-10-26)
| Item | Value |
|---|---|
| Plugin id | `jarvis-dashboard` |
| Code location | On the Acer. The path is chosen when the build starts. The Dell receives built files through git. |
| Hosting | A private GitHub repository for the source is recommended, created only after Anant says yes in the session |
| Stack | TypeScript, React 19, `isDesktopOnly: true`, no Node API in version 1 |
| CLI | `dashboard-cli` in `30_Order/System/dashboard-cli/` |
| Devices | The Dell and the Acer, Obsidian full screen. No phone. |
| Week | ISO, Monday to Sunday |
| Open Loses cap | 7 |
| Daily folder | `10_Areas/Life/Enumerate/Daily` |
| Day rollover | Midnight. A tick after midnight belongs to the new date. |
| Streak | The floor, one forgiven miss, two in a row reset |
| Floor rows, Fall 2026 | `application`, `practice`, `class` |
| Term end | 2026-12-24 |
| Weekly application target | 10 |
| Calendar account | `gupt0479@umn.edu`, read through Claude only |
| Model for every prompt | Sonnet 5.5 |

## Entries

### 2026-10-26, design notes written
- Written in The Plan's `40_Resources/Obsidian/Dashboards/Jarvis Build/` as if they were in Jarvis, to be cut and pasted into `40_Resources/Obsidian/Dashboard/Jarvis Builds/` in the Jarvis vault. Eleven notes, listed in [[Jarvis Build Hub]].
- Checked: the standards for specs, plans and prompts, the Daily Note Standard, the Daily Close Loop, the calendar guide, the weekly note [[2026-W44]], the Fall 2026 plan, the plugin list, the git ignore rules and the tracker's note fields.
- Not checked: the notes were not linted with Vault Lint, because they are outside Jarvis. No wikilink to a Jarvis note was resolved in The Plan, because those targets exist only in Jarvis. Names were checked against Jarvis with a file search.
- Open: every question under Open Questions in [[Jarvis Build Hub]]. `Prompts.md` is not written yet.
- The next prompt must know: the day model replaces the frontmatter toggles built on 2026-10-26 morning ([[Jarvis Decisions Log]], Correction 3).

### 2026-10-26, design finalized
- Every open question was answered or defaulted. [[Jarvis Decisions Log]] now holds D1 to D45 and nine corrections. Defaults taken by the assistant are D32 to D45.
- Two research notes were added: [[Jarvis Research - Outside Sources]] and [[Jarvis Research - The Plan Parallel Builds]]. [[Jarvis Build Hub]] is now the source of truth and maps every feature to its owning note.
- Checked: The Plan's changes of 2026-10-26 (its restore commit, Decision 51 and its daily template), the Obsidian API documentation through search and the typed docs index, `jarvis-cli` contents, git ignore behaviour for the plugin folder.
- Settled by check: the CLI is `dashboard-cli` because `jarvis-cli` is taken; the week is ISO; the plugin folder is tracked by git.
- Still unverified: rows 1 to 7, 9, 10 and 13 to 17 of [[Jarvis Verification and Risks]].
- Waiting on The Plan: the time overview heading, the time log folder and entry format, and the structure of its daily template.
- Prompts are not written. They are written in a separate session from these notes.
- The next prompt must know: the page cannot be proven no-scroll in jsdom. It needs the real-browser and live checks in [[Jarvis Spec - Dashboard Page]].
