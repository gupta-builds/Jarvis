---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - the-plan
reference_kind: resource
area:
  - "[[Daily Operating System]]"
notes:
  - "[[Jarvis Build Overview]]"
  - "[[The Plan Dashboard Architecture and Infrastructure]]"
  - "[[The Plan Dashboard UI and What Appears]]"
  - "[[The Plan Dashboard Build History and Method]]"
  - "[[The Plan Dashboard Daily Workflow and AI Loop]]"
  - "[[The Plan Dashboard State and Gaps 2026-10-25]]"
---
# The Plan Overview
This is the entry note for how The Plan's dashboard was designed and built. Jarvis keeps it because the two vaults share a daily loop but little else, and the Jarvis daily workflow is being rebuilt next to it. Read this first, then the five notes under `The Plan/`. Every fact was read from The Plan's own notes, its plugin repository, or its vault files between 2026-10-12 and 2026-10-26, and the state note says which parts were checked on disk.

## What The Plan is
The Plan is the second Obsidian vault, at `D:\_Anant\20_Progress\Documents\The Plan`. Jarvis owns work: courses, projects, career mechanics. The Plan owns personal growth: habits, health, money, learning, and one career line a day. Its dashboard design record starts at `40_Resources/Obsidian/Dashboards/Dashboards Hub.md` in that vault.

## Two dashboards, built differently on purpose
| | Jarvis | The Plan |
|---|---|---|
| Medium | A markdown page and a canvas: DataviewJS, Meta Bind, Multi-Column Markdown, one CSS snippet | A private Obsidian plugin, `the-plan-dashboard`, with its own React view |
| What a day is | An 80/20 plan, four wins, a three-row floor, and Daily Loses | Five categories (Morning, Study, Fitness, Mind, Career), each a list of checkbox actions |
| When a day counts | Every number is counted from toggles in today's note | MET at 3 of 5 categories done; one isolated miss is forgiven, two in a row reset the streak |
| How ticking works | Meta Bind toggles bound to frontmatter booleans, because Obsidian does not render task checkboxes inside table cells | Plain `- [ ]` lines with a `[cat:: morning]` field, flipped by `Vault.process` |
| Who computes numbers | Dataview, in the page | One TypeScript engine shared by the plugin, the Claude Code hooks, and the reviews |
| Opens at launch | Homepage opens `10_Areas/Jarvis OS Dashboard.canvas` | Homepage runs the command `the-plan-dashboard:open-dashboard` |

Details for the Jarvis side: [[Jarvis Build Overview]].

## How it was built
1. **A design hour (2026-10-12).** One session designed everything and wrote nothing outside the Dashboards folder: research of both vaults, a Decisions Log of answered questions, four specs, a build plan, and a prompt for every later session.
2. **Research with evidence labels.** Each option for the dashboard medium was marked Verified, Inferred or Unverified. The result was a private plugin, because a markdown note with DataviewJS flickers on refresh and Bases cannot walk a sequence of days to compute a streak.
3. **One prompt per slice.** B1 to B8, then stages S0 to S6, then five plugin prompts. Each runs in its own Claude Code session, reads a shared Build Log first, appends one entry, and stops at its gate.
4. **An orchestration session (2026-10-13).** It built the engine's review modules, the command-line program `plan-cli`, three hooks, and the tests, outside the five prompts.
5. **Reviews.** A corrections note (2026-10-13), a stack and phone audit (2026-10-14), and a full build review (2026-10-25) that found the dashboard had never shown a real number.

The longer account: [[The Plan Dashboard Build History and Method]].

## Where it stands
Built and tested in the repository: the engine, 87 tests, the React view, and the CLI. Not working in the vault on 2026-10-25: an old copy of `.claude` overwrote the skills, agents and hooks on 2026-10-16, and Periodic Notes has been creating `DD-MM-YYYY` daily notes that the engine cannot read, so `plan-cli streak` returns `first_day: null`. The phone has never been tested. See [[The Plan Dashboard State and Gaps 2026-10-25]].

## Map
| Question | Note |
|---|---|
| What is it made of, and how does data move? | [[The Plan Dashboard Architecture and Infrastructure]] |
| What is on the screen, and how does each part draw? | [[The Plan Dashboard UI and What Appears]] |
| What was built when, and how? | [[The Plan Dashboard Build History and Method]] |
| What does the daily loop, the streak and the AI tooling do? | [[The Plan Dashboard Daily Workflow and AI Loop]] |
| What is broken, and what is next? | [[The Plan Dashboard State and Gaps 2026-10-25]] |
