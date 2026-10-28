---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Monthly dashboard and Map canvas"
started_at: 2026-10-14T15:01:04
ended_at: 2026-10-14T15:19:43
exported_at: 2026-10-28T16:15:50
duration_minutes: 18.6
project: The Plan
cwd: 'D:\_Anant\20_Progress\Documents\The Plan'
session_id: 7c5cce5a-b83e-4da7-922d-3f021bdc3aba
status: seed
review_state: raw
created: 2026-10-14
updated: 2026-10-28
turn_count: 8
tools_used:
  Bash: 20
  Glob: 4
  Grep: 1
  Read: 13
  Skill: 1
  Write: 1
tokens:
  input: 56
  output: 36918
  cache_creation: 125648
  cache_read: 3159107
  total: 3321729
cost_usd: 1.187795
model:
  - "claude-sonnet-5-5"
files_touched:
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\.obsidian\\snippets\\dashboard.css"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\00_Live\\Enumerate\\Monthly\\2026-10.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\00_Live\\Map.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\00_Live\\Monthly Dashboard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\00_Live\\Tracking\\Habits\\Finance Tracker.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\00_Live\\Tracking\\Habits\\Health Tracker.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\30_Order\\Standards\\Dashboards\\Daily Note Schema.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\30_Order\\Standards\\Dashboards\\Monthly Review.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\30_Order\\Standards\\Dashboards\\Streak Rule.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Dashboard Build\\Front End and Visual System.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Dashboards Hub.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Prompts.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Spec - Home and Monthly Dashboards.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\AGENTS.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Monthly dashboard and Map canvas

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/clear</command-name>
            <command-message>clear</command-message>
            <command-args></command-args>

## You



<pasted_content id="be4e">
You are working in The Plan, Anant's personal Obsidian vault at D:\_Anant\20_Progress\Documents\The Plan. Start by reading AGENTS.md, then 40_Resources/Obsidian/Dashboards/Dashboards Hub.md, then the notes the task names. Where AGENTS.md or those notes conflict with an older file, the newer instruction wins; report the conflict instead of picking silently.

Keep working until everything the task asks for is done, and only stop to ask when you cannot go on without Anant or before a risky step. Risky steps are renaming or moving notes, deleting anything, editing AGENTS.md, editing anything under .obsidian, and any action that touches an outside service. For those, show exactly what you will do and wait for a yes.

When the work is done and checked, stop and report. Do not add features, tests, files, docs or refactors that were not asked for. If you think one would help, mention it at the end instead of doing it. Write only inside the paths the task names.

When you change anything that can be run, built or tested, run a real check that exercises the change before reporting it done. A syntax-only check does not count. If a real check cannot run here, say which one you did not run and why.

Use search and the official documentation to check specifics that may have changed since your training, such as hook event names, skill frontmatter fields, plugin behaviour and connector capabilities, even when you feel confident. Cite the page you used.

Rules for this vault: never use an em dash; write complete sentences. Never read or print secret files (.env files, keys, tokens, credentials) and do not open plugin data.json files for copilot, quickadd, readwise or local-rest-api. Search before creating a note. Preserve frontmatter and wikilinks, and patch by heading instead of rewriting. Check that every wikilink target exists before writing it. Never create a directory named .agents. Do not read or write 50_Archive. Do not create inbox, clipping or transcript folders. Be direct and specific in everything you write.

End with a report: files changed, checks run and their results, anything unverified, and extras worth doing later.
</pasted_content id="be4e">




<pasted_content id="be4e">
Task: build the Monthly dashboard and the Map canvas. Read Spec - Home and Monthly Dashboards, the Streak Rule standard, 00_Live/Map.md, Finance Tracker, Health Tracker and the latest notes in 00_Live/Enumerate/Monthly.

Create the Monthly dashboard with the blocks in the spec: month heatmap and grade, failure causes counted from cause tags, month plan and goals, finance snapshot, health trend, system overview (embed the latest Jarvis snapshot note in 60_Jarvis if one exists, otherwise show a plain "no snapshot yet" line) and links to previous months. Keep the visual language of Home and the single-column phone layout. Then create the Map canvas using the json-canvas skill: domain nodes for Morning, Study, Fitness, Mind, Career, Health, Finance, Learning and Systems, with real edges to goals and the notes that own them. Validate the canvas JSON and confirm every edge references existing nodes.

Check the Monthly numbers against the streak script output for the same month. Do not set either file as the homepage. Stop when both render.
</pasted_content id="be4e">


## Claude

I'll start with the hub and the notes the task names.

Let me read B7 in Prompts, the Monthly Review standard, the Front End note, and the Home visual language.

Status: I've read the spec, rules and engine source. Next I'll check which notes can own the canvas goals, then write the dashboard and the canvas.

### Tool Calls

- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\AGENTS.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Dashboards Hub.md`
- `Glob` -- pattern `**/Spec - Home and Monthly Dashboards*` path ` `
- `Glob` -- pattern `**/Streak Rule*` path ` `
- `Glob` -- pattern `00_Live/**/*.md` path ` `
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Spec - Home and Monthly Dashboards.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\30_Order\Standards\Dashboards\Streak Rule.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\00_Live\Map.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\00_Live\Tracking\Habits\Finance Tracker.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\00_Live\Tracking\Habits\Health Tracker.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\00_Live\Enumerate\Monthly\2026-10.md`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls .obsidian/plugins | head -50; ls .obsidian/plugins/the-plan-dashboard 2>/dev/null; ls .obsidian/snippets 2>/dev/null; ls 40_Resources/Obsidian/Dashboards 40_Resources/Obsidian/Dashboards/* | head -60; ls 60_Jarvis | head -30; ls 00_Live/Enumerate/Monthly 00_Live/Enumerate/Daily | head -80
```
```
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
obsidian-hover-editor
obsidian-kanban
obsidian-latex-suite
obsidian-local-rest-api
obsidian-meta-bind-plugin
obsidian-spaced-repetition
obsidian-style-settings
obsidian-tasks-plugin
omnisearch
periodic-notes
quickadd
readwise-official
recent-edits
recent-files-obsidian
templater-obsidian
text-extractor
the-plan-dashboard
url-into-selection
main.js
manifest.json
styles.css
dashboard.css
headerspace.css
myedits.css
rainbowfile_colors.css
readingview.css
40_Resources/Obsidian/Dashboards/Build Plan.md
40_Resources/Obsidian/Dashboards/Dashboards Hub.md
40_Resources/Obsidian/Dashboards/Decisions Log.md
40_Resources/Obsidian/Dashboards/Prompts.md
40_Resources/Obsidian/Dashboards/Research - Jarvis Dashboard Findings.md
40_Resources/Obsidian/Dashboards/Research - Platform Facts.md
40_Resources/Obsidian/Dashboards/Spec - AI Loop.md
40_Resources/Obsidian/Dashboards/Spec - Automation Layers.md
40_Resources/Obsidian/Dashboards/Spec - Home and Monthly Dashboards.md
40_Resources/Obsidian/Dashboards/Spec - Streak and Daily Note.md

40_Resources/Obsidian/Dashboards:
Build Plan.md
Daily
Dashboard Build
Dashboards Hub.md
Decisions Log.md
Prompts.md
Research - Jarvis Dashboard Findings.md
Research - Platform Facts.md
Spec - AI Loop.md
Spec - Automation Layers.md
Spec - Home and Monthly Dashboards.md
Spec - Streak and Daily Note.md

40_Resources/Obsidian/Dashboards/Daily:

40_Resources/Obsidian/Dashboards/Dashboard Build:
Architecture.md
Build Log.md
Build Prompts.md
Build Steps.md
Dashboard Build Hub.md
Front End and Visual System.md
Plugin Build Prompts.md
Private Use and Sharing.md
Reference - Obsidian API for This Build.md
Research - Obsidian Dashboard Methods.md
Research - Plugin Creation Guide.md
Review - Corrections to Earlier Notes.md
Sonnet 5.5 Prompt Rules.md
Verification and Risks.md
00_Control_Center
01_Prompt_Library
10_Promoted_Notes
20_Decisions
30_AI_Information
40_Archive
50_Reviews
60_Jarvis Board.md
AI_CONTEXT.md
README.md
00_Live/Enumerate/Daily:
2025-12-22.md
2025-12-24.md
2026-03-01.md
2026-03-17.md
2026-03-19.md
2026-03-20.md
2026-03-21.md
2026-03-23.md
2026-03-25.md
2026-04-05.md
2026-04-06.md
2026-04-07.md
2026-04-08.md
2026-04-10.md
2026-04-16.md
2026-04-17.md
2026-05-09.md
2026-05-22.md
2026-05-24.md
2026-06-01.md
2026-06-04.md
2026-06-11.md
2026-06-13.md
2026-07-01.md
2026-07-08.md
2026-09-26.md
2026-10-05.md
2026-10-12.md

00_Live/Enumerate/Monthly:
2025-12.md
2026-01.md
2026-03.md
2026-06.md
2026-10.md
```
- `Grep` -- pattern `Monthly (dashboard|view|page)|Monthly\.md|Map\.canvas|Map canvas` path `D:\_Anant\20_Progress\Documents\The Plan`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Prompts.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\30_Order\Standards\Dashboards\Monthly Review.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Dashboard Build\Front End and Visual System.md`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .obsidian/community-plugins.json; echo; grep -o '"enableDataviewJs"[^,]*\|"enableInlineDataviewJs"[^,]*\|"refreshInterval"[^,]*\|"refreshEnabled"[^,]*' .obsidian/plugins/dataview/data.json; echo ---; ls 60_Jarvis/10_Promoted_Notes; find 60_Jarvis -iname '*snapshot*'; echo ---; node 30_Order/System/plan-cli/plan-cli.cjs review 2026-10 --dir 00_Live/Enumerate/Daily
```
```
[
  "code-styler",
  "dataview",
  "file-explorer-plus",
  "lazy-plugins",
  "ninja-cursor",
  "obsidian-latex-suite",
  "obsidian-style-settings",
  "obsidian-tasks-plugin",
  "recent-files-obsidian",
  "templater-obsidian",
  "url-into-selection",
  "obsidian-local-rest-api",
  "homepage",
  "the-plan-dashboard"
]
"refreshEnabled": true
"refreshInterval": 2500
"enableDataviewJs": true
"enableInlineDataviewJs": true
---
Promoted From Jarvis Index.md
Promotion Criteria.md
Sync Candidate Queue.md
60_Jarvis/20_Decisions/Rollback and Snapshots
60_Jarvis/20_Decisions/Rollback and Snapshots/Jarvis Snapshot Register.md
60_Jarvis/30_AI_Information/Rollback and Snapshots
---
{"label":"2026-10","counted":0,"met":0,"percent":null,"grade":null,"missDays":[],"kind":"month","start":"2026-10-01","end":"2026-10-31","today":"2026-10-14","includeToday":false,"partial":true,"firstDay":null,"streak":{"current":0,"best":0,"atRisk":false},"causes":[],"noCause":0,"unknownCauses":[],"costliest":null,"trendPoints":null,"days":[{"date":"2026-10-01","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-02","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-03","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-04","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-05","hasNote":true,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-06","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-07","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-08","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-09","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-10","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-11","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-12","hasNote":true,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-13","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"before-first-day"},{"date":"2026-10-14","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"today"},{"date":"2026-10-15","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-16","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-17","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-18","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-19","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-20","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-21","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-22","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-23","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-24","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-25","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-26","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-27","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-28","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-29","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-30","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"},{"date":"2026-10-31","hasNote":false,"categories":0,"status":"NOT_COUNTED","why":"future"}],"previous":{"label":"2026-09","counted":0,"met":0,"percent":null,"grade":null,"missDays":[]},"snapshot":{"matches":[],"line":"requested, not present"},"entry":"### 2026-10\n\n- Days MET: no data\n- Grade: no data\n- Previous month: no data\n- MISS days: none\n- Streak: current 0, best 0 (engine, as of 2026-10-14)\n- Causes: none logged\n- Costliest cause: none\n- Jarvis snapshot: requested, not present"}
```
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\.obsidian\snippets\dashboard.css`
- `Glob` -- pattern `30_Order/Standards/Dashboards/Daily Note Schema.md` path ` `
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\30_Order\Standards\Dashboards\Daily Note Schema.md`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls 30_Order/System/streak/fixtures/sample 30_Order/System/plan-cli; cat 30_Order/System/streak/fixtures/sample/2026-03-04.md; echo ----; cat 30_Order/System/streak/fixtures/sample/2026-03-01.md; echo; grep -rl "cat::" 00_Live/Enumerate/Daily | head; grep -rn "cause::" 00_Live 30_Order/System/streak/fixtures | head
```
```
30_Order/System/plan-cli:
plan-cli.cjs

30_Order/System/streak/fixtures/sample:
2026-03-01.md
2026-03-02.md
2026-03-03.md
2026-03-04.md
2026-03-05.md
2026-03-07.md
2026-03-08.md
2026-03-09.md
2026-03-10.md
expected.json
---
type: daily
status: seed
created: 2026-03-04
study_hours: 0
---

## Targets

## Morning

- [x] I will move around at 8 am in my room so that I can become a morning person. [cat:: morning]
- [x] I will read 12 pages in the morning at my desk so that I can become a reader. [cat:: morning]
- [x] I will plan the day for 20 minutes at 9 am at my desk so that I can become organised. [cat:: morning]

## Study

- [x] I will study at 2 pm at my desk so that I can become a learner. [cat:: study]

## Fitness

- [ ] I will train at 5:30 pm in the gym so that I can become an athlete. [cat:: fitness]
- [ ] I will drink 3L of water and take creatine at 6 pm at home so that I can become healthy. [cat:: fitness]

## Mind

- [ ] I will choose mindset content over doomscrolling at 10 pm in bed so that I can become calm. [cat:: mind]
- [ ] I will not smoke before planning, breakfast and the first task at 8 am at home so that I can become a non-smoker. [cat:: mind]

## Career

- [ ] I will do the career task from Targets at 4 pm at my desk so that I can become employable. [cat:: career]

## Evening close

## Next actions

## Intake
----
---
type: daily
status: seed
created: 2026-03-01
study_hours: 0
---

## Targets

## Morning

- [x] I will move around at 8 am in my room so that I can become a morning person. [cat:: morning]
- [x] I will read 12 pages in the morning at my desk so that I can become a reader. [cat:: morning]
- [x] I will plan the day for 20 minutes at 9 am at my desk so that I can become organised. [cat:: morning]

## Study

- [x] I will study at 2 pm at my desk so that I can become a learner. [cat:: study]

## Fitness

- [x] I will train at 5:30 pm in the gym so that I can become an athlete. [cat:: fitness]
- [x] I will drink 3L of water and take creatine at 6 pm at home so that I can become healthy. [cat:: fitness]

## Mind

- [ ] I will choose mindset content over doomscrolling at 10 pm in bed so that I can become calm. [cat:: mind]
- [ ] I will not smoke before planning, breakfast and the first task at 8 am at home so that I can become a non-smoker. [cat:: mind]

## Career

- [ ] I will do the career task from Targets at 4 pm at my desk so that I can become employable. [cat:: career]

## Evening close

## Next actions

## Intake
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && ls; ls src src/* | head -60; ls node_modules 2>/dev/null | grep -i -E "^(jsdom|happy-dom|linkedom)$"
```
```
dist
esbuild.config.mjs
main.js
manifest.json
node_modules
package.json
package-lock.json
scripts
src
styles.css
tests
tsconfig.json
version-bump.mjs
versions.json
src/main.ts
src/settings.ts

src:
cli
core
data
hooks
main.ts
settings.ts
ui
view

src/cli:
common.ts
plan-cli.ts
streak-cli.ts

src/core:
close.ts
config.ts
dates.ts
grade.ts
jarvis.ts
model.ts
parse.ts
periods.ts
review.ts
sections.ts
streak.ts
tables.ts
toggle.ts
validate.ts

src/data:
repo.ts
write.ts

src/hooks:
dailyValidator.ts
paths.ts
secretsGuard.ts
types.ts
writeGuard.ts

src/ui:
App.tsx
charts.tsx
hooks.ts
sections.tsx
styles.ts

src/view:
DashboardView.tsx
jsdom
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/core" && cat streak.ts review.ts grade.ts parse.ts config.ts
```
```
import { CONFIG } from "./config";
import { toIso, toNum } from "./dates";

export interface DayInput {
	/** Categories done on that date. */
	done: number;
	/** The note has at least one action with a known category field. */
	hasActions: boolean;
}

export interface DayCell {
	date: string;
	hasNote: boolean;
	count: number;
	isToday: boolean;
	forgiven: boolean;
}

export interface StreakResult {
	current: number;
	best: number;
	todayDone: number;
	todayMet: boolean;
	atRisk: boolean;
	firstDay: string | null;
	next: { target: number; daysToGo: number } | null;
	days: DayCell[];
}

/**
 * The rule in 30_Order/Standards/Dashboards/Streak Rule.md. The script streak.py is canonical and this
 * function must give the same numbers. The caller passes today's date, so no clock is read here.
 */
export function computeStreak(
	days: ReadonlyMap<string, DayInput>,
	today: string,
	floor: number = CONFIG.floor,
): StreakResult {
	const todayN = toNum(today);
	const nums = new Map<number, DayInput>();
	let first: number | null = null;
	for (const [date, input] of days) {
		const n = toNum(date);
		nums.set(n, input);
		if (n <= todayN && input.hasActions && (first === null || n < first)) first = n;
	}
	const done = (n: number) => nums.get(n)?.done ?? 0; // a missing note counts as MISS

	let run = 0;
	let best = 0;
	let prevMiss = false;
	if (first !== null) {
		for (let n = first; n <= todayN - 1; n++) {
			if (done(n) >= floor) {
				run += 1;
				best = Math.max(best, run);
				prevMiss = false;
			} else if (prevMiss) {
				run = 0; // second miss in a row
				prevMiss = false;
			} else {
				prevMiss = true; // forgiven for now
			}
		}
	}

	const todayDone = done(todayN);
	const todayMet = todayDone >= floor;
	const current = run + (todayMet ? 1 : 0);

	const target = CONFIG.milestones.find((m) => m > current);
	const cells: DayCell[] = [];
	for (let i = 0; i < CONFIG.heatDays; i++) {
		const n = todayN - (CONFIG.heatDays - 1) + i;
		const has = nums.has(n);
		const count = done(n);
		const forgiven =
			n < todayN &&
			has &&
			count < floor &&
			first !== null &&
			n - 1 >= first &&
			done(n - 1) >= floor &&
			done(n + 1) >= floor;
		cells.push({ date: toIso(n), hasNote: has, count, isToday: n === todayN, forgiven });
	}

	return {
		current,
		best,
		todayDone,
		todayMet,
		atRisk: prevMiss && !todayMet,
		firstDay: first === null ? null : toIso(first),
		next: target === undefined ? null : { target, daysToGo: target - current },
		days: cells,
	};
}
import { CATEGORIES, CONFIG } from "./config";
import { misses } from "./close";
import { addDays } from "./dates";
import { letter, percent } from "./grade";
import { categoriesDone, parseActions } from "./parse";
import { previousPeriod, type Period } from "./periods";
import { computeStreak, type DayInput } from "./streak";

export type DayStatus = "MET" | "MISS" | "NOT_COUNTED";

export interface ReviewDay {
	date: string;
	hasNote: boolean;
	categories: number;
	/** MET or MISS for a counted date. NOT_COUNTED for a date before the first counted day, today (unless included) or the future. */
	status: DayStatus;
	why?: "before-first-day" | "today" | "future";
}

export interface PeriodScore {
	label: string;
	counted: number;
	met: number;
	percent: number | null;
	grade: string | null;
	missDays: string[];
	days: ReviewDay[];
}

export interface CauseCount {
	cause: string;
	count: number;
}

export interface Review extends PeriodScore {
	kind: Period["kind"];
	start: string;
	end: string;
	today: string;
	includeToday: boolean;
	/** True when the period has dates that are not counted because they are today or later. */
	partial: boolean;
	firstDay: string | null;
	streak: { current: number; best: number; atRisk: boolean };
	causes: CauseCount[];
	/** Missed categories logged with no cause. */
	noCause: number;
	/** Cause tags found that are not in the allowed list. */
	unknownCauses: string[];
	costliest: { cause: string; count: number; categories: { category: string; count: number }[] } | null;
	previous: PeriodScore | null;
	/** Percent points, signed. Null when either period has no counted days. */
	trendPoints: number | null;
}

interface Prepared {
	texts: ReadonlyMap<string, string>;
	done: Map<string, number>;
	firstDay: string | null;
	streak: ReturnType<typeof computeStreak>;
}

function prepare(texts: ReadonlyMap<string, string>, today: string): Prepared {
	const inputs = new Map<string, DayInput>();
	const done = new Map<string, number>();
	for (const [date, text] of texts) {
		const actions = parseActions(text);
		const n = categoriesDone(actions);
		done.set(date, n);
		inputs.set(date, { done: n, hasActions: actions.length > 0 });
	}
	const streak = computeStreak(inputs, today);
	return { texts, done, firstDay: streak.firstDay, streak };
}

function score(p: Prepared, period: Period, today: string, includeToday: boolean): PeriodScore {
	const lastCounted = includeToday ? today : addDays(today, -1);
	const days: ReviewDay[] = period.dates.map((date) => {
		const hasNote = p.texts.has(date);
		const categories = p.done.get(date) ?? 0;
		if (date > lastCounted) return { date, hasNote, categories, status: "NOT_COUNTED", why: date === today ? "today" : "future" };
		if (p.firstDay === null || date < p.firstDay) return { date, hasNote, categories, status: "NOT_COUNTED", why: "before-first-day" };
		return { date, hasNote, categories, status: categories >= CONFIG.floor ? "MET" : "MISS" };
	});
	const counted = days.filter((d) => d.status !== "NOT_COUNTED");
	const met = counted.filter((d) => d.status === "MET").length;
	const pct = percent(met, counted.length);
	return {
		label: period.label,
		counted: counted.length,
		met,
		percent: pct,
		grade: letter(pct),
		missDays: counted.filter((d) => d.status === "MISS").map((d) => d.date),
		days,
	};
}

/**
 * One review of a week or a month. Counts come from the same parse and streak code as the dashboard.
 * A date is counted only if it is on or after the first counted day and before today. Today is counted
 * only when `includeToday` is set, for a review run after the evening close.
 */
export function buildReview(
	texts: ReadonlyMap<string, string>,
	period: Period,
	today: string,
	opts: { includeToday?: boolean } = {},
): Review {
	const includeToday = opts.includeToday === true;
	const p = prepare(texts, today);
	const main = score(p, period, today, includeToday);

	const tally = new Map<string, number>();
	const byCause = new Map<string, Map<string, number>>();
	let noCause = 0;
	for (const d of main.days) {
		if (d.status === "NOT_COUNTED") continue;
		for (const m of misses(texts.get(d.date) ?? "")) {
			if (m.cause === null) {
				noCause++;
				continue;
			}
			tally.set(m.cause, (tally.get(m.cause) ?? 0) + 1);
			const cats = byCause.get(m.cause) ?? new Map<string, number>();
			cats.set(m.category, (cats.get(m.category) ?? 0) + 1);
			byCause.set(m.cause, cats);
		}
	}
	const order = (c: string) => {
		const i = (CONFIG.causes as readonly string[]).indexOf(c);
		return i === -1 ? 99 : i;
	};
	const causes = [...tally].map(([cause, count]) => ({ cause, count })).sort((a, b) => b.count - a.count || order(a.cause) - order(b.cause));
	const top = causes[0];
	const prevScore = score(p, previousPeriod(period), today, includeToday);
	const trend = main.percent !== null && prevScore.percent !== null ? main.percent - prevScore.percent : null;

	return {
		...main,
		kind: period.kind,
		start: period.start,
		end: period.end,
		today,
		includeToday,
		partial: main.days.some((d) => d.why === "today" || d.why === "future"),
		firstDay: p.firstDay,
		streak: { current: p.streak.current, best: p.streak.best, atRisk: p.streak.atRisk },
		causes,
		noCause,
		unknownCauses: causes.map((c) => c.cause).filter((c) => !(CONFIG.causes as readonly string[]).includes(c)),
		costliest: top
			? {
					cause: top.cause,
					count: top.count,
					categories: [...(byCause.get(top.cause) ?? new Map<string, number>())]
						.map(([category, count]) => ({ category, count }))
						.sort((a, b) => b.count - a.count || CATEGORIES.indexOf(a.category as never) - CATEGORIES.indexOf(b.category as never)),
				}
			: null,
		previous: prevScore,
		trendPoints: trend,
	};
}

const pctText = (s: PeriodScore) => (s.percent === null ? "no data" : `${s.met} of ${s.counted} (${s.percent}%)`);

/** The numeric lines of a Review Log entry, in the format the standards define. Keep, stop, start and decision are added by the reviewer. */
export function renderEntry(r: Review, snapshotLine?: string): string {
	const out = [`### ${r.label}`, ""];
	out.push(`- Days MET: ${pctText(r)}${r.partial && r.counted > 0 ? `. ${r.counted} days passed` : ""}`);
	out.push(`- Grade: ${r.grade ?? "no data"}`);
	if (r.kind === "month") {
		const t = r.trendPoints === null ? "" : `. Trend: ${r.trendPoints >= 0 ? "+" : ""}${r.trendPoints} points`;
		out.push(`- Previous month: ${r.previous === null || r.previous.percent === null ? "no data" : pctText(r.previous)}${t}`);
	}
	out.push(`- MISS days: ${r.missDays.length === 0 ? "none" : r.missDays.join(", ")}`);
	out.push(`- Streak: current ${r.streak.current}, best ${r.streak.best} (engine, as of ${r.today})`);
	const parts = r.causes.map((c) => `${c.cause} ${c.count}`);
	if (r.noCause > 0) parts.push(`no cause logged ${r.noCause}`);
	out.push(`- Causes: ${parts.length === 0 ? "none logged" : parts.join(", ")}`);
	if (r.kind === "month") {
		const c = r.costliest;
		out.push(
			`- Costliest cause: ${c ? `${c.cause}, in ${c.categories.map((x) => `${x.category} (${x.count})`).join(" and ")}` : "none"}`,
		);
		out.push(`- Jarvis snapshot: ${snapshotLine ?? "requested, not present"}`);
	}
	return out.join("\n");
}
import { CONFIG } from "./config";

export function percent(met: number, counted: number): number | null {
	return counted === 0 ? null : Math.round((100 * met) / counted);
}

/** Letter for a percent, from the bands in config. Null when nothing was counted. */
export function letter(pct: number | null, bands: readonly { min: number; letter: string }[] = CONFIG.gradeBands): string | null {
	if (pct === null) return null;
	return bands.find((b) => pct >= b.min)?.letter ?? null;
}
import { CATEGORIES, type Category } from "./config";

// Same pattern as 30_Order/System/streak/streak.py, which is the canonical implementation.
const ACTION = /^\s*[-*+]\s+\[(.)\]\s.*\[cat::\s*([A-Za-z]+)\s*\]/;

export interface Action {
	/** Index in text.split("\n"). The toggle uses the same indexing. */
	line: number;
	/** The line as written, without a trailing carriage return. */
	text: string;
	category: Category;
	done: boolean;
}

export function parseActions(text: string): Action[] {
	const out: Action[] = [];
	const lines = text.split("\n");
	for (let i = 0; i < lines.length; i++) {
		const raw = (lines[i] ?? "").replace(/\r$/, "");
		const m = ACTION.exec(raw);
		if (!m) continue;
		const category = (m[2] ?? "").toLowerCase();
		if (!(CATEGORIES as readonly string[]).includes(category)) continue;
		out.push({ line: i, text: raw, category: category as Category, done: m[1] === "x" || m[1] === "X" });
	}
	return out;
}

/** A category is done only with at least one action and every action ticked. */
export function categoriesDone(actions: readonly Action[]): number {
	let n = 0;
	for (const cat of CATEGORIES) {
		const own = actions.filter((a) => a.category === cat);
		if (own.length > 0 && own.every((a) => a.done)) n++;
	}
	return n;
}
export const CATEGORIES = ["morning", "study", "fitness", "mind", "career"] as const;
export type Category = (typeof CATEGORIES)[number];

export const CATEGORY_LABEL: Record<Category, string> = {
	morning: "Morning",
	study: "Study",
	fitness: "Fitness",
	mind: "Mind",
	career: "Career",
};

/** Everything personal lives here so no function hard-codes a path or a number. */
export const CONFIG = {
	floor: 3,
	milestones: [3, 7, 21, 66, 100],
	/** Level title per milestone (Decision 41). Shown by the dashboard when the Home view is next changed. */
	milestoneTitles: { 3: "The beginning", 7: "Toward 21", 21: "Now it gets hard", 66: "Work pays off", 100: "Consistency, discipline, mindset" } as Record<number, string>,
	heatDays: 30,
	dailyFolder: "00_Live/Enumerate/Daily",
	monthlyFolder: "00_Live/Enumerate/Monthly",
	yearlyFolder: "00_Live/Enumerate/Yearly",
	health: "00_Live/Tracking/Habits/Health Tracker.md",
	finance: "00_Live/Tracking/Habits/Finance Tracker.md",
	weeklyFolder: "00_Live/Enumerate/Weekly",
	promotedFolder: "60_Jarvis/10_Promoted_Notes",
	/** Cause tags a missed category may carry. A new tag needs a Decisions Log entry first. */
	causes: ["sleep", "no-plan", "distracted", "energy", "other"],
	/** Types a next action may carry. */
	nextTypes: ["streak", "career", "gym", "failure"],
	maxNextActions: 5,
	/** Letter bands for weekly and monthly percent. First band whose min the percent reaches wins. */
	gradeBands: [
		{ min: 90, letter: "A" },
		{ min: 75, letter: "B" },
		{ min: 60, letter: "C" },
		{ min: 40, letter: "D" },
		{ min: 0, letter: "F" },
	],
	links: [
		{ label: "Life OS", path: "00_Live/Life OS.md" },
		{ label: "Streak rule", path: "30_Order/Standards/Dashboards/Streak Rule.md" },
		{ label: "Daily schema", path: "30_Order/Standards/Dashboards/Daily Note Schema.md" },
		{ label: "Hub", path: "40_Resources/Obsidian/Dashboards/Dashboards Hub.md" },
	],
} as const;
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/core" && cat close.ts | head -80; cat periods.ts dates.ts; grep -n "today\|include" ../cli/plan-cli.ts | head -40; cd ../.. && git status --short 2>/dev/null | head -3
```
```
import { CONFIG } from "./config";
import { section } from "./sections";

export interface Miss {
	category: string;
	cause: string | null;
}

/** `- [miss:: morning] [cause:: sleep]` lines under `## Evening close`. A miss without a cause has cause null. */
export function misses(text: string): Miss[] {
	const out: Miss[] = [];
	for (const raw of section(text, "Evening close")) {
		// The template carries a %% comment that shows an example miss line. It is not a miss.
		const line = raw.replace(/%%.*?%%/g, "").replace(/%%.*$/, "");
		const m = /\[miss::\s*([A-Za-z-]+)\s*\]/.exec(line);
		if (!m) continue;
		const c = /\[cause::\s*([A-Za-z-]+)\s*\]/.exec(line);
		out.push({ category: (m[1] ?? "").toLowerCase(), cause: c ? (c[1] ?? "").toLowerCase() : null });
	}
	return out;
}

export interface NextLine {
	line: number;
	text: string;
	type: string;
}

/** Every bullet under `## Next actions`, with no cap, so the validator can count past five. */
export function nextLines(text: string): NextLine[] {
	const out: NextLine[] = [];
	let on = false;
	const lines = text.split("\n");
	for (let i = 0; i < lines.length; i++) {
		const raw = (lines[i] ?? "").replace(/\r$/, "");
		if (/^##\s/.test(raw)) {
			on = raw.replace(/^##\s+/, "").trim().toLowerCase() === "next actions";
			continue;
		}
		if (!on) continue;
		const m = /^\s*[-*+]\s+(?:\[.\]\s+)?(.*)$/.exec(raw);
		const body = m?.[1]?.trim();
		if (!body || body.startsWith("%%")) continue;
		const type = /\[type::\s*([A-Za-z-]+)\s*\]/.exec(body)?.[1]?.toLowerCase() ?? "";
		out.push({ line: i, text: body.replace(/\[[A-Za-z-]+::[^\]]*\]/g, "").trim(), type });
	}
	return out;
}

/** Lowercase, drop every character that is not a letter, digit or space, collapse spaces. */
export function normalizeAction(text: string): string {
	return text
		.replace(/\[type::[^\]]*\]\s*$/, "")
		.toLowerCase()
		.replace(/[^a-z0-9 ]/g, "")
		.replace(/\s+/g, " ")
		.trim();
}

export interface RepeatCheck {
	accepted: string[];
	rejected: { text: string; reason: "repeat" | "over-limit" | "duplicate-in-list" | "empty"; matches?: string }[];
}

/** Applies the next action rules: at most five, none equal to a line of the previous day, no duplicates inside the list. */
export function checkNextActions(proposed: readonly string[], previous: readonly string[]): RepeatCheck {
	const prev = new Map(previous.map((p) => [normalizeAction(p), p] as const));
	const seen = new Set<string>();
	const res: RepeatCheck = { accepted: [], rejected: [] };
	for (const raw of proposed) {
		const text = raw.replace(/^\s*[-*+]\s+/, "").trim();
		const key = normalizeAction(text);
		if (!key) res.rejected.push({ text, reason: "empty" });
		else if (prev.has(key)) res.rejected.push({ text, reason: "repeat", matches: prev.get(key) as string });
		else if (seen.has(key)) res.rejected.push({ text, reason: "duplicate-in-list" });
		else if (res.accepted.length >= CONFIG.maxNextActions) res.rejected.push({ text, reason: "over-limit" });
		else {
			seen.add(key);
			res.accepted.push(text);
		}
import { addDays, isIsoDate, toIso, toNum } from "./dates";

export type PeriodKind = "week" | "month";

export interface Period {
	kind: PeriodKind;
	/** `YYYY-Www` for a week, `YYYY-MM` for a month. */
	label: string;
	start: string;
	end: string;
	/** Every ISO date from start to end. */
	dates: string[];
}

/** Monday is 0. Day number 0 is Thursday 1970-01-01. */
function weekday(n: number): number {
	return (((n + 3) % 7) + 7) % 7;
}

/** ISO week label of a calendar date, for example `2026-W10`. */
export function isoWeekLabel(iso: string): string {
	const n = toNum(iso);
	const thursday = n - weekday(n) + 3;
	const year = Number(toIso(thursday).slice(0, 4));
	const week = Math.floor((thursday - toNum(`${year}-01-01`)) / 7) + 1;
	return `${year}-W${String(week).padStart(2, "0")}`;
}

function range(start: string, end: string): string[] {
	const out: string[] = [];
	for (let n = toNum(start); n <= toNum(end); n++) out.push(toIso(n));
	return out;
}

/** Parse `YYYY-Www` or `YYYY-MM`. Returns null for anything else, or for a week or month that does not exist. */
export function parsePeriod(label: string): Period | null {
	const w = /^(\d{4})-W(\d{2})$/.exec(label);
	if (w) {
		const year = Number(w[1]);
		const week = Number(w[2]);
		const jan4 = toNum(`${year}-01-04`); // January 4 is always in week 1
		const start = toIso(jan4 - weekday(jan4) + 7 * (week - 1));
		if (week < 1 || isoWeekLabel(start) !== label) return null;
		const end = addDays(start, 6);
		return { kind: "week", label, start, end, dates: range(start, end) };
	}
	const m = /^(\d{4})-(\d{2})$/.exec(label);
	if (m) {
		const year = Number(m[1]);
		const month = Number(m[2]);
		if (month < 1 || month > 12) return null;
		const start = `${m[1]}-${m[2]}-01`;
		const nextYear = month === 12 ? year + 1 : year;
		const nextMonth = month === 12 ? 1 : month + 1;
		const end = addDays(`${nextYear}-${String(nextMonth).padStart(2, "0")}-01`, -1);
		return { kind: "month", label, start, end, dates: range(start, end) };
	}
	return null;
}

export function previousPeriod(p: Period): Period {
	if (p.kind === "week") return parsePeriod(isoWeekLabel(addDays(p.start, -1))) as Period;
	return parsePeriod(addDays(p.start, -1).slice(0, 7)) as Period;
}

/** The period that contains `today`, used when a review is run with no label. */
export function currentPeriod(kind: PeriodKind, today: string): Period {
	if (!isIsoDate(today)) throw new Error(`not an ISO date: ${today}`);
	return parsePeriod(kind === "week" ? isoWeekLabel(today) : today.slice(0, 7)) as Period;
}
const DAY_MS = 86_400_000;

/** Calendar date string to a whole day number. UTC math, so daylight saving cannot shift a day. */
export function toNum(iso: string): number {
	const [y, m, d] = iso.split("-").map(Number);
	return Math.round(Date.UTC(y ?? 0, (m ?? 1) - 1, d ?? 1) / DAY_MS);
}

export function toIso(n: number): string {
	return new Date(n * DAY_MS).toISOString().slice(0, 10);
}

export function isIsoDate(s: string): boolean {
	return /^\d{4}-\d{2}-\d{2}$/.test(s) && toIso(toNum(s)) === s;
}

export function addDays(iso: string, n: number): string {
	return toIso(toNum(iso) + n);
}

/** Local calendar date. The rollover is local midnight. */
export function localIso(d: Date): string {
	const p = (n: number) => String(n).padStart(2, "0");
	return `${d.getFullYear()}-${p(d.getMonth() + 1)}-${p(d.getDate())}`;
}
23:  day <dailyFolder> <YYYY-MM-DD> [--today YYYY-MM-DD]     categories, targets, misses and next actions of one note
24:  review <week|month|YYYY-Www|YYYY-MM> --dir <dailyFolder> [--today YYYY-MM-DD] [--include-today] [--promoted <folder>]
36:		if (a === "--include-today") on.add("include-today");
55:function today(opt: Map<string, string>): string {
56:	const t = opt.get("today") ?? localIso(new Date());
72:		.filter((n) => n.toLowerCase().endsWith(".md") && n.toLowerCase().includes("snapshot") && n.includes(month))
80:	if (!dir || !what) fail("usage: review <week|month|label> --dir <dailyFolder> [--today D] [--include-today] [--promoted <folder>]", 2);
82:	const t = today(opt);
85:	const review = buildReview(loadTexts(dir), period, t, { includeToday: on.has("include-today") });
105:	if (!folder || !date || !isIsoDate(date)) fail("usage: day <dailyFolder> <YYYY-MM-DD> [--today D]", 2);
107:	const now = today(opt);
114:	const done = m.streak.todayDone;
 M src/core/config.ts
 M src/core/streak.ts
 M tests/engine.test.ts
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && ls 00_Live 00_Live/Career 00_Live/Career/* 00_Live/Tracking 00_Live/Tracking/* 00_Live/Books | head -80; echo ----; cat "00_Live/Enumerate/Yearly/Resolutions '26.md" | head -60; echo ----; sed -n 1,60p 00_Live/Life\ OS.md; ls 30_Order/Workflows/Agentic\ OS | head
```
```
00_Live/Tracking/Relationship Log.md

00_Live:
Books
Career
Enumerate
Headway
Health & Life
Life OS.md
Map.md
Tracking

00_Live/Books:
Atomic Habits.md
Easy Way to Quit Smoking.md
Essentialism.md
Psycho-Cybernetics.md

00_Live/Career:
Finance
Mentors
SWE

00_Live/Career/Finance:
Bank Accounts.md
Stocks.md

00_Live/Career/Mentors:

00_Live/Career/SWE:
AI

00_Live/Tracking:
Finance
Habits
Meals
Plans
Relationship Log.md

00_Live/Tracking/Finance:
September 2026.md

00_Live/Tracking/Habits:
Daily Habit Board.md
Finance Tracker.md
Habits Scorecard.md
Habits Stacking.md
Habits.md
Health Tracker.md

00_Live/Tracking/Meals:
Groceries List.md

00_Live/Tracking/Plans:
Summer Grind.md
Winter Break.md
----
---
type: thought
thought_kind: reflection
status: seed
created: 2026-01-01
related_progress:
  - "[[2026]]"
tags:
  - thought
next: "[[2026]]"
---
# Development 
*It's not about the goal, it's about the journey till there. No matter how many times you trip, there is just always going to be your better self standing in front of you. So, you have to get up.*
## Year
1. *4.0 GPA*: Join a club, do summer courses, minor in entrepreneurship, get a better student job, do something away from college: profile build up or money build up or both.
2. *Land a really insane internship*: Make your portfolio, build multiple projects(at least 3), reach out to employers, make connections, attend events, MN cup.
3. *Second Brain*: Figure out a way to document and map your thoughts, day, learnings, goals in detail. We have established the base of the second brain now all you've got to do is keep expanding the brain. We could figure out where to link everything at the end of each month.
4. *Find multiple people you look up to*: You want to follow their lifestyle, values, ideologies, routine, roadmap to success. Form your own principles, discipline and manner to live.
5. *Puru*: 1 yr 6 months till you see her and 6 months are over. U have the most precious girl you could probably ask for, you know better than to fuck it up. Stop running away from your feelings, scenarios, be a bloody man and own up to your shit. Be there.
6. *Learn multiple new things*: You better be playing the guitar fluently by the end of '26. Reading as a hobby, Headway usage to the max, make it a habit to learn new things every single day. 
7. *Character development*: Get better at communication, leadership skills, pushing yourself in situations that are highly uncomfortable, not running away from your thoughts and feelings.
8. *Stop smoking*: It's been 4 years since you have been smoking, it's been 2 years of smoking weed and for every single day it's been a year. You were coughing black tar at the end of december, it's about time. Take measures to improve your health you have damaged in over 4 years of immense body damage.
9. *Gym*: I believe you have been dreaming about getting jacked for a long while, about time you go ahead and do it yea? 5 days a week, calisthenics, warmups, cooldowns, flexibility, stamina, abs. I want to be doing L-sit, flag, handstand, muscle ups, one hand pull up, etc. Cardio is as important as warming up before gym, the destroyed lungs need to start healing.
10. *Cooking*: Don't you think your doordash bills have costed the same about the weed that you bought in '25. Last i remember you didn't even work. You about to become one of the best chefs in your house like ma. 
11. *Finances*: Manage your spendings, track them and understand the concept of investing money. Stocks, trading, investments.
12. ----
---
type: evergreen
status: sprout
created: 2026-07-03
updated: 2026-07-04
tags:
  - life
  - life-os
notes:
  - "[[00 - Summer Plans Index]]"
  - "[[01 - Daily Operating System]]"
  - "[[02 - Weekly Operating System]]"
  - "[[03 - Monthly & Phase Map]]"
  - "[[08 - Anti-Drift Rules]]"
  - "[[Summer Grind]]"
next: "Fill the baseline numbers this note flags as unknown: gym lifts, monthly spend, savings balance, mentor names"
---
# Life OS
The one note that says who Anant is right now, what each life domain actually looks like, and which rules govern the day. The plans in [[00 - Summer Plans Index]] say *what to do*; this note is the standing context they operate inside — read it and you don't need a cross-read to understand any single domain. Where the vault has no real data, this note says "unknown" and points at the tracker that should capture it. No invented baselines: an honest "not logged yet" is more useful than a made-up number, because the whole system is being built against a specific failure mode, and pretending progress exists is the exact thing that failure mode feeds on.
## Who, where, when
CS student at UMN, summer 2026. Physical timeline: **Dubai (18 May → 19 Jun) → Bangalore (20 Jun → ~20 Aug) → buffer (8 Aug → Sept 1) → back for the Sept 1 term.** Currently in the **Bangalore execution phase** — Dubai's job was installing the routine and front-loading the CSCI 2033 linear-algebra base; Bangalore's job is running the routine weekly with one flagship at a time; the buffer consolidates and ships what's half-done ([[03 - Monthly & Phase Map]]).
The honest self-diagnosis, straight from the phase map: infrastructure got built (Jarvis, MCPs, skills) but execution stalled — *"time went to tool-tinkering, not the projects."* Nothing has been shipped on the flagship projects since 17 May, and every tracker in the plan folder still reads mastery 0 / no rows logged. That is not a knowledge gap — the vault proves the reverse (a working MCP server, 13 skills, 5 agents). It is a convergence-and-execution gap. Everything below is structured against that one failure mode, which is why [[08 - Anti-Drift Rules]] bans MCP setup, agent authoring, and stack comparison from daily ops entirely, and why the [[The Output Audit (web)]] "is this effort actually compounding?" check is worth running monthly.
## The day, compressed
Five wins, each with an MVP so a low-energy day still counts ([[01 - Daily Operating System]]):

| Win | Full version | MVP (still counts) | Done when |
| --- | --- | --- | --- |
| **Physical** | Gym session (5×/week) | 20 pushups + 20 squats + 5 min stretch | Logged in [[Daily Habit Board]] |
| **Project** | 1 commit / 1 issue on the flagship | course/hackathon admin step (or skip in Dubai) | Evidence: commit hash, screenshot, note path |
| **Career** | LeetCode ≥5 | LeetCode 5 (no MVP discount) | Count + topics in Today note |
| **Cleanup** | one assignment OR inbox zero | smallest admin step (HIST dropbox, 1 WebAssign problem) | Artifact posted/filed |
| **Review** | full `/closeday` | 5-min end-of-day note | Today note's review block filled |
A day is **GREEN** at LeetCode ≥5 AND ≥4 of the other academic-stack rows met; the `/closeday` scorecard computes it and writes one friction fix on RED days. The Today note is the single source of "what now"; a tab-switch toward tool setup or optimization is the *named relapse cue* — the moment to return to the note, not chase the tab.
## Physical health
- **Routine:** gym or the calisthenics MVP, **5 days/week target**, logged via the habit checkboxes in the daily note (`habits_done`) and [[Daily Habit Board]]. The identity target (from [[Summer Grind]]) is "someone with a strong body and cool calisthenics skills" — the gym win is building toward a skill identity, not just attendance.
- **Day-shape anchor:** the physical block sits in the **evening** in the default Dubai day-shape (gym/food/cleanup/short review), after the deep-work and LeetCode blocks — so a slipped morning doesn't cost the workout.
- **Smoking — the keystone gate.** The rule is **no smoking before planning + breakfast + first task** — a harm-reduction gate tracked as a keystone on [[Daily Habit Board]], not yet a quit plan. Honest state: *frictioned, not eliminated.* The replacement protocol from [[Summer Grind]] (built on Allen Carr's *Easy Way to Quit Smoking* + [[Atomic Habits]]): a craving is a cue to **change state** — walk, shower, call someone, gym, cook, or read two pages — and the environment work is *invisible*: remove the morning cue, the stash, the rolling setup, and the smoking-first routine. Never Miss Twice applies here hardest: one slip is data, two in a row rebuilds the old loop.
- **Baselines (weight, working lifts, cardio capacity): unknown — never recorded in the vault.** The first entry goes in [[Health Tracker]]. Until a baseline exists, the "gym win" checkbox measures *attendance*, not *progress* — the whole reason the tracker exists is to convert attendance into a strength trend line.
## Finances
What the vault actually knows (from [[Bank Accounts]] and [[Stocks]], both captured 2026-03-16):
- **The intended money flow (mechanically):** income lands in **checking**; an automatic transfer moves a set amount checking → **savings**; a second fixed automatic transfer moves checking → **investing**; all card balances are **auto-paid from checking**; checking is used only for rent or places that don't take cards. "Automatic recurring buys" means the investing transfer and the fund purchase are *scheduled*, not decided monthly — the point is to remove the monthly deploy-or-hoard decision entirely, which is exactly the "capital paralysis" trap named in [[The Hidden Operating System Behind Every Income Ceiling (web)]].
- **The five tracked buckets (every month):** fixed bills · food/groceries · transport · shopping/fun · savings/investing. The monthly formula: **income − bills − spending − savings − investing = leftover.** Leftover persistently negative → cut the fun bucket first; persistently large → raise the automatic investing transfer.
- **Monthly review checklist** (the one day/month [[Bank Accounts]] prescribes, logged in [[Finance Tracker]]): write down income, total spent, total saved, total invested, card balance, checking balance, savings balance — then check each card statement was paid in full inside its window.
- **Card setup:** Capital One Savor Student — no annual fee; **3%** on dining, streaming, and regular grocery stores; **1%** at superstores like Walmart (use **OnePay** there instead); never cash advances; pay the statement balance in full inside the ~25-day window to avoid interest.
- **Investing stance:** emergency savings first, then broad index funds / ETFs with automatic recurring buys, held for years — explicitly *not trading*. The Trading domain in this vault ([[Stocks Trading AI Hub]]) is a research/engineering project and a portfolio artifact, **not where savings go** — keeping those two separate is a deliberate rule, not an accident.
- **Actual numbers (income, monthly spend, savings/investment balances): unknown — the system is designed but no month has been logged.** The design above is only real once [[Finance Tracker]] has a month of actual totals in it.
## Relationships and mentors
The vault's honest state: `10_Areas/Career/Mentors/` is empty, but `20_Progress/Mentorship Program/` holds real structure — an [[Mentor Details]] note, an [[Elevator pitch|elevator pitch]], a [[Mentorship Board|board]], a [[Plan|plan]], and dated meeting notes (Hackathons/Summer/Networking, a one-pager, Winter Break). So there *is* an active mentorship relationship with recorded meetings; what's missing is the standing cadence layer that [[Relationship Log]] exists to hold.
- **What [[Relationship Log]] will contain once populated:** one row per person worth deliberate cadence — role/why-they-matter, cadence, last contact, what's being exchanged (get/give), next touch. A row earns its place only when losing touch would cost something concrete (a recommendation, a door, a collaboration) — it is not a CRM of everyone met.
- **Cadence model:** a **mentor** gets a scheduled recurring touch (the meeting-notes cadence already in Mentorship Program); a **collaborator** gets contact tied to the shared work; a **recommender** gets a low-frequency but deliberate "still in orbit" touch before it's ever needed. During `/weekly-review`, scan the Last-contact column — anyone past cadence gets a concrete next touch written in (a question, an update worth sending), never a vague "check in."
- **The give/get framing, concretely:** with the current mentor, the *get* is meeting prep and networking/hackathon direction (per the meeting notes); the *give* is a prepared agenda and follow-through on action items, so the relationship stays worth the mentor's time. The failure mode to avoid: only reaching out when you need something.
## Career trajectory
- **Now:** strong infrastructure / agentic-AI skills demonstrated across five real projects (Jarvis, CausalOps, Resq, Portfolio, TradingView — catalogued in [[Claude OS]]), but the flagship-*shipping* record since 17 May is thin. On the [[AI Engineer Roadmap — roadmap.sh (web)]] map, the profile is closest to **AI Engineer (applied/GenAI)** — the largest-opening role — with the standout gap being **evaluation & observability**, which is also the gap in the Jarvis skills themselves.
- **3 months (through Sept 1):** the Bangalore ship loop produces weekly evidence. The **"portfolio bullet" format** (from [[Summer Grind]]): each shipped week yields *one resume bullet, one portfolio paragraph, one mentor-ready explanation*, each backed by evidence (commit hash / demo / test result / README / architecture decision) — bullets live in the project's README and get promoted into the resume. **"Internship pipeline actively fed" in weekly terms:** touch [[Tracker]] once per week — 1–3 applications or one follow-up — the weekly career task that daily LeetCode does *not* cover ([[02 - Weekly Operating System]]). The exit state: a clean "what shipped this summer" story, a live portfolio, and a fed pipeline.
- **1 year:** internship secured off that evidence. The deeper aim from the North Star is technical independence across agentic AI, ML pipelines, full-stack, trading systems, and UROP research — each domain already has a vault home; the year's work is **depth in one or two, not width in all five.**
- **The mechanism connecting the clocks (deliberately different):** LeetCode ≥5 is the career win *daily*; internship-pipeline work is *weekly* cadence; flagships are *per-Bangalore-week*; the domain-depth choice is *yearly*. Collapsing these clocks (e.g. treating internship applications as a daily obligation) is what produces reactive, threat-response behavior instead of outcome-play ([[The Output Audit (web)]]).
- **Internship-outreach mechanics:** the [[LinkedIn Search URL Cheatsheet (PDF)]] gives targeted recruiter/alumni query strings; the [[Outreach Automation Manual (PDF)]] is the automated cold-email version; the AI/ML pivot guide's data says **referrals convert 5–10× cold applications** — so the weekly pipeline touch should favor a warm alumni/recruiter reach-out over another cold app.
## Learning arc — what each course is for, and where it stands
The current-term stack runs through the Summer plan files, **not** a `10_Areas/UMN/` folder (which doesn't exist — past courses live in `40_Resources/UMN/`). Every tracker below currently reads **mastery 0 / nothing logged**, consistent with the execution-stall diagnosis — the sequences are designed and ready, none are started.
### CSCI 4041 (Algorithms/DSA) — the internship flagship
Agentic OS.md
How to Use Agents.md
How to Use Plugins.md
How to Use Skills.md
```
- `Skill` -- `{"skill":"json-canvas"}`

## You

Base directory for this skill: D:\_Anant\20_Progress\Documents\The Plan\.claude\skills\json-canvas

# JSON Canvas

Follow JSON Canvas 1.0. A <code>.canvas</code> document contains top-level
<code>nodes</code> and <code>edges</code> arrays.

## Workflow

1. Parse the existing JSON before editing it.
2. Generate a unique lowercase 16-character hexadecimal ID for each new node
   or edge.
3. Position nodes without overlap and preserve intentional existing layout.
4. Point every edge at existing node IDs.
5. Serialize valid JSON and run the validation checklist below.

## Nodes

Every node requires <code>id</code>, <code>type</code>, <code>x</code>,
<code>y</code>, <code>width</code>, and <code>height</code>.

| Type | Required content | Purpose |
| --- | --- | --- |
| <code>text</code> | <code>text</code> | Markdown content |
| <code>file</code> | <code>file</code> | Vault file; optional <code>subpath</code> |
| <code>link</code> | <code>url</code> | External URL |
| <code>group</code> | none | Visual container; optional label/background |

Array order controls z-index: earlier nodes are behind later nodes. Coordinates
may be negative. Position is the top-left corner, x increases right, and y
increases down.

~~~json
{
  "id": "6f0ad84f44ce9c17",
  "type": "text",
  "x": 0,
  "y": 0,
  "width": 360,
  "height": 180,
  "text": "# Main idea\n\nDetails",
  "color": "5"
}
~~~

Use actual JSON newline escapes in text values. Do not double-escape them into
literal backslash-n text.

## Edges

Every edge requires <code>id</code>, <code>fromNode</code>, and
<code>toNode</code>. Optional sides are <code>top</code>, <code>right</code>,
<code>bottom</code>, or <code>left</code>. Optional ends are <code>none</code>
or <code>arrow</code>.

~~~json
{
  "id": "0123456789abcdef",
  "fromNode": "6f0ad84f44ce9c17",
  "fromSide": "right",
  "toNode": "a1b2c3d4e5f67890",
  "toSide": "left",
  "toEnd": "arrow",
  "label": "leads to"
}
~~~

## Colors and layout

A color is a hex string or preset <code>"1"</code> through
<code>"6"</code>. Presets deliberately do not define exact hex colors. Leave
50–100 px between nodes, 20–50 px padding inside groups, and align to a simple
grid when creating a new layout.

## Validation checklist

- JSON parses successfully.
- IDs are unique across nodes and edges.
- Every <code>fromNode</code> and <code>toNode</code> exists in
  <code>nodes</code>.
- Each node type has its required content field.
- Sides, ends, and colors use allowed values.
- Nodes do not unintentionally overlap and group children sit inside bounds.

Read [Examples](references/EXAMPLES.md) for complete connected and grouped
canvases.

## Attribution

Adapted from <code>kepano/obsidian-skills</code> at revision
<code>[REDACTED]</code>. See <code>LICENSE</code>.


## Claude

Status: dashboard note is written. I'm now building a harness that runs its code under jsdom and compares the output with the engine's `review` for the same month.

I built both files and checked them. The Monthly numbers match the engine, but I couldn't open either file in Obsidian, so neither has been seen rendered.

**Files created** (nothing else written)
- `00_Live/Monthly Dashboard.md` is a DataviewJS note with the seven blocks from the spec, in a single column:
  - month heatmap, grade and category rates
  - failure causes
  - month plan and goals
  - finance snapshot
  - health trend
  - system overview
  - previous months
- `00_Live/Map.canvas` has 38 nodes and 34 edges. It has the nine domain nodes, each linked to a goal from `Resolutions '26` and then to the notes that own it. There are also four domain-to-domain links, such as Fitness to Health.

**Checks**
- **Dashboard against the engine:** I ran the note's code under jsdom with a stubbed Dataview API. On the fixture month (2026-03, today 2026-03-10) it matches the engine's `review`. Both give 6 of 9 days MET, 67%, grade C, streak 2, best 4.
- **Randomised comparison:** 14 synthetic histories matched the engine on grade, MET and lost counts, streak, best, trend and cause counts, including cases with no cause logged. No mismatches.
- **Real October (today 2026-10-14):** the note and the engine both read no data, streak 0, best 0, no causes. This is a weak check, because no real daily note has a `[cat::]` field yet, so October has no counted days.
- **Canvas:** the JSON parses and all 72 IDs are unique 16-character hex strings. All 34 edges point at existing nodes. Every file node exists, no nodes overlap, and all nine domains are present.
- Neither file contains an em dash, and neither is set as the homepage.

**Not verified**
- Both files open in Obsidian only in reading view for the note, and neither has been checked on the phone. The jsdom run does not test Dataview's own rendering, the `internal-link` clicks or `dv.paragraph` embedding. Open the note in reading view to confirm.
- The snapshot embed path is untested. No snapshot exists in `60_Jarvis/10_Promoted_Notes`, so the note shows "No snapshot yet."

**Conflicts and decisions**
- **Home is a plugin view.** Home is the `the-plan-dashboard` plugin view, not a Dataview page, and CLAUDE.md lists a Monthly view in that plugin as not built. `Review - Corrections` also called the canvas optional. I followed your task and built a Dataview note plus the canvas. The note re-implements the streak logic in JavaScript, which the spec warns can drift. The comparison above is the guard.
- **File locations.** The task named no paths, so I put both in `00_Live`, because the vault root is blocked. `Map.md` already exists there, so `[[Map]]` still resolves to the note and the canvas is `Map.canvas`.
- **Snapshot matching.** The note looks only in `60_Jarvis/10_Promoted_Notes`, preferring a name with "snapshot" and the month label, as the Monthly Review standard says. This keeps it from picking up the rollback register.
- **Git ignores the canvas.** `.gitignore` line 3 (`*`) ignores `Map.canvas`, so git won't track it. I left that alone.
- **Unexpected change.** `60_Jarvis/README.md` shows as modified in git. I didn't touch it.

**Worth doing later**
- Tick at least one daily note's `[cat::]` actions so the dashboard has real data to show.
- Fill the Finance Tracker, the Health Tracker baseline and the October month plan, which are all empty now.
- Decide whether the canvas goal wording matches your own words. I paraphrased `Resolutions '26`, and Morning has no matching resolution, so it cites the Daily Note Schema defaults.
- Add a Monthly view to the plugin later, so one engine produces the numbers instead of a second implementation.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && for f in "00_Live/Enumerate/Yearly/Resolutions '26.md" "00_Live/Enumerate/Yearly/2026.md" "00_Live/Tracking/Habits/Habits Stacking.md" "00_Live/Tracking/Habits/Daily Habit Board.md" "00_Live/Tracking/Habits/Health Tracker.md" "00_Live/Tracking/Habits/Finance Tracker.md" "00_Live/Career/Finance/Bank Accounts.md" "00_Live/Career/Finance/Stocks.md" "00_Live/Books/Easy Way to Quit Smoking.md" "00_Live/Health & Life/Heal Your Lungs.md" "00_Live/Books/Essentialism.md" "00_Live/Headway/Headway Analysis.md" "00_Live/Books/Atomic Habits.md" "00_Live/Life OS.md" "00_Live/Tracking/Plans/Summer Grind.md" "00_Live/Tracking/Relationship Log.md" "00_Live/Books/Psycho-Cybernetics.md" "00_Live/Headway/Communication.md" "30_Order/Standards/Dashboards/Streak Rule.md" "30_Order/Standards/Dashboards/Daily Note Schema.md" "30_Order/Workflows/Agentic OS/Agentic OS.md" "40_Resources/Obsidian/Dashboards/Dashboards Hub.md" "00_Live/Monthly Dashboard.md" "00_Live/Map.canvas"; do [ -e "$f" ] && echo "OK  $f" || echo "MISSING $f"; done; ls 00_Live/Career/SWE/AI | head
```
```
OK  00_Live/Enumerate/Yearly/Resolutions '26.md
OK  00_Live/Enumerate/Yearly/2026.md
OK  00_Live/Tracking/Habits/Habits Stacking.md
OK  00_Live/Tracking/Habits/Daily Habit Board.md
OK  00_Live/Tracking/Habits/Health Tracker.md
OK  00_Live/Tracking/Habits/Finance Tracker.md
OK  00_Live/Career/Finance/Bank Accounts.md
OK  00_Live/Career/Finance/Stocks.md
OK  00_Live/Books/Easy Way to Quit Smoking.md
OK  00_Live/Health & Life/Heal Your Lungs.md
OK  00_Live/Books/Essentialism.md
OK  00_Live/Headway/Headway Analysis.md
OK  00_Live/Books/Atomic Habits.md
OK  00_Live/Life OS.md
OK  00_Live/Tracking/Plans/Summer Grind.md
OK  00_Live/Tracking/Relationship Log.md
OK  00_Live/Books/Psycho-Cybernetics.md
OK  00_Live/Headway/Communication.md
OK  30_Order/Standards/Dashboards/Streak Rule.md
OK  30_Order/Standards/Dashboards/Daily Note Schema.md
OK  30_Order/Workflows/Agentic OS/Agentic OS.md
OK  40_Resources/Obsidian/Dashboards/Dashboards Hub.md
MISSING 00_Live/Monthly Dashboard.md
MISSING 00_Live/Map.canvas
```
- `Bash`
```bash
mkdir -p "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cat > mkcanvas.cjs <<'EOF'
const crypto=require('crypto'),fs=require('fs');
const id=()=>crypto.randomBytes(8).toString('hex');
const nodes=[],edges=[];
const D=[
 ['Morning','4',"**Goal:** the morning routine runs without a decision (move at 8 am, read 12 pages, plan 20 minutes).",
   ['30_Order/Standards/Dashboards/Daily Note Schema.md','00_Live/Tracking/Habits/Habits Stacking.md']],
 ['Study','5',"**Goal 1 of 2026:** 4.0 GPA.",
   ['00_Live/Enumerate/Yearly/Resolutions \'26.md','00_Live/Tracking/Plans/Summer Grind.md']],
 ['Fitness','1',"**Goal 9 of 2026:** gym 5 days a week, calisthenics skills.",
   ['00_Live/Tracking/Habits/Daily Habit Board.md','00_Live/Tracking/Habits/Health Tracker.md']],
 ['Mind','6',"**Goals 7 and 8 of 2026:** character development, stop smoking.",
   ['00_Live/Books/Easy Way to Quit Smoking.md','00_Live/Books/Psycho-Cybernetics.md']],
 ['Career','3',"**Goal 2 of 2026:** land a strong internship, build at least 3 projects.",
   ['00_Live/Life OS.md','00_Live/Tracking/Relationship Log.md']],
 ['Health','1',"**Goals 8 and 9 of 2026:** heal the lungs, log a baseline.",
   ['00_Live/Tracking/Habits/Health Tracker.md','00_Live/Health & Life/Heal Your Lungs.md']],
 ['Finance','2',"**Goal 11 of 2026:** track spending and start investing.",
   ['00_Live/Tracking/Habits/Finance Tracker.md','00_Live/Career/Finance/Bank Accounts.md','00_Live/Career/Finance/Stocks.md']],
 ['Learning','5',"**Goal 6 of 2026:** learn something new every day, read as a hobby.",
   ['00_Live/Headway/Headway Analysis.md','00_Live/Books/Essentialism.md','00_Live/Books/Atomic Habits.md']],
 ['Systems','4',"**Goal 3 of 2026:** a second brain that is kept up.",
   ['40_Resources/Obsidian/Dashboards/Dashboards Hub.md','30_Order/Workflows/Agentic OS/Agentic OS.md','30_Order/Standards/Dashboards/Streak Rule.md']],
];
const dom={},fileNode={};
const mk=(o)=>{const n={id:id(),...o};nodes.push(n);return n.id;};
const edge=(a,b,fs_,ts,label)=>edges.push({id:id(),fromNode:a,fromSide:fs_,toNode:b,toSide:ts,...(label?{label}:{})});
D.forEach(([name,color,goal,files],i)=>{
  const y=i*340;
  const d=mk({type:'text',x:0,y:y+60,width:200,height:80,text:'# '+name,color});
  dom[name]=d;
  const g=mk({type:'text',x:300,y:y+40,width:320,height:120,text:goal});
  edge(d,g,'right','left','goal');
  files.forEach((f,j)=>{
    let fid=fileNode[f];
    if(!fid){fid=mk({type:'file',file:f,x:760,y:y+j*100-20+ (j?0:0),width:380,height:80});fileNode[f]=fid;}
    edge(g,fid,'right','left','owned by');
  });
});
// shared file nodes sit at their first domain; later edges point to them
edge(dom.Fitness,dom.Health,'bottom','top');
edge(dom.Mind,dom.Health,'bottom','top');
edge(dom.Study,dom.Learning,'bottom','top');
edge(dom.Systems,dom.Morning,'top','top','daily note rules');
fs.writeFileSync(process.argv[2],JSON.stringify({nodes,edges},null,'\t'));
EOF
node mkcanvas.cjs "D:/_Anant/20_Progress/Documents/The Plan/00_Live/Map.canvas" && echo done
```
```
done
```
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\00_Live\Monthly Dashboard.md`
````
---
type: project
status: seed
created: 2026-10-14
tags:
  - dashboard
  - monthly
notes:
  - "[[Spec - Home and Monthly Dashboards]]"
  - "[[Streak Rule]]"
  - "[[Daily Note Schema]]"
  - "[[Finance Tracker]]"
  - "[[Health Tracker]]"
  - "[[Dashboards Hub]]"
---
# Monthly Dashboard

Reads the daily notes and shows the current month. It stores nothing. Every number is computed from `00_Live/Enumerate/Daily` with the rules in [[Streak Rule]], and must equal the `plan-cli` engine's `review` output for the same month. Design: [[Spec - Home and Monthly Dashboards]]. Open in reading view.

```dataviewjs
// Monthly dashboard. Only numbers and text nodes are written to the page: no innerHTML anywhere.
const DAILY = "00_Live/Enumerate/Daily";
const MONTHLY = "00_Live/Enumerate/Monthly";
const PROMOTED = "60_Jarvis/10_Promoted_Notes";
const FINANCE = "00_Live/Tracking/Habits/Finance Tracker.md";
const HEALTH = "00_Live/Tracking/Habits/Health Tracker.md";
const CATS = ["morning", "study", "fitness", "mind", "career"];
const CAUSES = ["sleep", "no-plan", "distracted", "energy", "other"];
const FLOOR = 3;
const BANDS = [[90, "A"], [75, "B"], [60, "C"], [40, "D"], [0, "F"]];

const pad = (n) => String(n).padStart(2, "0");
const localIso = (d) => `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`;
const toNum = (iso) => { const [y, m, d] = iso.split("-").map(Number); return Math.round(Date.UTC(y, m - 1, d) / 864e5); };
const toIso = (n) => new Date(n * 864e5).toISOString().slice(0, 10);
const TODAY = localIso(new Date());
const MONTH = TODAY.slice(0, 7);

// ---------- parsing (same patterns as the engine) ----------
const ACTION = /^\s*[-*+]\s+\[(.)\]\s.*\[cat::\s*([A-Za-z]+)\s*\]/;
const parseActions = (text) => {
	const out = [];
	for (const raw of text.split("\n")) {
		const m = ACTION.exec(raw.replace(/\r$/, ""));
		if (!m) continue;
		const category = m[2].toLowerCase();
		if (CATS.includes(category)) out.push({ category, done: m[1] === "x" || m[1] === "X" });
	}
	return out;
};
const catsDone = (actions) => CATS.filter((c) => {
	const own = actions.filter((a) => a.category === c);
	return own.length > 0 && own.every((a) => a.done);
});
const sectionLines = (text, name, exact) => {
	const out = [];
	let on = false;
	for (const raw of text.split("\n")) {
		const line = raw.replace(/\r$/, "");
		if (/^##\s/.test(line)) {
			const h = line.replace(/^##\s+/, "").trim().toLowerCase();
			on = exact ? h === name : h.startsWith(name);
			continue;
		}
		if (on) out.push(line);
	}
	return out;
};
const misses = (text) => {
	const out = [];
	for (const raw of sectionLines(text, "evening close", true)) {
		const line = raw.replace(/%%.*?%%/g, "").replace(/%%.*$/, "");
		const m = /\[miss::\s*([A-Za-z-]+)\s*\]/.exec(line);
		if (!m) continue;
		const c = /\[cause::\s*([A-Za-z-]+)\s*\]/.exec(line);
		out.push({ category: m[1].toLowerCase(), cause: c ? c[1].toLowerCase() : null });
	}
	return out;
};
const tableRows = (text, heading) => {
	const rows = sectionLines(text, heading, false).filter((l) => l.trim().startsWith("|"))
		.map((l) => l.trim().replace(/^\|/, "").replace(/\|$/, "").split("|").map((c) => c.trim()));
	if (rows.length < 2) return { head: [], rows: [] };
	return { head: rows[0], rows: rows.slice(2) };
};

// ---------- load ----------
const dailyPages = Array.from(dv.pages(`"${DAILY}"`)).filter((p) => /^\d{4}-\d{2}-\d{2}$/.test(p.file.name));
const texts = new Map();
for (const p of dailyPages) texts.set(p.file.name, (await dv.io.load(p.file.path)) || "");
const doneBy = new Map();
const catsBy = new Map();
let first = null;
for (const [date, text] of texts) {
	const actions = parseActions(text);
	const done = catsDone(actions);
	doneBy.set(date, done.length);
	catsBy.set(date, done);
	if (actions.length > 0 && toNum(date) <= toNum(TODAY) && (first === null || toNum(date) < first)) first = toNum(date);
}
const done = (n) => doneBy.get(toIso(n)) ?? 0;

// ---------- streak (Streak Rule) ----------
const todayN = toNum(TODAY);
let run = 0, best = 0, prevMiss = false;
if (first !== null) {
	for (let n = first; n <= todayN - 1; n++) {
		if (done(n) >= FLOOR) { run++; best = Math.max(best, run); prevMiss = false; }
		else if (prevMiss) { run = 0; prevMiss = false; }
		else prevMiss = true;
	}
}
const todayMet = done(todayN) >= FLOOR;
const streak = { current: run + (todayMet ? 1 : 0), best, atRisk: prevMiss && !todayMet };
const firstIso = first === null ? null : toIso(first);

// ---------- month score ----------
const monthDates = (label) => {
	const [y, m] = label.split("-").map(Number);
	const start = toNum(`${label}-01`);
	const end = toNum(`${m === 12 ? y + 1 : y}-${pad(m === 12 ? 1 : m + 1)}-01`) - 1;
	const out = [];
	for (let n = start; n <= end; n++) out.push(toIso(n));
	return out;
};
const prevLabel = (label) => toIso(toNum(`${label}-01`) - 1).slice(0, 7);
const scoreMonth = (label) => {
	const days = monthDates(label).map((date) => {
		const n = toNum(date);
		const hasNote = texts.has(date);
		const categories = doneBy.get(date) ?? 0;
		let status = "NOT_COUNTED", why = "future";
		if (n > todayN - 1) why = n === todayN ? "today" : "future";
		else if (first === null || n < first) why = "before-first-day";
		else { status = categories >= FLOOR ? "MET" : "MISS"; why = ""; }
		const forgiven = n < todayN && hasNote && categories < FLOOR && first !== null && n - 1 >= first
			&& done(n - 1) >= FLOOR && done(n + 1) >= FLOOR;
		return { date, hasNote, categories, status, why, forgiven };
	});
	const counted = days.filter((d) => d.status !== "NOT_COUNTED");
	const met = counted.filter((d) => d.status === "MET").length;
	const percent = counted.length === 0 ? null : Math.round((100 * met) / counted.length);
	const grade = percent === null ? null : BANDS.find((b) => percent >= b[0])[1];
	return { label, days, counted, met, percent, grade };
};
const cur = scoreMonth(MONTH);
const prev = scoreMonth(prevLabel(MONTH));
const trend = cur.percent !== null && prev.percent !== null ? cur.percent - prev.percent : null;
const passed = cur.days.filter((d) => d.why !== "today" && d.why !== "future").length;

const tally = new Map();
let noCause = 0;
const catRate = new Map(CATS.map((c) => [c, 0]));
for (const d of cur.counted) {
	for (const m of misses(texts.get(d.date) ?? "")) {
		if (m.cause === null) noCause++;
		else tally.set(m.cause, (tally.get(m.cause) ?? 0) + 1);
	}
	for (const c of catsBy.get(d.date) ?? []) catRate.set(c, catRate.get(c) + 1);
}
const order = (c) => { const i = CAUSES.indexOf(c); return i === -1 ? 99 : i; };
const causes = [...tally].map(([cause, count]) => ({ cause, count })).sort((a, b) => b.count - a.count || order(a.cause) - order(b.cause));
const forgivenCount = cur.counted.filter((d) => d.forgiven).length;

// ---------- other sources ----------
const monthlyText = (await dv.io.load(`${MONTHLY}/${MONTH}.md`)) || null;
const financeText = (await dv.io.load(FINANCE)) || "";
const healthText = (await dv.io.load(HEALTH)) || "";
const monthlyPages = Array.from(dv.pages(`"${MONTHLY}"`)).filter((p) => /^\d{4}-\d{2}$/.test(p.file.name) && p.file.name !== MONTH)
	.sort((a, b) => (a.file.name < b.file.name ? 1 : -1));
const snapshots = Array.from(dv.pages(`"${PROMOTED}"`)).filter((p) => p.file.name.toLowerCase().includes("snapshot"))
	.sort((a, b) => (a.file.name < b.file.name ? 1 : -1));
const snapshot = snapshots.find((p) => p.file.name.includes(MONTH)) ?? snapshots[0] ?? null;

// ---------- render ----------
const el = (tag, cls, text, parent) => {
	const e = document.createElement(tag);
	if (cls) e.className = cls;
	if (text !== undefined) e.textContent = String(text);
	if (parent) parent.appendChild(e);
	return e;
};
const link = (path, label, parent) => {
	const a = el("a", "internal-link", label, parent);
	a.setAttribute("data-href", path);
	a.setAttribute("href", path);
	a.setAttribute("target", "_blank");
	a.setAttribute("rel", "noopener");
	return a;
};
const tile = (parent, label, value, sub) => {
	const t = el("div", "pl-tile", undefined, parent);
	el("div", "pl-num", value, t);
	el("div", "pl-lbl", label, t);
	if (sub) el("div", "pl-sub", sub, t);
	return t;
};

const css = el("style");
css.textContent = `
.pl-month{--pl-accent:#a78bfa;--pl-bad:#E5534B;--pl-warn:#F0A63A;--pl-ok:#5BC98A;--pl-h0:#23282F;--pl-h1:#1F3B31;--pl-h2:#25523F;--pl-h3:#2E7050;--pl-h4:#3F9468;--pl-h5:#5BC98A;font-family:"JetBrains Mono",ui-monospace,monospace;display:flex;flex-direction:column;gap:14px}
.theme-light .pl-month{--pl-bad:#D63B33;--pl-warn:#D98A12;--pl-ok:#2E9E63;--pl-h0:#E8ECEF;--pl-h1:#CFE9DB;--pl-h2:#A7DBC1;--pl-h3:#7CCBA2;--pl-h4:#4FB583;--pl-h5:#2E9E63}
.pl-month .pl-card{border:1px solid var(--background-modifier-border);border-radius:10px;padding:14px 16px;background:transparent}
.pl-month .pl-title{font-size:.7rem;letter-spacing:.12em;text-transform:uppercase;color:var(--pl-accent);margin-bottom:10px}
.pl-month .pl-tiles{display:grid;grid-template-columns:repeat(auto-fill,minmax(110px,1fr));gap:10px}
.pl-month .pl-num{font-size:1.9rem;font-weight:700;line-height:1;color:var(--text-normal)}
.pl-month .pl-lbl{font-size:.65rem;letter-spacing:.08em;text-transform:uppercase;color:var(--text-muted);margin-top:4px}
.pl-month .pl-sub{font-size:.7rem;color:var(--text-muted);margin-top:2px}
.pl-month .pl-line{font-size:.85rem;margin:8px 0 0;color:var(--text-normal)}
.pl-month .pl-muted{color:var(--text-muted)}
.pl-month .pl-warnline{color:var(--pl-warn)}
.pl-month .pl-heat{display:grid;grid-template-columns:repeat(7,1fr);gap:4px;margin-top:12px}
.pl-month .pl-dow{font-size:.6rem;text-align:center;color:var(--text-muted)}
.pl-month .pl-cell{aspect-ratio:1;border-radius:5px;font-size:.65rem;display:flex;align-items:center;justify-content:center;color:var(--text-normal);background:var(--pl-h0);min-height:30px}
.pl-month .pl-cell.h1{background:var(--pl-h1)}.pl-month .pl-cell.h2{background:var(--pl-h2)}.pl-month .pl-cell.h3{background:var(--pl-h3)}.pl-month .pl-cell.h4{background:var(--pl-h4)}.pl-month .pl-cell.h5{background:var(--pl-h5)}
.pl-month .pl-cell.nocount{opacity:.35}
.pl-month .pl-cell.nonote{background-image:linear-gradient(135deg,transparent 46%,var(--text-faint) 46%,var(--text-faint) 54%,transparent 54%)}
.pl-month .pl-cell.forgiven{outline:2px dashed var(--pl-warn);outline-offset:-2px}
.pl-month .pl-cell.today{outline:2px solid var(--text-normal);outline-offset:-2px;opacity:1}
.pl-month .pl-row{display:grid;grid-template-columns:90px 1fr 44px;align-items:center;gap:8px;margin-top:8px;font-size:.8rem}
.pl-month .pl-bar{height:8px;border-radius:4px;background:var(--pl-h0);overflow:hidden}
.pl-month .pl-fill{height:100%;background:var(--pl-ok)}
.pl-month .pl-fill.cause{background:var(--pl-warn)}
.pl-month .pl-kv{display:grid;grid-template-columns:1fr auto;gap:4px 12px;font-size:.82rem;margin-top:8px}
.pl-month ul{margin:6px 0 0;padding-left:18px}
`;
const root = el("div", "pl-month", undefined, dv.container);
root.appendChild(css);
const card = (title) => { const c = el("div", "pl-card", undefined, root); el("div", "pl-title", title, c); return c; };

// 1. Month heatmap and grade
{
	const c = card(`Month ${MONTH}`);
	const t = el("div", "pl-tiles", undefined, c);
	tile(t, "Grade", cur.grade ?? "-", cur.percent === null ? "no data" : `${cur.percent}%`);
	tile(t, "Days MET", cur.counted.length === 0 ? "-" : `${cur.met}/${cur.counted.length}`, `${passed} days passed`);
	tile(t, "Lost", cur.counted.length - cur.met, `${forgivenCount} forgiven`);
	tile(t, "Streak", streak.current, `best ${streak.best}`);
	tile(t, "Trend", trend === null ? "-" : `${trend >= 0 ? "+" : ""}${trend}`, trend === null ? "no previous data" : "points vs " + prev.label);
	if (firstIso === null) el("p", "pl-line pl-muted", "No counted days yet. No daily note holds category actions, so every date is outside the streak.", c);
	else el("p", "pl-line pl-muted", `First counted day: ${firstIso}. Dates before it and today are not counted.`, c);
	if (streak.atRisk) el("p", "pl-line pl-warnline", "Streak breaks if today is not MET.", c);
	const grid = el("div", "pl-heat", undefined, c);
	for (const d of ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]) el("div", "pl-dow", d, grid);
	const offset = (toNum(cur.days[0].date) + 3) % 7;
	for (let i = 0; i < offset; i++) el("div", undefined, undefined, grid);
	for (const d of cur.days) {
		const cls = ["pl-cell"];
		if (d.status === "NOT_COUNTED") cls.push("nocount");
		else cls.push("h" + d.categories);
		if (d.status !== "NOT_COUNTED" && !d.hasNote) cls.push("nonote");
		if (d.forgiven) cls.push("forgiven");
		if (d.date === TODAY) cls.push("today");
		const cell = el("div", cls.join(" "), d.date.slice(8), grid);
		const state = d.status === "NOT_COUNTED" ? d.why : d.status;
		cell.setAttribute("title", `${d.date}: ${d.categories} of 5 categories, ${state}${d.forgiven ? ", forgiven" : ""}`);
	}
	el("p", "pl-line pl-muted", "Shade is categories done (0 to 5). Dashed outline: forgiven day. Diagonal line: no note. Faded: not counted.", c);
	el("div", "pl-title", "Category completion", c).style.marginTop = "14px";
	for (const cat of CATS) {
		const r = el("div", "pl-row", undefined, c);
		el("span", undefined, cat, r);
		const bar = el("div", "pl-bar", undefined, r);
		const pct = cur.counted.length === 0 ? 0 : Math.round((100 * catRate.get(cat)) / cur.counted.length);
		el("div", "pl-fill", undefined, bar).style.width = pct + "%";
		el("span", "pl-muted", cur.counted.length === 0 ? "-" : pct + "%", r);
	}
}

// 2. Failure causes
{
	const c = card("Failure causes");
	if (causes.length === 0 && noCause === 0) el("p", "pl-line pl-muted", "None logged this month.", c);
	const top = causes.length ? causes[0].count : 1;
	for (const x of causes) {
		const r = el("div", "pl-row", undefined, c);
		el("span", undefined, x.cause, r);
		const bar = el("div", "pl-bar", undefined, r);
		el("div", "pl-fill cause", undefined, bar).style.width = Math.round((100 * x.count) / top) + "%";
		el("span", "pl-muted", x.count, r);
	}
	if (noCause > 0) el("p", "pl-line pl-muted", `No cause logged: ${noCause}`, c);
	const unknown = causes.filter((x) => !CAUSES.includes(x.cause)).map((x) => x.cause);
	if (unknown.length) el("p", "pl-line pl-warnline", `Unknown cause tags: ${unknown.join(", ")}`, c);
}

// 3. Month plan and goals
{
	const c = card("Month plan and goals");
	if (monthlyText === null) {
		el("p", "pl-line pl-muted", `No Monthly note for ${MONTH}.`, c);
	} else {
		const items = [];
		for (const l of sectionLines(monthlyText, "month plan and goals", false)) {
			const m = /^\s*[-*+]\s+(?:\[(.)\]\s+)?(.*)$/.exec(l);
			if (m && m[2].trim()) items.push({ box: m[1] === undefined ? null : m[1] !== " ", text: m[2].trim() });
		}
		if (items.length === 0) el("p", "pl-line pl-muted", "No goals written yet.", c);
		else {
			const boxes = items.filter((i) => i.box !== null);
			if (boxes.length) el("p", "pl-line", `Progress: ${boxes.filter((i) => i.box).length} of ${boxes.length} done`, c);
			const ul = el("ul", undefined, undefined, c);
			for (const i of items) el("li", undefined, (i.box === null ? "" : i.box ? "[x] " : "[ ] ") + i.text, ul);
		}
		link(`${MONTHLY}/${MONTH}.md`, `Open ${MONTH}`, el("p", "pl-line", undefined, c));
	}
}

// 4. Finance snapshot
{
	const c = card("Finance snapshot");
	const t = tableRows(financeText, "snapshot log");
	const row = t.rows.find((r) => r[0] === MONTH) ?? t.rows[t.rows.length - 1];
	if (!row) el("p", "pl-line pl-muted", "No row in the Finance Tracker.", c);
	else {
		el("p", "pl-line", row[0] === MONTH ? `Row for ${MONTH}` : `No row for ${MONTH}. Latest row is ${row[0]}.`, c);
		const kv = el("div", "pl-kv", undefined, c);
		let logged = 0;
		for (let i = 1; i < t.head.length; i++) {
			if (!row[i]) continue;
			logged++;
			el("span", "pl-muted", t.head[i], kv);
			el("span", undefined, row[i], kv);
		}
		if (logged === 0) el("p", "pl-line pl-muted", "No figures logged for that month.", c);
	}
	link(FINANCE, "Finance Tracker", el("p", "pl-line", undefined, c));
}

// 5. Health trend
{
	const c = card("Health trend");
	const base = tableRows(healthText, "baseline");
	const week = tableRows(healthText, "weekly log");
	const inMonth = week.rows.filter((r) => r[0].startsWith(MONTH));
	const sessions = inMonth.reduce((s, r) => s + (parseFloat(r[1]) || 0), 0);
	const t = el("div", "pl-tiles", undefined, c);
	tile(t, "Gym sessions", inMonth.some((r) => r[1]) ? sessions : "-", inMonth.length ? `${inMonth.length} weeks logged` : "no weeks logged");
	const kv = el("div", "pl-kv", undefined, c);
	for (const r of base.rows) {
		el("span", "pl-muted", r[0], kv);
		const known = r[1] && r[1].toLowerCase() !== "unknown";
		el("span", undefined, known ? `${r[1]} (${r[2]})` : "not logged", kv);
	}
	link(HEALTH, "Health Tracker", el("p", "pl-line", undefined, c));
}

// 6. System overview
{
	const c = card("System overview");
	if (snapshot === null) el("p", "pl-line pl-muted", "No snapshot yet.", c);
	else {
		el("p", "pl-line", `Jarvis snapshot: ${snapshot.file.name}`, c);
		dv.paragraph(`![[${snapshot.file.path}]]`);
	}
	const t = el("div", "pl-tiles", undefined, c);
	t.style.marginTop = "10px";
	tile(t, "Daily notes", texts.size, "in the folder");
	tile(t, "First counted", firstIso === null ? "-" : firstIso.slice(5), firstIso === null ? "none yet" : firstIso);
	link("30_Order/Workflows/Agentic OS/Agentic OS.md", "Agentic OS", el("p", "pl-line", undefined, c));
}

// 7. Previous months
{
	const c = card("Previous months");
	if (monthlyPages.length === 0) el("p", "pl-line pl-muted", "None.", c);
	else {
		const ul = el("ul", undefined, undefined, c);
		for (const p of monthlyPages) link(p.file.path, p.file.name, el("li", undefined, undefined, ul));
	}
}
```

````
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan/00_Live" && python3 --version 2>/dev/null; node -e '
const fs=require("fs");let s=fs.readFileSync("Monthly Dashboard.md","utf8");
s=s.replace("display:flex;flex-direction:column;gap:14px}","display:block;margin-bottom:14px}");
s=s.replace(`const root = el("div", "pl-month", undefined, dv.container);
root.appendChild(css);
const card = (title) => { const c = el("div", "pl-card", undefined, root); el("div", "pl-title", title, c); return c; };`,
`dv.container.appendChild(css);
const card = (title) => { const w = el("div", "pl-month", undefined, dv.container); const c = el("div", "pl-card", undefined, w); el("div", "pl-title", title, c); return c; };`);
fs.writeFileSync("Monthly Dashboard.md",s);console.log(s.includes("const root"))'
```
```
false
```
- `Bash`
````bash
cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cat > harness.cjs <<'EOF'
// usage: node harness.cjs <dailyDir> <today> <month>  -> prints JSON of what the dashboard rendered
const fs=require('fs'),path=require('path');
const {JSDOM}=require('D:/_Anant/20_Progress/Projects/the-plan-dashboard/node_modules/jsdom');
const VAULT='D:/_Anant/20_Progress/Documents/The Plan';
const [,, dailyDir, today]=process.argv;
(async()=>{
const md=fs.readFileSync(VAULT+'/00_Live/Monthly Dashboard.md','utf8');
let code=/```dataviewjs\n([\s\S]*?)\n```/.exec(md)[1];
code=code.replace('const DAILY = "00_Live/Enumerate/Daily";','const DAILY = '+JSON.stringify(dailyDir)+';')
 .replace('const TODAY = localIso(new Date());','const TODAY = '+JSON.stringify(today)+';');
const dom=new JSDOM('<div id=c></div>');const document=dom.window.document;
const abs=p=>path.isAbsolute(p)?p:path.join(VAULT,p);
const dv={container:document.getElementById('c'),
 pages:(src)=>{const dir=abs(src.replace(/^"|"$/g,''));if(!fs.existsSync(dir))return[];
  return fs.readdirSync(dir).filter(f=>f.endsWith('.md')).map(f=>({file:{name:f.slice(0,-3),path:path.join(dir,f)}}));},
 io:{load:async(p)=>{const f=abs(p);return fs.existsSync(f)?fs.readFileSync(f,'utf8'):undefined;}},
 paragraph:()=>{}};
const AF=Object.getPrototypeOf(async function(){}).constructor;
await new AF('dv','document',code)(dv,document);
const out={tiles:{},causes:[],cards:[]};
for(const t of document.querySelectorAll('.pl-tile'))out.tiles[t.querySelector('.pl-lbl').textContent]={v:t.querySelector('.pl-num').textContent,sub:(t.querySelector('.pl-sub')||{}).textContent};
const cards=[...document.querySelectorAll('.pl-card')];
for(const c of cards){const title=c.querySelector('.pl-title').textContent;out.cards.push(title);
 if(title==='Failure causes')for(const r of c.querySelectorAll('.pl-row'))out.causes.push(r.children[0].textContent+' '+r.children[2].textContent);}
out.cells=[...document.querySelectorAll('.pl-cell')].map(c=>c.getAttribute('title'));
out.text=cards.map(c=>c.textContent.slice(0,400));
console.log(JSON.stringify(out,null,1));
})().catch(e=>{console.error('FAIL',e);process.exit(1)});
EOF
cd "D:/_Anant/20_Progress/Documents/The Plan"
echo "=== fixture 2026-03 today 2026-03-10 ==="
node "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad/harness.cjs" "D:/_Anant/20_Progress/Documents/The Plan/30_Order/System/streak/fixtures/sample" 2026-03-10 | head -40
echo "=== engine ==="
node 30_Order/System/plan-cli/plan-cli.cjs review 2026-03 --dir 30_Order/System/streak/fixtures/sample --today 2026-03-10 | node -e 'const r=JSON.parse(require("fs").readFileSync(0));delete r.days;console.log(JSON.stringify(r))'
````
```
=== fixture 2026-03 today 2026-03-10 ===
{
 "tiles": {
  "Grade": {
   "v": "C",
   "sub": "67%"
  },
  "Days MET": {
   "v": "6/9",
   "sub": "9 days passed"
  },
  "Lost": {
   "v": "3",
   "sub": "1 forgiven"
  },
  "Streak": {
   "v": "2",
   "sub": "best 4"
  },
  "Trend": {
   "v": "-",
   "sub": "no previous data"
  },
  "Gym sessions": {
   "v": "-",
   "sub": "no weeks logged"
  },
  "Daily notes": {
   "v": "9",
   "sub": "in the folder"
  },
  "First counted": {
   "v": "03-01",
   "sub": "2026-03-01"
  }
 },
 "causes": [],
 "cards": [
  "Month 2026-03",
  "Failure causes",
  "Month plan and goals",
=== engine ===
{"label":"2026-03","counted":9,"met":6,"percent":67,"grade":"C","missDays":["2026-03-04","2026-03-06","2026-03-07"],"kind":"month","start":"2026-03-01","end":"2026-03-31","today":"2026-03-10","includeToday":false,"partial":true,"firstDay":"2026-03-01","streak":{"current":2,"best":4,"atRisk":false},"causes":[],"noCause":0,"unknownCauses":[],"costliest":null,"trendPoints":null,"previous":{"label":"2026-02","counted":0,"met":0,"percent":null,"grade":null,"missDays":[]},"snapshot":{"matches":[],"line":"requested, not present"},"entry":"### 2026-03\n\n- Days MET: 6 of 9 (67%). 9 days passed\n- Grade: C\n- Previous month: no data\n- MISS days: 2026-03-04, 2026-03-06, 2026-03-07\n- Streak: current 2, best 4 (engine, as of 2026-03-10)\n- Causes: none logged\n- Costliest cause: none\n- Jarvis snapshot: requested, not present"}
```
- `Bash`
```bash
cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cat > parity.cjs <<'EOF'
const fs=require('fs'),path=require('path'),cp=require('child_process');
const VAULT='D:/_Anant/20_Progress/Documents/The Plan';
const cats=['morning','study','fitness','mind','career'];const causes=['sleep','no-plan','distracted','energy','other'];
let seed=12345;const rnd=()=>(seed=(seed*1103515245+12345)&0x7fffffff)/0x7fffffff;
const iso=n=>new Date(n*864e5).toISOString().slice(0,10);const num=s=>Math.round(Date.parse(s)/864e5);
let bad=0;const N=14;
for(let k=0;k<N;k++){
 const dir=path.join(__dirname,'case'+k);fs.rmSync(dir,{recursive:true,force:true});fs.mkdirSync(dir);
 const start=num('2026-08-20'),today=iso(num('2026-10-01')+Math.floor(rnd()*30));
 const firstReal=start+Math.floor(rnd()*10);
 for(let n=start;n<=num('2026-10-31');n++){
  if(rnd()<0.2)continue;
  let body='---\ntype: daily\n---\n';
  if(n>=firstReal){const full=rnd();
   for(const c of cats){const p=rnd()<0.6?1:0;body+=`## ${c}\n- [${p?'x':' '}] act a [cat:: ${c}]\n- [${p||rnd()<0.2?'x':' '}] act b [cat:: ${c.toUpperCase()}]\n`;}
   body+='## Evening close\n';
   for(const c of cats)if(rnd()<0.3)body+=`- [miss:: ${c}]${rnd()<0.8?` [cause:: ${causes[Math.floor(rnd()*5)]}]`:''}\n`;
  }
  fs.writeFileSync(path.join(dir,iso(n)+'.md'),body);
 }
 const eng=JSON.parse(cp.execFileSync('node',[VAULT+'/30_Order/System/plan-cli/plan-cli.cjs','review','2026-10','--dir',dir,'--today',today],{cwd:VAULT}).toString());
 const h=JSON.parse(cp.execFileSync('node',[__dirname+'/harness.cjs',dir,today]).toString());
 const T=h.tiles;
 const exp={grade:eng.grade??'-',met:eng.counted===0?'-':`${eng.met}/${eng.counted}`,lost:String(eng.counted-eng.met),cur:String(eng.streak.current),best:`best ${eng.streak.best}`,
  trend:eng.trendPoints===null?'-':`${eng.trendPoints>=0?'+':''}${eng.trendPoints}`,
  causes:eng.causes.map(c=>`${c.cause} ${c.count}`).join('|')};
 const got={grade:T.Grade.v,met:T['Days MET'].v,lost:T.Lost.v,cur:T.Streak.v,best:T.Streak.sub,trend:T.Trend.v,causes:h.causes.join('|')};
 const ok=JSON.stringify(exp)===JSON.stringify(got);if(!ok){bad++;console.log('MISMATCH case',k,today,'\n exp',exp,'\n got',got);}
 else console.log('ok case',k,today,JSON.stringify(got));
}
console.log(bad===0?`ALL ${N} MATCH`:`${bad} MISMATCHES`);
EOF
node parity.cjs
```
```
ok case 0 2026-10-20 {"grade":"D","met":"11/19","lost":"8","cur":"10","best":"best 10","trend":"+11","causes":"sleep 5|no-plan 5|energy 5|other 5|distracted 4"}
ok case 1 2026-10-13 {"grade":"D","met":"5/12","lost":"7","cur":"5","best":"best 14","trend":"-8","causes":"no-plan 7|energy 4|sleep 2|other 2"}
ok case 2 2026-10-19 {"grade":"C","met":"11/18","lost":"7","cur":"7","best":"best 6","trend":"+14","causes":"other 8|no-plan 2|distracted 2|energy 2|sleep 1"}
ok case 3 2026-10-11 {"grade":"D","met":"5/10","lost":"5","cur":"2","best":"best 15","trend":"-7","causes":"energy 5|sleep 3|other 3|distracted 2"}
ok case 4 2026-10-05 {"grade":"F","met":"0/4","lost":"4","cur":"1","best":"best 8","trend":"-53","causes":"no-plan 1|distracted 1|energy 1"}
ok case 5 2026-10-16 {"grade":"C","met":"9/15","lost":"6","cur":"3","best":"best 10","trend":"+13","causes":"sleep 7|energy 5|no-plan 4|other 4|distracted 3"}
ok case 6 2026-10-23 {"grade":"D","met":"9/22","lost":"13","cur":"4","best":"best 5","trend":"-6","causes":"sleep 9|no-plan 4|distracted 4|other 4|energy 1"}
ok case 7 2026-10-15 {"grade":"D","met":"8/14","lost":"6","cur":"21","best":"best 21","trend":"+0","causes":"no-plan 4|distracted 4|sleep 3|energy 2|other 1"}
ok case 8 2026-10-09 {"grade":"F","met":"2/8","lost":"6","cur":"1","best":"best 13","trend":"-38","causes":"other 3|sleep 1|no-plan 1|distracted 1|energy 1"}
ok case 9 2026-10-28 {"grade":"D","met":"15/27","lost":"12","cur":"7","best":"best 6","trend":"+19","causes":"sleep 9|other 8|energy 6|no-plan 3|distracted 3"}
ok case 10 2026-10-08 {"grade":"D","met":"4/7","lost":"3","cur":"5","best":"best 10","trend":"-6","causes":"other 2|sleep 1|no-plan 1|distracted 1|energy 1"}
ok case 11 2026-10-23 {"grade":"D","met":"10/22","lost":"12","cur":"4","best":"best 15","trend":"-22","causes":"no-plan 6|distracted 6|energy 6|sleep 4|other 3"}
ok case 12 2026-10-06 {"grade":"D","met":"2/5","lost":"3","cur":"5","best":"best 6","trend":"-13","causes":"distracted 2|no-plan 1"}
ok case 13 2026-10-09 {"grade":"C","met":"5/8","lost":"3","cur":"5","best":"best 10","trend":"+6","causes":"sleep 2|no-plan 2|energy 1"}
ALL 14 MATCH
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad"
node "$S/harness.cjs" "00_Live/Enumerate/Daily" 2026-10-14 | node -e 'const h=JSON.parse(require("fs").readFileSync(0));console.log(JSON.stringify(h.tiles));console.log(h.cards.join(" | "));h.text.forEach(t=>console.log("-",t.slice(0,200)))'
echo === canvas
node -e '
const fs=require("fs"),c=JSON.parse(fs.readFileSync("00_Live/Map.canvas","utf8"));
const ids=new Set([...c.nodes,...c.edges].map(x=>x.id));const nid=new Set(c.nodes.map(n=>n.id));
console.log("nodes",c.nodes.length,"edges",c.edges.length,"unique ids",ids.size===c.nodes.length+c.edges.length);
console.log("dangling edges",c.edges.filter(e=>!nid.has(e.fromNode)||!nid.has(e.toNode)).length);
console.log("missing files",c.nodes.filter(n=>n.type==="file"&&!fs.existsSync(n.file)).map(n=>n.file));
console.log("bad id format",[...ids].filter(i=>!/^[0-9a-f]{16}$/.test(i)).length);
let ov=0;for(let i=0;i<c.nodes.length;i++)for(let j=i+1;j<c.nodes.length;j++){const a=c.nodes[i],b=c.nodes[j];if(a.x<b.x+b.width&&b.x<a.x+a.width&&a.y<b.y+b.height&&b.y<a.y+a.height)ov++;}
console.log("overlaps",ov);
const doms=["Morning","Study","Fitness","Mind","Career","Health","Finance","Learning","Systems"];
console.log("domains",doms.filter(d=>c.nodes.some(n=>n.text==="# "+d)).length+"/9");
'
grep -c "—" "00_Live/Monthly Dashboard.md" 00_Live/Map.canvas; git status --short
```
```
{"Grade":{"v":"-","sub":"no data"},"Days MET":{"v":"-","sub":"13 days passed"},"Lost":{"v":"0","sub":"0 forgiven"},"Streak":{"v":"0","sub":"best 0"},"Trend":{"v":"-","sub":"no previous data"},"Gym sessions":{"v":"-","sub":"no weeks logged"},"Daily notes":{"v":"28","sub":"in the folder"},"First counted":{"v":"-","sub":"none yet"}}
Month 2026-10 | Failure causes | Month plan and goals | Finance snapshot | Health trend | System overview | Previous months
- Month 2026-10-Gradeno data-Days MET13 days passed0Lost0 forgiven0Streakbest 0-Trendno previous dataNo counted days yet. No daily note holds category actions, so every date is outside the streak.MoTuWe
- Failure causesNone logged this month.
- Month plan and goalsNo goals written yet.Open 2026-10
- Finance snapshotNo row for 2026-10. Latest row is 2026-07.Notesfirst tracked monthFinance Tracker
- Health trend-Gym sessionsno weeks loggedWeightnot loggedBench / Squat / Deadlift working setsnot loggedResting state (sleep hrs typical)not loggedHealth Tracker
- System overviewNo snapshot yet.28Daily notesin the folder-First countednone yetAgentic OS
- Previous [REDACTED]
=== canvas
nodes 38 edges 34 unique ids true
dangling edges 0
missing files []
bad id format 0
overlaps 0
domains 9/9
00_Live/Monthly Dashboard.md:0
00_Live/Map.canvas:0
 M 60_Jarvis/README.md
?? "00_Live/Monthly Dashboard.md"
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && git check-ignore -v 00_Live/Map.canvas; ls -la 00_Live/Map.canvas; git diff --stat 60_Jarvis/README.md | tail -1
```
```
.gitignore:3:*	00_Live/Map.canvas
-rw-r--r-- 1 anant 197609 12392 Oct 14 15:03 00_Live/Map.canvas
 1 file changed, 12 insertions(+)
```

## You



<pasted_content id="be4e">
Conflicts and decisions
- Home is a plugin view. Home is the the-plan-dashboard plugin view, not a Dataview page, and CLAUDE.md lists a Monthly view in that plugin as not built. Review - Corrections also called the canvas optional. I followed your task and built a Dataview note plus the canvas. The note re-implements the streak logic in JavaScript, which the spec warns can drift. The comparison above is the guard.
- File locations. The task named no paths, so I put both in 00_Live, because the vault root is blocked. Map.md already exists there, so [[Map]] still resolves to the note and the canvas is Map.canvas.
- Snapshot matching. The note looks only in 60_Jarvis/10_Promoted_Notes, preferring a name with "snapshot" and the month label, as the Monthly Review standard says. This keeps it from picking up the rollback register.
- Git ignores the canvas. .gitignore line 3 (*) ignores Map.canvas, so git won't track it. I left that alone.
- Unexpected change. 60_Jarvis/README.md shows as modified in git. I didn't touch it.
</pasted_content id="be4e">


resolve all of these conflicts correctly. For the home plugin that we have created, make sure it lunches on startup and immediately, the other plugin: homepage, is this going to be of any use anymore? if not then say so. SO, i can delete it. Other than make sure that file locations, git and everything is resolved correctly.

## Claude

Status: the `.gitignore` edit didn't apply, probably because of line endings. I'm fixing that now.

Git now sees the canvas (`?? 00_Live/Map Canvas.canvas`), and the `.gitignore` exception works.

I resolved the git, file-location and navigation items. For the launch-on-startup item, I changed nothing: your settings already do it, so Homepage has to stay.

**Homepage plugin: keep it, don't delete it.** The dashboard plugin has no startup code of its own. It only registers the "Open dashboard" command and a ribbon icon, so Homepage is the only thing that opens it at launch. I read `.obsidian/plugins/homepage/data.json`, and it is already set up for this:
- `openOnStartup` is true.
- Kind is "Nothing", and it runs the command `the-plan-dashboard:open-dashboard`.
- The period is "Both" (startup and manual).
- There is no separate mobile profile, so the phone uses the same setting.

**Launching immediately.** The Lazy Plugin Loader desktop profile has Homepage and the dashboard plugin both on `instant`, as well as Dataview. I couldn't confirm this for the phone. Its config has no `mobile` section, even though dual configs are on. Open Lazy Plugin Loader settings on the phone and check that Homepage and The Plan dashboard are set to instant there. I did not edit any `.obsidian` file.

**What I changed**
- **Canvas name.** I renamed `00_Live/Map.canvas` to `00_Live/Map Canvas.canvas`, so it no longer shares a name with `Map.md`. Nothing linked to the old name.
- **Git.** `.gitignore` ignores everything except markdown files. I added one exception, `!00_Live/Map Canvas.canvas`. I did not commit; auto-sync will pick the file up.
- **`60_Jarvis/README.md`.** The diff is gone. Auto-sync committed it as `faf07d8` at 15:08, so nothing was left to resolve and I did not touch it.
- **Navigation.** In `Dashboards Hub.md` under Navigation, I added links to `[[Monthly Dashboard]]` and `[[Map Canvas.canvas|Map canvas]]`. The Map line says it is not `[[Map]]`, which is the `00_Live` index.

**Needs your yes**
- CLAUDE.md still says "a Monthly view in the dashboard" is not built. The view still isn't in the plugin, but the Dataview Monthly Dashboard now exists. I suggest changing that line to "a Monthly view inside the plugin (a Dataview Monthly Dashboard exists in 00_Live)". Do you want me to make that edit?
- `Review - Corrections to Earlier Notes.md` row 10 says to keep the canvas out of the build. The canvas is now built at your request, so that row is stale. Do you want me to update it?

The Monthly Dashboard and the Map canvas are still not set as the homepage.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .gitignore | head -40; echo ---; git diff 60_Jarvis/README.md | head -40; echo ---; cat .obsidian/plugins/homepage/data.json; echo; cat .obsidian/plugins/the-plan-dashboard/manifest.json; ls .obsidian/plugins/the-plan-dashboard; cat .obsidian/plugins/the-plan-dashboard/data.json 2>/dev/null | head -30; cat "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/settings.ts" | head -60; grep -n "onLayoutReady\|addCommand\|Open dashboard\|startup\|openOnStart" "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/main.ts"
```
```
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

# The Plan engine and the Claude Code hook registration. The hooks need both on every laptop.
!30_Order/System/plan-cli/*.cjs
!.claude/settings.json

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
---
---
{
  "version": 4,
  "homepages": {
    "Main Homepage": {
      "value": "",
      "kind": "Nothing",
      "openOnStartup": true,
      "openMode": "Replace all open notes",
      "manualOpenMode": "Keep open notes",
      "view": "Default view",
      "revertView": true,
      "openWhenEmpty": false,
      "refreshDataview": false,
      "autoCreate": false,
      "autoScroll": false,
      "pin": false,
      "commands": [
        {
          "id": "the-plan-dashboard:open-dashboard",
          "period": "Both"
        }
      ],
      "alwaysApply": false,
      "hideReleaseNotes": false
    }
  },
  "separateMobile": false
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
main.js
manifest.json
styles.css
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
14:		this.addRibbonIcon("layout-dashboard", "Open dashboard", () => void this.openDashboard());
15:		this.addCommand({ id: "open-dashboard", name: "Open dashboard", callback: () => void this.openDashboard() });
19:		this.app.workspace.onLayoutReady(() => {
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n 1,70p "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/main.ts"; git log --oneline -3 -- 60_Jarvis/README.md; git status --short; find . -name "*.canvas" -not -path "./.obsidian/*" | head; grep -rn "Homepage\|homepage" 40_Resources/Obsidian/Dashboards/Dashboard\ Build/*.md 30_Order/Workflows/Agentic\ OS/How\ to\ Use\ Plugins.md | head -20; grep -c . .obsidian/community-plugins.json; grep -o '"[a-z-]*"' .obsidian/core-plugins.json | head -0
```
```
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
faf07d8 auto-sync: 2026-10-14 15:08 | 2 files
2237ce5 auto-sync: 2026-10-13 20:08 | 13 files
./00_Live/Map.canvas
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Prompts.md:24:Goal: prove that a private Obsidian plugin can show its own view and that the Homepage plugin opens it at launch on desktop and phone. Nothing else.
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Prompts.md:30:Then tell me, step by step, what I must click: enable the plugin, set Lazy Plugin Loader to instant for it and for Homepage, set Homepage to open the view (try kind File with a stub file named Dashboard.plan first, and tell me whether the picker accepted it; if it did not, use kind Nothing with the command, period Startup only), and turn on Sync for installed community plugins.
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Prompts.md:98:Read: Verification and Risks.md. Add reduced-motion support, the light theme tokens and safe-area padding. Then list the changes I must approve before you make them: retiring the markdown 00_Dashboard.md body and the dashboard.css snippet (keep one link that opens the dashboard), and changing Homepage and Lazy Plugin Loader to instant. Make only the ones I approve.
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Steps.md:25:| S0 Spike | Plugin that shows "hello" in its own view; Homepage opens it at launch; synced to the phone | Node, a code folder | Opens on launch on desktop and phone with no manual step |
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Steps.md:31:| S6 Polish and ship | Reduced motion, light theme, safe areas, retire `00_Dashboard.md` markdown and `dashboard.css`, set Homepage and Lazy Plugin Loader to instant | S3 to S5 | Cold launch to visible dashboard under 2 seconds on desktop, under 4 on phone |
40_Resources/Obsidian/Dashboards/Dashboard Build/Build Steps.md:52:S0 one short session. S1 and S2 one session. S3 one session. S4 to S6 one to two sessions. This is the part to question: if S0 fails (Homepage cannot open the view), the fallback adds minutes, not days.
40_Resources/Obsidian/Dashboards/Dashboard Build/Dashboard Build Hub.md:34:**A small private Obsidian plugin that draws the dashboard in its own view.** Homepage opens that view at launch on desktop and phone. Every number on screen is computed from the daily notes, which stay plain markdown. Ticking a task in the view edits the checkbox line in the daily note.
40_Resources/Obsidian/Dashboards/Dashboard Build/Dashboard Build Hub.md:60:| [[Research - Plugin Creation Guide]] | How a plugin is made: sample repo, manifest, guidelines, dev loop, Homepage and Sync internals |
40_Resources/Obsidian/Dashboards/Dashboard Build/Front End and Visual System.md:80:- Homepage gets a separate mobile profile pointing at the same command.
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md:43:| 5 | Wire, verify, ship | Installed in The Plan, Homepage set, phone checked, references written | Acceptance list passes on desktop and phone |
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md:86:Phase 4, platform proof in The Plan. This phase touches the real vault, so show the exact copy command and wait for a yes first. Copy only main.js, manifest.json and styles.css to D:\_Anant\20_Progress\Documents\The Plan\.obsidian\plugins\the-plan-dashboard. Then give Anant a numbered list of clicks, and wait for his reported results after each group: (a) enable the plugin; in Lazy Plugin Loader set both this plugin and Homepage to instant, then restart Obsidian twice; (b) in Obsidian Sync settings turn on "Active community plugin list" and "Installed community plugin list" on the desktop and on the phone, restart the desktop and force-quit the phone app; (c) on the phone, confirm the plugin is installed and shows the marker string via the command; (d) Homepage route A: kind Nothing with the command to open the dashboard, set for startup only, with a separate mobile profile for the phone; find the command id by running Object.keys(app.commands.commands).filter(k => k.startsWith("the-plan-dashboard")) in the developer console and give it to Anant; restart both devices; (e) Homepage route B, only if route A fails or Anant wants it: kind File pointing at Dashboard.plan; note that Obsidian Sync does not sync non-note file types such as .plan unless "Sync all other types" is on, and check that setting before testing it on the phone. Never open or edit the Homepage, Lazy Plugin Loader or Sync data files yourself; Anant makes these changes through the settings screens.
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md:88:Record a pass or fail with evidence for each of these five checks: 1, the view opens at launch on desktop with no manual step, cold start five times; 2, the same on the phone; 3, the plugin files reach the phone through Sync; 4, startup timing with both plugins on instant, from launch to visible view, desktop and phone; 5, which Homepage route works (A, B or both) and why. Update the matching rows in the Unverified table in Verification and Risks with the results and dates, and add a line to Research - Plugin Creation Guide only where a fact differs from what it says. If a check fails, apply the fallback written in that table, retest once, and report what remains.
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md:96:Done means: the repo builds with npm run build, the hello view works in the dev vault, the five checks have recorded results, and the Build Log entry states which Homepage route to use and what the minAppVersion is.
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md:180:Out of scope: installing into The Plan vault, Homepage settings, a canvas version of the map, milestone level titles (numbers only), the Monthly page, and any change to the engine's rules.
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md:196:Phase 2, launch. Using the route that the Build Log says worked, tell Anant the exact Homepage settings to choose, for desktop and for the separate mobile profile, and wait for his confirmation. Never edit the Homepage, Lazy Plugin Loader or Sync data files yourself. Cold-start both devices three times and report the time to a visible dashboard. The budget is under 2 seconds on desktop and under 4 on the phone; if the budget is missed, report the numbers and the likely cause and do not change settings.
40_Resources/Obsidian/Dashboards/Dashboard Build/Plugin Build Prompts.md:202:Phase 5, references and records. Create these notes in 30_Order/Standards/References from the Tool Reference Template, each with the official source URL, the version or date checked, dependencies, how it was tested, and a link back to the Dashboard Build Hub: one for the plugin, one for the streak engine and CLI. If the References folder does not exist, stop and report that B1 did not create it. In the Dashboard Build folder, update the Unverified table in Verification and Risks with the final result for each row, update the status and next lines of Dashboard Build Hub, add one row to Decisions Log recording that the dashboard shipped and which Homepage route it uses, and finish the Build Log entry. Write README.md in the repo describing what the plugin does, the daily note format it reads and how to build and deploy it. Run npm version 0.1.0 so the manifest and versions files agree, and tag it locally. Push to the private repository only after Anant says yes.
40_Resources/Obsidian/Dashboards/Dashboard Build/Research - Obsidian Dashboard Methods.md:22:Not a markdown note, canvas, Kanban or drawing. Opens first on launch via Homepage, on desktop and phone. Shows a ring, streak and heatmap. Ticks write back to the daily note. Numbers are computed. Stays simple to maintain.
40_Resources/Obsidian/Dashboards/Dashboard Build/Research - Obsidian Dashboard Methods.md:62:### Homepage plugin
40_Resources/Obsidian/Dashboards/Dashboard Build/Research - Obsidian Dashboard Methods.md:64:Source: the plugin's [README and source](https://github.com/mirnovov/obsidian-homepage), version 4.5.0 (installed: 4.5.0).
40_Resources/Obsidian/Dashboards/Dashboard Build/Research - Obsidian Dashboard Methods.md:67:- **Verified.** "Run any Obsidian command upon opening the homepage". Commands run through `executeCommandById`, with a "Both", "Startup only" or "Manual only" period.
16
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .obsidian/plugins/lazy-plugins/data.json | head -60; grep -o '"homepage"[^}]*\|"the-plan-dashboard"[^}]*' .obsidian/plugins/lazy-plugins/data.json
```
```
{
  "dualConfigs": true,
  "showConsoleLog": false,
  "desktop": {
    "shortDelaySeconds": 5,
    "longDelaySeconds": 15,
    "delayBetweenPlugins": 40,
    "defaultStartupType": "short",
    "showDescriptions": true,
    "enableDependencies": false,
    "plugins": {
      "code-styler": {
        "startupType": "instant"
      },
      "copilot": {
        "startupType": "long"
      },
      "dataview": {
        "startupType": "instant"
      },
      "excalibrain": {
        "startupType": "long"
      },
      "obsidian-excalidraw-plugin": {
        "startupType": "long"
      },
      "file-explorer-plus": {
        "startupType": "instant"
      },
      "obsidian-hover-editor": {
        "startupType": "short"
      },
      "obsidian-kanban": {
        "startupType": "short"
      },
      "obsidian-latex-suite": {
        "startupType": "instant"
      },
      "obsidian-local-rest-api": {
        "startupType": "instant"
      },
      "ninja-cursor": {
        "startupType": "instant"
      },
      "omnisearch": {
        "startupType": "short"
      },
      "url-into-selection": {
        "startupType": "instant"
      },
      "periodic-notes": {
        "startupType": "short"
      },
      "quickadd": {
        "startupType": "short"
      },
      "recent-files-obsidian": {
        "startupType": "instant"
      },
      "obsidian-spaced-repetition": {
"homepage": {
"the-plan-dashboard": {
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && node -e '
const c=JSON.parse(require("fs").readFileSync(".obsidian/plugins/lazy-plugins/data.json","utf8"));
for(const k of ["desktop","mobile"]) if(c[k]) console.log(k,"default",c[k].defaultStartupType,"homepage",JSON.stringify(c[k].plugins.homepage),"dash",JSON.stringify(c[k].plugins["the-plan-dashboard"]),"dataview",JSON.stringify(c[k].plugins.dataview));
console.log("dual",c.dualConfigs)'
```
```
desktop default short homepage {"startupType":"instant"} dash {"startupType":"instant"} dataview {"startupType":"instant"}
dual true
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && mv "00_Live/Map.canvas" "00_Live/Map Canvas.canvas" && node -e '
const fs=require("fs");
let g=fs.readFileSync(".gitignore","utf8");
g=g.replace("!*.md\n","!*.md\n\n# The Map canvas is a deliberate vault file, not editor state.\n!00_Live/Map Canvas.canvas\n");
fs.writeFileSync(".gitignore",g);
const p="40_Resources/Obsidian/Dashboards/Dashboards Hub.md";let h=fs.readFileSync(p,"utf8");
h=h.replace("- **Month:** the current Monthly note in `00_Live/Enumerate/Monthly/`, for example [[2026-10]]","- **Month:** the current Monthly note in `00_Live/Enumerate/Monthly/`, for example [[2026-10]], and the [[Monthly Dashboard]] that reads the daily notes\n- **Map:** [[Map Canvas.canvas|Map canvas]] (domains, goals and the notes that own them). Not [[Map]], which is the `00_Live` index.");
fs.writeFileSync(p,h);'
git check-ignore -v "00_Live/Map Canvas.canvas" || echo "not ignored"; git status --short; git diff --stat; grep -n "Monthly Dashboard\|Map canvas" "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"; node -e 'JSON.parse(require("fs").readFileSync("00_Live/Map Canvas.canvas","utf8"));console.log("canvas ok")'
```
```
.gitignore:3:*	00_Live/Map Canvas.canvas
 M "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"
 40_Resources/Obsidian/Dashboards/Dashboards Hub.md | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
12:  - "[[Spec - Home and Monthly Dashboards]]"
30:- **Map canvas.** Exploration only, with real edges.
43:| [[Spec - Home and Monthly Dashboards]] | Layouts, plugins, visual language, risks |
70:- **Month:** the current Monthly note in `00_Live/Enumerate/Monthly/`, for example [[2026-10]], and the [[Monthly Dashboard]] that reads the daily notes
71:- **Map:** [[Map Canvas.canvas|Map canvas]] (domains, goals and the notes that own them). Not [[Map]], which is the `00_Live` index.
canvas ok
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && file .gitignore | head -1; node -e '
const fs=require("fs");let g=fs.readFileSync(".gitignore","utf8");const nl=g.includes("\r\n")?"\r\n":"\n";
g=g.replace("!*.md"+nl,"!*.md"+nl+nl+"# The Map canvas is a deliberate vault file, not editor state."+nl+"!00_Live/Map Canvas.canvas"+nl);
fs.writeFileSync(".gitignore",g);'
git check-ignore -v "00_Live/Map Canvas.canvas" || echo "not ignored"; git status --short; sed -n 1,10p .gitignore
```
```
.gitignore: ASCII text, with CRLF line terminators
.gitignore:8:!00_Live/Map Canvas.canvas	00_Live/Map Canvas.canvas
 M .gitignore
 M "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"
?? "00_Live/Map Canvas.canvas"
# Markdown-first Obsidian vault
# Default: ignore everything, then allow directories and markdown notes.
*
!*/
!*.md

# The Map canvas is a deliberate vault file, not editor state.
!00_Live/Map Canvas.canvas

# Keep core git config files in repo.
```

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\The Plan\00_Live\Monthly Dashboard.md`

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls .obsidian/plugins | head -50; ls .obsidian/plugins/the-plan-dashboard 2>/dev/null; ls .obsidian/snippets 2>/dev/null; ls 40_Resources/Obsidian/Dashboards 40_Resources/Obsidian/Dashboards/* | head -60; ls 60_Jarvis | head -30; ls 00_Live/Enumerate/Monthly 00_Live/Enumerate/Daily | head -80`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .obsidian/community-plugins.json; echo; grep -o '"enableDataviewJs"[^,]*\|"enableInlineDataviewJs"[^,]*\|"refreshInterval"[^,]*\|"refreshEnabled"[^,]*' .obsidian/plugins/dataview/data.json; echo ---; ls 60_Jarvis/10_Promoted_Notes; find 60_Jarvis -iname '*snapshot*'; echo ---; node 30_Order/System/plan-cli/plan-cli.cjs review 2026-10 --dir 00_Live/Enumerate/Daily`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls 30_Order/System/streak/fixtures/sample 30_Order/System/plan-cli; cat 30_Order/System/streak/fixtures/sample/2026-03-04.md; echo ----; cat 30_Order/System/streak/fixtures/sample/2026-03-01.md; echo; grep -rl "cat::" 00_Live/Enumerate/Daily | head; grep -rn "cause::" 00_Live 30_Order/System/streak/fixtures | head`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard" && ls; ls src src/* | head -60; ls node_modules 2>/dev/null | grep -i -E "^(jsdom|happy-dom|linkedom)$"`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/core" && cat streak.ts review.ts grade.ts parse.ts config.ts`
- `cd "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/core" && cat close.ts | head -80; cat periods.ts dates.ts; grep -n "today\|include" ../cli/plan-cli.ts | head -40; cd ../.. && git status --short 2>/dev/null | head -3`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && ls 00_Live 00_Live/Career 00_Live/Career/* 00_Live/Tracking 00_Live/Tracking/* 00_Live/Books | head -80; echo ----; cat "00_Live/Enumerate/Yearly/Resolutions '26.md" | head -60; echo ----; sed -n 1,60p 00_Live/Life\ OS.md; ls 30_Order/Workflows/Agentic\ OS | head`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && for f in "00_Live/Enumerate/Yearly/Resolutions '26.md" "00_Live/Enumerate/Yearly/2026.md" "00_Live/Tracking/Habits/Habits Stacking.md" "00_Live/Tracking/Habits/Daily Habit Board.md" "00_Live/Tracking/Habits/Health Tracker.md" "00_Live/Tracking/Habits/Finance Tracker.md" "00_Live/Career/Finance/Bank Accounts.md" "00_Live/Career/Finance/Stocks.md" "00_Live/Books/Easy Way to Quit Smoking.md" "00_Live/Health & Life/Heal Your Lungs.md" "00_Live/Books/Essentialism.md" "00_Live/Headway/Headway Analysis.md" "00_Live/Books/Atomic Habits.md" "00_Live/Life OS.md" "00_Live/Tracking/Plans/Summer Grind.md" "00_Live/Tracking/Relationship Log.md" "00_Live/Books/Psycho-Cybernetics.md" "00_Live/Headway/Communication.md" "30_Order/Standards/Dashboards/Streak Rule.md" "30_Order/Standards/Dashboards/Daily Note Schema.md" "30_Order/Workflows/Agentic OS/Agentic OS.md" "40_Resources/Obsidian/Dashboards/Dashboards Hub.md" "00_Live/Monthly Dashboard.md" "00_Live/Map.canvas"; do [ -e "$f" ] && echo "OK  $f" || echo "MISSING $f"; done; ls 00_Live/Career/SWE/AI | head`
- `mkdir -p "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cat > mkcanvas.cjs <<'EOF' const crypto=require('crypto'),fs=require('fs'); const id=()=>crypto.randomBytes(8).toString('hex'); const nodes=[],edges=[]; const D=[  ['Morning','4',"**Goal:** the morning routine runs without a decision (move at 8 am, read 12 pages, plan 20 minutes).",    ['30_Order/Standards/Dashboards/Daily Note Schema.md','00_Live/Tracking/Habits/Habits Stacking.md']],  ['Study','5',"**Goal 1 of 2026:** 4.0 GPA.",    ['00_Live/Enumerate/Yearly/Resolutions \'26.md','00_Live/Tracking/Plans/Summer Grind.md']],  ['Fitness','1',"**Goal 9 of 2026:** gym 5 days a week, calisthenics skills.",    ['00_Live/Tracking/Habits/Daily Habit Board.md','00_Live/Tracking/Habits/Health Tracker.md']],  ['Mind','6',"**Goals 7 and 8 of 2026:** character development, stop smoking.",    ['00_Live/Books/Easy Way to Quit Smoking.md','00_Live/Books/Psycho-Cybernetics.md']],  ['Career','3',"**Goal 2 of 2026:** land a strong internship, build at least 3 projects.",    ['00_Live/Life OS.md','00_Live/Tracking/Relationship Log.md']],  ['Health','1',"**Goals 8 and 9 of 2026:** heal the lungs, log a baseline.",    ['00_Live/Tracking/Habits/Health Tracker.md','00_Live/Health & Life/Heal Your Lungs.md']],  ['Finance','2',"**Goal 11 of 2026:** track spending and start investing.",    ['00_Live/Tracking/Habits/Finance Tracker.md','00_Live/Career/Finance/Bank Accounts.md','00_Live/Career/Finance/Stocks.md']],  ['Learning','5',"**Goal 6 of 2026:** learn something new every day, read as a hobby.",    ['00_Live/Headway/Headway Analysis.md','00_Live/Books/Essentialism.md','00_Live/Books/Atomic Habits.md']],  ['Systems','4',"**Goal 3 of 2026:** a second brain that is kept up.",    ['40_Resources/Obsidian/Dashboards/Dashboards Hub.md','30_Order/Workflows/Agentic OS/Agentic OS.md','30_Order/Standards/Dashboards/Streak Rule.md']], ]; const dom={},fileNode={}; const mk=(o)=>{const n={id:id(),...o};nodes.push(n);return n.id;}; const edge=(a,b,fs_,ts,label)=>edges.push({id:id(),fromNode:a,fromSide:fs_,toNode:b,toSide:ts,...(label?{label}:{})}); D.forEach(([name,color,goal,files],i)=>{   const y=i*340;   const d=mk({type:'text',x:0,y:y+60,width:200,height:80,text:'# '+name,color});   dom[name]=d;   const g=mk({type:'text',x:300,y:y+40,width:320,height:120,text:goal});   edge(d,g,'right','left','goal');   files.forEach((f,j)=>{     let fid=fileNode[f];     if(!fid){fid=mk({type:'file',file:f,x:760,y:y+j*100-20+ (j?0:0),width:380,height:80});fileNode[f]=fid;}     edge(g,fid,'right','left','owned by');   }); }); // shared file nodes sit at their first domain; later edges point to them edge(dom.Fitness,dom.Health,'bottom','top'); edge(dom.Mind,dom.Health,'bottom','top'); edge(dom.Study,dom.Learning,'bottom','top'); edge(dom.Systems,dom.Morning,'top','top','daily note rules'); fs.writeFileSync(process.argv[2],JSON.stringify({nodes,edges},null,'\t')); EOF node mkcanvas.cjs "D:/_Anant/20_Progress/Documents/The Plan/00_Live/Map.canvas" && echo done`
- ``cd "D:/_Anant/20_Progress/Documents/The Plan/00_Live" && python3 --version 2>/dev/null; node -e ' const fs=require("fs");let s=fs.readFileSync("Monthly Dashboard.md","utf8"); s=s.replace("display:flex;flex-direction:column;gap:14px}","display:block;margin-bottom:14px}"); s=s.replace(`const root = el("div", "pl-month", undefined, dv.container); root.appendChild(css); const card = (title) => { const c = el("div", "pl-card", undefined, root); el("div", "pl-title", title, c); return c; };`, `dv.container.appendChild(css); const card = (title) => { const w = el("div", "pl-month", undefined, dv.container); const c = el("div", "pl-card", undefined, w); el("div", "pl-title", title, c); return c; };`); fs.writeFileSync("Monthly Dashboard.md",s);console.log(s.includes("const root"))'``
- ````cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cat > harness.cjs <<'EOF' // usage: node harness.cjs <dailyDir> <today> <month>  -> prints JSON of what the dashboard rendered const fs=require('fs'),path=require('path'); const {JSDOM}=require('D:/_Anant/20_Progress/Projects/the-plan-dashboard/node_modules/jsdom'); const VAULT='D:/_Anant/20_Progress/Documents/The Plan'; const [,, dailyDir, today]=process.argv; (async()=>{ const md=fs.readFileSync(VAULT+'/00_Live/Monthly Dashboard.md','utf8'); let code=/```dataviewjs\n([\s\S]*?)\n```/.exec(md)[1]; code=code.replace('const DAILY = "00_Live/Enumerate/Daily";','const DAILY = '+JSON.stringify(dailyDir)+';')  .replace('const TODAY = localIso(new Date());','const TODAY = '+JSON.stringify(today)+';'); const dom=new JSDOM('<div id=c></div>');const document=dom.window.document; const abs=p=>path.isAbsolute(p)?p:path.join(VAULT,p); const dv={container:document.getElementById('c'),  pages:(src)=>{const dir=abs(src.replace(/^"|"$/g,''));if(!fs.existsSync(dir))return[];   return fs.readdirSync(dir).filter(f=>f.endsWith('.md')).map(f=>({file:{name:f.slice(0,-3),path:path.join(dir,f)}}));},  io:{load:async(p)=>{const f=abs(p);return fs.existsSync(f)?fs.readFileSync(f,'utf8'):undefined;}},  paragraph:()=>{}}; const AF=Object.getPrototypeOf(async function(){}).constructor; await new AF('dv','document',code)(dv,document); const out={tiles:{},causes:[],cards:[]}; for(const t of document.querySelectorAll('.pl-tile'))out.tiles[t.querySelector('.pl-lbl').textContent]={v:t.querySelector('.pl-num').textContent,sub:(t.querySelector('.pl-sub')||{}).textContent}; const cards=[...document.querySelectorAll('.pl-card')]; for(const c of cards){const title=c.querySelector('.pl-title').textContent;out.cards.push(title);  if(title==='Failure causes')for(const r of c.querySelectorAll('.pl-row'))out.causes.push(r.children[0].textContent+' '+r.children[2].textContent);} out.cells=[...document.querySelectorAll('.pl-cell')].map(c=>c.getAttribute('title')); out.text=cards.map(c=>c.textContent.slice(0,400)); console.log(JSON.stringify(out,null,1)); })().catch(e=>{console.error('FAIL',e);process.exit(1)}); EOF cd "D:/_Anant/20_Progress/Documents/The Plan" echo "=== fixture 2026-03 today 2026-03-10 ===" node "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad/harness.cjs" "D:/_Anant/20_Progress/Documents/The Plan/30_Order/System/streak/fixtures/sample" 2026-03-10 | head -40 echo "=== engine ===" node 30_Order/System/plan-cli/plan-cli.cjs review 2026-03 --dir 30_Order/System/streak/fixtures/sample --today 2026-03-10 | node -e 'const r=JSON.parse(require("fs").readFileSync(0));delete r.days;console.log(JSON.stringify(r))'````
- ``cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" && cat > parity.cjs <<'EOF' const fs=require('fs'),path=require('path'),cp=require('child_process'); const VAULT='D:/_Anant/20_Progress/Documents/The Plan'; const cats=['morning','study','fitness','mind','career'];const causes=['sleep','no-plan','distracted','energy','other']; let seed=12345;const rnd=()=>(seed=(seed*1103515245+12345)&0x7fffffff)/0x7fffffff; const iso=n=>new Date(n*864e5).toISOString().slice(0,10);const num=s=>Math.round(Date.parse(s)/864e5); let bad=0;const N=14; for(let k=0;k<N;k++){  const dir=path.join(__dirname,'case'+k);fs.rmSync(dir,{recursive:true,force:true});fs.mkdirSync(dir);  const start=num('2026-08-20'),today=iso(num('2026-10-01')+Math.floor(rnd()*30));  const firstReal=start+Math.floor(rnd()*10);  for(let n=start;n<=num('2026-10-31');n++){   if(rnd()<0.2)continue;   let body='---\ntype: daily\n---\n';   if(n>=firstReal){const full=rnd();    for(const c of cats){const p=rnd()<0.6?1:0;body+=`## ${c}\n- [${p?'x':' '}] act a [cat:: ${c}]\n- [${p||rnd()<0.2?'x':' '}] act b [cat:: ${c.toUpperCase()}]\n`;}    body+='## Evening close\n';    for(const c of cats)if(rnd()<0.3)body+=`- [miss:: ${c}]${rnd()<0.8?` [cause:: ${causes[Math.floor(rnd()*5)]}]`:''}\n`;   }   fs.writeFileSync(path.join(dir,iso(n)+'.md'),body);  }  const eng=JSON.parse(cp.execFileSync('node',[VAULT+'/30_Order/System/plan-cli/plan-cli.cjs','review','2026-10','--dir',dir,'--today',today],{cwd:VAULT}).toString());  const h=JSON.parse(cp.execFileSync('node',[__dirname+'/harness.cjs',dir,today]).toString());  const T=h.tiles;  const exp={grade:eng.grade??'-',met:eng.counted===0?'-':`${eng.met}/${eng.counted}`,lost:String(eng.counted-eng.met),cur:String(eng.streak.current),best:`best ${eng.streak.best}`,   trend:eng.trendPoints===null?'-':`${eng.trendPoints>=0?'+':''}${eng.trendPoints}`,   causes:eng.causes.map(c=>`${c.cause} ${c.count}`).join('|')};  const got={grade:T.Grade.v,met:T['Days MET'].v,lost:T.Lost.v,cur:T.Streak.v,best:T.Streak.sub,trend:T.Trend.v,causes:h.causes.join('|')};  const ok=JSON.stringify(exp)===JSON.stringify(got);if(!ok){bad++;console.log('MISMATCH case',k,today,'\n exp',exp,'\n got',got);}  else console.log('ok case',k,today,JSON.stringify(got)); } console.log(bad===0?`ALL ${N} MATCH`:`${bad} MISMATCHES`); EOF node parity.cjs``
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && S="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-The-Plan/7c5cce5a-b83e-4da7-922d-3f021bdc3aba/scratchpad" node "$S/harness.cjs" "00_Live/Enumerate/Daily" 2026-10-14 | node -e 'const h=JSON.parse(require("fs").readFileSync(0));console.log(JSON.stringify(h.tiles));console.log(h.cards.join(" | "));h.text.forEach(t=>console.log("-",t.slice(0,200)))' echo === canvas node -e ' const fs=require("fs"),c=JSON.parse(fs.readFileSync("00_Live/Map.canvas","utf8")); const ids=new Set([...c.nodes,...c.edges].map(x=>x.id));const nid=new Set(c.nodes.map(n=>n.id)); console.log("nodes",c.nodes.length,"edges",c.edges.length,"unique ids",ids.size===c.nodes.length+c.edges.length); console.log("dangling edges",c.edges.filter(e=>!nid.has(e.fromNode)||!nid.has(e.toNode)).length); console.log("missing files",c.nodes.filter(n=>n.type==="file"&&!fs.existsSync(n.file)).map(n=>n.file)); console.log("bad id format",[...ids].filter(i=>!/^[0-9a-f]{16}$/.test(i)).length); let ov=0;for(let i=0;i<c.nodes.length;i++)for(let j=i+1;j<c.nodes.length;j++){const a=c.nodes[i],b=c.nodes[j];if(a.x<b.x+b.width&&b.x<a.x+a.width&&a.y<b.y+b.height&&b.y<a.y+a.height)ov++;} console.log("overlaps",ov); const doms=["Morning","Study","Fitness","Mind","Career","Health","Finance","Learning","Systems"]; console.log("domains",doms.filter(d=>c.nodes.some(n=>n.text==="# "+d)).length+"/9"); ' grep -c "—" "00_Live/Monthly Dashboard.md" 00_Live/Map.canvas; git status --short`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && git check-ignore -v 00_Live/Map.canvas; ls -la 00_Live/Map.canvas; git diff --stat 60_Jarvis/README.md | tail -1`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .gitignore | head -40; echo ---; git diff 60_Jarvis/README.md | head -40; echo ---; cat .obsidian/plugins/homepage/data.json; echo; cat .obsidian/plugins/the-plan-dashboard/manifest.json; ls .obsidian/plugins/the-plan-dashboard; cat .obsidian/plugins/the-plan-dashboard/data.json 2>/dev/null | head -30; cat "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/settings.ts" | head -60; grep -n "onLayoutReady\|addCommand\|Open dashboard\|startup\|openOnStart" "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/main.ts"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n 1,70p "D:/_Anant/20_Progress/Projects/the-plan-dashboard/src/main.ts"; git log --oneline -3 -- 60_Jarvis/README.md; git status --short; find . -name "*.canvas" -not -path "./.obsidian/*" | head; grep -rn "Homepage\|homepage" 40_Resources/Obsidian/Dashboards/Dashboard\ Build/*.md 30_Order/Workflows/Agentic\ OS/How\ to\ Use\ Plugins.md | head -20; grep -c . .obsidian/community-plugins.json; grep -o '"[a-z-]*"' .obsidian/core-plugins.json | head -0`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .obsidian/plugins/lazy-plugins/data.json | head -60; grep -o '"homepage"[^}]*\|"the-plan-dashboard"[^}]*' .obsidian/plugins/lazy-plugins/data.json`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && node -e ' const c=JSON.parse(require("fs").readFileSync(".obsidian/plugins/lazy-plugins/data.json","utf8")); for(const k of ["desktop","mobile"]) if(c[k]) console.log(k,"default",c[k].defaultStartupType,"homepage",JSON.stringify(c[k].plugins.homepage),"dash",JSON.stringify(c[k].plugins["the-plan-dashboard"]),"dataview",JSON.stringify(c[k].plugins.dataview)); console.log("dual",c.dualConfigs)'`
- ``cd "D:/_Anant/20_Progress/Documents/The Plan" && mv "00_Live/Map.canvas" "00_Live/Map Canvas.canvas" && node -e ' const fs=require("fs"); let g=fs.readFileSync(".gitignore","utf8"); g=g.replace("!*.md\n","!*.md\n\n# The Map canvas is a deliberate vault file, not editor state.\n!00_Live/Map Canvas.canvas\n"); fs.writeFileSync(".gitignore",g); const p="40_Resources/Obsidian/Dashboards/Dashboards Hub.md";let h=fs.readFileSync(p,"utf8"); h=h.replace("- **Month:** the current Monthly note in `00_Live/Enumerate/Monthly/`, for example [[2026-10]]","- **Month:** the current Monthly note in `00_Live/Enumerate/Monthly/`, for example [[2026-10]], and the [[Monthly Dashboard]] that reads the daily notes\n- **Map:** [[Map Canvas.canvas|Map canvas]] (domains, goals and the notes that own them). Not [[Map]], which is the `00_Live` index."); fs.writeFileSync(p,h);' git check-ignore -v "00_Live/Map Canvas.canvas" || echo "not ignored"; git status --short; git diff --stat; grep -n "Monthly Dashboard\|Map canvas" "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"; node -e 'JSON.parse(require("fs").readFileSync("00_Live/Map Canvas.canvas","utf8"));console.log("canvas ok")'``
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && file .gitignore | head -1; node -e ' const fs=require("fs");let g=fs.readFileSync(".gitignore","utf8");const nl=g.includes("\r\n")?"\r\n":"\n"; g=g.replace("!*.md"+nl,"!*.md"+nl+nl+"# The Map canvas is a deliberate vault file, not editor state."+nl+"!00_Live/Map Canvas.canvas"+nl); fs.writeFileSync(".gitignore",g);' git check-ignore -v "00_Live/Map Canvas.canvas" || echo "not ignored"; git status --short; sed -n 1,10p .gitignore`

