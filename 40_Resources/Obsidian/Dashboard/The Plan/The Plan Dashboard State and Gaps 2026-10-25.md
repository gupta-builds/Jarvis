---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - the-plan
  - state
reference_kind: research
area:
  - "[[Daily Operating System]]"
notes:
  - "[[The Plan Overview]]"
  - "[[The Plan Dashboard Architecture and Infrastructure]]"
  - "[[The Plan Dashboard Build History and Method]]"
  - "[[The Plan Dashboard UI and What Appears]]"
---
# The Plan Dashboard State and Gaps 2026-10-25
This note says what works and what does not in The Plan's dashboard, with the evidence and the order of repair. Read it before building anything on that dashboard. It comes from a read-only review run on 2026-10-25 (Claude Code, Opus 5.5) and was re-checked on disk on 2026-10-26, as marked. A dated snapshot goes stale, so run the checks at the end before acting on it.
## Bottom line
The engine, the plugin and the Claude tooling were all built on 2026-10-13 and 14. Two faults then broke the system without any warning, and the dashboard has never shown a real number.
1. **2026-10-16.** The second laptop pushed an old copy of its working tree. This laptop's git-sync treats every dot path as git-owned, so it wrote that old `.claude` and `.gitignore` to disk. Skills, agents and hooks were reverted.
2. **2026-10-19 onward.** Periodic Notes keeps creating daily notes named `DD-MM-YYYY`. The engine reads only ISO date format (`2026-10-26`), and skips the rest without saying so.
## Evidence
| Claim | Evidence | Checked |
|---|---|---|
| The engine has never seen a valid note | `plan-cli streak 00_Live/Enumerate/Daily 2026-10-26` returns `first_day: null`, `current_streak: 0`, and every day in the window `has_note: false` | Re-run 2026-10-26 |
| Daily notes are unreadable | The folder holds `19-10-2026.md` (4,170 bytes, filled in) and `25-10-2026.md` (0 bytes), and no ISO-named note after `2026-10-12.md` | Listed 2026-10-26 |
| Skills, agents and hooks reverted | Commit `0b995c5` (message "auto: 2026-10-16 21:01, 133 files", the second laptop's old format) deleted the directory skills. `.claude/skills` holds the ten old flat Jarvis skills, `.claude/agents` holds `career-operator`, `research-distiller` and the old `vault-curator`, and `.claude/settings.json` has no hooks block, only MCP permissions | Listed 2026-10-26 |
| A good copy exists | Commit `e10bc90` (2026-10-14 15:23) holds `daily-auditor`, `review-analyst`, `skeptic`, `vault-curator`, the five directory skills, and `settings.json` with the hooks | Listed 2026-10-26 |
| The deployed plugin is older than the engine | The plugin `main.js` was built 2026-10-13 19:51. `plan-cli.cjs` was built 2026-10-14 10:55 and has Decision 41 and 48. The repository has three uncommitted changes from 2026-10-14 | Review 2026-10-25; `plan-cli.cjs` date seen 2026-10-26 |
| The source exists on one laptop | The plugin repository has three commits and no remote | Review 2026-10-25 |
| Plan and build drifted | React, hard-coded colours, no dev vault; no Build Log entry for the five plugin prompts; the Verification table and the phone checklist were never filled in or run | Review 2026-10-25 |
| Records are stale | `Dashboards Hub` and `Build Plan` still say `next: Run R1, then B1`. The Agentic OS status table says hooks are registered. `60_Jarvis/50_Reviews/Dashboard/` holds three empty notes from 2026-10-25 20:08 | Review 2026-10-25 |
| The planning sessions never produced notes | Prompts Session 1 (Plans) and Session 2 (Automation) were written, and `Plans Design/` and `Automation Design/` do not exist | Review 2026-10-25 |
| Jarvis's side had a related fault | Its `2026-10-18.md` kept raw Templater date placeholders because Templater's trigger on new file creation is off | Fixed in the Jarvis daily notes 2026-10-26 |
## What is built and sound
- The engine, 87 tests, and the parity check against the Python oracle (2026-10-13).
- The view, with the six pane sizes previewed in headless Edge.
- The data path's one write rule: a stale tap cannot tick the wrong line.
- The standards in `30_Order/Standards/Dashboards/`, `Agentic OS/` and `References/`, and the workflows.
- `Monthly Dashboard.md` and `Map Canvas.canvas`, as notes, though the first duplicates the engine's parsing.
## Order of repair, as the review proposed it
Each step has a gate that must pass before the next.
0. **Stop the second laptop.** Update its git-sync to the current `plan-git-sync.ps1`, or disable its task, before restoring anything. Gate: no `auto:` commits after the restore.
1. **Restore the tooling from `e10bc90`.** Check out the five skill folders, the four agents (and remove `career-operator` and `research-distiller`), `.gitignore`, `.codex/*`, `plan-cli.cjs`, and a `settings.json` that keeps both the hooks and the current MCP permissions. Gate: a new session shows the hooks blocking a test write to `50_Archive`, and `/startday dry-run` works on the sample fixture.
2. **Repair the data path.** In Periodic Notes set daily to ISO date format (`2026-10-26`) with the template `30_Order/Templates/Daily Dashboard/Daily Note.md`, and monthly to `YYYY-MM`. Rename `19-10-2026.md` with a link-aware move and replace the empty `25-10-2026.md`. Gate: `plan-cli streak` returns a non-null `first_day`.
3. **Make the failure loud.** The engine and `validate` report any non-ISO file in `Daily/`, and the dashboard shows a banner such as "1 note in Daily is not an ISO date name" instead of silent zeros.
4. **Bring the plugin up to date.** Commit the pending changes, rebuild and redeploy, create the private repository (after a yes), move colours into `styles.css` tokens, and add the month strip, level titles, grade, misnamed-note warning, "create today's note" action, and the screen-versus-CLI debug command. Gate: screen numbers equal `plan-cli` for the last 30 days.
5. **Add a "next step" card.** It names the one thing due now (note missing, career line unset, close not run, a review due, validation errors) and shows the command with a copy button. It works on the phone and needs no Node code.
6. **Integrate the Jarvis plan.** The Plan's `/startday` reads Jarvis's today note read-only and proposes its `### 80` task as the career line, written only after a yes. This amends Decision 11 and needs a new row in the Decisions Log.
7. **Run the phone checklist** and fill the Verification table and Build Log.
8. **After two clean weeks** (Decision 40): the planning sessions, the Monthly view in the plugin, Explore, then automation.
## Decisions still open
1. Which laptop uses `gupt0479@umn.edu`, and may the tooling be restored from `e10bc90` once its sync is stopped.
2. Fix Periodic Notes or disable it. The review recommends fixing, because the Calendar plugin uses it.
3. Keep React and record the departure as a decision, or rewrite in plain DOM. The review recommends keeping it.
4. Whether the "next step" card is the right shape of Claude assistance, or a desktop-only launch button despite the plugin's no-Node rule.
5. Whether the career line may come from Jarvis's `### 80` task as a proposal.
6. Whether the private GitHub repository may be created and pushed.
## Checks before acting
- `node 30_Order/System/plan-cli/plan-cli.cjs streak 00_Live/Enumerate/Daily <today>` returns a non-null `first_day`.
- `.claude/settings.json` contains a `hooks` block, and `.claude/skills/startday/SKILL.md` exists.
- No file in `00_Live/Enumerate/Daily` is named `DD-MM-YYYY.md`.
- The deployed `main.js` is newer than the last engine build.