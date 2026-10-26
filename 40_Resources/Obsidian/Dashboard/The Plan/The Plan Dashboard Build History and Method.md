---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - the-plan
  - build-history
reference_kind: research
area:
  - "[[Daily Operating System]]"
notes:
  - "[[The Plan Overview]]"
  - "[[The Plan Dashboard Architecture and Infrastructure]]"
  - "[[The Plan Dashboard UI and What Appears]]"
  - "[[The Plan Dashboard Daily Workflow and AI Loop]]"
  - "[[The Plan Dashboard State and Gaps 2026-10-25]]"
  - "[[Jarvis Dashboard Build Record]]"
---
# The Plan Dashboard Build History and Method
This note records what was built for The Plan's dashboard, in what order, and by what method, so Jarvis can tell a design that was written from a build that was run. Read it when you plan the next slice or want to copy the method. The sources are The Plan's `Dashboards Hub`, `Decisions Log`, `Build Plan`, `Build Log`, `Verification and Risks`, the plugin repository's git log, and the Claude Code session exports in `60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/The Plan/`. Session lengths in those exports are wall-clock spans that include idle time, so they are not used here.

## The method, as practised
1. **Brainstorm by voice, then fix the words.** The first session took Anant's spoken answers. One word, DOPPLER, was a speech-to-text error for "dashboard" (Decision 1). Every answered question became a numbered row in the Decisions Log, with the consequence for the build next to it.
2. **Design before code.** The design hour wrote four specs, a Decisions Log, a build plan, and a ready-to-paste prompt for each later session, and nothing outside the Dashboards folder.
3. **Research with evidence labels.** Platform claims (Homepage, Sync, Lazy Plugin Loader, `Vault.process`) were marked Verified, Inferred or Unverified, and each Unverified claim got an exact test and a fallback in `Verification and Risks`.
4. **One slice per session.** Each prompt carries a shared preamble: read `AGENTS.md` first, the newer instruction wins and conflicts are reported rather than resolved silently, ask at most five questions per phase with a recommended answer each, record how every plan fails on a bad day, and stop for a yes before any risky step (renames, deletes, edits to `AGENTS.md` or `CLAUDE.md`, anything under `.obsidian`, any outside service, any note write).
5. **Handoff through a log.** Each plugin prompt reads the `Build Log` first and appends one factual entry at the end. Earlier entries are never rewritten.
6. **Tests before the screen.** The engine was written against a hand-computed fixture month and compared with a Python reference on 200 random histories and 20 random months. The view was tested in jsdom and previewed in headless Edge before it was deployed.
7. **Review in a fresh session.** The corrections note (2026-10-13), the stack audit (2026-10-14) and the build review (2026-10-25) each read the notes and the disk without being the session that built them.

What Anant does in this loop: speaks the requirements, answers the batched questions, approves or rejects each risky step, edits `.obsidian` settings by hand (the write guard blocks them), and is the only one who can test the phone.

## Chronology
| Date | Build | How it ran | Result and evidence |
|---|---|---|---|
| 2026-09-26 | Sync across laptops | A long session on Obsidian Sync, git and Syncthing | Produced the rule that Obsidian Sync owns notes and git owns only dot-folders (`plan-git-sync.ps1`) |
| 2026-10-12 | Design hour: research, Decisions 1 to 30, specs, build plan, prompts R1 and B1 to B8 | One Claude Code session reading both vaults | `Dashboards Hub`, `Decisions Log`, `Spec - Streak and Daily Note`, `Spec - Home and Monthly Dashboards`, `Spec - AI Loop`, `Spec - Automation Layers`, `Build Plan`, `Prompts`. The note said Jarvis had no streak feature at all |
| 2026-10-12, second session | Dashboard medium and look | Answered visual questions: ring colours, how forgiven days count, heatmap shading | Decisions 31 to 34. The medium became a private plugin: DataviewJS flickers on refresh, Datacore is pre-1.0, Bases cannot walk consecutive days. Stages S0 to S6 replaced prompt B3 |
| 2026-10-13 | ISO rename | `obsidian move`, so wikilinks followed | 27 daily notes `DD-MM-YYYY` to `YYYY-MM-DD`, `22-12-2025 and before` to `2025-12-22`, 4 monthly notes to `YYYY-MM`. Two dead links removed from `2025-W52` (Decision 35) |
| 2026-10-13 | Daily template, QuickAdd steps, streak script | Template `Daily Note.md`, QuickAdd choices, `streak.py` with `test_streak.py` | 23 of 23 script tests pass; a 9-day fixture with a hand-computed `expected.json` |
| 2026-10-13 | Platform facts research | A 27-turn research session | `Research - Platform Facts`, later moved to the `40_Resources` root; the Verification table came from it |
| 2026-10-13 | Plugin prompts and guides | Five plugin prompts, a plugin creation guide, an API reference, `Private Use and Sharing`, `Sonnet 5.5 Prompt Rules`, and a corrections note | 13 conflicts between earlier notes and the new design listed with the winner for each |
| 2026-10-13 | Five skills | `startday`, `closeday`, `weekly-review`, `monthly-review`, `jarvis-dump`, dry-run on sample days | Directories with `SKILL.md` and `reference.md`; the ten flat skills copied from Jarvis were removed |
| 2026-10-13 | Home dashboard rebuild and orchestration base | The engine, React view, `plan-cli`, review modules, three hooks | Commits `b744ba1` and `23e6452`; 87 of 87 tests; plugin deployed at 247,154 bytes; hooks registered and tested live. The five plugin prompts did not each log a Build Log entry: only the orchestration entry exists |
| 2026-10-14 | Four agents, hooks, `60_Jarvis` zones, `CLAUDE.md` | Agents `daily-auditor`, `review-analyst`, `skeptic`, `vault-curator`; `career-operator` and `research-distiller` removed | Decisions 36 to 50, including `00_Dashboard.md` deleted (47) and best streak counting closed days only (48) |
| 2026-10-14 | Stack audit and phone checklist | Desktop-only, read-only audit | All six requested plugins loaded; recommended disabling Periodic Notes and Meta Bind (not done); a nine-step phone checklist that was never run |
| 2026-10-14 | Monthly dashboard and Map canvas | One `dataviewjs` block and a canvas | `Monthly Dashboard.md` (17.7 KB), `Map Canvas.canvas` (38 nodes, 34 edges) |
| 2026-10-15 | Plans design, Session 1 | A design session that inventoried 26 Plan items (P1 to P26) against the matching Jarvis items and ran the engine | Engine returned `first_day: null` even then, because no daily note had a `[cat::]` line. The design notes it was to write do not exist on 2026-10-25 |
| 2026-10-16 | Regression | The second laptop pushed a stale working tree | `.claude` skills, agents, hooks and `.gitignore` reverted (see the state note) |
| 2026-10-19 on | Daily notes in the wrong name | Periodic Notes kept creating `DD-MM-YYYY` files | `19-10-2026.md` is filled but unreadable by the engine; `25-10-2026.md` is 0 bytes |
| 2026-10-25 | Build review | A read-only Claude Code session (Opus 5.5) over the notes, plugin repo, engine and `.claude` | The state note. Nothing was written |

## What the method got right
- **Decisions are numbered and dated.** Fifty by 2026-10-14. When a later session contradicted an earlier note, the corrections note named the winner.
- **One engine.** The streak, the reviews and the hooks cannot disagree with the screen because they share a source file. The parity tests turned a design claim into a check.
- **Unverified claims carried a test.** Phone, Sync of plugin files, Homepage cold start and the `modify` event after a Sync write each had an exact test and a fallback written before the build.

## What it got wrong
- **Documentation ran ahead of verification.** Notes said hooks were registered and skills existed. After 2026-10-16 neither was true and no check noticed, because nothing re-ran the verification.
- **A silent filter.** `DailyRepo` skips any file that is not `YYYY-MM-DD.md`. Periodic Notes was left on `DD-MM-YYYY`, so the dashboard showed zeros with no warning. The audit had recommended disabling Periodic Notes; the review had to find out why it mattered.
- **Plan and build drifted.** React, hard-coded hex colours, no dev vault, and no remote repository all departed from the prompts, and the departures were not logged as decisions until the 2026-10-25 review listed them.
- **Prompts that never ran as written.** The plugin prompts' gates and the Verification table were never filled in.

For the evidence behind each failure and the ordered fix list, see [[The Plan Dashboard State and Gaps 2026-10-25]].
