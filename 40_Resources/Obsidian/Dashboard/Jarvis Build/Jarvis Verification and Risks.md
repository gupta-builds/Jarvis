---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - risks
  - verification
reference_kind: resource
notes:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Architecture]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Spec - Automation Layer]]"
  - "[[Jarvis Research - Outside Sources]]"
  - "[[Jarvis Research - The Plan Parallel Builds]]"
---
# Jarvis Verification and Risks
==Every claim in the Jarvis design that nobody has tested, the exact test for each, and what breaks if it fails.== The Plan's dashboard shipped with a table like this and left every row unfilled. Each build session fills the rows it can settle, and no row is closed without the test result written beside it.

## Unverified, and how to settle each
| # | Claim | Test | If it fails | State |
|---|---|---|---|---|
| 1 | Homepage can open the plugin view at launch by command on both laptops | Restart each laptop five times and check the view opens each time | Open the view from `onLayoutReady` as a backup, idempotent | Open |
| 2 | A plugin build travels through git to the other laptop and loads there | Deploy on the Acer, sync, enable on the Dell, read the version in the health chip | Copy the three files by hand per release | Open. Git tracks the plugin folder, verified with `git check-ignore`. |
| 3 | The auto-sync on one laptop cannot overwrite the plugin or `.claude` with a stale tree | Run a sync on a laptop with an old tree and confirm `doctor` flags it | Whitelist and pin the paths | Open |
| 4 | `Vault.process` ticks write back without a conflict, and a `modify` event follows | Tick and watch the page redraw. Edit the same line in the note at the same time. | The stale-line check refuses the write | Open. The API is atomic per the documentation ([[Jarvis Research - Outside Sources]]). |
| 5 | A Jarvis session may run the reader of The Plan under Jarvis's hooks | Run `dashboard-cli plan-time` from a Jarvis session | `/startday` asks for the numbers by hand | Open. Anant allows the read. |
| 6 | The Plan's path on each laptop | List the folder on each laptop | Set `planVaultPath` per machine | Open |
| 7 | The Plan defines a time overview heading, a time log folder and an entry format | Read The Plan's design when it exists | `plan-time` returns `not_defined` and the page shows planned time only | Open, waiting on The Plan |
| 8 | `date_applied` is set only on a finished application | Add the rule to the tracker's standard | The application count overstates | Default taken, D36 |
| 9 | The page holds every block with no vertical overflow at full-screen sizes | The three page tests in [[Jarvis Spec - Dashboard Page]] | Adjust the scaling constants | Open |
| 10 | `/startday` writes Blocks that match the calendar | Compare `### Blocks` with a live list of the day | The strip says it is stale | Open |
| 11 | The folder for the CLI is free | List `30_Order/System/dashboard-cli` | Name it differently | Settled. `jarvis-cli` is taken, so `dashboard-cli` is used. The new folder does not exist yet. |
| 12 | Templater's "Trigger Templater on new file creation" is on | Anant checks the setting in Obsidian, which is under `.obsidian` | The plugin creates notes with resolved dates itself | Open, and no longer blocking because the plugin creates the note |
| 13 | Ticking a Lose from the page writes back to its source note | Test with a Lose in an older note | Open the source note instead of ticking | Open |
| 14 | The reader never emits a non-allowlisted heading | Feed it a Plan note with private headings and assert none appear | Fix the reader before use | Open |
| 15 | Playwright runs a headless Chromium test of the built bundle here | Install it as a dev dependency and run one assertion | A live check in Obsidian only | Open, unverified |
| 16 | Obsidian's theme variables give red, orange and green and recolour with the theme | Read the live variables in the developer console | Define the colours in `styles.css` | Open |
| 17 | The edit in place keeps `[for::]` and other fields | An edit test with each field | Edit only the text part and reject a change that removes a field | Open |

## Failure register
| Trigger | Effect | What Anant sees | Detection | Smallest fix |
|---|---|---|---|---|
| A note is named `DD-MM-YYYY` | The engine ignores it. The streak shows zeros. | A red banner naming the note | `validate` and the page | Rename it. This happened in The Plan for ten days. |
| An old `.claude` overwrites the skills | `/startday` finds nothing | Commands missing, a red health chip | `doctor` | Restore from git history |
| Today's note is missing | The day is a MISS | An empty ring and a Create button | The engine | Press Create |
| A leftover `<% %>` date | Date queries skip the note | A banner | `validate` | Run `/startday` or fix the date |
| Midnight passes during a session | A tick lands on the wrong date | None | The page reads the date every 30 seconds | A tick after midnight belongs to the new day |
| Two laptops edit one note | A stale tick is refused | The row snaps back | The line check | Reload the page |
| More than 7 open Loses | The eighth cannot be added | A red 7 of 7 and a refused close | `loses` and `/closeday` | Make up or drop one |
| The term ends on 2026-12-24 | The floor rows describe a closed plan | A red health chip | The config date | Add the next term's rows |
| The calendar token expires | No blocks load | "Blocks not loaded today" | `/startday` report | Reconnect |
| The window is too small | The page cannot fit | "Window too small" | The size check | Enlarge the window |
| A plan changes after the 80 was written | The line points at a dropped plan | A validator warning | `validate` | Rewrite the line |
| The page and the engine disagree | Wrong numbers | A red health chip | The debug command | Fix the page, never the engine |
| The Plan's headings change | The reader finds nothing | `not_defined` or an empty result | `doctor` | Update the allowlist |
| An edit in place removes a field | A 20 loses `[for:: 80]` | A validator warning | `validate` | Undo in the note, and the edit path rejects it |
| The Plan's template is switched without structure | The Plan's own streak reads zero | Not visible in Jarvis | The Plan's checks | Jarvis is unaffected because it reads only allowlisted headings |
| The source exists on one laptop only | A disk loss loses the build | Nothing until it happens | The repository has no remote | Create the private repository |

## Acceptance for the whole dashboard
1. The dashboard opens at launch on the Dell and the Acer with no manual step.
2. A tick updates the rings, the streak and the heatmap within one second.
3. The screen's numbers equal `dashboard-cli` for the last 30 days.
4. The root and every card have no vertical overflow at the measured full-screen sizes, and only written text scrolls sideways.
5. The daily note stays valid markdown that reads well without the plugin.
6. Disabling the plugin loses the view and none of the data.
7. `doctor` reports clean on both laptops.
8. The reader test passes: no non-allowlisted heading from The Plan appears in any output.
9. An edit in place saves and a stale line is refused.
10. A closed day has 7 or fewer open Loses and a preview for tomorrow.

## Risks
| Risk | Likelihood | Effect | Control |
|---|---|---|---|
| Scope creep into the automation layer | Medium | Delay | Automation is design only until two clean weeks |
| The Plan's lessons not applied | Medium | Silent zeros again | `doctor`, the banners and the filled table above |
| React adds weight | Low | Slower start | First paint measured against the 2 second budget |
| Reading The Plan from Jarvis is blocked by hooks | Medium | No time totals | Row 5 tests it, and the page shows planned time only |
| The Plan's time design arrives late or changes | High | The time layer waits | `not_defined` is a normal state, not an error |
| Personal content reaches Jarvis | Low | A breach of AGENTS.md golden rule 6 | The allowlist reader and its test |
| Edit in place corrupts a line | Low | A bad note line | The stale-line check and the field test |
| Secrets exposure | Low | | The plugin reads only the daily, weekly and tracker folders. No `data.json` of another plugin is read. |
