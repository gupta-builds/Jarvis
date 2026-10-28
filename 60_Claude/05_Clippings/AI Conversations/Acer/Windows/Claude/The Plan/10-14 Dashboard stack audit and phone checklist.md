---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Dashboard stack audit and phone checklist"
started_at: 2026-10-14T15:17:34
ended_at: 2026-10-14T15:22:11
exported_at: 2026-10-28T16:15:48
duration_minutes: 4.6
project: The Plan
cwd: 'D:\_Anant\20_Progress\Documents\The Plan'
session_id: 226cc9bb-7ad2-4e33-b828-2662ca9e9a78
status: seed
review_state: raw
created: 2026-10-14
updated: 2026-10-28
turn_count: 2
tools_used:
  Bash: 8
  Grep: 2
  mcp__the-plan__command_list: 1
  Read: 2
  ToolSearch: 1
  Write: 1
tokens:
  input: 26
  output: 11012
  cache_creation: 120388
  cache_read: 1073450
  total: 1204876
cost_usd: 0.699069
model:
  - "claude-sonnet-5-5"
files_touched:
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Audit - Dashboard Stack and Phone Checklist.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Research - Platform Facts.md"
  - "D:\\_Anant\\20_Progress\\Documents\\The Plan\\40_Resources\\Obsidian\\Dashboards\\Spec - Home and Monthly Dashboards.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Dashboard stack audit and phone checklist

## You



<pasted_content id="2ad2">
You are working in The Plan, Anant's personal Obsidian vault at D:\_Anant\20_Progress\Documents\The Plan. Start by reading AGENTS.md, then 40_Resources/Obsidian/Dashboards/Dashboards Hub.md, then the notes the task names. Where AGENTS.md or those notes conflict with an older file, the newer instruction wins; report the conflict instead of picking silently.

Keep working until everything the task asks for is done, and only stop to ask when you cannot go on without Anant or before a risky step. Risky steps are renaming or moving notes, deleting anything, editing AGENTS.md, editing anything under .obsidian, and any action that touches an outside service. For those, show exactly what you will do and wait for a yes.

When the work is done and checked, stop and report. Do not add features, tests, files, docs or refactors that were not asked for. If you think one would help, mention it at the end instead of doing it. Write only inside the paths the task names.

When you change anything that can be run, built or tested, run a real check that exercises the change before reporting it done. A syntax-only check does not count. If a real check cannot run here, say which one you did not run and why.

Use search and the official documentation to check specifics that may have changed since your training, such as hook event names, skill frontmatter fields, plugin behaviour and connector capabilities, even when you feel confident. Cite the page you used.

Rules for this vault: never use an em dash; write complete sentences. Never read or print secret files (.env files, keys, tokens, credentials) and do not open plugin data.json files for copilot, quickadd, readwise or local-rest-api. Search before creating a note. Preserve frontmatter and wikilinks, and patch by heading instead of rewriting. Check that every wikilink target exists before writing it. Never create a directory named .agents. Do not read or write 50_Archive. Do not create inbox, clipping or transcript folders. Be direct and specific in everything you write.

End with a report: files changed, checks run and their results, anything unverified, and extras worth doing later.
</pasted_content id="2ad2">




<pasted_content id="2ad2">
Task: verify the dashboard stack on desktop and prepare the phone test. Read Spec - Home and Monthly Dashboards and Research - Platform Facts.

Using only safe files (community-plugins.json, core-plugins.json, manifest.json files), report which of Dataview, Meta Bind, Homepage, Templater, Periodic Notes and QuickAdd are enabled, and recommend what to enable or disable, with a reason each. Check the Dataview refresh setting by reading its settings file only if it contains no secrets, and report it. Read 30_Order/System/git-sync/plan-git-sync.ps1 and confirm that git and Obsidian Sync do not write the same files. Write a numbered phone checklist Anant can run in five minutes: Home opens on startup, ring and streak render, a tick writes back to the note, the career line and hours inputs work, Monthly renders, the canvas opens. Save the audit and the checklist as one note in the Dashboards folder. Do not change any plugin setting.
</pasted_content id="2ad2">


## Claude

Checking the daily note for the hours input and career line, then I'll write the note.

I wrote the audit and the phone checklist as one note. All six plugins are enabled on desktop, and git and Obsidian Sync do not write the same files. The checklist has not been run, and nothing was tested on the phone.

**File changed:** `40_Resources/Obsidian/Dashboards/Audit - Dashboard Stack and Phone Checklist.md`. I changed no plugin setting. The note has no em dashes, and its wikilink targets exist.

**Checks run**
- **Plugins:** I read `community-plugins.json`, `core-plugins.json` and the six manifests. I also read `lazy-plugins/data.json`, `homepage/data.json` and `dataview/data.json`, which hold no secrets. Periodic Notes, QuickAdd and Meta Bind are missing from `community-plugins.json` because Lazy Plugin Loader enables them after a delay. A live `command_list` call to the running desktop app showed commands from all six, so all are enabled.
- **Homepage:** it is set to open the dashboard on startup and is now `instant`. That fixes the cold-start risk noted in the earlier research.
- **Dataview refresh:** it is on at 2500 ms. Home no longer uses Dataview, so this only affects the Monthly page.
- **Git and Sync:** git writes only to paths starting with `.` and to the git-sync folder. For every other file it moves the branch and commit without touching the working tree. Obsidian Sync carries notes and `.obsidian`, which `.gitignore` excludes, so the two sets do not overlap. The log shows a successful push at 15:08 today.

**Recommendations** (each needs your yes)
- Keep Dataview, Homepage and Templater.
- Keep QuickAdd for now, because it is the only route to create tomorrow's note.
- Disable Periodic Notes after checking that the Calendar plugin does not rely on it.
- Disable Meta Bind. No note uses it, and the Home view shows hours read-only.

**Conflict:** the Home and Monthly spec and Decision 15 still list Meta Bind as core for the hours input. The built Home view made hours read-only, so I followed the newer design. The checklist edits `study_hours` through the Properties panel.

**Unverified**
- **Phone:** nothing about the phone was tested.
- **Today's note:** the newest daily note is 2026-10-12, so today's may not exist. The checklist says to create it first.
- **Engine on the other laptop:** `plan-cli.cjs` may never reach the second laptop. It is neither git-owned nor a file type Sync carries by default. I did not inspect that laptop.
- **Obsidian Git:** it is loaded. Whether its automatic pull and push are on is unchecked, because that needs its data file.
- **QuickAdd:** I could not confirm any choice exists, because its `data.json` is off limits.
- **Documentation:** I did not consult official documentation this pass. Platform claims come from `Research - Platform Facts`, read 2026-10-13.

**Extras worth doing later:** decide how the engine reaches the second laptop, check Obsidian Git's automatic routines are off, and apply the plugin recommendations in one approved step.

### Tool Calls

- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && cat ".obsidian/community-plugins.json" ".obsidian/core-plugins.json"; ls .obsidian/plugins; for p in dataview meta-bind homepage templater-obsidian periodic-notes quickadd; do echo "== $p"; grep -E '"(id|name|version|isDesktopOnly)"' .obsidian/plugins/$p/manifest.json 2>&1; done; ls 40_Resources/Obsidian/Dashboards; cat "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"
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
]{
  "file-explorer": true,
  "global-search": true,
  "switcher": true,
  "graph": true,
  "backlink": true,
  "canvas": true,
  "outgoing-link": true,
  "tag-pane": true,
  "footnotes": true,
  "properties": true,
  "page-preview": true,
  "daily-notes": false,
  "templates": false,
  "note-composer": true,
  "command-palette": true,
  "slash-command": true,
  "editor-status": true,
  "bookmarks": true,
  "markdown-importer": true,
  "zk-prefixer": false,
  "random-note": true,
  "outline": true,
  "word-count": true,
  "slides": true,
  "audio-recorder": false,
  "workspaces": true,
  "file-recovery": true,
  "publish": false,
  "sync": true,
  "bases": true,
  "webviewer": false
}calendar
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
== dataview
  "id": "dataview",
  "name": "Dataview",
  "version": "0.5.68",
  "isDesktopOnly": false
== meta-bind
grep: .obsidian/plugins/meta-bind/manifest.json: No such file or directory
== homepage
	"id": "homepage",
	"name": "Homepage",
	"version": "4.5.0",
	"isDesktopOnly": false,
== templater-obsidian
    "id": "templater-obsidian",
    "name": "Templater",
    "version": "2.26.0",
    "isDesktopOnly": false
== periodic-notes
  "id": "periodic-notes",
  "name": "Periodic Notes",
  "version": "0.0.17",
  "isDesktopOnly": false,
== quickadd
	"id": "quickadd",
	"name": "QuickAdd",
	"version": "2.32.1",
	"isDesktopOnly": false
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
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -E '"(id|name|version|isDesktopOnly)"' .obsidian/plugins/obsidian-meta-bind-plugin/manifest.json .obsidian/plugins/the-plan-dashboard/manifest.json; echo ---DV; cat .obsidian/plugins/dataview/data.json; echo; echo ---SPEC; cat "40_Resources/Obsidian/Dashboards/Spec - Home and Monthly Dashboards.md"; echo ---PF; cat "40_Resources/Obsidian/Dashboards/Research - Platform Facts.md"
```
```
<persisted-output>
Output too large (45.6KB). Full output saved to: C:\Users\anant\.claude\projects\[REDACTED]\[REDACTED]\tool-results\b4m4118di.txt

Preview (first 2KB):
.obsidian/plugins/obsidian-meta-bind-plugin/manifest.json:	"id": "obsidian-meta-bind-plugin",
.obsidian/plugins/obsidian-meta-bind-plugin/manifest.json:	"name": "Meta Bind",
.obsidian/plugins/obsidian-meta-bind-plugin/manifest.json:	"version": "1.5.1",
.obsidian/plugins/obsidian-meta-bind-plugin/manifest.json:	"isDesktopOnly": false
.obsidian/plugins/the-plan-dashboard/manifest.json:	"id": "the-plan-dashboard",
.obsidian/plugins/the-plan-dashboard/manifest.json:	"name": "The Plan dashboard",
.obsidian/plugins/the-plan-dashboard/manifest.json:	"version": "0.1.0",
.obsidian/plugins/the-plan-dashboard/manifest.json:	"isDesktopOnly": false
---DV
{
  "renderNullAs": "\\-",
  "taskCompletionTracking": false,
  "taskCompletionUseEmojiShorthand": false,
  "taskCompletionText": "completion",
  "taskCompletionDateFormat": "yyyy-MM-dd",
  "recursiveSubTaskCompletion": false,
  "warnOnEmptyResult": true,
  "refreshEnabled": true,
  "refreshInterval": 2500,
  "defaultDateFormat": "MMMM dd, yyyy",
  "defaultDateTimeFormat": "h:mm a - MMMM dd, yyyy",
  "maxRecursiveRenderDepth": 4,
  "tableIdColumnName": "File",
  "tableGroupColumnName": "Group",
  "showResultCount": true,
  "allowHtml": true,
  "inlineQueryPrefix": "=",
  "inlineJsQueryPrefix": "$=",
  "inlineQueriesInCodeblocks": true,
  "enableInlineDataview": true,
  "enableDataviewJs": true,
  "enableInlineDataviewJs": true,
  "prettyRenderInlineFields": true,
  "prettyRenderInlineFieldsInLivePreview": true,
  "dataviewJsKeyword": "dataviewjs"
}
---SPEC
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

...
</persisted-output>
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && cat 30_Order/System/git-sync/plan-git-sync.ps1; ls -a 30_Order/System/git-sync; cat .gitignore; ls 00_Live; ls "40_Resources/Obsidian/Dashboards/Dashboard Build"
```
```
# Scheduled git commit/push for The Plan vault, built for a vault whose note
# content is carried between laptops by Obsidian Sync.
#
# Division of labor (why this is not a copy of Jarvis's git-auto-sync.ps1):
#   - Obsidian Sync owns every note file. Git must NEVER write a note into the
#     working tree, or git and Obsidian Sync become two writers racing on the
#     same file, and a merge conflict's <<<<<<< markers would be carried to the
#     other laptop by Obsidian Sync. So there is no pull --rebase/merge here.
#   - Git owns the paths Obsidian Sync never carries: every dot path at the
#     vault root (.claude/, .kiro/, .gitignore, .gitattributes) plus this
#     script's own folder. Only those paths are ever materialized from origin.
#
# One run:
#   1. fetch origin.
#   2. For each git-owned path the remote changed since the last synced base,
#      take the remote version only if the local file still equals the base
#      version (untouched here). If both sides changed it, keep local and log
#      a CONFLICT line with the command that shows the remote version.
#   3. If the branch does not contain the remote tip, move onto it with a mixed
#      reset (index only, the working tree is never touched).
#   4. Commit the working tree as it stands (git add -A) and push. On a
#      rejected push (the other laptop pushed first) repeat from step 1 once.
#   5. The synced base is recorded in .git/plan-git-sync.base, not derived from
#      HEAD, so a manual Pull/Sync from the Obsidian Git plugin (reset mode)
#      can never make a remote dot-folder change look like a local edit.
#
# Usage: .\plan-git-sync.ps1 [-VaultRoot <repo>] [-LogDir <dir>]
# Exit codes: 0 = clean (nothing to do, or pushed), 1 = needs a human.
# Dot-sourcing defines the functions without running (used by tests).

param(
    [string]$VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..")).Path,
    [string]$LogDir = (Join-Path $PSScriptRoot "logs"),
    [int]$MaxRetries = 1
)

# git prints UTF-8 paths; PowerShell 5.1 would otherwise decode them with the
# OEM code page and mangle any non-ASCII file name.
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$LogFile = Join-Path $LogDir "plan-git-sync.log"
$LockStaleMinutes = 30
$GitOwnedFolder = "30_Order/System/git-sync/"

function Write-SyncLog {
    # Write-Host, never Write-Output: these functions return booleans and
    # Write-Output would leak log lines into the return value (Jarvis Build 7
    # bug 2).
    param([string]$Message)
    $line = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message"
    Write-Host $line
    if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
    Add-Content -Path $LogFile -Value $line -Encoding UTF8
}

function Invoke-Git {
    # Runs git, logs its output, returns $true on exit code 0.
    param([string[]]$GitArgs, [switch]$Quiet)
    $out = & git @GitArgs 2>&1 | Out-String
    $code = $LASTEXITCODE
    if (-not $Quiet -or $code -ne 0) {
        $out.Trim() -split "`r?`n" | Where-Object { $_ -and $_ -notmatch 'git-credential-github-env' } | ForEach-Object { Write-SyncLog "  $_" }
    }
    return ($code -eq 0)
}

function Test-GitOwnedPath {
    param([string]$Path)
    return ($Path.StartsWith(".") -or $Path.StartsWith($GitOwnedFolder))
}

function Get-BlobId {
    # Blob id of <rev>:<path>, or $null when the path does not exist there.
    param([string]$Rev, [string]$Path)
    $id = & git rev-parse -q --verify "${Rev}:${Path}" 2>$null
    if ($LASTEXITCODE -ne 0 -or -not $id) { return $null }
    return $id.Trim()
}

function Get-WorkTreeBlobId {
    # Blob id the working-tree file would get if added (clean/eol filters
    # applied), or $null when the file does not exist.
    param([string]$Path)
    if (-not (Test-Path -LiteralPath (Join-Path $VaultRoot $Path) -PathType Leaf)) { return $null }
    $id = & git hash-object -- "$Path" 2>$null
    if ($LASTEXITCODE -ne 0 -or -not $id) { return $null }
    return $id.Trim()
}

function Get-SyncBase {
    param([string]$Remote)
    $stateFile = Join-Path (& git rev-parse --absolute-git-dir).Trim() "plan-git-sync.base"
    if (Test-Path $stateFile) {
        $base = (Get-Content $stateFile -Raw).Trim()
        & git cat-file -e "$base^{commit}" 2>$null
        if ($LASTEXITCODE -eq 0) { return $base }
        Write-SyncLog "Recorded base $base is not a known commit, falling back to merge-base."
    }
    $mb = & git merge-base HEAD $Remote 2>$null
    if ($LASTEXITCODE -eq 0 -and $mb) { return $mb.Trim() }
    return $null
}

function Set-SyncBase {
    param([string]$Commit)
    $stateFile = Join-Path (& git rev-parse --absolute-git-dir).Trim() "plan-git-sync.base"
    Set-Content -Path $stateFile -Value $Commit -Encoding ASCII
}

function Invoke-CommitIfNeeded {
    param([string]$Suffix = "")
    & git add -A 2>&1 | Out-Null
    & git diff --cached --quiet
    if ($LASTEXITCODE -eq 0) { return $false }
    $n = @(& git diff --cached --name-only).Count
    $msg = "auto-sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm') | $n files$Suffix"
    if (-not (Invoke-Git -GitArgs @('commit', '-q', '-m', $msg))) {
        throw "git commit failed"
    }
    Write-SyncLog "Committed: $msg"
    return $true
}

function Sync-GitOwnedPaths {
    # Applies remote-side changes to git-owned paths between $Base and
    # $Remote, never touching a path that was also changed locally.
    param([string]$Base, [string]$Remote)
    $raw = & git -c core.quotepath=false diff --name-only -z --no-renames $Base $Remote 2>$null | Out-String
    $paths = @($raw -split "`0" | ForEach-Object { $_.Trim("`r", "`n") } | Where-Object { $_ })
    $applied = 0; $conflicts = 0
    foreach ($p in $paths) {
        if (-not (Test-GitOwnedPath $p)) { continue }
        $baseId = Get-BlobId -Rev $Base -Path $p
        $remoteId = Get-BlobId -Rev $Remote -Path $p
        $localId = Get-WorkTreeBlobId -Path $p
        if ($localId -eq $remoteId) { continue }
        if ($localId -ne $baseId) {
            $conflicts++
            Write-SyncLog "CONFLICT (kept local): $p changed on both laptops. Remote version: git show ${Remote}:`"$p`""
            continue
        }
        $full = Join-Path $VaultRoot $p
        if ($null -eq $remoteId) {
            Remove-Item -LiteralPath $full -Force
            Write-SyncLog "Applied remote delete: $p"
        } else {
            if (-not (Invoke-Git -GitArgs @('checkout', $Remote, '--', $p) -Quiet)) { throw "checkout of $p failed" }
            Write-SyncLog "Applied remote change: $p"
        }
        $applied++
    }
    Write-SyncLog "Git-owned paths: $applied applied from remote, $conflicts kept local."
    return $conflicts
}

function Invoke-Push {
    param([string]$Branch)
    return (Invoke-Git -GitArgs @('push', '-q', '-u', 'origin', "HEAD:refs/heads/$Branch"))
}

function Invoke-PlanGitSync {
    Set-Location $VaultRoot
    $gitDir = (& git rev-parse --absolute-git-dir 2>$null)
    if ($LASTEXITCODE -ne 0) { Write-SyncLog "Not a git repository: $VaultRoot"; return 1 }
    $gitDir = $gitDir.Trim()
    $lockFile = Join-Path $gitDir "plan-git-sync.lock"

    if (Test-Path $lockFile) {
        $age = ((Get-Date) - (Get-Item $lockFile).LastWriteTime).TotalMinutes
        if ($age -lt $LockStaleMinutes) { Write-SyncLog "Lock held ($([math]::Round($age,1)) min), skipping."; return 0 }
        Write-SyncLog "Stale lock ($([math]::Round($age,1)) min), removing."
        Remove-Item $lockFile -Force
    }
    New-Item -ItemType File -Path $lockFile -Force | Out-Null

    try {
        foreach ($marker in 'rebase-merge', 'rebase-apply', 'MERGE_HEAD', 'CHERRY_PICK_HEAD') {
            if (Test-Path (Join-Path $gitDir $marker)) {
                Write-SyncLog "Repository is mid-operation ($marker). A human needs to finish or abort it first."
                return 1
            }
        }
        $branch = (& git rev-parse --abbrev-ref HEAD).Trim()
        if ($branch -eq 'HEAD') { Write-SyncLog "Detached HEAD, refusing to sync."; return 1 }
        Write-SyncLog "=== plan-git-sync start (branch: $branch) ==="

        $remote = "origin/$branch"

        for ($attempt = 0; $attempt -le $MaxRetries; $attempt++) {
            if (-not (Invoke-Git -GitArgs @('fetch', '-q', 'origin') -Quiet)) { Write-SyncLog "fetch failed."; return 1 }
            & git rev-parse -q --verify $remote *> $null
            $remoteExists = ($LASTEXITCODE -eq 0)
            $conflicts = 0

            if ($remoteExists) {
                $remoteTip = (& git rev-parse $remote).Trim()
                $base = Get-SyncBase -Remote $remote
                if (-not $base) { Write-SyncLog "No common base with $remote, refusing to guess."; return 1 }

                # Step A, before anything is committed: bring in remote changes
                # to git-owned paths made since the last synced base. Keyed on
                # the recorded base, not on HEAD, so it still works after the
                # Obsidian Git plugin's own reset-mode Pull already moved HEAD.
                & git merge-base --is-ancestor $remoteTip $base
                if ($LASTEXITCODE -ne 0) {
                    Write-SyncLog "Remote has new commits (base $($base.Substring(0,8)) -> $($remoteTip.Substring(0,8)))."
                    $conflicts = Sync-GitOwnedPaths -Base $base -Remote $remoteTip
                }

                # Step B: if the branch does not already contain the remote tip,
                # move onto it with a mixed reset. Index and branch move, the
                # working tree (Obsidian Sync's domain) is untouched.
                & git merge-base --is-ancestor $remoteTip HEAD
                if ($LASTEXITCODE -ne 0) {
                    if (-not (Invoke-Git -GitArgs @('update-ref', "refs/heads/$branch", $remoteTip) -Quiet)) { return 1 }
                    if (-not (Invoke-Git -GitArgs @('reset', '-q') -Quiet)) { return 1 }
                    Write-SyncLog "Branch moved onto $($remoteTip.Substring(0,8)) (mixed reset, working tree untouched)."
                }
                Set-SyncBase $remoteTip
            }

            # Step C: commit the working tree as it stands, then push.
            [void](Invoke-CommitIfNeeded)

            $ahead = if ($remoteExists) { [int](& git rev-list --count "$remote..HEAD") } else { 1 }
            if ($ahead -eq 0) {
                Set-SyncBase (& git rev-parse HEAD).Trim()
                Write-SyncLog "=== plan-git-sync end (nothing to push) ==="
                return [int]($conflicts -gt 0)
            }
            if (Invoke-Push -Branch $branch) {
                Set-SyncBase (& git rev-parse HEAD).Trim()
                Write-SyncLog "Pushed $ahead commit(s) to $remote."
                Write-SyncLog "=== plan-git-sync end (success) ==="
                return [int]($conflicts -gt 0)
            }
            if ($attempt -lt $MaxRetries) {
                Write-SyncLog "Push rejected (the other laptop pushed first), retrying ($($attempt + 1)/$MaxRetries)."
            }
        }
        Write-SyncLog "=== plan-git-sync end (FAILED: push rejected after retries) ==="
        return 1
    } catch {
        Write-SyncLog "ERROR: $($_.Exception.Message)"
        return 1
    } finally {
        Remove-Item $lockFile -Force -ErrorAction SilentlyContinue
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    exit (Invoke-PlanGitSync)
}
.
..
logs
plan-git-sync.ps1
plan-git-sync-silent.vbs
register-plan-git-sync-task.ps1
# Markdown-first Obsidian vault
# Default: ignore everything, then allow directories and markdown notes.
*
!*/
!*.md

# The Map canvas is a deliberate vault file, not editor state.
!00_Live/Map Canvas.canvas

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

# Keep vault-specific Codex settings reviewable.
!.codex/config.toml
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
```
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Spec - Home and Monthly Dashboards.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Research - Platform Facts.md`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .obsidian/plugins/lazy-plugins/data.json | head -80; echo ---HP; cat .obsidian/plugins/homepage/data.json | head -60; echo ---MD; head -60 "00_Live/Monthly Dashboard.md"; ls 00_Live/Enumerate 00_Live/Enumerate/Monthly | head -30; grep -c "" "00_Live/Map Canvas.canvas"
```
````
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
        "startupType": "short"
      },
      "obsidian-style-settings": {
        "startupType": "instant"
      },
      "obsidian-tasks-plugin": {
        "startupType": "instant"
      },
      "templater-obsidian": {
        "startupType": "instant"
      },
      "obsidian-git": {
        "startupType": "short"
      },
      "lean-terminal": {
        "startupType": "short"
      },
      "homepage": {
        "startupType": "instant"
      },
---HP
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
}---MD
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
626
````
- `Grep` -- pattern `Periodic Notes|Meta Bind|Hours|hours input|career line` path `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards`
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n 80,200p .obsidian/plugins/lazy-plugins/data.json | grep -B1 -A2 -E 'meta-bind|the-plan|\}$' | head -30; echo ---; grep -n -i -E "meta bind|periodic notes|study_hours|hours|career line|\bTemplater\b|QuickAdd" "40_Resources/Obsidian/Dashboards/Decisions Log.md" "40_Resources/Obsidian/Dashboards/Dashboard Build/Front End and Visual System.md" "40_Resources/Obsidian/Dashboards/Dashboard Build/Verification and Risks.md" | cut -c1-300 | head -40; ls 00_Live/Enumerate/Daily | tail -3
```
```
      },
      "obsidian-meta-bind-plugin": {
        "startupType": "short"
      },
--
      },
      "the-plan-dashboard": {
        "startupType": "instant"
      }
    }
  }
}
---
40_Resources/Obsidian/Dashboards/Decisions Log.md:30:| 6 | Scope of Home | Habits, health and finance trackers, learning, career. Career and Learning are one specific daily line each, not trackers. Detail lives in Jarvis. | Home stays small. Career line and study hours are the only work-side items. 
40_Resources/Obsidian/Dashboards/Decisions Log.md:35:| 11 | Career line | One named task, written manually in the daily note | Set during the evening close. Never auto-repeated. |
40_Resources/Obsidian/Dashboards/Decisions Log.md:39:| 15 | Tick method | Ticking lists with a category field. Meta Bind only for hours and text. Minimal frontmatter. | No tables for ticking. |
40_Resources/Obsidian/Dashboards/Dashboard Build/Front End and Visual System.md:37:3. **Career and Study.** The one career line and the study hours line. Read-only; tap opens the note at that line.
40_Resources/Obsidian/Dashboards/Dashboard Build/Front End and Visual System.md:74:- Career line and study hours are read-only on the dashboard. Tapping one opens today's note at that line, so there is one write path (the checkbox toggle).
40_Resources/Obsidian/Dashboards/Dashboard Build/Verification and Risks.md:30:| 7 | Plugin enabled states (12 listed, 31 installed) | Open Settings, Community plugins | Enable Homepage and QuickAdd if the dashboard needs them |
2026-09-26.md
2026-10-05.md
2026-10-12.md
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -rn -E "INPUT\[|study_hours|Career line|career" 00_Live/Enumerate/Daily/2026-10-12.md | head; grep -rln "INPUT\[" 00_Live 30_Order 2>/dev/null | head; ls 30_Order/Templates 2>/dev/null | head; tail -3 30_Order/System/git-sync/logs/plan-git-sync.log
```
```
AI
Classes
Daily Dashboard
Metadata
MOC.md
[2026-10-14 15:08:02] Committed: auto-sync: 2026-10-14 15:08 | 2 files
[2026-10-14 15:08:05] Pushed 1 commit(s) to origin/main.
[2026-10-14 15:08:05] === plan-git-sync end (success) ===
```
- `Bash`
```bash
cd "D:/_Anant/20_Progress/Documents/The Plan" && head -40 00_Live/Enumerate/Daily/2026-10-12.md; ls "30_Order/Templates/Daily Dashboard"; grep -rn -E "INPUT|study_hours" "30_Order/Templates/Daily Dashboard" | head -5; grep -rln "Daily Note Schema" 30_Order/Standards | head -2
```
```
---
type: thought
thought_kind: reflection
status: seed
related_progress:
  - "[[2026]]"
tags:
  - thought
  - "#journal"
next:
---
# Did you get better today? 
> [!NOTE] Summary:

## Morning Plan
*Goal*: You get to do.
1. You get to write this note from your phone on a bus. You get to create a system to improve yourself. You get to do everything you want to do. You get to manage your life. 
	- You choose not to do it. You choose not to establish this workflow correctly. 
2. You choose not to work toward your goals, you choose not to apply for internships, you choose to play games all over the weekend despite having infinite amount of tasks pulled up, you choose to smoke everyday. It’s all a choice. 
3. Very simple actions are required to establish the dashboard workflow that we wish to achieve. Keep it simplistic. Keep only things that you really need. 
	- Max 3 dashboards on Jarvis: Home dashboard, Agentic OS, UMN dashboard
	- Max 2 dashboards on The plan: home dashboard, monthly dashboard/plans dashboard.
4. 
### 80
> I will [BEHAVIOR] at [TIME] in [LOCATION].
- [ ] I will ==get out of bed(asap), move around== everyday at *8 am* so that I can become a **morning person**. 
- [ ] I will ==learn something new(read)== everyday in the *morning* on the *couch* so that I can become a **reader**.
- [ ] I will ==read mindset content on atoms app== every time I have *nothing to do* so that I don’t **doomscroll** on my phone(*17 days left*).
- [ ] I will ==go outside and study== everyday at *2 pm* in *Lind hall* so that I can **ace my finals**.
- [ ] 
### 20
> After [CURRENT HABIT], I will [NEW HABIT]
- [ ] I will ==plan my day for 20 minutes== every day on *my table* after ==moving around== in the *morning* so that I can become at **peace with myself**.
- [ ] I will ==go to the gym at 5:30== everyday after ==class/studying== so that I can become someone **who performs calisthenics**.
- [ ] I will ==drink 3L of water== everyday and ==creatine== every day so that I can become a **healthy and active person**.
- [ ] 
## Productivity 


| Meals | 3L of Water(4-5) |
Better Month.md
Better Today.md
Better Week.md
Better Year.md
Daily Note.md
30_Order/Templates/Daily Dashboard/Daily Note.md:5:study_hours: 0
30_Order/Standards/Agentic OS/Agent Standard.md
30_Order/Standards/Agentic OS/Agentic OS Standard.md
```
- `ToolSearch` -- `{"query":"select:mcp__the-plan__command_list","max_results":1}`
- `mcp__the-plan__command_list` -- `{}`
- `Grep` -- pattern ````INPUT\[|```meta-bind```` path `D:\_Anant\20_Progress\Documents\The Plan`
- `Write` -- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Audit - Dashboard Stack and Phone Checklist.md`
```
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
cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && f="Audit - Dashboard Stack and Phone Checklist.md"; grep -c "—" "$f"; for l in "Dashboards Hub" "Spec - Home and Monthly Dashboards" "Research - Platform Facts" "Front End and Visual System" "Verification and Risks" "Decisions Log"; do find . -name "$l.md" | grep -q . && echo ok $l || echo MISSING $l; done
```
```
0
ok Dashboards Hub
ok Spec - Home and Monthly Dashboards
ok Research - Platform Facts
ok Front End and Visual System
ok Verification and Risks
ok Decisions Log
```

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\The Plan\40_Resources\Obsidian\Dashboards\Audit - Dashboard Stack and Phone Checklist.md`

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat ".obsidian/community-plugins.json" ".obsidian/core-plugins.json"; ls .obsidian/plugins; for p in dataview meta-bind homepage templater-obsidian periodic-notes quickadd; do echo "== $p"; grep -E '"(id|name|version|isDesktopOnly)"' .obsidian/plugins/$p/manifest.json 2>&1; done; ls 40_Resources/Obsidian/Dashboards; cat "40_Resources/Obsidian/Dashboards/Dashboards Hub.md"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -E '"(id|name|version|isDesktopOnly)"' .obsidian/plugins/obsidian-meta-bind-plugin/manifest.json .obsidian/plugins/the-plan-dashboard/manifest.json; echo ---DV; cat .obsidian/plugins/dataview/data.json; echo; echo ---SPEC; cat "40_Resources/Obsidian/Dashboards/Spec - Home and Monthly Dashboards.md"; echo ---PF; cat "40_Resources/Obsidian/Dashboards/Research - Platform Facts.md"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat 30_Order/System/git-sync/plan-git-sync.ps1; ls -a 30_Order/System/git-sync; cat .gitignore; ls 00_Live; ls "40_Resources/Obsidian/Dashboards/Dashboard Build"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && cat .obsidian/plugins/lazy-plugins/data.json | head -80; echo ---HP; cat .obsidian/plugins/homepage/data.json | head -60; echo ---MD; head -60 "00_Live/Monthly Dashboard.md"; ls 00_Live/Enumerate 00_Live/Enumerate/Monthly | head -30; grep -c "" "00_Live/Map Canvas.canvas"`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && sed -n 80,200p .obsidian/plugins/lazy-plugins/data.json | grep -B1 -A2 -E 'meta-bind|the-plan|\}$' | head -30; echo ---; grep -n -i -E "meta bind|periodic notes|study_hours|hours|career line|\bTemplater\b|QuickAdd" "40_Resources/Obsidian/Dashboards/Decisions Log.md" "40_Resources/Obsidian/Dashboards/Dashboard Build/Front End and Visual System.md" "40_Resources/Obsidian/Dashboards/Dashboard Build/Verification and Risks.md" | cut -c1-300 | head -40; ls 00_Live/Enumerate/Daily | tail -3`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && grep -rn -E "INPUT\[|study_hours|Career line|career" 00_Live/Enumerate/Daily/2026-10-12.md | head; grep -rln "INPUT\[" 00_Live 30_Order 2>/dev/null | head; ls 30_Order/Templates 2>/dev/null | head; tail -3 30_Order/System/git-sync/logs/plan-git-sync.log`
- `cd "D:/_Anant/20_Progress/Documents/The Plan" && head -40 00_Live/Enumerate/Daily/2026-10-12.md; ls "30_Order/Templates/Daily Dashboard"; grep -rn -E "INPUT|study_hours" "30_Order/Templates/Daily Dashboard" | head -5; grep -rln "Daily Note Schema" 30_Order/Standards | head -2`
- `cd "D:/_Anant/20_Progress/Documents/The Plan/40_Resources/Obsidian/Dashboards" && f="Audit - Dashboard Stack and Phone Checklist.md"; grep -c "—" "$f"; for l in "Dashboards Hub" "Spec - Home and Monthly Dashboards" "Research - Platform Facts" "Front End and Visual System" "Verification and Risks" "Decisions Log"; do find . -name "$l.md" | grep -q . && echo ok $l || echo MISSING $l; done`

