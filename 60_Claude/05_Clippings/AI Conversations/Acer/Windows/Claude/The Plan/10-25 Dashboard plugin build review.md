---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Dashboard plugin build review"
started_at: 2026-10-25T20:12:38
ended_at: 2026-10-25T20:21:05
exported_at: 2026-10-25T21:33:10
duration_minutes: 8.5
project: The Plan
cwd: 'D:\_Anant\20_Progress\Documents\The Plan'
session_id: c444e1cb-b1fd-4c4e-a3c6-55f5d4180bcd
status: raw
turn_count: 2
tools_used:
  Bash: 29
  Read: 1
tokens:
  input: 62
  output: 21145
  cache_creation: 143546
  cache_read: 3643477
  total: 3808230
cost_usd: null
model:
  - "claude-opus-5-5"
files_touched:
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Dashboard Build\\Plugin Build Prompts.md"
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

- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && find "40_Resources/Obsidian/Dashboards" "00_Live/Tracking/Plans" -type f | head -200; echo ---; ls -la; echo ---; ls .claude .claude/* 2>/dev/null`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && wc -c *.md "Dashboard Build"/*.md && cat "Dashboards Hub.md" "Dashboard Build/Dashboard Build Hub.md" "Build Plan.md"`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Decisions Log.md" "Dashboard Build/Build Log.md" "Dashboard Build/Build Steps.md"`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git log --oneline | head -40; git status --short | head -40; echo ---; ls -la; echo; find src tests -type f | grep -v node_modules | sort; cat package.json manifest.json 2>/dev/null`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && git diff --stat; git diff; git log -3 --format='%h %ad %s' --date=iso; git remote -v; echo ---; ls -la "D:/_Anant/20_Progress/Documents/The Plan/.obsidian/plugins/the-plan-dashboard"; md5sum main.js "D:/_Anant/20_Progress/Documents/The Plan/.obsidian/plugins/the-plan-dashboard/main.js" dist/plan-cli.cjs "D:/_Anant/20_Progress/Documents/The Plan/30_Order/System/plan-cli/plan-cli.cjs"`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && ls -la --time-style=full-iso dist; grep -n "Math.max(best" dist/*.cjs main.js | head; grep -c "The beginning" dist/plan-cli.cjs main.js; wc -l src/**/*.ts src/**/*.tsx src/*.ts; cat src/main.ts src/settings.ts`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" && cat view/DashboardView.tsx ui/App.tsx ui/hooks.ts ui/sections.tsx`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Dashboard Build/Verification and Risks.md" "Dashboard Build/Review - Corrections to Earlier Notes.md" "Audit - Dashboard Stack and Phone Checklist.md"`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && cat "Spec - AI Loop.md" "Spec - Home and Monthly Dashboards.md" "Spec - Automation Layers.md" | sed -n '1,400p'`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=long-iso .claude/agents .claude/skills .claude/skills/*/ ; echo; cat .claude/settings.json; echo; ls -la .claude/settings.local.json 2>&1; cat .gitignore`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --format='%h %ad %s' --date=iso -- .claude .gitignore | head -20; echo ---; git log --format='%h %ad %s' --date=iso --since=2026-10-13 --until=2026-10-17 | head -40; echo ---; git ls-files .claude | head -50; echo ---; ls -la --time-style=long-iso 30_Order/System 30_Order/System/plan-cli 30_Order/System/streak 2>&1`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && for c in 0b995c5 b26def3; do echo "== $c"; git show --stat --format='%an %ae %ad' $c | grep -E '^\S|\.claude|gitignore|AGENTS|CLAUDE|30_Order/System|Agentic|Standards' | head -60; done; echo; git show e10bc90 --stat | head; git show 7c82dc8:.claude/settings.json | head -50`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=long-iso 30_Order/System/git-sync; grep -n "auto:\|auto-sync:\|GitOwned\|commit -m\|add -A" 30_Order/System/git-sync/*.ps1 | head -30; echo ---; ls "30_Order/Standards/Agentic OS" "30_Order/Standards/Dashboards" "30_Order/Standards/References" "30_Order/Workflows/Agentic OS" "30_Order/Workflows" 2>&1`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git show --stat=200 --format= 0b995c5 | grep -E '^ \.' | grep -v '^ \.claude' ; echo ---; ls 00_Live/Enumerate/Daily | tail -8; ls 00_Live/Enumerate/Monthly 00_Live/Enumerate 2>&1 | tail -15`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls -la --time-style=full-iso "00_Live/Enumerate/Daily/25-10-2026.md"; cat "00_Live/Enumerate/Daily/25-10-2026.md"; echo ===; git show --stat --format='%h %ae %ad' 0dbb873 96f2547 b8a1c14 7749fff ad9056a | grep -v '^$'`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git log --format='%h %ad' --date=iso --name-status -- "00_Live/Enumerate/Daily/19-10-2026.md" | head; find . -name "19-10-2026*" -not -path "./.git/*"; find 00_Live -newer 30_Order/System/plan-cli/plan-cli.cjs -name "*.md" | head -30; echo ---; grep -o '"format":"[^"]*"\|"folder":"[^"]*"\|"template":"[^"]*"\|"enabled":[a-z]*' .obsidian/plugins/periodic-notes/data.json 2>&1 | head -20; grep -o '"format": *"[^"]*"\|"folder": *"[^"]*"' .obsidian/daily-notes.json 2>&1`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat "00_Live/Enumerate/Daily/19-10-2026.md"; echo ===; cat .obsidian/plugins/periodic-notes/data.json; echo; ls 30_Order/Templates "30_Order/Templates/Daily Dashboard" 2>&1`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && node 30_Order/System/plan-cli/plan-cli.cjs streak 00_Live/Enumerate/Daily 2026-10-25 | head -c 1500`
```
{"current_streak":0,"best_streak":0,"today_categories_done":0,"today_status":"NOT_YET","at_risk":false,"first_day":null,"days":[{"date":"2026-09-26","has_note":true,"categories":0,"forgiven":false},{"date":"2026-09-27","has_note":false,"categories":0,"forgiven":false},{"date":"2026-09-28","has_note":false,"categories":0,"forgiven":false},{"date":"2026-09-29","has_note":false,"categories":0,"forgiven":false},{"date":"2026-09-30","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-01","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-02","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-03","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-04","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-05","has_note":true,"categories":0,"forgiven":false},{"date":"2026-10-06","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-07","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-08","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-09","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-10","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-11","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-12","has_note":true,"categories":0,"forgiven":false},{"date":"2026-10-13","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-14","has_note":false,"categories":0,"forgiven":false},{"date":"2026-10-15","has_
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan/00_Live/Tracking/Plans" && wc -c *; cat "Summer Grind.md"; echo ======; cat "Winter Break.md" | head -150`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && find . -name "*.md" -newer "40_Resources/Obsidian/Dashboards/Audit - Dashboard Stack and Phone Checklist.md" -not -path "./.git/*" -not -path "./node_modules/*" | head -60; echo ---; grep -rli "claude assist\|ask claude\|claude panel\|daily plan\|daily-plan" --include=*.md . 2>/dev/null | grep -v "^./.git" | head -30`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan/60_Jarvis/50_Reviews/Dashboard" && ls -la --time-style=long-iso; wc -c *; cat "Daily Review System.md"`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -n "^#" "40_Resources/Obsidian/Dashboards/Prompts.md"; git log -3 --format='%h %ad' --date=iso -- "40_Resources/Obsidian/Dashboards/Prompts.md"; echo ---; cat "00_Live/Enumerate/Weekly/2026-W44.md"; echo ---; cat "30_Order/Workflows/Agentic OS/Agentic OS.md"`
```
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
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git diff --stat 176de70 HEAD -- "40_Resources/Obsidian/Dashboards" "30_Order" AGENTS.md CLAUDE.md "60_Jarvis" | tail -30; echo; git show 176de70:"40_Resources/Obsidian/Dashboards/Prompts.md" | grep -n "^#"`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git diff --stat=200 176de70 HEAD | grep "Platform Facts"; find . -name "Research - Platform Facts*" -not -path "./.git/*"; sed -n 1,160p "40_Resources/Obsidian/Dashboards/Prompts.md"`
```
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
```
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents" && ls "The Plan/40_Resources/Obsidian/Dashboards/"; echo ---; ls Jarvis; ls Jarvis/.claude/skills Jarvis/.claude/agents 2>&1; find Jarvis -maxdepth 3 -iname "*daily*" -not -path "*/.git/*" -not -path "*/50_Archive/*" -not -path "*/.stversions/*" | head -30`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents" && ls -laR --time-style=long-iso "The Plan/40_Resources/Obsidian/Dashboards/Daily"; echo ---; ls -la --time-style=long-iso Jarvis/.claude/skills/startday Jarvis/.claude/skills/closeday Jarvis/.claude/skills/plan-it; cat Jarvis/.claude/skills/startday/SKILL.md`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis" && ls 10_Areas/Life/Enumerate/Daily | tail -12; echo ---; f=$(ls 10_Areas/Life/Enumerate/Daily | grep 2026-10 | tail -1); echo "$f"; head -60 "10_Areas/Life/Enumerate/Daily/$f"; echo ---; sed -n 1,40p .claude/skills/closeday/SKILL.md`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/The Plan" && head -12 "30_Order/Templates/Daily Dashboard/Daily Note.md"; grep -n "tp\.\|{{" "30_Order/Templates/Daily Dashboard/Daily Note.md" | head; echo ---; sed -n '/^# /,$p' "30_Order/Workflows/Daily Dashboard.md" | head -80; echo ---; grep -o '"[a-zA-Z_]*[Ff]older[a-zA-Z_]*": *"[^"]*"\|"enable_folder_templates": *[a-z]*\|"trigger_on_file_creation": *[a-z]*' .obsidian/plugins/templater-obsidian/data.json`
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
- `Bash` -- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src" && grep -n "export\|cause\|month\|grade\|milestoneTitles" core/model.ts | head -30; grep -rn "#[0-9a-fA-F]\{6\}" ui/styles.ts | head -8; grep -n "links" core/config.ts; echo ---; cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n '/^# /,$p' "30_Order/Standards/References/Reference - the-plan-dashboard.md" | head -60`
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

## Actions Taken

**Files created:**
_None_

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


