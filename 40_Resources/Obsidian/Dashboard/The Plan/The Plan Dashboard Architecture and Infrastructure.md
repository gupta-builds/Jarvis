---
type: reference
status: seed
created: 2026-10-26
updated: 2026-10-26
tags:
  - dashboard
  - the-plan
  - architecture
reference_kind: tool-profile
area:
  - "[[Daily Operating System]]"
notes:
  - "[[The Plan Overview]]"
  - "[[The Plan Dashboard UI and What Appears]]"
  - "[[The Plan Dashboard Build History and Method]]"
  - "[[The Plan Dashboard Daily Workflow and AI Loop]]"
  - "[[The Plan Dashboard State and Gaps 2026-10-25]]"
---
# The Plan Dashboard Architecture and Infrastructure
This note describes what The Plan's dashboard is made of: the plugin, the engine, the hooks, how files move between laptops, and where each piece lives. Read it before touching the plugin repository or deciding where a new automation can write. What is drawn on screen is in [[The Plan Dashboard UI and What Appears]]. Facts come from the plugin repository (read 2026-10-26), `Architecture.md`, `Reference - the-plan-dashboard.md` and `Reference - plan-cli.md` in The Plan, and the 2026-10-25 build review.
## The idea in three layers
The daily note is the only source of truth. The dashboard reads it and stores nothing.

| Layer | Job | Imports Obsidian? |
|---|---|---|
| Data | Daily notes named `YYYY-MM-DD.md`, with `- [ ]` lines and a `[cat:: morning]` field | No |
| Engine | `src/core/`: parse note text, compute day status, streak, best streak, reviews, grades, validation | No |
| View | A React view inside an Obsidian `ItemView`, plus a repository that reads and caches files | Yes |
The engine has no Obsidian import. That is what lets the plugin, the Claude Code hooks, the reviews and the tests run the same code. The earlier plan had a Python streak script and a second DataviewJS implementation that a test would compare. Decision 36 (2026-10-13) removed that duplication: the TypeScript engine is the only implementation, and `streak.py` stays only as a test oracle.
## Data flow
```
daily notes (.md) --cachedRead--> DailyRepo --> buildModel (pure) --> React view
        ^                                                               |
        +------------- Vault.process (one checkbox) <-------------------+
```
1. `DailyRepo.load()` lists the files in the daily folder and keeps only names matching `^\d{4}-\d{2}-\d{2}\.md$`. A file named `25-10-2026.md` is silently skipped. That one rule caused the empty dashboard described in [[The Plan Dashboard State and Gaps 2026-10-25]].
2. Each file is read with `vault.cachedRead` and cached by modification time. Health and finance tracker notes are read the same way.
3. `buildModel` turns the texts into one `Model`: today's categories and rows, the streak result, the career line, study topic and hours, next actions, and the latest health and finance entries.
4. The view subscribes to the repository. Vault events (`modify`, `create`, `delete`, `rename`) are registered inside `onLayoutReady`, because Obsidian fires them for every existing file at load. A change to a relevant path drops its cache entry and redraws after a 150 ms debounce.
5. A 30-second timer recomputes today's date, so a tick after midnight belongs to the new day.
6. A tick calls `setChecked`, the only write path. It runs `toggleLine` inside `Vault.process`, which is atomic. `toggleLine` refuses unless the line at that number still equals the line the user saw, so a stale tap after a sync cannot tick the wrong task. It changes one character between the brackets and keeps line endings and every other byte.
Settings hold one value: the daily folder, default `00_Live/Enumerate/Daily`. Everything personal (floor of 3, milestones 3, 7, 21, 66, 100, level titles, cause tags, next-action types, grade bands, folder names) lives in one object, `CONFIG`, in `src/core/config.ts`.
## The repository
| Item | Value |
|---|---|
| Path | `D:\_Anant\20_Progress\Projects\the-plan-dashboard`, outside the vault |
| Plugin id and version | `the-plan-dashboard`, 0.1.0, `minAppVersion` 1.5.7, `isDesktopOnly: false`, private |
| Commits | `b744ba1` engine, React view, tests; `23e6452` review modules, `plan-cli`, hooks, tests; `a65a4ba` secrets guard fix. No git remote as of 2026-10-25, so the source exists on one laptop |
| Dependencies | `react` and `react-dom` 19.3; dev: `esbuild` 0.25.5, `typescript` 5.8, `jsdom`, `obsidian` types |
| Source | `core/` (config, dates, model, parse, periods, review, close, grade, jarvis, sections, streak, tables, toggle, validate), `data/` (repo, write), `hooks/` (writeGuard, secretsGuard, dailyValidator, paths, types), `cli/` (plan-cli, streak-cli, common), `ui/` (App, charts, hooks, sections, styles), `view/DashboardView.tsx`, `main.ts`, `settings.ts` |
| Tests | `tests/` with engine, parity, periods, review, validate, hooks, jarvis, cli and ui files. 87 tests passed on 2026-10-13 |
Scripts: `npm run build` (typecheck then esbuild production), `build:cli` (two Node bundles, `streak-cli.cjs` and `plan-cli.cjs`), `test`, `preview` (headless Edge screenshots), `deploy -- <plugin folder>` (copies `main.js`, `manifest.json`, `styles.css`), `deploy:cli -- <folder>`. `PLAN_PLUGIN_OUT` sends the dev build straight into a vault plugin folder.
## The engine as a program: `plan-cli`
`plan-cli.cjs` (about 46 KB) is deployed to `30_Order/System/plan-cli/` in the vault. It reads notes, prints JSON, and writes nothing.

| Command | Output |
|---|---|
| `streak <dir> <date>` | current and best streak, today's category count, `at_risk`, `first_day`, per-day list |
| `day <dir> <date>` | category status, missed categories, career line, study topic, Evening close lines, next actions |
| `review <week\|month\|label> --dir <folder>` | counted and MET days, percent, letter grade, MISS days, causes, streak, trend, and the Review Log entry |
| `validate <note>` | the six daily-note rules plus warnings |
| `repeat --dir <folder> --date D` | accepts or rejects proposed next actions read from stdin |
| `jarvis-check --vault <root>` | the automatic checks for notes dumped from Jarvis with `status: unreviewed` |
| `hook <write-guard\|secrets-guard\|validate-daily>` | hook decision JSON, exit 2 on any failure |
Exit codes: 0 done, 1 wrong input, 2 usage error or a blocked or failed hook. Grade bands: A at 90 percent, B at 75, C at 60, D at 40, F below. Node 24.19.0 here, 18 or later required.
Two parity tests compare the engine with `streak.py`: 200 random histories, and every day of 20 random months. All numbers matched on 2026-10-13. One bug the tests found: the template's `%%` example line under Evening close would have counted as a miss.
## Hooks
The write guard, secrets guard and daily-note validator are one program, `plan-cli hook`, registered in `.claude/settings.json` (Decisions 44 and 50). The write guard denies new files at the vault root and any write to `50_Archive` or `.obsidian`. The secrets guard denies reading or printing `.env*`, keys and tokens, and fails closed. The validator checks the six daily-note rules after Claude writes a daily note. It sees only what Claude writes: dashboard ticks, edits typed in Obsidian and Sync writes never fire it. Registered and verified live on 2026-10-13, and removed by the 2026-10-16 regression ([[The Plan Dashboard State and Gaps 2026-10-25]]).
## Deploy and launch
- The deployed plugin is `.obsidian/plugins/the-plan-dashboard/` with three files: `main.js` (247 KB, built 2026-10-13 19:51), `manifest.json`, `styles.css`.
- Homepage is set to kind Nothing, opens on startup, and runs the command `the-plan-dashboard:open-dashboard`. `separateMobile` is false, so the phone uses the same profile.
- `openDashboard` reuses an existing leaf or opens a new tab, so launching never replaces the note being read. A ribbon icon, `layout-dashboard`, does the same.
- Lazy Plugin Loader: Dataview, Templater, Homepage and the plugin are `instant`; Periodic Notes, QuickAdd and Meta Bind are `short`. The loader file has only a desktop block. Whether the phone gets the plugin through Sync is unverified.
## Sync and git: who writes what
- **Obsidian Sync** owns every note and `.obsidian`.
- **Git** carries only dot-folders (`.claude`, `.kiro`, `.codex`, `.gitattributes`) and `30_Order/System/git-sync/`. `plan-git-sync.ps1` materializes remote content only for those git-owned paths. For every other path it moves the branch with `update-ref` and an index-only reset, then runs `git add -A`, commit and push. It never pulls, rebases or merges into notes.
- **Consequence for automation.** A cloud job cannot write a note into the vault, because a file committed to GitHub never reaches the working tree. Only a local process, Claude Code or a scheduled local task, can write notes, and Sync carries them to the phone.
- **Consequence for the engine.** `plan-cli.cjs` is not a dot path and not in the git-sync folder, and Sync skips `.cjs` unless "Sync all other types" is on. Each laptop may need its own deploy.
- **The 2026-10-16 failure.** The second laptop pushed a stale working tree, and this laptop's git-sync treated every dot path as git-owned and wrote the stale `.claude` and `.gitignore` to disk.
## Vault layout it depends on
`00_Live/Enumerate/{Daily,Weekly,Monthly,Yearly}`, `00_Live/Tracking/{Habits,Finance,Plans,Meals}`, `00_Live/Life OS.md`, `00_Live/Monthly Dashboard.md`, `00_Live/Map Canvas.canvas`, `10_UMN`, `20_Progress`, `30_Order/{Standards,Templates,Workflows,System}`, `40_Resources/Obsidian/Dashboards`, `50_Archive` (never read or written), and `60_Jarvis` with two zones: governance and staging (`00_Control_Center`, `10_Promoted_Notes`, `20_Decisions`, `40_Archive`, `50_Reviews`) and AI knowledge (`01_Prompt_Library`, `30_AI_Information`).
## Where the build departs from its own plan
| Plan said | Built |
|---|---|
| Plain DOM and inline SVG, four dependencies, no framework | React 19, a 247 KB bundle |
| Colours as Obsidian CSS variables in `styles.css` | Hex values in `src/ui/styles.ts` |
| A dev vault for testing | None |
| Explore map, month strip, level titles, grade on screen, a "create today" button, a screen-versus-CLI debug command | Not built |
| Source pushed to a private GitHub repo after approval | No remote |