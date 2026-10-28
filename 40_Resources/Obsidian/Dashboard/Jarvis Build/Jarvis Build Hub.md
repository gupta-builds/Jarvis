---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - plan
project_kind: plan
next: "Design is final. A separate session writes the build prompts from these notes"
related_progress:
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Spec - Plans Feed]]"
  - "[[Jarvis Spec - Automation Layer]]"
  - "[[Jarvis Spec - Carry Forward]]"
  - "[[Jarvis Architecture]]"
  - "[[Jarvis Plugin Retirement List]]"
  - "[[Jarvis Verification and Risks]]"
  - "[[Jarvis Research - Outside Sources]]"
  - "[[Jarvis Research - The Plan Parallel Builds]]"
  - "[[Jarvis Build Log]]"
---
# Jarvis Build Hub
## Goal
==Build a private `jarvis-dashboard` plugin that shows one no-scroll page of the Jarvis working day, counts a floor streak, and removes the friction from planning, ticking and closing the day.==
This note is the source of truth for the design. Every feature of the dashboard is listed below with the note that defines it. If a note and this table disagree, fix the note and then this table. The plugin is the Jarvis counterpart of The Plan's dashboard and avoids the faults that one met: silent zeros from a misnamed note, an old `.claude` overwriting the skills, screens never shown real data and a verification table left empty. Its home in the Jarvis vault is `40_Resources/Obsidian/Dashboard/Jarvis Builds/`. These notes were written in The Plan and are to be cut and pasted there.

## Status
| Item | State on 2026-10-26 |
|---|---|
| Design | Final. Every question was answered or defaulted ([[Jarvis Decisions Log]], D1 to D45). |
| Build | Nothing built |
| Build prompts | Not written. A separate session writes them from these notes. |
| Waiting on The Plan | The time overview heading, the time log folder and entry format, and its daily template structure |
| Unverified claims | Seventeen rows in [[Jarvis Verification and Risks]], each with a test |

## Where to put this folder
1. Cut the folder `Jarvis Build` and paste its contents into `40_Resources/Obsidian/Dashboard/Jarvis Builds/` in the Jarvis vault. Do not paste a second folder inside it.
2. Run Vault Lint on the thirteen notes. They were written outside Jarvis, so lint has not seen them.
3. The links to Jarvis notes (`Daily Note Standard`, `Better Today`, `2026-W44`, `Plan Standard` and others) resolve there and not in The Plan.
4. The main `Prompts` note and the `Ran/` folder in Jarvis are for the prompt session. Finished prompts move to `Ran/` under the [[Prompt Cycle]].

## Map of the notes
| Note | Holds |
|---|---|
| [[Jarvis Decisions Log]] | Every answer, the defaults, and nine corrections |
| [[Jarvis Spec - Day Model and Streak]] | The daily note shape, fields, floor rows, Loses lifecycle, streak rule, write primitives, validator |
| [[Jarvis Spec - Dashboard Page]] | The no-scroll page: rules, blocks, layout, scaling, visual system, states, tests |
| [[Jarvis Spec - Plans Feed]] | How plans become the 80, the 20 and the floor, and how Loses shape the next day |
| [[Jarvis Spec - Automation Layer]] | The day step by step, calendar read, planned blocks, the reader of The Plan, later transports |
| [[Jarvis Spec - Carry Forward]] | What each part of the old setup becomes, and the retirement order |
| [[Jarvis Architecture]] | Layers, modules, plugin rules, CLI, config, build, tests, two-laptop guards |
| [[Jarvis Plugin Retirement List]] | Evidence for the plugin decision. No removals. |
| [[Jarvis Verification and Risks]] | Unverified claims, failure register, acceptance list |
| [[Jarvis Research - Outside Sources]] | Web and API findings, with confidence and effect |
| [[Jarvis Research - The Plan Parallel Builds]] | What The Plan built, its faults and what to re-read |
| [[Jarvis Build Log]] | Fixed answers and the handoff between prompts |

Existing Jarvis notes this build starts from: [[Jarvis Build Overview]], [[The Plan Overview]] with its five notes, [[Jarvis Dashboard Build Record]], [[Daily Note Standard]], [[Daily Close Loop]], [[How to Use Google Calendar]] and [[2026-W44]].

## Feature inventory
Each row is one thing the dashboard must do. Nothing is built that is not here, and nothing here is left without a note.

| # | Feature | Defined in | Data source | Test or check |
|---|---|---|---|---|
| F1 | Streak number, floor rule, one forgiven miss | [[Jarvis Spec - Day Model and Streak]] | Floor lines | Golden month |
| F2 | Builder level and next milestone | [[Jarvis Spec - Day Model and Streak]] | Engine, config | Unit test |
| F3 | Floor ring | [[Jarvis Spec - Dashboard Page]] | Floor lines | `dashboard-cli` equality |
| F4 | Wins ring, 0 to 4, outside the streak | [[Jarvis Spec - Day Model and Streak]] | Win lines | Unit test |
| F5 | Seven day row and week totals | [[Jarvis Spec - Dashboard Page]] | Engine, ISO week | `week` command |
| F6 | Today's 80 and 20, tick | [[Jarvis Spec - Day Model and Streak]] | 80 and 20 lines | Edit tests |
| F7 | Edit a line in place | [[Jarvis Spec - Dashboard Page]] | Any written line | Edit and field tests |
| F8 | Blocks now and next | [[Jarvis Spec - Automation Layer]] | `### Blocks` | Compare with the calendar |
| F9 | Tracked against planned time | [[Jarvis Spec - Automation Layer]] | `[spent::]` from The Plan | Reader test |
| F10 | Deadlines in 7 days | [[Jarvis Spec - Plans Feed]] | `[due::]` on weekly Goals | Unit test |
| F11 | Open Loses, age, cap 7, tick | [[Jarvis Spec - Day Model and Streak]] | Loses across notes | `loses` command |
| F12 | Carryover from the session log | [[Jarvis Spec - Dashboard Page]] | Carryover heading | Parse test |
| F13 | Applications today and this week out of 10 | [[Jarvis Spec - Plans Feed]] | Tracker `date_applied` | `week` command |
| F14 | LeetCode and study hours with plus and minus | [[Jarvis Spec - Day Model and Streak]] | Frontmatter numbers | Frontmatter test |
| F15 | Three project chips | [[Jarvis Spec - Carry Forward]] | Project `next:` | Parse test |
| F16 | 30 day heatmap | [[Jarvis Spec - Dashboard Page]] | Engine | `dashboard-cli` equality |
| F17 | Proof of the day | [[Jarvis Spec - Day Model and Streak]] | `[proof::]` | Edit test |
| F18 | Health chip | [[Jarvis Spec - Dashboard Page]] | `validate`, `doctor` | `doctor` test |
| F19 | Links | [[Jarvis Spec - Dashboard Page]] | Config | Click test |
| F20 | Create today's note, ISO names only | [[Jarvis Spec - Day Model and Streak]] | Template | Create tests |
| F21 | Misnamed and placeholder banners | [[Jarvis Spec - Dashboard Page]] | `validate` | Fixture |
| F22 | Window too small banner and fit | [[Jarvis Spec - Dashboard Page]] | Pane size | Real-browser test |
| F23 | No vertical scroll, horizontal scroll for written text only | [[Jarvis Spec - Dashboard Page]] | Styles | Three page tests |
| F24 | Light and dark, tokens, no hard-coded colour | [[Jarvis Spec - Dashboard Page]] | `styles.css` | Hex grep, contrast test |
| F25 | Opens at launch on both laptops | [[Jarvis Architecture]] | Homepage command | Five restarts |
| F26 | `dashboard-cli` commands | [[Jarvis Architecture]] | Engine | CLI against golden values |
| F27 | `doctor` | [[Jarvis Architecture]] | Vault, repo, tooling | `doctor` test |
| F28 | Validator, eleven rules | [[Jarvis Spec - Day Model and Streak]] | Daily notes | One test per rule |
| F29 | Allowlisted reader of The Plan | [[Jarvis Spec - Automation Layer]] | The Plan's notes | Reader test |
| F30 | Choosing the 80 and deriving the 20 | [[Jarvis Spec - Plans Feed]] | Plans, preview, calendar | Dry run of `/startday` |
| F31 | Recalculating tomorrow from Loses | [[Jarvis Spec - Plans Feed]] | Loses | Dry run of `/closeday` |
| F32 | Calendar blocks planned and written | [[Jarvis Spec - Automation Layer]] | Weekly Goals | Re-list count |
| F33 | Consistency agent across the two daily notes | [[Jarvis Spec - Automation Layer]] | Both notes, allowlisted | Fixture with a mismatch |
| F34 | Template, Standard and skill patches | [[Jarvis Spec - Carry Forward]] | | Vault Lint, dry runs |
| F35 | Old page and canvas retirement | [[Jarvis Spec - Carry Forward]] | | Anant's word after a fortnight |
| F36 | Plugin decisions for Anant | [[Jarvis Plugin Retirement List]] | Plugin counts | Anant fills the record |
| F37 | Term end review | [[Jarvis Spec - Plans Feed]] | Config date | Health chip red on 2026-12-24 |

## Sequence
These are build stages, not prompts. A separate session turns each into a prompt under the Agent Prompt Standard, using the notes above.
1. **The day shape.** Patch the Standard, the Close Loop and the template. Update `/startday`, `/closeday` and `daily-operator`. Every edit is shown first and waits for a yes. Covers F20, F28, F30, F31, F34.
2. **The engine and the CLI.** Golden fixtures first, then the engine modules and `dashboard-cli`, with `doctor`. Covers F1, F2, F4, F5, F10, F11, F13, F26, F27, F28.
3. **The plugin base.** Data layer, the three write primitives, creating today's note, the Hero and Today blocks, Homepage by command. Covers F3, F6, F7, F14, F20, F25.
4. **The page.** All other blocks, scaling, banners, visual tokens and the three page tests. Covers F8, F12, F15 to F19, F21 to F24.
5. **The feeds.** The reader of The Plan, `[spent::]`, the Blocks write at start of day, planned calendar blocks and the consistency agent, all read only except the calendar writes already approved by the guide. Covers F9, F29, F32, F33. It waits for The Plan's time design.
6. **Wire and verify.** Deploy on both laptops, Anant's Homepage clicks, the acceptance list, the plugin list for Anant. The old page retires only after a clean fortnight and only on Anant's word. Covers F25, F35, F36.
Out of scope: automation transports, any scheduled run, any phone build and any plugin removal.

## Dependencies on The Plan
These belong to The Plan's own build. Stage 5 starts only after they exist, and the rest of the build does not wait for them.
1. The heading in The Plan's daily note that holds the time overview.
2. The path and naming of the time log folder.
3. The entry format. The proposal is `- HH:MM-HH:MM task label [proj:: name]`.
4. When entries are written.
5. The structure of The Plan's daily template (Decision 51).

## Design is complete when
- [x] Every question in the design session is answered or defaulted, with a row in [[Jarvis Decisions Log]].
- [x] Every old dashboard block has a fate ([[Jarvis Spec - Carry Forward]]).
- [x] Every feature has a defining note and a test ([[Jarvis Build Hub]] inventory).
- [x] Every unverified claim has a test ([[Jarvis Verification and Risks]]).
- [x] Outside facts are cited with confidence ([[Jarvis Research - Outside Sources]]).
- [x] The Plan's parallel build is read and its faults have guards ([[Jarvis Research - The Plan Parallel Builds]]).
- [x] No plugin is removed and the decision list exists ([[Jarvis Plugin Retirement List]]).
- [ ] Anant has read the defaults D32 to D45 and kept or changed each.
- [ ] The notes are pasted into Jarvis and pass Vault Lint.

## Open Questions
None blocking the build. The two unchecked boxes above are the last steps of the design.
