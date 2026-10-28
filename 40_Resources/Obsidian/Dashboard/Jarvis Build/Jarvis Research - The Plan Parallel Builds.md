---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - research
  - the-plan
reference_kind: research
notes:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Architecture]]"
  - "[[Jarvis Spec - Automation Layer]]"
  - "[[Jarvis Verification and Risks]]"
---
# Jarvis Research - The Plan Parallel Builds
==What The Plan's dashboard build has done and learned, read from its vault, repository and git history on 2026-10-26, so the Jarvis build repeats its strengths and none of its faults.== The Plan keeps building while this design is written, so the last section lists what to re-read before the Jarvis build starts.

## State of The Plan's build on 2026-10-26
| Part | State | Evidence |
|---|---|---|
| Engine, CLI, hooks and tests | Built on 2026-10-13 and 2026-10-14. 87 tests passed with the Python parity tests. | The plugin repository's build log and test files |
| Plugin repository | 3 commits, the last on 2026-10-13. 3 uncommitted changes. No remote. | `git log` and `git status` in `the-plan-dashboard` |
| Deployed plugin | Built 2026-10-13 19:51. It lacks the later best-streak rule and the new level titles. | File date and a search of the bundle |
| Claude tooling | Overwritten on 2026-10-16 by a stale tree from the other laptop (commit `0b995c5`). Restored on 2026-10-26 13:46 (commit `1e85ccd`, "restore Agentic OS tooling lost in the Oct 16 stale-tree push"). | `git log` |
| Daily notes | Notes were misnamed `DD-MM-YYYY` after 2026-10-12, so the engine saw none. `2026-10-25.md` and `2026-10-26.md` now exist with ISO names. | The Daily folder listing |
| Daily template | Decision 51 on 2026-10-26: the template is now `Better Today.md`, which has the Jarvis shape. `Daily Note.md` was deleted. The engine counts only `[cat::]` lines under five category headings, which the new template lacks, so The Plan's streak reads 0 until the structure returns. The Plan records this itself as a known gap. | The Plan's Decisions Log and Daily Note Schema |
| Today's Plan note | Headings are Morning Plan, 80, 20, Daily Wins, Daily Floor, Productivity, Just Write, Good Habits, Bad Habits and Tomorrow. It has no `[cat::]` lines. | A headings scan of the note, no personal text read |
| Toggl and time logs | No note and no design. Anant says the overview goes in the daily note and detailed logs in a folder. | A search of both vaults, excluding the word `toggle` |
| Phone | Never tested | The Plan's verification notes |

## Lessons applied to Jarvis
| What happened in The Plan | The Jarvis guard |
|---|---|
| A plugin created notes named `DD-MM-YYYY`. The streak read zero for ten days and nothing said so. | The plugin creates the note and refuses any other name. `validate` and the page flag a misnamed note ([[Jarvis Decisions Log]] D11). |
| An old `.claude` overwrote skills, agents and hooks. | `doctor` checks that they exist. The health chip shows the result ([[Jarvis Architecture]]). |
| The engine's source exists on one laptop, with no remote. | A private repository is recommended for the source. |
| The deployed plugin lagged the source by two changes. | `doctor` compares the deployed version with the repository. |
| The build prompts asked for plain DOM and the build used React with hard-coded colours. | React is decided in advance. A test greps for hex colours. |
| The verification table was never filled in. | Every row in [[Jarvis Verification and Risks]] has a test and a prompt that owns it. |
| The tests rendered in jsdom, which has no layout engine, so a no-scroll claim cannot be proven there. | A real-browser test and a live check ([[Jarvis Spec - Dashboard Page]]). |
| A template was switched without its structure and the streak went to zero quietly. | The reader of The Plan is allowlist based. A heading change shows in `doctor` and does not break Jarvis. |
| The Plan's daily template is now a copy of Jarvis's shape. | The two daily notes can drift together. The consistency agent reports mismatches, and neither vault reads the other's template. |

## What the Jarvis build takes from The Plan
- The engine layout and the shared-rule idea: one program for the screen, the skills and the checks.
- The stale-line check before a tick.
- The streak rule, with one forgiven miss and best counting closed days only.
- The scaled grid and the level titles ([[Jarvis Decisions Log]] D16).
- The rule that a skill shows its exact write and waits for a yes.

## Re-read before the Jarvis build starts
1. The Plan's decision on how its daily template regains structure (Decision 51, open).
2. The Plan's time design: the overview heading, the time log folder, the entry format and the timing.
3. Whether The Plan's plugin was rebuilt and redeployed.
4. Whether The Plan's skills and hooks are still in place.
5. Whether The Plan's read of Jarvis's dashboard, weekly, monthly and plan notes exists as a skill or is only intended. Anant says it runs. The vault shows no note that defines it.

## Note on this folder
The Plan's git auto-sync committed the draft notes of this folder in commit `fb8f157`. They are tracked in The Plan's history. Cutting the folder into Jarvis shows as deletions in The Plan, which is expected and harmless.
