---
type: system
status: sprout
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - decisions
system_kind: log
notes:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Spec - Plans Feed]]"
  - "[[Jarvis Spec - Automation Layer]]"
  - "[[Jarvis Research - Outside Sources]]"
---
# Jarvis Decisions Log
==Every question answered while designing the Jarvis dashboard plugin, with what each answer forces on the build.== Anant gave the answers on 2026-10-26. A row marked Default is a decision the assistant took so the design could close, and it stands until Anant says otherwise. Corrections keep the original statement and say what replaced it.

## Decided by Anant

| # | Question | Answer | Consequence |
|---|---|---|---|
| D1 | How does the Jarvis plugin relate to The Plan's plugin? | Separate plugin `jarvis-dashboard`, own engine, no shared code | Copy The Plan's structure, not its files. A Plan change cannot break Jarvis. |
| D2 | Which devices? | The Dell and the Acer laptop only. Jarvis is not synced to the phone. | No phone build or test. The dashboard opens only in Obsidian on the laptops. |
| D3 | How is a day recorded so the plugin can tick it? | Checkbox lines with a field, for example `[track:: application]` | Replaces the frontmatter toggles built on the morning of 2026-10-26. See Correction 3. |
| D4 | What does the streak count? | The floor. A day counts when every floor row is done. One miss is forgiven, two in a row break it. Floor rows are set per term in a config table. | The Plan's rule with floor rows in place of five categories. |
| D5 | What happens to the four wins? | A separate score from 0 to 4, never part of the streak | A cleanup win cannot rescue a day with no application. |
| D6 | Daily Loses | Kept, tickable on the page, line format from the [[Daily Note Standard]] | The page can only tick a Lose to `[x]`. Dropping needs a reason and stays with `/closeday`. |
| D7 | Identity and habits in Jarvis | Builder identity only. Personal identity, health and habits stay in The Plan. | Matches AGENTS.md golden rule 6. |
| D8 | Page shape | One page, no vertical scroll anywhere. Only text Anant writes may scroll sideways. The page scales to fit, with a "window too small" banner below a readable size. No content is removed. | Tests must prove no vertical overflow. See [[Jarvis Spec - Dashboard Page]]. |
| D9 | What is always on the page? | Today core, calendar strip, loses and carryover, pipeline numbers | All four groups are on the one page. |
| D10 | Delight elements | Builder levels, proof of the day, a floor heatmap, pipeline momentum | Each has a data source in [[Jarvis Spec - Day Model and Streak]]. |
| D11 | Who creates today's note? | The plugin, from the template. Any name that is not `YYYY-MM-DD` is refused and flagged. | Prevents The Plan's ten days of zeros caused by `DD-MM-YYYY` names. |
| D12 | Where does the 80 come from? | From the plans already drafted (Fall 2026 plan, weekly Goals, project plans). The One Thing for the day is chosen daily. | `/startday` proposes, Anant approves. See [[Jarvis Spec - Plans Feed]]. |
| D13 | What is the 20? | It supports the 80 on a daily basis. It is created for the 80's actions, so the extra tasks are done with respect to it. | A 20 line names its 80 with `[for:: 80]`. A task that serves no 80 is not a 20. |
| D14 | When does the term end? | 2026-12-24, the last day of the Fall 2026 plan. Some items continue next term and some stop. | Config holds the term end. See Correction 2. |
| D15 | Weekly application target | 10 per week, each complete and correct | Pipeline momentum shows `n of 10`. |
| D16 | Builder level wording | The same as The Plan | The beginning (3), Toward 21 (7), Now it gets hard (21), Work pays off (66), Consistency, discipline, mindset (100). |
| D17 | Which calendar account? | `gupt0479@umn.edu`. Calendar detail is in [[How to Use Google Calendar]] and [[2026-W44]]. | The plugin never calls Google. Claude writes `### Blocks` and the page reads it. |
| D18 | Todoist in Jarvis? | No longer used | Todoist leaves the Jarvis design. See Correction 5. |
| D19 | Time management | Toggl runs in The Plan. Time is calculated in two places there: an overview in The Plan's daily note, and a folder of detailed time logs written as notes. Neither is designed yet. | Jarvis reads both read only. See [[Jarvis Spec - Automation Layer]]. |
| D20 | Does Jarvis read The Plan? | Yes, the daily note and the time logs, only the headings it looks for. Personal content never enters Jarvis. The Plan already reads Jarvis's dashboard, weekly, monthly and plans on its own runs. | An allowlist reader in the CLI. Skills never open The Plan's notes. See Correction 4. |
| D21 | Automation | Design only for now. Calendar read plus planned blocks. Other platforms (Apple Reminders, Zapier, further MCP servers) are decided later and must be simple and frictionless. | No transport is built. |
| D22 | Existing plugins | Nothing is removed. Anant receives a list and decides. | See [[Jarvis Plugin Retirement List]]. |
| D23 | Canvas and `00_Dashboard.md` | Both are replaced by the plugin | They retire after a clean fortnight, only on Anant's word. No exploration canvas is kept. |
| D24 | How long does a Lose stay open? | Until made up or dropped. It is never copied forward. The page counts every open one across notes, oldest first, capped at 7. The eighth must be made up or dropped at close. The next day's actions are recalculated from the day's Loses. | Retires the carried mark `[>]`. See Correction 6. |
| D25 | React or plain DOM? | React | React 19, as in The Plan. |
| D26 | Desktop only? | Yes | `isDesktopOnly: true` in the manifest. |
| D27 | Where does the repository live? | On the Acer. The Dell receives built files through git. | The path is chosen on the Acer when the build starts. See [[Jarvis Architecture]]. |
| D28 | Which window sizes? | Obsidian full screen on both laptops | Test sizes are measured on each laptop. See [[Jarvis Spec - Dashboard Page]]. |
| D29 | Sync banner and vault health | One health chip, green or red with a count | Both old blocks fold into it. |
| D30 | Week so far | A seven day row, Monday to Sunday, plus one line of totals | Sits in the hero. |
| D31 | Projects and clippings | Projects as three chips showing each `next:`. The clippings count moves to the weekly review. | Chips open the project note. |

## Defaults taken by the assistant
Each stands until Anant says otherwise.

| # | Question | Default | Why |
|---|---|---|---|
| D32 | The areas table of the old page | Stays in `00_Dashboard.md` until it retires, then moves into `Jarvis Vault Architecture` | It is typed prose, not data. That note already defines the areas. |
| D33 | Which week? | ISO, Monday to Sunday | [[2026-W44]] names `2026-W44`, was made on Sunday 2026-10-25 and plans Monday 10/26 onward. Week 44 of 2026 starts Monday 2026-10-26. |
| D34 | Heatmap length | 30 days | Same as The Plan. A config value. |
| D35 | Application floor row | One company a day. The weekly target of 10 is shown by pipeline momentum. | The Fall plan floor is one a day. |
| D36 | Meaning of `date_applied` | Set only when an application is submitted and complete | The target says each must be complete and correct. |
| D37 | Where deadlines live | `[due:: YYYY-MM-DD]` on weekly Goal lines | A parseable place the Blocks strip can read. |
| D38 | Typed numbers | `lc_count` and `study_today` stay in frontmatter, changed with plus and minus on the page | Keys already in the Standard. |
| D39 | Proof of the day | An optional `## Proof of the day` heading with one `[proof::]` line, added to the Standard | One line is the smallest reward loop. The patch needs approval. |
| D40 | The 87 older Meta Bind notes | Left as history, not converted | They are records. |
| D41 | Which copy of `startday` and `closeday` | `.claude` is canonical. `.agents` is left alone. | The 2026-10-26 rebuild changed `.claude` only. |
| D42 | End of term | A short review on 2026-12-24, written in the weekly note, decides which Systems rows continue and which floor rows change | Keeps the streak, which counts the floor and not the term. |
| D43 | Name of the CLI | `dashboard-cli`, in `30_Order/System/dashboard-cli/` | `30_Order/System/jarvis-cli` is a Python ops tool already. See Correction 9. |
| D44 | A validator hook | None in v1. `doctor` and the health chip cover it. | Fewer moving parts. A hook can follow. |
| D45 | Editing on the page | Double-click a line to edit its text. It saves through the same stale-line check as a tick. | Anant asked for a page that is clickable and editable. |

## Corrections
1. **Toggl in the daily notes.** The assistant said the July and August Jarvis daily notes mention Toggl. They do not. The search matched the word `toggle`, the Meta Bind inputs. No Jarvis note mentions Toggl. Anant confirmed on 2026-10-26 that Toggl is used in The Plan, and The Plan has no note about it yet.
2. **Term end.** The Plans Board says the Fall 2026 plan runs through 2026-12-14. D14 says 2026-12-24 and wins. The Plans Board line needs a change in Jarvis.
3. **Day model.** [[Jarvis Dashboard Build Record]] says the Done toggles became frontmatter booleans (`win_*`, `floor_1` to `floor_3`) and that `/closeday` counts them. D3 replaces the toggles with checkbox lines. The Daily Loses format and the `wins_done` and `floors_done` counts stay.
4. **Cross-vault reads.** [[Jarvis Dashboard Build Record]] lists as a non-goal that cross-vault reads go through `/jarvis-dump` and never write. D20 adds an allowlisted, read-only read of The Plan from Jarvis. The Build Record line needs an update.
5. **Todoist.** [[How to Use Google Calendar]] says the 12-week map lives in Todoist and names the working calendar "Todoist". D18 drops Todoist. The calendar keeps its name until Anant renames it in the Google Calendar app, which the guide already suggests.
6. **Carried Loses.** The [[Daily Note Standard]] and [[Daily Close Loop]] say `/startday` copies each open Lose forward and marks the old line `[>]`. D24 replaces that. A Lose stays where it happened, and the next day is recalculated from it. Both notes need a patch, with approval.
7. **Phone and window.** An earlier answer said the page should render responsively for an iPhone 15. D2 and D28 replace it. The page opens only in full-screen Obsidian on the two laptops. The compact layout remains only for narrow split panes.
8. **Week definition.** [[Jarvis Dashboard Build Record]] lists Sunday-start versus ISO as open. D33 settles it as ISO.
9. **CLI folder.** An earlier note said `30_Order/System/jarvis-cli` might be taken. It holds `jarvis.ps1`, `jarvis_ops.py` and a README, so it is taken. D43 renames the CLI.
