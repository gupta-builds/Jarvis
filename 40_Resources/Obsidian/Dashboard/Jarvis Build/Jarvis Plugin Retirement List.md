---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - plugins
reference_kind: resource
notes:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Carry Forward]]"
---
# Jarvis Plugin Retirement List
==Anant decides which plugins go. This note is evidence only, and nothing is removed.== The suggestion column is the assistant's reading, not a decision.

## How this was checked
On 2026-10-26, read from `.obsidian/plugins/*/manifest.json`, `community-plugins.json`, the Lazy Plugin Loader's settings (it holds no secret), the enabled CSS snippets and `appearance.json`, and counted in `10_Areas`, `20_Progress`, `30_Order`, `40_Resources`, `60_Claude` and `00_Dashboard.md`. The archive was not searched. Counts are notes, not blocks. Twenty-six plugin folders are installed. `community-plugins.json` lists 11. The Lazy Plugin Loader loads the others after a delay, so the file is not the enabled list.

## Tied to the old dashboard
| Plugin or item | Version | What depends on it | If removed | Suggestion |
|---|---|---|---|---|
| Meta Bind | 1.5.1 | 87 notes with `INPUT[...]` or `BUTTON[...]`, nearly all daily notes. Today's `Better Today` template. | Those inputs show as raw text in old notes. | Keep until the template and old notes are decided, then remove |
| Multi-Column Markdown | 0.9.1 | 14 notes, including `00_Dashboard.md` | Columns collapse into one | Safe after `00_Dashboard.md` retires |
| `dashboard.css` snippet | | `00_Dashboard.md` classes `.stat-grid`, `.stat-tile`, `.progress-wrap`. 26 notes set `cssclasses`. | The old page loses its tiles. Other classed notes are unchecked. | Check the 26 notes first |

## Keep, used far beyond the dashboard
| Plugin | Version | What depends on it | Note |
|---|---|---|---|
| Dataview | 0.5.68 | 440 query blocks and 80 DataviewJS blocks | Boards and trackers depend on it |
| Kanban | 2.0.51 | 17 notes | |
| Local REST API | 5.5.2 | The `jarvis` MCP tools that Claude uses to read and write this vault | Removing it cuts Claude's access |
| Latex Suite | 1.14.0 | 157 notes with `$$` | |
| Spaced Repetition | 1.15.4 | 16 notes | |
| Templater | 2.26.0 | 74 template files with `<%`. Its "Trigger on new file creation" setting is off, which leaves placeholders in new notes. | Needed until the plugin creates notes itself |

## Depends on what the design decides
| Plugin | Version | Question |
|---|---|---|
| Homepage | 4.5.0 | It will open the plugin view. Stays. |
| Periodic Notes | 0.0.17 | The plugin creates today's note ([[Jarvis Decisions Log]], D11). Periodic Notes also makes weekly and monthly notes. |
| Calendar | 1.5.10 | Uses Periodic Notes' settings for weekly links |
| QuickAdd | 2.32.1 | Capture choices. Its `data.json` is not read. |
| Excalidraw, ExcaliBrain | 2.29.0, 0.2.19 | 21 drawing files. Needed only if the map and OS drawings stay. |
| Obsidian Git | 2.42.0 | The vault syncs through git. Check its auto settings before changing anything. |

## Not related to the dashboard
Code Styler 1.1.7, File Explorer Plus 1.3.1, Ninja Cursor 0.0.14, URL into selection 1.11.4, Recent Files 1.7.10, Recent Edits 1.6.0, Cmdr 0.7.0, Style Settings 1.0.9, Text Extractor 0.7.0, Lean Terminal 1.5.0, Lazy Plugin Loader 1.0.24.

## Theme and snippets
Theme AnuPpuccin. Enabled snippets: `dashboard`, `myedits`, `rainbowfile_colors`, `readingview`, `headerspace`. Only `dashboard` relates to the old page.

## What the finished design says about each group
- Meta Bind and Multi-Column Markdown are the two plugins the dashboard no longer needs ([[Jarvis Spec - Carry Forward]]). Their other uses are the 87 and 14 notes above.
- Periodic Notes and Calendar are the question: the plugin creates today's note, but Periodic Notes also makes weekly and monthly notes.
- Templater stays while any template carries `<% %>`.
- Local REST API stays. The `jarvis` MCP tools depend on it.

## What would make each removal safe
1. The plugin has run clean for a fortnight and the acceptance list in [[Jarvis Verification and Risks]] passed.
2. The old page and canvas are retired on Anant's word.
3. The notes that depend on the plugin are converted, archived on purpose or accepted as history.
4. Each removal is its own step, with the plugin folder kept in git history.

## Decision record
| Plugin | Decision | Date |
|---|---|---|
| | | |
