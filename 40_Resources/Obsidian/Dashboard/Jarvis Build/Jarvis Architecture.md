---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - architecture
project_kind: spec
next: "Design final. A build session creates the repository on the Acer"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Verification and Risks]]"
  - "[[Jarvis Research - Outside Sources]]"
---
# Jarvis Architecture
## What This Is
==The Jarvis dashboard is three replaceable layers: the daily notes as data, a pure TypeScript engine, and a React view, plus a command-line program that gives Claude the same numbers the screen shows.==
It follows the structure of The Plan's plugin, which worked in its tests, and adds guards for the faults that plugin met in practice. The two plugins share no code ([[Jarvis Decisions Log]] D1).

## Current State
Checked on 2026-10-26.
- Jarvis is a git repository with remote `https://github.com/gupta-builds/Jarvis.git`. Commits are auto-sync commits. The Dell and the Acer sync through it.
- `.gitignore` ignores `workspace.json`, caches, the `data.json` of three plugins and `.claude/settings.json`. It does not ignore `.obsidian/plugins/jarvis-dashboard/`. A `git check-ignore` test found `main.js` would be tracked. Twenty-five plugin folders are tracked today.
- Obsidian Sync is off in the core plugin list.
- `30_Order/System/` holds `claude-workflow`, `cursor-workflow`, `excalidraw-mcp`, `jarvis-cli`, `jarvis-memory`, `sync-workflow` and `vault-lint`. `jarvis-cli` holds `jarvis.ps1`, `jarvis_ops.py` and a README, so it is taken.
- The Plan's plugin repository, `D:\_Anant\20_Progress\Projects\the-plan-dashboard`, has 3 commits and no remote. Its engine has 87 tests. Its deployed build predates two later changes. An old copy of `.claude` overwrote its skills and hooks on 2026-10-16 because two laptops auto-synced ([[Jarvis Research - The Plan Parallel Builds]]).
- Nothing in this note is built.

## Layers
| Layer | What it is | Replaceable because |
|---|---|---|
| Data | Daily notes `YYYY-MM-DD.md` in `10_Areas/Life/Enumerate/Daily/`, the weekly note, tracker notes. Plain markdown. | The plugin can be disabled and nothing is lost |
| Engine | Pure TypeScript in `src/core/`. It imports nothing from Obsidian or Node. Text in, numbers out. | The plugin and the CLI run the same file |
| View | A React 19 view that draws the page from the engine's model | It holds no rule of its own |
| CLI | `dashboard-cli`, the engine bundled for Node | Claude's skills read its JSON and never compute a number |

## Engine modules
`parse` (lines, fields, headings), `streak` (the rule in [[Jarvis Spec - Day Model and Streak]]), `edit` (replace one line with the stale-line check, keeping LF or CRLF), `config` (floor rows per term, milestones and titles, folder names, term end, the allowlist for The Plan), `periods` (ISO weeks and months), `validate` (the eleven rules), `loses` (open Loses across notes, age, cap), `blocks` (parse `### Blocks`, find now and next, join `[spent::]`), `pipeline` (count `date_applied` in a week), `planTime` (allowlisted extraction from The Plan's text), `model` (everything the page needs in one call).

## Plugin
- Id `jarvis-dashboard`. Name "Jarvis dashboard". `isDesktopOnly: true` ([[Jarvis Decisions Log]] D26). Never submitted to the community directory.
- `isDesktopOnly: true` allows Node and Electron APIs. Version 1 uses none. The Plan is read only through the CLI.
- Three write primitives and no others, defined in [[Jarvis Spec - Day Model and Streak]]: replace one line, change a frontmatter number, create today's note.
- Obsidian rules from the research ([[Jarvis Research - Outside Sources]]): register vault events inside `workspace.onLayoutReady`, because `create` also fires for every existing file at load. Read with `read` before a modification and with `cachedRead` for display. Edit with `Vault.process` and `processFrontMatter`, both atomic. Find the view with `getLeavesOfType`, never store a view instance. Use `normalizePath` on every path. Register every event and interval.
- Reads tracker `date_applied` through the metadata cache and refreshes on the cache's `changed` event, which is not called on rename, so it also listens to the vault `rename` event.
- Interface rules: no `innerHTML`, `this.app` only, sentence case in the interface, no default hotkeys.
- React 19 ([[Jarvis Decisions Log]] D25). First paint is measured against the 2 second budget.

## Command-line program
`dashboard-cli`, bundled for Node and deployed to `30_Order/System/dashboard-cli/` ([[Jarvis Decisions Log]] D43). Each command prints JSON and writes nothing.
| Command | Prints |
|---|---|
| `streak <dailyFolder> <date>` | Current, best, floor rows done, at risk, 30 days of status |
| `day <dailyFolder> <date>` | One day's lines and marks |
| `week <date>` | ISO week totals: days, wins, floors, problems, study, applications |
| `validate <note>` | Breaches of the eleven rules |
| `loses <dailyFolder>` | Open Loses across notes, age and count out of 7 |
| `plan-time <date>` | Allowlisted time overview and time log entries from The Plan, or `not_defined` |
| `doctor` | Misnamed notes, leftover placeholders, plugin version against the repo, the allowlist against The Plan's live headings, skills, agents and hooks present, the term config date |

`doctor` exists because of The Plan's two silent failures: misnamed notes and an overwritten `.claude`.

## Config
One exported object, per machine where needed.
| Key | Holds |
|---|---|
| `floorRows` | The term table: `application`, `practice`, `class` for Fall 2026 |
| `termEnd` | 2026-12-24 |
| `milestones`, `milestoneTitles` | 3, 7, 21, 66, 100 and The Plan's titles |
| `loseCap` | 7 |
| `weeklyApplicationTarget` | 10 |
| `heatDays` | 30 |
| `dailyFolder`, `weeklyFolder`, `trackerFolder` | The Jarvis folders |
| `planVaultPath` | The Plan's path, set on each laptop |
| `planAllowlist` | The headings and the time log folder the reader may take. Empty until The Plan defines them. |
| `projectChips` | The three project notes whose `next:` shows |

## Repository, build and deploy
- The repository lives on the Acer ([[Jarvis Decisions Log]] D27). The path is chosen on the Acer when the build starts. The Dell receives only the built files, through git.
- A private GitHub repository for the source is recommended, because The Plan's plugin repository has no remote and its source exists on one laptop only. It is created only after Anant says yes.
- Commands: `npm run dev`, `npm test`, `npm run build`, `npm run build:cli`, `npm run deploy`, `npm run deploy:cli`. Deploy copies `main.js`, `manifest.json` and `styles.css` to `.obsidian/plugins/jarvis-dashboard/` and the CLI to `30_Order/System/dashboard-cli/`.
- The vault copy of the plugin is never edited by hand.
- A write under `.obsidian` needs Anant's yes each time.

## Tests
- Golden month fixtures with values worked out by hand before any engine code: a milestone, a forgiven miss, a break, a missing note, a month boundary and a leap year.
- One unit test per validator rule, per streak edge and per Loses rule (cap, age, `[>]` read as closed).
- Edit tests: one line changes, LF and CRLF are kept, a stale line is refused, frontmatter bytes stay identical, an edit keeps `[for::]`.
- The three page tests in [[Jarvis Spec - Dashboard Page]]: style, real browser, live.
- A reader test: a Plan note with private headings goes in and the output holds only allowlisted fields.
- A grep test that the bundle has no hard-coded hex colour.
- A debug command that prints the screen's numbers, compared with `dashboard-cli` for the last 30 days.

## Guards for two laptops
1. The health chip shows the plugin version and build stamp, and `doctor` compares them with the repo.
2. `doctor` checks the skills, agents and hooks, so a stale overwrite shows within a day.
3. A plugin build travels through git. A stale tree on the other laptop can overwrite it, so each release is checked on both laptops.
4. Jarvis's auto-sync is not changed by this build.

## Non-Goals
- No shared code with The Plan's plugin.
- No phone build.
- No outside service called from the plugin.
- No community-directory submission.
- No change to Jarvis's sync or hooks.
- No validator hook in version 1 ([[Jarvis Decisions Log]] D44).

## Open Questions
None blocking the build.
