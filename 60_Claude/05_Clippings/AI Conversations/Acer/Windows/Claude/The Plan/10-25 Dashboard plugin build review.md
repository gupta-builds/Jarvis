---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Dashboard plugin build review"
started_at: 2026-10-25T20:12:38
ended_at: 2026-10-30T17:04:47
exported_at: 2026-10-30T21:03:10
duration_minutes: 7012.2
project: The Plan
cwd: 'D:\_Anant\20_Progress\Documents\The Plan'
session_id: c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd
status: seed
review_state: raw
created: 2026-10-25
updated: 2026-10-30
turn_count: 18
tools_used:
  AskUserQuestion: 8
  Bash: 62
  Edit: 7
  Grep: 1
  mcp__plugin_context7_context7__query-docs: 2
  mcp__plugin_context7_context7__resolve-library-id: 1
  Read: 2
  ToolSearch: 1
  WebSearch: 8
  Write: 22
tokens:
  input: 164
  output: 177994
  cache_creation: 669841
  cache_read: 16392753
  total: 17240752
cost_usd: 7.249013
model:
  - "claude-opus-5-5"
  - "claude-sonnet-5-5"
files_touched:
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\00_Live\\Enumerate\\Daily\\2026-10-27.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Dashboard Build\\Plugin Build Prompts.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Architecture.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Build Hub.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Build Log.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Decisions Log.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Plugin Retirement List.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Research - Outside Sources.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Research - The Plan Parallel Builds.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Spec - Automation Layer.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Spec - Carry Forward.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Spec - Dashboard Page.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Spec - Day Model and Streak.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Spec - Plans Feed.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Jarvis Build\\Jarvis Verification and Risks.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Dashboard plugin build review

## You



<pasted_content id="99d6">
Focusing on the dashboard plugin, the community plugin that was just created, its builds, and all configurations (so that it uses the Claude workflows and the listed prompts), you are required to review everything in detail.

All notes are provided below. Read through every folder and file containing crucial information. Then determine what needs to be done to the dashboard to implement the plans created in another session: improve the UI, add Claude assistance, and integrate our Jarvis daily‑plan workflow, which also references Jarvis’s daily note to ensure everything is done correctly today and in both notes.

We must establish a friction‑less workflow for the skills, agents, commands, hooks, the entire dashboard framework, the plugin, and everything that is running, so that we hardly notice the details and it always works. We will continue to improve the current plan, ensuring the dashboard functions perfectly and future work focuses on enhancing the established plugin.

From now on there will be updates. The charters are set; we just need to make sure each component is implemented correctly, nodes are set up with content, and everything is installed and working.
</pasted_content id="99d6">

. Go through these notes: `40_Resources/Obsidian/Dashboards`, `40_Resources/Obsidian/Dashboards/Dashboard Build`, `00_Live/Tracking/Plans`, etc. Dig through information inside the plan in detail on the builds that were taken place already and the future builds that were to be done. Come back with solid information and where we currently stand. What to exactly do from here on to make sure that the plugin is at the desired state just explained.

## Claude

I'll start by mapping the folders you named, then the plugin source, the engine repo, and the Claude tooling.

The Build Log has only the orchestration entry, so I need to check whether the five plugin prompts actually ran. Looking at the plugin repo and the deployed plugin.

The deployed CLI (Oct 14) includes Decision 41 and 48. The deployed plugin `main.js` (Oct 13) does not. Now the UI source.

Key finding: the built plugin deviates from the prompts (React, inline colour styles, no dev vault, no Explore). Checking what the verification table recorded.

The spec says all four agents exist and `career-operator`/`research-distiller` were removed, but the disk shows the opposite. Checking the actual Claude config.

The two commits on Oct 16 use a different message format (`auto:` rather than `auto-sync:`), the same one as the older commits from another machine. Checking what they changed.

The notes survived (Obsidian Sync owns them). Only the git-owned paths regressed. Checking whether `.codex` and the other dot-folders were hit too, and that today's notes exist.

Today's note is a 0-byte file. A `19-10-2026.md` was also edited on Oct 19 and 20, but it is not in the Daily folder listing. Checking where it went and which plugin creates `DD-MM-YYYY` names.

The engine reports `first_day: null`, so it has never seen a single valid daily note. The dashboard has been showing zeros since it shipped. Now the Plans folder.

Recent notes in `60_Jarvis/50_Reviews/Dashboard/` look like the other session's plan. Reading them along with the updated Prompts note.

These are empty placeholders created at 20:07 tonight, so they hold no plan content. Checking Prompts, this week's note, and Agentic OS.

Prompts.md now holds "Session 1: Plans" and "Session 2: Automation", and was touched by the two Oct 16 commits. Checking whether its content survived intact.

Notes are intact except two items deleted from git: `plan-cli.cjs` (still on disk, now untracked) and `Research - Platform Facts.md`. Checking that note and reading the Prompts sessions.

Plans Design and Automation Design were meant to be written by the Session 1 and Session 2 prompts. Checking whether either folder exists, then looking at the Jarvis daily-plan workflow.

There is also a `Daily` folder inside the Dashboards folder that was not in my first listing. Reading it, plus Jarvis's `startday`, `closeday`, `plan-it` and `daily-operator`.

Jarvis's `startday` writes an 80/20 work plan into `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`. Checking which Jarvis daily notes exist recently and what Jarvis's `closeday` does.

I have most of the picture. Last checks: what the view model computes versus the planned sections, and what the plugin's reference note claims.

# The Plan dashboard: where it stands on 2026-10-25

**Bottom line.** The engine, the plugin and the Claude tooling were all built on Oct 13 and 14. Since then two separate faults have broken the system without any warning:

1. **Oct 16:** the second laptop pushed an old copy of `.claude` and `.gitignore`. This removed your skills, agents and hooks.
2. **Oct 19 onward:** Periodic Notes has been creating daily notes with the old `DD-MM-YYYY` names, which the engine cannot read.

The dashboard has therefore never shown a real number. The engine reports `first_day: null` today. Before any UI or Claude work, the fix is to recover the tooling and repair the daily-note path.

## 1. What was actually built (checked on disk)

| Part | State |
|---|---|
| Plugin repo `Projects/the-plan-dashboard` | 3 commits, the last on Oct 13. It has 3 uncommitted changes from Oct 14: the Decision 41 titles, the Decision 48 best-streak rule and one test. **No git remote**, so the source exists only on this laptop. |
| Deployed plugin `.obsidian/plugins/the-plan-dashboard` | Matches the repo's `main.js`, but it was built on **Oct 13 19:51**. That build does not have the Decision 48 or 41 changes. |
| Engine `30_Order/System/plan-cli/plan-cli.cjs` | Built Oct 14 and identical to `dist/`. It has both changes. It is now **untracked by git**, as explained below. |
| Dashboard sections | Hero, ring, Today, 30-day heatmap, Career, Study, Next actions, Trackers, Links. |
| Never built | Explore map (S5), month strip with Met/Lost/Forgiven and top cause, level titles, grade, Monthly view, the "today's note missing" button, the debug command that compares the screen with the CLI. |
| Five plugin prompts | Only one Build Log entry exists, the orchestration entry. The prompts' gates and the Verification table were never filled in. Rows 1 to 6, covering Homepage cold start, Sync to the phone and the `modify` event, are still untested. |
| Phone | Never tested. The Audit's 9-step checklist was never run. |

The build also departs from its own prompts. It uses React (247 KB) where the prompts asked for plain DOM and 4 dependencies. It has hard-coded hex colours in `src/ui/styles.ts` where the rules say Obsidian CSS variables. There is no dev vault.

## 2. What is broken right now

**A. The Oct 16 regression (critical).** Commit `0b995c5` was made on Oct 16 at 21:01 by `gupt0479@umn.edu`, the second laptop, with its old `auto:` message format. It pushed that laptop's stale working tree. Commit `b26def3` followed 40 seconds later and restored the notes, but not the dot-folders. This laptop's git-sync treats any dot path as git-owned, so it wrote the broken state to disk. Current state:

- `.claude/skills/startday`, `closeday`, `weekly-review`, `monthly-review` and `jarvis-dump` are **empty folders**. The 10 old flat Jarvis skills are back.
- `.claude/agents` holds `career-operator`, `research-distiller` and the old `vault-curator`. `daily-auditor`, `review-analyst` and `skeptic` are gone, which reverses Decision 45.
- `.claude/settings.json` has **no hooks**. The write guard, secrets guard and validator are not running in this or any session, so the hook lines in CLAUDE.md and Agentic OS are false today.
- `.gitignore` lost its whitelist, so `plan-cli.cjs` is no longer in git.
- `.codex/README.md` was deleted and `.codex/config.toml` was reverted.
- The last good copy of all of this is commit `e10bc90` (Oct 14 15:23).

**B. Daily notes cannot be seen.**

- Periodic Notes is set to daily `DD-MM-YYYY`, monthly `MM-YYYY`, and templates under `30_Order/Templates/Headway Templates/…`. That folder no longer exists; the templates are in `Daily Dashboard/`.
- `00_Live/Enumerate/Daily/19-10-2026.md` is a real, filled-in day that the engine ignores.
- `25-10-2026.md` (today) is **0 bytes**.
- No usable note exists after Oct 12, so the streak and heatmap are empty.

**C. Jarvis's side is also broken.** Its newest daily note, `2026-10-18.md`, still contains raw `<% tp.date.now %>` placeholders, so Templater did not run. There is no Jarvis note for today.

**D. Stale records.** Dashboards Hub and Build Plan still say `next: Run R1, then B1`. The Agentic OS status table says the hooks are registered. `60_Jarvis/50_Reviews/Dashboard/` holds three empty notes created tonight at 20:08. `Research - Platform Facts` moved to the `40_Resources` root.

**E. Planning sessions never ran.** Prompts.md Sessions 1 (Plans) and 2 (Automation) never ran: `Plans Design/` and `Automation Design/` do not exist. The `00_Live/Tracking/Plans` notes (Summer Grind, Winter Break) are life plans and not dashboard plans. I found no written plan for "Claude assistance" or Jarvis daily-plan integration, so that part below is my proposal.

## 3. What to do, in order

Each step has a gate that must pass before the next one starts.

**Step 0: Stop the second laptop from doing this again.** Its git-sync must be updated to the current `plan-git-sync.ps1`, or its scheduled task disabled, *before* anything is restored. Otherwise the next sync pushes the stale tree again. Gate: no `auto:` commits appear after the restore.

**Step 1: Restore the tooling from `e10bc90`.** Run `git checkout e10bc90 -- <paths>` for:
- the five skill folders,
- the four agents (and remove `career-operator` and `research-distiller`),
- the old flat skills (remove them),
- `.gitignore`, `.codex/*` and `plan-cli.cjs`,
- `.claude/settings.json`, merged so it keeps both the hooks block and the current MCP permissions.

Gate: a new session shows the hooks blocking a test write to `50_Archive`, and `/startday dry-run dir=30_Order/System/streak/fixtures/sample` works.

**Step 2: Repair the data path.**
- In Periodic Notes, set daily to `YYYY-MM-DD` with template `30_Order/Templates/Daily Dashboard/Daily Note.md`, and monthly to `YYYY-MM`. Fix the weekly, monthly and yearly template paths. You click these in Settings because they are under `.obsidian`.
- Do a link-aware rename of `19-10-2026.md` to `2026-10-19.md`.
- Replace the empty `25-10-2026.md` with `2026-10-25.md` from the template.

Gate: `plan-cli streak` returns a non-null `first_day`.

**Step 3: Make this failure loud next time.**
- The engine and `validate` should report any file in `Daily/` that is not ISO-named.
- The dashboard should show a banner such as "1 note in Daily is not named YYYY-MM-DD" instead of silent zeros.

This is the most important step for a system that "always works without noticing it".

**Step 4: Bring the plugin up to date.**
- Commit the 3 pending changes, rebuild and redeploy.
- Create the private GitHub repo (this needs your yes).
- Move the colours into `styles.css` tokens.
- Add the month strip, the level titles, the grade, the misnamed-note warning, the "create today's note" action and the screen-vs-CLI debug command.

Gate: the numbers on screen equal `plan-cli` for the last 30 days.

**Step 5: Add the Claude assistance card.** I recommend a "Next step" card driven by the engine. It names the one thing due now: today's note missing, career line unset, close not run, weekly review due, monthly review due, Jarvis snapshot missing, or validation errors. It shows the exact command (`/startday`, `/closeday`, …) with a copy button. This works on the phone and needs no Node code. Launching Claude Code from a desktop button would break the plugin's "no Node or Electron APIs" rule, so it is a separate decision.

**Step 6: Integrate the Jarvis daily plan.**
- Proposed order: Jarvis `/startday` (the work plan, in a Jarvis session), then The Plan's `/startday`.
- The Plan's `/startday` reads Jarvis's today note read-only. It proposes the `### 80` One Thing as today's career line and writes it under `## Targets` only after your yes.
- The plugin cannot read the Jarvis vault on the phone, so the copy has to happen in Claude.
- This changes Decision 11 ("written manually") and needs a new row in the Decisions Log.
- Jarvis's Templater fault must be fixed first.

**Step 7: Run the phone checklist** from the Audit note, and fill the Verification table and the Build Log.

**Step 8: Only after the loop runs clean for two weeks** (Decision 40): Session 1 and Session 2, the Monthly view in the plugin, Explore, then automation.

## 4. Decisions I need from you

1. **Second laptop and restore.** Which laptop uses `gupt0479@umn.edu`, and may I restore from `e10bc90` once it is stopped? This touches `.claude`, `.gitignore` and `.codex`.
2. **Periodic Notes.** Fix it as described, or disable it as the Audit recommended? I recommend fixing it, because the Calendar plugin uses it.
3. **React.** Keep React and only fix the colours, or rewrite in plain DOM? I recommend keeping it and recording the deviation as a decision.
4. **Claude assistance.** Is the "Next step" card the right shape, or do you want a desktop-only launch button despite the rule?
5. **Career line.** May the career line come from Jarvis's `### 80` task as a proposal you approve, amending Decision 11?
6. **GitHub.** May I create the private repo and push to it?

I wrote nothing during this review. If you want this report as a shareable page or as a note in the vault, tell me where.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && find "40_Resources/Obsidian/Dashboards" "00_Live/Tracking/Plans" -type f | head -200; echo ---; ls -la; echo ---; ls .claude .claude/* 2>/dev/null
```
```
40_Resources/Obsidian/Dashboards/Audit - Dashboard Stack and Phone Checklist.md
40_Resources/Obsidian/Dashboards/Build Plan.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Architecture.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Log.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Prompts.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Steps.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Dashboard Build Hub.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Front End and Visual System.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Private Use and Sharing.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Reference - Obsidian API for This Build.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Research - Obsidian Dashboard Methods.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Research - Plugin Creation Guide.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Review - Corrections to Earlier Notes.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Sonnet 5.5 Prompt Rules.md
40_Resources/Obsidian/Dashboards/Dashboard Build/Verification and Risks.md
40_Resources/Obsidian/Dashboards/Dashboards Hub.md
40_Resources/Obsidian/Dashboards/Decisions Log.md
40_Resources/Obsidian/Dashboards/Prompts.md
40_Resources/Obsidian/Dashboards/Research - Jarvis Dashboard Findings.md
40_Resources/Obsidian/Dashboards/Spec - AI Loop.md
40_Resources/Obsidian/Dashboards/Spec - Automation Layers.md
40_Resources/Obsidian/Dashboards/Spec - Home and Monthly Dashboards.md
40_Resources/Obsidian/Dashboards/Spec - Streak and Daily Note.md
00_Live/Tracking/Plans/Summer Grind.md
00_Live/Tracking/Plans/Winter Break.md
---
total 67
drwxr-xr-x 1 anant 197609    0 Oct 22 22:46 .
drwxr-xr-x 1 anant 197609    0 Oct  2 23:15 ..
drwxr-xr-x 1 anant 197609    0 Oct 16 21:08 .claude
drwxr-xr-x 1 anant 197609    0 Oct 16 21:08 .codex
drwxr-xr-x 1 anant 197609    0 Oct 13 15:11 .copilot
drwxr-xr-x 1 anant 197609    0 Oct 25 20:09 .git
-rw-r--r-- 1 anant 197609  221 Sep 26 16:20 .gitattributes
-rw-r--r-- 1 anant 197609  967 Oct 16 21:08 .gitignore
drwxr-xr-x 1 anant 197609    0 Oct 16 21:08 .kiro
drwxr-xr-x 1 anant 197609    0 Sep 26 16:19 .obsidian
drwxr-xr-x 1 anant 197609    0 Sep 26 18:26 .opencode
drwxr-xr-x 1 anant 197609    0 Oct 14 15:16 00_Live
drwxr-xr-x 1 anant 197609    0 Sep 30 22:03 10_UMN
drwxr-xr-x 1 anant 197609    0 Oct 19 10:52 20_Progress
drwxr-xr-x 1 anant 197609    0 Oct 13 15:24 30_Order
drwxr-xr-x 1 anant 197609    0 Oct 15 16:13 40_Resources
drwxr-xr-x 1 anant 197609    0 Sep 15 21:22 50_Archive
drwxr-xr-x 1 anant 197609    0 Oct 14 15:04 60_Jarvis
-rw-r--r-- 1 anant 197609 4321 Oct 14 10:59 AGENTS.md
-rw-r--r-- 1 anant 197609  440 Oct 12 18:56 AI AGENT.md
-rw-r--r-- 1 anant 197609 3298 Oct 13 16:36 CLAUDE.md
-rw-r--r-- 1 anant 197609  316 May 28 10:49 HUMAN_WRITING.md
-rw-r--r-- 1 anant 197609  884 Sep 12 16:06 Import.md
-rw-r--r-- 1 anant 197609 2214 Oct  5 19:28 Impromptu speech.md
-rw-r--r-- 1 anant 197609 6029 Oct  4 18:22 Origin.md
drwxr-xr-x 1 anant 197609    0 Sep 15 21:22 copilot
---
.claude/settings.json

.claude:
agents
settings.json
skills

.claude/agents:
career-operator.md
research-distiller.md
vault-curator.md

.claude/skills:
closeday
closeday.md
connect-notes.md
context.md
copilot-fetch-x
copilot-web-fetch
copilot-web-search
copilot-youtube-transcript
distill-note.md
ingest-clipping.md
jarvis-dump
json-canvas
lint-claude-layer.md
monthly-review
obsidian-bases
obsidian-cli
obsidian-markdown
openartifacts-publish
organize-csci2033.md
startday
today.md
trace-topic.md
weekly-review
weekly-review.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && wc -c *.md "Dashboard Build"/*.md && cat "Dashboards Hub.md" "Dashboard Build/Dashboard Build Hub.md" "Build Plan.md"
```
```
  9082 Audit - Dashboard Stack and Phone Checklist.md
  3165 Build Plan.md
  4524 Dashboards Hub.md
 12897 Decisions Log.md
 24640 Prompts.md
  6779 Research - Jarvis Dashboard Findings.md
  8495 Spec - AI Loop.md
  4303 Spec - Automation Layers.md
  4745 Spec - Home and Monthly Dashboards.md
  5976 Spec - Streak and Daily Note.md
  5583 Dashboard Build/Architecture.md
  3014 Dashboard Build/Build Log.md
  6923 Dashboard Build/Build Prompts.md
  3407 Dashboard Build/Build Steps.md
  3754 Dashboard Build/Dashboard Build Hub.md
  5034 Dashboard Build/Front End and Visual System.md
 33543 Dashboard Build/Plugin Build Prompts.md
  3926 Dashboard Build/Private Use and Sharing.md
  6774 Dashboard Build/Reference - Obsidian API for This Build.md
  8389 Dashboard Build/Research - Obsidian Dashboard Methods.md
 12246 Dashboard Build/Research - Plugin Creation Guide.md
  4207 Dashboard Build/Review - Corrections to Earlier Notes.md
  4564 Dashboard Build/Sonnet 5.5 Prompt Rules.md
  4013 Dashboard Build/Verification and Risks.md
189983 total
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - hub
notes:
  - "[[Research - Jarvis Dashboard Findings]]"
  - "[[Decisions Log]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Spec - Home and Monthly Dashboards]]"
  - "[[Spec - AI Loop]]"
  - "[[Spec - Automation Layers]]"
  - "[[Build Plan]]"
  - "[[Prompts]]"
  - "[[Life OS]]"
  - "[[Agentic OS Standard]]"
  - "[[Agentic OS]]"
next: "Run prompt R1, then B1 (see Build Plan)"
---
# Dashboards Hub

The design record for The Plan's daily dashboard, streak system and AI loop, from the 2026-10-12 brainstorm. Jarvis owns work. The Plan owns personal growth: habits, health, money, learning, and one career line a day.

## What is being built

- **Home dashboard.** Opens on startup on desktop and phone. First thing seen: streak number and today's score ring.
- **Monthly dashboard.** Month heatmap and grade, failure causes, plan, finance, health, and an overview of both vaults.
- **Map canvas.** Exploration only, with real edges.
- **Streak system.** Five categories (Morning, Study, Fitness, Mind, Career). A day counts at 3 of 5. One miss forgiven, two in a row break it.
- **Daily note.** Redesigned around those categories. The only source of truth.
- **AI loop.** Five skills, four agents, three hooks, one streak script, reference notes for every tool.
- **Automation.** Daily, weekly and monthly layers, laid out and built later.

## Notes in this folder

| Note | Holds |
|---|---|
| [[Research - Jarvis Dashboard Findings]] | What Jarvis contains, what was weak, The Plan's current state |
| [[Decisions Log]] | Every question and answer, plus items still to confirm |
| [[Spec - Streak and Daily Note]] | Categories, rules, algorithm, daily note schema |
| [[Spec - Home and Monthly Dashboards]] | Layouts, plugins, visual language, risks |
| [[Spec - AI Loop]] | Skills, agents, hooks, toolkit, logging, `60_Jarvis` zones |
| [[Spec - Automation Layers]] | Daily, weekly and monthly layers and their constraints |
| [[Build Plan]] | Order, dependencies, gates, risks |
| [[Dashboard Build Hub]] | How the Home dashboard is built: research, architecture, front end, stages, prompts (folder `Dashboard Build`) |
| [[Prompts]] | One prompt per session |

## Where the built system is documented (2026-10-13)

The design above is built in part. The rules and procedures now live in `30_Order`, and this folder keeps the design record.

| Question | Note |
|---|---|
| What are the rules of the daily note and the streak? | [[Daily Note Schema]], [[Streak Rule]] |
| What does a weekly or monthly review measure, grade and write? | [[30_Order/Standards/Dashboards/Weekly Review|Weekly Review]], [[30_Order/Standards/Dashboards/Monthly Review|Monthly Review]] |
| When is a review due and may it run alone? | [[Scheduled Review]] |
| How is the assistant tooling organised and what may each part write? | [[Agentic OS Standard]] |
| How are skills, agents and hooks built? | [[Skill Standard]], [[Agent Standard]], [[Hook Standard]] |
| How do I run the loop? | [[Agentic OS]], [[Daily Dashboard]], [[How to Use Skills]] |
| What does the engine do and how was it tested? | [[Reference - plan-cli]] |

## Navigation

The markdown page `00_Dashboard.md` was retired on 2026-10-14 (Decision 47). The active dashboard is the private plugin view `the-plan-dashboard`, opened with the command "Open dashboard" ([[Reference - the-plan-dashboard]]). The links that page held are kept here.

- **Entry points:** [[AI_CONTEXT]], [[AGENTS]], [[AI AGENT]], [[CLAUDE]], [[60_Jarvis/00_Control_Center/Jarvis Control Center|Jarvis Control Center]]
- **Boards:** [[20_Progress/Projects/Projects Board|Projects Board]], [[20_Progress/UROP/BOOM Board|BOOM Board]], [[60_Jarvis/60_Jarvis Board|Jarvis Board]]
- **Month:** the current Monthly note in `00_Live/Enumerate/Monthly/`, for example [[2026-10]], and the [[Monthly Dashboard]] that reads the daily notes
- **Map:** [[Map Canvas.canvas|Map canvas]] (domains, goals and the notes that own them). Not [[Map]], which is the `00_Live` index.

## Principles

1. Direct, factual language. No praise, no guilt.
2. One source of truth. The daily note holds the data. Dashboards read.
3. Computed, not typed. Every dashboard number comes from the daily notes.
4. Minimal frontmatter. Ticking lists, not tables.
5. Every tool has a reference note with its source.
6. No unrequested writes. Anything that touches outside systems waits for approval.
7. Stop at the slice. Mention extras; do not build them.
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - build
  - hub
notes:
  - "[[Dashboards Hub]]"
  - "[[Research - Obsidian Dashboard Methods]]"
  - "[[Architecture]]"
  - "[[Front End and Visual System]]"
  - "[[Build Steps]]"
  - "[[Verification and Risks]]"
  - "[[Build Prompts]]"
  - "[[Plugin Build Prompts]]"
  - "[[Research - Plugin Creation Guide]]"
  - "[[Reference - Obsidian API for This Build]]"
  - "[[Private Use and Sharing]]"
  - "[[Review - Corrections to Earlier Notes]]"
  - "[[Sonnet 5.5 Prompt Rules]]"
  - "[[Build Log]]"
  - "[[Decisions Log]]"
  - "[[Spec - Streak and Daily Note]]"
next: "Run B1 and B2, then Plugin Build Prompts 1 to 5 in order"
---
# Dashboard Build

How the Home dashboard gets built, from data to pixels. The design (what it shows and why) is in [[Dashboards Hub]]. This folder answers the one question left: what is the dashboard made of, if it is not a note, a canvas, a Kanban or a drawing.

## The answer

**A small private Obsidian plugin that draws the dashboard in its own view.** Homepage opens that view at launch on desktop and phone. Every number on screen is computed from the daily notes, which stay plain markdown. Ticking a task in the view edits the checkbox line in the daily note.

Three layers, each replaceable without touching the others:

1. **Data.** Daily notes, `YYYY-MM-DD.md`, with `- [ ]` lines and a `[cat:: ...]` field. Defined in [[Spec - Streak and Daily Note]].
2. **Engine.** One pure TypeScript module that turns note text into day status, streak and best streak. The plugin and the Claude Code hooks both run this same file. No second implementation exists to drift.
3. **View.** A plugin view that renders the ring, streak, heatmap, today's ticks and the explore map with plain DOM and inline SVG.

## Why not the alternatives

Short version. The full comparison with sources is in [[Research - Obsidian Dashboard Methods]].

- A markdown note with DataviewJS is what Jarvis did. Dataview is in maintenance mode, DataviewJS views still flicker on refresh, and layout is fought with CSS.
- Datacore is still a work-in-progress with no confirmed mobile support.
- Bases cannot draw a ring or a heatmap, and cannot walk a sequence of days to compute a streak.

## Notes in this folder

| Note | Holds |
|---|---|
| [[Research - Obsidian Dashboard Methods]] | Every option compared, with sources and what is unverified |
| [[Architecture]] | Layers, data flow, modules, file layout, where the code lives |
| [[Front End and Visual System]] | Layout, colours, ring, heatmap, interactions, phone behaviour |
| [[Build Steps]] | Stages S0 to S6, gates, the dev loop |
| [[Verification and Risks]] | What is unverified and the exact test for each |
| [[Plugin Build Prompts]] | The five prompts that build the plugin, with the shared preamble |
| [[Research - Plugin Creation Guide]] | How a plugin is made: sample repo, manifest, guidelines, dev loop, Homepage and Sync internals |
| [[Reference - Obsidian API for This Build]] | The exact API used, by module, with what to test |
| [[Private Use and Sharing]] | Whether the plugin must be shared, and what sharing would need |
| [[Review - Corrections to Earlier Notes]] | Conflicts between earlier notes and what wins |
| [[Sonnet 5.5 Prompt Rules]] | How the prompts follow the model guide |
| [[Build Log]] | Handoff between the five prompts |
| [[Build Prompts]] | Earlier stage prompts S0 to S6, superseded by Plugin Build Prompts |

## Relation to the earlier build plan

Stage S0 to S6 here replace prompt B3 (Home dashboard and CSS) in [[Build Plan]]. B1 (rename and standards) and B2 (template and streak script) still run first. B2's streak script becomes the engine module in this plugin.
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - build-plan
notes:
  - "[[Dashboards Hub]]"
  - "[[Decisions Log]]"
  - "[[Prompts]]"
  - "[[The Plan Vault Architecture]]"
next: "Run R1, then B1"
---
# Build Plan

This session (about one hour) designs the whole system and writes the prompts. Each later session builds one slice. Ready-to-paste prompts are in [[Prompts]].

## Order and dependencies

| Step | Prompt | Slice | Needs | Gate before moving on |
|---|---|---|---|---|
| 0 | R1 | Research: official specs, automation transport, plugin state | Nothing | Findings note written; unknowns listed |
| 1 | B1 | ISO rename of daily notes and the `30_Order` standards (note types, naming, daily schema, streak rule, folder map) | R1 | Every renamed note opens; all links resolve; standards reviewed by Anant |
| 2 | B2 | Daily template, QuickAdd choices, streak script and its tests | B1 | Script output matches hand-computed streak on sample notes |
| 3 | B3 | Home dashboard and CSS | B2 | Home renders on desktop and phone; ticking writes back; numbers equal the script |
| 4 | B4 | The five skills (directories) | B1, B2 | Each skill dry-run on a sample day; reference notes exist |
| 5 | B5 | Four agents and three hooks, plus `settings.json` | R1, B1 | Hook tests: blocked cases blocked, allowed cases allowed |
| 6 | B6 | `60_Jarvis` zones README, `CLAUDE.md` rewrite, `AGENTS.md` reconciliation, `jarvis-dump` | B4, B5 | No stale paths; one rule set |
| 7 | B7 | Monthly dashboard and the Map canvas | B3 | Monthly renders; canvas has edges |
| 8 | B8 | Plugin audit and phone test, sync-collision check | B3 | Written pass/fail list for desktop and phone |
| 9 | A1 | Automation layers (later, not in this build) | All above, R1 | Separate plan |

## Update 2026-10-12 (second session)

Step 3 (B3, Home dashboard and CSS) is replaced by stages S0 to S6 in [[Dashboard Build Hub]]. The Home is a private plugin view, not a markdown note. B2's streak script becomes the shared engine module.

## This session (done in the hour)

- Research of Jarvis and The Plan: [[Research - Jarvis Dashboard Findings]].
- Every question answered: [[Decisions Log]].
- Specs: [[Spec - Streak and Daily Note]], [[Spec - Home and Monthly Dashboards]], [[Spec - AI Loop]], [[Spec - Automation Layers]].
- Prompts for every later session: [[Prompts]].
- Nothing outside this folder was written or moved.

## Next-day target

Finish B1 to B3 so the daily note, the streak and the Home page exist. Everything else follows in the order above.

## Risks to watch

1. **Rename breakage.** The ISO rename touches every daily note. Use link-aware moves and verify links after.
2. **Scope creep.** Each prompt says to stop when its slice is done and to mention extras instead of building them.
3. **Drift between script and dashboard.** One test, run in B3.
4. **Unverified plugin state.** Do B8 early if Home misbehaves.
5. **Sync collisions.** Obsidian Sync, git auto-sync and any Syncthing must not write the same files.
6. **Secrets.** `40_Resources/CS/Links.md` still lists a Keys section. Rotate and strip it separately; no prompt here reads it.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Decisions Log.md" "Dashboard Build/Build Log.md" "Dashboard Build/Build Steps.md"
```
```
---
type: evergreen
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - decisions
notes:
  - "[[Dashboards Hub]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Spec - Home and Monthly Dashboards]]"
  - "[[Spec - AI Loop]]"
  - "[[Spec - Automation Layers]]"
  - "[[Jarvis Architectural Decision Register]]"
next: "Confirm the items under Proposed, not yet confirmed"
---
# Decisions Log

Every question answered in the 2026-10-12 brainstorm, with the consequence for the build. Items marked Proposed were suggested by the assistant and not yet confirmed by Anant.

## Confirmed

| # | Question | Answer | Consequence |
|---|---|---|---|
| 1 | What is DOPPLER? | Speech-to-text error, "probably dashboard" | The word is not a name. Nothing is named DOPPLER. |
| 2 | What is `60_Jarvis`? | Both: governance and staging, plus an AI knowledge layer, in separate zones | Two zones inside the folder. See [[Spec - AI Loop]]. |
| 3 | Streak rule | Floor-based, one forgiven miss | Day counts at 3 of 5 categories. Two misses in a row break it. |
| 4 | Daily note naming | Rename all to `YYYY-MM-DD` | Required before any query works. Link-aware move. |
| 5 | Devices | Desktop and phone Obsidian | Single-column layout must work. No plugin that fails on mobile. |
| 6 | Scope of Home | Habits, health and finance trackers, learning, career. Career and Learning are one specific daily line each, not trackers. Detail lives in Jarvis. | Home stays small. Career line and study hours are the only work-side items. |
| 7 | Streak units | Five categories: Morning, Study, Fitness, Mind, Career. Habits sit under them as time-anchored actions. | Streak counts categories, not habits. |
| 8 | Category done rule | All actions in the category ticked | Morning needs move, read and plan. Study and Career have one action. |
| 9 | Habit line format | One defined line: I will [behavior] at [time] in [location] so that I can become [identity] | Same format for every action. Stored on the line. |
| 10 | Mind category | No-doomscroll (mindset content) plus the no-smoking gate as an action | Gate is one action, not a day-blocking keystone. |
| 11 | Career line | One named task, written manually in the daily note | Set during the evening close. Never auto-repeated. |
| 12 | Rewards | Streak counter, best streak, 30-day heatmap, daily score ring, GitHub-style daily record like the gupta-builds README | Visual language ported from the README card. |
| 13 | Milestones | 3 / 7 / 21 / 66 / 100 days | Ring and level titles use these. |
| 14 | Surfaces | Home and Monthly are the two dashboards. A linked canvas map is a third, exploration only. | Honors the max-2 daily dashboards rule. |
| 15 | Tick method | Ticking lists with a category field. Meta Bind only for hours and text. Minimal frontmatter. | No tables for ticking. |
| 16 | Close routine | The Plan has its own `/closeday`. Jarvis's stays work-only. | No cross-vault writes. |
| 17 | Next actions | Max 5 per day, never repeat a task. Types: streak, career, gym, failures. | Enforced by the validator hook. |
| 18 | Failure log | One-word cause tag per missed category | Monthly page counts causes. |
| 19 | Jarvis state on Monthly | A monthly snapshot note written in `60_Jarvis` | Monthly embeds the latest. |
| 20 | Five skills | startday, closeday, weekly-review, monthly-review, jarvis-dump | Skills are directories. |
| 21 | Four agents | daily-auditor, review-analyst, skeptic, vault-curator. Cut career-operator and research-distiller. | Agents are folders or files by purpose. |
| 22 | Hooks | Write guard, secrets guard, daily-note validator. Written to Anthropic's official spec. | Spec checked in prompt R1. |
| 23 | CLAUDE.md | Thin pointer to AGENTS.md plus Claude-only specifics | One rule set. |
| 24 | Home top | Streak number and score ring first | Then today's ticks, career and study lines. |
| 25 | Logging | Four layers: daily note, review sections, decision register, AI session log (only with approval) | No new folders. |
| 26 | `/jarvis-dump` | Copy, Jarvis untouched. Writes nowhere except the `60_Jarvis` landing folder. | Provenance frontmatter on every dumped note. |
| 27 | Tool references | One reference note per tool in `30_Order/Standards/References/`, linked from the tool | Source URL, version checked, date. Path clarified 2026-10-13 to match [[Spec - AI Loop]] and the [[Tool Reference Template]]. |
| 28 | Task intake | Reminders (phone), Todoist, Google Calendar (gupt0479@umn.edu), tasks typed in Obsidian | Three automation layers. See [[Spec - Automation Layers]]. |
| 29 | Hour-one scope | Design the whole architecture. `30_Order` entirely, basic skills, agents and hooks laid out. Prompts for the later sessions. | Build is staged. See [[Build Plan]]. |
| 30 | Automation | Not part of this build. Only the basic layer is laid out. | Slot reserved in the daily note. |
| 31 | Score ring colours (2026-10-12, second session) | Red, golden orange, light dark green | Red under 3, golden orange at 3 and 4, green at 5. See [[Front End and Visual System]]. |
| 32 | How forgiven days count | As lost days in the month | Adds 0 to streak length, never resets, counted in the month's lost days. |
| 33 | Heatmap shading | Eye pleasing | Single green ramp, dashed outline on forgiven days. Fine detail decided on screen. |
| 34 | Dashboard medium | Not a note, canvas, Kanban or drawing. Homepage opens it on launch. Research the latest Obsidian methods. | Proposed answer: a private plugin view. See [[Dashboard Build Hub]]. Needs Anant's go-ahead for S0. |
| 35 | ISO rename done (2026-10-13) | Approved and executed. 27 daily notes `DD-MM-YYYY` to `YYYY-MM-DD`; `22-12-2025 and before` became `2025-12-22`; 4 monthly notes `MM-YYYY` to `YYYY-MM` (`2025-12`, `2026-01`, `2026-03`, `2026-06`). | Moved with `obsidian move`, so wikilinks updated. Dataview returns `file.day` for all 28 dailies (after a reindex, since Dataview does not reparse on rename). Two dead links to missing 23-12-2025 and 25-12-2025 were removed from `2025-W52`. Weekly and yearly names were already ISO-style. See [[Naming and Folder Map]]. |
| 36 | Streak engine (2026-10-13, orchestration session) | The Node program `plan-cli`, built from the plugin's `core/`, is what skills, hooks and reviews call. `streak.py` stays as the reference and the test oracle. | Removes the Python path dependency. Parity tests keep the two equal. Replaces the earlier Proposed item. See [[Reference - plan-cli]]. |
| 37 | Grade for weeks and months | Percent of counted days MET, plus a letter: A at 90, B at 75, C at 60, D at 40, F below | The bands are one table in `CONFIG.gradeBands`. A change goes through this log first. The percent stays the number of record. Confirmed by Anant on 2026-10-14: the same letter structure as the daily workflow, with the percent. |
| 38 | Jarvis Review proposals | Accepted as written: outcomes promote, revise and reject; reject goes to deletion or `60_Jarvis/40_Archive` only after a yes; a promoted note gets `status: seed` or `sprout` and `reviewed: YYYY-MM-DD`; one review note per batch in `60_Jarvis/50_Reviews/Jarvis/`, written on request; `unreviewed` stays a one-folder status exception | See [[Jarvis Review]] and [[Jarvis Move]]. On 2026-10-14 Anant confirmed this as the base. It will be modified in detail after the process has run and been proven to work. |
| 39 | Scope of the orchestration build | The base only: engine, CLI, hooks as a program, tests, agents, skills updated, standards and workflows. No new dashboard screens. | The Monthly and review views stay with B7. |
| 40 | Review cadence and automation (revised 2026-10-14) | Unattended runs are scheduled tasks that fire by themselves at set times with no human yes or no. They are meant for repetitive, clearly defined, detailed processes, and for now for the weekly and monthly reviews only. The reviews are designed in detail, and their times and settings fixed, only after the manual process has run and been proven. The due times in [[Scheduled Review]] (weekly after the Sunday close, monthly on the 1st) are working defaults until then. | Nothing is scheduled and every review is manual today. Writes of an unattended run are limited to the review's own entry. An engine-only, read-only report is designed and not built. |
| 41 | Milestone level titles (revised 2026-10-14) | The beginning (3), Toward 21 (7), Now it gets hard (21), Work pays off (66), Consistency, discipline, mindset (100) | Worded from Anant's own lines and shortened for the dashboard. They replace the earlier defaults Spark, Steady, Habit, Automatic and Centurion. They are in `CONFIG.milestoneTitles` and in [[Streak Rule]]. The dashboard does not show them yet. Change this row and the config together. |
| 42 | Jarvis snapshot for the Monthly review | Jarvis writes it in its own vault. Anant brings it across with `/jarvis-dump`. Its file name contains "Snapshot" and the month label, for example `Jarvis Snapshot 2026-09.md`. `monthly-review` requests it and never produces it. | The engine matches the name in `60_Jarvis/10_Promoted_Notes`. |
| 43 | Dumped copies and the promotion index | A source's existing `status` moves to `source_status` when `status: unreviewed` is added. The index's Dataview query points at `60_Jarvis/10_Promoted_Notes`. | The query path is fixed in [[Promoted From Jarvis Index]]. |
| 44 | Hooks | The write guard, secrets guard and daily-note validator are one program, `plan-cli hook`. The guards fail closed. They are registered in `.claude/settings.json` only after Anant approves the diff in [[Hook Standard]]. | Registered on 2026-10-13 and verified live. |
| 45 | Agents | `daily-auditor`, `review-analyst` and `skeptic` are single read-only files with `Read, Grep, Glob`, and the caller supplies engine output. `vault-curator` was rewritten, and `career-operator` and `research-distiller` were removed, on 2026-10-13 with Anant's approval. | See [[Agent Standard]]. |
| 46 | The frozen month (2026-10-14) | A finished month stays inside the same `00_Live/Enumerate` folder and is not archived until a new year begins. Each 1st: learn (the review), improve (decide changes), plan ahead (a new month with a new plan, forgetting the previous 30 days). The daily notes of a finished month may be rearranged inside `Enumerate`. | Replaces the Proposed item "a frozen monthly recap is the archive". Where the daily notes are rearranged is not decided, and the engine reads only `Daily/`, so nothing moves until the engine accepts the new place. See [[30_Order/Standards/Dashboards/Monthly Review|Monthly Review]]. |
| 47 | `00_Dashboard.md` retired (2026-10-14) | Anant asked for the markdown dashboard to be deleted, because the plugin view is the active dashboard. | The note was deleted. Its links were repointed to [[Dashboards Hub]], which now holds the navigation links. Homepage was already set to "Nothing". |
| 48 | Best streak follows the spec (2026-10-14) | `best` counts closed days only, as in [[Spec - Streak and Daily Note]]. Today joins it the next day. | `streak.py` and the engine were changed together and the parity tests pass. The earlier `max(best, current)` is removed. The deployed plugin build keeps it until the plugin is next built. See [[Streak Rule]]. |
| 49 | Workflow names and Dataview paths (2026-10-14) | The review workflows are named [[Run Weekly Review]] and [[Run Monthly Review]], so that no note shares a name with its standard. Dataview queries now point at folders that exist. | Links were rewritten. Fixed: the Jarvis Board, System Status, Enrichment Quality Dashboard, the project briefs board and the Enumerate Board. |
| 50 | Hook code location (2026-10-14) | The three hooks stay inside `plan-cli.cjs` and are registered in `.claude/settings.json`. No scripts are created in `30_Order/System/hooks`. This settles the conflict between the early build prompt, which asked for scripts there, and Decisions 36 and 44. | One program shares the parser and path rules with the dashboard, has unit and built-bundle tests, and is already registered. Separate scripts would duplicate each rule and run twice per call. Changes go through the engine source, then `build:cli` and `deploy:cli`. See [[Hook Standard]]. |

## Proposed, not yet confirmed

- Plugin source lives in a separate repo outside the vault, built files copied in. See [[Architecture]].
- Streak and ring colour hex values in [[Front End and Visual System]].
- Multi-Column Markdown plugin dropped in favour of a CSS grid snippet.
- Review records: `60_Jarvis/50_Reviews/Weekly` and `Monthly` hold a saved analysis only on request, `Dashboard` holds verification records, `Agentic OS` holds toolkit audits. See [[Agentic OS Standard]].
- Google Calendar alarms for 8 am, 2 pm, 5:30 and the evening close: not decided. Anant raised the reminder and Todoist overlap instead. See [[Spec - Automation Layers]].
---
type: project
status: seed
created: 2026-10-13
tags:
  - dashboard
  - build-log
notes:
  - "[[Dashboard Build Hub]]"
  - "[[Plugin Build Prompts]]"
  - "[[Verification and Risks]]"
next: "Prompt 1 appends its entry here"
---
# Build Log

Handoff between the five plugin prompts. Each prompt reads this note first and appends one entry at the end of its run. Entries are facts only: what was built, what was checked and the result, decisions made, and what the next prompt must know. Do not rewrite earlier entries.

## Fixed answers (2026-10-13)

| Item | Value |
|---|---|
| Plugin id | `the-plan-dashboard` |
| Code location | `D:\_Anant\20_Progress\Projects\the-plan-dashboard` (own git repo, outside the vault) |
| Hosting | Private GitHub repository. Created and pushed only after Anant approves in the session. |
| Day rollover | Midnight. A tick after midnight belongs to the new date. |
| Prerequisites | B1 (ISO rename, standards) and B2 (daily template, QuickAdd steps) are done before Prompt 1 starts. |
| Daily folder | `00_Live/Enumerate/Daily` |
| Sync | Obsidian Sync carries the built plugin files. Not submitted to the community directory. |

## Entries

### 2026-10-13, orchestration base (engine, hooks, review tooling)

Built in the plugin repository, outside the five plugin prompts:

- New pure modules in `src/core/`: `periods` (ISO weeks and months), `close` (Evening close and next-action parsing and the repeat check), `grade`, `review` (a week or month in one call), `validate` (the six daily-note rules), `jarvis` (mechanical Jarvis review checks).
- New `src/hooks/`: `writeGuard`, `secretsGuard`, `dailyValidator`, `paths`, `types`.
- New `src/cli/plan-cli.ts` with commands `streak`, `day`, `review`, `validate`, `repeat`, `jarvis-check` and `hook`. `streak-cli` is kept and shares code with it. Bundles build with `npm run build:cli`. `npm run deploy:cli -- <folder>` copies `plan-cli.cjs`.
- `CONFIG` gained the cause list, next-action types, grade bands, level titles and the folder names. Its Home links now point at `30_Order/Standards/Dashboards/`.
- Checks: `npm test` gives 87 of 87 with the Python parity tests enabled (87 tests, 0 skipped), and `tsc` is clean. The parity tests compare the engine with `streak.py` on 200 random histories and on every day of 20 random months. A bug found by the tests: the template's `%%` example line under Evening close would have counted as a miss. It is fixed and tested.
- The built `plan-cli.cjs` is deployed to `30_Order/System/plan-cli/` in the vault. It equals `dist/plan-cli.cjs`.
- Not done: the plugin build in `.obsidian/plugins/the-plan-dashboard/` was not redeployed (it is under `.obsidian`). The repository changes are not committed. Hooks are not registered. Nothing ran in a live Claude Code session. Nothing was tested on a phone.
- The next prompt must know: the Home view still has the old standards links until the plugin is rebuilt and redeployed, and the dashboard does not show the level titles or the grade.
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - build-plan
notes:
  - "[[Dashboard Build Hub]]"
  - "[[Architecture]]"
  - "[[Front End and Visual System]]"
  - "[[Verification and Risks]]"
  - "[[Build Prompts]]"
  - "[[Build Plan]]"
next: "S0"
---
# Build Steps

Seven stages. Each ends in something Anant can open and a pass or fail gate. The prompt for each is in [[Build Prompts]]. These replace B3 in [[Build Plan]].

## Order

| Stage | Output | Needs | Gate |
|---|---|---|---|
| S0 Spike | Plugin that shows "hello" in its own view; Homepage opens it at launch; synced to the phone | Node, a code folder | Opens on launch on desktop and phone with no manual step |
| S1 Engine | `core/` with parse, streak, toggle and tests | B1 rename, B2 template. Fixtures can stand in. | All tests pass, including the forgiven-miss and missing-note cases |
| S2 Data and write | Repo, cache, `vault.process` toggle | S1 | Ticking a row in a test note edits only that line; stale line is refused |
| S3 Hero and Today | Ring, streak number, five category cards with ticking | S2 | Tap on phone ticks the note; ring and number match the CLI |
| S4 Heatmap, Month, Career, Next actions | Remaining panels | S3 | Heatmap equals the CLI's day statuses for the last 30 days |
| S5 Explore | Radial map from one note's links | S3 | Every node opens its note |
| S6 Polish and ship | Reduced motion, light theme, safe areas, retire `00_Dashboard.md` markdown and `dashboard.css`, set Homepage and Lazy Plugin Loader to instant | S3 to S5 | Cold launch to visible dashboard under 2 seconds on desktop, under 4 on phone |

## Dev loop

1. `npm run dev` runs esbuild in watch mode and writes `main.js` into the vault's plugin folder.
2. On desktop, the Hot Reload community plugin (or the command "Reload app without saving") picks the change up.
3. `npm test` runs the engine tests under Node. They never need Obsidian.
4. `npm run cli -- <folder> <date>` prints the engine's JSON. Used to cross-check the screen.
5. On the phone, Obsidian Sync carries the built files. Use "Reload app without saving" in the command palette to load them.
6. Emulate mobile on desktop with `app.emulateMobile(true)` in the developer console before trying the phone.

## Test plan

- **Unit, S1.** Fixtures as plain note files in `tests/fixtures/`. Cases: all five done; exactly three; two; a note with no tasks; Study with zero actions (not done, not counted as done); isolated MISS forgiven; two MISS in a row reset; missing note is MISS; today is pending; month boundary; leap year; run of 400 days.
- **Golden, S1.** One fixture month with a hand-computed expected streak, best streak and lost-day count, written before the code.
- **Write, S2.** Toggle changes one character. Refuses when the line text differs. Preserves CRLF or LF as found. Leaves frontmatter bytes identical.
- **Screen vs CLI, S3 to S4.** A debug command prints the view's numbers; the CLI prints the engine's. They must match.
- **Manual, S6.** Desktop and phone checklist from B8.

## Estimated effort

S0 one short session. S1 and S2 one session. S3 one session. S4 to S6 one to two sessions. This is the part to question: if S0 fails (Homepage cannot open the view), the fallback adds minutes, not days.

## Stop rule

Each stage stops at its gate. Extras are noted, not built. No automation work (A1) starts inside these stages.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git log --oneline | head -40; git status --short | head -40; echo ---; ls -la; echo; find src tests -type f | grep -v node_modules | sort; cat package.json manifest.json 2>/dev/null
```
```
a65a4ba Secrets guard: a bare word is not a file name
23e6452 Add engine review modules, plan-cli, hooks and tests
b744ba1 Dashboard plugin: engine, React view, tests
 M src/core/config.ts
 M src/core/streak.ts
 M tests/engine.test.ts
---
total 212
drwxr-xr-x 1 anant 197609      0 Oct 14 14:42 .
drwxr-xr-x 1 anant 197609      0 Oct 13 14:54 ..
drwxr-xr-x 1 anant 197609      0 Oct 25 20:13 .git
-rw-r--r-- 1 anant 197609     69 Oct 13 14:54 .gitignore
drwxr-xr-x 1 anant 197609      0 Oct 13 15:03 .preview-out
drwxr-xr-x 1 anant 197609      0 Oct 14 14:42 .test-out
drwxr-xr-x 1 anant 197609      0 Oct 13 16:00 dist
-rw-r--r-- 1 anant 197609   1647 Oct 13 15:58 esbuild.config.mjs
-rw-r--r-- 1 anant 197609 247154 Oct 13 19:51 main.js
-rw-r--r-- 1 anant 197609    233 Oct 13 14:54 manifest.json
drwxr-xr-x 1 anant 197609      0 Oct 13 14:55 node_modules
-rw-r--r-- 1 anant 197609  46685 Oct 13 14:55 package-lock.json
-rw-r--r-- 1 anant 197609   1009 Oct 13 15:58 package.json
drwxr-xr-x 1 anant 197609      0 Oct 13 15:58 scripts
drwxr-xr-x 1 anant 197609      0 Oct 13 15:55 src
-rw-r--r-- 1 anant 197609   1836 Oct 13 15:04 styles.css
drwxr-xr-x 1 anant 197609      0 Oct 14 10:51 tests
-rw-r--r-- 1 anant 197609    580 Oct 13 14:54 tsconfig.json
-rw-r--r-- 1 anant 197609    758 Oct 13 14:54 version-bump.mjs
-rw-r--r-- 1 anant 197609     22 Oct 13 14:54 versions.json

src/cli/common.ts
src/cli/plan-cli.ts
src/cli/streak-cli.ts
src/core/close.ts
src/core/config.ts
src/core/dates.ts
src/core/grade.ts
src/core/jarvis.ts
src/core/model.ts
src/core/parse.ts
src/core/periods.ts
src/core/review.ts
src/core/sections.ts
src/core/streak.ts
src/core/tables.ts
src/core/toggle.ts
src/core/validate.ts
src/data/repo.ts
src/data/write.ts
src/hooks/dailyValidator.ts
src/hooks/paths.ts
src/hooks/secretsGuard.ts
src/hooks/types.ts
src/hooks/writeGuard.ts
src/main.ts
src/settings.ts
src/ui/App.tsx
src/ui/charts.tsx
src/ui/hooks.ts
src/ui/sections.tsx
src/ui/styles.ts
src/view/DashboardView.tsx
tests/cli.test.ts
tests/engine.test.ts
tests/helpers.ts
tests/hooks.test.ts
tests/jarvis.test.ts
tests/parity.test.ts
tests/periods.test.ts
tests/preview.tsx
tests/review.test.ts
tests/ui.test.tsx
tests/validate.test.ts
{
	"name": "the-plan-dashboard",
	"version": "0.1.0",
	"description": "Private Obsidian dashboard for The Plan: streak, score ring, today's ticks, heatmap.",
	"main": "main.js",
	"type": "module",
	"private": true,
	"scripts": {
		"dev": "node esbuild.config.mjs",
		"build": "tsc -noEmit -skipLibCheck && node esbuild.config.mjs production",
		"build:cli": "node esbuild.config.mjs cli",
		"cli": "node dist/plan-cli.cjs",
		"deploy:cli": "node scripts/deploy-cli.mjs",
		"test": "node esbuild.config.mjs cli && node scripts/test.mjs",
		"preview": "node scripts/preview.mjs",
		"deploy": "node scripts/deploy.mjs",
		"version": "node version-bump.mjs && git add manifest.json versions.json"
	},
	"dependencies": {
		"react": "^19.3.0",
		"react-dom": "^19.3.0"
	},
	"devDependencies": {
		"@types/jsdom": "^21.1.7",
		"@types/node": "^22.15.17",
		"@types/react": "^19.3.0",
		"@types/react-dom": "^19.3.0",
		"esbuild": "0.25.5",
		"jsdom": "^24.1.3",
		"obsidian": "latest",
		"typescript": "^5.8.3"
	}
}
{
	"id": "the-plan-dashboard",
	"name": "The Plan dashboard",
	"version": "0.1.0",
	"minAppVersion": "1.5.7",
	"description": "Daily streak, score ring, ticks and heatmap for The Plan.",
	"author": "Anant",
	"isDesktopOnly": false
}
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git diff --stat; git diff; git log -3 --format='%h %ad %s' --date=iso; git remote -v; echo ---; ls -la "D:/_Anant/20_Progress/Documents/The Plan/.obsidian/plugins/the-plan-dashboard"; md5sum main.js "D:/_Anant/20_Progress/Documents/The Plan/.obsidian/plugins/the-plan-dashboard/main.js" dist/plan-cli.cjs "D:/_Anant/20_Progress/Documents/The Plan/30_Order/System/plan-cli/plan-cli.cjs"
```
```
 src/core/config.ts   | 2 +-
 src/core/streak.ts   | 2 +-
 tests/engine.test.ts | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
diff --git a/src/core/config.ts b/src/core/config.ts
index 1296405..4b48851 100644
--- a/src/core/config.ts
+++ b/src/core/config.ts
@@ -14,7 +14,7 @@ export const CONFIG = {
 	floor: 3,
 	milestones: [3, 7, 21, 66, 100],
 	/** Level title per milestone (Decision 41). Shown by the dashboard when the Home view is next changed. */
-	milestoneTitles: { 3: "Spark", 7: "Steady", 21: "Habit", 66: "Automatic", 100: "Centurion" } as Record<number, string>,
+	milestoneTitles: { 3: "The beginning", 7: "Toward 21", 21: "Now it gets hard", 66: "Work pays off", 100: "Consistency, discipline, mindset" } as Record<number, string>,
 	heatDays: 30,
 	dailyFolder: "00_Live/Enumerate/Daily",
 	monthlyFolder: "00_Live/Enumerate/Monthly",
diff --git a/src/core/streak.ts b/src/core/streak.ts
index 89ed683..a6c9e64 100644
--- a/src/core/streak.ts
+++ b/src/core/streak.ts
@@ -87,7 +87,7 @@ export function computeStreak(
 
 	return {
 		current,
-		best: Math.max(best, current),
+		best,
 		todayDone,
 		todayMet,
 		atRisk: prevMiss && !todayMet,
diff --git a/tests/engine.test.ts b/tests/engine.test.ts
index def0b67..a7f21e8 100644
--- a/tests/engine.test.ts
+++ b/tests/engine.test.ts
@@ -60,6 +60,7 @@ test("today is pending until MET, and adds one when MET", () => {
 	assert.equal(pending.todayDone, 2);
 	const met = run({ [-2]: note(THREE), [-1]: note(THREE), 0: note(FIVE) });
 	assert.equal(met.current, 3);
+	assert.equal(met.best, 2); // today joins best once the day closes
 	assert.equal(met.todayDone, 5);
 });
 
a65a4ba 2026-10-13 19:53:48 -0500 Secrets guard: a bare word is not a file name
23e6452 2026-10-13 16:37:06 -0500 Add engine review modules, plan-cli, hooks and tests
b744ba1 2026-10-13 15:05:03 -0500 Dashboard plugin: engine, React view, tests
---
total 141
drwxr-xr-x 1 anant 197609      0 Oct 13 15:05 .
drwxr-xr-x 1 anant 197609      0 Oct 15 19:51 ..
-rw-r--r-- 1 anant 197609 247154 Oct 13 19:51 main.js
-rw-r--r-- 1 anant 197609    233 Oct 13 14:54 manifest.json
-rw-r--r-- 1 anant 197609   1836 Oct 13 15:04 styles.css
[REDACTED] *main.js
[REDACTED] *D:/_Anant/20_Progress/Documents/The Plan/.obsidian/plugins/the-plan-dashboard/main.js
[REDACTED] *dist/plan-cli.cjs
[REDACTED] *D:/_Anant/20_Progress/Documents/The Plan/30_Order/System/plan-cli/plan-cli.cjs
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && ls -la --time-style=full-iso dist; grep -n "Math.max(best" dist/*.cjs main.js | head; grep -c "The beginning" dist/plan-cli.cjs main.js; wc -l src/**/*.ts src/**/*.tsx src/*.ts; cat src/main.ts src/settings.ts
```
```
total 40
drwxr-xr-x 1 anant 197609     0 2026-10-13 16:00:38.125583700 -0500 .
drwxr-xr-x 1 anant 197609     0 2026-10-14 14:42:09.624500000 -0500 ..
-rw-r--r-- 1 anant 197609 46388 2026-10-14 14:42:09.512997700 -0500 plan-cli.cjs
-rw-r--r-- 1 anant 197609  9734 2026-10-14 14:42:09.506553300 -0500 streak-cli.cjs
dist/plan-cli.cjs:289:        best = Math.max(best, run);
dist/streak-cli.cjs:148:        best = Math.max(best, run);
dist/plan-cli.cjs:1
main.js:0
   35 src/cli/common.ts
  272 src/cli/plan-cli.ts
   15 src/cli/streak-cli.ts
   83 src/core/close.ts
   45 src/core/config.ts
   25 src/core/dates.ts
   11 src/core/grade.ts
  119 src/core/jarvis.ts
   77 src/core/model.ts
   37 src/core/parse.ts
   70 src/core/periods.ts
  190 src/core/review.ts
   62 src/core/sections.ts
   98 src/core/streak.ts
   28 src/core/tables.ts
   22 src/core/toggle.ts
   83 src/core/validate.ts
   77 src/data/repo.ts
   23 src/data/write.ts
   48 src/hooks/dailyValidator.ts
   42 src/hooks/paths.ts
   77 src/hooks/secretsGuard.ts
   24 src/hooks/types.ts
   71 src/hooks/writeGuard.ts
   51 src/ui/hooks.ts
  138 src/ui/styles.ts
   71 src/ui/App.tsx
   90 src/ui/charts.tsx
  313 src/ui/sections.tsx
  111 src/view/DashboardView.tsx
   53 src/main.ts
   35 src/settings.ts
 2496 total
import { Plugin } from "obsidian";
import { DailyRepo } from "./data/repo";
import { DEFAULT_SETTINGS, PlanSettingTab, type PlanSettings } from "./settings";
import { DashboardView, VIEW_TYPE } from "./view/DashboardView";

export default class ThePlanDashboard extends Plugin {
	settings: PlanSettings = { ...DEFAULT_SETTINGS };
	repo!: DailyRepo;

	async onload(): Promise<void> {
		await this.loadSettings();
		this.repo = new DailyRepo(this.app, () => this.settings.dailyFolder);
		this.registerView(VIEW_TYPE, (leaf) => new DashboardView(leaf, this));
		this.addRibbonIcon("layout-dashboard", "Open dashboard", () => void this.openDashboard());
		this.addCommand({ id: "open-dashboard", name: "Open dashboard", callback: () => void this.openDashboard() });
		this.addSettingTab(new PlanSettingTab(this.app, this));

		// Vault events fire for every existing file at load unless registered after layout is ready.
		this.app.workspace.onLayoutReady(() => {
			const touch = (f: { path: string }) => {
				if (this.repo.isRelevant(f.path)) this.repo.invalidate(f.path);
			};
			this.registerEvent(this.app.vault.on("modify", touch));
			this.registerEvent(this.app.vault.on("create", touch));
			this.registerEvent(this.app.vault.on("delete", touch));
			this.registerEvent(this.app.vault.on("rename", (f, old) => {
				touch(f);
				if (this.repo.isRelevant(old)) this.repo.invalidate(old);
			}));
		});
	}

	async openDashboard(): Promise<void> {
		const existing = this.app.workspace.getLeavesOfType(VIEW_TYPE)[0];
		if (existing) {
			await this.app.workspace.revealLeaf(existing);
			return;
		}
		// A new tab, so opening the dashboard never replaces the note you were reading.
		const leaf = this.app.workspace.getLeaf("tab");
		await leaf.setViewState({ type: VIEW_TYPE, active: true });
		await this.app.workspace.revealLeaf(leaf);
	}

	async loadSettings(): Promise<void> {
		this.settings = { ...DEFAULT_SETTINGS, ...((await this.loadData()) as Partial<PlanSettings> | null) };
	}

	async saveSettings(): Promise<void> {
		await this.saveData(this.settings);
		this.repo.invalidate(this.settings.dailyFolder + "/");
	}
}
import { PluginSettingTab, Setting, type App } from "obsidian";
import { CONFIG } from "./core/config";
import type ThePlanDashboard from "./main";

export interface PlanSettings {
	dailyFolder: string;
}

export const DEFAULT_SETTINGS: PlanSettings = { dailyFolder: CONFIG.dailyFolder };

export class PlanSettingTab extends PluginSettingTab {
	constructor(
		app: App,
		private plugin: ThePlanDashboard,
	) {
		super(app, plugin);
	}

	display(): void {
		const { containerEl } = this;
		containerEl.empty();
		new Setting(containerEl)
			.setName("Daily notes folder")
			.setDesc("Folder holding the YYYY-MM-DD daily notes that the dashboard reads.")
			.addText((t) =>
				t
					.setPlaceholder(CONFIG.dailyFolder)
					.setValue(this.plugin.settings.dailyFolder)
					.onChange(async (value) => {
						this.plugin.settings.dailyFolder = value.trim() || CONFIG.dailyFolder;
						await this.plugin.saveSettings();
					}),
			);
	}
}
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" && cat view/DashboardView.tsx ui/App.tsx ui/hooks.ts ui/sections.tsx
```
```
import { ItemView, normalizePath, type WorkspaceLeaf } from "obsidian";
import { StrictMode, useCallback, useEffect, useMemo, useState } from "react";
import { createRoot, type Root } from "react-dom/client";
import { CONFIG } from "../core/config";
import { localIso } from "../core/dates";
import { buildModel, type Row } from "../core/model";
import type { RawData } from "../data/repo";
import { setChecked } from "../data/write";
import type ThePlanDashboard from "../main";
import { App } from "../ui/App";
import type { LinkItem } from "../ui/sections";

export const VIEW_TYPE = "the-plan-dashboard-view";

function Connected({ plugin }: { plugin: ThePlanDashboard }) {
	const { app, repo } = plugin;
	const [raw, setRaw] = useState<RawData | null>(null);
	const [today, setToday] = useState(() => localIso(new Date()));

	const reload = useCallback(() => {
		void repo.load().then(setRaw);
	}, [repo]);

	useEffect(() => {
		reload();
		return repo.subscribe(reload);
	}, [repo, reload]);

	// Midnight rollover: a tick after midnight belongs to the new date.
	useEffect(() => {
		const id = window.setInterval(() => setToday(localIso(new Date())), 30_000);
		return () => window.clearInterval(id);
	}, []);

	const model = useMemo(
		() => (raw ? buildModel(raw.texts, today, { healthText: raw.healthText, financeText: raw.financeText }) : null),
		[raw, today],
	);

	const dailyFolder = plugin.settings.dailyFolder;
	const onToggle = useCallback(
		(row: Row, checked: boolean) => {
			void setChecked(app, `${dailyFolder}/${today}.md`, row.line, row.text, checked).then(() => {
				// Redraw from disk after every write, whether it succeeded or was refused.
				repo.invalidate(normalizePath(`${dailyFolder}/${today}.md`));
			});
		},
		[app, repo, dailyFolder, today],
	);
	const onOpen = useCallback((path: string) => void app.workspace.openLinkText(normalizePath(path), "", false), [app]);

	const month = today.slice(0, 7);
	const year = today.slice(0, 4);
	const dated: LinkItem[] = [
		{ label: `Month ${month}`, path: `${CONFIG.monthlyFolder}/${month}.md` },
		{ label: `Year ${year}`, path: `${CONFIG.yearlyFolder}/${year}.md` },
	];
	const links = [...dated, ...CONFIG.links].filter((l) => app.vault.getFileByPath(normalizePath(l.path)) !== null);

	return (
		<App
			model={model}
			links={links}
			health={raw?.healthText !== undefined ? { label: "Health", path: CONFIG.health } : null}
			finance={raw?.financeText !== undefined ? { label: "Finance", path: CONFIG.finance } : null}
			dailyFolder={dailyFolder}
			onToggle={onToggle}
			onOpen={onOpen}
		/>
	);
}

export class DashboardView extends ItemView {
	private root: Root | null = null;

	constructor(
		leaf: WorkspaceLeaf,
		private plugin: ThePlanDashboard,
	) {
		super(leaf);
	}

	getViewType(): string {
		return VIEW_TYPE;
	}

	getDisplayText(): string {
		return "The Plan";
	}

	getIcon(): string {
		return "layout-dashboard";
	}

	async onOpen(): Promise<void> {
		this.contentEl.empty();
		this.contentEl.addClass("pl-view");
		this.root = createRoot(this.contentEl.createDiv({ cls: "pl-app" }));
		this.root.render(
			<StrictMode>
				<Connected plugin={this.plugin} />
			</StrictMode>,
		);
	}

	async onClose(): Promise<void> {
		this.root?.unmount();
		this.root = null;
	}
}

import { useRef } from "react";
import type { Model, Row } from "../core/model";
import { usePalette, useSize } from "./hooks";
import { Career, HeatCard, Hero, Links, NextActions, Study, Today, Trackers, type LinkItem } from "./sections";
import { AREA, rootStyle, T, type LayoutKind } from "./styles";

export interface AppProps {
	model: Model | null;
	/** Month, year and fixed links that exist in the vault. */
	links: LinkItem[];
	health: LinkItem | null;
	finance: LinkItem | null;
	dailyFolder: string;
	onToggle: (row: Row, checked: boolean) => void;
	onOpen: (path: string) => void;
	/** Force a theme. Used by tests and the preview; the plugin follows Obsidian. */
	theme?: "dark" | "light";
	/** Force a size. Used by tests where there is no layout engine. */
	fixedSize?: { w: number; h: number };
}

export function App(props: AppProps) {
	const ref = useRef<HTMLDivElement>(null);
	const measured = useSize(ref);
	const size = props.fixedSize ?? measured;
	const p = usePalette(props.theme);

	// Landscape panes get the three-row grid. Narrow or tall panes get the compact grid.
	const kind: LayoutKind = size.w === 0 || (size.w >= 720 && size.w / Math.max(size.h, 1) >= 1.1) ? "wide" : "compact";
	const fontPx =
		size.w === 0
			? 14
			: kind === "wide"
				? Math.max(10, Math.min(size.w / 78, size.h / 40, 22))
				: Math.max(10, Math.min(size.w / 30, size.h / 56, 15));
	const area = AREA[kind];

	const { model } = props;
	return (
		<div ref={ref} style={rootStyle(kind, fontPx)} data-layout={kind}>
			{model === null ? (
				<div style={{ gridColumn: "1 / -1", display: "grid", placeItems: "center", color: T.muted }}>Loading</div>
			) : (
				<>
					<Hero model={model} p={p} area={area.hero ?? {}} />
					<Today model={model} p={p} area={area.today ?? {}} onToggle={props.onToggle} />
					<HeatCard
						model={model}
						p={p}
						area={area.heat ?? {}}
						onOpenDay={(d) => props.onOpen(`${props.dailyFolder}/${d}.md`)}
					/>
					<Career model={model} p={p} area={area.career ?? {}} />
					<Study model={model} p={p} area={area.study ?? {}} />
					<NextActions model={model} p={p} area={area.next ?? {}} />
					{kind === "wide" && (
						<Trackers
							model={model}
							p={p}
							area={area.trackers ?? {}}
							health={props.health}
							finance={props.finance}
							onOpen={props.onOpen}
						/>
					)}
					<Links links={props.links} p={p} area={area.links ?? {}} onOpen={props.onOpen} />
				</>
			)}
		</div>
	);
}
import { useEffect, useLayoutEffect, useRef, useState, type RefObject } from "react";
import { DARK, LIGHT, type Palette } from "./styles";

export interface Size {
	w: number;
	h: number;
}

/** Size of the element, kept current by a ResizeObserver. Zero until the first measure. */
export function useSize(ref: RefObject<HTMLElement | null>): Size {
	const [size, setSize] = useState<Size>({ w: 0, h: 0 });
	useLayoutEffect(() => {
		const el = ref.current;
		if (!el) return;
		const measure = () => setSize({ w: el.clientWidth, h: el.clientHeight });
		measure();
		const ro = new ResizeObserver(measure);
		ro.observe(el);
		return () => ro.disconnect();
	}, [ref]);
	return size;
}

/** Follows Obsidian's light and dark theme through the class on body. */
export function usePalette(override?: "dark" | "light"): Palette {
	const read = () => (override ?? (document.body.classList.contains("theme-light") ? "light" : "dark"));
	const [mode, setMode] = useState<"dark" | "light">(read);
	useEffect(() => {
		if (override) {
			setMode(override);
			return;
		}
		const mo = new MutationObserver(() => setMode(read()));
		mo.observe(document.body, { attributes: true, attributeFilter: ["class"] });
		return () => mo.disconnect();
		// eslint-disable-next-line react-hooks/exhaustive-deps
	}, [override]);
	return mode === "light" ? LIGHT : DARK;
}

/** Fires `cb` when the value crosses up through `threshold`. Used for the ring pulse. */
export function useCrossed(value: number, thresholds: number[]): number | null {
	const prev = useRef(value);
	const [crossed, setCrossed] = useState<number | null>(null);
	useEffect(() => {
		const hit = thresholds.find((t) => prev.current < t && value >= t);
		prev.current = value;
		setCrossed(hit ?? null);
	}, [value, thresholds]);
	return crossed;
}
import { useEffect, useState, type CSSProperties, type ReactNode } from "react";
import { CATEGORY_LABEL } from "../core/config";
import type { CategoryView, Model, Row } from "../core/model";
import { Heatmap, Ring } from "./charts";
import {
	bigNumber,
	cardStyle,
	clamp,
	smallStyle,
	T,
	titleStyle,
	type Palette,
} from "./styles";

export interface LinkItem {
	label: string;
	path: string;
}

export function Card(props: {
	name: string;
	title: string;
	right?: ReactNode;
	p: Palette;
	area: CSSProperties;
	children: ReactNode;
}) {
	return (
		<section data-card={props.name} style={{ ...cardStyle(props.p), ...props.area }}>
			<div style={titleStyle(props.p)}>
				<span>{props.title}</span>
				{props.right !== undefined && <span style={{ color: T.muted }}>{props.right}</span>}
			</div>
			<div style={{ flex: "1 1 auto", minHeight: 0, minWidth: 0, display: "flex", flexDirection: "column", gap: "0.4em" }}>
				{props.children}
			</div>
		</section>
	);
}

const muted: CSSProperties = { color: T.muted };

function CheckRow({ row, checked, onTick, p }: { row: Row; checked: boolean; onTick: () => void; p: Palette }) {
	return (
		<button
			type="button"
			role="checkbox"
			aria-checked={checked}
			className="pl-row"
			onClick={onTick}
			title={row.text}
			style={{ display: "flex", alignItems: "flex-start", gap: "0.55em", width: "100%", textAlign: "left", minWidth: 0 }}
		>
			<span
				aria-hidden
				style={{
					flex: "none",
					width: "1.05em",
					height: "1.05em",
					marginTop: "0.12em",
					borderRadius: "0.28em",
					boxSizing: "border-box",
					border: `1.5px solid ${checked ? p.accent : T.muted}`,
					background: checked ? p.accent : "transparent",
					display: "grid",
					placeItems: "center",
					transition: "background 120ms ease, border-color 120ms ease",
				}}
			>
				{checked && (
					<svg viewBox="0 0 12 12" width="70%" height="70%">
						<path d="M2.5 6.4 5 8.9 9.5 3.4" fill="none" stroke={T.bg} strokeWidth={2} strokeLinecap="round" strokeLinejoin="round" />
					</svg>
				)}
			</span>
			<span style={{ ...clamp(3), minWidth: 0, color: checked ? T.muted : T.text }}>
				{row.label}
			</span>
		</button>
	);
}

export function Hero({ model, p, area }: { model: Model; p: Palette; area: CSSProperties }) {
	const s = model.streak;
	const next = s.next
		? `Next: ${s.next.target} in ${s.next.daysToGo} ${s.next.daysToGo === 1 ? "day" : "days"}`
		: "All milestones reached";
	return (
		<Card name="hero" title="Streak" p={p} area={area}>
			<div style={{ display: "flex", alignItems: "baseline", gap: "0.6em", flex: "none" }}>
				<span data-testid="current" style={bigNumber(p, 4.6)}>{s.current}</span>
				<span style={smallStyle}>day streak</span>
			</div>
			<div style={{ ...smallStyle, flex: "none", textTransform: "none", letterSpacing: 0, fontSize: "0.78em" }}>
				<span data-testid="best">Best {s.best}</span>
				<span style={{ margin: "0 0.5em" }}>·</span>
				<span>{next}</span>
			</div>
			{s.atRisk && (
				<div role="status" style={{ flex: "none", color: p.bad, fontWeight: 600, fontSize: "0.82em" }}>
					Streak breaks if today is not MET.
				</div>
			)}
			{s.firstDay === null && (
				<div style={{ ...muted, fontSize: "0.78em", flex: "none" }}>
					No counted days yet. The streak starts at the first daily note with category actions.
				</div>
			)}
			<div style={{ flex: "1 1 0", minHeight: 0, display: "flex", justifyContent: "center", alignItems: "center" }}>
				<Ring done={s.todayDone} p={p} />
			</div>
		</Card>
	);
}

function CategoryColumn({
	cat,
	p,
	isDone,
	onTick,
}: {
	cat: CategoryView;
	p: Palette;
	isDone: (r: Row) => boolean;
	onTick: (r: Row) => void;
}) {
	const ticked = cat.rows.filter(isDone).length;
	const complete = cat.rows.length > 0 && ticked === cat.rows.length;
	return (
		<div
			data-category={cat.category}
			style={{
				minWidth: 0,
				minHeight: 0,
				overflow: "hidden",
				display: "flex",
				flexDirection: "column",
				gap: "0.35em",
				padding: "0.6em 0.65em",
				borderRadius: "0.55em",
				border: `1px solid ${complete ? p.ok : T.borderSoft}`,
				background: complete ? `color-mix(in srgb, ${p.ok} 9%, transparent)` : "transparent",
			}}
		>
			<div style={{ display: "flex", justifyContent: "space-between", fontSize: "0.78em", fontWeight: 600, flex: "none" }}>
				<span>{CATEGORY_LABEL[cat.category]}</span>
				<span style={{ color: complete ? p.ok : T.muted }}>
					{ticked}/{cat.rows.length}
				</span>
			</div>
			{cat.rows.length === 0 ? (
				<span style={{ ...muted, fontSize: "0.78em" }}>No actions</span>
			) : (
				cat.rows.map((r) => (
					<div key={r.line} style={{ fontSize: "0.82em", minHeight: 0 }}>
						<CheckRow row={r} checked={isDone(r)} onTick={() => onTick(r)} p={p} />
					</div>
				))
			)}
		</div>
	);
}

/** Tickable list. A tick shows at once; the model redraw from disk then confirms or reverts it. */
export function Today({
	model,
	p,
	area,
	onToggle,
}: {
	model: Model;
	p: Palette;
	area: CSSProperties;
	onToggle: (row: Row, checked: boolean) => void;
}) {
	const [pending, setPending] = useState<Map<number, boolean>>(new Map());
	useEffect(() => setPending(new Map()), [model]);
	const isDone = (r: Row) => pending.get(r.line) ?? r.done;
	const tick = (r: Row) => {
		const next = !isDone(r);
		setPending((m) => new Map(m).set(r.line, next));
		onToggle(r, next);
	};
	const total = model.streak.todayDone;
	return (
		<Card name="today" title="Today" right={`${total} of 5 done`} p={p} area={area}>
			{!model.hasTodayNote ? (
				<span style={muted}>{`Today's note is missing (${model.today}). The evening close creates it.`}</span>
			) : (
				<div style={{ flex: 1, minHeight: 0, display: "grid", gridTemplateColumns: "repeat(5, minmax(0, 1fr))", gap: "0.6em" }}>
					{model.categories.map((c) => (
						<CategoryColumn key={c.category} cat={c} p={p} isDone={isDone} onTick={tick} />
					))}
				</div>
			)}
		</Card>
	);
}

export function HeatCard({ model, p, area, onOpenDay }: { model: Model; p: Palette; area: CSSProperties; onOpenDay: (d: string) => void }) {
	return (
		<Card name="heat" title="Last 30 days" p={p} area={area}>
			<div style={{ flex: 1, minHeight: 0 }}>
				<Heatmap days={model.streak.days} p={p} onOpen={onOpenDay} />
			</div>
			<span style={{ ...smallStyle, flex: "none", textTransform: "none", letterSpacing: 0 }}>
				Darker is more categories done. Dashed outline is a forgiven miss.
			</span>
		</Card>
	);
}

export function Career({ model, p, area }: { model: Model; p: Palette; area: CSSProperties }) {
	const career = model.categories.find((c) => c.category === "career");
	const done = career?.done ?? false;
	return (
		<Card name="career" title="Career line" right={career && career.rows.length > 0 ? (done ? "done" : "open") : undefined} p={p} area={area}>
			<div style={{ ...clamp(4), color: model.careerLine ? T.text : T.muted, fontSize: "0.95em" }}>
				{model.careerLine || "Not set. Use the QuickAdd choice Set tomorrow's career line."}
			</div>
		</Card>
	);
}

export function Study({ model, p, area }: { model: Model; p: Palette; area: CSSProperties }) {
	return (
		<Card name="study" title="Study line" p={p} area={area}>
			<div style={{ display: "flex", alignItems: "baseline", gap: "0.5em", flex: "none" }}>
				<span data-testid="hours" style={bigNumber(p, 2.6)}>{model.studyHours}</span>
				<span style={smallStyle}>hours</span>
			</div>
			<div style={{ ...clamp(3), color: model.studyTopic ? T.text : T.muted, fontSize: "0.9em" }}>
				{model.studyTopic || "No study topic set."}
			</div>
		</Card>
	);
}

export function NextActions({ model, p, area }: { model: Model; p: Palette; area: CSSProperties }) {
	return (
		<Card name="next" title="Next actions" right={model.nextFrom ? `from ${model.nextFrom}` : undefined} p={p} area={area}>
			{model.nextActions.length === 0 ? (
				<span style={muted}>None written yet.</span>
			) : (
				model.nextActions.map((a, i) => (
					<div key={i} style={{ display: "flex", gap: "0.5em", alignItems: "flex-start", minWidth: 0, fontSize: "0.85em" }}>
						<span title={a.text} style={{ ...clamp(1), flex: 1, minWidth: 0 }}>{a.text}</span>
						{a.type && (
							<span
								style={{
									flex: "none",
									padding: "0 0.5em",
									borderRadius: "1em",
									fontSize: "0.78em",
									color: p.accent,
									border: `1px solid color-mix(in srgb, ${p.accent} 50%, transparent)`,
								}}
							>
								{a.type}
							</span>
						)}
					</div>
				))
			)}
		</Card>
	);
}

export function Trackers({
	model,
	p,
	area,
	health,
	finance,
	onOpen,
}: {
	model: Model;
	p: Palette;
	area: CSSProperties;
	health: LinkItem | null;
	finance: LinkItem | null;
	onOpen: (path: string) => void;
}) {
	const line = (item: LinkItem | null, value: string | null) =>
		item && (
			<div style={{ display: "flex", gap: "0.8em", minWidth: 0, fontSize: "0.85em", alignItems: "baseline" }}>
				<button type="button" className="pl-link" onClick={() => onOpen(item.path)} style={{ flex: "none", color: p.accent }}>
					{item.label}
				</button>
				<span style={{ ...clamp(1), color: value ? T.text : T.muted, minWidth: 0 }}>{value ?? "No entries logged yet."}</span>
			</div>
		);
	return (
		<Card name="trackers" title="Trackers" p={p} area={area}>
			{line(health, model.health)}
			{line(finance, model.finance)}
		</Card>
	);
}

export function Links({ links, p, area, onOpen }: { links: LinkItem[]; p: Palette; area: CSSProperties; onOpen: (path: string) => void }) {
	return (
		<Card name="links" title="Links" p={p} area={area}>
			<div style={{ display: "flex", flexWrap: "wrap", gap: "0.4em 0.5em", alignContent: "flex-start", overflow: "hidden" }}>
				{links.map((l) => (
					<button key={l.path} type="button" className="pl-chip" onClick={() => onOpen(l.path)} style={{ color: T.text }}>
						{l.label}
					</button>
				))}
			</div>
		</Card>
	);
}
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Dashboard Build\Plugin Build Prompts.md`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Dashboard Build/Verification and Risks.md" "Dashboard Build/Review - Corrections to Earlier Notes.md" "Audit - Dashboard Stack and Phone Checklist.md"
```
```
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - risks
  - verification
notes:
  - "[[Dashboard Build Hub]]"
  - "[[Research - Obsidian Dashboard Methods]]"
  - "[[Build Steps]]"
  - "[[Architecture]]"
next: "Resolve the S0 tests first"
---
# Verification and Risks

Every unverified claim from [[Research - Obsidian Dashboard Methods]], with the exact test that settles it.

## Unverified, and how to settle each

| # | Claim | Test | If it fails |
|---|---|---|---|
| 1 | Homepage can open a custom file extension (`.plan`). Homepage's source accepts any registered extension (read 2026-10-13), but Sync carries non-note types only if "Sync all other types" is on. | [[Plugin Build Prompts]] Prompt 1: try the command route first, the file route second | Use whichever route passes on both devices |
| 2 | Homepage runs the command late enough for the view type to exist | S0: restart five times, check the view opens every time | Plugin opens its own view in `onLayoutReady` as a backup; the command is idempotent |
| 3 | Obsidian Sync carries `.obsidian/plugins/the-plan-dashboard/` to the phone | Settings, Sync, "Installed community plugins" on; build a marker string; read it on the phone | Copy the three files to the phone by hand once per release, or use BRAT from a private repo |
| 4 | Lazy Plugin Loader delays the new plugin | Set it to `instant` in its settings; check cold start timing | Remove the plugin from the loader's list |
| 5 | Homepage mobile profile is separate and works | Turn on `separateMobile`, set the same command, cold start the phone | Open the dashboard from a ribbon icon as a fallback |
| 6 | `vault.process` ticks write back and sync without a conflict | Tick on phone, check desktop within a minute; tick on both within seconds | The line-check refuses the stale write; treat as correct behaviour |
| 7 | Plugin enabled states (12 listed, 31 installed) | Open Settings, Community plugins | Enable Homepage and QuickAdd if the dashboard needs them |
| 8 | Obsidian version supports Homepage 4.5.0 | Its manifest says 1.13.0 minimum; compare with Settings, About on both devices | Update Obsidian on the older device |
| 9 | Datacore, Bases and Dataview checkbox behaviours | Not needed for this design | None |

Developer policies could not be read. If Anant ever publishes the plugin, read that page then.

## Risks

| Risk | Likelihood | Effect | Control |
|---|---|---|---|
| Plugin breaks on an Obsidian update | Low to medium | Home blank | The old markdown `00_Dashboard.md` was retired on 2026-10-14 at Anant's request, before S6 passed (Decision 47). The fallback is `plan-cli streak` and `plan-cli day`, which read the same notes, and the daily notes stay plain Markdown |
| Stale tick after a sync ticks the wrong row | Low | Wrong data | Line text check before every write |
| Streak disagrees between screen and Claude hooks | Eliminated | | One engine |
| Daily note renamed late | Medium | Streak empty | S1 depends on B1; the engine reads only `YYYY-MM-DD` names and reports unparsed names in a debug command |
| Phone slow on cold start | Medium | Slow Home | Performance budget in [[Architecture]]; load Hero first, rest after |
| Build tooling rot | Low | Cannot rebuild | Four dependencies only: `obsidian`, `esbuild`, `typescript`, `@types/node`. Lockfile committed. |
| Scope creep into automation | Medium | Delay | Stop rule in [[Build Steps]] |
| Secrets exposure | Low | | The plugin reads only the daily folder. Nothing reads `data.json` of other plugins. `40_Resources/CS/Links.md` Keys section still needs rotation. |

## Acceptance for the whole dashboard

1. Cold launch on desktop and phone shows the dashboard with no manual step.
2. Ticking on either device updates the ring, the streak and the heatmap within one second.
3. Screen numbers equal the CLI output for the last 30 days.
4. The daily note stays valid markdown that reads well without the plugin.
5. Disabling the plugin loses the view, not the data.
---
type: input
status: sprout
created: 2026-10-13
tags:
  - dashboard
  - review
notes:
  - "[[Dashboard Build Hub]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Spec - Home and Monthly Dashboards]]"
  - "[[Prompts]]"
  - "[[Build Plan]]"
  - "[[Decisions Log]]"
  - "[[Architecture]]"
next: "Apply the corrections marked Patch in the prompts' preamble; edit the older specs only when Anant approves"
---
# Review: Corrections to Earlier Notes

A read-through of every note in `40_Resources/Obsidian/Dashboards` on 2026-10-13. These are the places where an earlier note is now wrong or in conflict. The plugin prompts carry these corrections in their own text, so no prompt depends on an older note being fixed first.

## Conflicts and what wins

| # | Earlier statement | Where | Now | Action |
|---|---|---|---|---|
| 1 | Home is DataviewJS with inline SVG on `00_Dashboard.md` | [[Spec - Home and Monthly Dashboards]], B3 in [[Prompts]] | Home is a plugin view. See [[Dashboard Build Hub]] | Patch B3 pointer; B3 is not run |
| 2 | Streak script is Python in `30_Order/System/streak`; DataviewJS must match it | [[Spec - Streak and Daily Note]], B2 in [[Prompts]] | One TypeScript engine shared by the plugin and the hooks | B2 shrinks to template and QuickAdd steps only |
| 3 | Ring colours proposed grey, gold, green | [[Spec - Streak and Daily Note]] | Red, golden orange, green (answered 2026-10-12) | Patch the spec line when Anant approves |
| 4 | Plugin set lists Dataview as core for Home and Multi-Column as dropped | [[Spec - Home and Monthly Dashboards]] | Home no longer needs Dataview or Meta Bind; Meta Bind and Dataview stay for other notes | None |
| 5 | Dataview refresh 2500 ms risk | [[Spec - Home and Monthly Dashboards]] | Not relevant to the plugin view | None |
| 6 | Hooks to deny every write under `.obsidian` | B5 in [[Prompts]] | The build deploys three files into `.obsidian/plugins/the-plan-dashboard/` | The write guard must allow that one folder, or the deploy step runs outside Claude Code |
| 7 | Daily-note validator and `/closeday` call a Python script | B4 and B5 in [[Prompts]] | They call `node streak-cli.cjs` | Update B4 and B5 wording when they run |
| 8 | `.claude/` is carried by git | [[Research - Jarvis Dashboard Findings]] | `.gitignore` ignores everything except directories and `.md`, plus listed exceptions. `.claude/settings.json`, hook scripts and the engine bundle are not tracked unless whitelisted | Whitelist them in `.gitignore` during B5, with Anant's approval |
| 9 | The Standing instructions say edits under `.obsidian` need a yes | [[Prompts]] | Still true | Each plugin prompt names its exact write paths and asks once |
| 10 | Map is a separate canvas and a Home section | [[Spec - Home and Monthly Dashboards]], [[Front End and Visual System]] | The Explore section of the plugin is the primary map. A canvas version is optional later | Keep canvas out of the five prompts |
| 11 | `first_template_day` is where the streak starts | [[Spec - Streak and Daily Note]] | The engine takes it as the earliest note that has at least one category action | Written into the engine prompt |
| 12 | Homepage target is `00_Dashboard` | `.obsidian/plugins/homepage/data.json` | Becomes `Dashboard.plan` (or the command) | Set in the last prompt, with approval |
| 13 | "Three dependencies only" | [[Verification and Risks]] | Four: `obsidian`, `esbuild`, `typescript`, `@types/node`. ESLint is optional | Patched here |

## Items still open

1. Exact action lines (times, locations, identity phrases) for each habit.
2. Milestone level titles. The prompts use numbers only until titles are chosen.
3. Whether the 80/20 lines become the Targets section.
4. Keys section in `40_Resources/CS/Links.md` still needs rotation. Not touched by any prompt.
5. The Developer policies and Submission requirements pages are unread.

## What did not change

The streak rule, five categories, floor of 3, one forgiven miss, milestones 3, 7, 21, 66, 100, the daily note schema, ISO filenames, the lists-with-category-field tick method, the colour tokens and layout in [[Front End and Visual System]], and the rule that the daily note is the only source of truth.
---
type: project
status: seed
created: 2026-10-14
tags:
  - dashboard
  - audit
  - phone
notes:
  - "[[Dashboards Hub]]"
  - "[[Spec - Home and Monthly Dashboards]]"
  - "[[Research - Platform Facts]]"
  - "[[Front End and Visual System]]"
  - "[[Verification and Risks]]"
next: "Anant runs the phone checklist, then decides the five recommendations"
---
# Audit: Dashboard Stack and Phone Checklist

Date: 2026-10-14. Desktop only. No plugin setting was changed. Nothing here was tested on the phone.

## How this was checked

- `.obsidian/community-plugins.json`, `.obsidian/core-plugins.json` and the six `manifest.json` files.
- `.obsidian/plugins/lazy-plugins/data.json` (loader settings), `.obsidian/plugins/homepage/data.json` (startup target) and `.obsidian/plugins/dataview/data.json` (settings). None holds a secret. No other plugin data file was opened.
- A live `command_list` call to the running desktop app, which lists commands only for plugins that are loaded.
- `30_Order/System/git-sync/plan-git-sync.ps1`, its log tail, and `.gitignore`.
- I did not consult external documentation in this pass. Platform claims come from [[Research - Platform Facts]], read 2026-10-13.

## 1. Which plugins are enabled

`community-plugins.json` is not the enabled list. Lazy Plugin Loader removes "short" and "long" plugins from it and enables them after a delay ([[Research - Platform Facts]] section 0). The running app is the proof.

| Plugin | Version | In `community-plugins.json` | Loader setting (desktop) | Loaded in running app |
|---|---|---|---|---|
| Dataview | 0.5.68 | yes | instant | yes (3 commands) |
| Templater | 2.26.0 | yes | instant | yes (4 commands) |
| Homepage | 4.5.0 | yes | instant | yes (3 commands) |
| Periodic Notes | 0.0.17 | no | short | yes (12 commands) |
| QuickAdd | 2.32.1 | no | short | yes (7 commands) |
| Meta Bind | 1.5.1 | no | short | yes (5 commands) |
| The Plan dashboard | 0.1.0 | yes | instant | yes (Open dashboard) |

All six requested plugins are enabled on desktop. Homepage is now `instant`, which fixes the cold-start risk that [[Research - Platform Facts]] section 1.1 flagged. Homepage is set to kind Nothing, opens on startup, and runs `the-plan-dashboard:open-dashboard` on both desktop and phone (`separateMobile` is false, so the phone uses the same profile).

The loader file has only a `desktop` block. Per [[Research - Platform Facts]] section 1.1, the phone copies it in memory, but only if Sync carries the plugin files and both community-plugin Sync toggles are on. The phone state is unknown.

## 2. Recommendations

These are suggestions. Each needs Anant's yes before any setting changes.

| Plugin | Recommendation | Reason |
|---|---|---|
| Dataview | Keep enabled. | `Monthly Dashboard` is one `dataviewjs` block, and `enableDataviewJs` is true. Home no longer depends on it. |
| Homepage | Keep enabled, `instant`. | It is the only route that opens Home on startup. Current settings are correct. |
| Templater | Keep enabled, `instant`. | The daily note template lives in `30_Order/Templates/Daily Dashboard/`. Do not set a folder template on `Daily/` if QuickAdd creates the note ([[Research - Platform Facts]] section 2.2). |
| QuickAdd | Keep enabled for now. | It is the only documented route to create tomorrow's note with `{{DATE:YYYY-MM-DD+1}}`. I could not confirm that any choice exists, because its `data.json` is off limits. Disable it if no choice is configured. |
| Periodic Notes | Disable, after one check. | It cannot create tomorrow's note and has had no release since 2022. Core Daily notes is off, so no daily-note folder depends on it. Check first that the Calendar plugin (`calendar:open-weekly-note` is loaded) does not rely on its weekly settings. |
| Meta Bind | Disable until a note uses it. | A vault search finds no `INPUT[` or `meta-bind` block in any note outside the research notes, and the daily template has `study_hours: 0` as plain frontmatter. The Home view shows career line and hours read-only ([[Front End and Visual System]]). It costs a load on the phone for no visible feature. |

Conflict to note: [[Spec - Home and Monthly Dashboards]] lists Meta Bind as "Core" and Decision 15 in [[Decisions Log]] says Meta Bind is for hours and text. The built Home design makes both read-only, and no input exists. The newer design (Home as a plugin view) wins here.

## 3. Dataview refresh setting

From `.obsidian/plugins/dataview/data.json`: `refreshEnabled` is true and `refreshInterval` is 2500 ms. It re-renders every open Dataview block each 2.5 seconds after a change. Home does not use Dataview, so this only affects the Monthly page and any other open Dataview note. On a phone, a longer interval (for example 10000 ms) would save battery. No change was made.

## 4. Do git and Obsidian Sync write the same files?

No. Evidence from `plan-git-sync.ps1`:

- Git materializes remote content only for git-owned paths: any path that starts with `.` and the folder `30_Order/System/git-sync/` (`Test-GitOwnedPath`, `Sync-GitOwnedPaths`).
- For every other path, git never touches the working tree. It moves the branch with `update-ref` and a mixed `reset -q` (index only), then runs `git add -A`, commit and push. There is no pull, rebase or merge.
- Obsidian Sync carries notes and `.obsidian`. It excludes other dot-folders. `.obsidian/` is ignored by `.gitignore`. The two sets of paths do not overlap.
- The log tail shows normal runs: committed and pushed at 15:08 today.

Findings and limits:

1. **The engine is probably on one laptop only.** `30_Order/System/plan-cli/plan-cli.cjs` is allowed by `.gitignore` and committed, but the script does not treat it as git-owned (not a dot path, not in the git-sync folder), and Obsidian Sync skips `.cjs` unless "Sync all other types" is on (partly confirmed in [[Research - Platform Facts]] section 1.3). The other laptop may never receive it. The Claude Code hooks call it. Unverified: I did not inspect the second laptop.
2. **Obsidian Git is loaded.** Its commands are registered in the running app. If its auto pull or push is on, it is a third git writer. The script's header says its base file handles a manual Pull in reset mode. Whether auto routines are on is unverified, because I did not open that plugin's data file.
3. **Uncommitted files at session start:** `.gitignore`, `Dashboards Hub.md` and `00_Live/Map Canvas.canvas`. Git does not rewrite them, so Sync stays the only writer. They will be committed on the next run.

## 5. Phone checklist (about five minutes)

Before you start, on desktop: confirm a note exists for today. The newest daily note in `00_Live/Enumerate/Daily/` is `2026-10-12`, so today's note may not exist and the ring would show nothing. On the phone: open Settings, Sync, and confirm both community-plugin toggles are on, then force-quit Obsidian once after the first sync.

1. **Home opens on startup.** Force-quit Obsidian and reopen it. The dashboard should appear without any tap. Pass: dashboard visible within about 10 seconds. If the screen is blank or shows an error, run "Homepage: Copy debug info" and keep the text. Known issue: Homepage #150 crashed on mobile startup in 4.4.4.
2. **Ring and streak render.** Pass: the streak number and today's ring ("x of 5") are the first things on screen, and the streak equals the desktop value.
3. **A tick writes back to the note.** Tap one action on the dashboard. Open today's daily note and look at that line. Pass: only the character inside `[ ]` changed. Untick it to restore.
4. **A tick reaches desktop.** Tick one action on the phone, then watch the desktop dashboard for up to one minute. Pass: the ring updates. This settles whether the `modify` event fires for Sync-written changes.
5. **Career line.** Pass: today's career line shows on the dashboard. Tap it. The daily note should open at that line.
6. **Study hours.** Pass: the hours value shows on the dashboard. Tap it, then edit `study_hours` in the note's Properties panel (the template stores it as a plain number). Return to the dashboard. Pass: the value updated. Note: no Meta Bind input exists, so Properties is the only edit route.
7. **Monthly renders.** Open `Monthly Dashboard` in reading view. Pass: the heatmap, grade and cause counts appear, and no red Dataview error shows. Flag any block that stays empty.
8. **Canvas opens.** Open `Map Canvas`. Pass: nodes and edges draw, and pinch zoom works. Tap one note node to confirm it opens.
9. **Record the result.** Write pass or fail for each number in chat. For any failure, say what was on screen.

Not covered, by choice: QuickAdd choices, Templater note creation, and a locked-phone Shortcut. These are listed in [[Research - Platform Facts]] under decision 15.

## Extras worth doing later

- Decide on engine delivery to the second laptop (finding 1), for example by enabling "Sync all other types" or by adding `30_Order/System/plan-cli/` to the git-owned paths in the script.
- Check Obsidian Git's auto routines are off.
- Apply the five recommendations in one approved settings step.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Spec - AI Loop.md" "Spec - Home and Monthly Dashboards.md" "Spec - Automation Layers.md" | sed -n '1,400p'
```
```
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - ai-loop
  - skills
  - agents
  - hooks
notes:
  - "[[Dashboards Hub]]"
  - "[[Decisions Log]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Jarvis Operating Rules]]"
  - "[[Jarvis Control Center]]"
  - "[[Jarvis Architectural Decision Register]]"
  - "[[AGENTS]]"
  - "[[Agentic OS Standard]]"
next: "Run the five skills live (see Update 2026-10-13). The hooks are registered and tested."
---
# Spec: AI Loop

The daily workflow has five skills, four agents, three hooks and a small toolkit. Every piece links to a reference note holding its source. Official specs for skills, subagents and hooks are checked in prompt R1 before anything is written. Nothing below claims a capability that is built.

## Update 2026-10-13: what changed since this spec

- The five skills exist as directories and were dry-run. They now call the Node engine `plan-cli` and not `streak.py` (Decision 36). The flat Jarvis skill files have been removed.
- All four agents exist as single read-only files, as [[Research - Platform Facts]] found for the agent form. `career-operator` and `research-distiller` were removed (Decision 45).
- The three hooks exist as one program, `plan-cli hook`, and are registered in `.claude/settings.json` (Decision 44). This replaces the "scripts in `30_Order/System/hooks`" wording in the early prompts (Decision 50).
- The streak script is the reference and the test oracle. The toolkit has a reference note per part in `30_Order/Standards/References/`.
- Open points resolved: hooks run as Node, not PowerShell, because the engine already needs Node. The Jarvis snapshot is written in Jarvis and brought across by `jarvis-dump` (Decision 42). The exact frontmatter, name limits and hook JSON come from the official pages, recorded in [[Skill Standard]], [[Agent Standard]] and [[Hook Standard]].
- Grade, review cadence and Jarvis review rules are decided in [[Decisions Log]], decisions 36 to 45.
- Where the rules are now: [[Agentic OS Standard]].

## Rule files

| File | Role |
|---|---|
| `AGENTS.md` | The single rule set for every tool (Claude Code, Codex, others) |
| `CLAUDE.md` | Thin pointer to AGENTS.md plus Claude-only specifics: skills, hooks, tool behaviour. Currently stale (points at `60_Claude/` and `00_Inbox/`, which do not exist). |
| `30_Order/Standards/` | Rigid content: note types, daily note schema, streak rule, naming, frontmatter, the tool reference notes |
| `60_Jarvis/` | Two zones, below |

## `60_Jarvis`: two zones, no renames

| Zone | Folders | Job |
|---|---|---|
| Governance and staging | `00_Control_Center`, `10_Promoted_Notes`, `20_Decisions`, `40_Archive`, `50_Reviews` | What Jarvis changed, what is trusted, what needs review. The promotion pipeline lands here. |
| AI knowledge | `01_Prompt_Library`, `30_AI_Information` | How any AI should work in this vault: rules, prompts, session logs, vault map |

A one-page README at the top of `60_Jarvis` states the split. Folder names stay as they are. AGENTS.md allows renames only by an authorized step, and no rename is needed. AI output stays untrusted until reviewed, per [[Jarvis Operating Rules]].

## Five skills (each a directory)

Layout pattern, taken from Jarvis's `startday` skill: `.claude/skills/<name>/SKILL.md` (steps) plus `reference.md` (formats, templates, edge cases). Exact frontmatter fields and size limits come from the official spec confirmed in R1.

| Skill | Job | Reads | Writes |
|---|---|---|---|
| `startday` | Show today's targets and streak status. Flag a missing career line or study topic. Pull the day's intake once automation exists. | Yesterday's and today's daily notes, the streak script | The day's plan in today's note only |
| `closeday` | Score the five categories. Ask a cause for each miss. Write up to 5 next actions with no repeats. Create tomorrow's note with the career line and study topic. | Today's note, the streak script | Today's evening close and next actions, tomorrow's note |
| `weekly-review` | Weekly grade, cause counts, one keep, one stop, one start, one decision | The week's daily notes | A Review Log section in the Weekly note |
| `monthly-review` | Monthly grade, trend, failure causes, request for the Jarvis snapshot | The month's daily notes, the snapshot note | A Review Log section in the Monthly note |
| `jarvis-dump` | Copy chosen information from the Jarvis vault into `60_Jarvis`. Writes nowhere else. | Jarvis paths, read-only | Copies in `60_Jarvis/10_Promoted_Notes/` |

Retire the flat copies in `.claude/skills/` that came from Jarvis: `closeday.md`, `connect-notes.md`, `context.md`, `distill-note.md`, `ingest-clipping.md`, `lint-claude-layer.md`, `organize-csci2033.md`, `today.md`, `trace-topic.md`, `weekly-review.md`. Keep the third-party skill folders (copilot-*, json-canvas, obsidian-*, openartifacts-publish).

### `jarvis-dump` contract

- Copy, never move. Jarvis is not modified.
- Needs read access to the Jarvis path and write access to one folder.
- Each copied note gets frontmatter: `source_path`, `dumped`, `status: unreviewed`.
- One approval per batch listing the notes to be copied. No silent bulk copies.
- No clipping, transcript or inbox pipeline, per AGENTS.md.

## Four agents

| Agent | Form | Job |
|---|---|---|
| `daily-auditor` | single file | Checks a daily note against the standard. Reports; does not rewrite. |
| `review-analyst` | single file | Reads a week or month and reports patterns in plain terms, such as the cause tag that costs the most days |
| `skeptic` | single file | Challenges a plan or decision directly, with no default agreement |
| `vault-curator` | folder (rules plus checklists) | Keeps links, structure and naming intact against the standards |

Cut: `career-operator` (Jarvis owns career work) and `research-distiller` (The Plan has no ingestion pipeline).

## Three hooks

| Hook | Event | Decision |
|---|---|---|
| Write guard | before Write or Edit | Deny new files at the vault root and any write to `50_Archive` or `.obsidian` |
| Secrets guard | before Read, Bash, Write | Deny reading or printing `.env*`, keys, tokens, credentials. Fail closed on parse errors. |
| Daily-note validator | after a write to a daily note | Check the validator rules in [[Spec - Streak and Daily Note]]; report failures |

Jarvis hooks run as PowerShell scripts registered in `.claude/settings.json` with `$CLAUDE_PROJECT_DIR` paths, and its write guard fails open on parse errors. The Plan's secrets guard should fail closed. Event names, matcher syntax, input JSON, the deny signal and exit-code behaviour are taken from Anthropic's hooks reference as confirmed in R1.

## Toolkit

| Piece | Why it exists |
|---|---|
| Streak script | The LLM does not compute streaks. One script reads daily notes and returns current streak, best streak, today's categories and at-risk status. Skills call it. A test compares it with the Home DataviewJS. |
| Templater daily template | Creates the ISO-named note with the five category sections |
| QuickAdd choices | One-tap "set tomorrow's career line" and "log a miss" on phone |
| Obsidian CLI | Link-aware moves for the ISO rename and checks that need the running app |
| Reference notes | One per tool, see below |
| Sync check | Git auto-sync, Obsidian Sync and any Syncthing must not write the same files. Verify before the phone workflow depends on it. |

## Reference notes

One note per skill, agent, hook and script in `30_Order/Standards/References/`. Each links to its tool and holds: official source URL, version or date checked, what the tool depends on, and how it was tested. Tools link back to their reference note. Obsidian wikilinks in both directions.

## Logging (four layers, no new folders)

| Layer | Where | Written by |
|---|---|---|
| Daily record | The daily note | `closeday` |
| Review log | Section in Weekly and Monthly notes | `weekly-review`, `monthly-review` |
| System changes | `60_Jarvis/20_Decisions/` register | Anant approves each entry |
| AI session record | `60_Jarvis/30_AI_Information/Session Logs/` | Only with Anant's approval, never silent |

Global rule: no log is written unless a command Anant ran or an approval he gave covers it.

## Open points

- Exact frontmatter, naming limits and hook JSON schema from the official docs (R1).
- Whether hooks run as PowerShell or Python.
- Where the Jarvis snapshot note is produced: by `jarvis-dump` on request or by Jarvis's own monthly step.
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - home
  - monthly
notes:
  - "[[Dashboards Hub]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Decisions Log]]"
  - "[[Health Tracker]]"
  - "[[Finance Tracker]]"
  - "[[Life OS]]"
next: "Build Home after the daily template and streak script exist (prompt B3)"
---
# Spec: Home and Monthly Dashboards

Two daily-use dashboards plus one exploration canvas. The Home page opens on startup on desktop and phone.

## Design rules

1. Opening the vault answers one question: what do I do now.
2. The first thing seen is the streak number and today's score ring.
3. Every number is computed from daily notes. Nothing typed on the dashboard.
4. Plain, blunt text. No praise, no guilt. A miss reads "Day 2 of miss. Streak breaks tomorrow." with numbers.
5. Single-column on phone. Two columns on desktop through a CSS grid snippet, not a plugin.
6. DataviewJS safety (carried from the Jarvis audit): render only numbers into `innerHTML`. Any string from a note goes through text content or is escaped.

## Home layout, top to bottom

| Block | Content | Source |
|---|---|---|
| Streak and ring | Current streak, best streak, today's ring (x of 5 categories), next milestone, at-risk banner | Streak logic in [[Spec - Streak and Daily Note]] |
| Today's ticks | The five categories and their actions, tickable | Today's daily note task list |
| Career line | The one named task with its checkbox | Today's daily note Targets |
| Study line | Topic and hours logged today | Daily note `study_hours` |
| Heatmap | Last 30 days, GitHub-style, shade equals categories done | Daily notes |
| Next actions | Up to 5 from last night | Daily note |
| Trackers | Latest health entry, latest finance month, links | [[Health Tracker]], [[Finance Tracker]] |
| Links | Monthly, Map canvas, [[Life OS]], rule files | Static |

Visual language is ported from the `gupta-builds` README card: JetBrains Mono, accent `#a78bfa`, large number over a small label, transparent surfaces. The card is drawn with inline SVG in DataviewJS, not generated by a script.

## Monthly layout

| Block | Content |
|---|---|
| Month heatmap and grade | Per-day squares, days passed, category completion rates, best streak this month, a letter grade |
| Failure causes | Counts per cause tag, largest cost first |
| Month plan and goals | The few outcomes this month exists to produce, with progress |
| Finance snapshot | Buckets, balances, card-paid check, from [[Finance Tracker]] |
| Health trend | Workout count and baseline lifts, from [[Health Tracker]] |
| System overview | Embed of the latest Jarvis snapshot note in `60_Jarvis`, plus The Plan's own status |
| Previous months | Links to frozen monthly recaps |

The Monthly page is an overview of both vaults as of today, read in months, not a daily page.

## Map canvas (third surface, not daily)

A canvas with real edges. Domain nodes (Morning, Study, Fitness, Mind, Career, Health, Finance, Learning, Systems) link to goals and to the notes that own them. Used for exploring, like a mind map. Edges are the point; Jarvis's canvas had none.

## Plugin set

| Plugin | Role | Verdict |
|---|---|---|
| Dataview | Queries, heatmap, streak display, inline SVG | Core. Installed. |
| Meta Bind (1.5.1) | `study_hours` input, tomorrow's-target text input | Core. Installed. |
| Homepage | Opens Home on startup | Core. Installed. |
| Periodic Notes and Templater | ISO daily notes from a template | Core. Installed. |
| QuickAdd | One-tap "set tomorrow's career line" and "log a miss" on phone | Keep. Installed. |
| Style Settings, `dashboard.css` snippet, AnuPpuccin | Visual layer | Core. Installed. |
| Canvas (built in) and ExcaliBrain | Map surface | Keep. |
| Tasks | Due dates, recurrence | Optional |
| Multi-Column Markdown | Two-column layout | Drop; CSS grid replaces it |
| Kanban | Current Daily Habit Board | Retire after Home ships |

Verify first: `community-plugins.json` lists 12 plugins while 31 are installed. Confirm that Dataview, Meta Bind, Homepage, Templater, Periodic Notes and QuickAdd are enabled on desktop and on phone. Changing the homepage target means editing `.obsidian/plugins/homepage/data.json`; do it only in a step Anant approves, since the write guard blocks `.obsidian`.

## Risks

- Dataview task lists tick correctly in the rendered view; confirm they write back on phone before relying on Home for ticking.
- The Home page and the daily note must agree on the category tags. The validator hook is the guard.
- Dataview refresh is every 2500 ms in Jarvis. Check The Plan's setting to keep Home responsive on phone.
- Two renderings of the streak (script and DataviewJS) can drift. A test must compare them.
---
type: project
status: seed
created: 2026-10-12
tags:
  - dashboard
  - automation
notes:
  - "[[Dashboards Hub]]"
  - "[[Decisions Log]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Spec - AI Loop]]"
next: "Run prompt R1 section 3 to confirm the transport options before any automation is designed in detail"
---
# Spec: Automation Layers

Not part of the first build. This note lays out the basic layers so the daily note and skills reserve the right slots. Nothing here is built or verified yet.

## Goal

Plans and tasks from every source land in one place: The Plan. Today they are scattered across Apple Reminders, Todoist, Google Calendar and Obsidian itself, and the overlap is the mess.

## Hard constraints (verified)

- Obsidian Sync owns every note file. Git carries only dot-folders. A cloud automation cannot write a note into the vault: a file committed to GitHub never reaches the working tree (stated in `30_Order/System/git-sync/plan-git-sync.ps1`).
- Claude Code on the laptop writes files locally, and Obsidian Sync carries them to the phone.
- AGENTS.md: no inbox. The landing place is a section inside the daily note, not a folder.
- Obsidian Local REST API is local to the laptop and needs Obsidian open.
- The laptop runs Windows. Apple Reminders has no native Windows API. How the vault reaches it is unverified.

## Three layers

### Daily layer: vault to Reminders

- **Direction:** outbound. Everything from the daily workflow that needs a reminder lands in the Apple Reminders app on the phone.
- **Candidates:** the time-anchored actions (8 am move, 2 pm study block, 5:30 gym), the career line, the evening close prompt.
- **Trigger:** the evening close creates tomorrow's note; a step then pushes tomorrow's reminders.
- **Open:** transport. Options to research: an iOS Shortcut that reads the note, a Zapier action, a reminders bridge through Todoist. R1 section 3 compares them.
- **Slot reserved:** Intake section in the daily note.

### Weekly layer: sources to the weekly review

- **Direction:** inbound, pulled by a local Claude Code run, not pushed.
- **Sources:** Google Calendar (gupt0479@umn.edu), Todoist, and "something more" that sharpens the daily workflow. Candidate extras: the Fall'26 syllabus dates in `10_UMN`, the mentor meeting notes in `20_Progress/Mentorship Program`, open items from last week's Review Log.
- **Output:** a prefilled Week section in the Weekly note: deadlines, meetings, tasks due, carryover.
- **Open:** whether the calendar connector is attached to gupt0479@umn.edu. Check with a calendar listing in the research step.

### Monthly layer: the 1st of the month

- **Trigger:** every 1st. Runs the full close of the previous month.
- **Scope:** Todoist, this vault's planning, monitoring, changing and logging.
- **Outputs:**
  1. A recap of the month.
  2. Lock-in status and streak status.
  3. A frozen monthly recap note with static values, so history survives.
  4. The next month's plan skeleton.
  5. A request for the monthly Jarvis snapshot note.
- **Archive conflict (decision needed):** `50_Archive` is a strict dead-letter folder that AI never reads or writes, and streak queries need all daily notes. Moving the month's daily notes there would break the streak. Recommendation: the frozen monthly recap is the archive. Daily notes stay where they are. Optionally group them in `YYYY-MM` subfolders if Anant wants the Daily folder tidy.
- **Open:** how a monthly job runs unattended. A local scheduled task (like the git-sync task already on this laptop) can run Claude Code headless. A cloud routine cannot see the local vault.

## Prerequisites before this is built

1. ISO daily notes, the streak script, and the Intake slot.
2. The five skills working by hand.
3. Zapier authenticated, and a decision on which app holds reminders.
4. A permission rule for each connector: read-only by default, write only on approval, per Anant's outward-facing-action rule.

## Risks

- Two task systems (Todoist and Reminders) feeding one daily note will duplicate tasks. Decide a single owner per task type before connecting both.
- A scheduled job that edits notes needs a log entry and a dry-run mode.
- Calendar alarms for the habit times were suggested and not decided. Do not create calendar events without approval.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=long-iso .claude/agents .claude/skills .claude/skills/*/ ; echo; cat .claude/settings.json; echo; ls -la .claude/settings.local.json 2>&1; cat .gitignore
```
```
.claude/agents:
total 16
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 ..
-rw-r--r-- 1 anant 197609 3614 2026-10-16 21:08 career-operator.md
-rw-r--r-- 1 anant 197609 4629 2026-10-16 21:08 research-distiller.md
-rw-r--r-- 1 anant 197609 3465 2026-10-16 21:08 vault-curator.md

.claude/skills:
total 44
drwxr-xr-x 1 anant 197609    0 2026-10-22 22:47 .
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 ..
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 closeday
-rw-r--r-- 1 anant 197609 2469 2026-10-16 21:08 closeday.md
-rw-r--r-- 1 anant 197609 2977 2026-10-16 21:08 connect-notes.md
-rw-r--r-- 1 anant 197609 3489 2026-10-16 21:08 context.md
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 copilot-fetch-x
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 copilot-web-fetch
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 copilot-web-search
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 copilot-youtube-transcript
-rw-r--r-- 1 anant 197609 4644 2026-10-16 21:08 distill-note.md
-rw-r--r-- 1 anant 197609 3764 2026-10-16 21:08 ingest-clipping.md
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 jarvis-dump
lrwxrwxrwx 1 anant 197609   67 2026-10-22 22:47 json-canvas -> /d/_Anant/20_Progress/Documents/The Plan/copilot/skills/json-canvas
-rw-r--r-- 1 anant 197609 3254 2026-10-16 21:08 lint-claude-layer.md
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 monthly-review
lrwxrwxrwx 1 anant 197609   70 2026-10-22 22:47 obsidian-bases -> /d/_Anant/20_Progress/Documents/The Plan/copilot/skills/obsidian-bases
lrwxrwxrwx 1 anant 197609   68 2026-10-22 22:47 obsidian-cli -> /d/_Anant/20_Progress/Documents/The Plan/copilot/skills/obsidian-cli
lrwxrwxrwx 1 anant 197609   73 2026-10-22 22:47 obsidian-markdown -> /d/_Anant/20_Progress/Documents/The Plan/copilot/skills/obsidian-markdown
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 openartifacts-publish
-rw-r--r-- 1 anant 197609 5038 2026-10-16 21:08 organize-csci2033.md
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 startday
-rw-r--r-- 1 anant 197609 2751 2026-10-16 21:08 today.md
-rw-r--r-- 1 anant 197609 2528 2026-10-16 21:08 trace-topic.md
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 weekly-review
-rw-r--r-- 1 anant 197609 2956 2026-10-16 21:08 weekly-review.md

.claude/skills/closeday/:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609 0 2026-10-22 22:47 ..

.claude/skills/copilot-fetch-x/:
total 8
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609    0 2026-10-22 22:47 ..
-rw-r--r-- 1 anant 197609 1816 2026-10-16 21:08 SKILL.md

.claude/skills/copilot-web-fetch/:
total 8
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609    0 2026-10-22 22:47 ..
-rw-r--r-- 1 anant 197609 2516 2026-10-16 21:08 SKILL.md

.claude/skills/copilot-web-search/:
total 8
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609    0 2026-10-22 22:47 ..
-rw-r--r-- 1 anant 197609 2204 2026-10-16 21:08 SKILL.md

.claude/skills/copilot-youtube-transcript/:
total 8
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609    0 2026-10-22 22:47 ..
-rw-r--r-- 1 anant 197609 1844 2026-10-16 21:08 SKILL.md

.claude/skills/jarvis-dump/:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609 0 2026-10-22 22:47 ..

.claude/skills/json-canvas/:
total 12
drwxr-xr-x 1 anant 197609    0 2026-09-20 15:31 .
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:02 ..
-rw-r--r-- 1 anant 197609 1077 2026-08-24 13:04 LICENSE
-rw-r--r-- 1 anant 197609 3184 2026-09-18 14:22 SKILL.md
drwxr-xr-x 1 anant 197609    0 2026-09-15 21:22 references

.claude/skills/monthly-review/:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609 0 2026-10-22 22:47 ..

.claude/skills/obsidian-bases/:
total 12
drwxr-xr-x 1 anant 197609    0 2026-09-20 15:31 .
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:02 ..
-rw-r--r-- 1 anant 197609 1077 2026-08-24 13:04 LICENSE
-rw-r--r-- 1 anant 197609 3746 2026-09-18 14:22 SKILL.md
drwxr-xr-x 1 anant 197609    0 2026-09-15 21:22 references

.claude/skills/obsidian-cli/:
total 16
drwxr-xr-x 1 anant 197609    0 2026-09-20 15:31 .
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:02 ..
-rw-r--r-- 1 anant 197609 1077 2026-08-24 13:04 LICENSE
-rw-r--r-- 1 anant 197609 9971 2026-09-18 14:22 SKILL.md

.claude/skills/obsidian-markdown/:
total 12
drwxr-xr-x 1 anant 197609    0 2026-09-20 15:31 .
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:02 ..
-rw-r--r-- 1 anant 197609 1077 2026-08-24 13:04 LICENSE
-rw-r--r-- 1 anant 197609 2341 2026-09-18 14:22 SKILL.md
drwxr-xr-x 1 anant 197609    0 2026-09-15 21:22 references

.claude/skills/openartifacts-publish/:
total 12
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609    0 2026-10-22 22:47 ..
-rw-r--r-- 1 anant 197609 8082 2026-10-16 21:08 SKILL.md
drwxr-xr-x 1 anant 197609    0 2026-10-16 21:08 themes

.claude/skills/startday/:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609 0 2026-10-22 22:47 ..

.claude/skills/weekly-review/:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-16 21:08 .
drwxr-xr-x 1 anant 197609 0 2026-10-22 22:47 ..

{
  "enableAllProjectMcpServers": true,
  "enabledMcpjsonServers": ["obsidian"],
  "permissions": {
    "allow": [
      "mcp__obsidian__obsidian_read_note",
      "mcp__obsidian__obsidian_get_note",
      "mcp__obsidian__obsidian_search_notes",
      "mcp__obsidian__obsidian_write_note",
      "mcp__obsidian__obsidian_patch_note",
      "mcp__obsidian__obsidian_append_to_note",
      "mcp__obsidian__obsidian_manage_frontmatter",
      "mcp__obsidian__obsidian_manage_tags",
      "mcp__obsidian__obsidian_replace_in_note"
    ]
  }
}
ls: cannot access '.claude/settings.local.json': No such file or directory
# Markdown-first Obsidian vault
# Default: ignore everything, then allow directories and markdown notes.
*
!*/
!*.md

# Keep core git config files in repo.
!.gitignore
!.gitattributes

# The Plan git-sync scripts. Obsidian Sync does not carry these, git does.
!30_Order/System/git-sync/*.ps1
!30_Order/System/git-sync/*.vbs

# Never commit local/editor/system artifacts.
.trash/
.obsidian/
.obsidian/workspace.json
.obsidian/workspace-mobile.json
.obsidian/cache
.obsidian/graph.json
.obsidian/workspaces.json
.obsidian/plugins/*/*.bak
.obsidian/plugins/copilot/data.json
.obsidian/plugins/quickadd/data.json
.obsidian/plugins/obsidian-local-rest-api/data.json
.obsidian/copilot-index-*.json
.claude/settings.local.json
.mcp.json

# OS junk
.DS_Store
Thumbs.db
desktop.ini
$RECYCLE.BIN/
ehthumbs.db

# Temp/backup files
*.tmp
*.temp
*.bak
*.swp
*.swo
*~

# Secrets and local credentials
.env
.env.local
*.pem
*.key
credentials.json

# Python cache
__pycache__/
*.pyc
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --format='%h %ad %s' --date=iso -- .claude .gitignore | head -20; echo ---; git log --format='%h %ad %s' --date=iso --since=2026-10-13 --until=2026-10-17 | head -40; echo ---; git ls-files .claude | head -50; echo ---; ls -la --time-style=long-iso 30_Order/System 30_Order/System/plan-cli 30_Order/System/streak 2>&1
```
```
b26def3 2026-10-16 21:02:24 -0500 auto: 2026-10-16 21:02 | 97 files
0b995c5 2026-10-16 21:01:48 -0500 auto: 2026-10-16 21:01 | 133 files
e10bc90 2026-10-14 15:23:02 -0500 auto-sync: 2026-10-14 15:23 | 4 files
7c82dc8 2026-10-14 11:08:02 -0500 auto-sync: 2026-10-14 11:08 | 32 files
65c677a 2026-10-13 16:38:04 -0500 auto-sync: 2026-10-13 16:38 | 12 files
3366381 2026-10-13 16:23:04 -0500 auto-sync: 2026-10-13 16:23 | 40 files
c367dc8 2026-10-13 16:08:03 -0500 auto-sync: 2026-10-13 16:08 | 13 files
00a8729 2026-10-13 15:53:04 -0500 auto-sync: 2026-10-13 15:53 | 22 files
95409ca 2026-10-13 15:23:03 -0500 auto-sync: 2026-10-13 15:23 | 23 files
c973f1c 2026-10-13 15:08:04 -0500 auto-sync: 2026-10-13 15:08 | 15 files
1ca4f09 2026-10-12 20:08:04 -0500 auto-sync: 2026-10-12 20:08 | 14 files
de00659 2026-09-26 19:20:42 -0500 auto: 2026-09-26 19:20 | 4 files
647b878 2026-09-26 16:21:16 -0500 auto-sync: 2026-09-26 16:21 | 4 files
b5c8eb2 2026-09-18 16:21:33 -0500 auto: 2026-09-18 16:21 | 56 files
a7b9c31 2026-08-24 22:05:59 +0400 auto: 2026-08-24 22:05 | 64 files
855f0d6 2026-06-02 18:34:26 +0400 auto: 2026-06-02 18:34 | 6 files
7b9e720 2026-06-02 15:03:27 +0400 auto: 2026-06-02 15:03 | 17 files
83ea487 2026-04-14 01:50:44 -0500 Basic AI Second Brain Setup
5107c73 2026-04-13 16:32:58 -0500 Updating the git setup
2cef41f 2026-04-13 16:21:43 -0500 Initial vault markdown snapshot
---
b26def3 2026-10-16 21:02:24 -0500 auto: 2026-10-16 21:02 | 97 files
0b995c5 2026-10-16 21:01:48 -0500 auto: 2026-10-16 21:01 | 133 files
5951a2c 2026-10-15 20:23:04 -0500 auto-sync: 2026-10-15 20:23 | 1 files
d22106a 2026-10-15 20:08:03 -0500 auto-sync: 2026-10-15 20:08 | 1 files
a860a9d 2026-10-15 19:53:03 -0500 auto-sync: 2026-10-15 19:53 | 1 files
833c347 2026-10-15 16:23:04 -0500 auto-sync: 2026-10-15 16:23 | 1 files
176de70 2026-10-14 15:53:02 -0500 auto-sync: 2026-10-14 15:53 | 1 files
e10bc90 2026-10-14 15:23:02 -0500 auto-sync: 2026-10-14 15:23 | 4 files
faf07d8 2026-10-14 15:08:02 -0500 auto-sync: 2026-10-14 15:08 | 2 files
f566dd3 2026-10-14 14:53:02 -0500 auto-sync: 2026-10-14 14:53 | 4 files
7c82dc8 2026-10-14 11:08:02 -0500 auto-sync: 2026-10-14 11:08 | 32 files
---
.claude/agents/career-operator.md
.claude/agents/research-distiller.md
.claude/agents/vault-curator.md
.claude/settings.json
.claude/skills/closeday.md
.claude/skills/connect-notes.md
.claude/skills/context.md
.claude/skills/copilot-fetch-x/SKILL.md
.claude/skills/copilot-web-fetch/SKILL.md
.claude/skills/copilot-web-search/SKILL.md
.claude/skills/copilot-youtube-transcript/SKILL.md
.claude/skills/distill-note.md
.claude/skills/ingest-clipping.md
.claude/skills/json-canvas/SKILL.md
.claude/skills/json-canvas/references/EXAMPLES.md
.claude/skills/lint-claude-layer.md
.claude/skills/obsidian-bases/SKILL.md
.claude/skills/obsidian-bases/references/EXAMPLES.md
.claude/skills/obsidian-bases/references/FUNCTIONS_REFERENCE.md
.claude/skills/obsidian-cli/SKILL.md
.claude/skills/obsidian-markdown/SKILL.md
.claude/skills/obsidian-markdown/references/CALLOUTS.md
.claude/skills/obsidian-markdown/references/EMBEDS.md
.claude/skills/obsidian-markdown/references/PROPERTIES.md
.claude/skills/openartifacts-publish/SKILL.md
.claude/skills/openartifacts-publish/themes/research-memo.md
.claude/skills/organize-csci2033.md
.claude/skills/today.md
.claude/skills/trace-topic.md
.claude/skills/weekly-review.md
---
30_Order/System:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-13 16:03 .
drwxr-xr-x 1 anant 197609 0 2026-10-13 15:24 ..
drwxr-xr-x 1 anant 197609 0 2026-09-26 16:21 git-sync
drwxr-xr-x 1 anant 197609 0 2026-10-13 16:03 plan-cli
drwxr-xr-x 1 anant 197609 0 2026-10-14 10:59 streak

30_Order/System/plan-cli:
total 28
drwxr-xr-x 1 anant 197609     0 2026-10-13 16:03 .
drwxr-xr-x 1 anant 197609     0 2026-10-13 16:03 ..
-rw-r--r-- 1 anant 197609 46388 2026-10-14 10:55 plan-cli.cjs

30_Order/System/streak:
total 20
drwxr-xr-x 1 anant 197609    0 2026-10-14 10:59 .
drwxr-xr-x 1 anant 197609    0 2026-10-13 16:03 ..
-rw-r--r-- 1 anant 197609 5258 2026-10-13 15:47 QuickAdd Setup.md
drwxr-xr-x 1 anant 197609    0 2026-10-13 00:28 fixtures
-rwxr-xr-x 1 anant 197609 3698 2026-10-14 10:51 streak.py
-rw-r--r-- 1 anant 197609 9579 2026-10-14 10:51 test_streak.py
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && for c in 0b995c5 b26def3; do echo "== $c"; git show --stat --format='%an %ae %ad' $c | grep -E '^\S|\.claude|gitignore|AGENTS|CLAUDE|30_Order/System|Agentic|Standards' | head -60; done; echo; git show e10bc90 --stat | head; git show 7c82dc8:.claude/settings.json | head -50
```
```
== 0b995c5
Anant Gupta gupt0479@umn.edu Fri Oct 16 21:01:48 2026 -0500
 .claude/agents/career-operator.md                  |  172 +++
 .claude/agents/daily-auditor.md                    |   33 -
 .claude/agents/research-distiller.md               |  205 ++++
 .claude/agents/review-analyst.md                   |   32 -
 .claude/agents/skeptic.md                          |   30 -
 .claude/agents/vault-curator.md                    |  171 ++-
 .claude/settings.json                              |   54 +-
 .claude/skills/closeday.md                         |  128 +++
 .claude/skills/closeday/SKILL.md                   |   48 -
 .claude/skills/closeday/reference.md               |   70 --
 .claude/skills/connect-notes.md                    |  129 +++
 .claude/skills/context.md                          |  151 +++
 .claude/skills/distill-note.md                     |  180 ++++
 .claude/skills/ingest-clipping.md                  |  157 +++
 .claude/skills/jarvis-dump/SKILL.md                |   42 -
 .claude/skills/jarvis-dump/reference.md            |   59 -
 .claude/skills/json-canvas/SKILL.md                |   99 --
 .claude/skills/json-canvas/references/EXAMPLES.md  |   68 --
 .claude/skills/lint-claude-layer.md                |  162 +++
 .claude/skills/monthly-review/SKILL.md             |   44 -
 .claude/skills/monthly-review/reference.md         |   58 -
 .claude/skills/obsidian-bases/SKILL.md             |  107 --
 .claude/skills/obsidian-cli/SKILL.md               |  220 ----
 .claude/skills/obsidian-markdown/SKILL.md          |   88 --
 .claude/skills/organize-csci2033.md                |  156 +++
 .claude/skills/startday/SKILL.md                   |   44 -
 .claude/skills/startday/reference.md               |   53 -
 .claude/skills/today.md                            |  127 +++
 .claude/skills/trace-topic.md                      |  130 +++
 .claude/skills/weekly-review.md                    |  149 +++
 .claude/skills/weekly-review/SKILL.md              |   42 -
 .claude/skills/weekly-review/reference.md          |   75 --
 .gitignore                                         |   10 -
 30_Order/Standards/Agentic OS/Agent Standard.md    |   83 --
 .../Standards/Agentic OS/Agentic OS Standard.md    |  124 ---
 30_Order/Standards/Agentic OS/Hook Standard.md     |  173 ---
 30_Order/Standards/Agentic OS/Skill Standard.md    |   94 --
 30_Order/Standards/Dashboards/Daily Note Schema.md |  197 ----
 30_Order/Standards/Dashboards/Monthly Review.md    |  136 ---
 30_Order/Standards/Dashboards/Scheduled Review.md  |  108 --
 30_Order/Standards/Dashboards/Streak Rule.md       |  158 ---
 30_Order/Standards/Dashboards/Weekly Review.md     |  134 ---
 30_Order/Standards/Jarvis Review.md                |  134 ---
 30_Order/Standards/Naming and Folder Map.md        |   91 --
 .../Standards/References/Reference - closeday.md   |   41 -
 .../Standards/References/Reference - plan-cli.md   |   60 --
 .../Standards/References/Reference - skeptic.md    |   38 -
 .../Standards/References/Reference - startday.md   |   41 -
 30_Order/Standards/The Plan Vault Architecture.md  |   21 +-
 30_Order/System/plan-cli/plan-cli.cjs              | 1058 ------------------
 30_Order/System/streak/QuickAdd Setup.md           |   87 --
 30_Order/Workflows/Agentic OS/Agentic OS.md        |  103 --
 30_Order/Workflows/Agentic OS/How to Use Agents.md |   70 --
 .../Workflows/Agentic OS/How to Use Plugins.md     |   78 --
 30_Order/Workflows/Agentic OS/How to Use Skills.md |   90 --
 AGENTS.md                                          |   47 +-
 CLAUDE.md                                          |  145 ++-
== b26def3
Anant Gupta gupt0479@umn.edu Fri Oct 16 21:02:24 2026 -0500
 .claude/skills/copilot-fetch-x/SKILL.md            |  48 +++
 .claude/skills/copilot-web-fetch/SKILL.md          |  59 ++++
 .claude/skills/copilot-web-search/SKILL.md         |  52 +++
 .claude/skills/copilot-youtube-transcript/SKILL.md |  48 +++
 .claude/skills/json-canvas/SKILL.md                |  99 ++++++
 .claude/skills/json-canvas/references/EXAMPLES.md  |  68 ++++
 .claude/skills/obsidian-bases/SKILL.md             | 107 ++++++
 .claude/skills/obsidian-cli/SKILL.md               | 220 ++++++++++++
 .claude/skills/obsidian-markdown/SKILL.md          |  88 +++++
 .claude/skills/openartifacts-publish/SKILL.md      | 134 ++++++++
 30_Order/Standards/Agentic OS/Agent Standard.md    |  83 +++++
 .../Standards/Agentic OS/Agentic OS Standard.md    | 124 +++++++
 30_Order/Standards/Agentic OS/Hook Standard.md     | 173 ++++++++++
 30_Order/Standards/Agentic OS/Skill Standard.md    |  94 ++++++
 30_Order/Standards/Dashboards/Daily Note Schema.md | 197 +++++++++++
 30_Order/Standards/Dashboards/Monthly Review.md    | 136 ++++++++
 30_Order/Standards/Dashboards/Scheduled Review.md  | 108 ++++++
 30_Order/Standards/Dashboards/Streak Rule.md       | 158 +++++++++
 30_Order/Standards/Dashboards/Weekly Review.md     | 134 ++++++++
 30_Order/Standards/Jarvis Review.md                | 134 ++++++++
 30_Order/Standards/Naming and Folder Map.md        |  91 +++++
 .../Standards/References/Reference - closeday.md   |  41 +++
 .../Standards/References/Reference - plan-cli.md   |  60 ++++
 .../Standards/References/Reference - skeptic.md    |  38 +++
 .../Standards/References/Reference - startday.md   |  41 +++
 30_Order/Standards/The Plan Vault Architecture.md  |  21 +-
 30_Order/System/streak/QuickAdd Setup.md           |  87 +++++
 30_Order/Workflows/Agentic OS/Agentic OS.md        | 103 ++++++
 30_Order/Workflows/Agentic OS/How to Use Agents.md |  70 ++++
 .../Workflows/Agentic OS/How to Use Plugins.md     |  78 +++++
 30_Order/Workflows/Agentic OS/How to Use Skills.md |  90 +++++
 AGENTS.md                                          |  47 ++-
 CLAUDE.md                                          | 145 ++------

commit [REDACTED]
Author: Anant Gupta <anantmahi721@gmail.com>
Date:   Wed Oct 14 15:23:02 2026 -0500

    auto-sync: 2026-10-14 15:23 | 4 files

 .gitignore                                         |   3 +
 00_Live/Map Canvas.canvas                          | 626 +++++++++++++++++++++
 .../Audit - Dashboard Stack and Phone Checklist.md | 101 ++++
 40_Resources/Obsidian/Dashboards/Dashboards Hub.md |   3 +-
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "^(Write|Edit|MultiEdit|NotebookEdit|Bash|PowerShell|mcp__the-plan__vault_.*|mcp__jarvis__.*)$",
        "hooks": [
          {
            "type": "command",
            "command": "node",
            "args": ["${CLAUDE_PROJECT_DIR}/30_Order/System/plan-cli/plan-cli.cjs", "hook", "write-guard"],
            "timeout": 10,
            "onFailure": "block"
          }
        ]
      },
      {
        "matcher": "^(Read|Write|Edit|MultiEdit|NotebookEdit|Grep|Glob|Bash|PowerShell|mcp__the-plan__vault_.*|mcp__jarvis__vault_.*)$",
        "hooks": [
          {
            "type": "command",
            "command": "node",
            "args": ["${CLAUDE_PROJECT_DIR}/30_Order/System/plan-cli/plan-cli.cjs", "hook", "secrets-guard"],
            "timeout": 10,
            "onFailure": "block"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "^(Write|Edit|MultiEdit|mcp__the-plan__vault_(write|patch|append))$",
        "hooks": [
          {
            "type": "command",
            "command": "node",
            "args": ["${CLAUDE_PROJECT_DIR}/30_Order/System/plan-cli/plan-cli.cjs", "hook", "validate-daily"],
            "timeout": 10
          }
        ]
      }
    ]
  }
}
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=long-iso 30_Order/System/git-sync; grep -n "auto:\|auto-sync:\|GitOwned\|commit -m\|add -A" 30_Order/System/git-sync/*.ps1 | head -30; echo ---; ls "30_Order/Standards/Agentic OS" "30_Order/Standards/Dashboards" "30_Order/Standards/References" "30_Order/Workflows/Agentic OS" "30_Order/Workflows" 2>&1
```
```
total 16
drwxr-xr-x 1 anant 197609     0 2026-09-26 16:21 .
drwxr-xr-x 1 anant 197609     0 2026-10-13 16:03 ..
drwxr-xr-x 1 anant 197609     0 2026-09-26 16:21 logs
-rw-r--r-- 1 anant 197609   728 2026-09-26 16:20 plan-git-sync-silent.vbs
-rw-r--r-- 1 anant 197609 11728 2026-09-26 16:20 plan-git-sync.ps1
-rw-r--r-- 1 anant 197609  1629 2026-09-26 16:20 register-plan-git-sync-task.ps1
30_Order/System/git-sync/plan-git-sync.ps1:21:#   4. Commit the working tree as it stands (git add -A) and push. On a
30_Order/System/git-sync/plan-git-sync.ps1:44:$GitOwnedFolder = "30_Order/System/git-sync/"
30_Order/System/git-sync/plan-git-sync.ps1:68:function Test-GitOwnedPath {
30_Order/System/git-sync/plan-git-sync.ps1:70:    return ($Path.StartsWith(".") -or $Path.StartsWith($GitOwnedFolder))
30_Order/System/git-sync/plan-git-sync.ps1:113:    & git add -A 2>&1 | Out-Null
30_Order/System/git-sync/plan-git-sync.ps1:117:    $msg = "auto-sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm') | $n files$Suffix"
30_Order/System/git-sync/plan-git-sync.ps1:125:function Sync-GitOwnedPaths {
30_Order/System/git-sync/plan-git-sync.ps1:133:        if (-not (Test-GitOwnedPath $p)) { continue }
30_Order/System/git-sync/plan-git-sync.ps1:208:                    $conflicts = Sync-GitOwnedPaths -Base $base -Remote $remoteTip
---
30_Order/Standards/Agentic OS:
Agent Standard.md
Agentic OS Standard.md
Hook Standard.md
Skill Standard.md

30_Order/Standards/Dashboards:
Daily Note Schema.md
Monthly Review.md
Scheduled Review.md
Streak Rule.md
Weekly Review.md

30_Order/Standards/References:
Reference - closeday.md
Reference - daily-auditor.md
Reference - daily-note-validator.md
Reference - jarvis-dump.md
Reference - monthly-review.md
Reference - plan-cli.md
Reference - review-analyst.md
Reference - secrets-guard.md
Reference - skeptic.md
Reference - startday.md
Reference - streak script.md
Reference - the-plan-dashboard.md
Reference - vault-curator.md
Reference - weekly-review.md
Reference - write-guard.md
Tool Reference Template.md

30_Order/Workflows:
Agentic OS
Daily Dashboard.md
Jarvis Move.md
Run Monthly Review.md
Run Weekly Review.md

30_Order/Workflows/Agentic OS:
Agentic OS.md
How to Use Agents.md
How to Use Plugins.md
How to Use Skills.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git show --stat=200 --format= 0b995c5 | grep -E '^ \.' | grep -v '^ \.claude' ; echo ---; ls 00_Live/Enumerate/Daily | tail -8; ls 00_Live/Enumerate/Monthly 00_Live/Enumerate 2>&1 | tail -15
```
```
 .codex/README.md                                                                                       |   45 ----
 .codex/config.toml                                                                                     |   29 +--
 .gitignore                                                                                             |   10 -
 .kiro/specs/claude-code-ops-layer/design.md                                                            |  344 +++++++++++++++++++++++++++
 .kiro/specs/claude-code-ops-layer/requirements.md                                                      |  307 ++++++++++++++++++++++++
 .kiro/specs/claude-code-ops-layer/tasks.md                                                             |  150 ++++++++++++
 .kiro/specs/pkm-capability-engine/design.md                                                            | 1139 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 .kiro/specs/pkm-capability-engine/requirements.md                                                      |  296 +++++++++++++++++++++++
 .kiro/specs/pkm-capability-engine/tasks.md                                                             |  237 +++++++++++++++++++
 .kiro/steering/human-writing.md                                                                        |   19 ++
 .kiro/steering/styling.md                                                                              |   75 ++++++
 .kiro/steering/workspace-context.md                                                                    |   23 ++
---
2026-06-11.md
2026-06-13.md
2026-07-01.md
2026-07-08.md
2026-09-26.md
2026-10-05.md
2026-10-12.md
25-10-2026.md
00_Live/Enumerate:
Daily
Enumerate Board.md
Monthly
Weekly
Yearly

00_Live/Enumerate/Monthly:
2025-12.md
2026-01.md
2026-03.md
2026-06.md
2026-10.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=full-iso "00_Live/Enumerate/Daily/25-10-2026.md"; cat "00_Live/Enumerate/Daily/25-10-2026.md"; echo ===; git show --stat --format='%h %ae %ad' 0dbb873 96f2547 b8a1c14 7749fff ad9056a | grep -v '^$'
```
```
-rw-r--r-- 1 anant 197609 0 2026-10-25 17:42:58.998000000 -0500 00_Live/Enumerate/Daily/25-10-2026.md
===
0dbb873 anantmahi721@gmail.com Sun Oct 25 17:53:05 2026 -0500
 00_Live/Enumerate/Daily/19-10-2026.md | 2 +-
 00_Live/Enumerate/Daily/25-10-2026.md | 0
 00_Live/Enumerate/Weekly/2026-W44.md  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
96f2547 anantmahi721@gmail.com Sun Oct 25 18:38:05 2026 -0500
 00_Live/Enumerate/Weekly/2026-W44.md | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
b8a1c14 anantmahi721@gmail.com Sun Oct 25 18:53:05 2026 -0500
 00_Live/Enumerate/Weekly/2026-W44.md | 54 +++++++++++++++++++-----------------
 1 file changed, 29 insertions(+), 25 deletions(-)
7749fff anantmahi721@gmail.com Tue Oct 20 08:38:03 2026 -0500
 00_Live/Enumerate/Daily/19-10-2026.md | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)
ad9056a anantmahi721@gmail.com Mon Oct 19 16:53:03 2026 -0500
 00_Live/Enumerate/Daily/19-10-2026.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --format='%h %ad' --date=iso --name-status -- "00_Live/Enumerate/Daily/19-10-2026.md" | head; find . -name "19-10-2026*" -not -path "./.git/*"; find 00_Live -newer 30_Order/System/plan-cli/plan-cli.cjs -name "*.md" | head -30; echo ---; grep -o '"format":"[^"]*"\|"folder":"[^"]*"\|"template":"[^"]*"\|"enabled":[a-z]*' .obsidian/plugins/periodic-notes/data.json 2>&1 | head -20; grep -o '"format": *"[^"]*"\|"folder": *"[^"]*"' .obsidian/daily-notes.json 2>&1
```
```
Exit code 2
0dbb873 2026-10-25 17:53:05 -0500

M	00_Live/Enumerate/Daily/19-10-2026.md
7749fff 2026-10-20 08:38:03 -0500

M	00_Live/Enumerate/Daily/19-10-2026.md
ad9056a 2026-10-19 16:53:03 -0500

M	00_Live/Enumerate/Daily/19-10-2026.md
1fe7d18 2026-10-19 09:23:03 -0500
./00_Live/Enumerate/Daily/19-10-2026.md
00_Live/Books/Psycho-Cybernetics.md
00_Live/Enumerate/Daily/19-10-2026.md
00_Live/Enumerate/Daily/25-10-2026.md
00_Live/Enumerate/Enumerate Board.md
00_Live/Enumerate/Weekly/2026-W44.md
00_Live/Headway/Bits and pieces/Re-Program Myself.md
00_Live/Life OS.md
00_Live/Monthly Dashboard.md
00_Live/Tracking/Plans/Summer Grind.md
---
"enabled":
"enabled":
"enabled":
"enabled":
grep: .obsidian/daily-notes.json: No such file or directory
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && cat "00_Live/Enumerate/Daily/19-10-2026.md"; echo ===; cat .obsidian/plugins/periodic-notes/data.json; echo; ls 30_Order/Templates "30_Order/Templates/Daily Dashboard" 2>&1
```
```
---
type: daily
status: seed
created: 19-10-2026
study_hours: 0
---
## Targets

%% The QuickAdd choice "Set tomorrow's career line" inserts the career line directly under this heading. %%
- Study topic: 
Crucial missing point in the daily description below: reading cybernetics.
## Morning
I woke up at 7 am, was at the gym by 7:15. Worked out till 8 am because I felt mad punish. Came home and took a shit. Almost puked, actually even spit some electrolyte water as well. Must be because I worked out empty stomach. No dinner yesterday. 
- [x] I will move around at 7 am in my room so that I can become a morning person. [cat:: morning] ✅ 2026-10-19
- [ ] I will read 12 pages in the morning at my desk so that I can become a reader. [cat:: morning]
- [ ] I will plan the day for 20 minutes after I move, at my desk, so that I can become someone who runs the day. [cat:: morning]

## Study
No studying was done at all today, just going to all classes and completing the main task at hand was done. At least that was completed but absolutely none today. 
- [ ] I will study for one block at 10 am at my desk so that I can become a person who learns every day. [cat:: study]
Studying needs to take place as the morning activity immideately after eating me whether it be lab, class or nothing. Mondays are labs, tuesdays are classes and Wednesday is nothing. After eating, u have time go bath, then leave to go study. Only after efficient studying is done come back home. For what? The second meal. Eat that and leave for classes. Make sure to grab a snack that u can stuff in your backpack for the day now. This is the daily routine I think. At least the very 16 hours of the day. The problem after 4 pm is the breather time, this needs to efficiently be used to play guitar, learn trading watch YouTube videos, eat the snack(protein shake as well). Pass your time till 5:30 pm usually the ideal break time. Now, focus on the dev work required for the day. Learnings, courses, etc. everything is worked on till 9 pm. On the dot 9 pm, everything is closed and wrapped up except obsidian and one terminal session to talk about the day. Wrap the day up. 
## Fitness
Yay, gym
- [ ] I will train at 5:30 pm in the gym so that I can become an athlete. [cat:: fitness]
- [ ] I will drink 3L of water and take creatine by 9 pm at home so that I can become someone who looks after the body. [cat:: fitness]
I’m not sure how much water I drank but I should be carrying my water bottle around everywhere with me 
## Mind
I did a lot of time pass after getting back home till 7 pm so I wasted about 2 and a half hours there. In the morning after lab, I wasted time till 1 pm. I got only 45 mins worth of work done. I didn’t eat breakfast on time, reached lab late. Threw some of the sandwich because it was ass, I had to heat it. I ate only two meals despite going to the gym. There needs to be eating frequently. At least 4 meals a day. That’s the target. 
- [ ] I will choose mindset content over doomscrolling at 10 pm in bed so that I can become a calm person. [cat:: mind]
- [ ] I will not smoke before planning, breakfast and the first task, from 8 am at home, so that I can become a non-smoker. [cat:: mind]

## Career
Used reminders to plan my day out neatly on sunday. Mapped my entire week out, did not get a few things done. But still just doing this process is a lot this is beginning. We need to make sure that all the reminder tasks are completed by 4 pm. No matter what. 
- [ ] I will do the career line from Targets at 4 pm at my desk so that I can become employable. [cat:: career]

## Evening close

%% One line per missed category, for example: - [miss:: morning] [cause:: sleep]. Causes: sleep, no-plan, distracted, energy, other. %%

## Next actions

%% At most 5. Never repeat a task from the day before. Each ends with [type:: streak], [type:: career], [type:: gym] or [type:: failure]. %%
Wake up at 6 am buddy 
## Intake
- there are 2 types of people that’s pretty much it: people who take action vs. who don’t. 
	- Almost every class u attend of MGMT, u fall back day by day. Not for the course but for the entrepreneurial journey u set out for
===
{
  "showGettingStartedBanner": false,
  "hasMigratedDailyNoteSettings": true,
  "hasMigratedWeeklyNoteSettings": true,
  "daily": {
    "format": "DD-MM-YYYY",
    "template": "30_Order/Templates/Headway Templates/Better Today.md",
    "folder": "00_Live/Enumerate/Daily",
    "enabled": true
  },
  "weekly": {
    "format": "",
    "template": "30_Order/Templates/Headway Templates/Better Week.md",
    "folder": "00_Live/Enumerate/Weekly",
    "enabled": true
  },
  "monthly": {
    "format": "MM-YYYY",
    "template": "30_Order/Templates/Headway Templates/Better Month.md",
    "folder": "00_Live/Enumerate/Monthly",
    "enabled": true
  },
  "quarterly": {
    "format": "",
    "template": "",
    "folder": ""
  },
  "yearly": {
    "format": "",
    "template": "30_Order/Templates/Headway Templates/Better Year.md",
    "folder": "00_Live/Enumerate/Yearly",
    "enabled": true
  }
}
30_Order/Templates:
AI
Classes
Daily Dashboard
MOC.md
Metadata

30_Order/Templates/Daily Dashboard:
Better Month.md
Better Today.md
Better Week.md
Better Year.md
Daily Note.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && node 30_Order/System/plan-cli/plan-cli.cjs streak 00_Live/Enumerate/Daily 2026-10-25 | head -c 1500
```
```
{"current_streak":0,"best_streak":0,"today_categories_done":0,"today_status":"NOT_YET","at_risk":false,"first_day":null,"days":[{"date":"2026-09-26","has_note":true,"categories":0,"forgiven":false},{"date":"2026-09-27","has_note":false,"categories":0,"forgiven":false},{"date":"2026-09-28","has_note":false,"categories":0,"forgiven":false},{"date":"2026-09-29","has_note":false,"categories":0,"forgiven":false},{"date":"2026-09-30","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-01","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-02","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-03","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-04","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-05","has_note":true,"categories":0,"forgiven":false},{"date":"2026-10-06","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-07","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-08","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-09","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-10","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-11","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-12","has_note":true,"categories":0,"forgiven":false},{"date":"2026-10-13","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-14","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-15","has_
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/00_Live/Tracking/Plans" && wc -c *; cat "Summer Grind.md"; echo ======; cat "Winter Break.md" | head -150
```
```
19549 Summer Grind.md
11449 Winter Break.md
30998 total
---
type: brainstorm
status: seed
created: 2026-04-26
related_progress:
  - "[[00_Live/Tracking/Plans/Winter Break]]"
  - "[[Resolutions '26]]"
tags:
  - brainstorm
next: "[[2026]]"
---
# Overall Plan
3 More Months to go, get yourself out.
## Systems
This summer is not a list of outcomes. [[Atomic Habits]] instead of motivation. The operating idea is: every goal below gets a small identity, an obvious cue, an easy starting action, a satisfying proof of progress, and a link back into the vault. The daily rule is simple: **one physical win, one project win, one career win, one cleanup/admin win, and one review win**. If a day breaks, use the [[Atomic Habits#The 4th Law - Make it Satisfying|Never Miss Twice]] rule. Missing once is data. Missing twice is the beginning of the wrong system.
## What did not ship
### Projects
1. TradingView
	- base laid out (no ui built), backend wise. Ui planning took place.
	- What to trade in? Unclear 
	- No knowledge gained about trading in general. Only material acquired.
2. Arc - dropped out mostly: a personal system needs to built inside Jarvis. 
3. Jarvis: substantially improved and built out
	- systems laid out 
	- Internship loop 
	- Claudekit
	- Problem: execution of skills, scheduled tasks not built or planned 
4. The plan 
	- a very brief idea and plan ready to be built out but the problem is execution. 
	- personal vault from now on, important information required on phone is moved here (classes, meetings, etc.)
	- Personality, identity and life stuff built out over here
5. Research under jaideep
	- 1 meeting took place and nothing progressed after that
	- Have a brief idea on what to work on
	- Apply for UROP and clear the previous UROP stipend 
6. Reading: 2 books - easy way to quit smoking and essentialism. 3rd book was the subtle art not to give a fuck. Planning to not read that and read psycho-cybernetics (fall semester read).
7. Laptop: new laptop in process to be set up. Existing laptop has a plan derived to take place: never ending process.
	- WSL: was messed up but cleared correctly now. 
	- Ai agents: global configurations still need to be setup
	- backup established, photos moving required (phone to laptop or cloud services).
8. Phone: photos in albums, camera settings, cloud service at all times (Google Drive, something similar for photos), 
9. Automations: internship loop, ingestion, nothing else laid out.
10. 
### Life
1. Finance: origin for spending analysis 
	- savings account needs to opened
	- paper trading takes place this semester
2. Scholarships and study abroad
	- have a small list of scholarships. Study abroad was not looked at. 
	- Study abroad scholarships are way far off 
3. Routine: no routine laid out at all. 
4. Gym and calisthenics: gym happened everyday in Dubai. Gym did not happen for 2 months in India not a single week in which I went 5 days a row. Calisthenics? Lol
5. Quit smoking; LOL
### Internships & Job
1. TA: not happening for 4041, discarded 
2. Internship tracker: built out 
3. Freelancing: not done
4. Courses: not a single course


### Re-Birth
#### Projects
*Identity*: I am a builder who ships portfolio-grade systems, not scattered demos. This connects [[Stocks Trading AI Hub]], [[Arc (Learning Tracker)]], [[Jarvis Control Center]], [[AI Workflow]], [[My AI Twin]], [[AI Learning Across Vaults]], [[Opspilot]], and [[Resq]]. The system is one active flagship project, one supporting project, and one maintenance lane. Maintenance keeps the laptop, phone, vault, and automation layer from becoming friction. 
> [!NOTE] Every project uses the same loop:
> 1. **Scope:** one sentence problem, one user, one hero flow, one success metric.
> 2. **Build:** one small issue at a time.
> 3. **Evidence:** screenshot, demo, test result, README note, or architecture decision.
> 4. **Story:** one resume bullet, one portfolio paragraph, one mentor-ready explanation.
> 5. **Review:** what shipped, what was real vs mocked, what gets cut.

1. **TradingView**
	*System*: Treat the trading app as an engineering and evaluation project, not a promise to beat the market. The note [[Stocks Trading AI Hub]] already frames the useful artifact: daily data pipeline, indicators, simple classifier, backtest, dashboard, and honest model assessment. 
	- Link the money side to [[Stocks]] so investing stays separate from short-term trading experiments.
2. **Arc (Learning Tracker)**
	*System*: [[Arc (Learning Tracker)]] becomes the flagship full-stack + GenAI project if chosen for the summer. It should prove product engineering: auth, database schema, tracked sessions, weekly recap, RAG tutor, deployment, and polish.
	- **Interlinks:** connect implementation decisions to [[AI Workflow]], [[MCPs]], [[Gen AI Roadmap]], [[Portfolio]], and [[Engineer Edge Roadmap]].
3. **Jarvis**
	*System*: Jarvis is the operations layer for the vault, not a random AI toy. Keep it tied to [[Jarvis Control Center]], [[Jarvis Operating Rules]], [[Jarvis System Status]], [[Jarvis Capability Register]], and [[AI AGENT]].
	- **Obvious:** weekly Jarvis review opens the control center and asks: what capability actually saved time this week?
4. **Second Brain**: Testing over tracking
	*System*: "Testing over tracking" means the vault should prove whether it helps action. Use [[Vault]], [[AI Workflow]], [[AI Learning Across Vaults]], [[UMN Workflow]], and [[Promoted From Jarvis Index]] as context.
5. **Research under Jaideep Srivastava - Healthcare**
	*System*: Use the [[BOOM]] research system as proof that research becomes valuable when you can explain the pipeline, the problem, and your contribution. New professor work should follow the same pattern: domain primer, system map, contribution log, weekly question list.
6. **Reading**: 3 Books
	*System*: Reading is not consumption. It feeds behavior change and language for the systems. Current list: [[Easy Way to Quit Smoking]], [[Atomic Habits]], and "The Subtle Art Not to Give a Fuck" / likely [[Stoicism]] or [[Essentialism]] themes.
	- **Obvious:** book stays visible beside bed or on phone home screen.
7. **Laptop**: WSL, file system, Windows, backup, ai agents, photos
	*System*: Laptop cleanup is environment design from [[Atomic Habits#The 1st Law - Make it Obvious|Make it Obvious]]. A clean machine makes work easier; a chaotic machine makes procrastination cheaper. Tie this to [[Ubuntu - WSL]], [[Claude Code]], [[Cursor AI]], and [[AI Workflow]].
8. **Phone**: Photos, procrastination, sync, files, ai agents
	*System*: Phone becomes a capture, communication, maps, photos, and reading device. It should not be the default dopamine machine.
	- **Obvious:** put reading, calendar, tasks, camera, and notes on the first screen. Hide or friction-add procrastination apps.
9. **Automations**: Zapier, gmail,
	*System*: Automations are useful only when they remove repeated friction. Use [[AI Workflow#Automation Workflows (Make/Zapier/n8n)]], [[Random]], Gmail, Zapier, and future n8n/Make experiments.
#### Life
*Identity*: I am someone who protects health, money, attention, and family trust. This is the base layer that makes the project and career systems possible.
1. **Finance Management**: Origin, 
	*System*: Finance is automatic flows plus monthly review. Use [[Bank Accounts]] for the account structure and [[Stocks]] for investing behavior.
	1. ==Investing==
	2. ==Trading==
	3. ==Saving==
2. **Scholarships & Study Abroad**
	*System*: Treat scholarships and study abroad like a pipeline, not a vague hope.
	- **Obvious:** maintain one tracker with program, deadline, requirements, essay status, recommender, submitted.
3. **Routine**: Systems over goals
	*System*: Routine is the daily operating system. It uses [[Habits]], [[Habits Scorecard]], [[Habits Stacking]], and [[Atomic Habits]]. The purpose is not perfect days; it is quick recovery and low-friction starts.
	- **Morning:** plan day, eat, first task, then optional reward. No smoking or doomscrolling before the first task.
	- **Midday:** deep work or career block before scattered admin.
	- **Evening:** gym/physical block, food, cleanup, short review.
	- **Night:** set tomorrow's cue: clothes, laptop tab, note, water, book.
	- **Scorecard:** mark only core habits. Do not create 40 checkboxes.
4. **Gym & Calisthenics**
	*System*: Build the identity already written in [[Habits]]: someone with a strong body and cool calisthenics skills.
	1. 5 days a week - Gym
	2. 1 day - cool stuff
5. **Quit Smoking**
	1. Get your health in order
	*System*: Use [[Easy Way to Quit Smoking]] and [[Atomic Habits#The 2nd Law - Make it Attractive|Make it Unattractive]]. The belief to install: smoking gives nothing and steals health, money, attention, and self-respect.
	- **Invisible:** remove morning cues, stash, rolling setup, and smoking-first routine.
	- **Unattractive:** write the real cost before cravings: low energy, wasted day, money burned, weaker body, worse confidence.
	- **Difficult:** no smoking before planning, breakfast, and first task. Add distance, delay, and social friction.
	- **Unsatisfying:** track money/time lost when a slip happens. Do not moralize; make the cost visible.
	- **Replacement:** craving means change state: walk, shower, call someone, gym, cook, or read two pages.
#### Internship & Jobs
*Identity*: I am a student engineer who creates proof, applies consistently, and explains work clearly. This connects [[Mentor Meeting - Hackathons, Summer, and Networking]], [[Companies giving OPT & CPT]], [[Interview Questions]], [[Elevator pitch]], [[Portfolio]], [[Freelancing]], and [[Useful Links]].
1. **TA**: CSCI 4041, 2041, 1133,
	- **Interlinks:** use [[CSCI 4041 Board]], [[CSCI 2041 Board]], and related class notes as prep material.
2. **Internships**
	1. Tracker
	*System*: Internships are a weekly pipeline, not a panic sprint. [[Companies giving OPT & CPT]] already contains company leads, talking points, and applied status.
	- **Obvious:** tracker columns: company, role, link, work authorization, deadline, applied, follow-up, referral/contact, status.
3. **Freelancing**
	1. Marketing Strategies for apps
	*System*: Freelancing starts as full-stack offer design, not random Upwork browsing. Use [[Freelancing]], [[Portfolio]], [[Opspilot]], [[Resq]], and app marketing notes.
	- **Obvious:** define one simple offer: landing page, dashboard, automation, or AI workflow setup for a small business.
4. **Courses**: Certifications
	1. Github developer pack: 
	2. AWS: Free courses available but limited.
		1. [Get Started](https://skillbuilder.aws/category/getstarted)
		2. [AWS Cloud Practitioner Essentials](https://skillbuilder.aws/learn/94T2BEN85A/aws-cloud-practitioner-essentials/8D79F3AVR7)
	3. Azure:
	4. Claude:
	5. AI/ML courses:
		1. ==NVIDEA==: [**Best Free NVIDIA Path For AI + MLOps**](https://www.nvidia.com/en-us/training/find-training/?Free+Courses=Free)
			1. **Introduction to NVIDIA NIM Microservices**
			    Free, 2 hours. Best MLOps-adjacent pick because NIM is about building, deploying, and scaling AI applications.
			2. **Building RAG Agents With LLMs**  
			    NVIDIA’s current page lists this as free, 8 hours. Strongest practical AI-agent/RAG course. Your PDF catalog showed it as paid, so check the enrollment page before starting.
			3. **Augment Your LLM Using Retrieval Augmented Generation**  
			    Free, 1 hour. Good short RAG foundation before the full RAG agents course.
			4. **Agentic AI Explained**  
			    Free, 1 hour. Good conceptual intro to agents, but likely no certificate.
			5. **Introduction to Multi-Modal Data Curation**  
			    Free, 1 hour. Useful for ML pipelines because data curation is half the real work.
			6. **Decentralized AI at Scale with NVIDIA FLARE**  
			    Free, 4 hours. Very good for serious ML systems: federated learning, privacy-preserving distributed ML.
			7. **Introduction to Federated Learning with NVIDIA FLARE**  
			    Free, 2 hours. Do this before the decentralized AI course if FLARE is new to you.
			8. **Getting Started With AI on Jetson Nano**  
			    Free, 8 hours. Best if you want edge AI/computer vision. NVIDIA’s page lists it as free, and your catalog marks course certificate as yes.
		2. [Evidently](https://docs.evidentlyai.com/introduction): Free AI and ML model courses
			1. [LLM Evaluation](https://www.evidentlyai.com/llm-evaluation-course-practice?utm_source=convertkit&utm_medium=email&utm_campaign=%F0%9F%91%A9%E2%80%8D%F0%9F%8E%93%20LLM%20Eval%20Course%20Lesson%201:%20Intro%20to%20LLM%20evals%20-%208431951)
		3. [Kaggle](https://www.kaggle.com/): Really good courses
			1. [5-Day AI Agent](https://www.kaggle.com/learn-guide/5-day-agents): Sprint in detail
		4. [FreeCodeCamp](https://github.com/freeCodeCamp/freeCodeCamp): Github and all courses
		5. [IBM](https://skills.yourlearning.ibm.com/channels/recommended): Free courses
			1. [AI Basics](https://skills.yourlearning.ibm.com/activity/PLAN-1837FF826ECF?utm_source=skillsbuildorg&utm_campaign=ai-level-up&utm_medium=organic)
		6. [DataTalks.Club](https://datatalks.club/): Gold for AI, courses live
			1. [MLOps Zoomcamp](https://datatalks.club/blog/mlops-zoomcamp.html): [Github](https://github.com/DataTalksClub/mlops-zoomcamp)
		7. HuggingFace: 
			1. [AI Agents course](https://huggingface.co/learn/agents-course/unit0/introduction#expect)
			2. 
	*System*: Certifications support projects and applications. They are not the main achievement. Use [[Git & GitHub]], [[Gen AI Roadmap]], [[AI Workflow]], [[AWS]], [[Azure]], [[Claude Code]], and AI/ML course notes as they appear.
	- **Obvious:** one certification/course queue with reason, project connection, deadline, and proof.
## How you manage the whole plan efficiently (Dubai → Bangalore → Sept 1)
- **Dubai sets the system** (routines + cues + minimum viable daily wins) so Bangalore becomes repetition, not reinvention.
- **Bangalore is execution through weekly cadence** (ship evidence weekly; review weekly; cut scope weekly).
- Use **weekly evidence** (demo/screenshot/README + bullets) as the objective measure that you’re on track for Sept 1.
> [!IMPORTANT] TOP 3:
> 1. MVPs & Deployment: Arc, Portfolio, TradingView, Resq
> 2. Health - Gym, Eat, Routines 
> 3. Read - Research, Books, Investing
### Dubai
> [!TIME] 5 Weeks - 18th May - 19th June
> - Distribute systems into weekly loads and plan from the end.

**Goal for this block:** install a repeatable daily/weekly operating system so the 2-month Bangalore execution window is effortless and consistent. The only explicitly listed Dubai task is to “get routines in order,” so the plan below converts that into concrete, measurable routine deliverables.
#### P0 (Week 1: May 18 → May 24) — Design the routine (make it executable)
- Define your **“daily rule”** as the non-negotiable checklist (keep it small enough to actually do daily):
	1. One physical win
	2. One project win
	3. One career win
	4. One cleanup/admin win
	5. One review win
- Set a **minimum viable version** for each win (so you can still do it on low-energy days):
	- Review: 5-minute end-of-day note
- Create the **cues + starting actions** to make the routine “obvious and easy” (environment design):
	- Night-before setup (clothes, water, open the right note/tab)
	- Put the routine checklist as the first thing you see each morning (top of your daily note)
- Run the routine daily; when you miss, enforce **Never Miss Twice** (treat misses as data, not failure).
- Keep a short “friction log” (what caused misses: sleep, phone, unclear next task, etc.) and remove one friction point every 2 days.
- Lock in a **weekly rhythm** that you’ll carry into Bangalore:
	- Use the Sunday weekly review questions (ship/train/money-cleanup/learn/habit break/flagship priority).
#### P1 (Weeks 4–5: May 25 → June 19) — Automate + standardize (so Bangalore is pure execution)
- Turn routine into templates:
	- Daily: 5 wins + one “flagship priority”
	- Weekly: answer the 7 weekly review questions + pick next week scope
- Set simple tracking evidence (proof you’re on track):
	- A short weekly “What shipped?” list (even if it’s tiny)
	- A consistent commit pattern (don’t optimize—just show up)
**Dependencies/resources**
- Your routine system is explicitly based on the “systems over goals / Atomic Habits / Never Miss Twice” approach already described in the document.
**Potential challenges**
- Over-scoping the routine (too many checkboxes). Keep it minimal and repeatable, then expand only after consistency.
### Bangalore (2 months: June 20 → ~Aug 20) — Priority: execute weekly, finish strong by Sept 1
> [!TIME] 2 Months
> - We already know what to do, we just follow it.

**Goal for this block:** use the routine installed in Dubai to execute consistently for 8 weeks, then use the remaining time up to Sept 1 as a buffer for cleanup, polish, and any missed weeks. (The document only states “2 months” under Bangalore, so the plan here is a structured execution container anchored on the existing weekly operating + weekly review system.) 
#### P0 (Week 1: June 20 → June 26) — Start with a single “flagship priority”
- Choose **one flagship priority for the week** (must be shippable in 7 days).
- Use the Weekly Operating System structure to run the week:
	1. Monday: choose one small workflow, draw diagram, write acceptance criteria
	2. Tue–Thu: build workflow, commit daily, keep bug log
	3. Friday: write a README/update note + screenshot/demo clip + convert one thing into a portfolio/interview bullet
	4. Saturday: system design pass (“where does this break?”) + add one failure test/trace point
	5. Sunday: review what shipped + cut scope for next week + prepare one mentor question
#### P0 (Weeks 2–7: June 27 → Aug 7) — Repeat the weekly loop (6 consecutive “ship weeks”)
For each week:
- Monday:
	- Pick 1 workflow only (do not start 3 things)
	- Define “done” (acceptance criteria)
- Tue–Thu:
	- Daily commit + bug log
	- If blocked, cut scope the same day (don’t carry dead work)
- Friday:
	- Produce “evidence”: README update + screenshot/demo clip + 1 portfolio/interview bullet
- Saturday:
	- Stress-test thinking: one “where does it break?” pass + add a failure test/trace point
- Sunday:
	- Answer the 7 weekly review questions and pick next week’s flagship priority
#### P1 (Weeks 8–9 buffer: Aug 8 → Sept 1) — Consolidate and ensure everything is “presentable”
- Use the final weeks as buffer to:
	- Finish any partially-shipped work from the weekly loop
	- Standardize documentation (README notes and evidence artifacts)
	- Ensure you have a clean weekly “what shipped” story across the whole Bangalore stretch
**Dependencies/resources**:
- The Bangalore plan depends on the Weekly Operating System and Weekly Review System already defined.
**Potential challenges**
- Scope creep (starting multiple workflows). The weekly loop explicitly prevents this by forcing “one workflow” and a weekly scope cut on Sunday.
### Weekly Review System
> [!QUESTION] *Every Sunday, answer this inside the weekly note or below this file later*:
> 1. What did I ship?
> 2. What did I train physically?
> 3. What did I do for money/career?
> 4. What did I clean or automate?
> 5. What did I read or learn?
> 6. Which habit broke, and how do I make the next rep easier?
> 7. What is the one flagship priority for next week?

This weekly review is the bridge into the later detailed [[Summer Grind#Dubai|Dubai]] and [[Summer Grind#Bangalore|Bangalore]] layouts.======
---
type: brainstorm
status: sprout
created: 2025-12-15
related_progress:
  - "[[Plan]]"
  - "[[Portfolio]]"
  - "[[Arc (Learning Tracker)]]"
  - "[[Cleaning Laptop]]"
  - "[[Making Break Meaningful 1.pdf]]"
tags:
  - brainstorm
  - evergreen
---
# The Plan
## Week 0 (Dec 20-21): Setting up
1. **Create a “Sprint HQ” in Obsidian**
	- Project V1 needs a **dedicated “Sprint HQ” dashboard** that points to repo deliverables + weekly checklists + metrics.
	- Make folders exactly as in your structure
	- Create templates (Daily/Meeting/Decision/Code Snippet)
	- Create `00_Dashboard.md` with links
2. **Create the repo skeleton**
	- `/docs/READTHIS-FIRST.md` (your instructions)
	- `/internships/target-list.csv` + `/internships/applications-tracker.csv`
3. **Decide the product scope in 10 minutes**  
    Write a 6-line “MVP spec”(*Minimum Viable Product Specification*):
    - Who user is
	- What they can do (3–5 actions)
	- What success looks like (demo script)
	- What’s cut
4. **Set up Todoist**  
    Projects:
	- V1 Product
	- V1 Interviews
	- V1 Internships
	- V1 Portfolio
	- V1 Obsidian  
    Labels: `@deepwork` `@admin` `@apply` `@practice`  
    Recurring habits (small):
	- Guitar 15m (3x/week)
	- Gym 45m (4x/week)
	- Meal prep (Sun). 
	This keeps “Winter Has Come” real, but not chaotic.
## Week 1 (Dec 22–28): System + Decisions + Skeletons
**Goal:** finalize scope, set up the OS, and get both repos running (lightly).
**Decide**:
- Portfolio approach: **Simple Next.js** vs **AI Twin template**
- Product stack: Clerk vs NextAuth, Neon vs Supabase/Railway
- AI scope: weekly recap generator vs none
1. *Product (Learning Tracker)*: **Watch/Extract from video:** project setup + Clerk auth + middleware + DB connection patterns. [YouTube](https://www.youtube.com/watch?v=rdaSPdCkoFQ&utm_source=chatgpt.com)
	- *Tools used*: Next.js, TS, Tailwind, Clerk, Neon, Drizzle, GitHub Issues/Board
	- Decide MVP: 3 core entities + 1 dashboard page
	- Choose stack: Next.js + TS + Postgres + Prisma + Auth (Clerk or NextAuth)
	- Scaffold repo + run locally: Next.js app, Apollo server, Prisma schema, seed script.
	- **Architecture brief**: ERD (User, Goal, KeyResult, CheckIn), `GraphQL` schema draft, page map, auth flow, LAN Graph(can be simple markdown diagram).
	- **Role Brief #1–#2** (Frontend, Backend): “day-to-day, tools, interview themes.”
	- Auth decision made (Clerk/Prisma/NextAuth) + basic auth wired
2. *Portfolio*:
	- Don’t do AI Twin repo yet.
	- Create a **simple Next.js portfolio** with:
	    - home/about
	    - projects section (cards)
	    - resume link
	    - contact
	- Add “Learning Tracker (in progress)” card + link to repo
3. *Obsidian*:
	- Create **Project V1 dashboard** + daily note template that includes:
	    - shipped / blockers / decision
	    - interview sessions count
	    - applications count
	- Templates created (Daily / Meeting / Decision / Code Snippet)
	- `00_Dashboard.md` with links to: Roadmap, Backlog, Trackers, This Week Plan
4. *Mentorship*:
	- Prepare “Week 1 one-pager”:    
	    - MVP spec
	    - ERD
	    - tech choices
	    - what you’re cutting
	- *Internship pipeline deliverables*:
		- `target-list.csv` created with **at least 30 roles** (Tier A/B/C)
		- `applications-tracker.csv` created (empty but ready)
		- Outreach list of 10 people (alumni/mentor/network).
**Done when:** you can run Learning Tracker locally and your portfolio exists online (even basic). Also, your vault/trackers are live.
- *Learning tracker*: login works + DB tables exist + can create a session (even via a simple form).
## Week 2 (Dec 29–Jan 4): Backend MVP + Auth
**Goal:** real functionality exists.
1. *Product*: **Watch/Extract:** how they structure CRUD APIs + relational queries + enrollment/progress logic. [YouTube](https://www.youtube.com/watch?v=rdaSPdCkoFQ&utm_source=chatgpt.com).
	- *Tools used*: ORM queries, Zod validation, basic dashboard UI
	- Where to add caching first (client, API response, or DB query)?
	- **API MVP**: Create/Read/Update for Goal, KeyResult, CheckIn; pagination; input validation.
	- **Auth working**: sign-up/login, protected routes on API and app.
	- Postgres + Prisma schema done
	- **Seed data + Postman/Thunder tests**.
	- CRUD working for core flow:
	    - create goal / topic / session
	    - list + detail views (API ready)
	- **Role Brief #3** (Full-stack) + short note: “what breaks first at 10× traffic?”
2. *Interview + pipeline*:
	- 5 technical sessions logged
	- 10–12 targeted apps submitted
	- 5 outreaches
**Done when:** a logged-in user can create/read/update/delete real data in the DB.
## Week 3 (Jan 5–11): Frontend MVP + Charts
**Goal:** usable UI, demoable.
1. *Product*: **Watch/Extract:** dashboard layout patterns + progress bars/cards. [YouTube](https://www.youtube.com/watch?v=rdaSPdCkoFQ&utm_source=chatgpt.com)
	- *Tools used*: OpenAI API, pgvector, retrieval pipeline
	- Core screens: Goals list, Goal detail (KR table), weekly CheckIn form, simple **progress chart** (Recharts).
	    - dashboard
	    - list/detail
	    - create/edit
	- 1 chart (weekly minutes or streak)
	- **State & data**: TanStack Query on top of GraphQL; optimistic updates for check-ins.
	- validation + loading/error states
	- **Role Brief #4–#5** (DevOps, Data).
2. *Portfolio*:
	- **Portfolio page deployed**: hero + project card + live link placeholder.
	- Project card for this app (even if “in progress”)
	- Begin write-up skeleton: what/why/how + screenshots placeholder
3. *Mentorship*:
	- Apply **10–12 roles**
	- Outreach **5 more**
	- 1 system design mini + log it
	- Ask Ahnaf for UX + scope cuts:
	    - “What looks most internship-ready?”
	    - “What’s unnecessary?”
**Done when:** you can demo in 2 minutes with a clean story.
## Week 4 (Jan 12–18): Deploy + Runbook + Tiny AI
**Goal:** credibility (deployment + reliability).
1. *Product*: **Watch/Extract:** deployment workflow + environment handling. [YouTube](https://www.youtube.com/watch?v=rdaSPdCkoFQ&utm_source=chatgpt.com)
	- *Tools used*: Vercel, GitHub Actions (lint/typecheck/build), runbook
	- **Deploy v0** (Vercel + Railway or AWS EB), **short runbook** (how to redeploy, env vars).
	- **Tests + CI**: Jest/RTL smoke tests; GitHub Actions (lint, test, build): lint + typecheck + build
	- Runbook.md (redeploy, env vars, db reset)
	- Add tiny AI micro-feature:
		- **“Weekly recap generator”**:
			- Input: last 7 days of session notes
			- Output: summary + “next 3 actions”
			- Store the recap in DB + display on dashboard
2. *Portfolio*:
	- Add project write-up:
	    - architecture diagram
	    - 3 key decisions
	    - what you’d do next
3. *Career*: Pre-launch checklist review (what would he add for a “manager-ready” demo?).
	- **Internship assets**: résumé v2, LinkedIn refreshed, target list (Tier A/B/C) with 20 apps ready.
	- Mock interview #1
	- 15–20 apps push week
**Done when:** live URL + README + runbook + CI badge. You can demo without panicking.
## Week 5 (Jan 19–25): Polish + Resume bullets + Optional AI Twin upgrade
**Goal:** package it professionally.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && find . -name "*.md" -newer "40_Resources/Obsidian/Dashboards/Audit - Dashboard Stack and Phone Checklist.md" -not -path "./.git/*" -not -path "./node_modules/*" | head -60; echo ---; grep -rli "claude assist\|ask claude\|claude panel\|daily plan\|daily-plan" --include=*.md . 2>/dev/null | grep -v "^./.git" | head -30
```
```
./.claude/agents/career-operator.md
./.claude/agents/research-distiller.md
./.claude/agents/vault-curator.md
./.claude/skills/closeday.md
./.claude/skills/connect-notes.md
./.claude/skills/context.md
./.claude/skills/copilot-fetch-x/SKILL.md
./.claude/skills/copilot-web-fetch/SKILL.md
./.claude/skills/copilot-web-search/SKILL.md
./.claude/skills/copilot-youtube-transcript/SKILL.md
./.claude/skills/distill-note.md
./.claude/skills/ingest-clipping.md
./.claude/skills/lint-claude-layer.md
./.claude/skills/openartifacts-publish/SKILL.md
./.claude/skills/openartifacts-publish/themes/research-memo.md
./.claude/skills/organize-csci2033.md
./.claude/skills/today.md
./.claude/skills/trace-topic.md
./.claude/skills/weekly-review.md
./.kiro/specs/claude-code-ops-layer/design.md
./.kiro/specs/claude-code-ops-layer/requirements.md
./.kiro/specs/claude-code-ops-layer/tasks.md
./.kiro/specs/pkm-capability-engine/design.md
./.kiro/specs/pkm-capability-engine/requirements.md
./.kiro/specs/pkm-capability-engine/tasks.md
./.kiro/steering/human-writing.md
./.kiro/steering/styling.md
./.kiro/steering/workspace-context.md
./00_Live/Books/Psycho-Cybernetics.md
./00_Live/Enumerate/Daily/19-10-2026.md
./00_Live/Enumerate/Daily/25-10-2026.md
./00_Live/Enumerate/Weekly/2026-W44.md
./00_Live/Headway/Bits and pieces/Re-Program Myself.md
./00_Live/Life OS.md
./00_Live/Tracking/Plans/Summer Grind.md
./20_Progress/Mentorship Program/Ahnaf/Meetings/Mentor Meeting Playbook.md
./20_Progress/Mentorship Program/Ahnaf/Mentor Meeting - Hackathons, Summer, and Networking.md
./20_Progress/Mentorship Program/Ahnaf/Mentor Meeting - One-Pager.md
./20_Progress/Mentorship Program/Jesse/Mentor Details.md
./20_Progress/Mentorship Program/Mentorship Board.md
./20_Progress/Mentorship Program/Plan.md
./20_Progress/Projects/CS/Arc (Learning Tracker).md
./20_Progress/Projects/CS/Hackathons/AIIS MedTech Hackathon.md
./20_Progress/Projects/CS/Hackathons/Opspilot.md
./20_Progress/Projects/CS/Hackathons/Resq.md
./20_Progress/Projects/CS/Portfolio.md
./20_Progress/Projects/Extra/Cleaning Laptop.md
./40_Resources/CS/Concepts/Cheat Sheet's & Notes.md
./40_Resources/CS/Concepts/Git & GitHub.md
./40_Resources/Obsidian/Dashboards/Prompts.md
./50_Archive/copilot/copilot-conversations/Mentorship_Program_Goal_Planning@20260330_114034.md
./50_Archive/copilot/copilot-conversations/Mentor_Meeting_Discussion_Topics@20260427_105321.md
./60_Jarvis/30_AI_Information/How to Use Claude/How to Use Google Calendar.md
./60_Jarvis/50_Reviews/Dashboard/Daily Review System.md
./60_Jarvis/50_Reviews/Dashboard/Monthly Review Board.md
./60_Jarvis/50_Reviews/Dashboard/Weekly Review Board.md
./copilot/skills/copilot-fetch-x/SKILL.md
./copilot/skills/copilot-web-fetch/SKILL.md
./copilot/skills/copilot-web-search/SKILL.md
./copilot/skills/copilot-youtube-transcript/SKILL.md
---
./.kiro/specs/claude-code-ops-layer/requirements.md
./20_Progress/Projects/AI Second Brain/AI Workflow.md
./30_Order/Workflows/Agentic OS/Agentic OS.md
./30_Order/Workflows/Agentic OS/How to Use Agents.md
./30_Order/Workflows/Jarvis Move.md
./40_Resources/CS/AI/Gen AI Day - 2.md
./50_Archive/copilot/copilot-conversations/AI_Second_Brain_Vault_Structure@20260423_203909.md
./50_Archive/copilot/copilot-conversations/Mentorship_Program_Goal_Planning@20260330_114034.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/60_Jarvis/50_Reviews/Dashboard" && ls -la --time-style=long-iso; wc -c *; cat "Daily Review System.md"
```
```
total 8
drwxr-xr-x 1 anant 197609 0 2026-10-25 20:08 .
drwxr-xr-x 1 anant 197609 0 2026-10-13 15:23 ..
-rw-r--r-- 1 anant 197609 0 2026-10-25 20:08 Daily Review System.md
drwxr-xr-x 1 anant 197609 0 2026-10-25 20:07 Monthly
-rw-r--r-- 1 anant 197609 0 2026-10-25 20:08 Monthly Review Board.md
drwxr-xr-x 1 anant 197609 0 2026-10-25 20:07 Weekly
-rw-r--r-- 1 anant 197609 0 2026-10-25 20:08 Weekly Review Board.md
      0 Daily Review System.md
wc: Monthly: Is a directory
      0 Monthly
      0 Monthly Review Board.md
wc: Weekly: Is a directory
      0 Weekly
      0 Weekly Review Board.md
      0 total
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -n "^#" "40_Resources/Obsidian/Dashboards/Prompts.md"; git log -3 --format='%h %ad' --date=iso -- "40_Resources/Obsidian/Dashboards/Prompts.md"; echo ---; cat "00_Live/Enumerate/Weekly/2026-W44.md"; echo ---; cat "30_Order/Workflows/Agentic OS/Agentic OS.md"
```
````
23:# Prompts
34:## How to run
42:## How these follow the Sonnet 5.5 guide
54:## Shared instructions
82:## Session 1: Plans
112:## Session 2: Automation
146:## Notes on the design of these two prompts
b26def3 2026-10-16 21:02:24 -0500
0b995c5 2026-10-16 21:01:48 -0500
176de70 2026-10-14 15:53:02 -0500
---
---
type: thought
thought_kind: reflection
status: seed
created: 2026-10-25
related_progress:
tags:
  - thought
  - brainstorm
next:
---
# 52 Weeks
> [!NOTE] **Summary**: 
## Goals

## Productivity 

## Good habits 

## Bad habits 

## Fixes

# Check-in
> [!QUESTION] Rate yourself on focus, health, discipline, and connection: Where did I abandon myself this week? Where did I show up?

Focus: 
Discipline:
Connection:

## Review Log

%% Written by /weekly-review, one "### YYYY-Www" entry per week. Do not edit the heading. Format: 30_Order/Standards/Dashboards/Weekly Review. %%
---
---
type: evergreen
status: seed
created: 2026-10-13
tags:
  - workflow
  - agentic-os
notes:
  - "[[Agentic OS Standard]]"
  - "[[How to Use Skills]]"
  - "[[How to Use Agents]]"
  - "[[How to Use Plugins]]"
  - "[[Hook Standard]]"
  - "[[Daily Dashboard]]"
  - "[[Run Weekly Review]]"
  - "[[Run Monthly Review]]"
  - "[[Jarvis Move]]"
  - "[[Scheduled Review]]"
  - "[[Reference - plan-cli]]"
  - "[[Spec - AI Loop]]"
next: "Run the full loop on one real day and record what broke under 60_Jarvis/50_Reviews/Agentic OS"
---
# Agentic OS

Start here for the assistant tooling of The Plan. This note is the map and the routines that tie the parts together. The rules are in [[Agentic OS Standard]]. Each part has its own how-to: [[How to Use Skills]], [[How to Use Agents]], [[How to Use Plugins]]. The hooks are in [[Hook Standard]].

## The loop in one picture

```
daily note  --read-->  plan-cli (engine)  --JSON-->  skill  --asks you-->  one write
     ^                      |                           |
     |                      +--JSON--> agent (reports, never writes)
     +-- dashboard tick (one checkbox)        hooks guard Claude's writes and reads
```

The daily note is the only source of truth. The engine turns it into numbers. A skill shows you the numbers and one exact write, and you say yes or no. An agent can read the same numbers and report on them. Hooks stop Claude from writing in forbidden places and from reading secrets.

## What exists today

| Part | State on 2026-10-13 |
|---|---|
| Engine `plan-cli` | Built, tested, deployed to `30_Order/System/plan-cli/` |
| Skills (5) | Written and dry-run. `startday` ran live and headless. The other four are not run live |
| Agents | All four loaded. `daily-auditor` and `vault-curator` were called live and are read-only |
| Hooks (3) | Registered and verified live on 2026-10-13 |
| Dashboard plugin | Built, installed and redeployed on 2026-10-13. Phone untested |
| Scheduling | None. Every review is manual ([[Scheduled Review]]) |

Do not rely on a part that is not "built" in this table. The exact status and tests are in each reference note.

## The routines

| When | You run | What happens | Detail |
|---|---|---|---|
| Morning | `/startday` | Shows streak, open actions, missing targets. Writes nothing unless you supply a target | [[Daily Dashboard]] |
| During the day | Tick in the dashboard | One checkbox character changes | [[Reference - the-plan-dashboard]] |
| Evening | `/closeday` | Causes for misses, up to five next actions, tomorrow's note | [[Daily Dashboard]] |
| After a close | `daily-auditor` agent, optional | Checks the note against the schema | [[How to Use Agents]] |
| End of week | `/weekly-review` | One Review Log entry in the Weekly note | [[Run Weekly Review]] |
| 1st of the month | `/monthly-review` | One Review Log entry in the Monthly note | [[Run Monthly Review]] |
| When Jarvis has something | `/jarvis-dump`, then the review | Unreviewed copies in `60_Jarvis/10_Promoted_Notes/` | [[Jarvis Move]] |
| Before a decision | `skeptic` agent | Tests the plan | [[How to Use Agents]] |

## Hooks in daily use

When registered, the hooks run without being called. You will see three effects.

- A write to `50_Archive`, `.obsidian`, the vault root, or the Jarvis vault is refused with a reason. Say which folder you actually want, or tell Claude to stop.
- A read of an env file, key or credential file is refused. Nothing you can approve overrides this for Claude.
- After Claude writes a daily note, a message lists any breach of the six rules. Fix it yourself or ask Claude to. The hook never fixes a note.

The registration is in [[Hook Standard]].

## Updating the engine

The engine's source is the plugin repository `D:\_Anant\20_Progress\Projects\the-plan-dashboard`. Run these there.

1. `npm test` builds the CLI and runs every test. Set `PLAN_PYTHON`, `PLAN_STREAK_PY` and `PLAN_STREAK_FIXTURES` first, or the parity tests are skipped and the result says so.
2. `npm run build:cli`, then `npm run deploy:cli -- "<vault>/30_Order/System/plan-cli"`.
3. Confirm the vault copy equals `dist/plan-cli.cjs`.
4. To update the dashboard itself, `npm run build` and copy the three built files into `.obsidian/plugins/the-plan-dashboard/`. That folder is under `.obsidian`, so ask first.

Never edit `plan-cli.cjs` in the vault by hand.

## Toolkit audit

Use the checklist in [[Agentic OS Standard]]. Run it after any change, and with the monthly review. Save the result under `60_Jarvis/50_Reviews/Agentic OS/` only if you want it kept.

## If something goes wrong

| Problem | What to do |
|---|---|
| A skill says the engine failed | Run the same command by hand from the vault root and read the error. Check `node --version` and that `30_Order/System/plan-cli/plan-cli.cjs` exists |
| A skill's numbers look wrong | Compare with `streak.py --today <date>` in 30_Order/System/streak, run as `PYTHONDONTWRITEBYTECODE=1 uv run --python 3.14 python streak.py --today <date>`. They must match. If they do not, stop and report it, because the engine and the script disagree |
| A command is not listed after typing `/` | Restart the Claude Code session. The skills are new and have not been loaded live |
| A hook blocks something it should not | Read the reason. If the rule is wrong, change it in the plugin repository and redeploy. Do not disable the hook silently |
| A hook seems silent | It may not be registered. Check `.claude/settings.json` |
| The vault copy of the engine is missing on a second laptop | It is ignored by git and may not sync. Deploy it there with `npm run deploy:cli` |
| A tool you expect is missing | It may not be built. Check the table above |

## Not built

Scheduled or unattended runs, the rearranging of a frozen month, the next-month skeleton, task intake from other apps, and any Monthly or review view in the dashboard. See [[Spec - Automation Layers]].
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git diff --stat 176de70 HEAD -- "40_Resources/Obsidian/Dashboards" "30_Order" AGENTS.md CLAUDE.md "60_Jarvis" | tail -30; echo; git show 176de70:"40_Resources/Obsidian/Dashboards/Prompts.md" | grep -n "^#"
```
```
 30_Order/System/plan-cli/plan-cli.cjs              | 1058 --------------------
 .../Dashboards/Research - Platform Facts.md        |  239 -----
 60_Jarvis/50_Reviews/Dashboard/Untitled.md         |    0
 3 files changed, 1297 deletions(-)

23:# Prompts
34:## How to run
42:## How these follow the Sonnet 5.5 guide
54:## Shared instructions
82:## Session 1: Plans
112:## Session 2: Automation
146:## Notes on the design of these two prompts
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git diff --stat=200 176de70 HEAD | grep "Platform Facts"; find . -name "Research - Platform Facts*" -not -path "./.git/*"; sed -n 1,160p "40_Resources/Obsidian/Dashboards/Prompts.md"
```
````
 40_Resources/{Obsidian/Dashboards => }/Research - Platform Facts.md                               |    0
./40_Resources/Research - Platform Facts.md
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - prompts
  - planning
  - automation
notes:
  - "[[Dashboards Hub]]"
  - "[[Decisions Log]]"
  - "[[Build Plan]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Spec - Home and Monthly Dashboards]]"
  - "[[Spec - AI Loop]]"
  - "[[Spec - Automation Layers]]"
  - "[[Research - Platform Facts]]"
  - "[[Agentic OS]]"
  - "[[Sonnet 5.5 Prompt Rules]]"
next: "Run Session 1 (Plans) first, then Session 2 (Automation). Each is a fresh Sonnet 5.5 session at high effort."
---
# Prompts

Two brainstorming sessions. They design; they do not build. The previous contents of this note (R1, B1 to B8, A1) were removed on 2026-10-14 because the plugin, engine, skills, agents and hooks they described now exist.

| Session | Job | Writes |
|---|---|---|
| 1. Plans | Decide every plan, what comes across from Jarvis, and the line between personal and career plans | A set of design notes in `40_Resources/Obsidian/Dashboards/Plans Design/` |
| 2. Automation | Map every daily, weekly and monthly automation step, and the ways each one fails | A set of design notes in `40_Resources/Obsidian/Dashboards/Automation Design/` |

Run order: Session 1, then Session 2. Session 2 reads what Session 1 wrote, because the automations carry the plans.

## How to run

1. Open a fresh session from the vault root, `D:\_Anant\20_Progress\Documents\The Plan`. Model Sonnet 5.5, effort high, set in the session settings and not in the text.
2. For Session 1, run `/add-dir D:\_Anant\20_Progress\Documents\Jarvis` once so the session can read the Jarvis vault. Reads only. The write guard already refuses writes there.
3. Paste the Shared instructions, then one session prompt.
4. Both sessions are conversations. Expect them to stop and ask you things. That is the point. Answer in short lines. Say "your call" to accept the recommendation the session gave with each question.
5. Nothing is written until the session shows the list of notes it will write and you say yes.

## How these follow the Sonnet 5.5 guide

Source: [Prompting Claude Sonnet 5.5](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/[REDACTED]), applied as in [[Sonnet 5.5 Prompt Rules]].

- **Plain paragraphs, goal first, no tags.** The guide gives no structure rules, so the prompts use ordinary prose.
- **The guide's "keep working" and "stop and report" lines are kept but adapted.** In a brainstorm the decisions belong to Anant, so the stop condition is "stop at a decision point", and the done condition is "the notes are written and checked".
- **"When the user asks for ideas, options or a plan, give them that and stop."** This is the guide's rule for open requests. Here it is used on purpose: the sessions give options with a recommendation and stop for the answer. They do not start building.
- **No instruction to think less, no ban on tools, no extra reviewer rounds.** The one named exception: the `skeptic` agent is requested by name at set points, because Anant asked for plans to be tested against failure.
- **Search for specifics that may have changed.** Named per session.
- **Real verification.** For notes, the check is the link and em dash scan and a re-read against the inputs. For any number, the check is the engine.
- **Progress lines.** One line before the first tool call, a recap at the end of each phase.

## Shared instructions

Paste first in both sessions.

```text
You are working in The Plan, Anant's personal Obsidian vault at D:\_Anant\20_Progress\Documents\The Plan. Start by reading AGENTS.md and CLAUDE.md, then 40_Resources/Obsidian/Dashboards/Dashboards Hub.md, then the notes the session prompt names. Where two notes conflict, the newer instruction wins; report the conflict instead of choosing silently.

This is a design session, not a build. You will research, discuss, and write notes. You will not write code, change the engine, plugin, skills, agents, hooks or settings, create scheduled tasks, create calendar events, send messages, or call any connector in write mode. The only files you may write are the design notes the session prompt lists, and only after Anant has approved the list.

Work in topics. For each topic, give the evidence you found with its source, then the options with one clear recommendation, then how the recommendation fails, then the few questions that change the design. Then stop and wait for Anant's answer. Do not stop earlier than that, and do not ask a question that the vault, the engine or a search can answer. Ask questions in a batch per phase, at most five, each with your recommended answer next to it. Give a recommendation, not an exhaustive survey.

Failure is the point of these sessions. For every plan, rule and automation, find how it breaks on a bad day: a missed day, an illness, an exam week, a travel day, a laptop that is off, a sync conflict, a duplicated task, a stale number. Record each as a failure with its trigger, its effect, what Anant would notice, and the smallest fix. A design with no recorded failure is not finished. The skeptic agent exists for this: at the points the prompt names, run the engine or read the notes yourself, pass the material to skeptic in the request, and bring its challenges into the discussion. Do not launch other agents and do not start extra review rounds.

Keep working through the phases until every topic is decided or explicitly parked, and only stop to ask at a decision point or before a risky step. Risky steps are renaming or moving notes, deleting anything, editing AGENTS.md or CLAUDE.md, touching .obsidian, using an outside service, and writing any note. For those, show exactly what you will do and wait for a yes.

When the notes are written and checked, stop and report. Do not add notes, folders, tests, tooling or refactors that were not listed. If you think one would help, mention it at the end.

Numbers come from the engine. Run node 30_Order/System/plan-cli/plan-cli.cjs from the vault root, one command per call, and never compute a streak, percent, grade or cause count yourself.

Use search and the official documentation to check specifics that may have changed since your training, even when you feel confident, and cite the page and the date you read it. Mark every claim you could not confirm as unconfirmed. Do not present a guess as a fact.

Rules for this vault: never use an em dash; write complete sentences; no praise and no guilt. Never read or print secret files (.env files, keys, tokens, credentials) and do not open the data.json of copilot, quickadd, readwise or local-rest-api. Do not read or write 50_Archive. Never create a directory named .agents. Search before creating a note. Preserve frontmatter and wikilinks. Check that every wikilink target exists before writing it. Propose changes to any note with status tree instead of making them. Keep personal writing in Anant's own words and quote it instead of paraphrasing where meaning matters.

Before the first tool call, write one line saying what you are about to do. At the end of each phase, write a short recap and the open decisions.

End with a report: notes written, checks run and their results, decisions made, decisions parked, failures recorded, and anything unverified.
```

## Session 1: Plans

Model Sonnet 5.5, effort high. Writes only after approval, into `40_Resources/Obsidian/Dashboards/Plans Design/`. Needs `/add-dir` for the Jarvis vault.

```text
Goal: by the end of this session every plan in Anant's life has a decided home, a decided owner (The Plan or Jarvis), a decided shape, and a recorded way it fails, and the plans are written down in a set of design notes. The session ends when those notes are written and checked, not before.

Read first, in this order: Dashboards Hub, Decisions Log (all rows, especially 31 to 50), Spec - Streak and Daily Note, Spec - Home and Monthly Dashboards (the Month plan and goals section), Spec - Automation Layers, 30_Order/Standards/Dashboards/Daily Note Schema.md and Streak Rule.md, 30_Order/Workflows/Daily Dashboard.md, 30_Order/Workflows/Jarvis Move.md and 30_Order/Workflows/Agentic OS/Agentic OS.md. Then, read only, the plan material in The Plan: 00_Live/Tracking/Plans, 00_Live/Tracking/Habits, 00_Live/Enumerate (Yearly, Monthly, Weekly, and the last 14 daily notes), 00_Live/Life OS.md, 00_Live/Monthly Dashboard.md, 00_Live/Career, 00_Live/Headway and 00_Live/Health & Life. Then, read only, the plan material in the Jarvis vault at D:\_Anant\20_Progress\Documents\Jarvis: 10_Areas/Life/Plans (Plans Board, Plans-to-Create, Fall 2026, Summer 2026, 2025, Zero-Cost AI Stack), 10_Areas/Summer Grind.md, 10_Areas/Career, 20_Progress (Internship, Degree, Mentorship Program, Projects, AI) and 30_Order/00_How This Folder Works.md. Skip 50_Archive, .stversions, 60_Claude/05_Clippings and any hidden folder in both vaults. If a path above does not exist, say so and continue.

Phase 1, inventory. Build one table of every plan, goal, habit set, routine and recurring commitment you found, in both vaults. For each: where it lives, what it is for, its horizon (year, term, month, week, day), its last edit date, its status (live, stale, finished, duplicate), and its owner today. Do not judge yet. Show the table and the five or fewer questions that you cannot answer from the vault. Typical ones: the term end dates, which stale plans are finished, and whether a plan I could not classify is personal or career.

Phase 2, personal versus career. This is the main decision of the session. AGENTS.md says Jarvis is the parent working vault and The Plan is its polished personal layer, and decision 45 removed the career-operator agent because Jarvis owns career work. Propose the exact boundary: which career content must exist in The Plan (the daily career line, the month and term outcomes, the numbers the dashboard needs) and which stays only in Jarvis (research, pipelines, project briefs, clippings). Do the same for personal plans: fitness, morning routine, mind, study, health and lungs, books and Headway, relationships, finance. For every plan decide one of: bring across by copy through the jarvis-dump contract (copy, never move, Jarvis unchanged, one approval per batch), link to it from The Plan and leave it in Jarvis, rewrite it fresh in The Plan, or retire it. Give a reason for each. Explain why a plan that lives in two places will drift, and make single ownership the rule.

Phase 3, the plan model. Design what a plan is in this system, once, so every plan has the same shape. Cover: the levels and how they nest (year, term or season, month, week, day) and which level owns which kind of decision; the fields every plan needs (outcome in one sentence, why, measure, deadline, cadence, the daily action it produces, the risks, the anti-drift rule, the review date); how a plan turns into the Targets section of the daily note, the one career line and the study topic, so planning feeds the daily note without a second copy of anything; how a plan's progress is measured, and which of those numbers come from the engine and which cannot (and so must be Anant's own entry); how plans change (a dated change entry with the reason, so history survives and drift is visible); and how a finished or failed plan is closed. Also settle the items still open in Spec - Streak and Daily Note and Decisions Log: whether the 80/20 lines become the Targets section, the exact action lines for the five categories (time, place, identity phrase), and what the milestone titles do on the dashboard. Run the skeptic agent on the model after you have shown it, and discuss its challenges.

Phase 4, personal plans in detail. For each personal plan, go through it with Anant until it is specific enough to run on a day with no motivation: the trigger, the smallest version, the full version, what counts as done for the five-category rule, and what the plan does on a bad day. Use the plans Anant already wrote as the starting point and quote them. Where a plan is vague, say exactly what is missing.

Phase 5, career plans in detail. Do the same for career: software engineering and internship search, LeetCode and CodePath, finance, mentors, UROP, the Fall 2026 courses, and the entrepreneurship minor if it is live. Decide for each what the daily career line looks like, how the week and the month hold it, and what number would show it is working. Keep the parts that belong to Jarvis in Jarvis and write down exactly what crosses the boundary and in which direction, and when.

Phase 6, break it. Run a pre-mortem on the whole plan set. Take at least these cases: a missed day, two missed days, a week of illness, an exam week, a travel week, the term ending, a plan that conflicts with another in the same time slot, too many live plans for the number of hours in a day, and a plan that Anant stops reading. For each, say what the streak rule does, what the dashboard shows, what the weekly review would catch, and what is not caught. Write the failures into a register with trigger, effect, signal, smallest fix, and the review step that would find it. Then design the daily strengthening loop: after each day, how the cause tags and the notes become a change to a plan, who approves the change, and where it is recorded. Run the skeptic agent on the register and bring its challenges back.

Phase 7, write. Show the list of notes you will write, with a one-line purpose for each, and wait for a yes. The expected set, which you may adjust with a reason: Plans Hub (index and status of every plan), Plan Model, Plan Inventory (the Phase 1 table, kept current), Personal Plans, Career Plans, Boundary and Jarvis Transfer Map (every item, its decision and its reason), Plans to Daily Note (how targets are produced), Plan Failure Register, Open Decisions. After the yes, create the folder Plans Design and write the notes. Each note gets the vault's standard frontmatter, links to the notes it depends on, and a next line. Then propose, but do not apply, the rows to add to Decisions Log and the lines to change in Dashboards Hub. Show them and wait.

Questions you may ask: only the batches in Phases 1 to 6, the approval for the note list, and the approval for any copy or edit. Do not ask for permission to read, to search, or to run the engine.

Out of scope: copying anything from Jarvis, editing any plan note that already exists, changing the daily template, skills, agents, hooks, engine or dashboard, building the Monthly view, creating reminders or calendar events, and any task intake from another app. Those belong to Session 2 or to later builds.

Check before you report: scan every note you wrote for em dashes; confirm every wikilink target exists; confirm every file path you cite exists; confirm each decision in your report appears in a note; and re-read the Transfer Map against the inventory to confirm that no plan is missing from it. State what you could not check.
```

## Session 2: Automation

Model Sonnet 5.5, effort high. Writes only after approval, into `40_Resources/Obsidian/Dashboards/Automation Design/`. Run after Session 1.

```text
Goal: by the end of this session every automatic step of the daily, weekly and monthly practice is mapped as a design: what starts it, what it reads, what it writes, who approves, how it fails, and how Anant would notice. The design is written in a set of notes and is specific enough that a later build session can implement it without guessing. The session ends when those notes are written and checked, not before.

Read first, in this order: Dashboards Hub, Decisions Log (all rows), Spec - Automation Layers, Spec - AI Loop (including the 2026-10-13 update), Research - Platform Facts (the transport findings are already there, so use them and verify again only what is dated or marked partly confirmed), 30_Order/Workflows/Agentic OS/Agentic OS.md and its sibling notes, 30_Order/Workflows/Daily Dashboard.md, Run Weekly Review.md, Run Monthly Review.md and Jarvis Move.md, 30_Order/Standards/Dashboards/ (Daily Note Schema, Streak Rule, Weekly Review, Monthly Review, Scheduled Review), 30_Order/Standards/Agentic OS/, the five skills and four agents in .claude, .claude/settings.json (hooks only), and 30_Order/System/git-sync/plan-git-sync.ps1. Do not open any other settings file. Then read the notes Session 1 wrote in 40_Resources/Obsidian/Dashboards/Plans Design. If that folder does not exist, say so and ask Anant whether to continue without it. Do not invent its contents.

Phase 1, current state, verified. Build a table of every automation-related part and its real state: what is built, what ran live, what was only dry-run, what is unbuilt. Run the engine on the last 14 days and on one full recent week to see real output (streak, day, review). Run each skill's dry-run only through its documented dry-run form against the sample fixtures, and only if its note says it is safe. Do not trust a status line in a note that you can check. List every gap between what the notes claim and what you saw.

Phase 2, the daily practice, minute by minute. Map the whole day as a timeline from waking to the midnight rollover: when the day plan appears, what the morning start does, what Anant ticks and where, the time-anchored actions and what reminds him of each, the career line and study topic, the evening close, the creation of tomorrow's note, and what the dashboard shows at each point. For each step state: the trigger (manual, on open, scheduled), the actor (Anant, skill, hook, scheduled run), the read, the write, the approval, and the failure. Design the cases where the chain breaks: the close was never run, tomorrow's note does not exist at midnight, the phone ticked while the laptop edited, the note is malformed, the engine errors, or the date changed during a session. Decide what happens at each, using the streak rule as it is (a missing note is a MISS) and checking that the fix does not weaken it.

Phase 3, the outbound reminder path. Settle how time-anchored actions reach Anant's phone. Compare, with evidence, every real option for a Windows laptop whose notes reach the iPhone through Obsidian Sync: an iOS Shortcut, a Zapier action, a Todoist bridge, Obsidian notices and a plugin on the phone, calendar alarms, and doing nothing. For each: what it needs, what it costs, whether it works with the laptop off, the one write it makes, and how it fails. Decide the single owner for each type of task (Todoist, Apple Reminders, Google Calendar, the daily note) so that nothing is duplicated, as the risks section of Spec - Automation Layers requires. Search the current documentation for every option and cite it.

Phase 4, the weekly practice. Design the week from Sunday evening (or the day Anant chooses) to the next Monday: the inbound pull from Google Calendar, Todoist and the other sources named in the spec, how pulled items are shown (the Week section prefill) without creating a second task list, the weekly review and its grade (decision 37), the carryover rule, and the hand-off to the plans. Say what runs by hand, what could be scheduled, and what must never run unattended. Check first, with a read-only call and the single permitted listing, which account the calendar connector is attached to, and report only what the listing says. Run the skeptic agent on the weekly design.

Phase 5, the monthly practice. Design the first of the month as a sequence of numbered steps with a clear success condition for each: the recap, lock-in and streak status, the frozen monthly recap with static values, the next month's plan skeleton from the plans, the request for the Jarvis snapshot (decision 42), and the lost-days and forgiven-days count. Resolve the archive conflict recorded in Spec - Automation Layers, where the daily notes cannot go to 50_Archive without breaking the streak. State what the frozen recap contains and how it is made immutable, and how a mistake in it is corrected. Also settle the Monthly and review views that the dashboard does not yet have: only what data they need and from where, since the screens belong to a later build.

Phase 6, scheduling and transport. Settle how any job runs without Anant starting it. Cover running Claude Code headless on Windows from Task Scheduler, the permissions a headless run needs and how to keep them narrow, how a scheduled job knows the laptop was asleep and catches up, how it logs, how it avoids running twice, how it stays inside the write guard, how Obsidian Sync and the git auto-sync stay out of each other's way, and the kill switch. Decide for each automation whether it should be manual, a one-tap prompt, or scheduled, and give the reason. The default is manual until the manual version has run clean for two weeks. Check the current Claude Code documentation for headless mode, permissions and scheduling, and cite it.

Phase 7, break it. Run a game day on paper. Take the whole design and fail it on purpose: laptop off for two days, sync conflict on today's note, Zapier or the calendar token expired, a connector returns wrong dates, daylight saving change, a duplicated reminder, a skill writing the wrong section, a scheduled run that edits a note Anant is editing, a monthly close run twice, a month with no notes, and a phone-only day. For each, write the trigger, the effect, what Anant sees, how it is detected, and the smallest fix. Then design the daily strengthening loop: at the end of each day or week, what is recorded about what broke, where (the Agentic OS review location is 60_Jarvis/50_Reviews/Agentic OS), how a break becomes a design change, who approves, and how the change is dated so the history shows the system getting stronger. Run the skeptic agent on the failure register and bring its challenges back to Anant.

Phase 8, build order. Do not build. Write the order in which a later session should implement the design, in small stages, each with its gate: the check that proves the stage works before the next starts, and the rollback. The first stages are the manual, one-tap versions. Scheduling comes last.

Phase 9, write. Show the list of notes you will write, with a one-line purpose for each, and wait for a yes. The expected set, which you may adjust with a reason: Automation Hub (index and status), Daily Automation, Weekly Automation, Monthly Automation, Reminder and Transport Decision, Scheduling and Permissions, Automation Failure Register and Game Days, Strengthening Loop, Build Order and Gates, Open Decisions. After the yes, create the folder Automation Design and write the notes, each with the vault's standard frontmatter, links and a next line. Then propose, but do not apply, the rows to add to Decisions Log, the lines to change in Spec - Automation Layers and Agentic OS, and any change to the .gitignore that the engine copy or hooks would need. Show them and wait.

Questions you may ask: only the batches in Phases 2 to 8, the approval for the note list, and the approval for the connector listing. Do not ask for permission to read, to search, or to run the engine.

Out of scope: building anything, creating or editing scheduled tasks, calendar events, reminders, Shortcuts or Zaps, changing skills, agents, hooks, engine, plugin or settings, sending any message, reading Todoist or Zapier data beyond what a read-only listing needs, and any change to the dashboard screens.

Check before you report: scan every note you wrote for em dashes; confirm every wikilink target exists; confirm every file, command and setting you cite exists as written; confirm every number came from the engine; confirm each decision in your report appears in a note; and confirm that every automation in the notes has a recorded failure. State what you could not check.
```

## Notes on the design of these two prompts

- Session 1 has seven phases and Session 2 has nine. Each phase ends at a decision point, so the session moves at the speed of Anant's answers and does not run ahead.
- The reading lists name real paths. A path that does not exist is reported and skipped, so a missing note does not stop the session.
- Writes are allowed only into two new folders, created after the note list is approved. This fits the AGENTS.md rule against speculative folders: the folders are named in the prompt, and the session still asks.
- Changes to Decisions Log, Dashboards Hub, Spec - Automation Layers and Agentic OS are proposed and never applied inside these sessions.
- The reminder transport, the scheduling route and the Jarvis boundary are the three decisions most likely to change the design. Each has its own phase.
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents" && ls "The Plan/40_Resources/Obsidian/Dashboards/"; echo ---; ls Jarvis; ls Jarvis/.claude/skills Jarvis/.claude/agents 2>&1; find Jarvis -maxdepth 3 -iname "*daily*" -not -path "*/.git/*" -not -path "*/50_Archive/*" -not -path "*/.stversions/*" | head -30
```
```
Audit - Dashboard Stack and Phone Checklist.md
Build Plan.md
Daily
Dashboard Build
Dashboards Hub.md
Decisions Log.md
Prompts.md
Research - Jarvis Dashboard Findings.md
Spec - AI Loop.md
Spec - Automation Layers.md
Spec - Home and Monthly Dashboards.md
Spec - Streak and Daily Note.md
---
00_Dashboard.md
10_Areas
20_Progress
30_Order
40_Resources
50_Archive
60_Claude
AGENTS.md
CLAUDE.md
HUMAN_WRITING.md
Tracker
Untitled.base
__pycache__
blobs
copilot
wa1_template.tex
Jarvis/.claude/agents:
anti-slop-editor.md
career-operator.md
daily-operator.md
human-operator.md
ingestion.md
learning-agent.md
llm-council.md
note-to-actions.md
professor.md
research-distiller.md
vault-curator.md

Jarvis/.claude/skills:
challenge
class-csci4041
closeday
copilot-fetch-x
copilot-read-pdf
copilot-web-fetch
copilot-web-search
copilot-youtube-transcript
distill-note
ideas
ingesting-clipping
json-canvas
llm-council
mcp-hub
mentorship
note-to-actions
obsidian-bases
obsidian-cli
obsidian-markdown
openartifacts-publish
ops
plan-it
project-career
remove-ai-slop
startday
tag-monthly
trace-goal
transcript-to-brief
weekly-review
Jarvis/.claude/agents/daily-operator.md
Jarvis/.codex/agents/daily-operator.toml
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents" && ls -laR --time-style=long-iso "The Plan/40_Resources/Obsidian/Dashboards/Daily"; echo ---; ls -la --time-style=long-iso Jarvis/.claude/skills/startday Jarvis/.claude/skills/closeday Jarvis/.claude/skills/plan-it; cat Jarvis/.claude/skills/startday/SKILL.md
```
```
The Plan/40_Resources/Obsidian/Dashboards/Daily:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-12 20:43 .
drwxr-xr-x 1 anant 197609 0 2026-10-15 16:13 ..
---
Jarvis/.claude/skills/closeday:
total 12
drwxr-xr-x 1 anant 197609    0 2026-09-19 16:33 .
drwxr-xr-x 1 anant 197609    0 2026-09-20 14:03 ..
-rw-r--r-- 1 anant 197609 3402 2026-09-15 18:38 SKILL.md
-rw-r--r-- 1 anant 197609 2103 2026-09-15 18:38 reference.md

Jarvis/.claude/skills/plan-it:
total 8
drwxr-xr-x 1 anant 197609    0 2026-09-19 16:08 .
drwxr-xr-x 1 anant 197609    0 2026-09-20 14:03 ..
-rw-r--r-- 1 anant 197609 4596 2026-07-29 04:22 strategy.md

Jarvis/.claude/skills/startday:
total 12
drwxr-xr-x 1 anant 197609    0 2026-09-19 16:23 .
drwxr-xr-x 1 anant 197609    0 2026-09-20 14:03 ..
-rw-r--r-- 1 anant 197609 4186 2026-09-07 12:27 SKILL.md
-rw-r--r-- 1 anant 197609 3065 2026-09-15 18:45 reference.md
---
name: starting-day
description: Fills today's periodic note with a concrete work plan pulled from the Fall 2026 plan, session history, and habit board, then patches the dashboard's Today's Focus. Use at the start of each working day, after the daily note exists (or to create it from the template).
---
# startday

**Usage:** `/startday`

Deep detail — exact patch formats, table shapes, output template — lives in [reference.md](reference.md). This file is the step sequence; load reference.md when actually patching.

## When to Invoke

At the start of the day. The Periodic Notes plugin normally creates today's note at `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`; this skill fills it and updates `00_Dashboard.md`.

## Instructions

### Step 0 — Find Today's Note

Locate `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md` (today's date).

- Exists → Step 1.
- Missing → create it from `30_Order/Templates/Enumerate/Better Today.md` (copy frontmatter and structure verbatim, resolve the `<% tp.date.now %>` placeholder to today's date), then Step 1.
- Template also missing → create the note with minimal frontmatter (`type: daily`, `created: YYYY-MM-DD`, `status: sprout`, `lc_count: 0`, `study_today: 0`, `wins_done: 0`, `habits_done: []`) and continue.

Never create it anywhere else. `60_Claude/30_Reviews/` is not the target.

### Step 1 — Read Plan Context

Read these files. No other reads. No vault dump.

| File | What to extract |
|------|-----------------|
| `10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing.md` | The one goal (internship offer) and what's mandatory vs. in-service, to arbitrate any conflict |
| `10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md` — Week by week table | This week's One Hard Thing (match this week's Monday date) |
| `10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md` — Systems table | The daily/weekly floor per track (application conversion, LeetCode/CodePath, system design, classes) for the 80/20 split |
| `10_Areas/Career/Internships/Tracker/Tracker.md` | Current researched-vs-applied count, for the application-floor number |
| `10_Areas/Life/Habits/` — find the file with a `## Daily` heading (currently `Habit Tracker Board.md`; don't hardcode the name, it has changed before) | Active daily habits |

If any file is missing, note it in the output and continue. The Summer 2026 plan folder (`10_Areas/Life/Plans/Summer 2026/`) is closed — do not read from it here.

### Step 2 — Read Session History

Read `60_Claude/07_AI_Information/Session Logs/log.md`. Take the 10 most recent `## [YYYY-MM-DD]` entries: sessions 1–5 in depth (done / left open / next actions), 6–10 headline only. Build a carryover list of items left open in 1–5 and not closed later.

### Step 3 — Patch the Daily Note

Patch `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md` by heading. Never overwrite frontmatter; never delete existing content. Exact per-heading formats: [reference.md §1](reference.md).

Sections to fill: summary callout, Morning Plan goal, 80 — The One Thing (this week's One Hard Thing or the application-floor system if no hard-thing action is due today), 20 — Supporting Work (class steps, club admin, other Systems-table tracks), deadline alert (if due ≤7 days, per the Fall 2026 Plan's Timeframe/Systems tables), carryover block (if any), anti-drift line (from `Anti-Drift Rules.md`), Productivity habit checkboxes.

### Step 3b — Patch the Dashboard

Patch `00_Dashboard.md` frontmatter only — no body edits, no other fields:

- `today_focus:` today's one-line headline objective
- `today_80:` the one task
- `today_20:` comma-separated supporting tasks

### Step 4 — Present the Plan

Output the compact summary block from [reference.md §2](reference.md), including the line `Dashboard updated: [[00_Dashboard]]`.

## Constraints

- Never create notes in `60_Claude/30_Reviews/` for the daily plan.
- Fill placeholders; never paste whole plan documents into the note.
- Leave room — `/closeday` appends an End of Day section later.
- If the Morning Plan is already filled, confirm with the user before overwriting.
- In Step 3b touch only the three named frontmatter fields.
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls 10_Areas/Life/Enumerate/Daily | tail -12; echo ---; f=$(ls 10_Areas/Life/Enumerate/Daily | grep 2026-10 | tail -1); echo "$f"; head -60 "10_Areas/Life/Enumerate/Daily/$f"; echo ---; sed -n 1,40p .claude/skills/closeday/SKILL.md
```
```
2026-08-10.md
2026-09-07.md
2026-09-08.md
2026-09-15.md
2026-09-19.md
2026-09-21.md
2026-09-28.md
2026-09-29.md
2026-10-01.md
2026-10-05.md
2026-10-12.md
2026-10-18.md
---
2026-10-18.md
---
type: thought
thought_kind: daily
status: active
day_state: planned
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - daily
notes: []
next:
win_project: false
win_career: false
win_cleanup: false
win_review: false
floor_1: false
floor_2: false
floor_3: false
lc_count: 0
study_today: 0
wins_done: 0
habits_done: []
---
# Did you get better today?
> [!NOTE] Summary:
## Morning Plan
<!-- Fill from the active plan: the goal, one 80 task, two to four 20 items, and the do-not list. -->
*Goal*:
### 80 — The One Thing
### 20 — Supporting Work
**Do NOT do today:**
## Daily Wins
<!-- Four rows. Targets come from the active plan; Done is a toggle. -->
| Win | Target | Done |
| --- | --- | --- |
| Project | | `INPUT[toggle:win_project]` |
| Career | | `INPUT[toggle:win_career]` |
| Cleanup | | `INPUT[toggle:win_cleanup]` |
| Review | | `INPUT[toggle:win_review]` |
## Daily Floor
<!-- Rows come from the active plan's Systems table. Never put the term in a heading. -->
| Track | Target | Topic | Done |
| --- | --- | --- | --- |
| | | | `INPUT[toggle:floor_1]` |
| | | | `INPUT[toggle:floor_2]` |
| | | | `INPUT[toggle:floor_3]` |
## Productivity
<!-- Optional record. Inputs bound to the frontmatter; habit checkboxes come from the active habit board. -->
**LeetCode today:** `INPUT[number:lc_count]`
**Study hours:** `INPUT[number:study_today]`
**Wins hit:** `INPUT[number:wins_done]` / 4
---
---
name: closing-day
description: Verifies today's plan was completed, collects the day's numbers in one question block, writes tracking frontmatter and the scorecard into the daily note, and resets the dashboard for tomorrow. Use at the end of each working day.
---
# closeday

**Usage:** `/closeday`

Deep detail — scorecard template, scoring rules, log format — lives in [reference.md](reference.md). This file is the step sequence; load reference.md when writing the scorecard.

## When to Invoke

At the end of the work day. Works on the daily note that `/startday` filled. The record stays in one place — no separate file is created.

## Instructions

### Step 0 — Find Today's Note

Locate `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md` (today's date).

- Exists with a Morning Plan → Step 1.
- Exists without one → ask: "No morning plan found for today. Did you run `/startday`? You can still close the day — I'll write the scorecard based on what I can find." Then proceed.
- Doesn't exist → inform the user, create it with frontmatter from `30_Order/Templates/Enumerate/Better Today.md`, proceed with whatever session data exists.

### Step 1 — Auto-Gather (before talking to the user)

Read, in this order:
- Today's entries in `60_Claude/07_AI_Information/Session Logs/log.md`
- The daily note's morning plan (Fall Daily Floor topics, Fall Daily Wins targets, carryover items)
- Files modified in `20_Progress/` today (modification time)
- Files created in `60_Claude/10_Source_Summaries/` today

### Step 2 — Ask the User (one block, all at once)

> Closing the day — quick check:
> 1. LeetCode/CodePath today: how many problems? (target ≥5)
> 2. Study hours today: total focused study time? (e.g., 2.5)
> 3. Which wins did you hit? (Project / Career / Cleanup / Review)
> 4. Habits done? (application-floor, leetcode-codepath, class-step, review-note)
> 5. Did a company actually move `Current/` → `Applied/` today?
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && head -12 "30_Order/Templates/Daily Dashboard/Daily Note.md"; grep -n "tp\.\|{{" "30_Order/Templates/Daily Dashboard/Daily Note.md" | head; echo ---; sed -n '/^# /,$p' "30_Order/Workflows/Daily Dashboard.md" | head -80; echo ---; grep -o '"[a-zA-Z_]*[Ff]older[a-zA-Z_]*": *"[^"]*"\|"enable_folder_templates": *[a-z]*\|"trigger_on_file_creation": *[a-z]*' .obsidian/plugins/templater-obsidian/data.json
```
```
---
type: daily
status: seed
created: <% tp.file.title %>
study_hours: 0
---
## Targets

%% The QuickAdd choice "Set tomorrow's career line" inserts the career line directly under this heading. %%
- Study topic: 

## Morning
4:created: <% tp.file.title %>
---
# Daily Dashboard

The daily loop: open the day, tick actions, close the day, and leave tomorrow's note ready. It is the only workflow that produces data. Every other workflow reads what this one writes.

The data rules are in [[Daily Note Schema]] and the scoring rules are in [[Streak Rule]]. Source: [[Spec - Streak and Daily Note]], [[Spec - Home and Monthly Dashboards]] and the two skills `startday` and `closeday` ([[Reference - startday]], [[Reference - closeday]]).

## Principles

1. The daily note is the only source of truth. The dashboard shows it and stores nothing.
2. Every dashboard number is computed from the daily notes by the engine, which is tested against the reference script ([[Streak Rule]], [[Reference - plan-cli]]).
3. Nothing is wiped at night. History survives.
4. The career line is one named task, written by Anant, never repeated automatically.
5. Plain, blunt text. No praise and no guilt.

## Parts

| Part | What it is | Where |
|---|---|---|
| Daily note | Today's record | `00_Live/Enumerate/Daily/YYYY-MM-DD.md` |
| Template | The skeleton for a new note | [[Daily Note]], in `30_Order/Templates/Daily Dashboard` |
| Home | Streak, ring, today's ticks, heatmap. The private plugin view is the dashboard ([[Reference - the-plan-dashboard]]). The older markdown page `00_Dashboard.md` was retired on 2026-10-14 (Decision 47). | `.obsidian/plugins/the-plan-dashboard/` |
| `/startday` | Shows targets and streak status | `.claude/skills/startday/` |
| `/closeday` | Scores the day, records misses, plans tomorrow | `.claude/skills/closeday/` |
| Engine `plan-cli` | The only source of streak numbers and checks. `streak.py` is its test oracle ([[Reference - streak script]]) | `30_Order/System/plan-cli/plan-cli.cjs` |
| QuickAdd choices | Phone shortcuts for the career line and a miss | [[QuickAdd Setup]] |

## The day at a glance

| When | Step | Tool | Result |
|---|---|---|---|
| Night before | Set tomorrow's career line and study topic | `/closeday` or QuickAdd | Tomorrow's note exists with its targets |
| Morning | Open the day | `/startday` | Targets checked, streak shown, gaps named |
| During the day | Tick actions as they are done | Home, or the note | Ticked boxes |
| During the day | Log study hours | The note's `study_hours` | One number |
| Evening | Close the day | `/closeday` | Misses, causes, next actions, tomorrow's note |

The date rolls over at midnight. A tick after midnight belongs to the new date.

## Steps

### 1. Night before: tomorrow's note

`/closeday` creates it, as step 4 below. If you are on the phone, run the QuickAdd choice "Set tomorrow's career line". It creates tomorrow's note from the template if it does not exist, and adds the career line under `## Targets`. Type the study topic into `- Study topic: ` by hand.

Write a career line that is one named task and differs from today's. A date with no note is a MISS, so tomorrow's note must exist before tomorrow.

### 2. Morning: `/startday`

1. Run `/startday`. It looks up today's note and asks before creating it if missing.
2. It runs the engine (`plan-cli streak` and `plan-cli day`) and shows `current_streak`, `best_streak`, today's category count, `at_risk` and `first_day` exactly as returned.
3. If `at_risk` is true you see "Streak breaks if today is not MET."
4. It flags a missing career line, a missing study topic, and a career line equal to yesterday's.
5. It lists the actions still unticked, per category.
6. For a missing target it asks for the text, shows the exact line it will write under `## Targets`, and waits for a yes.

It writes nothing else. It never ticks, never touches frontmatter, and never writes a streak number into a note.

### 3. During the day: tick and log

- Tick an action by changing `[ ]` to `[x]`, in the note or on Home. A category counts only when every action in it is ticked.
- Write the hours studied in the `study_hours` frontmatter value as a plain number.
- Do not reword a line to make a category easier. Changing the action list changes the streak and goes through [[Decisions Log]].
- A miss can be logged during the day with the QuickAdd choice "Log a miss". It appends `- [miss:: <category>] [cause:: <cause>]` under `## Evening close`. It does not change the score.

### 4. Evening: `/closeday`

1. Run `/closeday`. It stops if today's note is missing.
2. It runs the engine (`plan-cli streak` and `plan-cli day`) and shows the numbers. If `node` or the engine is missing, it stops, because the close depends on it.
3. It takes the missed categories from `day` and compares the done count with `today_categories_done` from `streak`. If the two differ it stops and reports both.
4. For each missed category it asks for one word: `sleep`, `no-plan`, `distracted`, `energy` or `other`. It accepts nothing else.
5. It proposes at most five next actions, or takes your list. Each ends with one of `[type:: streak]`, `[type:: career]`, `[type:: gym]`, `[type:: failure]`. The engine's `repeat` command checks them: repeats from yesterday, duplicates and anything past five are rejected with the rule named.
6. It asks for tomorrow's career line and study topic. The career line must differ from today's.
7. It shows every planned write (path, heading, lines) and waits for a yes.
8. It writes today's `## Evening close` and `## Next actions`, and creates tomorrow's note from the template. An existing tomorrow note is never overwritten.
9. It runs `plan-cli validate` on both notes and reports any issue. It never rewrites a note to fix one.
10. It reports the paths written and the engine numbers used.

Use `/closeday dry-run` to see the planned writes without writing.

### 5. After the close
---
"templates_folder": "30_Order/Templates"
"user_scripts_folder": ""
"folder": "10_UMN"
"folder": "20_Progress"
"folder": "40_Resources"
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" && grep -n "export\|cause\|month\|grade\|milestoneTitles" core/model.ts | head -30; grep -rn "#[0-9a-fA-F]\{6\}" ui/styles.ts | head -8; grep -n "links" core/config.ts; echo ---; cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n '/^# /,$p' "30_Order/Standards/References/Reference - the-plan-dashboard.md" | head -60
```
```
8:export interface Row {
15:export interface CategoryView {
21:export interface Model {
35:export interface Extras {
41:export function buildModel(texts: ReadonlyMap<string, string>, today: string, extras: Extras = {}): Model {
16:	accent: "#a78bfa",
17:	bad: "#E5534B",
18:	warn: "#F0A63A",
19:	ok: "#5BC98A",
20:	heat: ["#23282F", "#1F3B31", "#25523F", "#2E7050", "#3F9468", "#5BC98A"],
24:	accent: "#7c5cdb",
25:	bad: "#D63B33",
26:	warn: "#D98A12",
39:	links: [
---
# Reference - the-plan-dashboard

Tool: `.obsidian/plugins/the-plan-dashboard/` (source in the plugin repository). The rules for this kind of part are in [[Agentic OS Standard]].

## Official source

Obsidian plugin API: https://docs.obsidian.md/Plugins/Getting+started/Build+a+plugin and https://github.com/obsidianmd/obsidian-api/blob/master/obsidian.d.ts (see [[Reference - Obsidian API for This Build]]).

## Version or date checked

Checked 2026-10-13. Plugin version 0.1.0, minAppVersion 1.5.7, `isDesktopOnly: false`. Source at commit b744ba1 plus uncommitted changes in the repository. Obsidian 1.14.4 on desktop.

## What it does here

The Home dashboard view: streak, score ring, today's ticks, heatmap, targets and next actions. It reads the daily notes and ticks one checkbox character with `Vault.process`. Its `core/` folder is also the source of `plan-cli`, so the screen and the reviews share one engine.

## Dependencies

React 19, esbuild 0.25.5, TypeScript 5.8 and the `obsidian` types. Homepage opens it. The deployed files are `main.js`, `manifest.json` and `styles.css`.

## How it was tested

The engine and view tests are part of the 87 in `npm test` and pass, including the 200-history parity run. The view tests render in jsdom and check the ring, streak, at-risk text, ticking and that nothing scrolls. The plugin was rebuilt and redeployed to `.obsidian/plugins/the-plan-dashboard/` on 2026-10-13 (247,154 bytes). The previous files are kept in a scratch backup. Not tested: phone behaviour, Homepage cold start, Sync of the plugin files, the `modify` event after a Sync write ([[Verification and Risks]]).

## Limits

Not submitted to the community directory. The Home links point at `30_Order/Standards/Dashboards/` after the redeploy. The milestone level titles are in config and not shown yet. There is no Monthly or review view.
```

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/model</command-name>
            <command-message>model</command-message>
            <command-args></command-args>

## You

<local-command-stdout>Set model to `Sonnet 5.5` and saved as your default for new sessions</local-command-stdout>

## You

the entire research was now provided to the plan on the laptop, which is taking care of the problems and steps provided to achieve success with the vault. But inside this directory (jarvis), we were not working on the plan. We were working on improving jarvis's own dashboard plans, daily recording, etc. Now, let's take care of the automation layer that was discussed with toggl for time management. The plan steps are being taken care of, now that you have documented the builds that theplan took (when everything was working, perfectly desired state explained in the notes mentioned above). The notes that you wrote will come useful to lay out the jarvis workflow in detail. Toggl and the automation layer for time management is going to be built out in the plan because that's our primary daily monitoring system which pulls professional information from jarvis. So, we do not need toggl exactly over here in jarvis. But an automation layer will exist inside jarvis which solves daily workflow to be much easier on google calenders, reminders and maybe future platforms that are not being in use (zapier, etc.). Let's rethink the automation layer required for jarvis, rethink how exactly jarvis dashboard was laid out, how to design the jarvis dashboard plugin (same idea as the plan), ui things required for this. A + point is that we have already done this for the canvas that's currently there, also a markdown note. But, now we will be removing of plugins when adding this dashboard because we created our own plugin. Now, how exactly is this going to take place? Base it of the plan principles but to avoid mistakes and specialize it to jarvis. How can we design this process to be successful? There are going to be a lot of questions, thinking etc. that is going to be done over here to make sure that the notes for build are designed (similar to the plan): `40_Resources/Obsidian/Dashboard/Prompts` - one main note which is rewritten over and over again to implement build prompts, `40_Resources/Obsidian/Dashboard/Jarvis Builds` - all the necessary information for the builds to be successful, `40_Resources/Obsidian/Dashboard/Jarvis Builds/Ran` - already run phases and prompts. All the prompts are going to run by sonnet 5.5. You are required to write these build design notes first. Then, think about the prompts that are required to be run. First, we are going to in detail design what exactly is to be existing on the jarvis dashboard plugin, what carries forward from the current setup? We have a lot more information over here(plans, weekly, resolutions, etc.). How are all these plans used across the vault (mentorship, project based, umn based)? There are a lot of more things to consider to make this daily dashboard so addicting and easy to understand. This should be astonishing to me every single day once put in habit because it pushes me to do better every single day by understanding my goals, functions, etc. Help me improve by forming identities, habits and be a better version of myself. The intention behind this is to simply bring stability in my life and to make sure that we have actually made progress on a daily basis. Let's do this correctly. Make no mistakes laying out these notes. Ask me a lot of questions. Let's design everything for the dashboard to completely frictionless, manage everything in the vault, have a better understanding of everything that is currently in place. How to make everything substantially more easier to navigate and clean? Let's design everything here by asking me a lot of questions for this design process, understanding jarvis, making sure that the ui is clean, easy to understand, clickable, editable, streak counting, etc. We need to implement a lot of things, so to design it all correctly. Scratch my head till each and every single tiny detail is understood about the dashboard. The dashboard should be one page, no scrollable features at all on the dashboard. But things to tick are write. The only scroll that works is horizontal scroll due the the text not being able to fit inside the lines for that specific component. There is no vertical scroll at all. There is no horizontal scroll on anything except text which is written on a daily basis (might extend the boundaries, which is why the horizontal scroll is there). But nothing on design should have a horizontal scroll, only text that's written might have horizontal scroll. Let's make sure that we draft everything correctly for this dashboard. Ask me a lot of questions here.

## Claude

I'll check which directory this session is in, then read Jarvis's current dashboard, canvas, plans and plugins before asking questions.

Second batch, on the one-page layout, the time and calendar layer, transports and plugin removal:

The decisions below are settled. No notes are written yet, because I need your yes on the list first.

## Settled so far

| Area | Decision |
|---|---|
| Plugin | Separate `jarvis-dashboard` plugin and repo. It has its own engine and day model, copies The Plan's structure, and shares no code with it. |
| Scope | The Dell and Acer laptops only. The phone is out of scope. The layout stays responsive in CSS at no extra cost. |
| Day model | Checkbox lines with a field, for example `[track:: application]`. Meta Bind toggles and frontmatter booleans are retired. |
| Streak | Counts the floor. A day counts when every floor row is done. One miss is forgiven and two in a row break it. Floor rows are set per term in a config table. |
| Wins | A separate 0 to 4 score beside the streak. They never rescue a streak day. |
| Loses | Kept as tickable `## Daily Loses` lines with `[since::]`, oldest first, with a why and a fix at close. |
| Identity | Builder identity only, in line with AGENTS.md rule 6. Personal identity and habits stay in The Plan. |
| Page | One page, no vertical scroll. Only text you write may scroll sideways. The whole page scales to fit the pane, and a "window too small" banner shows below a readable minimum. All content stays. |
| Always visible | Today core, the calendar strip, loses and carryover, and pipeline numbers. |
| Delight | Builder levels, proof of the day, a floor heatmap and pipeline momentum. |
| Today's note | The plugin creates it from the template. Any name that is not `YYYY-MM-DD` is refused and flagged loudly. |
| The 80 | Comes from the Fall plan and the project plans. You approve it each day. |
| Canvas and page | Both are replaced by the plugin. They retire after a clean fortnight and only on your word. |
| Automation | Design only. The calendar is read, and blocks are planned in Calendar for now. Transports (Todoist, Reminders, Zapier and others) are decided later. |
| Plugins | Nothing is removed. The list above is yours to decide. |

## Proposed notes

Under `40_Resources/Obsidian/Dashboard/Jarvis Builds/`, following Jarvis's `agent-prompt`, `project-spec` and `project-plan` kits:

1. **Jarvis Builds Hub:** index, status and next step.
2. **Decisions Log:** every answer above, with the date.
3. **Spec - Day Model and Streak:** daily note schema, floor and wins, loses, proof line, validator rules.
4. **Spec - Dashboard Page:** the no-scroll layout, blocks, scaling, visual system and delight.
5. **Spec - Plans Feed:** how the Fall plan, projects, mentorship and UMN feed the 80, the 20 and the floor without a second copy.
6. **Spec - Automation Layer:** calendar read, block planning, frictionless rules and the future transports.
7. **Spec - Carry Forward:** what moves from `00_Dashboard.md`, the canvas and the old skills, plus the migration of old notes.
8. **Architecture:** plugin, engine, CLI, hooks, repo and deploy. It includes a guard against the two-laptop git overwrite that hit The Plan.
9. **Plugin Retirement List:** the table above, with no removals.
10. **Verification and Risks:** unverified claims, their tests and the failure register.
11. **Build Log:** the handoff between prompts.

`Prompts.md` is the one main note, rewritten for each session, and `Ran/` receives finished prompts. I would write the prompts after these notes, so each prompt can name exactly which notes to read.

## Open questions for the next round

1. When does the Fall term end, and which of its plans carry into next term?
2. What exact rule picks the 20 each day?
3. Which Google account should the calendar read from, and which calendars?
4. What wording do you want for the builder levels at 3, 7, 21, 66 and 100?
5. What weekly target should pipeline momentum show for applications?
6. Daily notes from July and August mention Toggl. What did you track there that you still want?

## One blocker

This session runs from The Plan's folder, and The Plan's CLAUDE.md says its write guard refuses writes to the Jarvis vault. The guard blocked a command earlier today, so it looks active again. I probably cannot write these notes from here. Either start a session in the Jarvis folder, or tell me to try from here.

Reply "yes" to the note list, or tell me what to change.

### Tool Calls

- `Bash`
```bash
pwd; cd "D:/_Anant/20_Progress/Documents/Jarvis" 2>/dev/null && pwd && git log --oneline | head -5; cat 00_Dashboard.md | head -120; echo ---; ls 40_Resources/Obsidian 2>&1; ls 40_Resources | head -30; ls .obsidian/plugins; cat .obsidian/community-plugins.json
```
````
/d/_Anant/20_Progress/Documents/The Plan
/d/_Anant/20_Progress/Documents/Jarvis
4a6df081 Auto-sync: 2026-10-26 13:48,  11 files changed, 8099 insertions(+), 88 deletions(-)
17678fc7 Auto-sync: 2026-10-26 13:18,  33 files changed, 975 insertions(+), 265 deletions(-)
401460ae Auto-sync: 2026-10-26 12:48,  2 files changed, 159 insertions(+)
b3494715 Auto-sync: 2026-10-26 12:18,  8 files changed, 99 insertions(+), 33 deletions(-)
51a569e2 Auto-sync: 2026-10-25 23:33,  3 files changed, 3 insertions(+), 3 deletions(-)
---
type: dashboard
status: tree
created: 2026-04-23
updated: 2026-10-26
tags:
  - dashboard
  - daily
cssclasses:
  - dashboard
today_focus: ""
today_80: ""
today_20: ""
notes:
  - "[[CLAUDE.md]]"
  - "[[AGENTS.md]]"
  - "[[Jarvis OS — North Star]]"
---
<!-- SYNC-ALERT:BEGIN -->
![[30_Order/System/sync-workflow/Sync Alert Banner]]
<!-- SYNC-ALERT:END -->

# Jarvis — `$= moment().format("dddd, D MMMM YYYY")`
> [!focus] CURRENT FOCUS
> **`INPUT[text:today_focus]`**
> `INPUT[text:today_80]`
> `INPUT[text:today_20]`
> *Patched by /startday · cleared by /closeday.*

=== start-multi-column: JarvisDash
```column-settings
Number of Columns: 2
Largest Column: left
Border: off
Shadow: off
```
## Today's Numbers
```dataviewjs
// Every number here is read from today's daily note. Nothing is stored on this page.
const DAILY = "10_Areas/Life/Enumerate/Daily";
const todayStr = dv.date("today").toFormat("yyyy-MM-dd");
const p = dv.page(`${DAILY}/${todayStr}`);
const count = (keys) => (p ? keys.filter((k) => p[k] === true).length : 0);
const lc = Number(p?.lc_count ?? 0);
const study = Number(p?.study_today ?? 0);
const wins = count(["win_project", "win_career", "win_cleanup", "win_review"]);
const floor = count(["floor_1", "floor_2", "floor_3"]);
const open = dv.pages(`"${DAILY}"`).file.tasks
  .where((t) => !t.checked && String(t.section?.subpath ?? t.section).includes("Daily Loses")).length;
const lcClass = lc >= 5 ? 'green' : lc > 0 ? 'yellow' : '';
const winsClass = wins >= 4 ? 'green' : wins >= 2 ? 'yellow' : '';
const floorClass = floor >= 3 ? 'green' : floor >= 1 ? 'yellow' : '';
const losesClass = open === 0 ? 'green' : open > 3 ? 'red' : 'yellow';
const container = dv.el('div', '', {cls: 'stat-grid'});
container.innerHTML = `
  <div class="stat-tile ${winsClass}">
    <div class="stat-label">Wins</div>
    <div class="stat-value">${wins}<span style="font-size:0.85rem;opacity:0.6">/4</span></div>
    <div class="stat-delta ${wins >= 4 ? 'positive' : wins >= 2 ? 'neutral' : 'negative'}">${wins >= 4 ? 'all four' : 'toggles ticked'}</div>
  </div>
  <div class="stat-tile ${floorClass}">
    <div class="stat-label">Floor</div>
    <div class="stat-value">${floor}<span style="font-size:0.85rem;opacity:0.6">/3</span></div>
    <div class="stat-delta ${floor >= 3 ? 'positive' : floor >= 1 ? 'neutral' : 'negative'}">${floor >= 3 ? 'floor held' : 'toggles ticked'}</div>
  </div>
  <div class="stat-tile ${lcClass}">
    <div class="stat-label">Problems</div>
    <div class="stat-value">${lc}</div>
    <div class="stat-delta ${lc >= 5 ? 'positive' : 'neutral'}">target 5</div>
  </div>
  <div class="stat-tile">
    <div class="stat-label">Study Hours</div>
    <div class="stat-value">${study}h</div>
    <div class="stat-delta neutral">today</div>
  </div>
  <div class="stat-tile ${losesClass}">
    <div class="stat-label">Open Loses</div>
    <div class="stat-value">${open}</div>
    <div class="stat-delta ${open === 0 ? 'positive' : 'negative'}">${open === 0 ? 'none slipped' : 'not made up'}</div>
  </div>
`;
if (!p) dv.paragraph("No daily note for today yet. Run /startday.");
```
## This Week
```dataviewjs
const folder = '"10_Areas/Life/Enumerate/Daily"';
const pages = dv.pages(folder).where(p => {
  if (!p.file.day) return false;
  const today = dv.date("today");
  const monday = today.minus({days: today.weekday - 1});
  return p.file.day >= monday && p.file.day <= today;
});
const tick = (p, keys) => keys.filter((k) => p[k] === true).length;
const WINS = ["win_project", "win_career", "win_cleanup", "win_review"];
const FLOORS = ["floor_1", "floor_2", "floor_3"];
const lcTotal = pages.values.reduce((a,p) => a + (Number(p.lc_count) || 0), 0);
const studyTotal = pages.values.reduce((a,p) => a + (Number(p.study_today) || 0), 0);
const winsTotal = pages.values.reduce((a,p) => a + tick(p, WINS), 0);
const floorTotal = pages.values.reduce((a,p) => a + tick(p, FLOORS), 0);
const days = pages.length;
const clippings = dv.pages('"60_Claude/10_Source_Summaries"')
  .where(p => {
    const monday = dv.date("today").minus({days: dv.date("today").weekday - 1});
    return p.file.ctime >= monday;
  }).length;
dv.paragraph(`**Days with a note:** ${days}/7 · **Problems:** ${lcTotal}/35 · **Study:** ${studyTotal}h · **Wins:** ${winsTotal}/${days * 4} · **Floor:** ${floorTotal}/${days * 3} · **Clippings this week:** ${clippings}`);
```
## Today's Priorities
```dataviewjs
// Open tasks in today's note, leaving out the Loses (they have their own list on the right).
const t = dv.page(`10_Areas/Life/Enumerate/Daily/${dv.date("today").toFormat("yyyy-MM-dd")}`);
const tasks = t ? t.file.tasks.where((x) => !x.checked && !String(x.section?.subpath ?? x.section).includes("Daily Loses")) : [];
if (tasks.length) dv.taskList(tasks.slice(0, 8), false);
else dv.paragraph(t ? "Nothing open in today's note." : "No daily note for today yet.");
```
## Active Projects
```dataview
TABLE status, deadline, next, file.mtime AS "Updated"
FROM "20_Progress"
WHERE type = "project" AND status != "archived" AND status != "complete"
---
Dashboard
Data View's
Jarvis AI Infrastructure - Concepts and Research.md
Jarvis Enrichment Engine.md
Jarvis Vault Architecture.md
MCP-Hub-Index.md
Plugins
Portfolio Option A — RAG + Hybrid Search (jarvis-memory Build).md
Second Brain.md
Settings
Vault Operating System.md
CS
Capability
Obsidian
Random.md
UMN
calendar
cmdr
code-styler
dataview
excalibrain
file-explorer-plus
homepage
lazy-plugins
lean-terminal
multi-column-markdown
ninja-cursor
obsidian-excalidraw-plugin
obsidian-git
obsidian-kanban
obsidian-latex-suite
obsidian-local-rest-api
obsidian-meta-bind-plugin
obsidian-spaced-repetition
obsidian-style-settings
periodic-notes
quickadd
recent-edits
recent-files-obsidian
templater-obsidian
text-extractor
url-into-selection
[
  "code-styler",
  "file-explorer-plus",
  "lazy-plugins",
  "ninja-cursor",
  "obsidian-latex-suite",
  "obsidian-style-settings",
  "templater-obsidian",
  "url-into-selection",
  "obsidian-local-rest-api",
  "recent-files-obsidian",
  "homepage"
]
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && find . -iname "*.canvas" -not -path "./50_Archive/*" -not -path "./.git/*" | head; echo ---; ls 10_Areas 10_Areas/Life 10_Areas/Life/Plans 10_Areas/Life/Habits 10_Areas/Life/Enumerate 10_Areas/Career 20_Progress 2>&1 | head -80; echo ---; head -60 AGENTS.md
```
```
./10_Areas/Jarvis OS Dashboard.canvas
./20_Progress/AI/Claude OS Dashboard.canvas
./60_Claude/40_Project_Briefs/Internship/graph.canvas
---
10_Areas:
AI
Career
Excalidraw
Jarvis OS Dashboard.canvas
Life
Notes
Summer Grind.md
Trading

10_Areas/Career:
Certifications
Engineer Edge Roadmap.md
Finance
Freelancing.md
Hackathon
Internships
Mentors
Useful Links.md
VISAs & Work Auth

10_Areas/Life:
Books
Enumerate
Habits
Plans
Tracking
Truths of Life

10_Areas/Life/Enumerate:
Daily
Enumerate Board.md
Monthly
Weekly
Yearly

10_Areas/Life/Habits:
Habit Experiments Board.md
Habit Scorecard Board.md
Habit Tracker Board.md
Habits Stacking.md

10_Areas/Life/Plans:
2025
Fall 2026
Plans Board.md
Plans-to-Create.md
Summer 2026
Zero-Cost AI Stack

20_Progress:
AI
Degree
Internship
Mentorship Program
Projects
---
---
type: ai
status: sprout
created: 2026-03-19
updated: 2026-10-15
tags:
  - "#ai"
  - "#evergreen"
  - "#ai-infrastructure"
related:
  - "[[CLAUDE]]"
  - "[[HUMAN_WRITING]]"
  - "[[AI_CONTEXT]]"
---
# Jarvis Agent Guide

This vault is an AI-assisted second brain built in Obsidian. Treat it as a knowledge system first and a file tree second. This file owns the write contract and the routing table. Everything else it points to owns its own job.

## Cold start

Follow the single read order in [[AI_CONTEXT]]. Do not read the full instruction stack. Load only what the task touches.

| Question | Owner |
| --- | --- |
| Why does Jarvis exist and where is it going? | [[Jarvis OS — North Star]] |
| Where does this note go? | [[40_Resources/Obsidian/Jarvis Vault Architecture]] |
| How is this note type shaped? | `30_Order/` (see the rule below) |
| What do the frontmatter properties mean? | [[40_Resources/Obsidian/Vault Operating System]] |
| How must the prose sound? | [[HUMAN_WRITING]] |
| How do I format it in Obsidian? | [[Jarvis Writing and Formatting]] |
| What is happening right now? | [[00_Dashboard]] and `Session Logs/log.md` |
| Which agent, skill, or tool do I use? | [[CLAUDE]] and `30_Order/Standards/AI Loop/` |

## The 30_Order rule

Every note written into this vault follows a Standard, a Template, and (where one exists) a Workflow from `30_Order/`. This is strict.

- Find the note type in [[Note Type Registry]]. It names the Template, Standard, and Workflow, and the folder.
- Start from the matching file in `30_Order/Templates/`. Do not write frontmatter or headings that no template defines. `type` and `status` come only from [[Frontmatter Standard]].
- Read the matching Standard in `30_Order/Standards/` for what each heading must contain.
- Follow the matching Workflow in `30_Order/Workflows/` for the process around it ([[00_Workflows Index]] lists them).
- Before saving, run [[Vault Lint]] on the note. When you open an older note for any reason, bring it to its Standard in the same edit ([[Conformance on Touch]]).
- If no template exists for the note type, do not improvise. Say so, and design the Standard, then the Template, then the Workflow, in that order ([[30_Order/00_How This Folder Works|How This Folder Works]]). Until then, write the note to `60_Claude/00_Inbox/`.

## Write Contract

Every agent follows this, regardless of which tool is driving. Full version: [[40_Resources/Obsidian/Jarvis Vault Architecture]].

### Golden rules

1. **Never create a new top-level file or folder at the vault root.** Root holds only `00_Dashboard.md`, `AGENTS.md`, `CLAUDE.md`, `HUMAN_WRITING.md`, and the numbered folders `10_Areas` through `60_Claude`. This is the single most damaging mistake an agent can make.
2. **When unsure where a note goes, write it to `60_Claude/00_Inbox/`.** Unsure is the trigger to use the Inbox, never to invent a location.
3. **Read `30_Order/` before writing.** Its Standards, Templates, and Workflows are the structural half of [[HUMAN_WRITING]].
4. **Search before creating.** Extend an existing canonical note instead of duplicating.
5. **Preserve frontmatter and wikilinks. Patch by heading.**
6. **No personal-life content in Jarvis.** Jarvis is the execution and technical workshop: course work, projects, career mechanics, business and project income. Health, personal finance, relationships, reflective or confessional journaling, and identity-as-a-person content live in The Plan (`00_Live/`). `10_Areas/Life/Truths of Life/` is the one exception, scoped narrowly to builder-identity evidence (what the work says about me as an engineer), never personal reflection.

### Where does this note go?

| If the note is | Write it to | Read first (30_Order) |
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls -la --time-style=long-iso "40_Resources/Obsidian/Dashboard" "40_Resources/Obsidian/Dashboard"/* | head -60; echo ---; sed -n 120,260p 00_Dashboard.md; echo ---; ls "10_Areas/Life/Plans/Fall 2026" "10_Areas/Life/Plans/Summer 2026" 20_Progress/Mentorship\ Program 20_Progress/Internship 20_Progress/Degree 20_Progress/Projects 2>&1 | head -70
```
````
-rw-r--r-- 1 anant 197609 4905 2026-10-26 13:20 40_Resources/Obsidian/Dashboard/Jarvis Build Overview.md
-rw-r--r-- 1 anant 197609    0 2026-10-26 13:51 40_Resources/Obsidian/Dashboard/Prompts.md
-rw-r--r-- 1 anant 197609 4622 2026-10-26 13:20 40_Resources/Obsidian/Dashboard/The Plan Overview.md

40_Resources/Obsidian/Dashboard:
total 20
drwxr-xr-x 1 anant 197609    0 2026-10-26 13:51 .
drwxr-xr-x 1 anant 197609    0 2026-10-26 12:54 ..
-rw-r--r-- 1 anant 197609 4905 2026-10-26 13:20 Jarvis Build Overview.md
drwxr-xr-x 1 anant 197609    0 2026-10-26 13:51 Jarvis Builds
-rw-r--r-- 1 anant 197609    0 2026-10-26 13:51 Prompts.md
drwxr-xr-x 1 anant 197609    0 2026-10-26 13:20 The Plan
-rw-r--r-- 1 anant 197609 4622 2026-10-26 13:20 The Plan Overview.md

40_Resources/Obsidian/Dashboard/Jarvis Builds:
total 4
drwxr-xr-x 1 anant 197609 0 2026-10-26 13:51 .
drwxr-xr-x 1 anant 197609 0 2026-10-26 13:51 ..
drwxr-xr-x 1 anant 197609 0 2026-10-26 13:51 Ran

40_Resources/Obsidian/Dashboard/The Plan:
total 48
drwxr-xr-x 1 anant 197609     0 2026-10-26 13:20 .
drwxr-xr-x 1 anant 197609     0 2026-10-26 13:51 ..
-rw-r--r-- 1 anant 197609 10121 2026-10-26 13:20 The Plan Dashboard Architecture and Infrastructure.md
-rw-r--r-- 1 anant 197609  8638 2026-10-26 13:20 The Plan Dashboard Build History and Method.md
-rw-r--r-- 1 anant 197609  7776 2026-10-26 13:20 The Plan Dashboard Daily Workflow and AI Loop.md
-rw-r--r-- 1 anant 197609  7459 2026-10-26 13:20 The Plan Dashboard State and Gaps 2026-10-25.md
-rw-r--r-- 1 anant 197609  7697 2026-10-26 13:20 The Plan Dashboard UI and What Appears.md
---
WHERE type = "project" AND status != "archived" AND status != "complete"
SORT deadline ASC
LIMIT 8
```
=== end-column ===
## Wins and Floor
```dataviewjs
// The Done toggles in today's note, counted live. Tick them in the note; they are the evidence /closeday uses.
const todayStr = dv.date("today").toFormat("yyyy-MM-dd");
const p = dv.page(`10_Areas/Life/Enumerate/Daily/${todayStr}`);
const bar = (label, keys) => {
  const done = p ? keys.filter((k) => p[k] === true).length : 0;
  const pct = Math.round((done / keys.length) * 100);
  const wrap = dv.el('div', '', {cls: 'progress-wrap'});
  wrap.innerHTML = `
    <div class="progress-label">${label}: ${done} / ${keys.length} · ${pct}%</div>
    <div class="progress-bar-bg"><div class="progress-bar-fill" style="width:${pct}%"></div></div>
  `;
};
bar("Daily Wins", ["win_project", "win_career", "win_cleanup", "win_review"]);
bar("Daily Floor", ["floor_1", "floor_2", "floor_3"]);
```
## Daily Loses
```dataviewjs
// Every promise not yet made up, from every daily note. [x] made up, [>] carried and [-] dropped do not show.
const DAILY = "10_Areas/Life/Enumerate/Daily";
const open = dv.pages(`"${DAILY}"`).file.tasks
  .where((t) => !t.checked && String(t.section?.subpath ?? t.section).includes("Daily Loses"));
const today = dv.date("today");
const age = (t) => {
  const s = t.since ? String(t.since).slice(0, 10) : t.path.split("/").pop().replace(".md", "");
  const d = dv.date(s);
  return d ? Math.max(0, Math.floor(today.diff(d, "days").days)) : 0;
};
if (open.length === 0) {
  dv.paragraph("No open Loses.");
} else {
  const sorted = open.sort((t) => age(t), "desc");
  dv.paragraph(`**${sorted.length} open** · oldest ${age(sorted[0])} days`);
  dv.taskList(sorted.slice(0, 8), false);
}
```

## Internship Pipeline
```dataview
TABLE status, next
FROM "10_Areas/Career/Internships"
SORT file.mtime DESC
LIMIT 5
```
## Clippings Queue
```dataviewjs
const remaining = dv.pages('"60_Claude/05_Clippings"')
  .where(p => !p.file.name.includes("board") && !p.file.name.includes("README")).length;
dv.paragraph(`**${remaining}** items awaiting distillation`);
```
## Vault Health
```dataview
TABLE file.folder AS Folder, file.mtime AS "Updated"
FROM "10_Areas" OR "20_Progress" OR "40_Resources" OR "60_Claude"
WHERE !type OR !status
SORT file.mtime DESC
LIMIT 8
```
=== end-multi-column

---
**System:** [[CLAUDE.md]] · [[AGENTS.md]] · [[Jarvis OS — North Star]] · [[AI_CONTEXT]] · [[HUMAN_WRITING]]
**Claude OS:** [[Claude OS]] · [[20_Progress/AI/Claude OS Dashboard|Claude OS Dashboard]] · [[10_Areas/Excalidraw/Claude OS Map|OS Map]]
**AI:** [[10_Areas/AI/Claude Code|Claude Code]] · [[10_Areas/AI/Cursor|Cursor]] · [[10_Areas/AI/Kiro|Kiro]] · [[10_Areas/AI/Codex|Codex]]
**Daily OS:** [[Daily Operating System|Daily Operating System]] · personal, health, and finance tracking live in The Plan, not here
**Mentorship:** [[Mentorship Board]] · current must-do: send the Jesse outreach email, deadline 2026-11-02 · see [[Plan - Ahnaf]] and [[Plan - Jesse]]

## 10_Areas Overview

What each area is for, and where it stands right now. This is an area-level field, not a daily one — don't touch it from `/startday` or `/closeday`; update it when an area's purpose or state materially changes.

| Area | Purpose | Current state |
|------|---------|----------------|
| [[Engineer Edge Roadmap\|Career]] | Internship pipeline, freelancing, business-income tracking (`Career/Finance/`, scoped to project/business money only — no personal finance here) | 18 companies researched in tracker `Current/`, 0 in `Applied/` as of 2026-09-07 — the one number [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan\|Fall 2026 Plan]] exists to move; Finance folder empty until real income lands |
| [[10_Areas/Trading/Stocks Trading AI Hub\|Trading]] | TradingView project — treated as an engineering/evaluation build, not a promise to beat the market | Month 1 (data ingestion foundation) real and in progress — Pydantic models, DuckDB storage, quality auditing, read API built; strategy/AI-analyst/dashboard phases gated behind it |
| [[10_Areas/AI/Claude Code\|AI]] | Reference notes for the AI tools actually in use (Claude Code, Cursor, Kiro, Codex) | Stable reference, low-churn |
| [[Daily Operating System\|Life]] | Execution only: Enumerate daily/weekly/monthly notes, Fall 2026 plan, operational habit boards, builder-identity Truths of Life. No personal-life content — that lives in The Plan. | Active — this is what `/startday` and `/closeday` read every day. As of 2026-09-07, read [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan\|Fall 2026 Plan]] first (frame: [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing\|Fall 2026 - The One Thing]]) — it's the one source of truth for the daily floor and real project status. |
| Notes | Raw course-era captures (F'25, Files, PDFs) awaiting distillation or archive | Not actively worked — candidate for a cleanup pass |

Full folder definitions: [[40_Resources/Obsidian/Jarvis Vault Architecture]]. The Plan holds the personal-life equivalent of this table on its own dashboard.
---
10_Areas/Life/Plans/Fall 2026:
Anti-Drift Rules.md
Fall 2026 - The One Thing.md
Fall 2026 Builds.md
Fall 2026 Plan.md
LeetCode & CodePath.md
Weekly Rhythm.md

10_Areas/Life/Plans/Summer 2026:
00 - Summer Plans Index.md
Anti-Drift Rules.md
Daily Operating System.md
Final Month Plan (Jul 28 - Sep 1).md
LeetCode & CSCI 4041.md
ML Fundamentals (2033 + 2230).md
Weekly Operating System.md

20_Progress/Degree:
CSCI 4041
CSCI 4061
CSCI 4511W
CSCI 4521
CSCI 5304
Course Production Board — Fall'26.md
Every Week.md
Fall'26 Syllabus.md
Hit or Miss - Miss.md
MGMT 3015
Repetitive Things.md
UMN Board.md
_Courses

20_Progress/Internship:
Applying
Building System
Career Fair
Career Fair '25 & '26.md
Companies giving OPT & CPT.md
Cover Letters
Posts
Preperation
Resumes

20_Progress/Mentorship Program:
Ahnaf
Jesse
Meetings
Mentorship Board.md
Plans

20_Progress/Projects:
AI Use
CS
Extra
Jarvis & The Plan
Projects Board.md
Research
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/40_Resources/Obsidian/Dashboard" && cat "Jarvis Build Overview.md"; echo =====; sed -n 1,60p "The Plan Overview.md"
```
```
---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
reference_kind: resource
area:
  - "[[Daily Operating System]]"
notes:
  - "[[The Plan Overview]]"
  - "[[Jarvis Dashboard Build Record]]"
  - "[[Daily Note Standard]]"
  - "[[Daily Close Loop]]"
  - "[[Dataview and Dashboards]]"
---
# Jarvis Build Overview
This note says what the Jarvis dashboard is made of, what appears on it, and how the daily workflow feeds it. Read it before changing `00_Dashboard.md`, the homepage canvas, `Better Today`, or the `/startday` and `/closeday` skills. The dated history of how it got here is in [[Jarvis Dashboard Build Record]]. The Plan's dashboard is a different build: [[The Plan Overview]].
## Layers
| Layer | What it is | Where |
|---|---|---|
| Data | One daily note per day. Frontmatter booleans for the toggles, typed numbers for problems and study hours, and a `## Daily Loses` list | `10_Areas/Life/Enumerate/Daily/YYYY-MM-DD.md`, shaped by [[Daily Note Standard]] and [[Better Today]] |
| Query | DataviewJS blocks that read today's note and every note's open Loses. Nothing is stored in the dashboard | `00_Dashboard.md` and `10_Areas/Jarvis OS Dashboard.canvas` |
| Input | Meta Bind `INPUT[...]` fields: toggles bound to frontmatter booleans, numbers for `lc_count` and `study_today`, text for the three focus lines | The daily note and the dashboard's own frontmatter |
| Look | `.obsidian/snippets/dashboard.css` (`.stat-grid`, `.stat-tile`, `.progress-wrap`), the AnuPpuccin theme, Multi-Column Markdown for the two-column page | `.obsidian/snippets/` |
| Open | Homepage opens the canvas on startup, replacing open notes. `00_Dashboard.md` is the markdown twin, linked from the canvas | `.obsidian/plugins/homepage/data.json` |
| Writers | `/startday` fills the plan and carries Loses. `/closeday` counts the toggles and writes Loses. Both patch the three `today_*` focus lines | `.claude/skills/startday/`, `.claude/skills/closeday/` |
Plugin versions on 2026-10-26: Dataview 0.5.68, Meta Bind 1.5.1, Multi-Column Markdown 0.9.1, Homepage 4.5.0, Templater 2.26.0, Periodic Notes 0.0.17, QuickAdd 2.32.1.
## What appears, and where each number comes from
| On screen | Source | Rule |
|---|---|---|
| Today's focus, the 80, the 20 | `today_focus`, `today_80`, `today_20` in `00_Dashboard.md` | Patched by `/startday`, cleared by `/closeday`. The only fields the dashboard owns |
| Wins `n/4`, Floor `n/3` | `win_*` and `floor_*` toggles in today's note | Counted live. A tile turns green at 4 of 4 wins or 3 of 3 floor |
| Problems | `lc_count` in today's note | Typed. Green at 5 |
| Study hours | `study_today` in today's note | Typed |
| Open Loses | Every unchecked task under `## Daily Loses` in any daily note | Sorted oldest first, with the age from `since`. Ticking in the list should write back to the source line, as Dataview task queries do; not yet confirmed for `dv.taskList` here |
| This week | Notes from Monday to today | Sums problems and study hours, counts toggles against `days x 4` and `days x 3` |
| Today's priorities | Unchecked tasks in today's note outside Daily Loses | First eight |
| Active projects, internship pipeline, clippings queue, vault health | Dataview over `20_Progress`, `10_Areas/Career/Internships`, `60_Claude/05_Clippings`, and notes missing `type` or `status` | Unchanged by the 2026-10-26 rebuild |
## Why the toggles are frontmatter
Obsidian does not render task checkboxes inside table cells. On 2026-07-10 the Wins and Floor tables used plain `[ ]` text that never ticked. The fix put a Meta Bind toggle in each cell, bound to a boolean such as `win_project`, so a tick persists in the note. The cost is that a toggle is only evidence if something reads it. Until 2026-10-26 nothing did: `wins_done` was a number typed by hand and `/closeday` asked for it in chat. Now the dashboard counts the booleans and `/closeday` writes the counts from them.
## What Anant does to run it
1. `/startday` in the morning. Read the plan, the blocks and the open Loses it prints.
2. Tick a toggle only when the thing is done. Write a Lose when a promise slips, with the `why` in your own words.
3. `/closeday` before 10:30pm. Answer one question block: the counts, and a `why` and a `fix` for each proposed Lose.
4. Turn on Templater's "Trigger Templater on new file creation" so new daily notes get a real `created` date. Today `/startday` repairs the date, and that setting is the permanent fix.
## Known drift to watch
- Two landing pages hold the same queries: the canvas and `00_Dashboard.md`. Both were updated on 2026-10-26. Keep one and link to it when convenient.
- `.agents/skills/startday` and `closeday` are older copies of the `.claude` skills and already differed before 2026-10-26. They were not changed.
- Inline DataviewJS is off in settings. Daily notes must not rely on a `$=` expression.=====
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
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/10_Areas/Life/Plans/Fall 2026" && sed -n 1,200p "Fall 2026 - The One Thing.md" | head -70; echo ====; grep -n "^#" "Fall 2026 Plan.md" "Weekly Rhythm.md" "Anti-Drift Rules.md" "LeetCode & CodePath.md" "Fall 2026 Builds.md"
```
```
---
type: evergreen
status: sprout
created: 2026-09-07
updated: 2026-09-07
tags:
  - plan
  - fall2026
notes:
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]"
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]]"
  - "[[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]]"
next: "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]"
---
# Fall 2026 - The One Thing
==Internships. Everything else this fall is either mandatory (classes) or in service of that one goal.== The tracker already has 18 companies researched in `Tracker/Each One/Current/` and zero in `Applied/`, per [[10_Areas/Career/Internships/Tracker/Tracker|Application Tracker]] as of 2026-09-07. The September flood is already dropping. The gap between researched and applied is the only number that matters right now. The week-by-week system that moves that number lives in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]; this note is the frame that decides what gets attention when two things compete for the same hour.

## The one thing
Land a real internship offer for Summer 2027 - a software engineering or AI/ML role, at a company worth actually working for. Everything below is judged against whether it moves that number.

## What's mandatory regardless of priority
- **Classes.** 21 credits confirmed across 6 courses in [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]] - a 7th CSCI class would make it 22 once it's approved, not before. A 4.0 doesn't get skipped because the internship push is on; it gets scheduled around, per the 80/20 split in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]].
- **CodePath TIP103.** Free technical-interview course, already enrolled - confirmed 2026-09-07 as [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|CodePath's TIP103]]. Correction, same date: the vault's `20_Progress/Degree/CSCI 4041/` folder is a different, already-completed Spring'26 UMN class (graded A, archived) - it is not TIP103's material, and calling this "the CSCI 4041 track" was a naming conflation. Its job is forcing the LeetCode reps that certification study alone won't. Same daily floor as the internship push, because it's the mechanism that gets an application through the technical round once it lands one.
- **System design.** No fixed start date - begins once GitHub Foundations, AI Associate Engineer, and the LeetCode/CodePath floor all reach real stability, then runs self-paced via [the System Design Primer repo](https://github.com/donnemartin/system-design-primer), confirmed 2026-09-07. Corrects this note's original "starts 2026-09-14" claim, which was wrong. Full sequencing: [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]].

## What's in service of the one thing, and how it's bounded
- **AIIS Club.** Real deadlines this week (SAO budget + panelist confirmations due 2026-09-10, per [[40_Resources/UMN/SAO/AIIS|AIIS]]) and a full fall calendar through an AI Convention on Oct 1. Worth running well because "organized and ran a club" is a real leadership line on a resume - but it does not get more hours than that line is worth. If a week forces a choice between an AIIS event and shipping applications, the applications win unless the AIIS deadline is externally fixed (like Sept 10).
- **Mentorship.** Ahnaf, ongoing, alternate weeks - fall goals are being built from real meetings, not decided in advance, per [[20_Progress/Mentorship Program/Plans/Fall 2026 — Detailed Expectations|Fall 2026 - Detailed Expectations]]. A second mentor is a live idea, not yet enrolled. Both exist to sharpen the build and the story that goes into an application, not as a parallel project.
- **Scholarships.** No tracker exists yet in the vault - this is a real gap, not a hidden system. Worth pursuing because paid-for tuition is real leverage, but it runs on whatever hours are left after the floor, not before it.
- **Networking, conferences, hackathons, career fair.** Target from the original scope: 100+ people met, 5 conferences, 5 hackathons this fall. [[10_Areas/Career/Hackathon/Hackathons|Hackathons]] already has a judge-credibility playbook worth following instead of entering the first thing available. Every one of these is a lead-generation system for the one thing, not a separate goal - a hackathon win is a resume line and a set of judge contacts, not an end in itself.
- **LinkedIn content.** No posting plan exists yet. Publishing gradually and consistently is worth doing because recruiters and referrals come from visibility, not because content is the goal.
- **Portfolio v2 and a blog.** The Next.js/Sanity/Orby build is already real and in progress (security hardening, SEO/AEO strategy, and a Blog section already built per `20_Progress/Projects/CS/Portfolio/frontend/Ran/08 - Blog, Contact & Footer.md`). v2 ships first; blog posting ramps up in what the user calls "v3" as of 2026-09-07 - not yet a scoped iteration anywhere in the vault, just stated intent. Once v3 deploys: publish weekly, share resources, post about it on LinkedIn, and pursue ads/sponsors per post plus some form of subdomain income - mechanism not yet chosen. Writing one real thing a week is the discipline worth keeping regardless of monetization - it is the single clearest proof of "can explain technical work clearly" that an interviewer will ever see before a call. Detail: [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]].
- **TradingView.** Guardrailed against fabricated data or execution language per `20_Progress/AI/Claude Code/Trading View/CLAUDE.md`. It is a portfolio project, not a live goal to be "printing money" - that line from the original scope is corrected in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]'s Goal section. The Fall build target: a basic UI, a self-improving ingestion system, and real market-niche strategy notes - detail and evidence-sourcing caveats in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]]. It stays in scope because a working, tested, guardrailed trading research tool is a strong interview story; it does not get the hours a live trading goal would.
- **ClaudeKit / the agentic OS visualization.** `second-brain-claudekit` already runs a real qualification pipeline (sandbox to tested-tools to promotion) and syncs across the Windows and WSL machines via Unison - with a known, unresolved permission-bit failure on the Windows side, visible in its own `Sync-Log.md`. Making the whole system visible across both laptops is worth doing because it is the same infrastructure the internship-research-loop's 24/7 discovery automation runs on top of. It is maintenance on the thing that already produces the 18 researched companies, not a new project competing for the same week.
- **New laptop setup.** Resource notes already exist under `40_Resources/CS/Concepts/New Laptop/`. One-time task, done once and left alone.
- **Jarvis automations.** A new, undated weekend project: Gmail/GCal/other info-source integrations plus a mobile share-to-Obsidian pipeline for Reels/YouTube watched, landing in Obsidian somehow. Nothing built yet - `20_Progress/Projects/Automations/` exists as an empty folder. Detail in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]].

## Dropped
**Arc (Learning Tracker)** is dropped as of 2026-09-07, reversing this note's original "carried over, not dropped" status. Its planning docs (`20_Progress/Projects/CS/Arc/` - a 5-sprint roadmap and data-model sketch, no code ever written per the Summer close-out) are slated for deletion, not yet actioned. A UROP with Jaideep Srivastava and getting The Plan's sync fully active remain genuinely carried over - neither had a system built this session because neither was in scope; they get their own Systems row in [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]] once actually worked.

## What this is not
This is not the semester TradingView gets finished, AIIS becomes a full-time job, or every conference on a list gets attended. Essentialism means most of the things above get the minimum real effort that keeps them alive, so the one thing gets the rest.

---
**Action:** Every day, before anything else on the list, move at least one company from `Current/` to `Applied/` - nothing else here gets attention until that is true most days this week.
====
Fall 2026 Plan.md:26:# Fall 2026 Plan
Fall 2026 Plan.md:30:## Goal
Fall 2026 Plan.md:44:## Timeframe
Fall 2026 Plan.md:49:### Week by week - the One Hard Thing
Fall 2026 Plan.md:70:## Systems
Fall 2026 Plan.md:97:## Implementation Status
Fall 2026 Plan.md:113:## Current Progress
Fall 2026 Plan.md:121:## Update Protocol
Weekly Rhythm.md:16:# Weekly Rhythm — Fall 2026
Weekly Rhythm.md:20:## The daily rhythm
Weekly Rhythm.md:25:## The weekly rhythm
Weekly Rhythm.md:30:## The rule that forces a re-scope
Weekly Rhythm.md:34:## Verified gap this note closes
Anti-Drift Rules.md:15:# Anti-Drift Rules — Fall 2026
Anti-Drift Rules.md:19:## The core rules
Anti-Drift Rules.md:27:## The "Do NOT do today" list (goes in every Today note)
Anti-Drift Rules.md:38:## Friction log
Anti-Drift Rules.md:46:## Tool/optimization parking lot
Anti-Drift Rules.md:52:## Night-before setup (makes morning obvious)
LeetCode & CodePath.md:18:# LeetCode & CodePath — Fall 2026
LeetCode & CodePath.md:22:## Why this file has a different accountability hook than Summer's
LeetCode & CodePath.md:26:## 1. What this covers
LeetCode & CodePath.md:32:## 2. TIP103 unit tracker
LeetCode & CodePath.md:51:## 3. Company rotation
LeetCode & CodePath.md:55:## 4. Daily Log
LeetCode & CodePath.md:63:### Weekly totals (target ≥35/week)
LeetCode & CodePath.md:71:## 5. Pre-interview cram list
LeetCode & CodePath.md:77:## 6. Wiring
Fall 2026 Builds.md:17:# Fall 2026 Builds
Fall 2026 Builds.md:20:## Map
Fall 2026 Builds.md:36:## Evidence Discipline
Fall 2026 Builds.md:39:## Status
Fall 2026 Builds.md:51:## Links
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents" && grep -rli "toggl" --include=*.md Jarvis "The Plan" 2>/dev/null | grep -v "50_Archive\|\.git/" | head; echo ---; sed -n 70,96p "Jarvis/10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md"; echo ---; sed -n 16,34p "Jarvis/10_Areas/Life/Plans/Fall 2026/Weekly Rhythm.md"; echo ---; python3 - <<'E' 2>/dev/null || node -e 'const c=JSON.parse(require("fs").readFileSync("Jarvis/10_Areas/Jarvis OS Dashboard.canvas","utf8"));console.log(c.nodes.length+" nodes, "+(c.edges||[]).length+" edges");console.log(c.nodes.map(n=>n.type+":"+(n.text||n.file||n.label||"").slice(0,60).replace(/\n/g," ")).join("\n"))'
E
ls Jarvis/.claude/settings.json && node -e 'const s=require("./Jarvis/.claude/settings.json");console.log(Object.keys(s.hooks||{}))'
```
```
PreToolUse:Bash hook error: 50_Archive is never read or written.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents" && grep -rli "toggl" --include=*.md Jarvis/10_Areas Jarvis/20_Progress Jarvis/30_Order Jarvis/40_Resources "The Plan/00_Live" "The Plan/30_Order" "The Plan/40_Resources" 2>/dev/null | head; echo ---; sed -n 70,96p "Jarvis/10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md"; echo ---; sed -n 16,34p "Jarvis/10_Areas/Life/Plans/Fall 2026/Weekly Rhythm.md"
```
```
Jarvis/10_Areas/AI/Claude Code.md
Jarvis/10_Areas/Career/Internships/List/Dossiers/1 - AI & ML/Applied AI Engineer Intern - Millennium.md
Jarvis/10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/Blockchain Application Developer Intern - DMS International.md
Jarvis/10_Areas/Career/Internships/List/Dossiers/3 - CyS & Finance/Quantitative Developer Intern - Millennium.md
Jarvis/10_Areas/Life/Enumerate/Daily/2026-07-10.md
Jarvis/10_Areas/Life/Enumerate/Daily/2026-08-01.md
Jarvis/10_Areas/Life/Enumerate/Daily/2026-08-03.md
Jarvis/10_Areas/Life/Enumerate/Daily/2026-08-07.md
Jarvis/10_Areas/Life/Enumerate/Daily/2026-08-08.md
Jarvis/10_Areas/Life/Enumerate/Daily/2026-08-10.md
---
## Systems
Every track needs a cadence and a done-definition checkable on any given day. "Ship TradingView" is a category; each row below states the actual mechanism.

| Track | Cadence | Done-definition | Where it lives |
|---|---|---|---|
| Internship application floor | Daily | A company note actually moves `Current/` → `Applied/` in the real Tracker folder | [[10_Areas/Career/Internships/Tracker/Tracker|Application Tracker]] (dataview reflects folder moves automatically) |
| Resume/Cover Letter evidence bank | One-time, this week | `Main Resume.md` and `Main Cover Letter.md` hold real evidence-tagged content, both Cursor skills' prerequisite checks pass | Research Loop Prompt 6, `Research Loop - Implementation Plan.md` |
| Technical interview prep (CodePath TIP103 + LeetCode) | Daily LeetCode; TIP103 material Tue + Thu | Logged same day in [[10_Areas/Life/Plans/Fall 2026/LeetCode & CodePath|LeetCode & CodePath]] (created 2026-09-15, real accountability hook via `/closeday`'s scorecard and `/weekly-review`'s Step 2, not a copy of the closed Summer file). TIP103 ≠ the vault's `CSCI 4041` folder (a different, closed UMN class) - see [[20_Progress/Degree/_Courses/Technical Interview/Technical Interview|Technical Interview]] | [[10_Areas/Life/Plans/Fall 2026/LeetCode & CodePath|LeetCode & CodePath]] |
| GitHub Foundations | One-time, in progress | Exam registered and written once the GitHub Student Developer Pack promo code arrives | [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] |
| AI Associate Engineer | 30-day window, 2 exams (AIEDEVA101 timed + AIEDEVA501P practical), 2 attempts each | Both exams passed by 2026-09-30 - whether the deadline covers both is unconfirmed, see [[20_Progress/Degree/_Courses/AI Associate Engineer/AI Associate Engineer|AI Associate Engineer]] | [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] |
| ML Engineer (DataCamp) | Ongoing, parallel | Course material implemented in a real local repo (repo not yet named) | [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] |
| ML Ops (DataTalks) | Ongoing, parallel | Same - implemented in a real local repo | [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] |
| System design | No fixed cadence yet | Starts once GitHub Foundations, AI Associate Engineer, and the LeetCode/CodePath floor are all stable; resource not yet chosen | [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] |
| Cloud Architect (LinkedIn Learning) | One-time, starts 2026-11-01 | Course completed during the LinkedIn Learning/Premium free trial month, alongside a maximized outreach push | [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] |
| Classes | Per class, weekly, per syllabus | Grading-criteria section in [[20_Progress/Degree/Fall'26 Syllabus|Fall'26 Syllabus]] filled in and tracked against | `Fall'26 Syllabus.md` |
| AIIS Club | Per event on the fall calendar | SAO grant training course finished, proposal submitted, each event run per its own plan | [[40_Resources/UMN/SAO/AIIS|AIIS]] |
| Mentorship (Ahnaf) | Alternate weeks | Meeting held, `/transcript-to-brief` then `/note-to-actions` run on it | [[20_Progress/Mentorship Program/Plans/Fall 2026 — Detailed Expectations|Fall 2026 - Detailed Expectations]] |
| Second mentor | Opportunistic | Real first contact made, not just noted as an idea | Same note |
| Scholarships | Weekly scan | A real shortlist exists and at least one application is submitted | Not yet created - open task |
| Networking / conferences / hackathons / career fair | Ongoing, target 100 contacts / 5 conferences / 5 hackathons | A real running count kept somewhere checkable, not memory | [[10_Areas/Career/Hackathon/Hackathons|Hackathons]] playbook; `Networking Strategies.md` exists but is currently empty - needs real content, not just a filename |
| LinkedIn content | Weekly post | A real post published, not drafted; process/templates refined through 2026-10-31, then a maximized push during the 2026-11-01 LinkedIn Learning/Premium free trial | [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] |
| Portfolio v2 / blog (v3) | Weekly publish once v3 is live | v2 ships initially; one real piece written and published once blog hosting moves to v3, plus a LinkedIn post about it, per [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]] | `20_Progress/Projects/CS/Portfolio/frontend/Ran/08 - Blog, Contact & Footer.md` |
| TradingView | Ongoing build | Basic UI, self-improving ingestion, and market-niche strategy notes exist - verified against the repo mirror's own docs, not a local `kiro-status` run (no `.kiro/` exists in this vault mirror) | [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]] |
| ClaudeKit / agentic OS visibility | Ongoing maintenance | Windows/WSL sync runs clean - the current permission-bit failure in `Sync-Log.md` gets root-caused, not just retried | `20_Progress/AI/Claude Code/second-brain-claudekit/` |
| New laptop setup | One-time | Setup notes in `40_Resources/CS/Concepts/New Laptop/` actually executed, not just drafted | Same folder |
| Jarvis automations (Gmail/GCal/mobile-to-Obsidian) | One weekend, undated | Real automations built and running, not just scoped | [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]] - `20_Progress/Projects/Automations/` currently empty |

---
# Weekly Rhythm — Fall 2026

Fall doesn't run Summer's manual Sunday ritual (7 written questions in a `Weekly Operating System` note). `/weekly-review` is a different, more automated design — this note states what it actually does so the rhythm is legible without reading the skill file.

## The daily rhythm

- **Morning, `/startday`**: reads [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]] and [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]'s week-by-week and Systems tables, fills today's daily note (Fall Daily Wins + Fall Daily Floor), patches `00_Dashboard.md`'s `today_focus`/`today_80`/`today_20`.
- **Evening, `/closeday`**: scores the day against the Fall Ops Scorecard (Application / LeetCode-CodePath / class step / 4 Wins), writes tracking frontmatter, clears the dashboard for tomorrow, logs the session.

## The weekly rhythm

- **Sunday, `/weekly-review`**: runs the Fall Execution Audit (internship floor movement, LeetCode/CodePath log health, class deadlines, project shipping, AIIS/mentorship/scholarships/networking against the Systems table), plus vault-health checks (orphans, missing next actions, metadata gaps). Writes a full `Weekly Synthesis — YYYY-WXX.md` note to `60_Claude/30_Reviews/Weekly Synthesis/`, then patches the lightweight periodic note at `10_Areas/Life/Enumerate/Weekly/YYYY-Www.md` with a one-line summary.
- **Where to look**: the periodic Weekly note for a quick glance; the Weekly Synthesis note for the full audit, including which tracks are ✅/⚠️/❌ against the Systems table's done-definitions.

## The rule that forces a re-scope

Per [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]]'s Update Protocol: two consecutive missed `/weekly-review` runs means a full re-scope conversation before the plan continues, not a third silent week. The same logic applies one level down — per [[10_Areas/Life/Plans/Fall 2026/Anti-Drift Rules|Anti-Drift Rules]], two missed `/startday`/`/closeday` days in a row is the trigger to stop and diagnose, not push through on memory.

## Verified gap this note closes
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `AskUserQuestion` -- ``{"questions":[{"header":"Plugin shape","question":"How should the Jarvis dashboard plugin relate to The Plan\u0027s plugin and engine?","multiSelect":false,"options":[{"label":"Separate plugin, own engine (Recommended)","description":"New repo `jarvis-dashboard`. It copies The Plan\u0027s proven structure (core engine, repo, safe tick via Vault.process, CLI, hooks) but has its own day model. No shared code, so a Plan change can never break Jarvis."},{"label":"Shared core package","description":"One engine package imported by both plugins. Less duplication, but a change for one vault can break the other and the build gets harder to reason about."},{"label":"One plugin, two vault profiles","description":"A single plugin with a config per vault. Fewest repos, but the two day models are different enough that it becomes a pile of conditionals."}]},{"header":"Day model","question":"How should a Jarvis day be recorded in the daily note so the plugin can tick it safely?","multiSelect":false,"options":[{"label":"Checkbox lines with a field (Recommended)","description":"Wins, floor and tasks become `- [ ] ... [track:: application]` lines, like The Plan\u0027s `[cat::]`. The plugin flips one character. Meta Bind toggles and frontmatter booleans go away, which also lets Meta Bind be removed."},{"label":"Keep frontmatter booleans","description":"Keep `win_*` and `floor_*` in frontmatter. The plugin writes them with processFrontMatter. Fewer skill changes, but the day stays split between properties and text."},{"label":"Hybrid","description":"Checkbox lines for things you do, frontmatter only for numbers (problems, study hours). Needs a clear rule for which is which."}]},{"header":"Streak","question":"What should the Jarvis streak count? This is the main habit-forming mechanic.","multiSelect":false,"options":[{"label":"The floor (Recommended)","description":"A day counts when the daily floor is held: one company moved Current to Applied, LeetCode reps, one class or study step. It rewards the Fall 2026 \u0027One Thing\u0027 directly. One forgiven miss, as in The Plan."},{"label":"Floor plus wins score","description":"A day counts at N of 7 (3 floor plus 4 wins). Softer, but the headline number blurs the one thing that matters."},{"label":"Application streak only","description":"Streak equals days with at least one application sent. Sharp and motivating, but a class or exam day breaks it."},{"label":"Several separate streaks","description":"One each for applications, LeetCode and study. Rich, but harder to keep to one screen with no scroll."}]},{"header":"Identity","question":"Jarvis AGENTS.md bans personal-life content, but you want identity and habit pull here. How should that work?","multiSelect":false,"options":[{"label":"Builder identity only in Jarvis (Recommended)","description":"Jarvis shows work identity: \u0027I am a builder who ships\u0027, proof of the day, evidence from Truths of Life. Personal identity, health and habits stay in The Plan. Matches the current rule and avoids two copies drifting."},{"label":"Read-only Plan summary","description":"Jarvis also shows The Plan\u0027s streak and ring as one small tile, read-only. A plugin cannot read another vault, so this needs a small synced note that The Plan\u0027s `/closeday` writes."},{"label":"Change the rule","description":"Allow identity and habit content in Jarvis. Needs an AGENTS.md change and creates duplication with The Plan."}]}]}``
- `AskUserQuestion` -- ``{"questions":[{"header":"Always visible","question":"Which groups must always be on the single no-scroll page, including on the phone? Anything not chosen goes to desktop-only or a one-tap detail view. Pick all that apply.","multiSelect":true,"options":[{"label":"Today core","description":"Streak number, floor ring, the 80 (One Thing) and the 20 supporting tasks, tickable."},{"label":"Pipeline numbers","description":"Applications moved Current to Applied today and this week, LeetCode count against 5, study hours."},{"label":"Calendar strip","description":"Now and next from Google Calendar, plus deadlines due within 7 days."},{"label":"Loses and carryover","description":"Open Daily Loses with age, plus carryover from yesterday, tickable."}]},{"header":"Time layer","question":"Toggl is not going into Jarvis. What should the Jarvis time and calendar layer do?","multiSelect":false,"options":[{"label":"Read the calendar, plan blocks (Recommended)","description":"Dashboard shows now and next from Google Calendar. `/startday` proposes time blocks for the 80 and the floor and creates them in Google Calendar only after your yes. Plan owns tracked time."},{"label":"Read-only calendar","description":"Dashboard only shows events. Nothing is ever created in Calendar. Safest, least help."},{"label":"Full scheduling","description":"The dashboard or a scheduled run also moves and reschedules blocks when the day slips. Most help, highest risk of surprise edits."}]},{"header":"First transport","question":"Which outbound path should the automation layer design first for reminders and blocks?","multiSelect":false,"options":[{"label":"Google Calendar through the Claude connector (Recommended)","description":"Already attached to the session, runs from a Claude Code run on the laptop, and syncs to the phone through Calendar. Reminders come from Calendar alarms."},{"label":"Apple Reminders through a Shortcut","description":"Native phone alerts, but there is no Windows API and the transport is unverified."},{"label":"Zapier","description":"Can bridge Calendar, Todoist and Reminders, but adds a service, a cost and a token to expire."},{"label":"Design all three, build one","description":"Compare them in the design notes, then build the winner first."}]},{"header":"Plugin removal","question":"When the Jarvis plugin ships, which existing plugins should be removed? Dataview is still used by other notes.","multiSelect":false,"options":[{"label":"Remove only after a clean fortnight (Recommended)","description":"Disable Meta Bind and Multi-Column Markdown for the dashboard only after the plugin has run clean for two weeks. Keep Dataview, Kanban and Homepage for other notes. Retire the markdown page and canvas last."},{"label":"Remove at ship","description":"Disable Meta Bind and Multi-Column the day the plugin ships. Faster, but there is no fallback if it breaks."},{"label":"Keep everything","description":"Add the plugin and leave the rest in place. No removal."}]}]}``
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && for d in .obsidian/plugins/*/; do n=$(basename $d); v=$(node -e 'try{console.log(require("./'$d'manifest.json").version)}catch(e){console.log("?")}'); echo "$n $v"; done; echo ---; node -e 'const d=require("./.obsidian/plugins/lazy-plugins/data.json");console.log(JSON.stringify(d.desktop||d,null,0).slice(0,1500))'; echo ---; cat .obsidian/core-plugins.json | tr -d '\n ' | head -c 700; echo; ls .obsidian/snippets; cat .obsidian/appearance.json | tr -d '\n '
```
```
calendar 1.5.10
cmdr 0.7.0
code-styler 1.1.7
dataview 0.5.68
excalibrain 0.2.19
file-explorer-plus 1.3.1
homepage 4.5.0
lazy-plugins 1.0.24
lean-terminal 1.5.0
multi-column-markdown 0.9.1
ninja-cursor 0.0.14
obsidian-excalidraw-plugin 2.29.0
obsidian-git 2.42.0
obsidian-kanban 2.0.51
obsidian-latex-suite 1.14.0
obsidian-local-rest-api 5.5.2
obsidian-meta-bind-plugin 1.5.1
obsidian-spaced-repetition 1.15.4
obsidian-style-settings 1.0.9
periodic-notes 0.0.17
quickadd 2.32.1
recent-edits 1.6.0
recent-files-obsidian 1.7.10
templater-obsidian 2.26.0
text-extractor 0.7.0
url-into-selection 1.11.4
---
{"shortDelaySeconds":5,"longDelaySeconds":15,"delayBetweenPlugins":40,"defaultStartupType":"short","showDescriptions":true,"enableDependencies":false,"plugins":{"code-styler":{"startupType":"instant"},"dataview":{"startupType":"short"},"excalibrain":{"startupType":"long"},"obsidian-excalidraw-plugin":{"startupType":"long"},"file-explorer-plus":{"startupType":"instant"},"obsidian-kanban":{"startupType":"short"},"obsidian-latex-suite":{"startupType":"instant"},"obsidian-local-rest-api":{"startupType":"instant"},"ninja-cursor":{"startupType":"instant"},"url-into-selection":{"startupType":"instant"},"periodic-notes":{"startupType":"short"},"quickadd":{"startupType":"short"},"recent-files-obsidian":{"startupType":"instant"},"obsidian-spaced-repetition":{"startupType":"short"},"obsidian-style-settings":{"startupType":"instant"},"templater-obsidian":{"startupType":"instant"},"obsidian-git":{"startupType":"short"},"lean-terminal":{"startupType":"short"},"homepage":{"startupType":"instant"},"obsidian-meta-bind-plugin":{"startupType":"short"},"multi-column-markdown":{"startupType":"short"},"text-extractor":{"startupType":"short"},"cmdr":{"startupType":"short"},"recent-edits":{"startupType":"short"},"calendar":{"startupType":"short"}}}
---
{"file-explorer":true,"global-search":true,"switcher":true,"graph":true,"backlink":true,"canvas":true,"outgoing-link":true,"tag-pane":true,"footnotes":true,"properties":true,"page-preview":true,"daily-notes":false,"templates":false,"note-composer":true,"command-palette":true,"slash-command":true,"editor-status":true,"bookmarks":true,"markdown-importer":true,"zk-prefixer":false,"random-note":true,"outline":true,"word-count":true,"slides":true,"audio-recorder":false,"workspaces":true,"file-recovery":true,"publish":false,"sync":false,"bases":true,"webviewer":false}
dashboard.css
headerspace.css
myedits.css
rainbowfile_colors.css
readingview.css
{"enabledCssSnippets":["dashboard","myedits","rainbowfile_colors","readingview","headerspace"],"cssTheme":"AnuPpuccin","baseFontSizeAction":false}
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
````bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && D="10_Areas 20_Progress 30_Order 40_Resources 60_Claude 00_Dashboard.md"; echo "meta-bind INPUT/BUTTON notes:"; grep -rlE "INPUT\[|BUTTON\[|meta-bind" --include=*.md $D | wc -l; echo "dataviewjs notes:"; grep -rl '```dataviewjs' --include=*.md $D | wc -l; echo "dataview notes:"; grep -rlE '```dataview$' --include=*.md $D | wc -l; echo "multi-column notes:"; grep -rl "start-multi-column" --include=*.md $D | wc -l; echo "kanban notes:"; grep -rl "kanban-plugin" --include=*.md $D | wc -l; echo "excalibrain/excalidraw files:"; find . -name "*.excalidraw*" -not -path "./.git/*" -not -path "./5*" | wc -l; echo "spaced rep (#flashcards):"; grep -rlE "#flashcards|#review" --include=*.md $D | wc -l; echo "latex notes:"; grep -rlE '\$\$' --include=*.md $D | wc -l; echo "templater <% notes in templates:"; grep -rl "<%" --include=*.md 30_Order/Templates | wc -l; echo "css classes:"; grep -rlE "cssclasses" --include=*.md $D | wc -l; echo --- ; grep -rl "INPUT\[" --include=*.md $D | head -15
````
```
meta-bind INPUT/BUTTON notes:
87
dataviewjs notes:
80
dataview notes:
440
multi-column notes:
14
kanban notes:
17
excalibrain/excalidraw files:
21
spaced rep (#flashcards):
16
latex notes:
157
templater <% notes in templates:
74
css classes:
26
---
10_Areas/Life/Enumerate/Daily/2026-07-05.md
10_Areas/Life/Enumerate/Daily/2026-07-08.md
10_Areas/Life/Enumerate/Daily/2026-07-09.md
10_Areas/Life/Enumerate/Daily/2026-07-10.md
10_Areas/Life/Enumerate/Daily/2026-08-01.md
10_Areas/Life/Enumerate/Daily/2026-08-03.md
10_Areas/Life/Enumerate/Daily/2026-08-07.md
10_Areas/Life/Enumerate/Daily/2026-08-08.md
10_Areas/Life/Enumerate/Daily/2026-08-10.md
10_Areas/Life/Enumerate/Daily/2026-09-07.md
10_Areas/Life/Enumerate/Daily/2026-09-08.md
10_Areas/Life/Enumerate/Daily/2026-09-15.md
10_Areas/Life/Enumerate/Daily/2026-09-19.md
10_Areas/Life/Enumerate/Daily/2026-09-21.md
10_Areas/Life/Enumerate/Daily/2026-09-28.md
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `AskUserQuestion` -- ``{"questions":[{"header":"Note creation","question":"Who should create today\u0027s daily note? The Plan\u0027s dashboard showed zeros for ten days because the creating plugin used the wrong file name.","multiSelect":false,"options":[{"label":"The plugin, from the template (Recommended)","description":"A \u0027Create today\u0027s note\u0027 action in the dashboard builds `YYYY-MM-DD.md` from the template and refuses any other name. The dashboard also warns loudly when a note in the Daily folder is misnamed. `/startday` calls the same rule."},{"label":"`/startday` only","description":"The skill creates it when you start the day. Simple, but nothing creates it on a day you forget to run the skill."},{"label":"Keep Periodic Notes and Templater","description":"Leave creation to the existing plugins and only fix their settings. Smallest change, same failure risk as The Plan."}]},{"header":"The 80","question":"Where should today\u0027s 80 (the One Thing) come from each day?","multiSelect":false,"options":[{"label":"From the Fall plan, you approve (Recommended)","description":"`/startday` reads the week\u0027s One Hard Thing and the application-floor rule from the Fall 2026 Plan and proposes today\u0027s 80. You say yes or edit it, then it writes one line."},{"label":"You type it every morning","description":"Free text on the dashboard. Total control, but it breaks on tired mornings."},{"label":"Always the application floor","description":"The 80 is always \u0027move one company Current to Applied\u0027, and the One Hard Thing becomes a 20. Matches the One Thing note exactly."}]},{"header":"Daily delight","question":"Which elements should make the page feel rewarding every day? Pick all you want.","multiSelect":true,"options":[{"label":"Builder levels","description":"Level titles at streak milestones (3, 7, 21, 66, 100), with your own wording, shown beside the streak."},{"label":"Proof of the day","description":"One line of evidence you shipped, written at close, shown tomorrow as \u0027Yesterday you proved: ...\u0027."},{"label":"Heatmap of floor days","description":"The last 30 or 60 days as a GitHub-style grid, shaded by how much of the floor was held."},{"label":"Pipeline momentum","description":"A running count of companies Current to Applied this week against the target, with the gap shown plainly."}]},{"header":"Canvas fate","question":"What should happen to the current canvas (`Jarvis OS Dashboard.canvas`) and `00_Dashboard.md`?","multiSelect":false,"options":[{"label":"Canvas becomes the map, page retires (Recommended)","description":"Keep the canvas as an exploration map only, as The Plan did with its Map Canvas. Homepage opens the plugin view. `00_Dashboard.md` is retired last, after a clean fortnight, and only on your word."},{"label":"Replace both with the plugin","description":"Plugin view only. Both the canvas and the page retire after the fortnight."},{"label":"Keep both as fallbacks","description":"Leave the canvas and page untouched. The plugin is a third surface, which risks three copies of the same queries."}]}]}``
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && f=$(find 30_Order -name "Note Type Registry.md" | head -1); echo "$f"; grep -n "reference\|project\|prompt\|build" "$f" | head -30; ls 30_Order/Templates | head -40; ls 40_Resources/Obsidian/Dashboard/"Jarvis Builds"/Ran; ls 20_Progress/Projects/"Jarvis & The Plan" 2>&1 | head
```
```
30_Order/Note Type Registry.md
18:To write or fix a note, find its row, open the Standard, copy the Template, follow the Workflow. A note type with no row has no kit; build one with [[Building a Note Kit]] before writing it. Tiers are defined in [[Conformance Standard]]. A kit's state is `built` (written to the contract), `align` (exists, must be rewritten to the contract), `planned` (not written, named here), or `decide` (waiting on a user decision). Planned names are plain text and become links when written.
46:| course-project | 1 | class / project | same | [[Project Template]] | [[Course Project Standard]] | [[Projects Workflow]] | built |
47:| course-project-companion | 2 | class / project, `project_role: companion` | same | none | same Standard | [[Projects Workflow]] | built |
57:| internship-program | 1 | reference / program | `10_Areas/Career/Internships/Programs/` | [[Program Template]] | [[Program Standard]] | [[Internship Pipeline]] | built |
59:| internship-applying | 1 | project / project | `20_Progress/Internship/Applying/` | [[Applying Template]] | [[Applying Standard]] | [[Application Document Preparation]] | built (unexercised) |
61:| interview-prep | 1 | project / project | `20_Progress/Internship/Preperation/Interviews/` | [[Interview Prep Template]] | [[Interview Prep Standard]] | none | built |
62:| mentorship-meeting | 1 | project / plan | `20_Progress/Mentorship Program/` | [[Mentorship Meeting Template]] | [[Mentorship Meeting Standard]] | none | built |
69:| job-company | 1 | reference / company | none yet | [[Job & Company Template]] | none until a first note exists | none | decide |
71:| cheat | 1 | project | `20_Progress/Internship/` | [[Cheat Template]] | none until a decision | none | decide |
75:| project | 1 | project / project | `20_Progress/Projects/`, `20_Progress/Internship/`, `20_Progress/Mentorship Program/` | [[Project Note Template]] | [[30_Order/Standards/Project Standard|Project Standard]] | [[Brief to Progress]] | built |
76:| project-spec | 1 | project / spec | `20_Progress/`, `60_Claude/40_Project_Briefs/` | [[Project Spec Template]] | [[Spec and Plan Standard]] | none | built |
77:| project-plan | 1 | project / plan | `20_Progress/`, `60_Claude/40_Project_Briefs/` | [[Project Plan Template]] | [[Spec and Plan Standard]] | none | built |
78:| code-mirror-doc | 1 | project / code-mirror | `60_Claude/40_Project_Briefs/CausalOps/` | [[Code Mirror Template]] | [[Code Mirror Doc Standard]] | none | built |
79:| agent-prompt | 1 | project / prompt | `20_Progress/`, `60_Claude/40_Project_Briefs/` | [[Agent Prompt Template]] | [[Agent Prompt Standard]] | [[Prompt Cycle]] | built |
80:| prompt-queue | 1 | project / prompt (`prompt_shape: queue`) | `20_Progress/Internship/Building System/Runs/` | none | [[Agent Prompt Standard]] | [[Prompt Cycle]] | built |
81:| machine-runbook | 1 | reference / runbook | `40_Resources/CS/` | [[Machine Runbook Template]] | [[Machine Runbook Standard]] | none | built |
95:| reference-resource | 1 | reference | `40_Resources/`, `10_Areas/AI`, `10_Areas/Trading` | [[Reference Template]] | [[Reference Standard]] | [[Promotion]] | built |
96:| output-story | 1 | output / story | next to its project, `20_Progress/` | [[Output Template]] | [[Output Standard]] | [[Output with Provenance]] | built |
117:| project-review | policy | log entry in the project note | the project's own `## Log` | none | [[Per Project Review]] | none | built |
118:| graphify-note | 1 | reference / repo | `60_Claude/40_Project_Briefs/` | [[Graphify Notes Template]] | [[Graphify Notes]] | [[Graphify Folders]] | built |
119:| tool-setup | 1 | reference / tool-profile | `20_Progress/AI/<Tool>/<Project>/Setup.md` | [[Tool Setup Template]] | [[Tool Setup]] | [[Files Tracking]] | built |
AI Toolkit
Capability
Career
Classes
Enumerate
Frontmatter
Knowledge
MOC.md
Projects
System
AI Learning Across Vaults.md
Builds - Jarvis
Jarvis Multi-Agent PKM Plan.md
Jarvis Three-Month Research Engine Master Plan.md
Jarvis.md
My AI Twin.md
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n "obsidian\|claude\|^\*\|^!" .gitignore | head -30; ls 30_Order/System 2>/dev/null; ls 30_Order/System/sync-workflow 2>/dev/null | head; git remote -v | head -2
```
```
2:.obsidian/workspace.json
3:.obsidian/workspace-mobile.json
4:.obsidian/cache
8:# obsidian-tasks-plugin and omnisearch were both confirmed, direct
13:# effect). obsidian-hover-editor was crashing with an uncaught TypeError
14:# wrapping obsidian-spaced-repetition's Review Queue view. Renaming the
15:# folder *in place* (obsidian-tasks-plugin.disabled/ etc, still inside
16:# .obsidian/plugins/) was believed sufficient but was proven NOT durable on
21:# removing the folder from .obsidian/plugins/ entirely - moved to
22:# .obsidian/_disabled-plugins/ instead.
23:.obsidian/_disabled-plugins/
43:.obsidian/community-plugins.json
44:.obsidian/plugins/lazy-plugins/data.json
47:.obsidian/graph.json
48:.obsidian/workspaces.json
49:.obsidian/plugins/*/*.bak
52:.obsidian/plugins/copilot/data.json
53:.obsidian/plugins/copilot/data-*backup*.json
54:.obsidian/plugins/quickadd/data.json
55:.obsidian/plugins/obsidian-local-rest-api/data.json
56:.claude/settings.json
57:.claude/settings.local.json
62:.obsidian/copilot-index-*.json
73:*.tmp
78:.claude/.env.local
87:*.pyc
92:*.env.local
93:**/.kiro/settings/
102:30_Order/System/claude-workflow/logs/git-auto-sync.log
103:30_Order/System/claude-workflow/scripts/.git-auto-sync.lock
claude-workflow
cursor-workflow
excalidraw-mcp
jarvis-cli
jarvis-memory
sync-workflow
vault-lint
README.md
Sync Alert Banner.md
scripts
origin	https://github.com/gupta-builds/Jarvis.git (fetch)
origin	https://github.com/gupta-builds/Jarvis.git (push)
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `AskUserQuestion` -- ``{"questions":[{"header":"Floor rows","question":"The Fall plan\u0027s floor has three rows: application moved Current to Applied, LeetCode or CodePath reps (5 or more), and one class step. Should these drive the streak, and how should they change next term?","multiSelect":false,"options":[{"label":"Rows set per term in config (Recommended)","description":"Fall\u0027s three rows are the floor now, as checkbox lines with a `[track::]` field. Next term you change a config table and the plan note, not code. The streak counts a day when all floor rows are done, one miss forgiven."},{"label":"Fixed three rows","description":"Hard-code the three rows. Simpler, but a new term means a code change."},{"label":"Floor is 2 of 3","description":"A day counts when any two floor rows are done. Softer, and it weakens the application floor."}]},{"header":"Wins","question":"What should happen to the four wins (project, career, cleanup, review)?","multiSelect":false,"options":[{"label":"Separate score, not in the streak (Recommended)","description":"Wins show as a 0 to 4 ring beside the streak and in the weekly total. The streak stays tied to the floor, so a cleanup win can never rescue a day with no application."},{"label":"Wins count toward the streak","description":"A day counts at floor plus a minimum number of wins. Richer score, blurrier signal."},{"label":"Drop the wins","description":"Floor, the 80 and the 20 only. Simplest page, loses the project and review habits."}]},{"header":"No-scroll fit","question":"Windows on the Dell and Acer differ in size. How should the no-vertical-scroll guarantee hold, given no content is removed?","multiSelect":false,"options":[{"label":"Scale the whole page to fit (Recommended)","description":"Font size and grid scale with the pane, as The Plan\u0027s view does. Below a readable minimum size a plain banner says \u0027Window too small\u0027. Only written text scrolls sideways."},{"label":"Fixed layout with minimum window","description":"One layout, tested at a set minimum window size, and a banner below it."},{"label":"Two layouts, wide and compact","description":"A wide grid and a compact grid like The Plan, switching on pane shape. More to test, but better use of tall narrow panes."}]},{"header":"Daily Loses","question":"Daily Loses are promises that slipped, carried until made up, each with a why and a fix. What should the new design do with them?","multiSelect":false,"options":[{"label":"Keep, tickable on the page (Recommended)","description":"Same mechanic, as `- [ ]` lines under `## Daily Loses` with `[since::]`, shown oldest first with age. Ticking writes back to the source note line. `/closeday` still asks for the why and fix."},{"label":"Fold into the 20","description":"Open Loses simply become carried tasks in the 20. Fewer concepts, loses the accountability framing."},{"label":"Retire Loses","description":"Drop the mechanic and rely on the floor streak and weekly review."}]}]}``

## You

`40_Resources/Obsidian/Dashboards/Jarvis Build` - write the notes over here since you cannot write into jarvis. it's alright but write the notes mentioned in context to jarvis and the notes inside jarvis. This folder will simply be cut and pasted inside the correct directory (jarvis). So, these notes should be written inside the plan as if they were written inside jarvis. 

Now, to focus on the open questions:

## You

`40_Resources/Obsidian/Dashboards/Jarvis Build` - write the notes over here since you cannot write into jarvis. it's alright but write the notes mentioned in context to jarvis and the notes inside jarvis. This folder will simply be cut and pasted inside the correct directory (jarvis). So, these notes should be written inside the plan as if they were written inside jarvis. 

Now, to focus on the open questions:



<pasted_content id="99d6">
Default term ends on 24 December. That day will be the last day of the Fall 2026 plan. Whatever the Plan completes, it completes. In the next term we will continue some items and discontinue others. The date marks the end of the Plan vault and many other plans currently in Jarvis.

**Second question:** what exact rule picks 20 each 10? The 20 is based on the main 80 tasks that need to be completed that day. For example, if my main agenda is to submit 10 or 5 applications today, the 20 focuses on the small tasks required to have five applications ready for entry: drafting cover letters, completing resumes, and any other work Jarvis must handle.

If the ET is mid‑down, the 20 focuses on the core tasks that support the ET, while the ET outlines the main items to be done. The 20 represents 20 % of the work needed and complements the ET by adding exactly what must be done; the ET remains the primary task.

The Google account that the calendar should read from is **gupt0479@umn.edu**. All calendars and related data will be provided in detail. This information is also recorded in Jarvis and drafted for the weekly note. Additional notes will be supplied now to give a clearer picture of today’s workflow in Jarvis.

Review these notes to understand the Google account, the calendar, and the calendars. The wording for the builder levels should match The Plan. I don’t recall the exact standard builder levels, so use the same ones as The Plan.

**Question 5:** The weekly target for applications is ten per week. The goal is to send out ten applications and ensure each is completed correctly.

Daily notes from July and August mention Doge. I only discovered this tool recently and have not tracked anything with the store. I started using the store about a week ago.

I no longer want to use Todoist inside Jarvis. I want to manage time while referring to the daily notes I created in The Plan. The timestamps in The Plan should be used to document the time spent on each task, giving a clearer view of how our time is allocated.

The toggle has been added to The Plan. Jarvis reads The Plan on /start day and /close day, and the agents monitor the Plan notes so that both daily notes remain consistent. Complete part 1 personally and the portion related to work. Adjourn. Answer all your questions.
</pasted_content id="99d6">


## Claude

You asked for the notes to be written here as if they were in Jarvis, so I'll read Jarvis's note standards and calendar notes before writing. I'll start with the standards that govern spec, plan and prompt notes.

Now the calendar notes you pointed to, the account `gupt0479@umn.edu`, and how Jarvis's weekly note uses them.

The other session has already reworked the Jarvis daily note standard, close loop and calendar guide. I need these to stay consistent with them.

The folder is new and empty. I'm writing the eleven notes now, starting with the decision record and the day model.

Next are the page spec, the plans feed, the automation layer and the carry-forward map.

One line in the plans feed asserts a tracker rule I haven't verified. I'm correcting it before writing the rest.

The last five are the architecture, the plugin list, the verification and risk note, the build log and the hub.

The hub is last. It holds the sequence of build prompts and every open question in one place.

Now the checks: em dashes, in-folder links, and frontmatter on all eleven notes.

The eleven design notes are written in The Plan's `40_Resources/Obsidian/Dashboards/Jarvis Build/`, ready to cut and paste into the Jarvis vault. I did not write `Prompts.md`, because I want your answers to the open questions first. I wrote nothing else.

I checked that none of the notes contain an em dash, that each has valid frontmatter, and that every link between them resolves. I could not run Vault Lint on them, since that only works inside Jarvis. The links to Jarvis notes (`Daily Note Standard`, `Better Today`, `2026-W44` and others) will only resolve there. I did not copy the notes already in Jarvis's Dashboard folder, to avoid a second copy. I did read them and the other Jarvis notes you pointed me to, and the specs build on them.

## The notes
| Note | Holds |
|---|---|
| Jarvis Build Hub | The build sequence P1 to P6 and all open questions |
| Jarvis Decisions Log | 23 decisions, the dictated answers I had to interpret, and 5 corrections |
| Jarvis Spec - Day Model and Streak | Daily note shape, fields, floor rows, streak rule, 10 validator rules |
| Jarvis Spec - Dashboard Page | The no-scroll rules, blocks, layout, scaling, states |
| Jarvis Spec - Plans Feed | How plans become the 80, the 20 and the floor |
| Jarvis Spec - Automation Layer | Calendar read, planned blocks, time from The Plan |
| Jarvis Spec - Carry Forward | A fate for every block of the old page |
| Jarvis Architecture | Layers, CLI, tests, two-laptop guards |
| Jarvis Plugin Retirement List | Evidence only, nothing removed |
| Jarvis Verification and Risks | 13 untested claims, a failure register, acceptance list |
| Jarvis Build Log | Fixed answers and the first entry |

## Corrections to what I told you earlier
- **Toggl is in no vault note.** My search matched the word `toggle`. The July and August Jarvis daily notes do not mention Toggl, and neither does anything in The Plan. I recorded your statement that it lives in The Plan as unverified.
- **The day model changes.** Checkbox lines replace the frontmatter toggles that the other session built this morning. The Daily Loses format stays.
- **The Plans Board has a different term end.** It says the Fall plan ends 2026-12-14. I used your 2026-12-24 and flagged the Plans Board line.

## Questions I need answered
1. **Dictation:** "20 each 10" is read as the 20 each day, "ET" as the One Thing, and "Doge" and "the store" as Toggl. Is that right?
2. **Unclear sentence:** what did "Complete part 1 personally and the portion related to work. Adjourn." mean?
3. **Toggl in The Plan:** where do its timestamps land? I found no note for it.
4. **Applications:** is the floor row one a day or two a day, given a target of 10 a week? Is `date_applied` strictly a finished application?
5. **Too many Loses:** if more open Loses exist than fit on the page, may it show the oldest that fit plus a "+N more" chip, with a cap of 7 open? This is the only place a rule would hide content, and it needs your yes.
6. **Old page blocks:** decide the six marked Decide in the carry-forward note (projects, clippings queue, vault health, week strip, sync banner, areas table).
7. **Build:** React or plain DOM? Should the plugin be desktop-only? Where does the repo live on the Dell and the Acer?
8. **Cross-vault read:** may a Jarvis session read The Plan's daily note, and what is its path on the Acer?
9. **Window sizes:** which Dell and Acer window sizes must the page fit?

After your answers, I'll write `Prompts.md` with prompt P1 only, to the Agent Prompt Standard, since the Prompt Cycle keeps one prompt in the queue.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && find . -name "Agent Prompt Standard.md" -o -name "Spec and Plan Standard.md" -o -name "Frontmatter Standard.md" -o -name "Project Spec Template.md" -o -name "Project Plan Template.md" -o -name "Agent Prompt Template.md" -o -name "Prompt Cycle.md" -o -name "Conformance Standard.md" | head; 
```
```
./Standards/Conformance Standard.md
./Standards/Frontmatter Standard.md
./Standards/Projects/Agent Prompt Standard.md
./Standards/Projects/Spec and Plan Standard.md
./Templates/Projects/Agent Prompt Template.md
./Templates/Projects/Project Plan Template.md
./Templates/Projects/Project Spec Template.md
./Workflows/Projects/Prompt Cycle.md
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && cat Standards/Projects/Agent\ Prompt\ Standard.md Standards/Projects/Spec\ and\ Plan\ Standard.md Templates/Projects/Agent\ Prompt\ Template.md Templates/Projects/Project\ Spec\ Template.md Templates/Projects/Project\ Plan\ Template.md
```
````
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: agent-prompt
tier: 1
maps_to:
  - "[[Agent Prompt Template]]"
used_by:
  - "[[Prompt Cycle]]"
gold_standard: "[[60_Claude/40_Project_Briefs/CausalOps/claude code/ran/01 - Fix MCP Server Deployment and Housekeeping|Prompt 1: Fix the MCP Server Deployment]]"
notes:
  - "[[Spec and Plan Standard]]"
  - "[[Project Standard]]"
---
# Agent Prompt Standard
==A prompt note holds one task for a fresh agent session and everything that session needs, so the run does not depend on what the writer remembers.==
This is the standard for notes that hold a prompt to paste into Claude Code, Codex, or another agent: the numbered CausalOps prompts and the Internship Building System runs. It covers the prompt note and, in a second Spec, the rolling queue file that holds only the next prompt. The plan a prompt belongs to is a [[Spec and Plan Standard]] note.
## Spec
```json
{
  "family": "agent-prompt",
  "tier": 1,
  "match": {"type": "project", "kind": "prompt", "path": "^(20_Progress|60_Claude/40_Project_Briefs)/", "where": {}, "where_not": {"prompt_shape": "queue"}},
  "legacy_match": [
    {"path": "^60_Claude/40_Project_Briefs/CausalOps/claude code/"},
    {"type": "project", "path": "^20_Progress/Internship/Building System/Runs/Prompt "}
  ],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "task", "model"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Why This Exists", "Hard Rules", "Implementation Order", "Report Back"],
  "optional_headings": ["What Not To Do", "Status", "Related Notes"]
}
```
```json
{
  "family": "prompt-queue",
  "tier": 1,
  "match": {"type": "project", "kind": "prompt", "path": "^20_Progress/", "where": {"prompt_shape": "queue"}, "where_not": {}},
  "legacy_match": [{"type": "project", "path": "^20_Progress/Internship/Building System/Runs/(Claude Code|Codex) Prompts( - Archive)?\\.md"}],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "prompt_shape", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Prompting Guide In Use"],
  "optional_headings": []
}
```
## Headings
### Frontmatter
`project_kind: prompt`. `task` is a short slug of the job, for example `mcp-server-port-fix`. `model` is the agent and model it was written for. `status` is `active` until it runs, `complete` after the result is reviewed, `archived` once superseded. `prompt_shape: queue` marks the rolling file; it is omitted on a single prompt.
### Why This Exists
The evidence behind the task: the finding, with a file path, commit, or review reference. A hypothesis the note wrote itself is labeled as one.
> [!WARNING]
> Handing the agent a diagnosis that was never checked. State what was verified and what is assumed, and tell the agent to re-check it.
### Hard Rules
Scope limits and constraints, one line each: what to leave untouched, what must stay green, what is out of scope this round.
### Implementation Order
Numbered steps with the files touched, in the order to do them.
### Report Back
What the agent must report so the result can be reviewed: files changed, commands run with output, anything it could not do. A prompt without this gets a report nobody can check.
### What Not To Do
Optional. The two or three mistakes a past run made.
### Queue file
The queue holds only the next prompt or two, under `Prompting Guide In Use` and one `##` per prompt, and is rewritten each cycle ([[Prompt Cycle]]).
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| No `project_kind`, `task`, or `model` (the CausalOps `ran/` prompts have `tags`, `created`, sometimes `task`, `model`) | Add all three | Mechanical once the model is known |
| Prompt without Report Back or Hard Rules | Add the missing section from the prompt text | Judgment |
| `status: active` on a prompt that already ran | `complete` | Judgment |
| Rolling `Claude Code Prompts` or `Codex Prompts` file | Add `prompt_shape: queue`; archive files get `status: archived` | Mechanical |
| A scratch ledger from one run (Freshness Sweep Scratch) | Not a prompt: keep as `project_kind: plan` with `status: complete`, or drop it | Judgment |
## Done Conditions
- A prompt note has the four required headings, `task`, and `model`.
- Every claim in Why This Exists says whether it was verified and how.
- A finished prompt moves to `status: complete` or to the Archive note, with its result linked.
- The note passes [[Vault Lint]] for `agent-prompt` or `prompt-queue`.
## Gold Standard Example
[[60_Claude/40_Project_Briefs/CausalOps/claude code/ran/01 - Fix MCP Server Deployment and Housekeeping|Prompt 1: Fix the MCP Server Deployment]]: a cited finding, hard rules, an ordered implementation, and a report-back section. It predates `project_kind`, `status`, and `updated`, which Legacy Shapes adds.
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: project-spec-plan
tier: 1
maps_to:
  - "[[Project Spec Template]]"
  - "[[Project Plan Template]]"
used_by: []
gold_standard: "[[20_Progress/Internship/Building System/Source of Truth|Source of Truth]]"
notes:
  - "[[Project Standard]]"
  - "[[Agent Prompt Standard]]"
  - "[[Note Type Registry]]"
---
# Spec and Plan Standard
==A spec closes what a thing is built to do, a plan orders how to get there, and both are corrected by dated layers that keep the original, never rewritten.==
This is the standard for the thinking that sits behind a project: `project_kind: spec` (what it is and what it will not do) and `project_kind: plan` (the order of work). They live in `20_Progress/` or `60_Claude/40_Project_Briefs/`. A transcript summary is a [[Brief Standard]] note; the status page is a [[Project Standard]] note.
## Spec
```json
{
  "family": "project-spec",
  "tier": 1,
  "match": {"type": "project", "kind": "spec", "path": "^(20_Progress|60_Claude/40_Project_Briefs)/", "where": {}, "where_not": {}},
  "legacy_match": [
    {"type": "project", "path": "^20_Progress/Internship/Building System/Source of Truth"},
    {"type": "project", "path": "^20_Progress/Projects/CS/TradingView/Canon/"},
    {"type": "project", "path": "^60_Claude/40_Project_Briefs/CausalOps/(Memory Layer|_Index)\\.md"}
  ],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["What This Is", "Current State", "Non-Goals"],
  "optional_headings": ["Definition of Done", "Next Action", "Open Questions", "Corrections", "Evidence", "Related Notes"]
}
```
```json
{
  "family": "project-plan",
  "tier": 1,
  "match": {"type": "project", "kind": "plan", "path": "^(20_Progress|60_Claude/40_Project_Briefs)/", "where": {}, "where_not": {}},
  "legacy_match": [
    {"type": "project", "path": "^20_Progress/Internship/Building System/Research Loop - (Implementation|Improvement) Plan"},
    {"type": "project", "path": "^60_Claude/40_Project_Briefs/CausalOps/(Memory Layer Implementation Plan|Roadmap)\\.md"}
  ],
  "status": ["active", "paused", "complete", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "project_kind", "next"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Goal", "Sequence", "Open Questions"],
  "optional_headings": ["Current State", "Non-Goals", "Decisions", "Done When", "Next Action", "Corrections", "Evidence", "Related Notes"]
}
```
## Headings
### Frontmatter
`project_kind` is `spec` or `plan`. `next` is the one thing to do with this note, `none` once the note is final or archived. A superseded spec or plan sets `status: archived`; superseded notes have been left `active`.
### What This Is (spec)
The closed statement of what the system does and for whom, opening with a single `==highlight==` sentence.
*Density:* a short opening plus the few sections the system needs; Source of Truth uses its gates, classification, and pipeline.
### Current State (spec)
What is built versus specified, dated. Every claim about code cites a file and line, a commit, or command output, and a claim that was checked live says when.
> [!WARNING]
> Spec text that describes the design as if it were shipped.
### Non-Goals (spec)
What the system deliberately does not do, one bullet each. Real notes call it Explicit Non-Goals or Out of Scope.
### Goal (plan)
The outcome in one sentence, as the `==highlight==` anchor.
### Sequence (plan)
Ordered steps by dependency, each with the way to tell it is done. Name what is explicitly out of scope this round.
*Density:* a numbered list; a long prompt belongs in an [[Agent Prompt Standard]] note.
### Open Questions (plan)
`- [ ]` tasks for decisions that block the sequence.
### Corrections
When a claim turns out wrong, keep the original text and add a dated section: `## Corrections` with what was wrong, how it was found, and what replaced it.
> [!WARNING]
> Quietly editing the original so the history disappears. Layering, with the original kept, is how these notes stay trustworthy.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| Type `project` with no `project_kind` | `project_kind: spec` or `plan` by content | Judgment |
| `status: tree` or `sprout` | `active`, or `complete` if final | Judgment |
| Spec headings: What This System Is, The End Goal, Explicit Non-Goals, Out of Scope | What This Is, Non-Goals | Judgment |
| Plan headings: Path To N, Priority 1..N, Implementation Sequence, Execution Plan | Sequence | Judgment |
| A dated heading such as "2026-10-03 Corrections (original text above kept)" | `## Corrections` with a dated entry inside | Mechanical |
| Portfolio design docs typed `concept` (about 85) | `type: project`, `project_kind: spec` | Judgment |
| Roadmap with a status table | `project_kind: plan`; the table goes under Current State | Judgment |
## Done Conditions
- `project_kind` is set and matches the note, and `next` is live or `none`.
- A spec has What This Is, Current State, and Non-Goals; a plan has Goal, Sequence, and Open Questions.
- Code claims cite evidence, and corrections keep the original.
- The note passes [[Vault Lint]] for `project-spec` or `project-plan`.
## Gold Standard Example
[[20_Progress/Internship/Building System/Source of Truth|Source of Truth]] for a spec: a highlighted lead, hard gates, explicit non-goals, and a dated corrections layer that keeps the original. [[20_Progress/Internship/Building System/Research Loop - Improvement Plan|Improvement Plan]] for a plan: verdict, causes, a prioritized path, blocking decisions, and a correction. Both still carry `status` values outside the vocabulary.
---
type: project
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: []
project_kind: prompt
task:
model:
---
# <% tp.file.title %>
## Why This Exists
<!-- The evidence behind the task, with a path or commit. Say what was verified and what is assumed. -->
## Hard Rules
<!-- Scope limits, one line each: what stays untouched, what must stay green, what is out of scope. -->
## Implementation Order
<!-- Numbered steps with the files touched, in the order to do them. -->
## Report Back
<!-- What the agent must report: files changed, commands run with output, anything it could not do. -->
---
type: project
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: []
project_kind: spec
next:
related_progress: []
---
# <% tp.file.title %>
## What This Is
<!-- The closed statement of what the system does and for whom, opening with one ==highlight== sentence. -->
## Current State
<!-- What is built versus specified, dated. Cite file and line, a commit, or command output for every code claim. -->
## Non-Goals
<!-- What it deliberately does not do, one bullet each. -->
---
type: project
status: active
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags: []
project_kind: plan
next:
related_progress: []
---
# <% tp.file.title %>
## Goal
<!-- The outcome in one sentence, with one ==highlight==. -->
## Sequence
<!-- Numbered steps in dependency order, each with how to tell it is done. Name what is out of scope this round. -->
## Open Questions
<!-- Tasks only, as - [ ] decisions that block the sequence. -->
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && cat Workflows/Projects/Prompt\ Cycle.md; sed -n 1,80p Standards/Frontmatter\ Standard.md
```
```
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Agent Prompt Standard]]"
trigger: A build or fix round on a codebase will be run by an agent session.
notes:
  - "[[Agent Prompt Template]]"
  - "[[Spec and Plan Standard]]"
---
# Prompt Cycle
Write the next prompt, run it, review the result against the repo, and archive it, so the queue only ever holds what runs next.
## Use when
A project like the internship research loop or CausalOps has a round of agent work to run. The Building System runs are the worked example.
## Steps
1. Open the queue note (`Claude Code Prompts`, `Codex Prompts`). It holds the next prompt and only that.
2. Check the evidence for Why This Exists against the live repo. A hypothesis the queue wrote itself is labeled, and said plainly when it turns out wrong.
3. Write the prompt from [[Agent Prompt Template]] with scope in Hard Rules and a Report Back section.
4. Run it in a fresh agent session.
5. Review Report Back against the repo: the commands and their output, not the agent's summary.
6. Move the finished prompt and its reviewed result to the Archive note and set its `status` to `complete`.
7. Rewrite the queue with the next prompt, and add a Log entry to the project note.
## Do not
Do not let finished prompts pile up in the queue, hand over an unchecked diagnosis, or accept a report you did not compare to the repo.
## Done when
- The queue holds only the next prompt.
- The finished prompt and its result are in the Archive note, with `status: complete`.
- The project Log names the round and what was verified.
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Conformance on Touch]]"
gold_standard: none
notes:
  - "[[Note Kit Standard]]"
  - "[[Conformance Standard]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
---
# Frontmatter Standard
==One closed vocabulary decides every note's `type` and `status`. Anything finer is a `*_kind` key, anything pipeline-specific is a scoped key, and nothing else becomes a new value.==
This is the canonical schema for note properties in Jarvis. Before it, the type and status lists lived in CLAUDE.md, Vault Operating System, and the templates, and the three disagreed (8, 12, and about 20 types, against 40+ in the notes). Vault Operating System now points here. A property that matters to one family only is defined in that family's Standard, not in this file.
## type
Seventeen values. A note has exactly one.
| type | What it is | Kind key | Allowed kinds |
|---|---|---|---|
| `input` | Captured or source-derived: a clip, summary, transcript, brief | `input_kind` | clipping, source-summary, pdf-summary, web-summary, video-summary, repo-card, transcript, brief, ai-conversation, ai-conversation-summary, job-dossier |
| `evergreen` | Distilled claim you understand and reuse | `evergreen_kind` | distilled, synthesis, identity |
| `concept` | One course or technical concept with mechanism and contrast | none | none |
| `class` | A course workspace note (week, lab, board, textbook) | `class_kind` | week, textbook, textbook-map, lab, homework, exam, exam-material, board, subboard, discussion, preparation, project, syllabus, control, track, audit |
| `project` | Active work with an outcome and a `next:` | `project_kind` | project, spec, plan, code-mirror, prompt |
| `plan` | A standing plan with a review cadence | none | none |
| `thought` | Personal working notes: daily, weekly, reflection | `thought_kind` | daily, weekly, monthly, yearly, reflection, brainstorm |
| `index` | A MOC: prose map of a folder | none | none |
| `dashboard` | A live query surface or board | `dashboard_kind` | dashboard, board, habit-board, field-os, depth-ladder, question-bank |
| `review` | A periodic or one-off review of work | `review_kind` | weekly, monthly, capability, internship-loop, ops, audit, curator, project |
| `output` | A deliverable made from understanding | `output_kind` | story, bullet, one-pager, prompt, post, resume, cover-letter |
| `action` | A link-dense map of next steps | none | none |
| `tracker` | One application or item moving through stages | none | none |
| `contact` | A person | none | none |
| `reference` | Stable lookup material | `reference_kind` | tool-profile, resource, plugin-doc, settings-doc, runbook, research, repo, program, company, diagram, link-hub |
| `system` | The vault's own rules, logs, and operating docs | `system_kind` | standard, workflow, contract, spec, log, runbook, guide |
| `generated` | Written by a tool, not by a person or an agent | `gen_kind` | code, rationale, document, community, index, report |
If two types seem to fit, pick by what the reader does with the note: studies it (`concept`, `evergreen`), executes it (`project`, `plan`, `tracker`), looks it up (`reference`), or follows it (`system`).
## status
One axis only. Maturity for knowledge, lifecycle for work.
| type | Allowed status | Default |
|---|---|---|
| `input`, `concept`, `evergreen`, `index`, `output`, `reference` | seed, sprout, tree, archived | seed |
| `class` | seed, sprout, tree, archived | seed |
| `thought` | seed, sprout, active, complete | seed (`active` for daily) |
| `project`, `plan`, `tracker`, `action` | active, paused, complete, archived | active |
| `contact` | active, paused, archived | active |
| `dashboard` | active, archived | active |
| `review` | seed, sprout, tree, complete | sprout |
| `system` | seed, sprout, tree, archived | sprout |
| `generated` | no `status` | none |
`seed` is a rough capture, `sprout` a working draft, `tree` trusted and stable. A maturity value moves up only when the note earns it. Never invent a status such as `raw`, `unreviewed`, `Preparing`, or `stale`; the next two keys exist for those.
## Machine and pipeline states
- `review_state: raw | unreviewed | reviewed` records whether a human or agent has checked a captured or generated note. It replaces `raw`, `unreviewed`, and `auto-generated` in `status`.
- `stage` holds a pipeline position such as `applied` or `interview`. It is owned by the Standard of the pipeline that uses it (the internship Standards), and its values are listed there.
## Universal keys
Required on every Tier 1 and Tier 2 note. Tier rules are in [[Conformance Standard]].
| Key | YAML type | Rule |
|---|---|---|
| `type` | text | One of the seventeen above |
| `status` | text | Allowed value for the type |
| `created` | date | `YYYY-MM-DD`, set once |
| `updated` | date | `YYYY-MM-DD`, set on a meaningful change only |
| `tags` | list | No `#`, no folder replicas; `[]` is allowed |
Optional everywhere: `notes` (list of wikilinks), `next` (text), `area`, `source_url`, `deadline` (date), `reviewed` (date), `track` (list), `source_status`, `related_progress`. The capability keys (`prerequisites`, `used_in`, `evidence`, `mastery_level`, `next_drill`, `drill_interval`, `question_status`, `source_concepts`) apply to the families that define them.
## YAML typing rules
- Numbers are bare: `mastery_level: 0`, never `"0"`. A quoted number turns into text in Properties and sorts as text in Dataview.
- Dates are bare ISO: `created: 2026-10-16`. A quoted date breaks date sorting the same way.
- Wikilinks are quoted strings: `"[[Note]]"`. Lists of them use one quoted item per line.
- Empty relational fields are `[]`. Empty scalars are left blank, never `""`.
- Keys are `snake_case` with no spaces or parentheses. No duplicate keys. `---` appears only twice in a file, to open and close the frontmatter.
- Files are UTF-8, LF, with no byte-order mark.
- Every wikilink in frontmatter points at a file that exists. A stub belongs in the body, labeled `(to create)`.
## Scoped keys
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents" && grep -rli "gupt0479\|google calendar\|gcal" --include=*.md Jarvis/10_Areas Jarvis/20_Progress Jarvis/30_Order Jarvis/40_Resources Jarvis/60_Claude "The Plan/00_Live" "The Plan/10_UMN" "The Plan/20_Progress" "The Plan/30_Order" "The Plan/40_Resources" "The Plan/60_Jarvis" 2>/dev/null | head -30
```
```
Jarvis/10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing.md
Jarvis/10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds.md
Jarvis/10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md
Jarvis/10_Areas/Life/Plans/Summer 2026/00 - Summer Plans Index.md
Jarvis/20_Progress/AI/Claude Code/.claude_windows/skills/synced/[REDACTED]/morning/SKILL.md
Jarvis/20_Progress/AI/Claude Code/OpsPilot/.claude/PRD.md
Jarvis/20_Progress/AI/Claude Code/second-brain-claudekit/_docs/Current-Setup.md
Jarvis/20_Progress/Degree/_Courses/_Courses Board.md
Jarvis/20_Progress/Internship/Resumes/Main Resume.md
Jarvis/20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md
Jarvis/30_Order/Standards/Operations/Daily Note Standard.md
Jarvis/30_Order/Workflows/Operations/Daily Close Loop.md
Jarvis/40_Resources/CS/Concepts/New Laptop/Old Laptop Rebuild/Runs/_backups/acer-5c-20261017/log.md
Jarvis/40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Build 7 Findings.md
Jarvis/40_Resources/CS/Concepts/New Laptop/Sync/Cross-Laptop Sync - Jarvis Wrap-Up.md
Jarvis/40_Resources/CS/Concepts/New Laptop/Sync/Google Drive Sync Policy.md
Jarvis/40_Resources/CS/Concepts/New Laptop/Sync/WSL Session Briefing.md
Jarvis/40_Resources/Obsidian/Dashboard/The Plan/The Plan Dashboard Daily Workflow and AI Loop.md
Jarvis/40_Resources/Obsidian/Dashboard/The Plan/The Plan Dashboard State and Gaps 2026-10-25.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Conversations/10-17 Second-brain conversation layer postmortem.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Home/09-21 Calendar connection and Wednesday schedule.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Home/09-24 VS Code professional setup configuration.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/09-19 Cross-laptop sync Build 7.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-04 Read .claudeskillsweekly-review.md and execute every step.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-07 Pointers and Addresses merge conflicts.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-14 Plans for The Plan and Jarvis.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-17 Second-brain conversation layer postmortem.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-21 Syncthing Obsidian sync conflicts.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-23 CPT, OPT, H1B visa rules.md
Jarvis/60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Jarvis/10-25 Read .claudeskillsweekly-reviewweekly-review.md and execute.md
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n -i "gupt0479\|google calendar\|gcal\|calendar" "10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds.md" "30_Order/Standards/Operations/Daily Note Standard.md" "30_Order/Workflows/Operations/Daily Close Loop.md" "20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md" "40_Resources/CS/Concepts/New Laptop/Sync/Google Drive Sync Policy.md" | cut -c1-400 | head -40; echo ======; cat "60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Home/09-21 Calendar connection and Wednesday schedule.md" | head -120
```
```
10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds.md:15:next: "Pick the tool stack for the Jarvis automations weekend project (Gmail, GCal, mobile-to-Obsidian) - currently unscoped"
10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds.md:32:**Jarvis automations** is the one genuinely new, unscoped build this session: a weekend (no date set yet) spent building real automations across Gmail, Google Calendar, and other information-providing tools, plus a pipeline that ingests videos shared from the phone - Reels, YouTube videos watched - landing in Obsidian somehow. `20_Progress/Proje
10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds.md:48:| Jarvis automations | Empty folder, nothing scoped | Real Gmail/GCal/mobile-to-Obsidian automations built and running |
30_Order/Standards/Operations/Daily Note Standard.md:21:  - "[[How to Use Google Calendar]]"
30_Order/Standards/Operations/Daily Note Standard.md:53:`*Goal*:` one line. Under it, `### 80 - The One Thing` holds one checkbox ("I will ... at ... in ..."); `### 20 - Supporting Work` holds two to four; `### Blocks` lists the day's calendar events, time then deliverable; `**Do NOT do today:**` is copied from the plan's anti-drift rules. All of it comes from the weekly Goals and the calendar, no
30_Order/Standards/Operations/Daily Note Standard.md:66:| text | The promise, as the weekly note, the calendar or the toggle named it. |
30_Order/Standards/Operations/Daily Note Standard.md:69:| `from` | `weekly` (a Goal or Friday checkpoint), `calendar` (a block that passed), `win`, `floor`, or `other`. |
30_Order/Standards/Operations/Daily Note Standard.md:78:Sources: a weekly Goal or Friday checkpoint not met, a calendar block that passed without its deliverable, a toggle still `false` at close, an open Lose from an earlier day. Lines are never deleted.
30_Order/Workflows/Operations/Daily Close Loop.md:16:  - "[[How to Use Google Calendar]]"
30_Order/Workflows/Operations/Daily Close Loop.md:20:Plan first, record second. The weekly note says what was promised, the calendar says when, the daily note says what happened, and Daily Loses holds the gap.
30_Order/Workflows/Operations/Daily Close Loop.md:25:2. It reads the weekly Goals, the Systems table and today's calendar blocks, read only ([[How to Use Google Calendar]]).
30_Order/Workflows/Operations/Daily Close Loop.md:29:6. `/closeday` reads the toggles, calendar, session log and weekly Goals. It proposes a Lose for each false toggle, passed block without evidence, or unmet Goal, then asks for the counts and each `why` and `fix` in one block.
30_Order/Workflows/Operations/Daily Close Loop.md:33:Do not fill End of Day from memory, type `wins_done` or `floors_done`, write a `why` for Anant, or write to the calendar. Do not tick a toggle without evidence. Do not delete a Lose: make it up with `[x]` or drop it with `[-]` and a reason.
20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md:36:| 2026-10-25 | Time layer | The W44 calendar rebuild and [[How to Use Google Calendar]]: events in a five-line format on the working calendar | The guide's frontmatter |
20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md:44:6. **The skills did not know the week.** `/startday` and `/closeday` read the Fall plan and the session log, not the weekly note's Goals or the calendar.
20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md:47:- **Standard and Workflow**: [[Daily Note Standard]] now says what each toggle feeds and defines Daily Loses: a task line with `why`, `fix`, `from` and `since`, and four marks (`[ ]` open, `[x]` made up, `[>]` carried, `[-]` dropped). [[Daily Close Loop]] was rewritten around the weekly note, the calendar, t
20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md:49:- **Skills**: `/startday` repairs leftover placeholders, reads the weekly Goals and today's calendar (read only), and carries open Loses forward by copying the line and marking the old one `[>]`. `/closeday` reads the toggles as evidence, proposes a Lose for each false toggle, passed block and unmet Goal, as
20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md:57:- The automation layer: Toggl time, phone screen time, calendar writes. It is designed in a separate step and nothing here depends on it.
40_Resources/CS/Concepts/New Laptop/Sync/Google Drive Sync Policy.md:39:A direct Drive search for "Backup" during this session's cleanup surfaced individual raw `.py` files actively uploading from the "UMN" backed-up folder, owned by the UMN university account (`gupt0479@umn.edu`): `BackupRead_BackupWrite.py`, `BackupEventLog.py`, `BackupSeek_streamheaders.py` — loose coursework source files, no
======
﻿---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Calendar connection and Wednesday schedule"
started_at: 2026-09-21T22:07:45
ended_at: 2026-09-21T22:08:44
exported_at: 2026-10-17T21:06:39
duration_minutes: 1
project: Home
cwd: 'C:\Users\anant'
session_id: [REDACTED]
status: raw
turn_count: 2
tools_used:
  mcp__claude_ai_Google_Calendar__list_calendars: 1
  mcp__claude_ai_Google_Calendar__list_events: 1
  ToolSearch: 1
tokens:
  input: 12
  output: 2072
  cache_creation: 51814
  cache_read: 309014
  total: 362912
cost_usd: 0.289803
model:
  - "claude-sonnet-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Calendar connection and Wednesday schedule

## You

What calendar are you connected to and what do you see registered for wednesday?

## Claude

You're connected to your primary Google Calendar (**gupt0479@umn.edu**), alongside several others in your calendar list (Todoist x2, VIT, US Holidays, DataTalks.Club, CSE Student Groups, Goldy's Winter Break, Partiful, UMN.LOL).

For **Wednesday, September 23, 2026**, on your primary calendar I see two events:

1. **AIIS Leadership meet** — 5:00–6:45 PM (Winnipeg time), at HSEC 2-193. Recurring meeting with several umn.edu attendees, organized by garg0088@umn.edu; your RSVP is still "needs action."
2. **Gym - Legs** — 5:15–7:00 PM (Chicago time), recurring, organized by you.

Note the two overlap by about 30–45 minutes depending on time zone conversion, if that matters for planning.

### Tool Calls

- `ToolSearch` -- `{"query":"select:mcp__claude_ai_Google_Calendar__list_calendars,mcp__claude_ai_Google_Calendar__list_events","max_results":5}`
- `mcp__claude_ai_Google_Calendar__list_calendars` -- `{}`
- `mcp__claude_ai_Google_Calendar__list_events` -- `{"startTime":"2026-09-23T00:00:00","endTime":"2026-09-24T00:00:00"}`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat "30_Order/Standards/Operations/Daily Note Standard.md"; echo =======; cat "30_Order/Workflows/Operations/Daily Close Loop.md"
```
````
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-26
tags:
  - system
  - standards
system_kind: standard
family: daily-note
tier: 2
maps_to:
  - "[[Better Today]]"
used_by:
  - "[[Daily Close Loop]]"
gold_standard: none
notes:
  - "[[Plan Standard]]"
  - "[[Periodic Review Note Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[How to Use Google Calendar]]"
---
# Daily Note Standard
==A daily note is the day's plan first and its record second: the toggles and Daily Loses keep the record honest.==
The Standard for `10_Areas/Life/Enumerate/Daily/` notes. `/startday` writes the plan and carries open Loses forward, `/closeday` counts the toggles and writes the Loses, and the note fits even if the day is never closed. Standing plans are [[Plan Standard]]; weekly, monthly, and yearly notes are [[Periodic Review Note Standard]].
## Spec
```json
{
  "family": "daily-note",
  "tier": 2,
  "match": {"type": "thought", "kind": "daily", "path": "^10_Areas/Life/Enumerate/Daily/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "active", "complete"],
  "required_keys": ["type", "status", "created", "updated", "tags", "thought_kind", "day_state"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "lc_count": "number", "study_today": "number", "wins_done": "number", "floors_done": "number", "win_project": "bool", "win_career": "bool", "win_cleanup": "bool", "win_review": "bool", "floor_1": "bool", "floor_2": "bool", "floor_3": "bool"},
  "headings": ["Morning Plan", "Daily Wins", "Daily Loses", "Daily Floor"],
  "optional_headings": ["Carryover from Previous Sessions", "Productivity", "End of Day"],
  "legacy_match": [{"path": "^10_Areas/Life/Enumerate/Daily/"}]
}
```
## What the toggles do
A toggle is a Meta Bind input bound to one frontmatter boolean. It is evidence, and three things read it:
- **Dashboard.** `00_Dashboard.md` counts `win_*` out of 4 and `floor_*` out of 3 live, and stores no copy.
- **`/closeday`.** It counts them into `wins_done` and `floors_done`, never asks, and turns every toggle still `false` into a Daily Loses line.
- **Weekly review.** It sums `wins_done` and `floors_done` across the week.
Nobody types the two totals. An unclosed day has them at 0 while the dashboard shows the live count.
## Headings
The title is the fixed prompt `# Did you get better today?`.
### Frontmatter
`type: thought`, `thought_kind: daily`, `status` (`active` while the day runs, `complete` once closed), `day_state` (`planned` or `closed`), `created`, `updated`, `tags: [daily]`. Tracking keys: the toggles `win_project`, `win_career`, `win_cleanup`, `win_review`, `floor_1` to `floor_3` (booleans); `lc_count` and `study_today` (typed numbers); `wins_done` and `floors_done` (counted at close).
> [!WARNING]
> A `created` that still holds `<% tp.date.now("YYYY-MM-DD") %>`. Periodic Notes copies the template, and Templater resolves the placeholder only when "Trigger Templater on new file creation" is on. Otherwise date queries skip the note. `/startday` resolves it to the file name's date.
### Morning Plan
`*Goal*:` one line. Under it, `### 80 - The One Thing` holds one checkbox ("I will ... at ... in ..."); `### 20 - Supporting Work` holds two to four; `### Blocks` lists the day's calendar events, time then deliverable; `**Do NOT do today:**` is copied from the plan's anti-drift rules. All of it comes from the weekly Goals and the calendar, not memory.
*Density:* the 80 is a single task.
> [!WARNING]
> Leaving the template's empty checkbox unfilled.
### Daily Wins
Four rows: Project, Career, Cleanup, Review. The target comes from the weekly Goals and is a deliverable ("CSCI 4061 P2: Part 1 tests pass"), not a topic; Done is a toggle.
### Daily Loses
==Promises not kept, written the day they slip, until made up.== One task line each, with inline fields:
```
- [ ] CSCI 4041: 5 problems logged in Weekly Set [why:: opened YouTube first, no slot] [fix:: laptop opens on DSA.md at 9:30] [from:: weekly] [since:: 2026-10-26]
```
| Field | Holds |
|---|---|
| text | The promise, as the weekly note, the calendar or the toggle named it. |
| `why` | Why, how and where it slipped, in Anant's words. The assistant asks and never invents it. If unanswered, `(unanswered)`. |
| `fix` | One concrete change that makes the same loss less likely. Not a wish. |
| `from` | `weekly` (a Goal or Friday checkpoint), `calendar` (a block that passed), `win`, `floor`, or `other`. |
| `since` | The date it first slipped. It never changes, so age is `today - since`. |
The checkbox mark is the state:
| Mark | Meaning |
|---|---|
| `[ ]` | Open. Counts on the dashboard and ages one day each midnight. |
| `[x]` | Made up. It stays in the note as a record, and the dashboard drops it. |
| `[>]` | Carried. `/startday` copied it to the new day and marked the old line. Only the newest copy is open. |
| `[-]` | Dropped on purpose. Needs a reason in `why`. |
Sources: a weekly Goal or Friday checkpoint not met, a calendar block that passed without its deliverable, a toggle still `false` at close, an open Lose from an earlier day. Lines are never deleted.
### Daily Floor
Rows come from the active plan's Systems table, not the template: track, target, topic, and a `floor_n` toggle.
> [!WARNING]
> A heading that names the term ("Fall Daily Floor"). It breaks next term, and a skill that patches by name stops finding it.
### Carryover from Previous Sessions (optional)
Work the session log left open. Broken promises go in Daily Loses.
### Productivity (optional)
Inputs bound to `lc_count` and `study_today`, no totals. No meals, water, or health tracking: that belongs in The Plan ([[AGENTS]], golden rule 6).
### End of Day (optional)
Appended by `/closeday`: a scorecard, `Day Status` GREEN or RED, `What Actually Happened` in two or three honest sentences, a `Friction Fix` when RED, and `Preview Tomorrow`. Never written from memory; an unclosed day stays `planned`.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `thought_kind: reflection` | `daily` | mechanical |
| `status: seed` | `active`, or `complete` if End of Day exists | mechanical |
| No `day_state` | `closed` if End of Day exists, else `planned` | mechanical |
| `tags: ["#journal"]` | `[daily]` | mechanical |
| `created` empty or an unresolved `<% %>` | The date in the file name | mechanical |
| `## Fall Daily Wins`, `## Summer OS Checklist` | `## Daily Wins` | mechanical |
| `## Fall Daily Floor`, `## Academic Stack` | `## Daily Floor` | mechanical |
| `ac_application`, `ac_leetcode`, `ac_class`, and the Summer `ac_*` toggles | `floor_1`, `floor_2`, `floor_3` by row order, in frontmatter and in the `INPUT[toggle:...]` cells | mechanical |
| `### 80 — The One Thing` (em dash) | `### 80 - The One Thing` | mechanical |
| `**Wins hit:** INPUT[number:wins_done]` typed by hand | Remove the line; `/closeday` writes the count | mechanical |
| `habits_done` | Not written any more; the floor toggles replace it | mechanical |
| Daily Loses as a bare numbered list | Task lines with `why`, `fix`, `from`, `since` | judgment: the why is Anant's |
| Meals and Water table, a Physical win row | Remove; it belongs in The Plan | judgment |
## Done Conditions
- Frontmatter passes the Spec, and `day_state: closed` appears only when End of Day exists.
- Morning Plan has a filled 80, at least two 20 items, and Blocks or "connector unavailable".
- Every open Lose has `since`; a missing `why` reads `(unanswered)`.
- No heading names a term.
- A closed day has `wins_done` and `floors_done` equal to the toggle count, End of Day, and `status: complete`.
- A day left `planned` is counted in the weekly review, not failed ([[Daily Close Loop]]).
## Gold Standard Example
None yet. Name the first daily made from [[Better Today]] and closed with `/closeday`. The closest old-shape note is [[2026-10-05]].=======
---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-26
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Daily Note Standard]]"
trigger: The working day starts with /startday or ends with /closeday.
notes:
  - "[[Better Today]]"
  - "[[Plan Standard]]"
  - "[[Plan Review Cadence]]"
  - "[[How to Use Google Calendar]]"
  - "[[2026-W44]]"
---
# Daily Close Loop
Plan first, record second. The weekly note says what was promised, the calendar says when, the daily note says what happened, and Daily Loses holds the gap.
## Use when
The day opens with `/startday` or closes with `/closeday`. Closing is optional: the dashboard still shows live toggle counts and open Loses, and holds no number of its own.
## Steps
1. `/startday` finds or creates today's note from [[Better Today]], resolves any leftover `<% %>` date, and never creates it elsewhere.
2. It reads the weekly Goals, the Systems table and today's calendar blocks, read only ([[How to Use Google Calendar]]).
3. It carries each open Lose forward: the line is copied with its original `since`, and the old line becomes `[>]`.
4. It fills Morning Plan, Wins targets and Floor rows, and patches only the three `today_*` fields of `00_Dashboard.md`. `day_state` stays `planned`.
5. Work the day. Tick a toggle only with evidence. Write a Lose when a promise slips.
6. `/closeday` reads the toggles, calendar, session log and weekly Goals. It proposes a Lose for each false toggle, passed block without evidence, or unmet Goal, then asks for the counts and each `why` and `fix` in one block.
7. It writes `lc_count`, `study_today`, `wins_done` and `floors_done` (counted), the confirmed Loses and End of Day, sets `day_state: closed`, clears the `today_*` fields, and logs one line.
8. An unclosed day stays `planned` and its Loses carry on. `/weekly-review` counts unclosed days, sums wins and floors, and lists open Loses with ages.
## Do not
Do not fill End of Day from memory, type `wins_done` or `floors_done`, write a `why` for Anant, or write to the calendar. Do not tick a toggle without evidence. Do not delete a Lose: make it up with `[x]` or drop it with `[-]` and a reason.
## Done when
- Today's note has a real `created` date and a matching `day_state`.
- A closed day has the counts equal to the toggles, every slipped promise in Daily Loses, and a session-log line.
- The dashboard's numbers match the note.
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && f=$(find . -name "How to Use Google Calendar.md" -not -path "./.git/*" | head -3); echo "$f"; cat "$(echo "$f" | head -1)"; echo ======; cat "20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md"
```
````
./60_Claude/07_AI_Information/How to Use Claude/How to Use Google Calendar.md
---
type: system
status: sprout
created: 2026-10-25
updated: 2026-10-25
tags:
  - system
  - guide
  - calendar
system_kind: guide
notes:
  - "[[10_Areas/Life/Enumerate/Weekly/2026-W44|2026-W44]]"
  - "[[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - What Was Done (2026-10-25)|W44 Calendar Rebuild - What Was Done]]"
  - "[[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - Actions (2026-10-25)|W44 Calendar Rebuild - Actions]]"
  - "[[60_Claude/07_AI_Information/How to Use Claude/Track Conversations|Track Conversations]]"
---
# How to Use Google Calendar
This guide covers what the Google Calendar connector is for, what it can and cannot touch, which of the ten calendars on the account matter, and the rules any Claude model follows before writing to one. Everything here was checked against the live account on 2026-10-25 during the W44 rebuild ([[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - What Was Done (2026-10-25)|What Was Done]]). If a calendar name or count below no longer matches, re-run `list_calendars` before trusting the rest.
## What it is
The connector is the claude.ai Google Calendar integration. In Claude Code its tools are named `mcp__claude_ai_Google_Calendar__*`, and it acts as `gupt0479@umn.edu`, the UMN Google account. It is not the `jarvis` or `the-plan` Obsidian MCP, and it cannot read the vault.

Calendar is the time layer: when a task happens, where, and for how long. What the task is comes from Obsidian: the weekly note, the plans in `10_Areas/Life/Plans/`, and the course boards. An event is a pointer to that work, never the only place the work is described.
## Use when
- Sunday planning, after the new weekly note's Goals exist: placing the week's tasks as blocks.
- Before `/startday`, to read what is on today, or before agreeing to a new deadline, to see what it collides with.
- Rewriting a vague block ("CSCI 4521 Catch Up") into the event format below.
- During `/closeday`, moving a missed block into the next free slot.

Not for task content that belongs in a note, for one-off timed reminders (see the platform split in [[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - Actions (2026-10-25)|Actions]]), or for the 12-week map, which lives in Todoist and [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]].
## What it can do

| Tool | What it does | Used on 2026-10-25 |
|---|---|---|
| `list_calendars` | Lists calendars the account owns or subscribes to. This is a subset; a calendar outside the list is reachable only by its exact id. | Yes |
| `list_events` | Events on one calendar in a time range. By default it returns only regular, out-of-office, focus-time, and Gmail events. | Yes, three calendars |
| `search_events` | Semantic search on the primary calendar only. | Yes, found nothing for lecture names |
| `get_event` | One event by id. | Yes, to confirm an edit stuck |
| `create_event` | A new event: title, times, description, location, color, reminders, recurrence, attendees. | 19 created |
| `update_event` | Changes any field on one event, or on one date of a recurring series. | 43 updated |
| `delete_event` | Deletes an event. | Not used |
| `respond_to_event` | Accept, decline, or tentative on an invite. | Not used |
| `suggest_time` | Finds free slots across calendars. | Not used yet; it is the right tool for placing buffers |

Three fields matter more than the rest:
- **`overrideReminders`** sets popup or email reminders per event. This is the lever for phone notifications. The working calendar has no default reminder, as the calendar table below shows.
- **`colorId`** colors one event, which allows color-coding by kind of block.
- **`notificationLevel: NONE`** stops Google from emailing attendees about an edit. Every write on 2026-10-25 used it.
## What it cannot do
- Rename, create, delete, hide, or recolor a whole calendar, or change a calendar's default notifications. Those are settings in the Google Calendar app.
- Read or write Google Tasks, phone reminders, or Todoist. None of the three has a tool in this session.
- See the UMN class blocks (lectures, the CSCI 4061 lab, the CSCI 4511W discussion). They show in the app, but no listed calendar holds them and `search_events` finds nothing. Their source is unknown. Treat them as fixed anchors, read from a screenshot or the course boards.
- Change a meeting someone else owns for everyone (see Meetings).
- See the "Office" working-location bar unless working-location events are requested explicitly.
- Confirm that a reminder actually buzzed the phone.
- Edit a whole recurring series by editing one date. Six of the W44 edits were single dates of recurring events (Short Quiz, Quiz & Lab, Lab Due, CSCI 5304 Quiz, Mass Apply, CSCI 4511W Homework - 2). Next week those dates show the old title again.
## The calendars
The account has ten calendars. Two are in active use, and the class schedule comes from somewhere the connector cannot see.

| Calendar | Time zone | What it holds | How to treat it |
|---|---|---|---|
| `gupt0479@umn.edu` (primary) | America/Chicago | Gym and calisthenics (recurring, 6am), plus every invite: CodePath, TIP103, cricket, AIIS, the CSCI 4511W office-hour booking | Read it. Write only to events you own. Default reminder: popup at 10 minutes. |
| "Todoist" (id starts `c_2195`) | America/Chicago | Every red work block. Despite the name, it is a plain Google calendar, filled by hand and by Claude. It stopped syncing with the Todoist app long ago. | The working calendar. Read and write here. The API reports no default reminder. |
| "Todoist" (id starts `2a35`) | Asia/Kolkata | Nothing in W44; last changed 2026-10-13 | Ignored. Candidate to hide. |
| VIT | Asia/Kolkata | A VIT (India) class timetable, created by another account and shared with full rights. Almost all of it lands overnight in Chicago. BSSC102N (8:20-9pm IST) lands Wed 9:50-10:30am. | Ignored for planning. It caused the Wednesday overlap. |
| Holidays in United States | America/Chicago | Public holidays (Halloween shows Sat 10/31) | Read only, ignored |
| DataTalks.Club events | Europe/Berlin | Community events | Ignored, not read |
| CSE Student Groups' Events Calendar | America/Chicago | Shared student-group meetings | Ignored, not read |
| Goldy's Winter Break Calendar 2025-26 | America/Chicago | Last winter's campus events | Ignored, stale |
| Partiful | UTC | Imported event invites | Ignored, not read |
| UMN.LOL Schedule | UTC | A club schedule | Ignored, not read |

"Not read" means the row describes the calendar from its own name and description only.
## Meetings
A meeting is any event that someone else organizes or that has other attendees. In W44 those are:
- the CodePath 1:1 Resume Review (organizer: CodePath's review calendar, on Zoom)
- the TIP103 live classes (the Technical Interview Prep calendar)
- UMN Cricket practice
- the AIIS Leadership meet
- the CSCI 4511W office-hour booking

Meetings are anchors. Claude never moves, renames, or rewrites them, because a change either does not reach the organizer or notifies other people. The one allowed action is an RSVP through `respond_to_event`, when asked. Preparation for a meeting goes in a separate block you own, placed before it. "Resume: 3 questions ready for the 11:30 CodePath 1:1" is that pattern: your own 10:30 event, ahead of CodePath's 11:30 one.
## Time zones
The calendar's zone is America/Chicago. The app shows GMT+04 as the main column and U.S. as the second, so screenshots carry both; read the U.S. column. The tools take local times with no offset (`2026-10-26T07:30:00`) and resolve them in America/Chicago. Some events store another zone ("Rate yourself" is in Asia/Kolkata, TIP103 in America/Los_Angeles), but their timestamps carry correct offsets, so trust the offset over the zone label.
## The event format
Every block has a title made of the course or project, a verb, and the deliverable: `CSCI 4061 P2: all tests pass locally`, not `CSCI 4061 Project Completed`. The description is five plain-text lines, with no HTML:

```
WHAT:  the thing that exists when the block ends
WHY:   one line on what it unblocks
HOW:   the source to open, the steps, the time cap
WHERE: the place, plus the vault path the output lands in
BY:    the hard stop, and what proves it is done
```

Friday blocks are checkpoints, titled "By Fri: ...", not work sessions. The Saturday 4pm block audits them in the weekly note.
## Rules for Claude models
1. **Read before writing.** List the week on the primary and working calendars first. Never plan from memory or from an old screenshot.
2. **Write to the working calendar.** Work blocks go only to the `c_2195` "Todoist" calendar. The primary calendar is for events the user already owns there. Never write to VIT, holidays, or any subscribed calendar.
3. **Leave meetings alone** except for an RSVP the user asked for.
4. **Silence every write** with `notificationLevel: NONE`.
5. **Format every block.** Use a deliverable title and the five lines. If you cannot fill WHAT, ask instead of inventing it. "Laptop Builds - 6 & more" was left alone for that reason.
6. **Apply the buffer rules before placing anything.** They are in [[60_Claude/20_Distilled_Notes/W44 Calendar Rebuild - Actions (2026-10-25)|Actions]]: 10 minutes between blocks, travel time, meals, at most 3 hours without a break, one overflow block a day, and one dev task per evening.
7. **Propose, then write.** For a whole week, put the block table in the weekly note and get a yes before bulk-creating. A single move during `/closeday` can go straight in.
8. **Set reminders explicitly.** Pass a popup at 5 minutes, because the working calendar has none by default.
9. **Edit one date of a recurring event** unless the user asks for the whole series, and say that next week will revert.
10. **Do not delete.** Rename, move, or ask.
11. **Count after writing.** Re-list the week and report exact numbers. On 2026-10-25 the chat reply said 36 events were rewritten when the real number was 43.
12. **Take dates from the board, not a block.** Exam and due dates come from the course board, never from a calendar title. W43's CSCI 5304 midterm block said Wednesday; the midterm was Tuesday 10/20 ([[20_Progress/Degree/CSCI 5304/CSCI 5304 Board|CSCI 5304 Board]]).
13. **Keep descriptions shareable.** They reach the phone and anyone the calendar is shared with, so no secrets and no personal-life content.
## Suggestions
- Rename the `c_2195` calendar from "Todoist" to "Blocks" in the app. The name led a model (this one) to assume a sync that does not exist.
- Hide VIT and the empty second "Todoist" calendar from the main view.
- In the app, set the working calendar's default event notification to 5 minutes, then confirm one test event buzzes the phone.
- Color by kind with `colorId`: classes and meetings as anchors, prep, coursework, dev, daily defaults, and Friday checkpoints.
- Keep phone reminders for one-off actions that are too small for a block. If Claude should place those too, a separate "Reminders" calendar is the way, because the connector cannot reach any reminders app.
## Do not
- Do not let an event title define a task. The weekly note does.
- Do not place blocks edge to edge.
- Do not expect an event on the "Todoist" calendar to create a Todoist task. Nothing syncs.
======
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - jarvis
  - dashboard
  - build-record
project_kind: spec
next: Turn on Templater's "Trigger Templater on new file creation", run /startday and /closeday once on a real day, and name the first closed daily as the Daily Note Standard's gold example.
related_progress:
  - '[[Jarvis Build History - July to October 2026]]'
  - '[[Jarvis Build Overview]]'
  - '[[The Plan Overview]]'
  - '[[Daily Note Standard]]'
  - '[[Daily Close Loop]]'
---
# Jarvis Dashboard Build Record
## What This Is
==This is the dated record of how Jarvis's daily dashboard and daily-note workflow were built and rebuilt, July to October 2026, kept so the next change starts from what exists and not from a memory of it.==
It covers `00_Dashboard.md`, the homepage canvas, the daily note and its template, and the `/startday` and `/closeday` skills. What each part is and what it shows is in [[Jarvis Build Overview]]. The infrastructure around it (sync, tasks, memory) is in [[Jarvis Build History - July to October 2026]] and [[Jarvis Current State - 2026-10-17]]. The Plan's dashboard is a separate build: [[The Plan Overview]].
## Current State
### Chronology
| Date | Build | How | Evidence |
|---|---|---|---|
| 2026-04-23 | `00_Dashboard.md` created | A markdown page with a Dataview list | Frontmatter `created` |
| 2026-07-02 and 07-03 | First dashboard pass with Fable 5 | Meta Bind inputs bound to frontmatter targets, a weekly DataviewJS roll-up, `dashboard.css` with `.stat-tile` and `.card`, a write-guard allowlist for daily-operations paths, directory skills, five agents | `Fable Prompt - Dashboard and Ingestion Pass`, "What was done in Pass 1" |
| 2026-07-04 | Visual rebuild | `10_Areas/Jarvis OS Dashboard.canvas` rebuilt at 1600 px with ten text nodes and no edges. The brief's Meta Bind syntax `file(00_Dashboard)` does not exist; the session read the plugin docs and used `INPUT[text:00_Dashboard#today_focus]`. Homepage was repointed at the canvas by editing `.obsidian/plugins/homepage/data.json`. A second canvas, an Excalidraw Claude OS map, and `dashboard.css` additions for the progress bar and tile colours followed. `00_Dashboard.md` was rebuilt as a Multi-Column Markdown page | `07-04 Rebuild Jarvis dashboard canvas and Excalidraw OS map` |
| 2026-07-08 | Skill repair | `startday` still read a deleted habit board; both skills counted five wins after the Physical win moved to The Plan. Fixed to four wins and the current board | `07-08 Fix corrupted daily note template and habit tracker` |
| 2026-07-10 | Tickable Done column | Obsidian does not render checkboxes inside table cells. Each Done cell became a Meta Bind toggle bound to a frontmatter boolean (`win_project`, `win_career`, `win_cleanup`, `win_review`, then Summer `ac_*`) | `07-10 Fix untickable checklist in table` |
| 2026-09-15 | Fall 2026 layout | Headings `Fall Daily Wins` and `Fall Daily Floor`, three floor rows (application, LeetCode/CodePath, class step) | `09-15 Fall 2026 semester planning and vault setup` |
| 2026-09-20 | DataviewJS risk audit | Every dashboard block read and judged read-and-render. The `innerHTML` pattern is safe only while the interpolated values are numbers | [[Dataview and Dashboards]] |
| 2026-10-04 | Sync banner | Competing dashboard writers replaced by per-machine banner files and a stable embed at the top of `00_Dashboard.md` | Sync Build 11 in [[Jarvis Build History - July to October 2026]] |
| 2026-10-16 | Standard and Workflow | [[Daily Note Standard]] and [[Daily Close Loop]] created; the template mapped to the registry | Both notes' `created` |
| 2026-10-25 | Time layer | The W44 calendar rebuild and [[How to Use Google Calendar]]: events in a five-line format on the working calendar | The guide's frontmatter |
| 2026-10-26 | Daily workflow rebuild | See below | This note |
### The 2026-10-26 findings
1. **The Done toggles fed nothing.** No skill, query, script or canvas read `win_*` or `floor_*`. `wins_done` was a number typed by hand, and `/closeday` asked for it in chat.
2. **Two dashboards, one stale.** `00_Dashboard.md` and the homepage canvas held the same queries by hand. Both read `lc_today`, `wins_done` and `study_today` from the dashboard's own frontmatter, last set on 2026-10-09, while the daily notes used `lc_count`. The week total never saw today.
3. **Unrendered dates.** Six dailies carried `<% tp.date.now(...) %>` in `created` or `updated`, including today's. Periodic Notes copies the template, and Templater's "Trigger Templater on new file creation" is off in `data.json`, so the placeholder is never resolved.
4. **Template and Standard disagreed.** The template had the invalid key `wins:loses (ratio):`, used `study_hours` where everything else used `study_today`, and had no `win_*` or `floor_*` keys to bind to.
5. **Daily Loses was free text.** Nothing carried an unfinished promise forward or showed its age.
6. **The skills did not know the week.** `/startday` and `/closeday` read the Fall plan and the session log, not the weekly note's Goals or the calendar.
### What changed
- **Template** [[Better Today]]: frontmatter now holds the seven toggles, `lc_count`, `study_today`, `wins_done`, `floors_done`. Morning Plan gains a `### Blocks` heading and checkbox 80 and 20 lines. Daily Loses gets its line format. The typed "Wins hit" input is gone.
- **Standard and Workflow**: [[Daily Note Standard]] now says what each toggle feeds and defines Daily Loses: a task line with `why`, `fix`, `from` and `since`, and four marks (`[ ]` open, `[x]` made up, `[>]` carried, `[-]` dropped). [[Daily Close Loop]] was rewritten around the weekly note, the calendar, the toggles and the Loses. Both pass `vault-lint --kit` apart from the template's old table-body warnings.
- **Dashboard and canvas**: both now read only today's daily note and every note's open Loses. Wins `n/4`, Floor `n/3`, problems, study hours and open Loses are tiles; the old habit bar and static habit list are replaced by a Wins and Floor bar and an aged Loses list. `lc_today`, `study_today` and `wins_done` were removed from the dashboard's frontmatter, which now holds only the three `today_*` lines.
- **Skills**: `/startday` repairs leftover placeholders, reads the weekly Goals and today's calendar (read only), and carries open Loses forward by copying the line and marking the old one `[>]`. `/closeday` reads the toggles as evidence, proposes a Lose for each false toggle, passed block and unmet Goal, asks only for counts and each `why` and `fix`, and writes `wins_done` and `floors_done` as counts. The `daily-operator` agent and two skill-table notes were updated to match.
- **Notes repaired**: today's note was moved to the new shape with the existing Lose kept word for word, and the five older dailies had their dates resolved from the file name.
### Not done
- Templater's setting is under `.obsidian`, so it is Anant's to switch on.
- The copies in `.agents/skills/startday` and `.agents/skills/closeday` already differed from the `.claude` skills and were left alone.
- Nothing was run end to end on a real day. The `dataviewjs` blocks were syntax-checked with Node and not rendered in Obsidian. Ticking a task from `dv.taskList` is not yet confirmed to write back.
- Changes are not committed.
## Non-Goals
- The automation layer: Toggl time, phone screen time, calendar writes. It is designed in a separate step and nothing here depends on it.
- Any change to The Plan's vault. Cross-vault reads go through `/jarvis-dump` there, never writes.
- Merging the canvas and the markdown page into one landing page. That is worth doing and was not asked.
## Open Questions
- [ ] Should Jarvis keep two landing pages, or point the canvas at the markdown page?
- [ ] Does a tick from the Daily Loses list on the dashboard write back to its source note?
- [ ] Should the weekly review use the Sunday-start week that Periodic Notes names, or an ISO week as The Plan's standard says?
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 1,90p "10_Areas/Life/Enumerate/Weekly/2026-W44.md" | cut -c1-300; echo =====; f=$(find 30_Order/Templates -name "Better Today.md"); echo $f; cat "$f"
```
````
---
type: thought
thought_kind: weekly
status: sprout
created: 2026-10-25
updated: 2026-10-25
period: "2026-W44"
review: "[[60_Claude/30_Reviews/Weekly Synthesis/Weekly Synthesis — 2026-W43]]"
tags:
  - weekly
next: "CSCI 4061 Project 2 due Fri 10/30 11:59pm. Both parts are still untouched starter code."
---
# 2026-W44
> [!NOTE] Summary: Catch-up week. Every course gets closed through Week 8, CSCI 4061 Project 2 ships Friday, and the dev 80 (Portfolio, ClaudeKit, Local AI) runs only after 6pm. Every day opens with a daily note and CSCI 4041 problems, and closes by 10:30pm. After this week, 9 weeks of 2026 are left

## Goals

**The day, every day:**
1. Morning is gym, breakfast, then the laptop. Open today's daily note first (`/startday`). Then 5 CSCI 4041 problems from `DSA.md` Week 3, each logged in `Weekly Set.md`. Then one internship action: the cover letter on Monday, one application every day after.
2. The calendar runs the day from there. The block before each lecture is that lecture's prep and finishes inside its own time. CSCI 5304 is the one exception: its block sits after the lecture.
3. Coursework lives in the daytime blocks. Dev work (Portfolio, ClaudeKit, Local AI, automations) starts at 6pm and not before.
4. Every dev block runs on a timer. When it ends, write one line on where you stopped and move on.
5. Close by 10:30pm (`/closeday`). Every block gets ticked or marked missed with a reason. Nothing is scheduled after 10:30.

**The 80, UMN:**
- [ ] CSCI 4061 Project 2 submitted by Fri 10/30. Part 1 is `swish` shell pipelines (n-1 pipes, redirection, SIGPIPE). Part 2 is the Hadamard product three ways (pipes, shared memory, pthreads) called from Python through a C extension. Learn it from Weeks 2-8 rather than chasing tests, because each 
- [ ] CSCI 5304 Weeks 1-8 studied and written: the Week 1 and Week 8 weekly notes, textbook Lectures 13-18, a HW3 note, and one concept map that traces the CSCI 2033 core (span, rank, orthogonality, LU, least squares, eigenvalues) into each 5304 lecture. [[20_Progress/Degree/CSCI 5304/CSCI 5304 Boar
- [ ] CSCI 4061 Weeks 5-8 notes (shared memory, multiplexed I/O, C/Python interop, threads, synchronization). Midterm 2 is Thu 11/12.
- [ ] CSCI 4521 Week 8 note (DBSCAN, regression, PyTorch, gradient descent), HW2's status settled, HW3 (due Tue 11/3) started.
- [ ] CSCI 4511W Weeks 5-8 notes (Ch 4 local search, Ch 5 games), Short Quiz 07 (Mon 6pm), Discussion Participation (Fri 11:59pm), and Writing 2 plus PS2 Q4-5 confirmed submitted.
- [ ] MGMT 3015 Ch 5, 6 and 12 notes, plus one concept map applied to the group's idea that feeds the Wed 11/4 pitch slides.

**The 80, Development:**
- [ ] Portfolio: UI repolished, Orby on the updated model and guardrailed, security checks, Clerk/OAuth, images, animations, Cloudflare deployment check. [[20_Progress/Projects/CS/Portfolio/Portfolio|Portfolio]].
- [ ] ClaudeKit: Codex and Claude conversations captured on both laptops, ingestion from the repo clones, home-directory settings, skills and agents in sync, recurring scheduled tasks running in Jarvis and secondbrain-claudekit. Notes: `20_Progress/Projects/AI Use/Claude Kit/` (last Log entry 2026-0

**The 80, Others:**
- [ ] Local AI: a small local model runs one meaningful repetitive task on a schedule, with a per-run log of what changed and why it got better. Personal side: The Plan workflow running on Jan. The only source today is the 10-17 Local AI build plan clipping; [[20_Progress/Projects/AI Use/Ollama|Olla
- [ ] Both vaults: dashboard, plans, and daily notes written every day, morning and night.

**Friday checkpoints (due by end of Fri 10/30, audited here Sat 4pm):**
- [ ] CSCI 4061 Project 2 submitted on Gradescope
- [ ] CSCI 5304 Weeks 1-8 done and the 2033 map exists
- [ ] CSCI 4521 caught up through Week 8
- [ ] MGMT 3015 entrepreneur map exists
- [ ] CSCI 4041 Units 1-5 reviewed, every morning problem logged
- [ ] `Main Cover Letter.md` exists and 5 applications sit in `Applied/`
- [ ] CSCI 4511W Writing 2 and Discussion Participation submitted

**Carried from W43, and why each one slipped:**

| Item | State at W43 close | Why it slipped |
|---|---|---|
| Internship: cover letter and first application | 29 researched, 0 applied, frozen 29 days | Only ever scheduled as all-day "Mass Apply" or "Internship Loop work". No time, no finish line. |
| CSCI 4041 / LeetCode daily | 0 logged, `Weekly Set.md` 0/20 | "First thing on the laptop" never had a calendar slot, and two trackers compete for the same job. |
| Daily notes and dashboard | 0 of 7 days | No open or close slot existed, so nothing forced either. |
| Assessment outcomes | 4 sat with no outcome note | "Log it the same day" was a rule with no block behind it. |
| Portfolio, TradingView, automations | zero commits | Exam week carried a normal dev load (2.5 hours of Local AI on exam day). |
| ClaudeKit conversation capture | partial: both exporters fixed, the layer's notes written, the both-laptop loop not running | Real progress with no done-definition, so it still reads as unfinished. |
| Hackathon entry (Fall plan row for 10/19) | no entry | Never on the calendar. Left out of W44 on purpose. |

Was it wishful time management? Yes, in three specific ways. Blocks named topics instead of deliverables. The daily defaults had no time at all. Exam days were planned as if exams cost nothing. The W44 calendar fixes the first two. The third is still a risk, below.

> [!WARNING] Where the W44 calendar is still wishful
> - CSCI 4061 Project 2 gets about 4.5 hours (Mon 4:45-6:15, Tue 12:30-1, Thu 12:30-1 and 4:15-5, Fri 12-1) for two untouched parts and four implementations. If Part 1's tests don't pass by Tuesday's close, Wednesday's 6:30-8pm ClaudeKit block goes to the project.
> - Tuesday cricket runs 9-11pm, past the 10:30 close.
> - Wednesday's VIT BSSC102N event overlaps the 9am CSCI 5304/4521 lock-in.
> - No block has a buffer. A block that runs out stops anyway, and the leftover goes into that night's close.

**Calendar format, every event from now on:**

Title: the course or project, then a verb and the deliverable (`CSCI 4061 P2: all tests pass locally`). Description, five lines:

```
WHAT:  the thing that exists when the block ends
WHY:   one line on what it unblocks
HOW:   the source to open, the steps, the time cap
WHERE: the place, plus the vault path the output lands in
BY:    the hard stop, and what proves it is done
```

Friday events are checkpoints ("By Fri: ..."), not work sessions. Saturday's 4pm block audits them in this note.

**Assessments already sat, outcomes still to record:** CSCI 5304 Midterm (Tue 10/20), CSCI 4521 Quiz 3 (Thu 10/22), and CSCI 4511W Long Quiz 1 (Wed 10/14) were reported as "45-1, 40, 61", with the course-to-score mapping not yet confirmed. CSCI 4061 Midterm 1 (Thu 10/8) has no outcome recorded.

## Productivity
<!-- What landed, with the note, commit, or number that shows it. Evidence, not mood. -->
## Good habits
<!-- One or two specific behaviors that worked. -->
## Bad habits
=====
30_Order/Templates/Enumerate/Better Today.md
---
type: thought
thought_kind: daily
status: active
day_state: planned
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - daily
notes: []
next:
win_project: false
win_career: false
win_cleanup: false
win_review: false
floor_1: false
floor_2: false
floor_3: false
lc_count: 0
study_today: 0
wins_done: 0
floors_done: 0
---
# Did you get better today?
> [!NOTE] Summary:
## Morning Plan
<!-- From the weekly Goals. 80 and 20: I will [BEHAVIOR] at [TIME] in [LOCATION]. Blocks: today's calendar events, time then deliverable. -->
*Goal*: ==You get to do==
### 80 - The One Thing
- [ ] 
### 20 - Supporting Work
- [ ] 
### Blocks
**Do NOT do today:**
## Daily Wins
<!-- Four rows. Targets come from the weekly note and the active plan; Done is a toggle. -->

| Win     | Target | Done                        |
| ------- | ------ | --------------------------- |
| Project |        | `INPUT[toggle:win_project]` |
| Career  |        | `INPUT[toggle:win_career]`  |
| Cleanup |        | `INPUT[toggle:win_cleanup]` |
| Review  |        | `INPUT[toggle:win_review]`  |
## Daily Loses
<!-- One line per promise not kept: - [ ] what [why:: ] [fix:: ] [from:: weekly] [since:: YYYY-MM-DD] -->
## Daily Floor
<!-- Rows come from the active plan's Systems table. Never put the term in a heading. -->

| Track | Target | Topic | Done                    |
| ----- | ------ | ----- | ----------------------- |
|       |        |       | `INPUT[toggle:floor_1]` |
|       |        |       | `INPUT[toggle:floor_2]` |
|       |        |       | `INPUT[toggle:floor_3]` |
## Productivity
<!-- Typed numbers only. Wins and floor totals are counted from the toggles by /closeday and the dashboard. -->
**LeetCode today:** `INPUT[number:lc_count]`
**Study hours:** `INPUT[number:study_today]`
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && for n in "Plan Standard" "Plan Review Cadence" "Periodic Review Note Standard" "Vault Lint" "Note Kit Standard" "Reference Standard"; do printf "%s: " "$n"; find 30_Order -name "$n.md" | head -1; done; ls "20_Progress/Mentorship Program/Plans" 20_Progress/Degree/_Courses 2>&1 | head -20; sed -n 1,40p "10_Areas/Life/Plans/Plans Board.md" | cut -c1-250
```
```
Plan Standard: 30_Order/Standards/Plan Standard.md
Plan Review Cadence: 30_Order/Workflows/Ingestion/Plan Review Cadence.md
Periodic Review Note Standard: 30_Order/Standards/Operations/Periodic Review Note Standard.md
Vault Lint: 30_Order/System/vault-lint/Vault Lint.md
Note Kit Standard: 30_Order/Standards/Note Kit Standard.md
Reference Standard: 30_Order/Standards/Enrich/Reference Standard.md
20_Progress/Degree/_Courses:
AI Associate Engineer
Cloud Architect
Github Foundations
How does this Help.md
ML Engineer
System Design
Technical Interview
_Courses Board.md

20_Progress/Mentorship Program/Plans:
Overall Plan.md
Plan - Ahnaf.md
Plan - Jesse.md
---
type: evergreen
status: sprout
created: 2026-06-11
updated: 2026-07-27
tags:
  - plan
  - moc
notes:
  - "[[Plans-to-Create]]"
  - "[[Winter Break]]"
next: "[[00 - Summer Plans Index|Summer Plans Index]]"
---
# Plans — Map of Content
==Every active plan in the vault, one row each — before adding a new plan here, read [[Plans-to-Create]].== Not a plan itself; a pointer to the real ones.
## Active
- [[10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan|Fall 2026 Plan]] — the fall semester, through 2026-12-14. Frame: [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]]. Companion maps: [[10_Areas/Life/Plans/Fall 2026
- [[Final Month Plan (Jul 28 - Sep 1)|Final Month Plan (Jul 28 - Sep 1)]] — the summer, through 2026-09-01 (end date passed; still marked `status: active` in its own frontmatter, unverified whether it needs closing)
## Reference
- [[Winter Break]] — prior seasonal plan, closed
## Process
- [[Plans-to-Create]] — how any new plan here gets created
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/Jarvis" && for n in "Jarvis Build Hub" "Jarvis Decisions Log" "Jarvis Architecture" "Jarvis Build Log" "Jarvis Verification and Risks"; do find . -name "$n*.md" -not -path "./.git/*" | head -2; done; echo "--- tracked plugin folders:"; git ls-files .obsidian/plugins | cut -d/ -f3 | sort -u | tr '\n' ' '; echo; git check-ignore -v .obsidian/plugins/jarvis-dashboard/main.js || echo "main.js would NOT be ignored"; echo "--- tracker:"; ls "10_Areas/Career/Internships/Tracker" "10_Areas/Career/Internships/Tracker/Each One" 2>&1 | head; f=$(find "10_Areas/Career/Internships/Tracker/Each One/Applied" -name "*.md" 2>/dev/null | head -1); echo "applied sample: ${f:-none}"; ls "10_Areas/Career/Internships/Tracker/Each One/Current" 2>/dev/null | wc -l; cd "../The Plan" && grep -rli toggl --include=*.md 00_Live 30_Order 40_Resources 60_Jarvis .claude 2>/dev/null | head -3; echo "plan toggl hits above (blank = none)"
```
```
--- tracked plugin folders:
calendar cmdr code-styler dataview excalibrain file-explorer-plus homepage lazy-plugins lean-terminal multi-column-markdown ninja-cursor obsidian-excalidraw-plugin obsidian-git obsidian-kanban obsidian-latex-suite obsidian-local-rest-api obsidian-meta-bind-plugin obsidian-spaced-repetition obsidian-style-settings periodic-notes quickadd recent-edits recent-files-obsidian templater-obsidian text-extractor url-into-selection 
main.js would NOT be ignored
--- tracker:
10_Areas/Career/Internships/Tracker:
Application Tracker.md
Deadline Tracker.md
Each One
Habit Tracker.md
Internship - Dashboard.md
Main Log.md
Tracker.md

10_Areas/Career/Internships/Tracker/Each One:
applied sample: none
29
00_Live/Enumerate/Daily/2026-10-26.md
30_Order/Templates/Daily Dashboard/Better Today.md
30_Order/Workflows/Agentic OS/How to Use Plugins.md
plan toggl hits above (blank = none)
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -n -i -B2 -A6 "toggl" "00_Live/Enumerate/Daily/2026-10-26.md" | head -60; echo ====; grep -n -i -B1 -A4 "toggl" "30_Order/Templates/Daily Dashboard/Better Today.md" "30_Order/Workflows/Agentic OS/How to Use Plugins.md" | cut -c1-300 | head -50; echo ====; cd ../Jarvis/10_Areas/Career/Internships/Tracker && ls "Each One"; ls "Each One/Applied" 2>&1 | head -3; ls "Each One/Current" | head -3; sed -n 1,14p "Each One/Current/$(ls 'Each One/Current' | head -1)"
```
```
39-| Win     | Target | Done                        |
40-| ------- | ------ | --------------------------- |
41:| Project |        | `INPUT[toggle:win_project]` |
42:| Career  |        | `INPUT[toggle:win_career]`  |
43:| Cleanup |        | `INPUT[toggle:win_cleanup]` |
44:| Review  |        | `INPUT[toggle:win_review]`  |
45-## Daily Floor
46-
47-| Track | Target | Topic | Done                    |
48-| ----- | ------ | ----- | ----------------------- |
49:|       |        |       | `INPUT[toggle:floor_1]` |
50:|       |        |       | `INPUT[toggle:floor_2]` |
51:|       |        |       | `INPUT[toggle:floor_3]` |
52-## Productivity
53-
54-**LeetCode today:** `INPUT[number:lc_count]`
55-**Study hours:** `INPUT[number:study_today]`
56-**Wins hit:** `INPUT[number:wins_done]` / 4
57-## Just Write
====
30_Order/Templates/Daily Dashboard/Better Today.md-40-| ------- | ------ | --------------------------- |
30_Order/Templates/Daily Dashboard/Better Today.md:41:| Project |        | `INPUT[toggle:win_project]` |
30_Order/Templates/Daily Dashboard/Better Today.md:42:| Career  |        | `INPUT[toggle:win_career]`  |
30_Order/Templates/Daily Dashboard/Better Today.md:43:| Cleanup |        | `INPUT[toggle:win_cleanup]` |
30_Order/Templates/Daily Dashboard/Better Today.md:44:| Review  |        | `INPUT[toggle:win_review]`  |
30_Order/Templates/Daily Dashboard/Better Today.md-45-## Daily Floor
30_Order/Templates/Daily Dashboard/Better Today.md-46-
30_Order/Templates/Daily Dashboard/Better Today.md-47-| Track | Target | Topic | Done                    |
30_Order/Templates/Daily Dashboard/Better Today.md-48-| ----- | ------ | ----- | ----------------------- |
30_Order/Templates/Daily Dashboard/Better Today.md:49:|       |        |       | `INPUT[toggle:floor_1]` |
30_Order/Templates/Daily Dashboard/Better Today.md:50:|       |        |       | `INPUT[toggle:floor_2]` |
30_Order/Templates/Daily Dashboard/Better Today.md:51:|       |        |       | `INPUT[toggle:floor_3]` |
30_Order/Templates/Daily Dashboard/Better Today.md-52-## Productivity
30_Order/Templates/Daily Dashboard/Better Today.md-53-
30_Order/Templates/Daily Dashboard/Better Today.md-54-**LeetCode today:** `INPUT[number:lc_count]`
30_Order/Templates/Daily Dashboard/Better Today.md-55-**Study hours:** `INPUT[number:study_today]`
--
30_Order/Workflows/Agentic OS/How to Use Plugins.md-63-
30_Order/Workflows/Agentic OS/How to Use Plugins.md:64:Turn on both community-plugin toggles in Sync settings on the phone, then force-quit after the first sync. A plugin that arrives through Sync may be installed and disabled until someone enables it. Quick actions that call QuickAdd need Obsidian 
30_Order/Workflows/Agentic OS/How to Use Plugins.md-65-
30_Order/Workflows/Agentic OS/How to Use Plugins.md-66-## If something goes wrong
30_Order/Workflows/Agentic OS/How to Use Plugins.md-67-
30_Order/Workflows/Agentic OS/How to Use Plugins.md-68-| Problem | What to do |
====
Current
Data Intern - Key Technology & Services - Data Track - KeyBank.md
Data Science Machine Learning Intern - Castleton Commodities International.md
Trackings-to-Create.md
ls: cannot access 'Each One/Applied': No such file or directory
2027 Software Engineering Internship - Uber.md
A.I. Developer Co-Op (Boston, MA) - Manhattan Associates.md
AI and Data Engineering Summer Scholar Intern - Government & Public Services - Deloitte.md
---
type: tracker
program: "[[10_Areas/Career/Internships/Programs/Serious/[REDACTED]]]"
contact: "[[10_Areas/Career/Internships/Contacts/Each One/Ongoing/2027 Software Engineering Internship - Uber]]"
company: Uber
url: https://jobs.uber.com/en/jobs/300697/
date_noted: 2026-07-20
date_researched: 2026-09-05
date_created: 2026-09-05
date_applied:
date_result:
result:
deadline:
related_notes:
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && ls "Jarvis Build" 2>&1 | head -2; mkdir -p "Jarvis Build" && ls -d "Jarvis Build"
```
```
Jarvis Build
```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Decisions Log.md`
```
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
---
# Jarvis Decisions Log
==Every question answered while designing the Jarvis dashboard plugin, with what each answer forces on the build.== Answers were given by Anant on 2026-10-26. A row marked Interpreted was dictated and read by the assistant, so it needs a yes. A row marked Conflict disagrees with a note that already exists.

## Confirmed

| # | Question | Answer | Consequence | State |
|---|---|---|---|---|
| D1 | How does the Jarvis plugin relate to The Plan's plugin? | Separate plugin `jarvis-dashboard`, own engine, no shared code | Copy The Plan's structure, not its files. A Plan change can never break Jarvis. | Confirmed |
| D2 | Which devices? | The Dell and the Acer laptop only. Jarvis is not synced to the phone. | No phone build, no phone test. The layout is still responsive, because that is CSS. | Confirmed |
| D3 | How is a day recorded so the plugin can tick it? | Checkbox lines with a field, for example `[track:: application]` | Replaces the frontmatter toggles built on 2026-10-26 morning. Meta Bind is no longer needed by the dashboard. See Correction 3. | Confirmed |
| D4 | What does the streak count? | The floor. A day counts when every floor row is done. One miss is forgiven, two in a row break it. Floor rows are set per term in a config table. | The Plan's rule, with floor rows in place of five categories. | Confirmed |
| D5 | What happens to the four wins? | A separate score from 0 to 4, never part of the streak | A cleanup win cannot rescue a day with no application. | Confirmed |
| D6 | Daily Loses? | Kept, tickable on the page, same line format as the [[Daily Note Standard]] | The plugin can only tick a Lose to `[x]`. Carrying and dropping need a why, so they stay with `/closeday`. | Confirmed |
| D7 | Identity and habits in Jarvis? | Builder identity only. Personal identity, health and habits stay in The Plan. | Matches AGENTS.md golden rule 6. No second copy to drift. | Confirmed |
| D8 | Page shape | One page. No vertical scroll anywhere. Only text Anant writes may scroll sideways. The whole page scales to fit the pane, and below a readable size a banner says the window is too small. No content is removed. | Tests must prove no vertical overflow at set sizes. See [[Jarvis Spec - Dashboard Page]]. | Confirmed |
| D9 | What is always on the page? | Today core, calendar strip, loses and carryover, pipeline numbers | All four groups are on the one page. | Confirmed |
| D10 | Delight elements | Builder levels, proof of the day, a floor heatmap, pipeline momentum | Each has a data source in [[Jarvis Spec - Day Model and Streak]]. | Confirmed |
| D11 | Who creates today's note? | The plugin, from the template. A name that is not `YYYY-MM-DD` is refused and flagged. | Avoids The Plan's ten days of zeros caused by `DD-MM-YYYY` names. | Confirmed |
| D12 | Where does the 80 come from? | From the plans already drafted: the Fall 2026 plan, the weekly Goals and the project plans. The One Thing for the day is chosen daily. | `/startday` proposes, Anant approves. See [[Jarvis Spec - Plans Feed]]. | Confirmed |
| D13 | What picks the 20? | The 20 is the supporting work the 80 needs. If the 80 is five applications, the 20 is the cover letters, resumes and Jarvis work that make those five ready. | A 20 line must name the 80 it serves, with `[for:: 80]`. A task that serves nothing is not a 20. | Confirmed |
| D14 | When does the term end? | 2026-12-24. That is the last day of the Fall 2026 plan. Some items continue next term and some stop. | Config holds the term end. Floor rows change at that date. | Confirmed, see Correction 2 |
| D15 | Weekly application target | 10 per week, each one complete and correct | Pipeline momentum shows `n / 10`. | Confirmed |
| D16 | Builder level wording | The same as The Plan | The Plan's titles: The beginning (3), Toward 21 (7), Now it gets hard (21), Work pays off (66), Consistency, discipline, mindset (100). | Confirmed |
| D17 | Which calendar account? | `gupt0479@umn.edu`. The details of the calendars are in [[How to Use Google Calendar]] and the weekly note [[2026-W44]]. | The plugin never calls Google. Claude writes `### Blocks` into the daily note and the page reads it. | Confirmed |
| D18 | Todoist in Jarvis? | No longer used | Todoist leaves the Jarvis design. See Correction 5. | Confirmed |
| D19 | Time management | Manage time by reference to the daily notes in The Plan. Timestamps in The Plan record time spent per task. | Jarvis reads time totals from The Plan and never tracks time itself. See [[Jarvis Spec - Automation Layer]]. | Interpreted, see below |
| D20 | Does Jarvis read The Plan? | `/startday` and `/closeday` in Jarvis read The Plan's daily note. Agents watch both notes so they stay consistent. | Reads only. Needs a check that Jarvis's hooks allow it. See Correction 4. | Interpreted |
| D21 | Automation | Design only for now. Calendar read plus planned blocks. Other platforms (Apple Reminders, Zapier, further MCP servers) are decided later and must be simple and frictionless. | No transport is built. | Confirmed |
| D22 | Existing plugins | Nothing is removed. Anant receives a list and decides. | See [[Jarvis Plugin Retirement List]]. | Confirmed |
| D23 | Canvas and `00_Dashboard.md` | Both are replaced by the plugin | They retire after the plugin runs clean for a fortnight, and only on Anant's word. | Confirmed |

## Interpreted, needs a yes
The answer on 2026-10-26 was dictated and reached the assistant garbled. These readings drive rows above.
- "20 each 10" is read as "the 20 each day". "ET" is read as "the One Thing", which is the 80.
- "Doge" and "the store" are read as Toggl.
- "The toggle has been added to The Plan" is read as "Toggl is in use in The Plan". The assistant found no Toggl note in either vault, so this is unverified.
- "Complete part 1 personally and the portion related to work. Adjourn." has no clear meaning and was not acted on. Say what it meant if it matters.

## Corrections
Each correction keeps the original statement and says what replaced it.
1. **Toggl in the daily notes.** The assistant said the July and August Jarvis daily notes mention Toggl. They do not. The search matched the word `toggle`, the Meta Bind inputs. No vault note mentions Toggl.
2. **Term end.** The Plans Board says the Fall 2026 plan runs through 2026-12-14. Anant's answer is 2026-12-24 and wins. The Plans Board line needs a change in Jarvis.
3. **Day model.** [[Jarvis Dashboard Build Record]] says the Done toggles became frontmatter booleans (`win_*`, `floor_1` to `floor_3`) on 2026-10-26, and that `/closeday` counts them. D3 replaces the toggles with checkbox lines. The Daily Loses format and the `wins_done` and `floors_done` counts stay.
4. **Cross-vault reads.** [[Jarvis Dashboard Build Record]] lists as a non-goal that cross-vault reads go through `/jarvis-dump` and never write. D20 adds a read of The Plan from Jarvis sessions. It stays read-only, and the Build Record line needs an update.
5. **Todoist.** [[How to Use Google Calendar]] says the 12-week map lives in Todoist and names the working calendar "Todoist". D18 drops Todoist. The calendar keeps its name until Anant renames it in the Google Calendar app, which the guide already suggests.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Day Model and Streak.md`
````
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
project_kind: spec
next: "Anant confirms the open questions; prompt P1 then patches the Daily Note Standard and the template"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Dashboard Page]]"
---
# Jarvis Spec - Day Model and Streak
## What This Is
==A Jarvis day is a daily note made of checkbox lines that the plugin can flip, and a streak that counts the days on which every floor row was done.==
This note defines the daily note shape the plugin reads, the fields on each line, the streak rule and the checks that guard them. It sits on top of the [[Daily Note Standard]] and keeps its headings, its Daily Loses format and its frontmatter keys. It changes how the wins and the floor are recorded. The rules for the page are in [[Jarvis Spec - Dashboard Page]].

## Current State
Checked on 2026-10-26.
- The daily note [[Better Today]] holds seven frontmatter booleans (`win_project`, `win_career`, `win_cleanup`, `win_review`, `floor_1`, `floor_2`, `floor_3`), shown by Meta Bind toggles inside two tables. The numbers `lc_count` and `study_today` are typed. `wins_done` and `floors_done` are written by `/closeday`.
- The 80 and the 20 are checkbox lines under `### 80 - The One Thing` and `### 20 - Supporting Work`. `### Blocks` is a plain list.
- Daily Loses are task lines with `[why::]`, `[fix::]`, `[from::]` and `[since::]`, and four marks: `[ ]` open, `[x]` made up, `[>]` carried, `[-]` dropped.
- The dashboard counts the toggles with DataviewJS. Nothing else reads them.
- Application progress is a field on each tracker note: `date_applied` in `10_Areas/Career/Internships/Tracker/Each One/Current/`. On 2026-10-26 the folder holds 29 notes. [[2026-W44]] records 29 researched and 0 applied. There is no `Applied/` folder.
- Nothing in this note is built.

## The new daily note shape
Headings stay as the Standard names them. Only the line formats under them change.

```markdown
---
type: thought
thought_kind: daily
status: active
day_state: planned
created: 2026-10-27
updated: 2026-10-27
tags:
  - daily
lc_count: 0
study_today: 0
wins_done: 0
floors_done: 0
---
# Did you get better today?
## Morning Plan
*Goal*: one line
### 80 - The One Thing
- [ ] I will submit 5 applications at 2 pm at my desk. [plan:: Fall 2026 Plan]
### 20 - Supporting Work
- [ ] Cover letter for Uber is final. [for:: 80]
- [ ] Resume tailored for Deloitte. [for:: 80]
### Blocks
- [ ] 14:00-16:00 Internship: 5 applications sent [cal:: abc123]
**Do NOT do today:**
## Daily Wins
- [ ] Project: Portfolio UI repolished [win:: project]
- [ ] Career: one application sent [win:: career]
- [ ] Cleanup: inbox at zero [win:: cleanup]
- [ ] Review: close the day by 10:30 pm [win:: review]
## Daily Loses
- [ ] CSCI 4041: 5 problems logged [why:: opened YouTube first] [fix:: laptop opens on DSA.md] [from:: weekly] [since:: 2026-10-26]
## Daily Floor
- [ ] One company moved to Applied [track:: application]
- [ ] 5 problems logged in Weekly Set [track:: practice]
- [ ] One class step for CSCI 4061 [track:: class]
## Productivity
## Proof of the day
- [proof:: Shipped 5 applications with the final cover letter]
```

## Fields
| Field | On which line | Holds |
|---|---|---|
| `[plan:: name]` | The 80, optional on a 20 | The plan or board note that owns the task, so the line holds no copy of the plan |
| `[for:: 80]` | Every 20 line | The 80 it serves. A 20 line without it is invalid. |
| `[cal:: id]` | A Blocks line | The Google Calendar event id, so a moved event updates its line and does not duplicate |
| `[win:: project, career, cleanup, review]` | A wins line | Which win it is. Each value appears once. |
| `[track:: name]` | A floor line | A floor row name from the term's config table |
| `[why::]`, `[fix::]`, `[from::]`, `[since::]` | A Lose | Unchanged from the Standard |
| `[due:: YYYY-MM-DD]` | A weekly Goal line | A deadline the calendar strip can list |
| `[proof:: text]` | One line under `## Proof of the day` | One line of evidence, written at close |

Blocks marks: `[ ]` open, `[x]` done, `[-]` missed with a `[why::]`.

## Floor rows per term
The rows live in a config table, not in code. A new term changes the table and the plan note.

| Term | Row | Track | Done when |
|---|---|---|---|
| Fall 2026 | 1 | `application` | A tracker note has `date_applied` equal to today |
| Fall 2026 | 2 | `practice` | LeetCode or CodePath reps logged, at least 5 |
| Fall 2026 | 3 | `class` | One class step finished |
| Term end | | | 2026-12-24 |

A floor line is ticked by Anant with evidence. Nothing ticks it for him. The validator warns when the `application` line is ticked and no tracker note has today's `date_applied`, and when `practice` is ticked with `lc_count` under 5. The warning does not change the tick.

## Streak rule
It is the rule from The Plan's Streak Rule with the floor as the unit.
1. A day is MET when it has at least one floor line and every floor line is ticked.
2. A day is MISS when a floor line is open at the day's end, or the note is missing. A missing note is a MISS.
3. Today is PENDING until midnight, unless it is already MET. The rollover is midnight. A tick after midnight belongs to the new date.
4. The streak starts on the earliest day whose note has at least one floor line.
5. Walk from the start day to yesterday. A MET day adds one. An isolated MISS is forgiven: it adds nothing and does not reset. A second MISS in a row resets the run to zero.
6. The current streak is the run, plus one when today is MET.
7. The best streak counts closed days only. Today joins it the next day.
8. A forgiven day counts as a lost day in the month totals.
9. At risk means yesterday was a MISS and today is not yet MET.
10. Milestones are 3, 7, 21, 66 and 100. The titles are in [[Jarvis Decisions Log]], D16.

Wins score is the count of ticked win lines, from 0 to 4, and is separate.

## Validator rules
The engine's `validate` command reports each breach with the line and the rule. It never rewrites a note.
1. The file name is `YYYY-MM-DD.md`. Any other name in the Daily folder is reported as misnamed.
2. `created` and `updated` are real dates. A leftover `<% %>` is reported.
3. Exactly one 80 line.
4. Two to four 20 lines, each with `[for:: 80]`.
5. Each floor line has a `[track::]` that is in the term's config table.
6. Four win lines, one per `[win::]` value.
7. Each Lose has `[since::]`. A missing `[why::]` reads `(unanswered)`.
8. On a closed day, `wins_done` and `floors_done` equal the ticked lines, and an End of Day exists.
9. Each Blocks time reads `HH:MM-HH:MM` and ends after it starts.
10. A line that has a mark other than `[ ]`, `[x]`, `[X]`, `[>]` or `[-]` is reported.

## Migration
Old notes keep the old shape. The engine reads only the new shape. A day in the old shape has no floor lines, so it never starts or extends a streak, and the page shows its date as before the start. The 87 older notes that use Meta Bind inputs stay as they are. Whether to convert them is an open question.

## Non-Goals
- No streak for the wins, and no second streak for any single track.
- No automatic ticking from a count, a tracker note or a calendar event.
- No health, meals, water or personal habits. Those belong to The Plan.
- No change to the Daily Loses format.
- No change to any note while this is a design.

## Open Questions
- [ ] Should the `application` row become "two applications a day", since the weekly target is 10 and the floor says one?
- [ ] Should the typed numbers `lc_count` and `study_today` stay in frontmatter, edited by the plugin with plus and minus buttons, or move to inline fields in the body?
- [ ] Should `## Proof of the day` be added to the [[Daily Note Standard]] as an optional heading?
- [ ] Should the 87 older notes be converted, or left as history?
- [ ] Should a Blocks line that passed with no tick turn into a Lose automatically at close, as the Close Loop proposes today?

````
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Dashboard Page.md`
````
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - ui
project_kind: spec
next: "Anant answers the open questions on overflow and the old page blocks; prompt P4 builds the page"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Carry Forward]]"
---
# Jarvis Spec - Dashboard Page
## What This Is
==The Jarvis dashboard is one page that never scrolls vertically, shows the whole working day at a glance, and rewards a day done right with a number that grows.==
It is a view inside the `jarvis-dashboard` plugin. It replaces `00_Dashboard.md` and `10_Areas/Jarvis OS Dashboard.canvas` ([[Jarvis Decisions Log]], D23). The data it reads is defined in [[Jarvis Spec - Day Model and Streak]]. What it keeps from the old page is in [[Jarvis Spec - Carry Forward]].

## Current State
Checked on 2026-10-26.
- The page is a markdown note with DataviewJS, Meta Bind and Multi-Column Markdown, plus a canvas. Homepage opens the canvas.
- Both hold the same queries by hand. [[Jarvis Dashboard Build Record]] lists this as known drift.
- The plugin is not built. The Plan's plugin is the reference: a React view with a scaled grid, drawn with inline SVG. Its screens were never verified against real data. See [[Jarvis Verification and Risks]].

## The rules of the page
1. **No vertical scroll, anywhere.** The root and every card use `overflow: hidden` on the vertical axis. No `overflow-y: auto` or `scroll` exists in the styles.
2. **Horizontal scroll only for written text.** A line that Anant wrote (an 80, a 20, a Lose, a block title, a proof line) is one row with `white-space: nowrap` and `overflow-x: auto`. The scrollbar is hidden. The line scrolls by wheel, drag, touchpad or keyboard. Numbers, labels, rings, the heatmap and buttons never scroll in either direction.
3. **The page scales to fit.** The grid and the font size follow the pane size, as The Plan's view does, so every card fits at any window size above a minimum. Below the minimum, a plain banner reads "Window too small". Nothing is hidden to make it fit.
4. **Everything that ticks stays live.** A tick is one click or the space key on a row. The row updates at once, and the redraw from disk then confirms or reverts it.
5. **Plain words.** No praise and no guilt. A miss reads "Day 2 of miss. Streak breaks tomorrow." with numbers.
6. **Every number comes from the engine.** The page computes nothing the engine does not.

## Blocks on the page
All four groups from D9 are always shown.

| Block | Shows | Source | Interaction |
|---|---|---|---|
| Hero | Streak number, builder level and the next milestone with days to go, the floor ring (rows done out of rows), the wins ring (0 to 4), an at-risk line | Engine | None |
| Today | The 80, then the 20, each a tick row with its plan pointer | The daily note | Tick, click the text to open the note at that line |
| Blocks | Now and next from today's calendar blocks, then deadlines due in the next 7 days | `### Blocks` in the daily note, `[due::]` on weekly Goals | Tick a block, click to open |
| Loses and carryover | Open Loses oldest first with age, the count, and carried work from the session log | `## Daily Loses`, `## Carryover` | Tick a Lose to `[x]` |
| Pipeline | Applications today and this week out of 10, LeetCode out of 5, study hours | Tracker `date_applied`, `lc_count`, `study_today` | Plus and minus on the two numbers |
| Heatmap | The last 30 days of floor rows done, today outlined, forgiven days dashed, missing notes faint | Engine | Click a day to open its note |
| Proof | Yesterday's proof line, and today's proof field | `[proof::]` | Type and save one line |
| Health chip | One chip that is green when `validate` and `doctor` are clean and red with a count when they are not | Engine | Click for the list in a note |
| Links | Chips for the system notes, Mentorship Board and the plan notes | Config | Click to open |

## Layout
Two layouts, chosen by pane shape, as in The Plan. The wide layout:

```
+------------------+----------------------------------+------------------+
| HERO             | TODAY: the 80 and the 20         | LOSES            |
| streak, level    |                                  | and carryover    |
| floor ring       +----------------------------------+                  |
| wins ring        | BLOCKS: now, next, due soon      |                  |
+------------------+----------------------------------+------------------+
| PIPELINE: applications, LeetCode, study hours | HEALTH chip | LINKS     |
+-----------------------------------------------+-------------+-----------+
| HEATMAP, 30 days                              | PROOF                   |
+-----------------------------------------------+-------------------------+
```

The compact layout is two columns for a narrow or tall pane. It holds the same blocks. The compact layout is also how the page reads at an iPhone 15 width of 393 px, which is a CSS test only. No phone build is in scope ([[Jarvis Decisions Log]], D2).

Row limits keep each card inside its cell at the minimum font size: the 80 is one row, the 20 at most four, blocks at most eight, visible Loses at most seven.

## Scaling
The root measures its pane with a ResizeObserver. Font size is the smaller of a width term and a height term, clamped between a minimum of 11 px and a maximum of 22 px. The exact constants are set in prompt P4 against the fixtures in the next section. Below 11 px the banner shows.

## Visual system
- Colours are CSS variables defined in `styles.css` under the class prefix `jd-`, built on Obsidian variables. No colour is hard coded in a script. The Plan's build broke this rule, so a test greps for hex colours in the bundle.
- Dark and light follow Obsidian through the class on `body`.
- Tokens: an accent, a good, a warning and a bad colour, and a green ramp of six shades for the heatmap.
- The floor ring is red at 0 rows done, golden orange between 1 row and all rows minus one, and green when all rows are done.
- Big numbers use the monospace font with tabular digits.
- The ring animates over 350 ms and pulses once when it completes. `prefers-reduced-motion` turns both off.
- Every interactive row is a button with a visible focus ring, and keyboard operable.
- No `innerHTML`, no inline colour styles.

## Delight, kept small
- **Builder levels.** The title sits beside the streak and changes at 3, 7, 21, 66 and 100.
- **Proof of the day.** Yesterday's proof is shown as "Yesterday you proved: ...". Writing today's takes one line.
- **Heatmap.** Thirty days, six columns by five rows in the compact layout and ten by three in the wide one.
- **Pipeline momentum.** "Applications this week: 4 of 10" with the gap stated plainly.

## States and errors
| State | What the page shows |
|---|---|
| Today's note is missing | An empty floor ring and a "Create today's note" button that builds `YYYY-MM-DD.md` from the template |
| A note in the Daily folder is misnamed | A red banner with the file name and the correct name. The engine ignores the note. |
| A note has a leftover `<% %>` date | A banner naming the note |
| The window is too small | The banner from rule 3 |
| Blocks are stale or the calendar was unavailable | The strip says "Blocks not loaded today. Run /startday." |
| The engine and the screen disagree | The health chip turns red. A debug command prints both. |

## Non-Goals
- No vertical scroll, no tabs, no pop-up pages that scroll.
- No calls to Google, Todoist, Toggl or any outside service from the plugin.
- No personal-life content: no health, meals, water or relationships.
- No phone build.
- No chart that cannot be read at the minimum size.

## Open Questions
- [ ] What happens when open Loses outnumber what fits? Recommended: show the oldest that fit, add a "+N more" chip that opens the Loses heading in the daily note, and cap open Loses at 7 so that a bigger pile forces a make-up or a drop at close. This hides rows, so it needs your yes.
- [ ] Heatmap length: 30 days, as in The Plan, or 60?
- [ ] Which Dell and Acer window sizes must hold? Needed for the fixtures in prompt P4.
- [ ] Should the health chip also check that the skills and hooks exist, as a guard against The Plan's 16 October overwrite?

````
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Plans Feed.md`
```
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - plans
project_kind: spec
next: "Anant confirms the open questions; prompt P5 builds the feed"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
---
# Jarvis Spec - Plans Feed
## What This Is
==Every plan keeps one owner note, and the daily note holds only a one-line pointer to it, so planning feeds the day without a second copy.==
This note says how the standing plans (the Fall 2026 plan, the weekly note, the project plans, the mentorship plans and the UMN course boards) become the 80, the 20 and the floor of one day. It follows [[Plan Standard]] for what a plan is.

## Current State
Checked on 2026-10-26.
- The Fall 2026 Plan has a Systems table of 22 tracks, each with a cadence and a done-definition. Three of them run daily: the application floor, LeetCode and CodePath, and the class step. The rest run weekly, monthly or once. It also has a week-by-week One Hard Thing table. Source: `10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md`.
- [[2026-W44]] holds the week: daily Goals, three groups of "The 80" (UMN, Development, Others), Friday checkpoints and carried items.
- [[Daily Note Standard]] says the 80 and the 20 come from the weekly Goals and the calendar, not from memory.
- The Plans Board says the Fall plan ends 2026-12-14. Anant's answer is 2026-12-24 ([[Jarvis Decisions Log]], D14).
- Mentorship plans are `Plan - Ahnaf` and `Plan - Jesse` in `20_Progress/Mentorship Program/Plans/`. The Jarvis dashboard note records one must-do: the Jesse outreach email, due 2026-11-02.
- Course material is under `20_Progress/Degree/`, with a board per course and `_Courses/_Courses Board.md`.
- Nothing in this note is built.

## Single ownership
| Plan family | Owner note | The daily note holds |
|---|---|---|
| Term plan | Fall 2026 Plan | `[plan:: Fall 2026 Plan]` on the 80 or a floor row, nothing more |
| The week | The weekly note | The chosen Goal as the 80, copied once as one line |
| Project plans | The project note's `next:` and Log | A 20 or an 80 line with `[plan:: project name]` |
| Mentorship | `Plan - Ahnaf`, `Plan - Jesse` | The next action from `/note-to-actions`, as a 20 |
| UMN courses | The course board and `Fall'26 Syllabus` | A deadline as `[due::]` on a weekly Goal, never a copy of the board |
| Career pipeline | Tracker notes in `Each One/` | Nothing. The page reads `date_applied` directly. |

Personal plans, including the resolutions, belong to The Plan and do not appear here ([[Jarvis Decisions Log]], D7).

## How the 80 is chosen
1. `/startday` reads the weekly Goals, the week-by-week table, today's Blocks and any `[due::]` within seven days.
2. It proposes up to three candidates for the 80, ordered by the Fall plan's One Thing first, then a hard deadline, then the open Goal that has slipped longest.
3. Anant picks or edits one. It is written as one line: "I will [behavior] at [time] in [place]."
4. If the One Thing is applications, the 80 is the day's application count, and the floor row still reads one company moved.
Anant decides the 80. The skill never chooses alone.

## How the 20 is chosen
1. A 20 line is a task without which the 80 cannot finish today. Anant's example: if the 80 is five applications, the 20 is the cover letters, the resume edits and the other Jarvis work that make those five ready.
2. The skill derives candidates by reading the 80's own plan note and listing its unfinished prerequisites.
3. It writes two to four lines, each with `[for:: 80]`.
4. A task that does not serve the 80 is not a 20. It goes to the weekly Goals or becomes a Lose.
5. When the One Thing changes mid-day, the 20 is rewritten to match and the old lines are marked `[-]` with a reason.

## Pipeline momentum
- The weekly target is 10 applications, each complete and correct ([[Jarvis Decisions Log]], D15).
- The count is the number of tracker notes whose `date_applied` falls in the current week. The page shows it as "n of 10".
- The Standard's week is not settled. Periodic Notes names a Sunday-start week and The Plan uses ISO weeks. This is an open question in [[Jarvis Dashboard Build Record]], and it decides which days count.

## The term end
On 2026-12-24 the Fall 2026 plan closes. Whatever is done is done. At that date a short review decides which Systems rows continue, which stop and which floor rows change. The config table in [[Jarvis Spec - Day Model and Streak]] then gets a new term. The streak carries over, because it counts the floor, not the term.

## Failure modes
| Trigger | Effect | Smallest fix |
|---|---|---|
| The weekly note has no Goals for the week | The 80 has no source | `/startday` says so and asks for the 80 by hand |
| The 80 is chosen but has no plan note | The 20 cannot be derived | The skill asks for the prerequisites once and writes them |
| A plan changes and the daily line keeps the old text | Two versions exist | The line holds a pointer, and the validator flags a 20 whose 80 was dropped |
| The term ends and nobody updates the config | The page shows rows of a closed plan | The health chip turns red on 2026-12-24 until the config has a new term |
| Ten applications are sent but one is incomplete | The count overstates | `date_applied` is set only when the application is complete, as a rule in the tracker standard |

## Non-Goals
- No plan text is copied into the daily note.
- No new plan is created and no existing plan note is edited by this design.
- No automatic choice of the 80.
- No personal plan in Jarvis.

## Open Questions
- [ ] Which week does the pipeline count: ISO or Sunday-start?
- [ ] Where do mentorship deadlines live so the strip can list them? Recommended: `[due::]` on a weekly Goal line.
- [ ] Is the tracker standard strict that `date_applied` means a finished application?
- [ ] What decides which Fall Systems rows continue after 2026-12-24? Recommended: one review on that date, written in the weekly note.

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Plans Feed.md`
```diff
- | `date_applied` is set only when the application is complete, as a rule in the tracker standard |
+ | `date_applied` is set only when the application is complete. This rule is not confirmed in any tracker standard yet, so it is an open question below. |
```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Automation Layer.md`
```
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - automation
project_kind: spec
next: "Anant answers the open questions; nothing is built until the manual versions have run clean for two weeks"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Plans Feed]]"
  - "[[Jarvis Verification and Risks]]"
---
# Jarvis Spec - Automation Layer
## What This Is
==The automation layer makes the Jarvis day easier on the calendar and on later platforms, with no tokens in the plugin and no silent writes.==
It is a design. It covers how today's calendar reaches the page, how a planned block reaches the calendar, how time spent is read from The Plan and what is left open for later transports. It does not build anything ([[Jarvis Decisions Log]], D21).

## Current State
Checked on 2026-10-26.
- The connector is the claude.ai Google Calendar integration, acting as `gupt0479@umn.edu`. It cannot read the vault, and the vault has no way to call it. Its tools, limits and the ten calendars on the account are in [[How to Use Google Calendar]], which was checked against the live account on 2026-10-25.
- The working calendar is a plain Google calendar named "Todoist" (id starts `c_2195`). It does not sync with Todoist. The guide suggests renaming it "Blocks".
- The guide's rules for writes: read before writing, write only to the working calendar, leave meetings alone, silence every write with `notificationLevel: NONE`, use the five-line event format, set a 5 minute popup, propose a week's blocks in the weekly note and get a yes before bulk creation, and re-list the week after writing.
- The UMN class blocks are not visible to the connector.
- The Daily Note Standard already has a `### Blocks` heading, filled by `/startday` from today's calendar, read only.
- Toggl is not mentioned in any vault note. Anant says it is used in The Plan, and this is unverified.
- The Plan holds no time entries that Jarvis can read today.
- Todoist is out of the Jarvis design ([[Jarvis Decisions Log]], D18).

## The principle
The plugin only reads the vault. Claude is the bridge to every outside service. The daily note is the hand-off: Claude writes a line, the plugin shows it. This keeps tokens, expiry and failures out of the plugin, and a failed call leaves the page honest rather than blank.

## Layer 1: Today's blocks onto the page
| Step | Actor | Read | Write | Approval |
|---|---|---|---|---|
| 1 | `/startday` | Primary calendar and the working calendar for today, read only | `### Blocks` lines: time, title, `[cal:: id]` | None, it is a read of the calendar and a write to a section the Standard assigns to it |
| 2 | The plugin | `### Blocks` | Nothing | None |
| 3 | The page | The clock and the lines | Nothing | None |

The page shows the block that is running now, the next one and the deadlines due within seven days. If Claude or the connector was unavailable, the section says "connector unavailable", as the Standard requires, and the page says "Blocks not loaded today. Run /startday."

A block that passed with no tick is not decided by the page. At `/closeday` it becomes a candidate Lose, as the [[Daily Close Loop]] says.

## Layer 2: Planned blocks onto the calendar
1. Sunday planning, after the weekly Goals exist: Claude lists the week, proposes the blocks as a table in the weekly note and waits for a yes.
2. After the yes it creates the blocks on the working calendar in the five-line format, then re-lists the week and reports the exact count.
3. `/closeday` may move one missed block into the next free slot without a table, as the guide allows.
4. Meetings are never moved. Prep blocks are placed before them.
5. Blocks that cannot fill the WHAT line are not created. Claude asks.
Calendar writes stay manual: one tap, one approval, one count.

## Layer 3: Time spent, read from The Plan
- The Plan is the primary daily monitor. Timestamps in The Plan's daily note record time per task ([[Jarvis Decisions Log]], D19). Jarvis does not track time.
- `/startday` and `/closeday` read The Plan's daily note, read only, and use it for one purpose: fill `study_today` and show time spent against each block.
- The format of those timestamps is defined in The Plan's own builds. This design waits for it.
- The consistency agent reads both daily notes and reports mismatches: study hours that disagree, a block ticked in Jarvis with no time in The Plan, one piece of work counted twice. It writes nothing.
- Whether a Jarvis session may read The Plan, and the path on the Acer, are unverified ([[Jarvis Verification and Risks]]).

## Layer 4: Later transports
Apple Reminders, Zapier and further MCP servers are not designed. The rule for choosing is fixed now so the choice stays simple:
1. Each type of task has one owner: the daily note, the calendar or one reminders app. Nothing is written to two places.
2. A transport must work with the laptop off, or say plainly that it does not.
3. A transport makes one kind of write, and a failure is visible in the note the next morning.
4. A transport the vault cannot test is not built.
Todoist is not a candidate.

## Scheduling
Everything above is manual or one tap until the manual version has run clean for two weeks. This matches Decision 40 in The Plan's record. A scheduled run, if it ever exists, needs a dry run, a log entry and a kill switch, and writes only to the section it owns.

## Failure register
| Trigger | Effect | What Anant sees | Detection | Smallest fix |
|---|---|---|---|---|
| The calendar token expires | `### Blocks` stays empty | "Blocks not loaded today" | `/startday` reports the error | Reconnect the connector |
| A calendar write creates the wrong count | Week has duplicates or gaps | A wrong count in the report | Re-list after writing, per the guide | Delete the duplicate by hand, since Claude does not delete |
| Time zone mix | A block shows an hour off | The strip is wrong | A test with a Winnipeg and an India event | Trust the offset, not the zone label |
| Two laptops write the same daily note | One edit is lost | A tick reverts | The line text check refuses a stale write | Use one laptop per day, or re-tick |
| The class blocks are invisible | The strip omits lectures | Missing lectures | Known limit in the guide | Add lecture anchors to the weekly note by hand |
| The Plan has no time entries | `study_today` stays typed | No time per block | Consistency agent reports it | Type the number |
| A skill writes the wrong section | A heading holds foreign lines | The validator reports it | `plan-cli`-style `validate` | Fix by hand, the validator never rewrites |

## Non-Goals
- No Toggl, Todoist or other service called by the plugin.
- No scheduled or unattended run in this build.
- No deleting of calendar events.
- No writes to The Plan.
- No phone reminders until a transport is chosen.

## Open Questions
- [ ] What is the format of Toggl timestamps in The Plan, and where do they land in its daily note?
- [ ] Which exact calendars besides the primary and the working one matter ("all calendars and related data will be provided")?
- [ ] Should the working calendar be renamed "Blocks" now, so the name stops suggesting a Todoist sync?
- [ ] Do Jarvis's own hooks allow a read of The Plan's daily note, and what is the path on the Acer?

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Carry Forward.md`
```
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - migration
project_kind: spec
next: "Anant decides the blocks marked Decide; prompt P6 retires the old page only after a clean fortnight"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Plugin Retirement List]]"
---
# Jarvis Spec - Carry Forward
## What This Is
==Every block of the current Jarvis dashboard gets a fate in the plugin, so nothing disappears by accident.==
The current setup is `00_Dashboard.md`, `10_Areas/Jarvis OS Dashboard.canvas`, the `dashboard.css` snippet, the daily template and the skills. This note lists each part, says where it goes and marks the ones that need Anant's decision. [[Jarvis Build Overview]] describes the current setup and [[Jarvis Dashboard Build Record]] gives its history.

## Current State
Checked on 2026-10-26. `00_Dashboard.md` and the canvas were both rebuilt that day to read today's daily note and every note's open Loses. Homepage opens the canvas. Inline DataviewJS is off in settings.

## Blocks of the old page
| Old block | Source today | Fate in the plugin |
|---|---|---|
| Sync alert banner | Embed of a banner note | Decide. Recommended: the health chip shows a sync problem, and the banner embed stays until the page retires. |
| Current focus (`today_focus`, `today_80`, `today_20`) | Three frontmatter fields of the page, patched by the skills | Retired. The page shows the 80 and the 20 from the daily note, so the skills stop patching these fields. |
| Wins `n/4`, Floor `n/3` tiles | Frontmatter booleans | Hero rings, counted from checkbox lines |
| Problems, Study Hours | `lc_count`, `study_today` | Pipeline block, plus and minus buttons |
| Open Loses tile and list | Open tasks under Daily Loses, any note | Loses block, ticking writes back to the source line |
| This Week roll-up | Notes from Monday to today | Decide. Recommended: a one-line week strip in the Hero (days with a note, wins total, floors total, problems, study hours). The clippings count moves to the weekly review. |
| Today's Priorities | Open tasks in today's note outside Loses | The 80 and the 20, which hold exactly that |
| Wins and Floor bars | Meta Bind and DataviewJS | The two rings |
| Active Projects | Dataview over `20_Progress` | Decide. Recommended: three chips with each project's `next:`, or a link to the Projects Board. |
| Internship Pipeline | Dataview over the tracker | Pipeline block, from `date_applied` |
| Clippings Queue | Count of `60_Claude/05_Clippings` | Decide. Recommended: weekly review, not the daily page. |
| Vault Health | Notes missing `type` or `status` | Decide. Recommended: `doctor` output behind the health chip. |
| System, Claude OS, AI and Daily OS link rows | Static wikilinks | Links block |
| Mentorship must-do (Jesse outreach, 2026-11-02) | A typed line on the page | A `[due::]` line in the weekly note, shown in the Blocks strip |
| 10_Areas Overview table | Typed table | Decide. Recommended: leave it in `00_Dashboard.md` as a note until retired, then move it to `Jarvis Vault Architecture`. |

Dictation said no content is removed. The Decide rows are the only places a block could leave the page, and each needs a yes.

## The canvas
The canvas has ten text nodes and no edges. It retires with the page ([[Jarvis Decisions Log]], D23). The Plan kept its map canvas as an exploration surface. Whether Jarvis keeps one is an open question.

## Template and skills
| Part | Change |
|---|---|
| [[Better Today]] | Rewritten to the shape in [[Jarvis Spec - Day Model and Streak]]. The two Meta Bind tables become checkbox lists. The frontmatter booleans go. |
| [[Daily Note Standard]] | Patched: line formats, the new fields, an optional `## Proof of the day` heading, the validator rules. A patch to a standard needs Anant's approval first. |
| `/startday` | Writes the 80, 20, wins, floor and Blocks as lines. Stops patching the `today_*` fields. Reads The Plan's daily note read only. |
| `/closeday` | Counts ticked lines instead of booleans. Still asks the why and the fix. |
| `daily-operator` agent | Updated to the new shape. |
| `.agents/skills/startday` and `closeday` | Already differ from the `.claude` copies. Left alone until Anant decides which is canonical. |

## Old notes
- The 87 notes with Meta Bind inputs stay as history. Removing Meta Bind turns their inputs into raw text ([[Jarvis Plugin Retirement List]]).
- The engine ignores old-shape days. Whether to convert them is an open question in [[Jarvis Spec - Day Model and Streak]].

## Non-Goals
- No change to any note in this design.
- No removal of a plugin, snippet or setting.
- No merge of the canvas and the page before the plugin exists.
- No move of personal-life content into Jarvis.

## Open Questions
- [ ] Decide the six rows marked Decide above.
- [ ] Does Jarvis keep an exploration canvas after the old one retires?
- [ ] Which copy of `startday` and `closeday` is canonical, `.claude` or `.agents`?
- [ ] Does Anant want the old page kept read-only as a fallback for the fortnight, or removed from Homepage at once?

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Architecture.md`
```
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
next: "Anant decides React versus plain DOM and the repo location; prompt P2 builds the engine"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Verification and Risks]]"
---
# Jarvis Architecture
## What This Is
==The Jarvis dashboard is three replaceable layers: the daily notes as data, a pure TypeScript engine, and a view, plus a command-line program that gives Claude the same numbers the screen shows.==
It follows the structure of The Plan's plugin, which worked in its tests, and adds guards for the faults that plugin met in practice. The two plugins share no code ([[Jarvis Decisions Log]], D1).

## Current State
Checked on 2026-10-26.
- Jarvis is a git repository with remote `https://github.com/gupta-builds/Jarvis.git`. Its commits are auto-sync commits (`Auto-sync: 2026-10-26 13:48, ...`). The Dell and the Acer sync through it.
- `.gitignore` ignores `workspace.json`, caches, `data.json` of three plugins and `.claude/settings.json`. It does not ignore `.obsidian/plugins/jarvis-dashboard/`. A test with `git check-ignore` found `main.js` would be tracked. Twenty-five plugin folders are tracked today.
- Obsidian is at plugin versions listed in [[Jarvis Plugin Retirement List]]. Obsidian Sync is off in the core plugin list.
- `30_Order/System/` holds `claude-workflow`, `cursor-workflow`, `excalidraw-mcp`, `jarvis-cli`, `jarvis-memory`, `sync-workflow` and `vault-lint`. A folder named `jarvis-cli` already exists and may be taken. It is checked in prompt P2.
- The Plan's plugin is the model. Its repository `D:\_Anant\20_Progress\Projects\the-plan-dashboard` has 3 commits and no remote. Its engine has 87 tests. Its screens were never shown real data. An old copy of `.claude` overwrote its skills and hooks on 2026-10-16, because two laptops auto-synced.
- Nothing in this note is built.

## Layers
| Layer | What it is | Replaceable because |
|---|---|---|
| Data | Daily notes `YYYY-MM-DD.md` in `10_Areas/Life/Enumerate/Daily/`, the weekly note, tracker notes. Plain markdown. | The plugin can be disabled and nothing is lost |
| Engine | Pure TypeScript in `src/core/`. It imports nothing from Obsidian or Node. Text in, numbers out. | The plugin and the CLI run the same file |
| View | A plugin view that draws the page from the engine's model | It holds no rule of its own |
| CLI | `jarvis-cli`, the engine bundled for Node | Claude's skills read its JSON and never compute a number |

## Engine modules
`parse` (lines, fields, headings), `streak` (the rule in [[Jarvis Spec - Day Model and Streak]]), `toggle` (flip one checkbox character and refuse a stale line), `config` (floor rows per term, milestones and titles, folder names, term end), `periods` (weeks and months), `validate` (the ten rules), `blocks` (parse `### Blocks` and find now and next), `pipeline` (count `date_applied` in a week), `model` (everything the page needs in one call).

## Plugin
- Id `jarvis-dashboard`. Name "Jarvis dashboard". Never submitted to the community directory.
- `isDesktopOnly`: recommended true, because Jarvis is on two laptops only. The first version uses no Node or Electron API, so the choice costs nothing. Open question.
- Writes: three paths only. Flip one checkbox through `Vault.process`. Change `lc_count` or `study_today` with `processFrontMatter`. Create today's note from the template.
- Creating a note refuses any name that is not `YYYY-MM-DD`.
- Reads tracker `date_applied` through the metadata cache. Never loops over all files.
- Obsidian guidelines: no `innerHTML`, `this.app` only, every event and interval registered, `normalizePath` on every path, sentence case in the interface, no default hotkeys.
- React 19, as in The Plan, or plain DOM. Recommended: React, because a scaled grid with live ticking is simpler to keep correct and test. The Plan's own build prompts asked for plain DOM and the build used React, so this is recorded here as a decision and not as a surprise. Open question.

## Command-line program
`jarvis-cli` has these commands. Each prints JSON and writes nothing.
| Command | Prints |
|---|---|
| `streak <dailyFolder> <date>` | Current, best, today's rows done, at risk, 30 days of status |
| `day <dailyFolder> <date>` | One day's lines and marks |
| `week <weekly|date>` | Totals for a week: days, wins, floors, problems, study, applications |
| `validate <note>` | Breaches of the ten rules |
| `doctor` | Misnamed notes, leftover placeholders, plugin version against the repo, whether the skills, agents and hooks exist |

`doctor` exists because of The Plan's two silent failures: misnamed notes and an overwritten `.claude`.

## Repository, build and deploy
- Repo location proposed: `D:\_Anant\20_Progress\Projects\jarvis-dashboard`. Whether the Acer has the same path is unverified. A private GitHub repository is created only after Anant says yes.
- Commands: `npm run dev`, `npm test`, `npm run build`, `npm run build:cli`, `npm run deploy` and `npm run deploy:cli`. Deploy copies `main.js`, `manifest.json` and `styles.css` to `.obsidian/plugins/jarvis-dashboard/`, and the CLI to a folder chosen in prompt P2.
- The vault copy of the plugin is never edited by hand.
- Writes under `.obsidian` need Anant's yes each time.

## Tests
- Golden month fixtures with expected values worked out by hand before any engine code, covering a milestone, a forgiven miss, a break, a missing note, a month boundary and a leap year.
- One unit test per validator rule and per streak edge.
- Toggle tests: one character changes, LF and CRLF are kept, a stale line is refused, frontmatter bytes stay identical.
- jsdom view tests, including the page rule: the root and each card have no vertical overflow at the fixture sizes, and no vertical scroll style exists in the bundle.
- A grep test that the bundle has no hard-coded hex colours.
- A debug command that prints the screen's numbers, compared with `jarvis-cli` for the last 30 days.

## Guards for two laptops
1. The plugin shows its version and build stamp in the health chip, and `doctor` compares them with the repo.
2. `doctor` also checks the skills, agents and hooks, so a stale overwrite shows within a day.
3. A plugin build travels through git. A stale tree on the other laptop can overwrite it, so deploys are checked on both laptops after each release.
4. Jarvis's auto-sync is not changed by this build.

## Non-Goals
- No shared code with The Plan's plugin.
- No phone build.
- No outside service called from the plugin.
- No community-directory submission.
- No change to Jarvis's sync or hooks.

## Open Questions
- [ ] React or plain DOM?
- [ ] `isDesktopOnly: true`?
- [ ] Repo location, and is the same path on the Acer?
- [ ] Is the existing `30_Order/System/jarvis-cli` folder something else, and where should this CLI live?
- [ ] Should the daily-note validator also run as a hook after a write, as it does in The Plan?

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Plugin Retirement List.md`
```
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

## What would make each removal safe
1. The plugin has run clean for a fortnight and the acceptance list in [[Jarvis Verification and Risks]] passed.
2. The old page and canvas are retired on Anant's word.
3. The notes that depend on the plugin are converted, archived on purpose or accepted as history.
4. Each removal is its own step, with the plugin folder kept in git history.

## Decision record
| Plugin | Decision | Date |
|---|---|---|
| | | |

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Verification and Risks.md`
```
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
---
# Jarvis Verification and Risks
==Every claim in the Jarvis design that nobody has tested, the exact test for each, and what breaks if it fails.== The Plan's dashboard shipped with a table like this and left every row unfilled. Each prompt in [[Jarvis Build Hub]] fills the rows it can settle.

## Unverified, and how to settle each
| # | Claim | Test | If it fails |
|---|---|---|---|
| 1 | Homepage can open the plugin view at launch by command on both laptops | Restart each laptop five times and check the view opens each time | Open the view from `onLayoutReady` as a backup, idempotent |
| 2 | A plugin build travels through git to the Acer and loads there | Deploy on the Dell, sync, enable on the Acer, read the version in the health chip | Copy the three files by hand per release |
| 3 | The auto-sync on one laptop cannot overwrite the plugin or `.claude` with a stale tree | Run a sync on the Acer with an old tree and confirm `doctor` flags it | Whitelist and pin the paths, as The Plan needs to do |
| 4 | `Vault.process` ticks write back without a conflict, and a `modify` event fires | Tick, watch the page redraw; edit the same line in the note at the same time | The stale-line check refuses the write |
| 5 | A Jarvis session may read The Plan's daily note, read only | Read one Plan daily note from a Jarvis session under Jarvis's hooks | `/startday` asks for the numbers by hand |
| 6 | The Plan's path is the same on the Dell and the Acer | List the folder on each laptop | Put the path in config per machine |
| 7 | The Plan has Toggl time entries that Jarvis can read | Ask Anant where they land. No vault note mentions Toggl today. | Layer 3 of [[Jarvis Spec - Automation Layer]] waits |
| 8 | `date_applied` is set only on a finished application | Read the tracker standard and ask Anant | The application count overstates |
| 9 | The page can hold every block without vertical scroll at the sizes that matter | jsdom tests at the fixture sizes, then a real window on each laptop | Decide the Loses overflow rule in [[Jarvis Spec - Dashboard Page]] |
| 10 | Calendar blocks written by `/startday` match the calendar | Compare `### Blocks` with a live list of the day | The strip says it is stale |
| 11 | The existing `30_Order/System/jarvis-cli` is free for this CLI | List its contents | Name the new CLI differently |
| 12 | Templater's "Trigger on new file creation" is on | Anant checks the setting in Obsidian. It is under `.obsidian`. | The plugin creates notes with resolved dates itself |
| 13 | Ticking a Lose from the page writes back to its source note | Test with a Lose in an older note | Open the source note instead of ticking |

## Failure register
| Trigger | Effect | What Anant sees | Detection | Smallest fix |
|---|---|---|---|---|
| A note is named `DD-MM-YYYY` | The engine ignores it. The streak shows zeros. | A red banner naming the note | `validate` and the page | Rename it. This happened in The Plan for ten days. |
| An old `.claude` overwrites the skills | `/startday` finds nothing | Commands missing, a red health chip | `doctor` | Restore from git history |
| Today's note is missing | The day is a MISS | An empty ring and a Create button | The engine | Press Create |
| A leftover `<% %>` date | Date queries skip the note | A banner | `validate` | Run `/startday` or fix the date |
| Midnight passes during a session | A tick lands on the wrong date | None | The page reads the date every 30 seconds | A tick after midnight belongs to the new day |
| Two laptops edit one note | A stale tick is refused | The row snaps back | The line check | Reload the page |
| Open Loses pile up | The Loses card cannot fit them | A "+N more" chip, or a cap, depending on the decision | Row count | Decide the overflow rule |
| The term ends on 2026-12-24 | The floor rows describe a closed plan | A red health chip | Config date | Add the next term's rows |
| The calendar token expires | No blocks load | "Blocks not loaded today" | `/startday` report | Reconnect |
| The window is too small | The page cannot fit | "Window too small" | The size check | Enlarge the window |
| A plan changes after the 80 was written | The line points at a dropped plan | A validator warning | `validate` | Rewrite the line |
| The page and the engine disagree | Wrong numbers | Red health chip | The debug command | Fix the page, never the engine |

## Acceptance for the whole dashboard
1. The dashboard opens at launch on the Dell and the Acer with no manual step.
2. A tick updates the rings, the streak and the heatmap within one second.
3. The screen's numbers equal `jarvis-cli` for the last 30 days.
4. The root and every card have no vertical overflow at the agreed window sizes, and only written text scrolls sideways.
5. The daily note stays valid markdown that reads well without the plugin.
6. Disabling the plugin loses the view and none of the data.
7. `doctor` reports clean on both laptops.

## Risks
| Risk | Likelihood | Effect | Control |
|---|---|---|---|
| Scope creep into the automation layer | Medium | Delay | Automation is design only until two clean weeks |
| The Plan's lessons not applied | Medium | Silent zeros again | `doctor`, the banners and the unfilled-table rule above |
| React adds weight | Low | Slower start | Measure first paint in prompt P3 |
| Reading The Plan from Jarvis is blocked | Medium | No time totals | Fall back to a typed number |
| Secrets exposure | Low | | The plugin reads only the daily, weekly and tracker folders. No `data.json` of another plugin is read. |

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Log.md`
```
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
| Code location | `D:\_Anant\20_Progress\Projects\jarvis-dashboard`, proposed, not confirmed |
| Hosting | Private GitHub repository, created only after Anant says yes in the session |
| Devices | The Dell and the Acer. No phone. |
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

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Hub.md`
```
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
next: "Anant answers the open questions below, then the main Prompts note is written with prompt P1"
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
  - "[[Jarvis Build Log]]"
---
# Jarvis Build Hub
## Goal
==Build a private `jarvis-dashboard` plugin that shows one no-scroll page of the Jarvis working day, counts a floor streak, and removes the friction from planning, ticking and closing the day.==
It is the Jarvis counterpart of The Plan's dashboard and is designed to avoid the faults that one met: silent zeros from a misnamed note, an old copy of `.claude` overwriting the skills, screens never shown real data and a verification table left empty. Its home in the Jarvis vault is `40_Resources/Obsidian/Dashboard/Jarvis Builds/`. These notes were written in The Plan and are to be cut and pasted there.

## Where to put this folder
1. Cut the folder `Jarvis Build` and paste its contents into `40_Resources/Obsidian/Dashboard/Jarvis Builds/` in the Jarvis vault. Do not paste a second folder inside it.
2. Run Vault Lint on the eleven notes. They were written outside Jarvis, so lint has not seen them.
3. The links to Jarvis notes (`Daily Note Standard`, `Better Today`, `2026-W44` and others) resolve there and not in The Plan.
4. The finished prompts go to `Jarvis Builds/Ran/` and the one main `Prompts` note holds the next prompt only, following the [[Prompt Cycle]].

## Map
| Note | Holds |
|---|---|
| [[Jarvis Decisions Log]] | Every answer, the readings that need a yes, and five corrections |
| [[Jarvis Spec - Day Model and Streak]] | The daily note shape, fields, floor rows, streak rule and validator |
| [[Jarvis Spec - Dashboard Page]] | The no-scroll page, blocks, layout, scaling, visual system, states |
| [[Jarvis Spec - Plans Feed]] | How plans become the 80, the 20 and the floor |
| [[Jarvis Spec - Automation Layer]] | Calendar read, planned blocks, time from The Plan, later transports |
| [[Jarvis Spec - Carry Forward]] | What each part of the old setup becomes |
| [[Jarvis Architecture]] | Layers, modules, CLI, build, tests, two-laptop guards |
| [[Jarvis Plugin Retirement List]] | Evidence for the plugin decision, no removals |
| [[Jarvis Verification and Risks]] | Unverified claims, tests, failure register, acceptance |
| [[Jarvis Build Log]] | Handoff between prompts |

Existing Jarvis notes that this build starts from: [[Jarvis Build Overview]], [[The Plan Overview]] and its five notes, [[Jarvis Dashboard Build Record]], [[Daily Note Standard]], [[Daily Close Loop]], [[How to Use Google Calendar]] and [[2026-W44]].

## Sequence
Each prompt is a fresh Sonnet 5.5 session, written to the [[Agent Prompt Standard]] with the headings Why This Exists, Hard Rules, Implementation Order and Report Back. Each reads the Build Log first, appends one entry and stops at its gate. None starts before the one above it has passed. The prompts are not written yet.

1. **P1, the day shape.** Patch the Daily Note Standard, rewrite [[Better Today]], and update `/startday`, `/closeday` and the `daily-operator` agent to the new shape. Each edit is shown first and waits for a yes. Done when: a new note made from the template passes the validator rules by hand, and a dry run of both skills writes the new lines.
2. **P2, the engine and the CLI.** Create the repo, write hand-computed golden fixtures first, then `parse`, `streak`, `toggle`, `validate`, `blocks`, `pipeline` and the CLI with `doctor`. Done when: all tests pass and the CLI matches the golden values.
3. **P3, the plugin base.** Data layer, safe ticking, creating today's note, the Hero and Today blocks. Done when: a tick changes the note, the numbers equal the CLI and first paint is measured.
4. **P4, the page.** Every other block, the scaling, the no-scroll tests, the visual tokens and the heatmap. Done when: no vertical overflow at the agreed sizes and no hard-coded colour in the bundle.
5. **P5, the feeds.** The plans feed, the Blocks strip from `/startday`, the read of The Plan's daily note and the consistency agent, all read only. Done when: a real day shows its blocks and time totals, or the page says plainly why not.
6. **P6, wire and verify.** Deploy on both laptops, Homepage settings by Anant's own clicks, the acceptance list in [[Jarvis Verification and Risks]], and the retirement list for Anant. The old page and canvas retire only after a clean fortnight and only on Anant's word.

Out of this plan: the automation transports, any scheduled run, any phone build and any plugin removal.

## Open Questions
Day model and page
- [ ] Should the `application` floor row be one a day or two a day, given the weekly target of 10?
- [ ] Typed numbers `lc_count` and `study_today`: frontmatter with plus and minus, or inline fields?
- [ ] Add `## Proof of the day` to the Daily Note Standard as an optional heading?
- [ ] Convert the 87 older notes that use Meta Bind, or leave them as history?
- [ ] Open Loses overflow: show what fits plus a "+N more" chip, and cap open Loses at 7? This hides rows.
- [ ] Heatmap: 30 or 60 days?
- [ ] Which Dell and Acer window sizes must hold?
- [ ] Decide the six rows marked Decide in [[Jarvis Spec - Carry Forward]], and whether Jarvis keeps an exploration canvas.

Plans and the week
- [ ] ISO week or Sunday-start week for the pipeline count?
- [ ] Where do mentorship deadlines live so the strip can list them?
- [ ] Is `date_applied` strictly a finished application?
- [ ] What decides which Fall rows continue after 2026-12-24, and should the Plans Board date of 2026-12-14 be corrected?

Automation and The Plan
- [ ] What is the format of Toggl timestamps in The Plan, and where do they land? No vault note mentions Toggl.
- [ ] Which calendars besides the primary and the working one matter?
- [ ] Rename the working calendar "Blocks" in the Google Calendar app?
- [ ] May a Jarvis session read The Plan's daily note, and what is the path on the Acer?
- [ ] What did "Complete part 1 personally and the portion related to work. Adjourn." mean?

Build
- [ ] React or plain DOM, and `isDesktopOnly: true`?
- [ ] Repo location, and is the existing `30_Order/System/jarvis-cli` folder free?
- [ ] Which copy of `startday` and `closeday` is canonical, `.claude` or `.agents`?
- [ ] Should a daily-note validator also run as a hook after a write?

```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards/Jarvis Build" && ls; echo "--- em dash / en dash count per file:"; grep -c "—" *.md | grep -v ":0" || echo "none"; echo "--- frontmatter delimiters (expect 2 per file in first 30 lines) and first/last key:"; for f in *.md; do n=$(head -40 "$f" | grep -c '^---$'); echo "$f: $n"; done; echo "--- unresolved in-folder links (names starting with Jarvis ):"; grep -oh "\[\[Jarvis [^]|]*" *.md | sed 's/\[\[//' | sort -u | while read n; do [ -f "$n.md" ] || echo "MISSING: $n"; done; echo "--- non-folder link targets used (should exist in Jarvis):"; grep -oh "\[\[[^]|#]*" *.md | sed 's/\[\[//' | grep -v "^Jarvis \(Build Hub\|Decisions\|Spec\|Architecture\|Plugin\|Verification\|Build Log\)" | sort | uniq -c | sort -rn
```
```
Jarvis Architecture.md
Jarvis Build Hub.md
Jarvis Build Log.md
Jarvis Decisions Log.md
Jarvis Plugin Retirement List.md
Jarvis Spec - Automation Layer.md
Jarvis Spec - Carry Forward.md
Jarvis Spec - Dashboard Page.md
Jarvis Spec - Day Model and Streak.md
Jarvis Spec - Plans Feed.md
Jarvis Verification and Risks.md
--- em dash / en dash count per file:
none
--- frontmatter delimiters (expect 2 per file in first 30 lines) and first/last key:
Jarvis Architecture.md: 2
Jarvis Build Hub.md: 2
Jarvis Build Log.md: 2
Jarvis Decisions Log.md: 2
Jarvis Plugin Retirement List.md: 2
Jarvis Spec - Automation Layer.md: 2
Jarvis Spec - Carry Forward.md: 2
Jarvis Spec - Dashboard Page.md: 2
Jarvis Spec - Day Model and Streak.md: 3
Jarvis Spec - Plans Feed.md: 2
Jarvis Verification and Risks.md: 2
--- unresolved in-folder links (names starting with Jarvis ):
MISSING: Jarvis Build Overview
MISSING: Jarvis Dashboard Build Record
--- non-folder link targets used (should exist in Jarvis):
      6 Jarvis Dashboard Build Record
      6 Daily Note Standard
      5 2026-W44
      4 How to Use Google Calendar
      3 Better Today
      2 Jarvis Build Overview
      2 Daily Close Loop
      1 The Plan Overview
      1 Prompt Cycle
      1 Plan Standard
      1 Agent Prompt Standard
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Day Model and Streak.md`
````diff
- ```markdown
- ---
- type: thought
+ ```markdown
+ (frontmatter starts)
+ type: thought
````
- `Edit` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Day Model and Streak.md`
```diff
- floors_done: 0
- ---
- # Did you get better today?
+ floors_done: 0
+ (frontmatter ends)
+ # Did you get better today?
```

## You

Yes the dictation got a few things wrong, to reanswer your 20 question: 20 supports 80 on a daily bassis. The 20 is created specifically to support 80 actions by making sure that these additional tasks are done with respect to it. 

The last sentence meant to say, complete the documentation process. Finish the notes written. 

Toggl in The Plan: where do its timestamps land? I found no note for it. has not been designed yet, but will be noted in the daily note mainly. In detail will have an overview of everything that was taken place daily. Other than that, there are going to be notes written for further detailed time logging for the task, written in other notes. So that jarvis and the plan can take a more detailed note of the time that was covered. So, there are two places that time is calculated - daily note and a folder that calculates time on a daily basis almost as detailed logs. 

Yes, there should be a cap to losses. 7 sound like a good number, but these loses are just noted down. The actions that are required for the next day are considered and recalulated based on the loses of the day. We do not simply push the loss to the next day. 

decide the six marked Decide in the carry-forward note (projects, clippings queue, vault health, week strip, sync banner, areas table) what exactly is the decision over here? 

Build: React. the plugin be desktop-only. the repo lives on the Acer.

Jarvis is allowed to read the daily note so that time stamps and the overiview of today is clearly seen. But does not focus on personal information at all. It specifically looks at the specific headers it's looking for disregarding the personal related work. making it not appear in the jarvis workflow at all. So far, jarvis needs the plan for toggl time management. In the automation that is built, there might be other things. But this is just the starting point. the plan already goes through jarvis's daily dashbaord, weekly, monthly, plans, etc. so the plan already reads through jarvis on the daily, weekly, planned runs. 

window size should be for obsidian rendering, full screen on obsidian. The dashboard will open in obsidian and only on the laptop across both laptops.

## You

Yes the dictation got a few things wrong, to reanswer your 20 question: 20 supports 80 on a daily bassis. The 20 is created specifically to support 80 actions by making sure that these additional tasks are done with respect to it. 

The last sentence meant to say, complete the documentation process. Finish the notes written. 

Toggl in The Plan: where do its timestamps land? I found no note for it. has not been designed yet, but will be noted in the daily note mainly. In detail will have an overview of everything that was taken place daily. Other than that, there are going to be notes written for further detailed time logging for the task, written in other notes. So that jarvis and the plan can take a more detailed note of the time that was covered. So, there are two places that time is calculated - daily note and a folder that calculates time on a daily basis almost as detailed logs. 

Yes, there should be a cap to losses. 7 sound like a good number, but these loses are just noted down. The actions that are required for the next day are considered and recalulated based on the loses of the day. We do not simply push the loss to the next day. 

decide the six marked Decide in the carry-forward note (projects, clippings queue, vault health, week strip, sync banner, areas table) what exactly is the decision over here? 

Build: React. the plugin be desktop-only. the repo lives on the Acer.

Jarvis is allowed to read the daily note so that time stamps and the overiview of today is clearly seen. But does not focus on personal information at all. It specifically looks at the specific headers it's looking for disregarding the personal related work. making it not appear in the jarvis workflow at all. So far, jarvis needs the plan for toggl time management. In the automation that is built, there might be other things. But this is just the starting point. the plan already goes through jarvis's daily dashbaord, weekly, monthly, plans, etc. so the plan already reads through jarvis on the daily, weekly, planned runs. 

window size should be for obsidian rendering, full screen on obsidian. The dashboard will open in obsidian and only on the laptop across both laptops.

Now that all the questions are answered. Go ahead and finalize all the design based notes that are listed out. Making one note the source of truth which maps out all the content that was drafted out. Do not lay out the prompts for this build yet. Finalize the design and make sure that everything is listed out for perfection and perfectly laid out. Let's make sure that each and every single design feature is noted and taken care of in these notes that are listed out. Finalize the notes, if there is literally anything still left to be designed. Ask me more questions, let's finish the design process completely. The prompts, will be laid out in a different session based of these design notes that are created. These notes clearly define each and every single thing that is required to be built for the dashboard. Let's make sure that all the notes listed out are perfect, if there is anything more required. Add them, but keep this minimalistic, adding only notes that are required, extending the notes that exist. Add more resources here so that some researched information lands here for more outside knowledge. to make sure that we are on track and we do this correctly, we research through the web and the plan's builds that are taking place parallely. Let's go ahead and finish the design process.

## Claude

I'll ground the finalisation in two places before asking the remaining questions: The Plan's parallel builds as they stand today, and outside sources for the specifics this design depends on. First, The Plan's recent state and the existing `jarvis-cli` folder.

The web results cover the write APIs, `isDesktopOnly`, the habit evidence and Toggl's API. Two more precise checks from the typed Obsidian API: view registration and the vault events.

The Plan's own record shows a parallel change today, Decision 51. It affects what Jarvis can read from The Plan, so I'm reading it in full.

Next are the page spec, the plans feed and the automation layer. The reader contract for The Plan sits in the last one.

Now the automation layer with the day timeline and the allowlisted reader, plus the carry-forward map and the architecture.

The two research notes come next. The other notes already link to them.

The verification note is next, with each row marked where the research or today's checks settled it, followed by the plugin list touch-up and the build log entry.

The fixed-answers table in the build log is stale on location and stack, so I'm updating it. Then the hub becomes the source of truth.

The Plan standard for a project plan names the heading `Sequence`, so I'm renaming it. Then a full check pass.

The design is final. It now has 13 notes in `40_Resources/Obsidian/Dashboards/Jarvis Build/`, ready to cut and paste into `40_Resources/Obsidian/Dashboard/Jarvis Builds/` in Jarvis.

I checked that all 13 notes have valid frontmatter and the headings their standards require, contain no em dashes, and link correctly to each other. Their links to Jarvis notes only resolve once pasted there. Vault Lint has not run on them.

`Jarvis Build Hub` is now the source of truth. It lists 37 features, each with the note that defines it and the test that proves it. It also holds the build stages, the dependencies on The Plan and a checklist for when the design is done. The prompts are not written, as you asked.

I extended 11 notes and added two research notes:
- **`Jarvis Research - Outside Sources`:** web and Obsidian API findings, cited, with how sure each one is and what it changed. Examples: `Vault.process` is atomic, `create` events also fire for every existing file at load, and the habit research supports one forgiven miss.
- **`Jarvis Research - The Plan Parallel Builds`:** what The Plan has built, where it failed, and what to re-read before the Jarvis build starts.

## What your answers changed
- **The 20:** it supports the 80 on a daily basis, and every 20 line names its 80.
- **Loses:** they are never copied forward. The next day is recalculated from them, the page counts every open one up to 7, and the carried mark `[>]` is retired. This means patching the Daily Note Standard and the Daily Close Loop. I will not edit either without your approval.
- **Time:** Toggl lives in The Plan, with an overview in its daily note and a folder of detailed time logs. Jarvis reads both read only, through an allowlist reader in the CLI (`dashboard-cli plan-time`), not through the skills. Only the headings it is told to look for come through. Personal content never reaches a Jarvis note.
- **Six Decide rows:** the sync banner and vault health fold into one health chip. The week gets a seven-day row. Projects become three chips. The clippings count moves to the weekly review.
- **Build:** React, desktop only, repo on the Acer, full-screen Obsidian on the laptops only.

## What I found while researching
- **The Plan changed its daily template today (its Decision 51).** The template now has Jarvis's shape and no `[cat::]` lines, so The Plan's own streak reads 0. This is why the Jarvis reader uses an allowlist and does not depend on a fixed template.
- **There is no Toggl note in either vault.** My earlier search matched the word `toggle`, so I was wrong that the July and August notes mention it.
- **`30_Order/System/jarvis-cli` is taken.** It is a Python ops tool, so the new CLI is `dashboard-cli`.
- **The no-scroll rule cannot be proven in jsdom,** because it has no layout engine. The design uses a real-browser test plus a live check in Obsidian.

## Still open
- **Defaults to read:** D32 to D45 are my calls and stand unless you change them. D45 adds editing a line in place by double-click, which adds scope. D33 makes the week ISO, Monday to Sunday, based on `2026-W44`.
- **Waiting on The Plan:** the time overview heading, the time log folder, the entry format and the daily template structure. Build stage 5 waits for them, and the other stages do not.
- **Unverified:** 17 claims in `Jarvis Verification and Risks`, each with a test. Examples are the Homepage launch route on both laptops and whether Jarvis's hooks allow the read of The Plan.
- **Last steps of the design:** you keep or change the defaults, and the notes get pasted into Jarvis and linted.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --since=2026-10-25 --format='%h %ad %an %s' --date=iso | head -15; echo ---; find . -name "*.md" -newermt "2026-10-25 20:30" -not -path "./.git/*" -not -path "./50_Archive/*" -not -path "./copilot/*" | head -40; echo --- plugin repo; cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git log --format='%h %ad %s' --date=iso | head -5; git status --short | head; ls -la --time-style=long-iso main.js dist 2>/dev/null | head -5; echo --- jarvis-cli; ls -la --time-style=long-iso "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/jarvis-cli" | head -20
```
```
fb8abe6 2026-10-26 15:05:01 -0500 Anant Gupta auto-sync: 2026-10-26 15:05 | 1 files
610851d 2026-10-26 15:03:05 -0500 Anant Gupta auto-sync: 2026-10-26 15:03 | 2 files
fb8f157 2026-10-26 15:00:17 -0500 Anant Gupta auto-sync: 2026-10-26 15:00 | 21 files
12f7fcf 2026-10-26 14:38:02 -0500 Anant Gupta auto-sync: 2026-10-26 14:38 | 8 files
077a8fb 2026-10-26 14:33:26 -0500 Anant Gupta auto-sync: 2026-10-26 14:33 | 8 files
e93999f 2026-10-26 14:30:34 -0500 Anant Gupta auto-sync: 2026-10-26 14:30 | 2 files
55e2095 2026-10-26 14:23:02 -0500 Anant Gupta auto-sync: 2026-10-26 14:23 | 9 files
51cb180 2026-10-26 14:18:28 -0500 Anant Gupta auto-sync: 2026-10-26 14:18 | 23 files
004b7d7 2026-10-26 14:10:25 -0500 Anant Gupta auto-sync: 2026-10-26 14:10 | 8 files
d02978f 2026-10-26 14:08:02 -0500 Anant Gupta auto-sync: 2026-10-26 14:08 | 9 files
1e85ccd 2026-10-26 13:46:46 -0500 Anant Gupta fix: restore Agentic OS tooling lost in the Oct 16 stale-tree push
3b388ca 2026-10-26 13:33:27 -0500 Anant Gupta auto-sync: 2026-10-26 13:33 | 44 files
889e7e3 2026-10-26 13:25:38 -0500 Anant Gupta auto: 2026-10-26 13:25 | 31 files
da3e497 2026-10-26 12:18:28 -0500 Anant Gupta auto-sync: 2026-10-26 12:18 | 1 files
13bd0db 2026-10-25 20:23:04 -0500 Anant Gupta auto-sync: 2026-10-25 20:23 | 4 files
---
./.claude/agents/daily-auditor.md
./.claude/agents/review-analyst.md
./.claude/agents/skeptic.md
./.claude/agents/vault-curator.md
./.claude/skills/closeday/reference.md
./.claude/skills/closeday/SKILL.md
./.claude/skills/jarvis-dump/reference.md
./.claude/skills/jarvis-dump/SKILL.md
./.claude/skills/monthly-review/reference.md
./.claude/skills/monthly-review/SKILL.md
./.claude/skills/startday/reference.md
./.claude/skills/startday/SKILL.md
./.claude/skills/weekly-review/reference.md
./.claude/skills/weekly-review/SKILL.md
./.codex/README.md
./00_Live/Books/Atomic Habits.md
./00_Live/Enumerate/Core.md
./00_Live/Enumerate/Daily/2026-10-25.md
./00_Live/Enumerate/Daily/2026-10-26.md
./00_Live/Enumerate/Essentialistic.md
./00_Live/Enumerate/Habits.md
./00_Live/Enumerate/Monthly/2026-01.md
./00_Live/Enumerate/Systems.md
./00_Live/Headway/Bits and pieces/Hard Truths.md
./00_Live/Headway/Bits and pieces/What do you want.md
./00_Live/Headway/Headway Analysis.md
./00_Live/Tracking/Habits/Habits Stacking.md
./00_Live/Tracking/Plans/Summer Grind.md
./30_Order/Standards/Dashboards/Daily Note Schema.md
./30_Order/Standards/Naming and Folder Map.md
./30_Order/Standards/References/Reference - closeday.md
./30_Order/Standards/References/Reference - startday.md
./30_Order/Standards/The Plan Vault Architecture.md
./30_Order/System/streak/QuickAdd Setup.md
./30_Order/Templates/Daily Dashboard/Better Month.md
./30_Order/Templates/Daily Dashboard/Better Today.md
./30_Order/Templates/Daily Dashboard/Better Week.md
./30_Order/Templates/Daily Dashboard/Better Year.md
./30_Order/Workflows/Daily Dashboard.md
./30_Order/Workflows/Git Sync.md
--- plugin repo
a65a4ba 2026-10-13 19:53:48 -0500 Secrets guard: a bare word is not a file name
23e6452 2026-10-13 16:37:06 -0500 Add engine review modules, plan-cli, hooks and tests
b744ba1 2026-10-13 15:05:03 -0500 Dashboard plugin: engine, React view, tests
 M src/core/config.ts
 M src/core/streak.ts
 M tests/engine.test.ts
-rw-r--r-- 1 anant 197609 247154 2026-10-13 19:51 main.js

dist:
total 40
drwxr-xr-x 1 anant 197609     0 2026-10-13 16:00 .
--- jarvis-cli
total 25
drwxr-xr-x 1 anant 197609     0 2026-10-17 05:03 .
drwxr-xr-x 1 anant 197609     0 2026-10-16 19:33 ..
-rw-r--r-- 1 anant 197609  3698 2026-10-17 05:03 README.md
-rw-r--r-- 1 anant 197609   582 2026-04-24 17:00 jarvis.ps1
-rwxr-xr-x 1 anant 197609 29621 2026-05-31 05:01 jarvis_ops.py
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `ToolSearch` -- `{"query":"select:WebSearch,[REDACTED],[REDACTED]","max_results":5}`
- `WebSearch` -- `{"query":"Obsidian plugin API Vault.process atomic read modify write file docs","mode":"standard"}`
- `WebSearch` -- `{"query":"Obsidian FileManager.processFrontMatter API docs developer","mode":"standard"}`
- `WebSearch` -- `{"query":"Obsidian plugin guidelines manifest isDesktopOnly Node Electron APIs desktop only","mode":"standard"}`
- `WebSearch` -- `{"query":"Obsidian Homepage plugin open command on startup custom view kind Nothing","mode":"standard"}`
- `WebSearch` -- `{"query":"streak forgiveness design streak freeze effect on habit retention research","mode":"standard"}`
- `WebSearch` -- `{"query":"Lally 2010 how are habits formed 66 days missing one opportunity did not materially affect habit formation","mode":"standard"}`
- `WebSearch` -- `{"query":"Toggl Track API v9 time entries endpoint reports detailed export CSV","mode":"standard"}`
- `mcp__plugin_context7_context7__resolve-library-id` -- `{"query":"Obsidian plugin API ItemView registerView metadataCache","libraryName":"Obsidian"}`
- `mcp__plugin_context7_context7__query-docs` -- `{"libraryId":"/obsidianmd/obsidian-api","query":"workspace.onLayoutReady vault create event fires for existing files at load; registerView ItemView getLeavesOfType detach","language":"TypeScript"}`
- `mcp__plugin_context7_context7__query-docs` -- `{"libraryId":"/obsidianmd/obsidian-api","query":"metadataCache getFileCache frontmatter changed event and cachedRead versus read","language":"TypeScript"}`
- `AskUserQuestion` -- ``{"questions":[{"header":"Health chip","question":"Sync banner and vault health: how should system problems show on the page?","multiSelect":false,"options":[{"label":"One health chip (Recommended)","description":"A single chip, green when clean and red with a count when not. It covers misnamed notes, leftover placeholders, a stale plugin build on the other laptop, missing skills or hooks, a sync problem, and notes missing type or status. Click it to see the list in a note."},{"label":"Chip plus the sync banner","description":"Keep the sync banner strip on the page as well as the chip. More visible, but it uses space and duplicates a signal."},{"label":"Nothing on the page","description":"Problems appear only when you run the doctor command. Cleanest page, but this is how The Plan showed zeros for ten days without anyone noticing."}]},{"header":"Week strip","question":"What should the page show about the week so far?","multiSelect":false,"options":[{"label":"Seven day row (Recommended)","description":"Seven small cells, Monday to Sunday, each shaded by floor rows done, with today outlined, plus one line of totals: wins, floors, problems, study hours. Fits in the hero with no scroll."},{"label":"Totals line only","description":"One line: days with a note, wins, floors, problems, study hours. Smallest, no daily shape."},{"label":"Weekly review only","description":"Nothing about the week on the daily page. It appears when you run the weekly review."}]},{"header":"Projects","question":"Active projects and the clippings queue: what stays on the daily page?","multiSelect":false,"options":[{"label":"Projects as chips, clippings to review (Recommended)","description":"Three chips show each active project\u0027s `next:` line and open the project note. The clippings count moves to the weekly review."},{"label":"Both off the page","description":"Neither is on the daily page. Both appear in the weekly review. Lowest clutter."},{"label":"Both as chips","description":"Three project chips and one clippings chip. Uses more of the page."}]},{"header":"Loses","question":"You said Loses are noted down and the next day\u0027s actions are recalculated from them, not pushed forward. How long should a Lose stay open?","multiSelect":false,"options":[{"label":"Open until made up or dropped (Recommended)","description":"A Lose stays in the note where it happened and is never copied forward. The page counts every open one across notes, oldest first, capped at 7. The eighth must be made up or dropped at close. `/startday` reads open Loses and recalculates the new day\u0027s 80 and 20 from them. The carried mark `[\u003e]` is retired."},{"label":"Closed once the next day is recalculated","description":"Closing the day marks a Lose as handled when the next day\u0027s actions are built from it. The page then shows only the last day\u0027s Loses, so the cap rarely matters."},{"label":"Open for a fixed number of days","description":"A Lose expires after a set number of days, for example 7, and is dropped automatically. This needs a rule for what an auto-dropped Lose records."}]}]}``
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git show --stat=160 --format='%h %s' fb8f157 | head -30; echo ---; echo "Plan daily template headings:"; grep -n "^#\|^created\|^[a-z_]*:" "30_Order/Templates/Daily Dashboard/Better Today.md" | head -40; echo ---; echo "Schema headings:"; grep -n "^#" "30_Order/Standards/Dashboards/Daily Note Schema.md" | head -30; echo ---; grep -rniE "time log|time-log|timelog|time spent|stopwatch|clockify|toggl\b" --include=*.md 00_Live 30_Order 40_Resources/Obsidian 60_Jarvis 2>/dev/null | grep -vi "toggle" | cut -c1-200 | head -10; echo "(blank above = no time-log design notes)"; echo ---; ls 00_Live/Enumerate/Daily | tail -5; echo; ls 00_Live | head -30
```
```
fb8f157 auto-sync: 2026-10-26 15:00 | 21 files

 .claude/skills/closeday/SKILL.md                                                    |   2 +-
 .claude/skills/closeday/reference.md                                                |   4 +-
 .claude/skills/startday/SKILL.md                                                    |   2 +-
 30_Order/Standards/Dashboards/Daily Note Schema.md                                  |   9 ++++-
 30_Order/Standards/Naming and Folder Map.md                                         |   2 +-
 30_Order/Standards/References/Reference - closeday.md                               |   2 +-
 30_Order/Standards/References/Reference - startday.md                               |   2 +-
 30_Order/Standards/The Plan Vault Architecture.md                                   |   2 +-
 30_Order/System/streak/QuickAdd Setup.md                                            |   8 ++--
 30_Order/Workflows/Daily Dashboard.md                                               |   6 +--
 40_Resources/Obsidian/Dashboards/Decisions Log.md                                   |   1 +
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Architecture.md                |  97 +++++++++++++++++++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Build Log.md                   |  42 ++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Decisions Log.md               |  62 +++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Plugin Retirement List.md      |  64 ++++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md     |  97 +++++++++++++++++++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Carry Forward.md        |  75 +++++++++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Dashboard Page.md       | 113 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Day Model and Streak.md | 145 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Plans Feed.md           |  86 ++++++++++++++++++++++++++++++++++++++++
 40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Verification and Risks.md      |  70 +++++++++++++++++++++++++++++++++
 21 files changed, 874 insertions(+), 17 deletions(-)
---
Plan daily template headings:
2:type: thought
3:thought_kind: reflection
4:status: seed
5:related_progress:
7:tags:
10:next:
12:# Did you get better today?
14:## Morning Plan
23:### 80
30:### 20
37:## Daily Wins
45:## Daily Floor
52:## Productivity
57:## Just Write
68:### Good Habits 
72:### Bad Habits 
75:## Tomorrow
---
Schema headings:
18:# Daily Note Schema
22:## File
36:## Template
41:## Frontmatter
61:## Body order
77:### Targets
88:### Action lines
100:### Default actions
114:### Evening close
124:### Next actions
134:### Intake
138:## Cause tags
142:## Rules
149:## Validator
164:## Example
173:## Targets
178:## Morning
184:## Study
188:## Evening close
192:## Next actions
199:## Open points
---
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Build Hub.md:81:- [ ] What is the format of Toggl timestamps in The Plan, and where do they land? No vault note mentions Toggl.
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Decisions Log.md:43:| D19 | Time management | Manage time by reference to the daily notes in The Plan. Timestamps in The Plan record time spent per
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Decisions Log.md:52:- "Doge" and "the store" are read as Toggl.
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md:22:It is a design. It covers how today's calendar reaches the page, how a planned block reaches the calendar, how time s
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md:31:- Toggl is not mentioned in any vault note. Anant says it is used in The Plan, and this is unverified.
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md:57:## Layer 3: Time spent, read from The Plan
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md:59:- `/startday` and `/closeday` read The Plan's daily note, read only, and use it for one purpose: fill `study_today` a
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md:87:- No Toggl, Todoist or other service called by the plugin.
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md:94:- [ ] What is the format of Toggl timestamps in The Plan, and where do they land in its daily note?
40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Dashboard Page.md:104:- No calls to Google, Todoist, Toggl or any outside service from the plugin.
(blank above = no time-log design notes)
---
2026-10-05.md
2026-10-12.md
2026-10-19.md
2026-10-25.md
2026-10-26.md

Books
Career
Enumerate
Headway
Health & Life
Life OS.md
Map Canvas.canvas
Map.md
Monthly Dashboard.md
Tracking
```
- `WebSearch` -- `{"query":"CSS container query units cqw cqh clamp scale font size to fit container browser support MDN","mode":"standard"}`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && echo "headings of today's Plan daily note:"; grep -n "^#\|^created\|^type\|^thought_kind\|cat::" "00_Live/Enumerate/Daily/2026-10-26.md" | cut -c1-90 | head -30; echo "cat:: lines:"; grep -c "cat::" "00_Live/Enumerate/Daily/2026-10-26.md"; echo ---; git show fb8f157 -- "30_Order/Standards/Dashboards/Daily Note Schema.md" "30_Order/Workflows/Daily Dashboard.md" | grep "^[+-]" | grep -v "^+++\|^---" | cut -c1-260; echo ---; echo "Plan periodic notes daily template now:"; grep -o '"daily": *{[^}]*}' .obsidian/plugins/periodic-notes/data.json | cut -c1-260
```
```
headings of today's Plan daily note:
2:type: thought
3:thought_kind: reflection
12:# Did you get better today?
14:## Morning Plan
23:### 80
30:### 20
37:## Daily Wins
45:## Daily Floor
52:## Productivity
57:## Just Write
68:### Good Habits 
72:### Bad Habits 
75:## Tomorrow
cat:: lines:
0
---
-  - "[[Daily Note]]"
+  - "[[Better Today]]"
-Source: the Daily note schema, Cause tags and Validator rules sections of [[Spec - Streak and Daily Note]]. The daily note is the only source of truth. Dashboards read it and store nothing, and nothing is wiped at night, so history survives. The skeleton is t
+Source: the Daily note schema, Cause tags and Validator rules sections of [[Spec - Streak and Daily Note]]. The daily note is the only source of truth. Dashboards read it and store nothing, and nothing is wiped at night, so history survives. The skeleton is t
+## Template
+
+Since 2026-10-26 the daily template is `30_Order/Templates/Daily Dashboard/Better Today.md` ([[Better Today]], Decision 51). `Daily Note.md` was deleted. Periodic Notes creates each day's note from it, in `00_Live/Enumerate/Daily`, named `YYYY-MM-DD`. The wee
+
+**Known gap, 2026-10-26.** The engine counts only checkbox lines with a `[cat:: ...]` field under the five category headings. `Better Today.md` has none of them: no `type: daily` frontmatter, no `## Targets` to `## Intake` headings, no `[cat::]` lines. A note
-  - "[[Daily Note]]"
+  - "[[Better Today]]"
-| Template | The skeleton for a new note | [[Daily Note]], in `30_Order/Templates/Daily Dashboard` |
+| Template | The skeleton for a new note | [[Better Today]], in `30_Order/Templates/Daily Dashboard` |
-| Today's note is missing | `/startday` offers to create it. Or run QuickAdd, or Templater with [[Daily Note]]. A missing note scores MISS at midnight. |
+| Today's note is missing | `/startday` offers to create it. Or run QuickAdd, or Periodic Notes, which uses [[Better Today]]. A missing note scores MISS at midnight. |
---
Plan periodic notes daily template now:
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -n "^| 51\|^| 52\|^| 53" "40_Resources/Obsidian/Dashboards/Decisions Log.md" | cut -c1-1800; echo ---; sed -n '/^## Template/,/^## Frontmatter/p' "30_Order/Standards/Dashboards/Daily Note Schema.md" | cut -c1-1500
```
```
75:| 51 | Daily template is Better Today (2026-10-26) | `Daily Note.md` is deleted. [[Better Today]] is the template for daily notes, set in Periodic Notes with the formats `YYYY-MM-DD`, `gggg-[W]ww`, `YYYY-MM` and `YYYY`. The skills, the standards and the QuickAdd setup now name it. | The template does not yet carry the engine structure (`type: daily`, `## Targets` to `## Intake`, `[cat::]` lines), so the streak reads 0 until it does. See Template in [[Daily Note Schema]]. Open until Anant decides how the structure gets back into the template. |
---
## Template

Since 2026-10-26 the daily template is `30_Order/Templates/Daily Dashboard/Better Today.md` ([[Better Today]], Decision 51). `Daily Note.md` was deleted. Periodic Notes creates each day's note from it, in `00_Live/Enumerate/Daily`, named `YYYY-MM-DD`. The week, month and year notes come from [[Better Week]], [[Better Month]] and [[Better Year]], named `gggg-[W]ww`, `YYYY-MM` and `YYYY`. The skills `startday` and `closeday` create a missing note as a verbatim copy of Better Today. The daily-auditor and the validator read this schema, not the template.

**Known gap, 2026-10-26.** The engine counts only checkbox lines with a `[cat:: ...]` field under the five category headings. `Better Today.md` has none of them: no `type: daily` frontmatter, no `## Targets` to `## Intake` headings, no `[cat::]` lines. A note made from it shows every category with `total` 0, so the streak cannot move, and `/closeday` has no `## Targets` heading to put the career line under. The note validates (`ok: true`) because the six rules check names, folders and the lines that exist, not whether any exist. Until the template carries the structure below, treat a note with every category at `total` 0 as unscored and say so instead of reporting a streak.
## Frontmatter
```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Decisions Log.md`
```
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

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Day Model and Streak.md`
````
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
project_kind: spec
next: "Design final. A build session patches the Daily Note Standard and the template, with Anant's approval for each edit"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Spec - Plans Feed]]"
---
# Jarvis Spec - Day Model and Streak
## What This Is
==A Jarvis day is a daily note made of checkbox lines that the plugin can flip, and a streak that counts the days on which every floor row was done.==
This note defines the daily note shape the plugin reads, the fields on each line, the Loses lifecycle, the streak rule and the checks that guard them. It sits on top of the [[Daily Note Standard]] and keeps its headings, its Daily Loses line format and its frontmatter keys. It changes how wins and the floor are recorded and how Loses carry. The page rules are in [[Jarvis Spec - Dashboard Page]].

## Current State
Checked on 2026-10-26.
- The template [[Better Today]] holds seven frontmatter booleans (`win_project`, `win_career`, `win_cleanup`, `win_review`, `floor_1`, `floor_2`, `floor_3`) shown by Meta Bind toggles inside two tables. `lc_count` and `study_today` are typed. `wins_done` and `floors_done` are written by `/closeday`.
- The 80 and the 20 are checkbox lines under `### 80 - The One Thing` and `### 20 - Supporting Work`. `### Blocks` is a plain list.
- Daily Loses are task lines with `[why::]`, `[fix::]`, `[from::]` and `[since::]`, and four marks: `[ ]` open, `[x]` made up, `[>]` carried, `[-]` dropped. `/startday` copies an open Lose forward.
- The dashboard counts the toggles with DataviewJS. Nothing else reads them.
- Application progress is a field on each tracker note: `date_applied` in `10_Areas/Career/Internships/Tracker/Each One/Current/`. The folder holds 29 notes. [[2026-W44]] records 29 researched and 0 applied. There is no `Applied/` folder.
- Nothing in this note is built.

## The new daily note shape
Headings stay as the Standard names them. Only the line formats under them change.

```markdown
(frontmatter starts)
type: thought
thought_kind: daily
status: active
day_state: planned
created: 2026-10-27
updated: 2026-10-27
tags:
  - daily
lc_count: 0
study_today: 0
wins_done: 0
floors_done: 0
(frontmatter ends)
# Did you get better today?
## Morning Plan
*Goal*: one line
### 80 - The One Thing
- [ ] I will submit 5 applications at 2 pm at my desk. [plan:: Fall 2026 Plan]
### 20 - Supporting Work
- [ ] Cover letter for Uber is final. [for:: 80]
- [ ] Resume tailored for Deloitte. [for:: 80]
### Blocks
- [ ] 14:00-16:00 Internship: 5 applications sent [cal:: abc123] [spent:: 95]
**Do NOT do today:**
## Daily Wins
- [ ] Project: Portfolio UI repolished [win:: project]
- [ ] Career: one application sent [win:: career]
- [ ] Cleanup: inbox at zero [win:: cleanup]
- [ ] Review: close the day by 10:30 pm [win:: review]
## Daily Loses
- [ ] CSCI 4041: 5 problems logged [why:: opened YouTube first] [fix:: laptop opens on DSA.md] [from:: weekly] [since:: 2026-10-26]
## Daily Floor
- [ ] One company moved to Applied [track:: application]
- [ ] 5 problems logged in Weekly Set [track:: practice]
- [ ] One class step for CSCI 4061 [track:: class]
## Productivity
## Carryover from Previous Sessions
## End of Day
## Proof of the day
- [proof:: Shipped 5 applications with the final cover letter]
```

## Fields
| Field | On which line | Holds |
|---|---|---|
| `[plan:: name]` | The 80, optional on a 20 | The plan or board note that owns the task, so the line holds no copy of the plan |
| `[for:: 80]` | Every 20 line | The 80 it serves. A 20 line without it is invalid. |
| `[cal:: id]` | A Blocks line | The Google Calendar event id, so a moved event updates its line and does not duplicate |
| `[spent:: minutes]` | A Blocks line | Minutes of tracked time, written at close from The Plan's time records ([[Jarvis Spec - Automation Layer]]) |
| `[win:: project, career, cleanup, review]` | A wins line | Which win it is. Each value appears once. |
| `[track:: name]` | A floor line | A floor row name from the term's config table |
| `[why::]`, `[fix::]`, `[from::]`, `[since::]` | A Lose | Unchanged from the Standard. `from` is `weekly`, `calendar`, `win`, `floor` or `other`. |
| `[due:: YYYY-MM-DD]` | A weekly Goal line | A deadline the Blocks strip lists for the next 7 days |
| `[proof:: text]` | One line under `## Proof of the day` | One line of evidence, written at close |

Blocks marks: `[ ]` open, `[x]` done, `[-]` missed with a `[why::]`. Win and floor marks: `[ ]` and `[x]`.

## Floor rows per term
The rows live in a config table, not in code. A new term changes the table and the plan note.

| Term | Row | Track | Done when |
|---|---|---|---|
| Fall 2026 | 1 | `application` | A tracker note has `date_applied` equal to today |
| Fall 2026 | 2 | `practice` | LeetCode or CodePath reps logged, at least 5 |
| Fall 2026 | 3 | `class` | One class step finished |
| Term end | | | 2026-12-24 |

Anant ticks a floor line with evidence. Nothing ticks it for him. The validator warns when the `application` line is ticked and no tracker note has today's `date_applied`, and when `practice` is ticked with `lc_count` under 5. A warning never changes a tick.

## Daily Loses lifecycle
1. A Lose is written the day it slips, in that day's note, with `since` set to that date.
2. It is never copied forward. It stays where it happened. The `[>]` carried mark is retired.
3. It is open until made up (`[x]`) or dropped (`[-]` with a reason in `why`).
4. The page counts every open Lose across all daily notes, oldest first, with its age (today minus `since`).
5. The cap is 7 open Loses. At close, an eighth cannot be added until one is made up or dropped. `/closeday` refuses to set `day_state: closed` while more than 7 are open.
6. At close, `/closeday` recalculates tomorrow from the day's Loses and writes a preview ([[Jarvis Spec - Plans Feed]]). A Lose informs tomorrow. It does not become tomorrow's task by copying.
7. The plugin can tick a Lose to `[x]`. Everything else about a Lose is written by `/closeday`, which asks for the why and the fix and never invents them.
8. Older notes may hold `[>]`. The engine treats it as closed history.

## Streak rule
It is the rule from The Plan's Streak Rule with the floor as the unit.
1. A day is MET when it has at least one floor line and every floor line is ticked.
2. A day is MISS when a floor line is open at the day's end, or the note is missing. A missing note is a MISS.
3. Today is PENDING until midnight, unless it is already MET. The rollover is midnight. A tick after midnight belongs to the new date.
4. The streak starts on the earliest day whose note has at least one floor line.
5. Walk from the start day to yesterday. A MET day adds one. An isolated MISS is forgiven: it adds nothing and does not reset. A second MISS in a row resets the run to zero.
6. The current streak is the run, plus one when today is MET.
7. The best streak counts closed days only. Today joins it the next day.
8. A forgiven day counts as a lost day in the month totals.
9. At risk means yesterday was a MISS and today is not yet MET.
10. Milestones are 3, 7, 21, 66 and 100, with the titles in [[Jarvis Decisions Log]] D16.
11. The week is ISO, Monday to Sunday ([[Jarvis Decisions Log]] D33).

The wins score is the count of ticked win lines, from 0 to 4, and is separate. The research behind a forgiven miss and the 66 day milestone is in [[Jarvis Research - Outside Sources]].

## Write primitives
The plugin has three ways to change a file and no others.
1. **Replace one line.** Used for a tick, an edit in place and the proof line. It runs inside `Vault.process`, checks that the line at the index still equals the text the page saw, and refuses otherwise. It keeps LF or CRLF as found and changes nothing else.
2. **Change a frontmatter number.** `lc_count` and `study_today` only, through `processFrontMatter`, with plus and minus buttons.
3. **Create today's note.** From the template, named `YYYY-MM-DD`, refused if the note exists or the name is not an ISO date.

## Validator rules
`validate` reports each breach with the line and the rule. It never rewrites a note.
1. The file name is `YYYY-MM-DD.md`. Any other name in the Daily folder is reported as misnamed.
2. `created` and `updated` are real dates. A leftover `<% %>` is reported.
3. Exactly one 80 line.
4. Two to four 20 lines, each with `[for:: 80]`.
5. Each floor line has a `[track::]` that is in the term's config table.
6. Four win lines, one per `[win::]` value.
7. Each Lose has `[since::]`. A missing `[why::]` reads `(unanswered)`.
8. On a closed day, `wins_done` and `floors_done` equal the ticked lines, and an End of Day exists.
9. Each Blocks time reads `HH:MM-HH:MM` and ends after it starts.
10. A mark other than `[ ]`, `[x]`, `[X]` or `[-]` is reported. A `[>]` in a note from before 2026-10-26 is accepted.
11. Across all notes, open Loses number at most 7. This is a `doctor` and close-time check, not a per-note check.

## Migration
Old notes keep the old shape and stay as history ([[Jarvis Decisions Log]] D40). The engine reads only the new shape. A day in the old shape has no floor lines, so it never starts or extends a streak. The page shows the streak start as the first day with a floor line. The template and the Standard patch are listed in [[Jarvis Spec - Carry Forward]].

## Non-Goals
- No streak for the wins, and no separate streak for a single track.
- No automatic ticking from a count, a tracker note or a calendar event.
- No health, meals, water or personal habits. Those belong to The Plan.
- No copying of an open Lose into another day.
- No change to any note while this is a design.

## Open Questions
None blocking the build. Every question was answered or defaulted on 2026-10-26, see [[Jarvis Decisions Log]].

````
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Dashboard Page.md`
````
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - ui
project_kind: spec
next: "Design final. A build session measures the real full-screen pane size on each laptop first"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Carry Forward]]"
  - "[[Jarvis Research - Outside Sources]]"
---
# Jarvis Spec - Dashboard Page
## What This Is
==The Jarvis dashboard is one page that never scrolls vertically, shows the whole working day at a glance, lets Anant tick and edit in place, and rewards a day done right with a number that grows.==
It is a view inside the `jarvis-dashboard` plugin. It replaces `00_Dashboard.md` and `10_Areas/Jarvis OS Dashboard.canvas` ([[Jarvis Decisions Log]] D23). The data it reads is defined in [[Jarvis Spec - Day Model and Streak]]. What it keeps from the old page is in [[Jarvis Spec - Carry Forward]].

## Current State
Checked on 2026-10-26.
- The page is a markdown note with DataviewJS, Meta Bind and Multi-Column Markdown, plus a canvas. Homepage opens the canvas. Both hold the same queries by hand, which [[Jarvis Dashboard Build Record]] lists as known drift.
- The plugin is not built. The Plan's plugin is the reference: a React view with a scaled grid and inline SVG. Its screens have never been shown real data, because its notes were misnamed ([[Jarvis Research - The Plan Parallel Builds]]).
- It opens only inside Obsidian, full screen, on the Dell and the Acer ([[Jarvis Decisions Log]] D2, D28).

## The rules of the page
1. **No vertical scroll, anywhere.** The root and every card use `overflow: hidden` on the vertical axis. No `overflow-y: auto` or `scroll` exists in the styles.
2. **Horizontal scroll only for written text.** A line Anant wrote (an 80, a 20, a Lose, a block title, a proof line) is one row with `white-space: nowrap` and `overflow-x: auto`, scrollbar hidden. It scrolls by wheel, drag, touchpad or keyboard. Numbers, labels, rings, the heatmap, chips and buttons never scroll in either direction.
3. **The page scales to fit.** The grid and the font size follow the pane size, so every card fits at any full-screen size above a minimum. Below the minimum a plain banner reads "Window too small". Nothing is hidden to make it fit.
4. **Everything that ticks stays live.** A tick is one click or the space key. The row changes at once, and the redraw from disk confirms or reverts it.
5. **Everything written can be edited in place.** Double-click a line to edit its text. Enter saves, Escape cancels. The save uses the same stale-line check as a tick, and fields such as `[for:: 80]` are kept ([[Jarvis Decisions Log]] D45).
6. **Plain words.** No praise and no guilt. A miss reads "Day 2 of miss. Streak breaks tomorrow." with numbers.
7. **Every number comes from the engine.** The page computes nothing the engine does not.

## Blocks on the page
| Block | Shows | Source | Interaction |
|---|---|---|---|
| Hero | Streak number, builder level with the next milestone and days to go, floor ring (rows done of rows), wins ring (0 to 4), an at-risk line, the seven day row (Monday to Sunday, today outlined) and one line of week totals (wins, floors, problems, study hours) | Engine | None |
| Today | The 80, then the 20, each a tick row with its plan pointer | Daily note | Tick, double-click to edit, click the pointer to open the plan |
| Blocks | The block running now, the next one, planned against tracked minutes, then deadlines due in 7 days | `### Blocks` and `[due::]` on weekly Goals | Tick a block, click to open |
| Loses and carryover | Open Loses oldest first with age and the count out of 7, then carried work from the session log | `## Daily Loses`, `## Carryover from Previous Sessions` | Tick a Lose to `[x]`, double-click to edit |
| Pipeline | Applications today and this week out of 10, LeetCode out of 5, study hours | Tracker `date_applied`, `lc_count`, `study_today` | Plus and minus on the two numbers |
| Projects | Three chips, each an active project's `next:` line | Project notes' frontmatter | Click opens the project note |
| Heatmap | The last 30 days of floor rows done, today outlined, forgiven days dashed, missing notes faint | Engine | Click a day to open its note |
| Proof | Yesterday's proof line and today's proof field | `[proof::]` | Type one line, Enter saves |
| Health chip | Green when clean, red with a count otherwise | `validate`, `doctor` | Click opens the list as a note |
| Links | Chips for the system notes, Mentorship Board and the plan notes | Config | Click opens |

Not on the page: the clippings count (weekly review), the areas table and the old sync banner ([[Jarvis Spec - Carry Forward]]).

## Layout
Two layouts chosen by pane shape. The wide layout is the target, because the page runs in full-screen Obsidian.

```
+------------------+----------------------------------+------------------+
| HERO             | TODAY: the 80 and the 20         | LOSES, n of 7    |
| streak, level    |                                  | and carryover    |
| floor ring       +----------------------------------+                  |
| wins ring        | BLOCKS: now, next, due soon      |                  |
| 7 day row        |                                  |                  |
+------------------+----------------------------------+------------------+
| PIPELINE: applications, LeetCode, study hours | PROJECTS chips          |
+-----------------------------------------------+-------------------------+
| HEATMAP, 30 days             | PROOF            | HEALTH chip | LINKS   |
+------------------------------+------------------+-------------+---------+
```

The compact layout is two columns. It holds the same blocks and appears only when a split or sidebar makes the pane narrow, below about 720 px wide. It is not a phone layout ([[Jarvis Decisions Log]] Correction 7).

Row limits keep each card inside its cell at the minimum font size: the 80 is one row, the 20 at most four, blocks at most eight, visible Loses at most seven (the cap itself), project chips three.

## Scaling and window sizes
- The root measures its pane with a ResizeObserver. Font size is the smaller of a width term and a height term, clamped between 11 px and 22 px. The constants are fixed in the build against the sizes below.
- CSS container query units (`cqw`, `cqh`) are an alternative. They are supported in current Chromium, Safari and Firefox ([[Jarvis Research - Outside Sources]]), and Obsidian's embedded Chromium version is unverified, so the plan is measured scaling as The Plan does.
- Sizes to hold: full-screen Obsidian on each laptop with sidebars closed. Each laptop's real view size is read once with a debug command that prints the view's `clientWidth` and `clientHeight`. Until then the fixtures are 1920 by 1080, 1536 by 864 and 1366 by 768 less about 40 px of window chrome, which are common Windows laptop sizes and are an assumption.
- Below 11 px the "Window too small" banner shows.

## Visual system
- Colours are CSS variables defined in `styles.css` under the class prefix `jd-`, mapped to Obsidian's theme variables so light and dark follow the theme. No colour is hard coded in a script, and a test greps the bundle for hex colours, because The Plan's build broke this rule.
- Tokens: surface, text, muted text, accent, good, warning, bad, and a six step ramp for the heatmap.
- The floor ring is red at 0 rows done, orange from 1 row to all rows minus one, and green when all rows are done.
- Big numbers use the monospace font with tabular digits.
- The ring animates over 350 ms and pulses once when it completes. `prefers-reduced-motion` turns both off.
- Every interactive row is a button with a visible focus ring and works from the keyboard. The plugin ships no default hotkeys.
- Text contrast meets 4.5 to 1 in both themes. A test computes it for each token pair.
- No `innerHTML`, no inline colour styles.

## Delight, kept small
- **Builder levels.** The title sits beside the streak and changes at 3, 7, 21, 66 and 100. The research on intact streaks is in [[Jarvis Research - Outside Sources]]. The page shows the intact streak and never a "broken" count.
- **Proof of the day.** Yesterday's proof shows as "Yesterday you proved: ...". Writing today's takes one line.
- **Heatmap.** Thirty days, ten columns by three rows in the wide layout and six by five in the compact one.
- **Pipeline momentum.** "Applications this week: 4 of 10", with the gap stated plainly.

## States and errors
| State | What the page shows |
|---|---|
| Today's note is missing | An empty floor ring and a "Create today's note" button that builds `YYYY-MM-DD.md` from the template |
| A note in the Daily folder is misnamed | A red banner with the file name and the correct name. The engine ignores the note. |
| A note has a leftover `<% %>` date | A banner naming the note |
| The window is too small | The banner from rule 3 |
| Blocks are missing or the calendar was unavailable | "Blocks not loaded today. Run /startday." |
| More than 7 open Loses | The chip shows 7 of 7 in red and the eighth is refused at close. If older notes already hold more, the page shows the oldest 7 and a "+N more" chip that opens the oldest in its note. |
| Time records are not defined or unreadable | The Blocks card shows planned time only |
| The engine and the screen disagree | The health chip turns red and a debug command prints both |
| The term has ended | A red health chip until the config has a new term |

## Performance
Cold launch to a visible page in under 2 seconds on both laptops, as in The Plan's budget. A tick redraws the Hero, Today, Pipeline and Heatmap within one second. The Hero and Today render first and the rest follow.

## How the page is tested
A layout engine is needed, which jsdom does not have. Three layers:
1. A style test: no `overflow-y: auto` or `scroll` anywhere, and every card has `overflow: hidden`.
2. A real-browser test: the built bundle in a static harness page under headless Chromium, at the three fixture sizes, asserting that the root and each card have `scrollHeight` not above `clientHeight`, with worst-case fixtures (7 Loses, 4 twenties, 8 blocks, long text lines). Playwright is the candidate. It has not been verified here.
3. A live check: a debug command in Obsidian prints `scrollHeight` and `clientHeight` for the root and each card at the laptop's real full-screen size.

## Non-Goals
- No vertical scroll, no tabs and no pop-up pages that scroll.
- No calls to Google, Todoist, Toggl or any outside service from the plugin.
- No personal-life content: no health, meals, water or relationships.
- No phone build and no phone layout.
- No chart that cannot be read at the minimum size.
- No default hotkeys.

## Open Questions
None blocking the build. The real pane sizes are measured at the start of the build, as planned above.

````
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Plans Feed.md`
```
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - plans
project_kind: spec
next: "Design final. The 2026-12-24 term review is the first real use"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Automation Layer]]"
---
# Jarvis Spec - Plans Feed
## What This Is
==Every plan keeps one owner note, and the daily note holds only a one-line pointer to it, so planning feeds the day without a second copy.==
This note says how the standing plans (the Fall 2026 plan, the weekly note, project plans, mentorship plans, UMN course boards and the career pipeline) become the 80, the 20 and the floor of one day, and how a day's Loses shape the next one. It follows [[Plan Standard]] for what a plan is.

## Current State
Checked on 2026-10-26.
- The Fall 2026 Plan has a Systems table of 22 tracks, each with a cadence and a done-definition. Three run daily: the application floor, LeetCode and CodePath, and the class step. The rest run weekly, monthly or once. It also has a week-by-week One Hard Thing table. Source: `10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md`.
- [[2026-W44]] holds the week: daily Goals, three groups of "The 80" (UMN, Development, Others), Friday checkpoints, carried items and a calendar format.
- The [[Daily Note Standard]] says the 80 and the 20 come from the weekly Goals and the calendar, not from memory.
- The Plans Board says the Fall plan ends 2026-12-14. Anant's answer is 2026-12-24 ([[Jarvis Decisions Log]] D14).
- Mentorship plans are `Plan - Ahnaf` and `Plan - Jesse` in `20_Progress/Mentorship Program/Plans/`. The dashboard note records one must-do: the Jesse outreach email, due 2026-11-02.
- Course material is under `20_Progress/Degree/`, with a board per course and `_Courses/_Courses Board.md`.
- Nothing in this note is built.

## Single ownership
Each plan family has one owner, one thing it supplies and one pointer in the day.

| Plan family | Owner note | Supplies | Surfaces as | Written by | Drift guard |
|---|---|---|---|---|---|
| Term plan | Fall 2026 Plan | The floor rows, the One Thing frame, the One Hard Thing of the week | `[plan:: Fall 2026 Plan]` on the 80 or a floor row | Anant | The health chip turns red at the term end |
| The week | The weekly note | Goals, Friday checkpoints, deadlines | The chosen Goal as the 80, one line | Anant, with Claude proposing | A 20 whose 80 is gone fails `validate` |
| Project plans | The project note's `next:` and Log | The next action of each project | An 80 or 20 line with `[plan:: project]`, and a project chip | Anant | The chip shows the live `next:` |
| Mentorship | `Plan - Ahnaf`, `Plan - Jesse` | Meetings, outreach, the actions from each meeting | A 20 from `/note-to-actions`, a `[due::]` line | Anant | The meeting actions go to the weekly note, not a second list |
| UMN courses | Course boards, `Fall'26 Syllabus` | Assignment and exam dates | `[due::]` on a weekly Goal | Anant | Dates come from the board, never from a calendar title |
| Career pipeline | Tracker notes in `Each One/` | Applications and their dates | Nothing in the note. The page reads `date_applied`. | Anant | `date_applied` only on a finished application |
| Courses and certifications | `_Courses Board` | The course queue | A 20 or a floor `class` line | Anant | The board owns the order |
| Clubs, hackathons, networking | The Fall plan rows, the Hackathons note | Counts and dates | A weekly Goal | Anant | One count in one place |
| Dev projects | Project notes under `20_Progress/Projects` | The development 80 | An 80 line with a plan pointer | Anant | Dev work starts after 6 pm, per [[2026-W44]] |

Personal plans, including resolutions, belong to The Plan and do not appear here ([[Jarvis Decisions Log]] D7).

## How the 80 is chosen
1. `/startday` reads the previous day's preview (below), the weekly Goals, the week-by-week table, today's Blocks and any `[due::]` within seven days.
2. It proposes up to three candidates. The order is the Fall plan's One Thing first, then a hard deadline, then the open Goal that has slipped longest.
3. Anant picks or edits one. It is written as one line: "I will [behavior] at [time] in [place]."
4. If the One Thing is applications, the 80 is the day's application count. The floor row still reads one company moved.
Anant decides the 80. The skill never chooses alone.

## How the 20 is chosen
1. The 20 supports the 80 on that day. It is the set of tasks without which the 80 cannot finish, so the extra work is done with respect to it ([[Jarvis Decisions Log]] D13). If the 80 is five applications, the 20 is the cover letters, the resume edits and the other Jarvis work that make those five ready.
2. The skill derives candidates by reading the 80's own plan note and listing its unfinished prerequisites.
3. It writes two to four lines, each with `[for:: 80]`.
4. A task that does not serve the 80 is not a 20. It goes to the weekly Goals or becomes a Lose.
5. When the 80 changes during the day, the 20 is rewritten to match and the old lines are marked `[-]` with a reason.

## Recalculation from the day's Loses
A Lose is not pushed to the next day ([[Jarvis Decisions Log]] D24). The next day is recalculated from it.
1. At `/closeday`, for each new Lose the skill reads its `why` and `fix`.
2. It writes a preview under End of Day, as the Standard's `Preview Tomorrow`: the 80 candidate that follows from what slipped, and at most four 20 lines, each derived from a `fix` that is an action.
3. A `fix` that is a change of environment, such as "laptop opens on DSA.md", becomes a 20 line only when it can be done in the day. Otherwise it stays in the Lose.
4. In the morning `/startday` builds the day from the preview, the weekly Goals and the calendar. Anant approves the 80 and the 20.
5. The Lose stays open in its own note until made up or dropped. The cap is 7.

## Pipeline momentum
- The weekly target is 10 applications, each complete and correct ([[Jarvis Decisions Log]] D15).
- The count is the number of tracker notes whose `date_applied` falls in the current ISO week, Monday to Sunday ([[Jarvis Decisions Log]] D33). The page shows "n of 10".
- The daily floor row is one application. The gap to 10 is shown, not enforced.

## The term end
On 2026-12-24 the Fall 2026 plan closes. Whatever is done is done. A short review, written in the weekly note, decides which Systems rows continue, which stop and which floor rows change ([[Jarvis Decisions Log]] D42). The config table in [[Jarvis Spec - Day Model and Streak]] then gets a new term. The streak carries over, because it counts the floor and not the term.

## Failure modes
| Trigger | Effect | Smallest fix |
|---|---|---|
| The weekly note has no Goals for the week | The 80 has no source | `/startday` says so and asks for the 80 by hand |
| The 80 has no plan note | The 20 cannot be derived | The skill asks for the prerequisites once and writes them |
| A plan changes and the daily line keeps the old text | Two versions exist | The line holds a pointer, and `validate` flags a 20 whose 80 was dropped |
| The term ends and the config is not updated | The page shows rows of a closed plan | The health chip is red from 2026-12-24 |
| An application is counted before it is complete | The count overstates | `date_applied` only on a finished application |
| A Lose's `fix` is a wish | The preview has nothing to derive | `/closeday` asks for one concrete change and writes `(unanswered)` otherwise |
| Dev work starts before 6 pm | The weekly rule breaks | It shows as a missed Blocks line and becomes a Lose |

## Non-Goals
- No plan text is copied into the daily note.
- No new plan is created and no existing plan note is edited by this design.
- No automatic choice of the 80.
- No personal plan in Jarvis.
- No copying of Loses between days.

## Open Questions
None blocking the build. The 2026-12-24 review is scheduled by the plan itself.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Automation Layer.md`
```
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - automation
project_kind: spec
next: "Design final. Nothing is built until the manual versions have run clean for two weeks, and the time reader waits for The Plan's time design"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Plans Feed]]"
  - "[[Jarvis Verification and Risks]]"
  - "[[Jarvis Research - Outside Sources]]"
---
# Jarvis Spec - Automation Layer
## What This Is
==The automation layer makes the Jarvis day easier on the calendar and on later platforms, with no tokens in the plugin, no silent writes and no personal content crossing from The Plan.==
It is a design. It covers how today's calendar reaches the page, how a planned block reaches the calendar, how time spent is read from The Plan, the step-by-step day and what is left open for later transports. Nothing here is built ([[Jarvis Decisions Log]] D21).

## Current State
Checked on 2026-10-26.
- The connector is the claude.ai Google Calendar integration, acting as `gupt0479@umn.edu`. It cannot read the vault and the vault cannot call it. Its tools, limits and the ten calendars on the account are in [[How to Use Google Calendar]], checked against the live account on 2026-10-25.
- The working calendar is a plain Google calendar named "Todoist" (id starts `c_2195`). It does not sync with Todoist. The guide suggests renaming it "Blocks".
- The guide's rules for writes: read before writing, write only to the working calendar, leave meetings alone, silence every write with `notificationLevel: NONE`, use the five-line event format, set a 5 minute popup, propose a week's blocks in the weekly note and get a yes before bulk creation, and re-list the week after writing.
- The UMN class blocks are not visible to the connector.
- The Daily Note Standard already has a `### Blocks` heading, filled by `/startday` from today's calendar, read only.
- Toggl is used in The Plan. The Plan has no note or design for it yet ([[Jarvis Research - The Plan Parallel Builds]]). Time is to be calculated in two places there ([[Jarvis Decisions Log]] D19).
- The Plan's daily template changed on 2026-10-26 and its structure is still open (Decision 51 in The Plan). The Plan says it already reads Jarvis's dashboard, weekly, monthly and plan notes on its own daily, weekly and planned runs. That statement is Anant's and is not verified in the vault.
- Todoist is out of the Jarvis design ([[Jarvis Decisions Log]] D18).

## The principle
The plugin only reads Jarvis. Claude is the bridge to every outside service. The daily note is the hand-off: Claude writes a line and the plugin shows it. Tokens, expiry and failures stay out of the plugin, and a failed call leaves the page honest rather than blank. Jarvis never writes to The Plan.

## The day, step by step
| When | Trigger | Actor | Reads | Writes | Approval | Breaks when |
|---|---|---|---|---|---|---|
| Evening, before close | Anant runs `/closeday` | `/closeday` | Toggles' replacement lines, Blocks, The Plan's time records, the weekly Goals | `wins_done`, `floors_done`, `study_today`, Loses, End of Day, the preview for tomorrow, `[spent::]` on Blocks, `day_state: closed` | One block of questions, then one list of writes and a yes | Node or the CLI is missing: it stops |
| Night | Anant | Nobody | | Tomorrow's note is created by the plugin's Create button or `/startday` | None | The note is missing at midnight and the day is a MISS |
| Morning | Anant runs `/startday` | `/startday` | The preview, weekly Goals, today's calendar, `[due::]` lines | The 80, the 20, wins, floor, `### Blocks` | A proposal for the 80 and the 20, a yes | The connector is down: "connector unavailable" |
| During the day | Anant opens Obsidian | The plugin | The daily note, tracker `date_applied` | A tick, an edit, a number, the proof line | None | A stale line is refused and the row reverts |
| Sunday | Anant runs the weekly review | `/weekly-review`, calendar planning | The week, the Goals | A table of proposed blocks in the weekly note, then calendar events after a yes | A yes before any bulk create | A wrong count after writing: re-list and report |
| 2026-12-24 | The term ends | Anant, Claude | The Fall plan, the floor config | A term review in the weekly note, a new config term | A yes | The config is not updated |

## Layer 1: Today's blocks onto the page
1. `/startday` reads the primary calendar and the working calendar for today, read only, and writes `### Blocks` lines: time, title, `[cal:: id]`.
2. The plugin reads those lines and shows the block that is running now, the next one and the deadlines due in 7 days.
3. If the connector was unavailable, the section says "connector unavailable", as the Standard requires, and the page says "Blocks not loaded today. Run /startday."
4. A block that passed with no tick is not decided by the page. At close it becomes a candidate Lose.
Only the primary calendar and the working calendar are read. The other eight are ignored, as the guide says. The class blocks stay anchors read from the course boards.

## Layer 2: Planned blocks onto the calendar
1. Sunday planning, after the weekly Goals exist: Claude lists the week, proposes the blocks as a table in the weekly note and waits for a yes.
2. After the yes it creates the blocks on the working calendar in the five-line format, then re-lists the week and reports the exact count.
3. `/closeday` may move one missed block into the next free slot without a table, as the guide allows.
4. Meetings are never moved. Prep blocks are placed before them. A block that cannot fill the WHAT line is not created.
Calendar writes stay manual: one tap, one approval, one count.

## Layer 3: Time, read from The Plan
Time is calculated in two places in The Plan, both read only by Jarvis ([[Jarvis Decisions Log]] D19, D20).
1. **The overview** in The Plan's daily note: a summary of what happened that day.
2. **Detailed time logs**, a folder of notes with per-task time, so that Jarvis and The Plan can both take a detailed account.

### The reader
- Skills never open The Plan's notes. They call `dashboard-cli plan-time <date>`.
- The CLI reads the files in Node and prints only fields from an allowlist: the configured time headings and the time log folder. Every other heading is dropped in the same step and never reaches Claude's context or a Jarvis note. Personal content therefore does not appear in the Jarvis workflow.
- The allowlist and The Plan's path are config, set per machine ([[Jarvis Architecture]]).
- The reader never writes, and Jarvis never writes to The Plan.
- Whether Jarvis's own hooks allow the read is tested before the reader is relied on ([[Jarvis Verification and Risks]]).

### What Jarvis uses it for
- `study_today`, proposed at close and confirmed by Anant.
- `[spent:: minutes]` on each Blocks line, so the page shows planned against tracked time.
- The consistency agent, which compares both days read only and reports mismatches: study hours that disagree, a block ticked with no time in The Plan, one piece of work counted twice. It writes nothing.

### What The Plan must define first
The Plan's own build owns these. Until they exist, `plan-time` returns `{"status":"not_defined"}` and the page shows planned time only.
1. The heading in The Plan's daily note that holds the time overview.
2. The path and naming of the time log folder.
3. The entry format. A proposal that matches Blocks lines: `- HH:MM-HH:MM task label [proj:: name]`, so a time entry matches a block by overlap.
4. When entries are written, live or at close.
Toggl's own API is not used by Jarvis. For reference, its time entries list returns at most 1000 entries and detailed reports page at 50 entries ([[Jarvis Research - Outside Sources]]). The Plan decides how Toggl data reaches its notes.

## Layer 4: Later transports
Apple Reminders, Zapier and further MCP servers are not designed. The rule for choosing is fixed now so the choice stays simple:
1. Each type of task has one owner: the daily note, the calendar or one reminders app. Nothing is written to two places.
2. A transport must work with the laptop off, or say plainly that it does not.
3. A transport makes one kind of write, and a failure is visible in the note the next morning.
4. A transport the vault cannot test is not built.
Todoist is not a candidate.

## Scheduling
Everything above is manual or one tap until the manual version has run clean for two weeks. This matches Decision 40 in The Plan's record. A scheduled run, if one ever exists, needs a dry run, a log entry and a kill switch, and writes only the section it owns.

## Failure register
| Trigger | Effect | What Anant sees | Detection | Smallest fix |
|---|---|---|---|---|
| The calendar token expires | `### Blocks` stays empty | "Blocks not loaded today" | `/startday` reports the error | Reconnect the connector |
| A calendar write creates the wrong count | Duplicates or gaps in the week | A wrong count in the report | Re-list after writing, per the guide | Delete the duplicate by hand, since Claude does not delete |
| Time zone mix | A block shows an hour off | The strip is wrong | A test with a Winnipeg and an India event | Trust the offset, not the zone label |
| Two laptops write the same daily note | One edit is lost | A tick reverts | The stale-line check refuses | Re-tick, or use one laptop per day |
| The class blocks are invisible | The strip omits lectures | Missing lectures | Known limit in the guide | Add lecture anchors to the weekly note |
| The Plan has no time records | `study_today` stays typed | No tracked time per block | `plan-time` status | Type the number |
| The Plan's headings change | The allowlist finds nothing | `plan-time` returns an empty result | `doctor` compares the allowlist with the live headings | Update the allowlist in config |
| The reader leaks a non-allowlisted heading | Personal text enters Jarvis | Text in a Jarvis note | A test feeds a Plan note with private headings and asserts none are in the output | Fix the reader before use |
| A skill writes the wrong section | A heading holds foreign lines | The validator reports it | `validate` | Fix by hand, the validator never rewrites |
| The Plan's path differs on the other laptop | The reader finds nothing | `not_defined` or an error | `doctor` | Set the path per machine |

## Non-Goals
- No Toggl, Todoist or other service called by the plugin.
- No scheduled or unattended run in this build.
- No deleting of calendar events.
- No writes to The Plan.
- No reading of any Plan heading outside the allowlist.
- No phone reminders until a transport is chosen.

## Open Questions
None blocking the build. The four items under What The Plan must define first are The Plan's design work, tracked in [[Jarvis Build Hub]] as dependencies.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Carry Forward.md`
```
---
type: project
status: active
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - spec
  - migration
project_kind: spec
next: "Design final. Retirement of the old page happens only after a clean fortnight and on Anant's word"
related_progress:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Decisions Log]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Plugin Retirement List]]"
---
# Jarvis Spec - Carry Forward
## What This Is
==Every block of the current Jarvis dashboard has a decided fate in the plugin, so nothing disappears by accident.==
The current setup is `00_Dashboard.md`, `10_Areas/Jarvis OS Dashboard.canvas`, the `dashboard.css` snippet, the daily template and the skills. This note lists each part and where it goes. [[Jarvis Build Overview]] describes the current setup and [[Jarvis Dashboard Build Record]] gives its history.

## Current State
Checked on 2026-10-26. `00_Dashboard.md` and the canvas were both rebuilt that day to read today's daily note and every note's open Loses. Homepage opens the canvas. Inline DataviewJS is off in settings.

## Blocks of the old page
| Old block | Source today | Fate in the plugin |
|---|---|---|
| Sync alert banner | Embed of a banner note | Folded into the health chip ([[Jarvis Decisions Log]] D29). The embed stays on the old page until it retires. |
| Current focus (`today_focus`, `today_80`, `today_20`) | Three frontmatter fields on the page, patched by the skills | Retired. The page shows the 80 and the 20 from the daily note, so the skills stop patching these fields. |
| Wins `n/4` and Floor `n/3` tiles | Frontmatter booleans | The two rings, counted from checkbox lines |
| Problems and Study Hours | `lc_count`, `study_today` | Pipeline block with plus and minus |
| Open Loses tile and list | Open tasks under Daily Loses in any note | Loses block. Ticking writes back to the source line. Capped at 7. |
| This Week roll-up | Notes from Monday to today | Seven day row and one totals line in the hero ([[Jarvis Decisions Log]] D30). The clippings count goes to the weekly review. |
| Today's Priorities | Open tasks outside Loses | The 80 and the 20, which hold exactly that |
| Wins and Floor bars | Meta Bind and DataviewJS | The two rings |
| Active Projects | Dataview over `20_Progress` | Three chips showing each project's `next:` ([[Jarvis Decisions Log]] D31) |
| Internship Pipeline | Dataview over the tracker | Pipeline block, from `date_applied` |
| Clippings Queue | Count in `60_Claude/05_Clippings` | Moves to the weekly review ([[Jarvis Decisions Log]] D31) |
| Vault Health | Notes missing `type` or `status` | Behind the health chip, as a count ([[Jarvis Decisions Log]] D29) |
| System, Claude OS, AI and Daily OS link rows | Static wikilinks | Links block |
| Mentorship must-do (Jesse outreach, 2026-11-02) | A typed line on the page | A `[due::]` line on a weekly Goal, shown in the Blocks strip |
| 10_Areas Overview table | Typed table | Stays in `00_Dashboard.md` until it retires, then moves into `Jarvis Vault Architecture` ([[Jarvis Decisions Log]] D32) |

Every block has a fate, so nothing is lost. Three leave the daily page on purpose: the clippings count, the areas table and the sync banner strip.

## The canvas
The canvas has ten text nodes and no edges. It retires with the page. No exploration canvas is kept ([[Jarvis Decisions Log]] D23).

## Template and skills
| Part | Change |
|---|---|
| [[Better Today]] | Rewritten to the shape in [[Jarvis Spec - Day Model and Streak]]. The two Meta Bind tables become checkbox lists and the frontmatter booleans go. `## Proof of the day` is added. |
| [[Daily Note Standard]] | Patched: line formats, the new fields, the Loses lifecycle and the cap, the optional Proof heading, the validator rules. A patch to a standard needs Anant's approval first. |
| [[Daily Close Loop]] | Patched: Loses stay in place, the preview for tomorrow, the cap check, the time read. Needs approval. |
| `/startday` | Writes the 80, 20, wins, floor and Blocks as lines. Builds the day from the preview. Stops patching the `today_*` fields. |
| `/closeday` | Counts ticked lines. Asks the why and the fix. Writes the preview. Fills `[spent::]` and proposes `study_today` through `dashboard-cli plan-time`. Refuses to close with more than 7 open Loses. |
| `daily-operator` agent | Updated to the new shape |
| `.agents/skills/startday` and `closeday` | Left alone. `.claude` is canonical ([[Jarvis Decisions Log]] D41). |

## Old notes
- The 87 notes with Meta Bind inputs stay as history ([[Jarvis Decisions Log]] D40). Removing Meta Bind turns their inputs into raw text ([[Jarvis Plugin Retirement List]]).
- The engine ignores old-shape days.

## Retirement order
1. The plugin ships and passes the acceptance list in [[Jarvis Verification and Risks]] on both laptops.
2. It runs clean for a fortnight.
3. Anant says to retire the page. Homepage is repointed by Anant through the settings screen, since the Homepage settings are under `.obsidian`.
4. The areas table moves into `Jarvis Vault Architecture` with a link-aware move.
5. `00_Dashboard.md` and the canvas are moved to the archive folder only on Anant's word, with a link-aware move and a link check.
6. Plugin removals follow, one at a time, from Anant's own decisions on [[Jarvis Plugin Retirement List]].

## Non-Goals
- No change to any note in this design.
- No removal of a plugin, snippet or setting.
- No merge of the canvas and the page before the plugin exists.
- No move of personal-life content into Jarvis.

## Open Questions
None blocking the build.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Architecture.md`
```
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

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Research - Outside Sources.md`
```
---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - jarvis
  - research
reference_kind: research
notes:
  - "[[Jarvis Build Hub]]"
  - "[[Jarvis Architecture]]"
  - "[[Jarvis Spec - Dashboard Page]]"
  - "[[Jarvis Spec - Day Model and Streak]]"
  - "[[Jarvis Spec - Automation Layer]]"
---
# Jarvis Research - Outside Sources
==What the web and the typed Obsidian documentation say about each specific the Jarvis design leans on, how sure each finding is, and what it changed.== All pages were read on 2026-10-26 through search results and the Obsidian API documentation index. Findings marked Secondary come from a summary and not from the primary page.

## Obsidian plugin API
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| `Vault.process` | Atomically reads, modifies and saves a note. The callback is synchronous and returns the new text. | [Vault.process](https://docs.obsidian.md/Reference/TypeScript+API/Vault/process), [Vault API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/vault.md) | High. Locking against external disk changes is not described. | Every tick and edit uses it, with a stale-line check on top, because atomic does not mean the line is still the one the page saw. |
| `read` and `cachedRead` | `read` reads from disk and is for content you will modify. `cachedRead` is for display. | [obsidian.d.ts](https://github.com/obsidianmd/obsidian-api/blob/master/obsidian.d.ts) | High | The page displays from `cachedRead`. The edit path re-reads before checking a line. |
| `processFrontMatter` | Atomically changes a note's frontmatter. The note must be markdown. It can throw a YAML parse error. | [processFrontMatter](https://docs.obsidian.md/Reference/TypeScript+API/FileManager/processFrontMatter) | High | Used only for `lc_count` and `study_today`, with errors handled. |
| `processFrontMatter` bug report | A forum user reported that from Obsidian 1.5.5 it did not insert the frontmatter delimiters on a new file. No resolution found. | [Forum thread](https://forum.obsidian.md/t/processfronmatter-not-inserting-in-frontmatter/76982) | Low, one report | The create-note path writes the whole frontmatter from the template and does not rely on `processFrontMatter` for a new file. |
| Vault events at load | `create` also fires for every existing file at initial load. Register inside `Workspace.onLayoutReady`. | [Vault API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/vault.md) | High | The plugin registers `create`, `modify`, `delete` and `rename` inside `onLayoutReady`. |
| Metadata cache events | `changed` fires when a file is indexed and is not called on rename. | [MetadataCache API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/metadata-cache.md) | High | The tracker count listens to `changed` and to the vault `rename` event. |
| Views and leaves | `onLayoutReady` runs at once if the layout is ready. `revealLeaf` brings a leaf forward and should be awaited. | [Workspace API](https://github.com/obsidianmd/obsidian-api/blob/master/_autodocs/api-reference/workspace.md) | High | The open command finds the leaf by type, never stores a view. |
| Desktop only | A plugin that uses Node modules such as `fs`, `crypto` or `os` must set `isDesktopOnly` to true. | [Submission requirements](https://docs.obsidian.md/Plugins/Releasing/Submission+requirements+for+plugins), [Manifest](https://docs.obsidian.md/Reference/Manifest) | High | `isDesktopOnly: true` is allowed, and version 1 still uses no Node API. |
| `isDesktopOnly` reset | A forum user reported that a plugin update reset a manually set value. | [Forum thread](https://forum.obsidian.md/t/when-updating-a-plugin-dont-reset-the-isdesktoponly-value-in-manifest-json/108368) | Low, user report | The manifest is checked by `doctor` after each deploy. |
| Homepage | Runs any Obsidian command when it opens the homepage. | [Homepage listing](https://community.obsidian.md/plugins/homepage) | Medium | The route is a command that opens the plugin view. |

## Layout
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| Container query units | `cqw`, `cqh`, `cqi`, `cqb`, `cqmin` and `cqmax` size things relative to a query container. `cqh` needs `container-type: size`. | [Can I use](https://caniuse.com/css-container-query-units), [Frontend Masters](https://frontendmasters.com/blog/container-queries-and-units/) | Medium | Kept as an alternative to measured scaling. |
| Support | Chromium from about version 105, Firefox from 110, Safari from 16. | [Can I use](https://caniuse.com/mdn-css_types_length_container_query_length_units) | Medium, a dated snapshot | Obsidian's bundled Chromium version is unverified, so measured scaling is the plan. |
| `clamp()` with container units | No source found for the exact pattern. | | Unverified | Not relied on. |

## Habits and streaks
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| Habit time | Lally and colleagues found a median of 66 days to reach automaticity, with a range of 18 to 254 days. | [UCL news, 2009](https://www.ucl.ac.uk/news/2009/aug/how-long-does-it-take-form-habit) | Secondary. The 2010 paper was not retrieved. | The 66 day milestone in the streak table is grounded, and the page does not promise 66 days for everything. |
| One miss | The researchers reported that missing one opportunity did not materially affect habit formation, while a pattern of skipping did. | The same page and secondary summaries | Secondary | Supports the forgiven isolated miss and the two in a row reset. |
| Intact streaks | A seven study paper found that highlighting an intact streak increased later engagement more than highlighting a broken one. | [INSEAD](https://www.insead.edu/faculty-research/publications/journal-articles/or-track-how-broken-streaks-affect-consumer) | Medium. Abstract only. | The page shows the intact streak and never a broken count. |
| Streak freeze | Duolingo reports that a freeze keeps learners engaged. Its numbers are its own and not independently verified. | [Duolingo blog](https://blog.duolingo.com/how-duolingo-streak-builds-habit/) | Low. Company evidence. | One forgiven miss is the design's version of a freeze. No purchasable or stackable freeze. |
| Vendor claims | A glossary claimed a 20 to 40 percent daily-active lift with no source. | | Not used | Ignored. |

## Time tracking, for reference only
| Topic | Finding | Source | Confidence | What it changes |
|---|---|---|---|---|
| Time entries list | The Toggl v9 list endpoint takes RFC3339 `start_date` and `end_date` and returns at most 1000 entries. | [Time entries](https://engineering.toggl.com/docs/track/api/time_entries/) | Medium | Jarvis does not call it. The Plan decides how its notes get the data. |
| Detailed reports | The Reports API pages detailed entries at 50 per call, using response headers for the next page. | [Reports start](https://engineering.toggl.com/docs/track/reports_start/) | Medium | Same. |
| CSV export | Time entries can be exported as CSV from the Detailed Report page in the web app. | [Exporting data](https://support.toggl.com/en/articles/2564936-exporting-data) | Medium | One way The Plan could build its detailed time log notes. |
| Detailed CSV by API | No official endpoint path was found. | | Unverified | Not relied on. |

## What was not verified
- Whether the Homepage plugin has a view kind called "Nothing". The search did not confirm it. The Plan's earlier audit read its settings and saw that kind and a command, so the Jarvis route is the command.
- Playwright as the real-browser test tool, and the Chromium that Obsidian bundles.
- The names of Obsidian's theme colour variables. They are confirmed against the live theme in the build.
- The original Lally paper's exact wording.
- Whether a controlled study shows that streak freezes help long-term retention.

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Research - The Plan Parallel Builds.md`
```
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

```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Verification and Risks.md`
```
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

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Plugin Retirement List.md`
```diff
- ## What would make each removal safe
+ ## What the finished design says about each group
+ - Meta Bind and Multi-Column Markdown are the two plugins the dashboard no longer needs ([[Jarvis Spec - Carry Forward]]). Their other uses are the 87 and 14 notes above.
+ - Periodic Notes and Calendar are the question: the plugin creates today's note, but Periodic Notes also makes weekly and monthly notes.
+ - Templater stays while any template carries `<% %>`.
+ - Local REST API stays. The `jarvis` MCP tools depend on it.
+ 
+ ## What would make each removal safe
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Log.md`
```diff
- - The next prompt must know: the day model replaces the frontmatter toggles built on 2026-10-26 morning ([[Jarvis Decisions Log]], Correction 3).
+ - The next prompt must know: the day model replaces the frontmatter toggles built on 2026-10-26 morning ([[Jarvis Decisions Log]], Correction 3).
+ 
+ ### 2026-10-26, design finalized
+ - Every open question was answered or defaulted. [[Jarvis Decisions Log]] now holds D1 to D45 and nine corrections. Defaults taken by the assistant are D32 to D45.
+ - Two research notes were added: [[Jarvis Research - Outside Sources]] and [[Jarvis Research - The Plan Parallel Builds]]. [[Jarvis Build Hub]] is now the source of truth and maps every feature to its owning note.
+ - Checked: The Plan's changes of 2026-10-26 (its restore commit, Decision 51 and its daily template), the Obsidian API documentation through search and the typed docs index, `jarvis-cli` contents, git ignore behaviour for the plugin folder.
+ - Settled by check: the CLI is `dashboard-cli` because `jarvis-cli` is taken; the week is ISO; the plugin folder is tracked by git.
+ - Still unverified: rows 1 to 7, 9, 10 and 13 to 17 of [[Jarvis Verification and Risks]].
+ - Waiting on The Plan: the time overview heading, the time log folder and entry format, and the structure of its daily template.
+ - Prompts are not written. They are written in a separate session from these notes.
+ - The next prompt must know: the page cannot be proven no-scroll in jsdom. It needs the real-browser and live checks in [[Jarvis Spec - Dashboard Page]].
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Log.md`
```diff
- | Code location | `D:\_Anant\20_Progress\Projects\jarvis-dashboard`, proposed, not confirmed |
- | Hosting | Private GitHub repository, created only after Anant says yes in the session |
- | Devices | The Dell and the Acer. No phone. |
+ | Code location | On the Acer. The path is chosen when the build starts. The Dell receives built files through git. |
+ | Hosting | A private GitHub repository for the source is recommended, created only after Anant says yes in the session |
+ | Stack | TypeScript, React 19, `isDesktopOnly: true`, no Node API in version 1 |
+ | CLI | `dashboard-cli` in `30_Order/System/dashboard-cli/` |
+ | Devices | The Dell and the Acer, Obsidian full screen. No phone. |
+ | Week | ISO, Monday to Sunday |
+ | Open Loses cap | 7 |
```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Hub.md`
```
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

## Build stages
These are stages, not prompts. A separate session turns each into a prompt under the Agent Prompt Standard, using the notes above.
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

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Hub.md`
```diff
- ## Build stages
- These are stages, not prompts.
+ ## Sequence
+ These are build stages, not prompts.
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards/Jarvis Build" && echo "files: $(ls *.md | wc -l)"; echo "--- em/en dashes:"; grep -c "[—–]" *.md | grep -v ":0" || echo none; echo "--- '---' lines per file (expect 2):"; for f in *.md; do echo "$(grep -c '^---$' "$f") $f"; done | sort | uniq -c -w2; echo "--- frontmatter required keys (type,status,created,updated,tags):"; for f in *.md; do for k in type status created updated tags; do head -30 "$f" | grep -q "^$k:" || echo "MISSING $k in $f"; done; done; echo "--- in-folder links unresolved:"; grep -oh "\[\[Jarvis [^]|]*" *.md | sed 's/\[\[//' | sort -u | while read n; do [ -f "$n.md" ] || echo "unresolved: $n"; done; echo "--- required headings:"; for f in Jarvis\ Spec*.md Jarvis\ Architecture.md; do for h in "What This Is" "Current State" "Non-Goals"; do grep -q "^## $h" "$f" || echo "$f lacks $h"; done; done; for h in Goal Sequence "Open Questions"; do grep -q "^## $h" "Jarvis Build Hub.md" || echo "Hub lacks $h"; done; echo "--- stale phrases:"; grep -n "Decide\b\|iPhone 15\|\[>\] carried\|Prompts.md is not written\|jarvis-cli\`" *.md | cut -c1-140 | head -20; echo "--- decision refs D1-D45 used vs defined:"; grep -oh "D[0-9][0-9]*" *.md | grep -v "^D1$" | sort -u | tr '\n' ' '
```
```
files: 13
--- em/en dashes:
none
--- '---' lines per file (expect 2):
     13 2 Jarvis Architecture.md
--- frontmatter required keys (type,status,created,updated,tags):
--- in-folder links unresolved:
unresolved: Jarvis Build Overview
unresolved: Jarvis Dashboard Build Record
--- required headings:
--- stale phrases:
Jarvis Architecture.md:30:- `30_Order/System/` holds `claude-workflow`, `cursor-workflow`, `excalidraw-mcp`, `jarvis-cli`, `jarvis-memory`, 
Jarvis Build Log.md:51:- Checked: The Plan's changes of 2026-10-26 (its restore commit, Decision 51 and its daily template), the Obsidian AP
Jarvis Build Log.md:52:- Settled by check: the CLI is `dashboard-cli` because `jarvis-cli` is taken; the week is ISO; the plugin folder is t
Jarvis Decisions Log.md:74:| D43 | Name of the CLI | `dashboard-cli`, in `30_Order/System/dashboard-cli/` | `30_Order/System/jarvis-cli` is 
Jarvis Decisions Log.md:85:7. **Phone and window.** An earlier answer said the page should render responsively for an iPhone 15. D2 and D28 
Jarvis Decisions Log.md:87:9. **CLI folder.** An earlier note said `30_Order/System/jarvis-cli` might be taken. It holds `jarvis.ps1`, `jarv
Jarvis Verification and Risks.md:36:| 11 | The folder for the CLI is free | List `30_Order/System/dashboard-cli` | Name it differently | Set
--- decision refs D1-D45 used vs defined:
D10 D11 D12 D13 D14 D15 D16 D17 D18 D19 D2 D20 D21 D22 D23 D24 D25 D26 D27 D28 D29 D3 D30 D31 D32 D33 D34 D35 D36 D37 D38 D39 D4 D40 D41 D42 D43 D44 D45 D5 D6 D7 D8 D9
```

## You

This session is being continued from a previous conversation that ran out of context. The summary below covers the earlier portion of the conversation.

<tools-used-before-summary>AskUserQuestion, Bash, Edit, Read, ToolSearch, WebSearch, Write, [REDACTED], [REDACTED]</tools-used-before-summary>
Summary:
## 1. Primary Request and Intent

The conversation had three phases.

**Phase A (The Plan dashboard review).** The user asked for a detailed review of The Plan's Obsidian dashboard plugin and its tooling:
- the notes in `40_Resources/Obsidian/Dashboards`, `.../Dashboards/Dashboard Build` and `00_Live/Tracking/Plans`;
- the builds already done and the future builds;
- where things stand;
- exactly what to do next to reach a frictionless, always-working state (skills, agents, hooks, plugin, UI, Claude assistance, Jarvis daily-plan integration).

I produced a report with no writes. The report's main findings:
- The dashboard had never shown a real number. The engine returned `first_day: null`.
- Periodic Notes was creating `DD-MM-YYYY` daily notes that the engine cannot read.
- On Oct 16 a stale tree from the second laptop (`gupt0479@umn.edu`) overwrote `.claude` skills, agents, hooks, `.gitignore` and `.codex`.
- The plugin repo has 3 uncommitted changes, no git remote, and a deployed build from Oct 13.

**Phase B (Jarvis dashboard design, chat in the Jarvis context).** The user wants a Jarvis dashboard plugin, same idea as The Plan's.
- It is built by Sonnet 5.5 prompts and designed through many questions.
- It is a one-page, no-vertical-scroll UI. Only written text may scroll horizontally.
- It is "addicting" and astonishing daily, with identity, habit and streak mechanics.
- It has an automation layer for Google Calendar, reminders and future platforms.
- Toggl is NOT built in Jarvis. Time tracking lives in The Plan, and Jarvis reads it.
- The Plan pulls professional information from Jarvis.
- Planned folders in Jarvis:
  - `40_Resources/Obsidian/Dashboard/Prompts` (one main note, rewritten for each session);
  - `.../Jarvis Builds` (design information);
  - `.../Jarvis Builds/Ran` (finished prompts).

**Phase C (current, most recent explicit instruction).** The user said:
- Write the notes inside The Plan at `40_Resources/Obsidian/Dashboards/Jarvis Build`, as if written inside Jarvis, to be cut and pasted into Jarvis later.
- Answer the open questions. Finalize ALL the design notes.
- Make ONE note the source of truth that maps all the content.
- Do NOT lay out the prompts yet; a different session writes them from these notes.
- Keep it minimalistic: add only required notes and extend existing ones.
- Add resource/research notes with web research and The Plan's parallel builds.
- Ask more questions if anything is left to design, so the design process finishes completely.

## 2. Key Technical Concepts

- Obsidian plugin API: `ItemView`, `registerView`, `workspace.onLayoutReady`, `getLeavesOfType`, `Vault.process` (atomic read-modify-write), `FileManager.processFrontMatter`, `metadataCache` (`changed` event is not called on rename), `cachedRead` vs `read`, `normalizePath`, `isDesktopOnly`.
- The Plan's architecture, copied in structure but NOT in code:
  - pure TypeScript engine (`plan-cli`) shared by plugin, CLI, hooks and skills;
  - React 19 view with a scaled grid and inline SVG;
  - esbuild;
  - 87 tests with Python parity;
  - streak rule: MET at 3 of 5 categories, one forgiven miss, two in a row reset, best counts closed days only;
  - milestones 3/7/21/66/100.
- Jarvis vault conventions:
  - `AGENTS.md` golden rule 6: no personal-life content in Jarvis; personal content lives in The Plan.
  - `30_Order` standards and templates; Note Type Registry; Frontmatter Standard (types and statuses, `---` only twice per file).
  - Spec and Plan Standard: spec = What This Is / Current State / Non-Goals; plan = Goal / Sequence / Open Questions.
  - Agent Prompt Standard: Why This Exists / Hard Rules / Implementation Order / Report Back; `prompt_shape: queue`.
  - Prompt Cycle workflow.
- Jarvis daily note (reshaped on 2026-10-26 by another session):
  - frontmatter booleans `win_*` and `floor_*` shown by Meta Bind toggles;
  - Daily Loses format `[why:: ][fix:: ][from:: ][since:: ]` with marks `[ ]`, `[x]`, `[>]`, `[-]`;
  - `### Blocks`, 80/20 plan, `wins_done`/`floors_done` written by `/closeday`.
- Google Calendar connector rules (`How to Use Google Calendar.md`):
  - account `gupt0479@umn.edu`; working calendar id starts `c_2195`, misleadingly named "Todoist";
  - write only to the working calendar; `notificationLevel: NONE`; five-line event format; propose then write; re-list and count.
- Jarvis syncs between the Dell and Acer via git auto-sync to `https://github.com/gupta-builds/Jarvis.git`. The plugin folder `.obsidian/plugins/jarvis-dashboard/` would be tracked, verified with `git check-ignore`. This is the same mechanism that caused The Plan's Oct 16 overwrite.
- Tracker notes in `10_Areas/Career/Internships/Tracker/Each One/Current/` have a `date_applied` field. 29 notes exist, 0 applied, and there is no `Applied/` folder.
- jsdom has no layout engine, so a no-vertical-scroll claim needs a real-browser test (Playwright candidate, unverified) plus a live debug command.
- CSS container query units (cqw/cqh) are an alternative to measured scaling.
- Research sources used: Obsidian docs and API repo via Context7, forum threads, Lally 2010 (66-day median, one miss is OK), INSEAD intact-streak paper, Duolingo blog, Toggl API docs, Can I Use.

## 3. Files and Code Sections

### Read-only context (not modified)
- **The Plan vault.** Read:
  - `CLAUDE.md` and `AGENTS.md`;
  - the Dashboards notes (Hub, Decisions Log rows 1–51, Build Plan, Prompts, Specs, Audit);
  - the Dashboard Build notes (Build Log, Plugin Build Prompts, Verification and Risks, Review, etc.);
  - `00_Live/Tracking/Plans/Summer Grind.md` and `Winter Break.md`;
  - `.claude/settings.json`, agents and skills;
  - `30_Order` standards, workflows, templates and references;
  - the git history.
- **Plugin repo** `D:\_Anant\20_Progress\Projects\the-plan-dashboard`: `src/**`, `package.json`, `manifest.json`, git log.
- **Jarvis vault** `D:\_Anant\20_Progress\Documents\Jarvis`: `00_Dashboard.md`, `AGENTS.md`, `.obsidian` plugin list, `Jarvis OS Dashboard.canvas`, the Fall 2026 Plan folder, `2026-W44.md`, `Daily Note Standard`, `Daily Close Loop`, `Better Today`, `How to Use Google Calendar`, `Jarvis Dashboard Build Record`, `Jarvis Build Overview`, `The Plan Overview` and its five notes, the standards/templates for spec/plan/prompt, the Note Type Registry, and `30_Order/System/jarvis-cli` (Python ops tool: `jarvis.ps1`, `jarvis_ops.py`, README).
- Existing in Jarvis but empty: `Dashboard/Prompts.md` (0 bytes) and `Dashboard/Jarvis Builds/Ran/`.

### Files created/edited this session
All are in `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\`. This is a new folder, and the user asked explicitly for these writes. There are 13 notes. They all use `type: project` (spec/plan), `system` (log) or `reference` (research/resource).

1. **Jarvis Build Hub.md** (project_kind: plan). Rewritten as the SOURCE OF TRUTH. It contains:
   - Goal; a Status table; "Where to put this folder"; a Map of the notes;
   - a **Feature inventory F1–F37** (feature → defining note → data source → test);
   - `## Sequence` of 6 build stages (not prompts);
   - Dependencies on The Plan (time overview heading, time-log folder and naming, entry format `- HH:MM-HH:MM task label [proj:: name]`, write timing, Plan daily-template structure);
   - a "Design is complete when" checklist.
   - Two boxes stay unchecked: "Anant has read the defaults D32 to D45 and kept or changed each" and "The notes are pasted into Jarvis and pass Vault Lint".
2. **Jarvis Decisions Log.md** (system/log). Final: D1–D31 decided by Anant, D32–D45 assistant defaults, and 9 Corrections. Key decisions:
   - D1 separate plugin `jarvis-dashboard`, own engine.
   - D2 Dell and Acer only, no phone.
   - D3 checkbox lines with fields, replacing frontmatter toggles.
   - D4 streak = the floor, one forgiven miss, two in a row reset; floor rows set per term in config.
   - D5 wins are a separate 0–4 score.
   - D6/D24 Loses are kept and tickable. A Lose stays open until made up or dropped, is never copied forward, and is capped at 7 open. The eighth must be resolved at close. The next day is recalculated from the day's Loses. `[>]` is retired.
   - D7 builder identity only.
   - D8 no vertical scroll; text rows scroll horizontally only; page scales to fit; "Window too small" banner.
   - D9 four always-visible groups.
   - D10 delight: builder levels, proof of the day, heatmap, pipeline momentum.
   - D11 the plugin creates today's note, ISO names only.
   - D12 the 80 comes from the plans; Anant approves.
   - D13 the 20 supports the 80 daily, with `[for:: 80]`.
   - D14 term ends 2026-12-24.
   - D15 10 applications per week.
   - D16 The Plan's level titles: The beginning (3), Toward 21 (7), Now it gets hard (21), Work pays off (66), Consistency, discipline, mindset (100).
   - D17 calendar account `gupt0479@umn.edu`.
   - D18 Todoist dropped from Jarvis.
   - D19 Toggl lives in The Plan; time is calculated in two places there (a daily-note overview plus a time-log folder of notes); neither is designed yet.
   - D20 Jarvis reads The Plan's daily note and time logs read-only through an allowlist, with no personal content.
   - D21 automation is design only.
   - D22 nothing is removed; Anant decides from the plugin list.
   - D23 canvas and `00_Dashboard.md` are replaced by the plugin, retiring after a clean fortnight and only on Anant's word; no exploration canvas is kept.
   - D25 React.
   - D26 `isDesktopOnly: true`.
   - D27 the repo lives on the Acer; the Dell receives built files via git.
   - D28 Obsidian full screen on both laptops.
   - D29 one health chip, folding in the sync banner and vault health.
   - D30 seven-day Monday–Sunday row plus a totals line.
   - D31 three project chips showing `next:`; the clippings count moves to the weekly review.
   - Assistant defaults D32–D45:
     - D32 areas table stays in `00_Dashboard.md` until it retires, then moves into Jarvis Vault Architecture.
     - D33 ISO week.
     - D34 heatmap 30 days.
     - D35 application floor row is one a day.
     - D36 `date_applied` only for finished applications.
     - D37 deadlines as `[due::]` on weekly Goals.
     - D38 `lc_count`/`study_today` stay in frontmatter with +/-.
     - D39 optional `## Proof of the day` heading.
     - D40 87 old Meta Bind notes stay as history.
     - D41 `.claude` skills are canonical.
     - D42 term review on 2026-12-24.
     - D43 CLI named `dashboard-cli` in `30_Order/System/dashboard-cli/`.
     - D44 no validator hook in v1.
     - D45 double-click edit-in-place.
   - Corrections:
     - 1 Toggl search matched "toggle", not Toggl.
     - 2 the Plans Board says the Fall plan ends 12-14, but D14 says 12-24 and wins.
     - 3 day model replaces the toggles.
     - 4 the cross-vault-read non-goal is superseded.
     - 5 Todoist.
     - 6 `[>]` carried mark retired.
     - 7 phone/iPhone 15 superseded by full-screen laptop.
     - 8 ISO week.
     - 9 `jarvis-cli` is taken.
3. **Jarvis Spec - Day Model and Streak.md**. Contains:
   - the example daily note shape (the example uses "(frontmatter starts)/(frontmatter ends)" markers so the file has only two `---` lines);
   - the fields table: `[plan::]`, `[for:: 80]`, `[cal:: id]`, `[spent:: minutes]`, `[win::]`, `[track::]`, Lose fields, `[due::]`, `[proof::]`;
   - floor rows for Fall 2026: `application` (a tracker note with `date_applied` = today), `practice` (≥5 LeetCode/CodePath), `class`;
   - the Loses lifecycle, the streak rule (11 points), 3 write primitives (replace one line with the stale-line check; change a frontmatter number; create today's note) and 11 validator rules.
4. **Jarvis Spec - Dashboard Page.md**. Contains:
   - the 7 page rules;
   - the blocks table: Hero, Today, Blocks, Loses, Pipeline, Projects, Heatmap, Proof, Health chip, Links;
   - the wide-layout ASCII diagram, with a compact layout below ~720 px only;
   - scaling (ResizeObserver, 11–22 px, fixtures 1920×1080 / 1536×864 / 1366×768 minus ~40 px chrome, an assumption to be measured on each laptop);
   - the visual system (`jd-` CSS tokens mapped to Obsidian variables, no hard-coded colours, 4.5:1 contrast, reduced motion);
   - states/errors, a performance budget (<2 s launch) and three page tests (style, real browser, live debug command).
5. **Jarvis Spec - Plans Feed.md**. Contains:
   - the single-ownership table for 9 plan families;
   - how the 80 is chosen and how the 20 is derived;
   - recalculation from the day's Loses (`/closeday` writes a Preview Tomorrow; `/startday` builds the day from it);
   - pipeline momentum (ISO week, n of 10), the term-end review and failure modes.
6. **Jarvis Spec - Automation Layer.md**. Contains:
   - the day-step-by-step table and Layers 1–4 (blocks onto page, planned blocks onto calendar, time read from The Plan, later transports);
   - the allowlisted reader `dashboard-cli plan-time <date>` (skills never open The Plan's notes; non-allowlisted headings are dropped before reaching Claude; returns `{"status":"not_defined"}` until The Plan defines the headings);
   - Toggl API facts for reference only, a failure register and non-goals.
7. **Jarvis Spec - Carry Forward.md**. Contains:
   - a fate for every old dashboard block;
   - the template/Standard/Close Loop/skills patch list (each needs Anant's approval);
   - the retirement order.
8. **Jarvis Architecture.md**. Contains:
   - the layers and engine modules (`parse, streak, edit, config, periods, validate, loses, blocks, pipeline, planTime, model`);
   - the plugin rules (register vault events in `onLayoutReady`, etc.);
   - CLI commands `streak, day, week, validate, loses, plan-time, doctor`;
   - the config keys, the build/deploy plan, the tests and the two-laptop guards (`doctor`, health chip, version stamp).
9. **Jarvis Plugin Retirement List.md** (evidence only, no removals). Edited to add a "What the finished design says about each group" section. It contains the counts:
   - 26 plugins installed, 11 in `community-plugins.json`;
   - Meta Bind: 87 notes;
   - Multi-Column Markdown: 14 notes;
   - Dataview: 440 query blocks and 80 DataviewJS blocks;
   - Kanban: 17 notes;
   - Latex Suite: 157 notes;
   - Spaced Repetition: 16 notes;
   - Templater: 74 template files;
   - Local REST API: required by the `jarvis` MCP.
10. **Jarvis Verification and Risks.md**. 17 unverified-claim rows, with a State column; a failure register; a 10-item acceptance list; a risks table.
11. **Jarvis Build Log.md**. The fixed-answers table was updated (location on the Acer, stack, `dashboard-cli`, ISO week, cap 7). Two entries exist: "design notes written" and "design finalized".
12. **Jarvis Research - Outside Sources.md** (NEW, reference/research). Findings with source URLs, confidence and design effect: `Vault.process`, `processFrontMatter`, vault `create` firing at load, `isDesktopOnly`, container queries, Lally and streak research, Toggl API. It lists what was not verified (Homepage "Nothing" kind, Playwright, Obsidian's Chromium version, theme variable names, the original Lally paper).
13. **Jarvis Research - The Plan Parallel Builds.md** (NEW). Contents:
    - The Plan's state on 2026-10-26: tooling restored in commit `1e85ccd`; plugin repo unchanged since Oct 13; Decision 51 switched its daily template to Jarvis-style `Better Today` with no `[cat::]` lines, so its streak reads 0; no Toggl design yet.
    - Lessons applied to Jarvis.
    - A "re-read before build" list.
    - A note that The Plan's git auto-sync committed these drafts in commit `fb8f157`.

## 4. Errors and fixes

- **Hook blocked a command.** A Bash command containing the archive-folder path was blocked ("50_Archive is never read or written"). I re-ran the commands without that string and avoided naming it in commands.
- **Wrong Toggl claim.** I wrongly said Jarvis's July/August daily notes mention Toggl. My grep for "toggl" matched "toggle" (Meta Bind). I discovered this, told the user, and recorded it as Correction 1; nothing in either vault mentions Toggl.
- **Unverified rule asserted.** I had asserted that `date_applied` is set only on a finished application "as a rule in the tracker standard". I corrected it to say the rule is unconfirmed, later making it a default (D36).
- **Frontmatter delimiter rule.** The Day Model note's example block contained two extra `---` lines, violating the Frontmatter Standard ("`---` appears only twice"). I replaced them with "(frontmatter starts)" and "(frontmatter ends)".
- **Wrong heading.** The Hub plan note used "Build stages" instead of the Spec and Plan Standard's required "Sequence". I renamed it to `## Sequence`.
- **Final check output.** All 13 files have exactly 2 `---` lines, all required frontmatter keys, no em/en dashes, and the required headings. The only "unresolved" in-folder links are `Jarvis Build Overview` and `Jarvis Dashboard Build Record`, which are existing Jarvis notes that resolve after pasting into Jarvis (expected). The remaining "stale phrase" hits are intentional historical mentions in Corrections/Verification text.
- **Earlier user feedback.**
  - The user said the phone is out of scope (Jarvis is not on the phone).
  - The user said not to remove any plugins, only to give a list.
  - The dictation had errors (e.g. "Doge", "20 each 10", "ET"), which I interpreted and the user later clarified.

## 5. Problem Solving

- Found that The Plan's tooling was lost and later restored, and that its template changed in parallel (Decision 51). I designed the Jarvis reader as allowlist-based and tolerant of heading changes.
- Resolved the CLI-name conflict (`jarvis-cli` taken, so `dashboard-cli`) and resolved ISO vs Sunday week by evidence (`2026-W44` starts Monday 2026-10-26).
- Resolved the contradiction between "no content removed" and "no vertical scroll" with the 7-Loses cap, a "+N more" chip for legacy overflow, and a "Window too small" banner.
- Designed the cross-vault personal-content filter so that skills call the CLI reader and never open The Plan's notes.
- Open verification items remain (17 rows in `Jarvis Verification and Risks`).

## 6. All user messages (non-tool-result)

1. A pasted block (the context-review request): focus on the dashboard plugin, its builds and configurations, so it uses the Claude workflows and prompts. Review everything in detail. Determine what to do to implement plans from another session: improve the UI, add Claude assistance, and integrate the Jarvis daily-plan workflow (which references Jarvis's daily note). Establish a friction-less workflow for skills, agents, commands, hooks, the dashboard framework and the plugin. Charters are set; make sure each component is implemented correctly, nodes are set up with content, and everything is installed and working. Then the user's own text: "Go through these notes: `40_Resources/Obsidian/Dashboards`, `40_Resources/Obsidian/Dashboards/Dashboard Build`, `00_Live/Tracking/Plans`, etc. Dig through information inside the plan in detail on the builds that were taken place already and the future builds that were to be done. Come back with solid information and where we currently stand. What to exactly do from here on to make sure that the plugin is at the desired state just explained."
2. A `/model` local command output: model set to Sonnet 5.5, saved as the default.
3. The Jarvis-design request: the previous research was given to The Plan on the laptop; this directory (Jarvis) works on Jarvis's own dashboard, plans and daily recording. The automation layer discussed with Toggl will be built in The Plan, not Jarvis, but Jarvis will have an automation layer for Google Calendar, reminders and future platforms (Zapier, etc.). Rethink the automation layer and the dashboard layout; design the Jarvis dashboard plugin like The Plan's; the canvas and markdown note exist, but plugins will be removed once the plugin ships. Notes: `40_Resources/Obsidian/Dashboard/Prompts` (one main note, rewritten), `.../Jarvis Builds`, `.../Jarvis Builds/Ran`. All prompts run on Sonnet 5.5. Write the build design notes first, then think about prompts. Design in detail what is on the Jarvis dashboard, what carries forward, how plans are used across the vault (mentorship, project-based, UMN), make it addicting and astonishing daily, help form identities and habits. "Make no mistakes laying out these notes. Ask me a lot of questions." The dashboard must be one page with no vertical scroll; things to tick are "write" [dictated; read as writable]; the only scroll is horizontal for daily written text; nothing in the design has a horizontal scroll.
4. AskUserQuestion answers (batch 1): separate plugin, own engine; checkbox lines with a field; streak counts the floor; builder identity only in Jarvis.
5. AskUserQuestion answers (batch 2): all four groups always visible, plus a free-text correction that the dashboard is the same thing rendered phone-responsive for iPhone 15 and nothing is removed, but then "Wait, jarvis is not synced to the phone at all... it's only the dell and acer laptop"; time layer = read calendar and plan blocks (future MCPs and other platforms decided later); first transport = design only, make it simple and frictionless; plugin removal = "You will not remvoe anything, provide me with a list and i will decide on what plugins to remvoe."
6. AskUserQuestion answers (batch 3): the plugin creates today's note; the 80 comes "from the fall plan, project plans, etc. the one thing daily is decided but the main agenda is from the solid plans"; delight = builder levels, proof of the day, floor heatmap, pipeline momentum; canvas fate = "Replace both with the plugin".
7. AskUserQuestion answers (batch 4): floor rows set per term in config; wins are a separate score, not in the streak; scale the whole page to fit; keep Loses, tickable on the page.
8. Message: "`40_Resources/Obsidian/Dashboards/Jarvis Build` - write the notes over here since you cannot write into jarvis. it's alright but write the notes mentioned in context to jarvis and the notes inside jarvis. This folder will simply be cut and pasted inside the correct directory (jarvis). So, these notes should be written inside the plan as if they were written inside jarvis." Followed by a pasted (dictated) answer block: term ends 24 December; the 20 supports the 80 (garbled); Google account gupt0479@umn.edu; builder levels the same as The Plan; weekly target of ten applications; "Doge"/"the store" (read as Toggl) not used in July/August; no Todoist in Jarvis; time managed by referencing The Plan's daily notes with timestamps; "The toggle has been added to The Plan. Jarvis reads The Plan on /start day and /close day, and the agents monitor the Plan notes so that both daily notes remain consistent. Complete part 1 personally and the portion related to work. Adjourn. Answer all your questions."
9. Mid-turn message: the main Jarvis notes for the daily workflow are `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\How to Use Claude\How to Use Google Calendar.md` and `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Life\Enumerate\Weekly\2026-W44.md`; "Go through plans also if necessary."
10. Reply to my questions: "Yes the dictation got a few things wrong, to reanswer your 20 question: 20 supports 80 on a daily bassis. The 20 is created specifically to support 80 actions by making sure that these additional tasks are done with respect to it." "The last sentence meant to say, complete the documentation process. Finish the notes written." Toggl timestamps: "has not been designed yet, but will be noted in the daily note mainly. In detail will have an overview of everything that was taken place daily. Other than that, there are going to be notes written for further detailed time logging... two places that time is calculated - daily note and a folder that calculates time on a daily basis almost as detailed logs." Loses: "Yes, there should be a cap to losses. 7 sound like a good number, but these loses are just noted down. The actions that are required for the next day are considered and recalulated based on the loses of the day. We do not simply push the loss to the next day." Asked what exactly the six Decide decisions are (projects, clippings queue, vault health, week strip, sync banner, areas table). "Build: React. the plugin be desktop-only. the repo lives on the Acer." Jarvis may read the daily note for timestamps and the overview but "does not focus on personal information at all. It specifically looks at the specific headers it's looking for disregarding the personal related work"; The Plan already goes through Jarvis's dashboard, weekly, monthly, plans. "window size should be for obsidian rendering, full screen on obsidian. The dashboard will open in obsidian and only on the laptop across both laptops."
11. The final instruction (full): "Now that all the questions are answered. Go ahead and finalize all the design based notes that are listed out. Making one note the source of truth which maps out all the content that was drafted out. Do not lay out the prompts for this build yet. Finalize the design and make sure that everything is listed out for perfection and perfectly laid out. Let's make sure that each and every single design feature is noted and taken care of in these notes that are listed out. Finalize the notes, if there is literally anything still left to be designed. Ask me more questions, let's finish the design process completely. The prompts, will be laid out in a different session based of these design notes that are created. These notes clearly define each and every single thing that is required to be built for the dashboard. Let's make sure that all the notes listed out are perfect, if there is anything more required. Add them, but keep this minimalistic, adding only notes that are required, extending the notes that exist. Add more resources here so that some researched information lands here for more outside knowledge. to make sure that we are on track and we do this correctly, we research through the web and the plan's builds that are taking place parallely. Let's go ahead and finish the design process."
12. AskUserQuestion answers (batch 5): health = one health chip; week = seven-day row; projects = chips (clippings to review); Loses = open until made up or dropped.

**User/global instructions that must persist** (from `~/.claude/CLAUDE.md` and project `CLAUDE.md`/`AGENTS.md`):
- "Never write files, notes, scratch output, or artifacts anywhere on disk ... unless the user explicitly asked for that file to be created in that session." Do not write session logs or summaries unless asked.
- "Never read, cat, print, log, quote, or otherwise surface the contents of any secret-bearing file" (`.env*`, `.credentials.json`, `.mcp.json` secret values, SSH private keys, anything named credential/secret/token holding real values). Use values indirectly. Also never open `data.json` of copilot, quickadd, readwise and local-rest-api.
- Writing style: never use em dashes; prefer full sentences; use dashes only for hyphenated compounds and numeric ranges.
- Project rules: "Write only what was asked"; ask before renaming, moving or deleting a note, editing AGENTS.md or CLAUDE.md, touching `.obsidian`, or using an outside service; patch by heading; keep frontmatter and wikilinks; check that wikilink targets exist; propose changes to `status: tree` notes first. Never use an em dash; no praise, no guilt. Never create a directory named `.agents`. Numbers (streaks, grades, cause counts) come only from `plan-cli`, never hand-computed. The Plan's hooks block new files at the vault root, writes to the archive folder, `.obsidian` (except the dashboard plugin folder), and the Jarvis vault; "If a hook blocks you, read the reason and stop. Do not route around it with another tool." Do not claim a planned capability is operational.
- Pronoun rule: use they/them for anyone whose pronouns are not stated.
- Attribution: git commits end with the Co-Authored-By line given in the latest system reminder (Claude Sonnet 5.5). No commits were made.

## 7. Pending Tasks

- Report the finalization to the user. In that report:
  - state that all 13 notes are written and checked in `Dashboards/Jarvis Build/`;
  - list the new/changed notes;
  - state the defaults D32–D45 awaiting Anant's confirmation;
  - state the remaining unverified items and the dependencies on The Plan;
  - note that the prompts are intentionally NOT written;
  - note that the instruction "Ask me more questions" was satisfied by the last AskUserQuestion batch, and that no further design gaps are known beyond the defaults.
- Possible remaining items, only if the user asks: write the `Prompts.md` queue (explicitly deferred to a separate session); patch Jarvis standards/templates/skills (needs approval); create the repo on the Acer (needs approval).

## 8. Current Work

Immediately before the summary request, I had just finished finalizing the design notes and ran a verification pass (Bash) on all 13 files in `Jarvis Build/`. That pass confirmed:
- 13 files;
- no em or en dashes;
- exactly 2 `---` lines in every file;
- all required frontmatter keys present;
- the required headings present (specs have What This Is / Current State / Non-Goals; the Hub has Goal / Sequence / Open Questions);
- in-folder links resolve, except the two expected links to existing Jarvis notes (`Jarvis Build Overview`, `Jarvis Dashboard Build Record`);
- Decision references D2–D45 are all defined.

The last edits were:
- renaming `## Build stages` to `## Sequence` in `Jarvis Build Hub.md`;
- updating the fixed-answers table in `Jarvis Build Log.md`.

The final report to the user had not yet been written.

## 9. Optional Next Step

Write the final plain-text report to the user. It should say that the design is finalized and summarize the 13 notes, with `Jarvis Build Hub` as the source-of-truth with its F1–F37 feature inventory and 6 build stages. It should also cover the defaults D32–D45 for Anant to keep or change, the dependencies waiting on The Plan (time overview heading, time-log folder, entry format, daily-template structure), and the corrections (Toggl search error, Plans Board date, Decision 51 finding). It should note that the prompts are intentionally not written, per the user's instruction "Do not lay out the prompts for this build yet", and that the folder is ready to cut and paste into `40_Resources/Obsidian/Dashboard/Jarvis Builds/` in Jarvis and then be linted with Vault Lint. No other action should be taken without the user's confirmation.

If you need specific details from before compaction (like exact code snippets, error messages, or content you generated), read the full transcript at: C:\Users\anant\.claude\projects\[REDACTED]\[REDACTED].jsonl
Continue the conversation from where it left off without asking the user any further questions. Resume directly — do not acknowledge the summary, do not recap what was happening, do not preface with "I'll continue" or similar. Pick up the last task as if the break never happened.

The messages after this summary are the most recent messages from before compaction, kept verbatim. The summary was written without seeing them, so something it says has not happened yet may already have happened in them.

## You

`40_Resources/Obsidian/Dashboards`, `40_Resources/Obsidian/Dashboards/Dashboard Build`, p`40_Resources/Obsidian/Dashboards/Prompts` - the plan notes (folders and files). `D:\_Anant\20_Progress\Projects\the-plan-dashboard` - plugin was created here. 



<pasted_content id="99d6">
Great work. The Jarvis build has been removed. It's been moved to Jarvis and we need to focus on the plan right now.  
  
The Jarvis build notes are taking place but the plan's dashboard is still extremely weak. There are a lot of things that still need to take place over here inside this world: to make the dashboard functional, to build the todo workflow, and to do a lot of things.  
  
Based on the agenda that took place in the session and similarities to the plan, things that the plan should implement based on Jarvis's dashboard design that we just made:

*   We need to upgrade the nodes that are currently listed inside the dashboards.
*   We need to archive the things that have already run.
*   We need to come up with a new build plan.
*   We need to come up with fixes and designs.
*   We need to go through all the notes and update all of them with the recent information and with the changes that need to take place.

The job is supposed to go through all the notes, understand in detail whatever needs to be changed, and then let's see how this goes and what the dashboard is going to do.
</pasted_content id="99d6">


Based on the notes written down, you are required to ask me a lot of questions on the build that needs to take place to upgrade the system currently established to be successful, frictionloess and everything. Firstly, the darshboard is not editable at all on the plan - needs to be changed. The design itself of the dashboard needs to be ugradeds with the content that appears on it by using today's daily note as an example. Let's do the task correctly to test and make sure that each and every single thing is done correctly for the plugin and our build. Make no mistakes with this task at all. Go through all the detailed builds that have already taken place inside the plan. Let's make sure to remodal and redesign the plan for perfection so that we can optimize all the future tools to be added here. Make no mistakes with this task, this is to lay out the finalized version of the plan's dashboard and will mostly be the same after today. So, let's perfect this now.

## Claude

I'll start by checking the current state of the Dashboards notes and today's daily note, then ask my questions.

Phone plus no vertical scroll conflicts on a 393 px wide screen, so that needs settling. These three questions also decide how the streak is counted and where to-dos come from.

No response requested.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la "40_Resources/Obsidian/Dashboards" "40_Resources/Obsidian/Dashboards/Dashboard Build" 2>&1 | head -80; echo ---; ls 00_Live/Enumerate/Daily | tail -8; echo ---; git status --short | head -20
```
```
40_Resources/Obsidian/Dashboards:
total 84
drwxr-xr-x 1 anant 197609     0 Oct 28 14:59 .
drwxr-xr-x 1 anant 197609     0 Oct 26 13:28 ..
-rw-r--r-- 1 anant 197609  9082 Oct 14 15:18 Audit - Dashboard Stack and Phone Checklist.md
-rw-r--r-- 1 anant 197609  3165 Oct 12 23:11 Build Plan.md
drwxr-xr-x 1 anant 197609     0 Oct 12 20:43 Daily
drwxr-xr-x 1 anant 197609     0 Oct 14 10:59 Dashboard Build
-rw-r--r-- 1 anant 197609  4524 Oct 14 15:16 Dashboards Hub.md
-rw-r--r-- 1 anant 197609 13447 Oct 26 14:59 Decisions Log.md
-rw-r--r-- 1 anant 197609 24640 Oct 14 15:47 Prompts.md
-rw-r--r-- 1 anant 197609  6779 Oct 12 20:50 Research - Jarvis Dashboard Findings.md
-rw-r--r-- 1 anant 197609  8495 Oct 14 14:38 Spec - AI Loop.md
-rw-r--r-- 1 anant 197609  4303 Oct 12 20:48 Spec - Automation Layers.md
-rw-r--r-- 1 anant 197609  4745 Oct 12 20:47 Spec - Home and Monthly Dashboards.md
-rw-r--r-- 1 anant 197609  5976 Oct 14 10:59 Spec - Streak and Daily Note.md

40_Resources/Obsidian/Dashboards/Dashboard Build:
total 104
drwxr-xr-x 1 anant 197609     0 Oct 14 10:59 .
drwxr-xr-x 1 anant 197609     0 Oct 28 14:59 ..
-rw-r--r-- 1 anant 197609  5583 Oct 13 00:13 Architecture.md
-rw-r--r-- 1 anant 197609  3014 Oct 13 16:16 Build Log.md
-rw-r--r-- 1 anant 197609  6923 Oct 12 23:11 Build Prompts.md
-rw-r--r-- 1 anant 197609  3407 Oct 12 23:11 Build Steps.md
-rw-r--r-- 1 anant 197609  3754 Oct 13 00:13 Dashboard Build Hub.md
-rw-r--r-- 1 anant 197609  5034 Oct 13 00:13 Front End and Visual System.md
-rw-r--r-- 1 anant 197609 33543 Oct 13 00:13 Plugin Build Prompts.md
-rw-r--r-- 1 anant 197609  3926 Oct 13 00:13 Private Use and Sharing.md
-rw-r--r-- 1 anant 197609  6774 Oct 13 00:07 Reference - Obsidian API for This Build.md
-rw-r--r-- 1 anant 197609  8389 Oct 12 23:10 Research - Obsidian Dashboard Methods.md
-rw-r--r-- 1 anant 197609 12246 Oct 13 00:13 Research - Plugin Creation Guide.md
-rw-r--r-- 1 anant 197609  4207 Oct 13 00:07 Review - Corrections to Earlier Notes.md
-rw-r--r-- 1 anant 197609  4564 Oct 13 00:07 Sonnet 5.5 Prompt Rules.md
-rw-r--r-- 1 anant 197609  4013 Oct 14 10:59 Verification and Risks.md
---
2026-07-08.md
2026-09-26.md
2026-10-05.md
2026-10-12.md
2026-10-19.md
2026-10-25.md
2026-10-26.md
2026-10-27.md
---
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Architecture.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Build Hub.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Build Log.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Decisions Log.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Plugin Retirement List.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Research - Outside Sources.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Research - The Plan Parallel Builds.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Automation Layer.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Carry Forward.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Dashboard Page.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Day Model and Streak.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Spec - Plans Feed.md"
 D "40_Resources/Obsidian/Dashboards/Jarvis Build/Jarvis Verification and Risks.md"
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la "D:/_Anant/20_Progress/Projects/the-plan-dashboard" | head -30; git -C "D:/_Anant/20_Progress/Projects/the-plan-dashboard" status --short; git -C "D:/_Anant/20_Progress/Projects/the-plan-dashboard" log --oneline | head
```
```
total 212
drwxr-xr-x 1 anant 197609      0 Oct 14 14:42 .
drwxr-xr-x 1 anant 197609      0 Oct 13 14:54 ..
drwxr-xr-x 1 anant 197609      0 Oct 26 15:59 .git
-rw-r--r-- 1 anant 197609     69 Oct 13 14:54 .gitignore
drwxr-xr-x 1 anant 197609      0 Oct 13 15:03 .preview-out
drwxr-xr-x 1 anant 197609      0 Oct 14 14:42 .test-out
drwxr-xr-x 1 anant 197609      0 Oct 13 16:00 dist
-rw-r--r-- 1 anant 197609   1647 Oct 13 15:58 esbuild.config.mjs
-rw-r--r-- 1 anant 197609 247154 Oct 13 19:51 main.js
-rw-r--r-- 1 anant 197609    233 Oct 13 14:54 manifest.json
drwxr-xr-x 1 anant 197609      0 Oct 13 14:55 node_modules
-rw-r--r-- 1 anant 197609  46685 Oct 13 14:55 package-lock.json
-rw-r--r-- 1 anant 197609   1009 Oct 13 15:58 package.json
drwxr-xr-x 1 anant 197609      0 Oct 13 15:58 scripts
drwxr-xr-x 1 anant 197609      0 Oct 13 15:55 src
-rw-r--r-- 1 anant 197609   1836 Oct 13 15:04 styles.css
drwxr-xr-x 1 anant 197609      0 Oct 14 10:51 tests
-rw-r--r-- 1 anant 197609    580 Oct 13 14:54 tsconfig.json
-rw-r--r-- 1 anant 197609    758 Oct 13 14:54 version-bump.mjs
-rw-r--r-- 1 anant 197609     22 Oct 13 14:54 versions.json
 M src/core/config.ts
 M src/core/streak.ts
 M tests/engine.test.ts
a65a4ba Secrets guard: a bare word is not a file name
23e6452 Add engine review modules, plan-cli, hooks and tests
b744ba1 Dashboard plugin: engine, React view, tests
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && echo "== 2026-10-27 headings and line shapes (no prose) =="; grep -nE '^(#|---|- \[)|::' 00_Live/Enumerate/Daily/2026-10-27.md | sed -E 's/(\] ).{0,0}.*/\1/' | head -70; echo; wc -l 00_Live/Enumerate/Daily/2026-10-27.md; echo "== src tree =="; find "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" -type f | sed 's#.*/src/#src/#'; echo "== Dashboards Hub =="; sed -n 1,80p "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"
```
```
== 2026-10-27 headings and line shapes (no prose) ==
1:---
11:---
12:# Did you get better today?
14:## Morning Plan
23:### 80
32:### 20
48:## Daily Wins
56:## Daily Floor
63:## Productivity
68:## Just Write
79:### Good Habits 
80:- [ ] 
81:- [ ] 
82:- [ ] 
83:### Bad Habits 
86:## Tomorrow

88 00_Live/Enumerate/Daily/2026-10-27.md
== src tree ==
src/cli/common.ts
src/cli/plan-cli.ts
src/cli/streak-cli.ts
src/core/close.ts
src/core/config.ts
src/core/dates.ts
src/core/grade.ts
src/core/jarvis.ts
src/core/model.ts
src/core/parse.ts
src/core/periods.ts
src/core/review.ts
src/core/sections.ts
src/core/streak.ts
src/core/tables.ts
src/core/toggle.ts
src/core/validate.ts
src/data/repo.ts
src/data/write.ts
src/hooks/dailyValidator.ts
src/hooks/paths.ts
src/hooks/secretsGuard.ts
src/hooks/types.ts
src/hooks/writeGuard.ts
src/main.ts
src/settings.ts
src/ui/App.tsx
src/ui/charts.tsx
src/ui/hooks.ts
src/ui/sections.tsx
src/ui/styles.ts
src/view/DashboardView.tsx
== Dashboards Hub ==
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - hub
notes:
  - "[[Research - Jarvis Dashboard Findings]]"
  - "[[Decisions Log]]"
  - "[[Spec - Streak and Daily Note]]"
  - "[[Spec - Home and Monthly Dashboards]]"
  - "[[Spec - AI Loop]]"
  - "[[Spec - Automation Layers]]"
  - "[[Build Plan]]"
  - "[[Prompts]]"
  - "[[Life OS]]"
  - "[[Agentic OS Standard]]"
  - "[[Agentic OS]]"
next: "Run prompt R1, then B1 (see Build Plan)"
---
# Dashboards Hub

The design record for The Plan's daily dashboard, streak system and AI loop, from the 2026-10-12 brainstorm. Jarvis owns work. The Plan owns personal growth: habits, health, money, learning, and one career line a day.

## What is being built

- **Home dashboard.** Opens on startup on desktop and phone. First thing seen: streak number and today's score ring.
- **Monthly dashboard.** Month heatmap and grade, failure causes, plan, finance, health, and an overview of both vaults.
- **Map canvas.** Exploration only, with real edges.
- **Streak system.** Five categories (Morning, Study, Fitness, Mind, Career). A day counts at 3 of 5. One miss forgiven, two in a row break it.
- **Daily note.** Redesigned around those categories. The only source of truth.
- **AI loop.** Five skills, four agents, three hooks, one streak script, reference notes for every tool.
- **Automation.** Daily, weekly and monthly layers, laid out and built later.

## Notes in this folder

| Note | Holds |
|---|---|
| [[Research - Jarvis Dashboard Findings]] | What Jarvis contains, what was weak, The Plan's current state |
| [[Decisions Log]] | Every question and answer, plus items still to confirm |
| [[Spec - Streak and Daily Note]] | Categories, rules, algorithm, daily note schema |
| [[Spec - Home and Monthly Dashboards]] | Layouts, plugins, visual language, risks |
| [[Spec - AI Loop]] | Skills, agents, hooks, toolkit, logging, `60_Jarvis` zones |
| [[Spec - Automation Layers]] | Daily, weekly and monthly layers and their constraints |
| [[Build Plan]] | Order, dependencies, gates, risks |
| [[Dashboard Build Hub]] | How the Home dashboard is built: research, architecture, front end, stages, prompts (folder `Dashboard Build`) |
| [[Prompts]] | One prompt per session |

## Where the built system is documented (2026-10-13)

The design above is built in part. The rules and procedures now live in `30_Order`, and this folder keeps the design record.

| Question | Note |
|---|---|
| What are the rules of the daily note and the streak? | [[Daily Note Schema]], [[Streak Rule]] |
| What does a weekly or monthly review measure, grade and write? | [[30_Order/Standards/Dashboards/Weekly Review|Weekly Review]], [[30_Order/Standards/Dashboards/Monthly Review|Monthly Review]] |
| When is a review due and may it run alone? | [[Scheduled Review]] |
| How is the assistant tooling organised and what may each part write? | [[Agentic OS Standard]] |
| How are skills, agents and hooks built? | [[Skill Standard]], [[Agent Standard]], [[Hook Standard]] |
| How do I run the loop? | [[Agentic OS]], [[Daily Dashboard]], [[How to Use Skills]] |
| What does the engine do and how was it tested? | [[Reference - plan-cli]] |

## Navigation

The markdown page `00_Dashboard.md` was retired on 2026-10-14 (Decision 47). The active dashboard is the private plugin view `the-plan-dashboard`, opened with the command "Open dashboard" ([[Reference - the-plan-dashboard]]). The links that page held are kept here.

- **Entry points:** [[AI_CONTEXT]], [[AGENTS]], [[AI AGENT]], [[CLAUDE]], [[60_Jarvis/00_Control_Center/Jarvis Control Center|Jarvis Control Center]]
- **Boards:** [[20_Progress/Projects/Projects Board|Projects Board]], [[20_Progress/UROP/BOOM Board|BOOM Board]], [[60_Jarvis/60_Jarvis Board|Jarvis Board]]
- **Month:** the current Monthly note in `00_Live/Enumerate/Monthly/`, for example [[2026-10]], and the [[Monthly Dashboard]] that reads the daily notes
- **Map:** [[Map Canvas.canvas|Map canvas]] (domains, goals and the notes that own them). Not [[Map]], which is the `00_Live` index.

## Principles

1. Direct, factual language. No praise, no guilt.
2. One source of truth. The daily note holds the data. Dashboards read.
3. Computed, not typed. Every dashboard number comes from the daily notes.
4. Minimal frontmatter. Ticking lists, not tables.
5. Every tool has a reference note with its source.
6. No unrequested writes. Anything that touches outside systems waits for approval.
```
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\00_Live\Enumerate\Daily\2026-10-27.md`
- `Grep` -- pattern `registerView|ItemView|onClick|toggle|contentEditable|processFrontMatter|Vault.process|vault\.(modify|process)|isDesktopOnly` path `D:\_Anant\20_Progress\Projects\the-plan-dashboard\src`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n 1,200p "40_Resources/Obsidian/Dashboards/Decisions Log.md" | tail -40; echo ======; sed -n 1,60p "40_Resources/Obsidian/Dashboards/Build Plan.md"
```
```
| 20 | Five skills | startday, closeday, weekly-review, monthly-review, jarvis-dump | Skills are directories. |
| 21 | Four agents | daily-auditor, review-analyst, skeptic, vault-curator. Cut career-operator and research-distiller. | Agents are folders or files by purpose. |
| 22 | Hooks | Write guard, secrets guard, daily-note validator. Written to Anthropic's official spec. | Spec checked in prompt R1. |
| 23 | CLAUDE.md | Thin pointer to AGENTS.md plus Claude-only specifics | One rule set. |
| 24 | Home top | Streak number and score ring first | Then today's ticks, career and study lines. |
| 25 | Logging | Four layers: daily note, review sections, decision register, AI session log (only with approval) | No new folders. |
| 26 | `/jarvis-dump` | Copy, Jarvis untouched. Writes nowhere except the `60_Jarvis` landing folder. | Provenance frontmatter on every dumped note. |
| 27 | Tool references | One reference note per tool in `30_Order/Standards/References/`, linked from the tool | Source URL, version checked, date. Path clarified 2026-10-13 to match [[Spec - AI Loop]] and the [[Tool Reference Template]]. |
| 28 | Task intake | Reminders (phone), Todoist, Google Calendar (gupt0479@umn.edu), tasks typed in Obsidian | Three automation layers. See [[Spec - Automation Layers]]. |
| 29 | Hour-one scope | Design the whole architecture. `30_Order` entirely, basic skills, agents and hooks laid out. Prompts for the later sessions. | Build is staged. See [[Build Plan]]. |
| 30 | Automation | Not part of this build. Only the basic layer is laid out. | Slot reserved in the daily note. |
| 31 | Score ring colours (2026-10-12, second session) | Red, golden orange, light dark green | Red under 3, golden orange at 3 and 4, green at 5. See [[Front End and Visual System]]. |
| 32 | How forgiven days count | As lost days in the month | Adds 0 to streak length, never resets, counted in the month's lost days. |
| 33 | Heatmap shading | Eye pleasing | Single green ramp, dashed outline on forgiven days. Fine detail decided on screen. |
| 34 | Dashboard medium | Not a note, canvas, Kanban or drawing. Homepage opens it on launch. Research the latest Obsidian methods. | Proposed answer: a private plugin view. See [[Dashboard Build Hub]]. Needs Anant's go-ahead for S0. |
| 35 | ISO rename done (2026-10-13) | Approved and executed. 27 daily notes `DD-MM-YYYY` to `YYYY-MM-DD`; `22-12-2025 and before` became `2025-12-22`; 4 monthly notes `MM-YYYY` to `YYYY-MM` (`2025-12`, `2026-01`, `2026-03`, `2026-06`). | Moved with `obsidian move`, so wikilinks updated. Dataview returns `file.day` for all 28 dailies (after a reindex, since Dataview does not reparse on rename). Two dead links to missing 23-12-2025 and 25-12-2025 were removed from `2025-W52`. Weekly and yearly names were already ISO-style. See [[Naming and Folder Map]]. |
| 36 | Streak engine (2026-10-13, orchestration session) | The Node program `plan-cli`, built from the plugin's `core/`, is what skills, hooks and reviews call. `streak.py` stays as the reference and the test oracle. | Removes the Python path dependency. Parity tests keep the two equal. Replaces the earlier Proposed item. See [[Reference - plan-cli]]. |
| 37 | Grade for weeks and months | Percent of counted days MET, plus a letter: A at 90, B at 75, C at 60, D at 40, F below | The bands are one table in `CONFIG.gradeBands`. A change goes through this log first. The percent stays the number of record. Confirmed by Anant on 2026-10-14: the same letter structure as the daily workflow, with the percent. |
| 38 | Jarvis Review proposals | Accepted as written: outcomes promote, revise and reject; reject goes to deletion or `60_Jarvis/40_Archive` only after a yes; a promoted note gets `status: seed` or `sprout` and `reviewed: YYYY-MM-DD`; one review note per batch in `60_Jarvis/50_Reviews/Jarvis/`, written on request; `unreviewed` stays a one-folder status exception | See [[Jarvis Review]] and [[Jarvis Move]]. On 2026-10-14 Anant confirmed this as the base. It will be modified in detail after the process has run and been proven to work. |
| 39 | Scope of the orchestration build | The base only: engine, CLI, hooks as a program, tests, agents, skills updated, standards and workflows. No new dashboard screens. | The Monthly and review views stay with B7. |
| 40 | Review cadence and automation (revised 2026-10-14) | Unattended runs are scheduled tasks that fire by themselves at set times with no human yes or no. They are meant for repetitive, clearly defined, detailed processes, and for now for the weekly and monthly reviews only. The reviews are designed in detail, and their times and settings fixed, only after the manual process has run and been proven. The due times in [[Scheduled Review]] (weekly after the Sunday close, monthly on the 1st) are working defaults until then. | Nothing is scheduled and every review is manual today. Writes of an unattended run are limited to the review's own entry. An engine-only, read-only report is designed and not built. |
| 41 | Milestone level titles (revised 2026-10-14) | The beginning (3), Toward 21 (7), Now it gets hard (21), Work pays off (66), Consistency, discipline, mindset (100) | Worded from Anant's own lines and shortened for the dashboard. They replace the earlier defaults Spark, Steady, Habit, Automatic and Centurion. They are in `CONFIG.milestoneTitles` and in [[Streak Rule]]. The dashboard does not show them yet. Change this row and the config together. |
| 42 | Jarvis snapshot for the Monthly review | Jarvis writes it in its own vault. Anant brings it across with `/jarvis-dump`. Its file name contains "Snapshot" and the month label, for example `Jarvis Snapshot 2026-09.md`. `monthly-review` requests it and never produces it. | The engine matches the name in `60_Jarvis/10_Promoted_Notes`. |
| 43 | Dumped copies and the promotion index | A source's existing `status` moves to `source_status` when `status: unreviewed` is added. The index's Dataview query points at `60_Jarvis/10_Promoted_Notes`. | The query path is fixed in [[Promoted From Jarvis Index]]. |
| 44 | Hooks | The write guard, secrets guard and daily-note validator are one program, `plan-cli hook`. The guards fail closed. They are registered in `.claude/settings.json` only after Anant approves the diff in [[Hook Standard]]. | Registered on 2026-10-13 and verified live. |
| 45 | Agents | `daily-auditor`, `review-analyst` and `skeptic` are single read-only files with `Read, Grep, Glob`, and the caller supplies engine output. `vault-curator` was rewritten, and `career-operator` and `research-distiller` were removed, on 2026-10-13 with Anant's approval. | See [[Agent Standard]]. |
| 46 | The frozen month (2026-10-14) | A finished month stays inside the same `00_Live/Enumerate` folder and is not archived until a new year begins. Each 1st: learn (the review), improve (decide changes), plan ahead (a new month with a new plan, forgetting the previous 30 days). The daily notes of a finished month may be rearranged inside `Enumerate`. | Replaces the Proposed item "a frozen monthly recap is the archive". Where the daily notes are rearranged is not decided, and the engine reads only `Daily/`, so nothing moves until the engine accepts the new place. See [[30_Order/Standards/Dashboards/Monthly Review|Monthly Review]]. |
| 47 | `00_Dashboard.md` retired (2026-10-14) | Anant asked for the markdown dashboard to be deleted, because the plugin view is the active dashboard. | The note was deleted. Its links were repointed to [[Dashboards Hub]], which now holds the navigation links. Homepage was already set to "Nothing". |
| 48 | Best streak follows the spec (2026-10-14) | `best` counts closed days only, as in [[Spec - Streak and Daily Note]]. Today joins it the next day. | `streak.py` and the engine were changed together and the parity tests pass. The earlier `max(best, current)` is removed. The deployed plugin build keeps it until the plugin is next built. See [[Streak Rule]]. |
| 49 | Workflow names and Dataview paths (2026-10-14) | The review workflows are named [[Run Weekly Review]] and [[Run Monthly Review]], so that no note shares a name with its standard. Dataview queries now point at folders that exist. | Links were rewritten. Fixed: the Jarvis Board, System Status, Enrichment Quality Dashboard, the project briefs board and the Enumerate Board. |
| 50 | Hook code location (2026-10-14) | The three hooks stay inside `plan-cli.cjs` and are registered in `.claude/settings.json`. No scripts are created in `30_Order/System/hooks`. This settles the conflict between the early build prompt, which asked for scripts there, and Decisions 36 and 44. | One program shares the parser and path rules with the dashboard, has unit and built-bundle tests, and is already registered. Separate scripts would duplicate each rule and run twice per call. Changes go through the engine source, then `build:cli` and `deploy:cli`. See [[Hook Standard]]. |
| 51 | Daily template is Better Today (2026-10-26) | `Daily Note.md` is deleted. [[Better Today]] is the template for daily notes, set in Periodic Notes with the formats `YYYY-MM-DD`, `gggg-[W]ww`, `YYYY-MM` and `YYYY`. The skills, the standards and the QuickAdd setup now name it. | The template does not yet carry the engine structure (`type: daily`, `## Targets` to `## Intake`, `[cat::]` lines), so the streak reads 0 until it does. See Template in [[Daily Note Schema]]. Open until Anant decides how the structure gets back into the template. |

## Proposed, not yet confirmed

- Plugin source lives in a separate repo outside the vault, built files copied in. See [[Architecture]].
- Streak and ring colour hex values in [[Front End and Visual System]].
- Multi-Column Markdown plugin dropped in favour of a CSS grid snippet.
- Review records: `60_Jarvis/50_Reviews/Weekly` and `Monthly` hold a saved analysis only on request, `Dashboard` holds verification records, `Agentic OS` holds toolkit audits. See [[Agentic OS Standard]].
- Google Calendar alarms for 8 am, 2 pm, 5:30 and the evening close: not decided. Anant raised the reminder and Todoist overlap instead. See [[Spec - Automation Layers]].
======
---
type: project
status: sprout
created: 2026-10-12
tags:
  - dashboard
  - build-plan
notes:
  - "[[Dashboards Hub]]"
  - "[[Decisions Log]]"
  - "[[Prompts]]"
  - "[[The Plan Vault Architecture]]"
next: "Run R1, then B1"
---
# Build Plan

This session (about one hour) designs the whole system and writes the prompts. Each later session builds one slice. Ready-to-paste prompts are in [[Prompts]].

## Order and dependencies

| Step | Prompt | Slice | Needs | Gate before moving on |
|---|---|---|---|---|
| 0 | R1 | Research: official specs, automation transport, plugin state | Nothing | Findings note written; unknowns listed |
| 1 | B1 | ISO rename of daily notes and the `30_Order` standards (note types, naming, daily schema, streak rule, folder map) | R1 | Every renamed note opens; all links resolve; standards reviewed by Anant |
| 2 | B2 | Daily template, QuickAdd choices, streak script and its tests | B1 | Script output matches hand-computed streak on sample notes |
| 3 | B3 | Home dashboard and CSS | B2 | Home renders on desktop and phone; ticking writes back; numbers equal the script |
| 4 | B4 | The five skills (directories) | B1, B2 | Each skill dry-run on a sample day; reference notes exist |
| 5 | B5 | Four agents and three hooks, plus `settings.json` | R1, B1 | Hook tests: blocked cases blocked, allowed cases allowed |
| 6 | B6 | `60_Jarvis` zones README, `CLAUDE.md` rewrite, `AGENTS.md` reconciliation, `jarvis-dump` | B4, B5 | No stale paths; one rule set |
| 7 | B7 | Monthly dashboard and the Map canvas | B3 | Monthly renders; canvas has edges |
| 8 | B8 | Plugin audit and phone test, sync-collision check | B3 | Written pass/fail list for desktop and phone |
| 9 | A1 | Automation layers (later, not in this build) | All above, R1 | Separate plan |

## Update 2026-10-12 (second session)

Step 3 (B3, Home dashboard and CSS) is replaced by stages S0 to S6 in [[Dashboard Build Hub]]. The Home is a private plugin view, not a markdown note. B2's streak script becomes the shared engine module.

## This session (done in the hour)

- Research of Jarvis and The Plan: [[Research - Jarvis Dashboard Findings]].
- Every question answered: [[Decisions Log]].
- Specs: [[Spec - Streak and Daily Note]], [[Spec - Home and Monthly Dashboards]], [[Spec - AI Loop]], [[Spec - Automation Layers]].
- Prompts for every later session: [[Prompts]].
- Nothing outside this folder was written or moved.

## Next-day target

Finish B1 to B3 so the daily note, the streak and the Home page exist. Everything else follows in the order above.

## Risks to watch

1. **Rename breakage.** The ISO rename touches every daily note. Use link-aware moves and verify links after.
2. **Scope creep.** Each prompt says to stop when its slice is done and to mention extras instead of building them.
3. **Drift between script and dashboard.** One test, run in B3.
4. **Unverified plugin state.** Do B8 early if Home misbehaves.
5. **Sync collisions.** Obsidian Sync, git auto-sync and any Syncthing must not write the same files.
6. **Secrets.** `40_Resources/CS/Links.md` still lists a Keys section. Rotate and strip it separately; no prompt here reads it.
```
- `AskUserQuestion` -- ``{"questions":[{"question":"The streak engine only counts `[cat::]` lines under five category headings (Morning, Study, Fitness, Mind, Career), and your Better Today note has none, so the streak reads 0. What should the Plan\u0027s daily note and streak be built on from here?","header":"Day model","multiSelect":false,"options":[{"label":"Ticks on the 80 and 20 lines (Recommended)","description":"The habit lines you already write under ### 80 and ### 20 become the data. Each group (Mornings, Studying, Health) is a category. Streak counts groups done, same one-forgiven-miss rule. Meta Bind toggles go away. Matches the Jarvis day model, so both vaults behave the same."},{"label":"Restore the five [cat::] categories","description":"Put Morning, Study, Fitness, Mind, Career lines back into Better Today as the engine expects. Least code change, but it discards the 80/20 structure you now write every day."},{"label":"Two scores, 80/20 plus the five categories","description":"Keep the five categories as the streak and show the 80/20 ticks as a second ring. More to maintain and the note gets longer."}]},{"question":"The dashboard is not editable today. How much should you be able to change from the page without opening the note?","header":"Editing","multiSelect":false,"options":[{"label":"Tick, edit lines, and write (Recommended)","description":"Tick anything, double-click to edit any line in place (80/20, wins, habits, Tomorrow), and type into Just Write and Do Not Do from the page. Every write is a Vault.process edit that refuses if the line changed underneath."},{"label":"Tick and edit lines only","description":"Ticks plus in-place line edits. Long journaling text stays in the note."},{"label":"Tick only, fix the broken ticks","description":"Smallest change. Ticking works again, nothing else is editable."}]},{"question":"Should The Plan\u0027s dashboard become the same one-page, no-vertical-scroll, scaled-to-fit page as the Jarvis design, or stay a scrolling dashboard?","header":"Page shape","multiSelect":false,"options":[{"label":"One page, no vertical scroll (Recommended)","description":"Same rules as Jarvis: whole page scales to fit, only written text scrolls sideways, Window too small banner. Month and review views become a second tab or a toggle on the same page, not a longer page."},{"label":"Scrolling page, tidier","description":"Keep a long page with sections, but redesign the order and look. Easier on phones."},{"label":"One page on laptop, scrolling on phone","description":"Two layouts from one engine. Doubles the layout work and the phone has never been tested."}]},{"question":"The Plan is used on a phone through Obsidian Sync (AGENTS.md), but nothing has been tested there and Jarvis is laptop only. Which devices does the finished Plan dashboard target?","header":"Devices","multiSelect":false,"options":[{"label":"Laptops now, phone later","description":"Set isDesktopOnly true, test on the Dell and Acer, and design the phone view as a separate later build. Keeps this build finishable in one pass."},{"label":"Laptops and iPhone 15 together","description":"The dashboard must work on the phone from day one. Needs a phone test route and touch editing, and it lengthens the build."},{"label":"Laptops only, permanently","description":"Matches Jarvis. The phone keeps the markdown notes and nothing else."}]}]}``
- `AskUserQuestion` -- `{"questions":[{"question":"A one-page, no-scroll layout cannot hold every block on an iPhone 15 (about 393 x 852 pt). How should the phone get around that?","header":"Phone layout","multiSelect":false,"options":[{"label":"Phone shows tabs, each tab fits one screen (Recommended)","description":"Today, Plan, Month and Write are four tabs with a bottom bar. Nothing scrolls vertically on any tab. Laptop shows all of it on one page. Written text still scrolls sideways only."},{"label":"Phone is allowed to scroll vertically","description":"The no-scroll rule applies on laptops only. Simplest on the phone, but breaks the rule you set for Jarvis."},{"label":"Phone gets only Today","description":"A single compact screen with the streak, the 80 and 20 ticks and Tomorrow. Month and review stay laptop only."}]},{"question":"With the 80 and 20 lines as the data, what makes a day count toward the streak? Today\u0027s note has 2 groups under 80 (Mornings, Studying) and 2 under 20 (Mornings, Health), which cannot use the old rule of 3 of 5.","header":"Streak rule","multiSelect":false,"options":[{"label":"All 80 lines ticked (Recommended)","description":"The day is MET when every 80 line is done. The 20 lines are a separate score that supports the 80 and never affects the streak. One miss forgiven, two in a row reset, as before."},{"label":"A percentage of 80 and 20 lines together","description":"MET at 60 percent or more of all ticked lines. Forgiving, but lets you skip a whole 80 habit and still count."},{"label":"One 80 line per group","description":"MET when each group (Mornings, Studying) has at least one of its 80 lines ticked."}]},{"question":"You asked for a todo workflow. Where do tasks come from and where do they live in The Plan? Decision 28 listed Reminders, Todoist, Google Calendar (gupt0479@umn.edu) and tasks typed in Obsidian.","header":"Todo source","multiSelect":false,"options":[{"label":"Obsidian is the only list (Recommended)","description":"Tasks are checkbox lines in the daily note (Tomorrow and the 20) and in plan notes. The dashboard shows them, you tick and add them there. Calendar is read-only for time blocks. Todoist and Reminders are not connected in this build."},{"label":"Obsidian plus Google Calendar blocks","description":"As above, and the dashboard also reads your calendar events for today as timed blocks you can tick off."},{"label":"Todoist as the capture inbox","description":"Capture in Todoist, pulled into the daily note at /startday. Needs an outside service and an approval step, and Jarvis dropped Todoist for being a second list."}]},{"question":"How is the Tomorrow section used today, and what should the page do with it?","header":"Tomorrow","multiSelect":false,"options":[{"label":"Tomorrow becomes tomorrow\u0027s morning plan (Recommended)","description":"Lines typed in Tomorrow are carried by /closeday into the next day\u0027s Morning Plan as a preview, shown on the page as Next. The dashboard lets you add and edit them. Nothing is copied forward unticked."},{"label":"Tomorrow stays a free list","description":"The dashboard shows it as a list you can edit. No automatic carry into the next note."},{"label":"Tomorrow feeds the 80 directly","description":"Anything in Tomorrow is promoted into the next day\u0027s 80 or 20 at /startday, with you approving each line."}]}]}`

## You

The session was interrupted, continue on the rebuild of notes that were in process. If you require more clarification for the final deployed version of the dashbaord. Ask me more and more questions so that we can implement each and every single step correctly over here. Finish the questionnaire and then help me establish concrete notes.

## Claude

### Tool Calls

- `AskUserQuestion` -- `{"questions":[{"question":"For the todo workflow, which tools feed tasks into The Plan, and in which direction? Jarvis dropped Todoist, but you say The Plan has an automation layer for Google Calendar, Todoist and Obsidian.","header":"Todo tools","multiSelect":true,"options":[{"label":"Obsidian checkbox lines (Recommended)","description":"The 20 section, Tomorrow and plan notes. This is the single list the dashboard ticks and edits. Always on."},{"label":"Google Calendar, read timed blocks","description":"Today\u0027s events from gupt0479@umn.edu appear as blocks on the page. Read only, through Claude and the connector, writes follow the calendar guide."},{"label":"Todoist, pulled in at /startday","description":"Open Todoist tasks due today are proposed as 20 lines for your yes. Nothing is written back automatically. Needs the Todoist connector and an approval step."},{"label":"Apple Reminders or another tool","description":"Name the tool in the notes field. It is designed as a later transport, not built in this pass."}]},{"question":"The Tomorrow section forwards into the next day\u0027s note but is not the morning plan. How should it appear in the next note and on the page?","header":"Tomorrow carry","multiSelect":false,"options":[{"label":"A separate From yesterday block (Recommended)","description":"/startday copies yesterday\u0027s Tomorrow lines under a small From yesterday heading in the new note. They show on the page as a read-only reminder chip row. They are never ticked, never part of the 80 or 20, and never counted."},{"label":"Same, but each line can be tickable","description":"From yesterday lines get checkboxes you can tick or drop. Ticks are tracked but still do not affect the streak."},{"label":"Only a pointer","description":"The next note gets a link to yesterday\u0027s note and nothing is copied. The page shows yesterday\u0027s Tomorrow text when it loads."}]},{"question":"Time tracking is owned by The Plan, and the Jarvis design is waiting on it. Do you want the time design settled now, in this pass?","header":"Time layer","multiSelect":false,"options":[{"label":"Yes, design it now (Recommended)","description":"Fix the daily note heading for the time overview, the time-log folder and file naming, the entry format (proposal: - HH:MM-HH:MM task label [proj:: name]), who writes entries and when. Jarvis then unblocks its feeds stage."},{"label":"Design it, but build it later","description":"Write the design notes now, keep the build out of this upgrade, and still unblock Jarvis."},{"label":"Leave time out of this pass","description":"The dashboard shows no time. Jarvis keeps waiting."}]},{"question":"You asked me to upgrade the existing dashboard notes, archive what has already run, and write a new build plan. Archive is hook-blocked for writes, so where should the already-run prompts and finished build records go?","header":"Archive","multiSelect":false,"options":[{"label":"A Ran folder inside Dashboards (Recommended)","description":"Mirror Jarvis: Dashboards/Ran holds the finished prompts and build records, marked status: done. Needs your yes to move each note. Nothing is deleted."},{"label":"Leave them in place, mark them done","description":"No moves. Only frontmatter and a status line change, with a pointer to the new plan."},{"label":"Move to 50_Archive by hand","description":"You move them yourself, because the hook blocks me from writing there."}]}]}`

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Architecture.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Hub.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Build Log.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Decisions Log.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Plugin Retirement List.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Research - Outside Sources.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Research - The Plan Parallel Builds.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Automation Layer.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Carry Forward.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Dashboard Page.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Day Model and Streak.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Spec - Plans Feed.md`
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Jarvis Build\Jarvis Verification and Risks.md`

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && find "40_Resources/Obsidian/Dashboards" "00_Live/Tracking/Plans" -type f | head -200; echo ---; ls -la; echo ---; ls .claude .claude/* 2>/dev/null`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && wc -c *.md "Dashboard Build"/*.md && cat "Dashboards Hub.md" "Dashboard Build/Dashboard Build Hub.md" "Build Plan.md"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Decisions Log.md" "Dashboard Build/Build Log.md" "Dashboard Build/Build Steps.md"`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git log --oneline | head -40; git status --short | head -40; echo ---; ls -la; echo; find src tests -type f | grep -v node_modules | sort; cat package.json manifest.json 2>/dev/null`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git diff --stat; git diff; git log -3 --format='%h %ad %s' --date=iso; git remote -v; echo ---; ls -la "D:/_Anant/20_Progress/Documents/The Plan/.obsidian/plugins/the-plan-dashboard"; md5sum main.js "D:/_Anant/20_Progress/Documents/The Plan/.obsidian/plugins/the-plan-dashboard/main.js" dist/plan-cli.cjs "D:/_Anant/20_Progress/Documents/The Plan/30_Order/System/plan-cli/plan-cli.cjs"`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && ls -la --time-style=full-iso dist; grep -n "Math.max(best" dist/*.cjs main.js | head; grep -c "The beginning" dist/plan-cli.cjs main.js; wc -l src/**/*.ts src/**/*.tsx src/*.ts; cat src/main.ts src/settings.ts`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" && cat view/DashboardView.tsx ui/App.tsx ui/hooks.ts ui/sections.tsx`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Dashboard Build/Verification and Risks.md" "Dashboard Build/Review - Corrections to Earlier Notes.md" "Audit - Dashboard Stack and Phone Checklist.md"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Spec - AI Loop.md" "Spec - Home and Monthly Dashboards.md" "Spec - Automation Layers.md" | sed -n '1,400p'`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=long-iso .claude/agents .claude/skills .claude/skills/*/ ; echo; cat .claude/settings.json; echo; ls -la .claude/settings.local.json 2>&1; cat .gitignore`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --format='%h %ad %s' --date=iso -- .claude .gitignore | head -20; echo ---; git log --format='%h %ad %s' --date=iso --since=2026-10-13 --until=2026-10-17 | head -40; echo ---; git ls-files .claude | head -50; echo ---; ls -la --time-style=long-iso 30_Order/System 30_Order/System/plan-cli 30_Order/System/streak 2>&1`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && for c in 0b995c5 b26def3; do echo "== $c"; git show --stat --format='%an %ae %ad' $c | grep -E '^\S|\.claude|gitignore|AGENTS|CLAUDE|30_Order/System|Agentic|Standards' | head -60; done; echo; git show e10bc90 --stat | head; git show 7c82dc8:.claude/settings.json | head -50`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=long-iso 30_Order/System/git-sync; grep -n "auto:\|auto-sync:\|GitOwned\|commit -m\|add -A" 30_Order/System/git-sync/*.ps1 | head -30; echo ---; ls "30_Order/Standards/Agentic OS" "30_Order/Standards/Dashboards" "30_Order/Standards/References" "30_Order/Workflows/Agentic OS" "30_Order/Workflows" 2>&1`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git show --stat=200 --format= 0b995c5 | grep -E '^ \.' | grep -v '^ \.claude' ; echo ---; ls 00_Live/Enumerate/Daily | tail -8; ls 00_Live/Enumerate/Monthly 00_Live/Enumerate 2>&1 | tail -15`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=full-iso "00_Live/Enumerate/Daily/25-10-2026.md"; cat "00_Live/Enumerate/Daily/25-10-2026.md"; echo ===; git show --stat --format='%h %ae %ad' 0dbb873 96f2547 b8a1c14 7749fff ad9056a | grep -v '^$'`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --format='%h %ad' --date=iso --name-status -- "00_Live/Enumerate/Daily/19-10-2026.md" | head; find . -name "19-10-2026*" -not -path "./.git/*"; find 00_Live -newer 30_Order/System/plan-cli/plan-cli.cjs -name "*.md" | head -30; echo ---; grep -o '"format":"[^"]*"\|"folder":"[^"]*"\|"template":"[^"]*"\|"enabled":[a-z]*' .obsidian/plugins/periodic-notes/data.json 2>&1 | head -20; grep -o '"format": *"[^"]*"\|"folder": *"[^"]*"' .obsidian/daily-notes.json 2>&1`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat "00_Live/Enumerate/Daily/19-10-2026.md"; echo ===; cat .obsidian/plugins/periodic-notes/data.json; echo; ls 30_Order/Templates "30_Order/Templates/Daily Dashboard" 2>&1`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && node 30_Order/System/plan-cli/plan-cli.cjs streak 00_Live/Enumerate/Daily 2026-10-25 | head -c 1500`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/00_Live/Tracking/Plans" && wc -c *; cat "Summer Grind.md"; echo ======; cat "Winter Break.md" | head -150`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && find . -name "*.md" -newer "40_Resources/Obsidian/Dashboards/Audit - Dashboard Stack and Phone Checklist.md" -not -path "./.git/*" -not -path "./node_modules/*" | head -60; echo ---; grep -rli "claude assist\|ask claude\|claude panel\|daily plan\|daily-plan" --include=*.md . 2>/dev/null | grep -v "^./.git" | head -30`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/60_Jarvis/50_Reviews/Dashboard" && ls -la --time-style=long-iso; wc -c *; cat "Daily Review System.md"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -n "^#" "40_Resources/Obsidian/Dashboards/Prompts.md"; git log -3 --format='%h %ad' --date=iso -- "40_Resources/Obsidian/Dashboards/Prompts.md"; echo ---; cat "00_Live/Enumerate/Weekly/2026-W44.md"; echo ---; cat "30_Order/Workflows/Agentic OS/Agentic OS.md"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git diff --stat 176de70 HEAD -- "40_Resources/Obsidian/Dashboards" "30_Order" AGENTS.md CLAUDE.md "60_Jarvis" | tail -30; echo; git show 176de70:"40_Resources/Obsidian/Dashboards/Prompts.md" | grep -n "^#"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git diff --stat=200 176de70 HEAD | grep "Platform Facts"; find . -name "Research - Platform Facts*" -not -path "./.git/*"; sed -n 1,160p "40_Resources/Obsidian/Dashboards/Prompts.md"`
- `cd "D:/_Anant/20_Progress/Documents" && ls "The Plan/40_Resources/Obsidian/Dashboards/"; echo ---; ls Jarvis; ls Jarvis/.claude/skills Jarvis/.claude/agents 2>&1; find Jarvis -maxdepth 3 -iname "*daily*" -not -path "*/.git/*" -not -path "*/50_Archive/*" -not -path "*/.stversions/*" | head -30`
- `cd "D:/_Anant/20_Progress/Documents" && ls -laR --time-style=long-iso "The Plan/40_Resources/Obsidian/Dashboards/Daily"; echo ---; ls -la --time-style=long-iso Jarvis/.claude/skills/startday Jarvis/.claude/skills/closeday Jarvis/.claude/skills/plan-it; cat Jarvis/.claude/skills/startday/SKILL.md`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls 10_Areas/Life/Enumerate/Daily | tail -12; echo ---; f=$(ls 10_Areas/Life/Enumerate/Daily | grep 2026-10 | tail -1); echo "$f"; head -60 "10_Areas/Life/Enumerate/Daily/$f"; echo ---; sed -n 1,40p .claude/skills/closeday/SKILL.md`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && head -12 "30_Order/Templates/Daily Dashboard/Daily Note.md"; grep -n "tp\.\|{{" "30_Order/Templates/Daily Dashboard/Daily Note.md" | head; echo ---; sed -n '/^# /,$p' "30_Order/Workflows/Daily Dashboard.md" | head -80; echo ---; grep -o '"[a-zA-Z_]*[Ff]older[a-zA-Z_]*": *"[^"]*"\|"enable_folder_templates": *[a-z]*\|"trigger_on_file_creation": *[a-z]*' .obsidian/plugins/templater-obsidian/data.json`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" && grep -n "export\|cause\|month\|grade\|milestoneTitles" core/model.ts | head -30; grep -rn "#[0-9a-fA-F]\{6\}" ui/styles.ts | head -8; grep -n "links" core/config.ts; echo ---; cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n '/^# /,$p' "30_Order/Standards/References/Reference - the-plan-dashboard.md" | head -60`
- `pwd; cd "D:/_Anant/20_Progress/Documents/Jarvis" 2>/dev/null && pwd && git log --oneline | head -5; cat 00_Dashboard.md | head -120; echo ---; ls 40_Resources/Obsidian 2>&1; ls 40_Resources | head -30; ls .obsidian/plugins; cat .obsidian/community-plugins.json`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && find . -iname "*.canvas" -not -path "./50_Archive/*" -not -path "./.git/*" | head; echo ---; ls 10_Areas 10_Areas/Life 10_Areas/Life/Plans 10_Areas/Life/Habits 10_Areas/Life/Enumerate 10_Areas/Career 20_Progress 2>&1 | head -80; echo ---; head -60 AGENTS.md`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls -la --time-style=long-iso "40_Resources/Obsidian/Dashboard" "40_Resources/Obsidian/Dashboard"/* | head -60; echo ---; sed -n 120,260p 00_Dashboard.md; echo ---; ls "10_Areas/Life/Plans/Fall 2026" "10_Areas/Life/Plans/Summer 2026" 20_Progress/Mentorship\ Program 20_Progress/Internship 20_Progress/Degree 20_Progress/Projects 2>&1 | head -70`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/40_Resources/Obsidian/Dashboard" && cat "Jarvis Build Overview.md"; echo =====; sed -n 1,60p "The Plan Overview.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/10_Areas/Life/Plans/Fall 2026" && sed -n 1,200p "Fall 2026 - The One Thing.md" | head -70; echo ====; grep -n "^#" "Fall 2026 Plan.md" "Weekly Rhythm.md" "Anti-Drift Rules.md" "LeetCode & CodePath.md" "Fall 2026 Builds.md"`
- `cd "D:/_Anant/20_Progress/Documents" && grep -rli "toggl" --include=*.md Jarvis "The Plan" 2>/dev/null | grep -v "50_Archive\|\.git/" | head; echo ---; sed -n 70,96p "Jarvis/10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md"; echo ---; sed -n 16,34p "Jarvis/10_Areas/Life/Plans/Fall 2026/Weekly Rhythm.md"; echo ---; python3 - <<'E' 2>/dev/null || node -e 'const c=JSON.parse(require("fs").readFileSync("Jarvis/10_Areas/Jarvis OS Dashboard.canvas","utf8"));console.log(c.nodes.length+" nodes, "+(c.edges||[]).length+" edges");console.log(c.nodes.map(n=>n.type+":"+(n.text||n.file||n.label||"").slice(0,60).replace(/\n/g," ")).join("\n"))' E ls Jarvis/.claude/settings.json && node -e 'const s=require("./Jarvis/.claude/settings.json");console.log(Object.keys(s.hooks||{}))'`
- `cd "D:/_Anant/20_Progress/Documents" && grep -rli "toggl" --include=*.md Jarvis/10_Areas Jarvis/20_Progress Jarvis/30_Order Jarvis/40_Resources "The Plan/00_Live" "The Plan/30_Order" "The Plan/40_Resources" 2>/dev/null | head; echo ---; sed -n 70,96p "Jarvis/10_Areas/Life/Plans/Fall 2026/Fall 2026 Plan.md"; echo ---; sed -n 16,34p "Jarvis/10_Areas/Life/Plans/Fall 2026/Weekly Rhythm.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && for d in .obsidian/plugins/*/; do n=$(basename $d); v=$(node -e 'try{console.log(require("./'$d'manifest.json").version)}catch(e){console.log("?")}'); echo "$n $v"; done; echo ---; node -e 'const d=require("./.obsidian/plugins/lazy-plugins/data.json");console.log(JSON.stringify(d.desktop||d,null,0).slice(0,1500))'; echo ---; cat .obsidian/core-plugins.json | tr -d '\n ' | head -c 700; echo; ls .obsidian/snippets; cat .obsidian/appearance.json | tr -d '\n '`
- ````cd "D:/_Anant/20_Progress/Documents/Jarvis" && D="10_Areas 20_Progress 30_Order 40_Resources 60_Claude 00_Dashboard.md"; echo "meta-bind INPUT/BUTTON notes:"; grep -rlE "INPUT\[|BUTTON\[|meta-bind" --include=*.md $D | wc -l; echo "dataviewjs notes:"; grep -rl '```dataviewjs' --include=*.md $D | wc -l; echo "dataview notes:"; grep -rlE '```dataview$' --include=*.md $D | wc -l; echo "multi-column notes:"; grep -rl "start-multi-column" --include=*.md $D | wc -l; echo "kanban notes:"; grep -rl "kanban-plugin" --include=*.md $D | wc -l; echo "excalibrain/excalidraw files:"; find . -name "*.excalidraw*" -not -path "./.git/*" -not -path "./5*" | wc -l; echo "spaced rep (#flashcards):"; grep -rlE "#flashcards|#review" --include=*.md $D | wc -l; echo "latex notes:"; grep -rlE '\$\$' --include=*.md $D | wc -l; echo "templater <% notes in templates:"; grep -rl "<%" --include=*.md 30_Order/Templates | wc -l; echo "css classes:"; grep -rlE "cssclasses" --include=*.md $D | wc -l; echo --- ; grep -rl "INPUT\[" --include=*.md $D | head -15````
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && f=$(find 30_Order -name "Note Type Registry.md" | head -1); echo "$f"; grep -n "reference\|project\|prompt\|build" "$f" | head -30; ls 30_Order/Templates | head -40; ls 40_Resources/Obsidian/Dashboard/"Jarvis Builds"/Ran; ls 20_Progress/Projects/"Jarvis & The Plan" 2>&1 | head`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n "obsidian\|claude\|^\*\|^!" .gitignore | head -30; ls 30_Order/System 2>/dev/null; ls 30_Order/System/sync-workflow 2>/dev/null | head; git remote -v | head -2`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && find . -name "Agent Prompt Standard.md" -o -name "Spec and Plan Standard.md" -o -name "Frontmatter Standard.md" -o -name "Project Spec Template.md" -o -name "Project Plan Template.md" -o -name "Agent Prompt Template.md" -o -name "Prompt Cycle.md" -o -name "Conformance Standard.md" | head; `
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && cat Standards/Projects/Agent\ Prompt\ Standard.md Standards/Projects/Spec\ and\ Plan\ Standard.md Templates/Projects/Agent\ Prompt\ Template.md Templates/Projects/Project\ Spec\ Template.md Templates/Projects/Project\ Plan\ Template.md`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/30_Order" && cat Workflows/Projects/Prompt\ Cycle.md; sed -n 1,80p Standards/Frontmatter\ Standard.md`
- `cd "D:/_Anant/20_Progress/Documents" && grep -rli "gupt0479\|google calendar\|gcal" --include=*.md Jarvis/10_Areas Jarvis/20_Progress Jarvis/30_Order Jarvis/40_Resources Jarvis/60_Claude "The Plan/00_Live" "The Plan/10_UMN" "The Plan/20_Progress" "The Plan/30_Order" "The Plan/40_Resources" "The Plan/60_Jarvis" 2>/dev/null | head -30`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && grep -n -i "gupt0479\|google calendar\|gcal\|calendar" "10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds.md" "30_Order/Standards/Operations/Daily Note Standard.md" "30_Order/Workflows/Operations/Daily Close Loop.md" "20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md" "40_Resources/CS/Concepts/New Laptop/Sync/Google Drive Sync Policy.md" | cut -c1-400 | head -40; echo ======; cat "60_Claude/05_Clippings/AI Conversations/Acer/Windows/Claude/Home/09-21 Calendar connection and Wednesday schedule.md" | head -120`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && cat "30_Order/Standards/Operations/Daily Note Standard.md"; echo =======; cat "30_Order/Workflows/Operations/Daily Close Loop.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && f=$(find . -name "How to Use Google Calendar.md" -not -path "./.git/*" | head -3); echo "$f"; cat "$(echo "$f" | head -1)"; echo ======; cat "20_Progress/Projects/Jarvis & The Plan/Builds - Jarvis/Jarvis Dashboard Build Record.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && sed -n 1,90p "10_Areas/Life/Enumerate/Weekly/2026-W44.md" | cut -c1-300; echo =====; f=$(find 30_Order/Templates -name "Better Today.md"); echo $f; cat "$f"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && for n in "Plan Standard" "Plan Review Cadence" "Periodic Review Note Standard" "Vault Lint" "Note Kit Standard" "Reference Standard"; do printf "%s: " "$n"; find 30_Order -name "$n.md" | head -1; done; ls "20_Progress/Mentorship Program/Plans" 20_Progress/Degree/_Courses 2>&1 | head -20; sed -n 1,40p "10_Areas/Life/Plans/Plans Board.md" | cut -c1-250`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && for n in "Jarvis Build Hub" "Jarvis Decisions Log" "Jarvis Architecture" "Jarvis Build Log" "Jarvis Verification and Risks"; do find . -name "$n*.md" -not -path "./.git/*" | head -2; done; echo "--- tracked plugin folders:"; git ls-files .obsidian/plugins | cut -d/ -f3 | sort -u | tr '\n' ' '; echo; git check-ignore -v .obsidian/plugins/jarvis-dashboard/main.js || echo "main.js would NOT be ignored"; echo "--- tracker:"; ls "10_Areas/Career/Internships/Tracker" "10_Areas/Career/Internships/Tracker/Each One" 2>&1 | head; f=$(find "10_Areas/Career/Internships/Tracker/Each One/Applied" -name "*.md" 2>/dev/null | head -1); echo "applied sample: ${f:-none}"; ls "10_Areas/Career/Internships/Tracker/Each One/Current" 2>/dev/null | wc -l; cd "../The Plan" && grep -rli toggl --include=*.md 00_Live 30_Order 40_Resources 60_Jarvis .claude 2>/dev/null | head -3; echo "plan toggl hits above (blank = none)"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -n -i -B2 -A6 "toggl" "00_Live/Enumerate/Daily/2026-10-26.md" | head -60; echo ====; grep -n -i -B1 -A4 "toggl" "30_Order/Templates/Daily Dashboard/Better Today.md" "30_Order/Workflows/Agentic OS/How to Use Plugins.md" | cut -c1-300 | head -50; echo ====; cd ../Jarvis/10_Areas/Career/Internships/Tracker && ls "Each One"; ls "Each One/Applied" 2>&1 | head -3; ls "Each One/Current" | head -3; sed -n 1,14p "Each One/Current/$(ls 'Each One/Current' | head -1)"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && ls "Jarvis Build" 2>&1 | head -2; mkdir -p "Jarvis Build" && ls -d "Jarvis Build"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards/Jarvis Build" && ls; echo "--- em dash / en dash count per file:"; grep -c "—" *.md | grep -v ":0" || echo "none"; echo "--- frontmatter delimiters (expect 2 per file in first 30 lines) and first/last key:"; for f in *.md; do n=$(head -40 "$f" | grep -c '^---$'); echo "$f: $n"; done; echo "--- unresolved in-folder links (names starting with Jarvis ):"; grep -oh "\[\[Jarvis [^]|]*" *.md | sed 's/\[\[//' | sort -u | while read n; do [ -f "$n.md" ] || echo "MISSING: $n"; done; echo "--- non-folder link targets used (should exist in Jarvis):"; grep -oh "\[\[[^]|#]*" *.md | sed 's/\[\[//' | grep -v "^Jarvis \(Build Hub\|Decisions\|Spec\|Architecture\|Plugin\|Verification\|Build Log\)" | sort | uniq -c | sort -rn`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --since=2026-10-25 --format='%h %ad %an %s' --date=iso | head -15; echo ---; find . -name "*.md" -newermt "2026-10-25 20:30" -not -path "./.git/*" -not -path "./50_Archive/*" -not -path "./copilot/*" | head -40; echo --- plugin repo; cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git log --format='%h %ad %s' --date=iso | head -5; git status --short | head; ls -la --time-style=long-iso main.js dist 2>/dev/null | head -5; echo --- jarvis-cli; ls -la --time-style=long-iso "D:/_Anant/20_Progress/Documents/Jarvis/30_Order/System/jarvis-cli" | head -20`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git show --stat=160 --format='%h %s' fb8f157 | head -30; echo ---; echo "Plan daily template headings:"; grep -n "^#\|^created\|^[a-z_]*:" "30_Order/Templates/Daily Dashboard/Better Today.md" | head -40; echo ---; echo "Schema headings:"; grep -n "^#" "30_Order/Standards/Dashboards/Daily Note Schema.md" | head -30; echo ---; grep -rniE "time log|time-log|timelog|time spent|stopwatch|clockify|toggl\b" --include=*.md 00_Live 30_Order 40_Resources/Obsidian 60_Jarvis 2>/dev/null | grep -vi "toggle" | cut -c1-200 | head -10; echo "(blank above = no time-log design notes)"; echo ---; ls 00_Live/Enumerate/Daily | tail -5; echo; ls 00_Live | head -30`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && echo "headings of today's Plan daily note:"; grep -n "^#\|^created\|^type\|^thought_kind\|cat::" "00_Live/Enumerate/Daily/2026-10-26.md" | cut -c1-90 | head -30; echo "cat:: lines:"; grep -c "cat::" "00_Live/Enumerate/Daily/2026-10-26.md"; echo ---; git show fb8f157 -- "30_Order/Standards/Dashboards/Daily Note Schema.md" "30_Order/Workflows/Daily Dashboard.md" | grep "^[+-]" | grep -v "^+++\|^---" | cut -c1-260; echo ---; echo "Plan periodic notes daily template now:"; grep -o '"daily": *{[^}]*}' .obsidian/plugins/periodic-notes/data.json | cut -c1-260`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -n "^| 51\|^| 52\|^| 53" "40_Resources/Obsidian/Dashboards/Decisions Log.md" | cut -c1-1800; echo ---; sed -n '/^## Template/,/^## Frontmatter/p' "30_Order/Standards/Dashboards/Daily Note Schema.md" | cut -c1-1500`
- ``cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards/Jarvis Build" && echo "files: $(ls *.md | wc -l)"; echo "--- em/en dashes:"; grep -c "[—–]" *.md | grep -v ":0" || echo none; echo "--- '---' lines per file (expect 2):"; for f in *.md; do echo "$(grep -c '^---$' "$f") $f"; done | sort | uniq -c -w2; echo "--- frontmatter required keys (type,status,created,updated,tags):"; for f in *.md; do for k in type status created updated tags; do head -30 "$f" | grep -q "^$k:" || echo "MISSING $k in $f"; done; done; echo "--- in-folder links unresolved:"; grep -oh "\[\[Jarvis [^]|]*" *.md | sed 's/\[\[//' | sort -u | while read n; do [ -f "$n.md" ] || echo "unresolved: $n"; done; echo "--- required headings:"; for f in Jarvis\ Spec*.md Jarvis\ Architecture.md; do for h in "What This Is" "Current State" "Non-Goals"; do grep -q "^## $h" "$f" || echo "$f lacks $h"; done; done; for h in Goal Sequence "Open Questions"; do grep -q "^## $h" "Jarvis Build Hub.md" || echo "Hub lacks $h"; done; echo "--- stale phrases:"; grep -n "Decide\b\|iPhone 15\|\[>\] carried\|Prompts.md is not written\|jarvis-cli\`" *.md | cut -c1-140 | head -20; echo "--- decision refs D1-D45 used vs defined:"; grep -oh "D[0-9][0-9]*" *.md | grep -v "^D1$" | sort -u | tr '\n' ' '``
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la "40_Resources/Obsidian/Dashboards" "40_Resources/Obsidian/Dashboards/Dashboard Build" 2>&1 | head -80; echo ---; ls 00_Live/Enumerate/Daily | tail -8; echo ---; git status --short | head -20`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la "D:/_Anant/20_Progress/Projects/the-plan-dashboard" | head -30; git -C "D:/_Anant/20_Progress/Projects/the-plan-dashboard" status --short; git -C "D:/_Anant/20_Progress/Projects/the-plan-dashboard" log --oneline | head`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && echo "== 2026-10-27 headings and line shapes (no prose) =="; grep -nE '^(#|---|- \[)|::' 00_Live/Enumerate/Daily/2026-10-27.md | sed -E 's/(\] ).{0,0}.*/\1/' | head -70; echo; wc -l 00_Live/Enumerate/Daily/2026-10-27.md; echo "== src tree =="; find "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" -type f | sed 's#.*/src/#src/#'; echo "== Dashboards Hub =="; sed -n 1,80p "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n 1,200p "40_Resources/Obsidian/Dashboards/Decisions Log.md" | tail -40; echo ======; sed -n 1,60p "40_Resources/Obsidian/Dashboards/Build Plan.md"`

