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
