---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Toggl API time tracking"
started_at: 2026-10-28T22:26:20
ended_at: 2026-10-29T00:28:27
exported_at: 2026-10-29T00:28:28
duration_minutes: 122.1
project: The Plan
cwd: 'D:\_Anant\20_Progress\Documents\The Plan'
session_id: 045b6dda-a561-490b-a55b-b3f474963737
status: seed
review_state: raw
created: 2026-10-28
updated: 2026-10-29
turn_count: 9
tools_used:
  Agent: 7
  PowerShell: 6
  ToolSearch: 1
  WebSearch: 8
tokens:
  input: 36
  output: 26149
  cache_creation: 188222
  cache_read: 737916
  total: 952323
cost_usd: 1.088242
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Toggl API time tracking

## You



<pasted_content id="539e">
 https://docs.toggl.com/toggl-2-0-public-api
  https://docs.toggl.com/toggl-mcp-and-cl

  is the time management service that i am using across this laptop and across the old laptop. I want
  to utilize the time recording taken place across both the laptops to make me focus on the task at
  hand. Everything will be documented inside the plan.
</pasted_content id="539e">


Now, for this to take place. I need to make sure that we first go through the services provided for this tool already, in a previous session we had found out that are other similarly named services that provide more access as mcp and api tool calls. How exactly can we utilize the app toggl installed on my desktop? Look through the app yourself and search for information about this. How are people using these api endpoints to documenbt their time use? How can i utilize this to be implemented inside the dashboard? I want to make notice of the time that i spend on each device. How exactly have i used it and for what purpose exactly. So, toggl is something that is going to be precise, exactly documenting things that take place. Everything is monitored correctly and noted down inside the daily note as a summary. But before that it is noted in detail as the time spent in some daily week recording for this laptop. Each laptop has their own individual notes that document time for each week of the year. Let's utilize this tool correctly and let's see how to use it for the purpose just explained. Also, research about this.

## Claude

I'll start by inspecting the installed Toggl app on this machine and loading the search tool, then read the docs you linked.

Toggl 2.0 can see your time from both laptops, but a time entry has no field saying which device made it. Per-device notes therefore need a workaround, covered under "The device problem" below.

## What you have installed

- **App:** `D:\Apps\Toggl 2.0\Toggl 2.0.exe`, an Electron desktop app (v1.7.2) with 10 processes running. Its data lives in `%APPDATA%\Toggl`, which holds a local session file, caches and a `time_entry_predictor` folder.
- **What I didn't open:** I only listed file names. The session and storage files are secret-bearing, so I left them alone, as your rules require. The app has no local API or CLI. It is a client for Toggl's cloud, so the cloud API is the integration point.
- **Which product you use:** the two docs you linked are for **Toggl 2.0** (also called Focus), not **Toggl Track**. The two have separate APIs:

| | Toggl 2.0 (yours) | Toggl Track |
|---|---|---|
| Base URL | `focus.toggl.com/api` | `api.track.toggl.com/api/v9` |
| Docs | engineering.toggl.com/docs/focus | engineering.toggl.com/docs/track |
| MCP/CLI | official `@togglhq/mcp` and `@togglhq/cli` | different tooling |

- **The similarly named services from last session:** most third-party Toggl MCP servers (verygoodplugins, taiseimiyaji, louis030195) target Track's API token and will not work with 2.0. Only `@togglhq/mcp` and `@togglhq/cli` are documented for 2.0.

## What the API can do

All of this is from the 2.0 docs. Paths are under `/organizations/{org}/workspaces/{ws}`.

- **List entries:** `GET /time-entries?date_from=&date_to=` returns your own entries, paged (max 100 per page, no total, so you page until you get an empty array).
- **Whole range at once:** `GET /time-entries/stream` returns a whole date range in one call with no paging.
- **Running timer:** `GET /tracking/current`, `POST /tracking/start`, and `POST /tracking/stop`.
- **Entry fields:** `start`, `duration`, `description`, `project_id`, `task_id`, `tag_ids`, `type` (activity or break), `timezone`, `toggl_user_id`, `updated_at`.
- **Reports:** `POST /reports/workspaces/{ws}/query` with groupings and presets such as `thisWeek`.
- **Auth:** the sources conflict. The docs page says a bearer token that expires, the engineering page says an API key (`toggl_sk_…`), and the OpenAPI file says cookies. I haven't tested which one works.
- **MCP and CLI:** both use browser OAuth. The CLI has `toggl time-entries start|stop`, `toggl projects list`, and a `--json` flag for scripts.
- **Quota:** Free allows 30 requests per hour, Starter 240, Premium 600. Going over returns HTTP 402. The MCP and CLI page also says Free is limited to 30 report-data requests per month.

## The device problem

No time entry field says which device made it. This is confirmed against the time-entry field tables and the Swagger definition. The reports property list has no device field either. Both laptops share one account, so the API returns one merged stream.

Ways to split it by laptop:

1. **One tag per device (my recommendation).** Use something like `dev-new` and `dev-old`, applied when the timer starts. `tag_ids` is accepted on start. Per-laptop weekly notes then become a filter on the tag. The weakness is that it depends on you applying the tag every time.
2. **Start timers through the CLI wrapper.** A small command on each laptop starts the timer with that laptop's tag already attached. I haven't confirmed that the CLI can pass tags.
3. **Local activity logging.** A background script on each laptop records active hours itself and uses Toggl only for what the time was spent on. This is more work, but it is the only way to get true device time that doesn't depend on you remembering to tag.

## How it could fit the plan

- A fetcher on each laptop pulls the week's entries and writes raw data to a place the engine reads. The API key lives in an environment variable and never in the vault.
- `plan-cli` gets a new `toggl` command so totals, per-device splits, and focus percentages come from the engine. Your rule is that I never compute numbers by hand. The engine source is in `the-plan-dashboard`.
- Each laptop gets one note per ISO week, patched by heading. The daily note gets only a short summary line from those notes.
- The dashboard plugin gets a "today by device" panel and a "running now" indicator.
- Polling is cheap on Premium but tight on Free. At 30 requests per hour you would fetch once per sync, not live.

## Unverified

- Which auth method works for 2.0.
- Whether the CLI can pass tags.
- Whether webhooks or a changes-since feed exist (I found none, but didn't read the whole spec).
- Whether your plan is Free or higher. This decides how often the dashboard can refresh.

I haven't written any files or run any API calls.

## Decisions for you

- Which plan are you on?
- Is the device tag acceptable, or do you want the stricter local-logging route?

Sources:
- [Toggl 2.0 public API](https://docs.toggl.com/toggl-2-0-public-api)
- [Toggl MCP and CLI](https://docs.toggl.com/toggl-mcp-and-cl)
- [Toggl 2.0 API reference](https://engineering.toggl.com/docs/focus/)
- [Toggl Track API](https://engineering.toggl.com/docs/track/)

### Tool Calls

- `ToolSearch` -- `{"query":"select:WebSearch","max_results":1}`
- `PowerShell`
```powershell
$paths = @("$env:LOCALAPPDATA\TogglTrack","$env:LOCALAPPDATA\Programs\TogglTrack","$env:LOCALAPPDATA\Programs\Toggl Track","$env:APPDATA\TogglTrack","$env:APPDATA\Toggl Track","$env:LOCALAPPDATA\Toggl","$env:ProgramFiles\Toggl","${env:ProgramFiles(x86)}\Toggl"); foreach($p in $paths){ if(Test-Path $p){ "== $p"; Get-ChildItem $p -Depth 1 -ErrorAction SilentlyContinue | Select-Object -First 40 FullName,Length,LastWriteTime | Format-Table -AutoSize | Out-String -Width 200 } }; Get-Process | Where-Object { $_.Name -match 'toggl' } | Select-Object Name,Id,Path; Get-Command toggl* -ErrorAction SilentlyContinue | Select-Object Name,Source
```
```
Name         Id Path
----         -- ----
Toggl 2.0  6236 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 13120 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 14452 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 21764 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 24832 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 24912 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 26196 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 26352 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 26372 D:\Apps\Toggl 2.0\Toggl 2.0.exe
Toggl 2.0 34228 D:\Apps\Toggl 2.0\Toggl 2.0.exe
```
- `PowerShell`
```powershell
Get-ChildItem "D:\Apps\Toggl 2.0" -Depth 1 -ErrorAction SilentlyContinue | Select-Object -First 60 Name,Length,LastWriteTime | Format-Table -AutoSize | Out-String -Width 200; (Get-Item "D:\Apps\Toggl 2.0\Toggl 2.0.exe").VersionInfo | Select-Object ProductName,ProductVersion,FileVersion,CompanyName | Format-List | Out-String; Get-ChildItem "$env:APPDATA" -Directory -ErrorAction SilentlyContinue | Where-Object Name -match 'toggl' | Select-Object FullName
```
```
Name                    Length    LastWriteTime
----                    ------    -------------
locales                           10/16/2026 8:45:11 PM
resources                         10/16/2026 8:45:11 PM
chrome_100_percent.pak  719654    10/7/2026 4:08:04 AM
chrome_200_percent.pak  1269017   10/7/2026 4:08:04 AM
d3dcompiler_47.dll      4741488   10/7/2026 4:08:04 AM
dxcompiler.dll          25745408  10/7/2026 4:08:04 AM
dxil.dll                1509760   10/7/2026 4:08:04 AM
ffmpeg.dll              3113472   10/7/2026 4:08:04 AM
icudtl.dat              10876560  10/7/2026 4:08:04 AM
LICENSE.electron.txt    1096      10/7/2026 4:08:04 AM
LICENSES.chromium.html  20472830  10/7/2026 4:08:04 AM
resources.pak           12435875  10/7/2026 4:08:04 AM
snapshot_blob.bin       368768    10/7/2026 4:08:04 AM
Toggl 2.0.exe           246381088 10/7/2026 4:08:04 AM
Uninstall Toggl 2.0.exe 531288    10/7/2026 4:08:12 AM
v8_context_snapshot.bin 742200    10/7/2026 4:08:04 AM
vk_swiftshader_icd.json 106       10/7/2026 4:08:04 AM
vk_swiftshader.dll      5520384   10/7/2026 4:08:04 AM
vulkan-1.dll            939520    10/7/2026 4:08:04 AM
af.pak                  636155    10/7/2026 4:08:04 AM
am.pak                  1029450   10/7/2026 4:08:04 AM
ar.pak                  1130919   10/7/2026 4:08:04 AM
bg.pak                  1178203   10/7/2026 4:08:04 AM
bn.pak                  1513545   10/7/2026 4:08:04 AM
ca.pak                  716908    10/7/2026 4:08:04 AM
cs.pak                  743351    10/7/2026 4:08:04 AM
da.pak                  666471    10/7/2026 4:08:04 AM
de.pak                  717862    10/7/2026 4:08:04 AM
el.pak                  1295538   10/7/2026 4:08:04 AM
en-GB.pak               580030    10/7/2026 4:08:04 AM
en-US.pak               586582    10/7/2026 4:08:04 AM
es-419.pak              707627    10/7/2026 4:08:04 AM
es.pak                  703941    10/7/2026 4:08:04 AM
et.pak                  642216    10/7/2026 4:08:04 AM
fa.pak                  1063069   10/7/2026 4:08:04 AM
fi.pak                  655113    10/7/2026 4:08:04 AM
fil.pak                 741385    10/7/2026 4:08:04 AM
fr.pak                  763461    10/7/2026 4:08:04 AM
gu.pak                  1495625   10/7/2026 4:08:04 AM
he.pak                  928748    10/7/2026 4:08:04 AM
hi.pak                  1586602   10/7/2026 4:08:04 AM
hr.pak                  715279    10/7/2026 4:08:04 AM
hu.pak                  765640    10/7/2026 4:08:04 AM
id.pak                  635080    10/7/2026 4:08:04 AM
it.pak                  693991    10/7/2026 4:08:04 AM
ja.pak                  842053    10/7/2026 4:08:04 AM
kn.pak                  1720240   10/7/2026 4:08:04 AM
ko.pak                  718705    10/7/2026 4:08:04 AM
lt.pak                  777281    10/7/2026 4:08:04 AM
lv.pak                  774733    10/7/2026 4:08:04 AM
ml.pak                  1767850   10/7/2026 4:08:04 AM
mr.pak                  1467313   10/7/2026 4:08:04 AM
ms.pak                  668356    10/7/2026 4:08:04 AM
nb.pak                  638121    10/7/2026 4:08:04 AM
nl.pak                  664759    10/7/2026 4:08:04 AM
pl.pak                  742064    10/7/2026 4:08:04 AM
pt-BR.pak               697019    10/7/2026 4:08:04 AM
pt-PT.pak               701056    10/7/2026 4:08:04 AM
ro.pak                  728144    10/7/2026 4:08:04 AM
ru.pak                  1200985   10/7/2026 4:08:04 AM



ProductName    : Toggl
ProductVersion : 1.7.2.0
FileVersion    : 1.7.2
CompanyName    : GitHub, Inc.



FullName
--------
C:\Users\anant\AppData\Roaming\Toggl
```
- `WebSearch` -- `{"query":"Toggl Track API v9 time entries endpoint reports API authentication","mode":"standard"}`
- `WebSearch` -- `{"query":"Toggl MCP server CLI docs.toggl.com toggl-mcp-and-cli","mode":"standard"}`
- `Agent` -- `{"description":"Read Toggl docs pages","subagent_type":"web-fetch","prompt":"Fetch https://docs.toggl.com/toggl-2-0-public-api and https://docs.toggl.com/toggl-mcp-and-cl (also try https://docs.toggl.com/toggl-mcp-and-cli if the second fails). For each, report concretely: what product it covers (is \"Toggl 2.0\" the same as Toggl Track?), base URLs, authentication method, rate limits, key endpoints for time entries (list, create, current running entry, stop), workspaces, projects, tags, devices/platform or source fields on a time entry if any, reports/summary endpoints, webhooks, and for the MCP/CLI page: install steps, tool names exposed, auth setup, supported clients. Quote endpoint paths and example payloads exactly. Note anything that distinguishes this from Toggl Track API v9."}`
- `PowerShell`
```powershell
Get-ChildItem "C:\Users\anant\AppData\Roaming\Toggl" -Recurse -Depth 2 -ErrorAction SilentlyContinue | Select-Object -First 60 @{n='Path';e={$_.FullName.Replace('C:\Users\anant\AppData\Roaming\Toggl','')}},Length | Format-Table -AutoSize | Out-String -Width 160; Get-ChildItem "D:\Apps\Toggl 2.0\resources" -ErrorAction SilentlyContinue | Select-Object Name,Length | Format-Table | Out-String
```
```
Path                                               Length
----                                               ------
\blob_storage                                      
\Cache                                             
\Code Cache                                        
\Crashpad                                          
\data                                              
\DawnGraphiteCache                                 
\DawnWebGPUCache                                   
\GPUCache                                          
\GPUPersistentCache                                
\GrShaderCache                                     
\Local Storage                                     
\logs                                              
\Network                                           
\sentry                                            
\Service Worker                                    
\Session Storage                                   
\ShaderCache                                       
\Shared Dictionary                                 
\time_entry_predictor                              
\WebStorage                                        
\.session.dat                                      638
\.updaterId                                        36
\declarative_performance_observer.db               32768
\declarative_performance_observer.db-journal       0
\DIPS                                              4096
\DIPS-wal                                          984712
\Local State                                       490
\lockfile                                          0
\Preferences                                       57
\blob_storage\[REDACTED] 
\Cache\Cache_Data                                  
\Cache\No_Vary_Search                              
\Cache\Cache_Data\data_0                           45056
\Cache\Cache_Data\data_1                           270336
\Cache\Cache_Data\data_2                           1056768
\Cache\Cache_Data\data_3                           4202496
\Cache\Cache_Data\f_000001                         54514
\Cache\Cache_Data\f_000002                         16595
\Cache\Cache_Data\f_000003                         31538
\Cache\Cache_Data\f_000004                         20001
\Cache\Cache_Data\f_000005                         60442
\Cache\Cache_Data\f_000006                         96631
\Cache\Cache_Data\f_000007                         96381
\Cache\Cache_Data\f_000008                         257139
\Cache\Cache_Data\f_000009                         728992
\Cache\Cache_Data\f_00000a                         1626014
\Cache\Cache_Data\f_00000b                         37635
\Cache\Cache_Data\f_00000d                         34180
\Cache\Cache_Data\f_00000e                         30093
\Cache\Cache_Data\f_00000f                         72920
\Cache\Cache_Data\f_000010                         54580
\Cache\Cache_Data\f_000011                         20008
\Cache\Cache_Data\f_000012                         16601
\Cache\Cache_Data\f_000013                         31537
\Cache\Cache_Data\f_000014                         60430
\Cache\Cache_Data\f_000015                         96379
\Cache\Cache_Data\f_000016                         96640
\Cache\Cache_Data\f_000017                         257132
\Cache\Cache_Data\f_000018                         729387
\Cache\Cache_Data\f_000019                         1640414



Name              Length
----              ------
app.asar.unpacked 
drizzle           
resources         
app-update.yml    146
app.asar          72952685
elevate.exe       118304
```
- `Agent` -- `{"description":"Fetch Toggl 2.0 API reference","subagent_type":"web-fetch","prompt":"Fetch https://engineering.toggl.com/docs/focus/api/organization/ and follow its sidebar/links to find the public Toggl 2.0 (focus.toggl.com/api) reference pages for: time entries (list, create, update, delete, current/running entry, stop), workspaces, projects, tasks, time blocks, tags, reports, and webhooks. Also check https://engineering.toggl.com/docs/focus/ for a sitemap. Report exact endpoint paths with HTTP methods, query parameters (date range filters, pagination), and example request/response JSON for time entries. State specifically whether a time entry has any field identifying the device, client app, platform or source (for example created_with, source, device). Also report whether any webhook or changes-since/sync endpoint exists. Mark anything you could not verify as unverified rather than guessing."}`
- `WebSearch` -- `{"query":"Toggl Track API time entries \"created_with\" device multiple computers weekly report Obsidian OR script OR dashboard","mode":"standard"}`

## You

One tag per device (my recommendation). Use something like dev-new and dev-old, applied when the timer starts. tag_ids is accepted on start. i like this and will help is documenting both the laptop timings. But everything just mentioned to me seem quite complicated to achieve which would cause a lot of friction. Is this something that is easily configurable? Worth spending our time on to document? Can the time used on laptops be documented with precision for per task that is going to be listed in the daily notes? Can we show proof for these actions by documenting time is what i am asking. Document where time is lost, where time is used, where time is used on what tab inside vivaldi (chrome extension), what was worked on inside vs code? What project? What task is being worked on? Can all of this be actually documented with this tool? I am not sure what plan i am on till these things are acheived. These are just the basic time tracking activities that i am asking for. Later on would be blockers or some sort of pop up to be achieved through jarvis or this service (already shows to track time - pop up). There are a lot of possibilities for time tracking precision here. Does this tool, api, cli, commands and the requests provide it?



<pasted_content id="539e">
Unverified

- Which auth method works for 2.0.
- Whether the CLI can pass tags.
- Whether webhooks or a changes-since feed exist (I found none, but didn't read the whole spec).
- Whether your plan is Free or higher. This decides how often the dashboard can refresh.
</pasted_content id="539e">


Verify these things and all the questions just asked above. What can i do to log time better? Find answers to all these questions by solid research that takes place on this tool, customers, users, professionals, reviews, guides, etc. Find solid information on how exactly can we use these tools.

## Claude

I'll verify each open item against primary sources: the full OpenAPI spec, the CLI package, the auth page, pricing and feature pages, and user reports.

The short answer is that Toggl can give you precise time per project and task, and per laptop if each laptop's entries are labelled. It cannot give you tab-level or file-level detail through the API, because that data stays on your laptop. I also still don't know your plan, which decides whether the API works at all.

## Verified since last time

| Item | Result |
|---|---|
| Auth | An API key works. Set `TOGGL_API_TOKEN=toggl_sk_…` and send it as a Bearer token. It works for the REST API, CLI and MCP, with no browser needed. The docs page that describes an expiring token conflicts with this and looks stale. |
| CLI tags | Confirmed in the README: `time-entries start` takes `--data '{json}'`, `--data-file` and `--dry-run`. `tag_ids` is a field in the start body, so it should work. I haven't run it. `--dry-run` lets you test it safely. |
| Webhooks and changes-since | I scanned all 505 operations in the OpenAPI file. There are no webhooks and no `updated_since` filter. The only sync endpoint is for offline clients pushing entries. The only audit log is organization-wide. Any script has to poll. |
| Plan | Free has no Public API or MCP. Starter ($9 to $12 per user per month) and above do. The CLI is not named in the plan table, but it uses the same API. |
| Quota | Starter allows 240 requests per hour per user, enough for a nightly pull and for polling the running timer every minute or so. |

## Your questions

**Can it show what you worked on, per task, with precision?** Yes at project and task level. Each entry has a start time, duration, `project_id`, `task_id`, `description` and `tags`. Each entry is a timestamped record, but you can edit entries yourself, so they are a log and not tamper-proof evidence. The only audit log is Enterprise.

**Can it show which Vivaldi tab or which VS Code file?** Not through the API. The Activity Timeline has the detail you want, but it differs from what you asked:
- It records app names and, optionally, window titles.
- Chrome sites appear by site name only, never the full address. Vivaldi isn't mentioned, so I'd assume it isn't covered.
- VS Code shows only the project folder, and only on macOS per the docs.
- The data is stored on the laptop for 30 days, and the docs say it never leaves the device. I found no API, CLI, MCP or export for it.
- You can turn blocks of it into time entries by clicking "Log" in the app.

**Can it show where time is lost?** Only partly. The Timeline shows untracked gaps in the app, and idle detection prompts you to discard or adjust idle time. Neither is available to the vault, so any "lost time" figure would be a gap computed from entries.

**Auto-Tracker is the useful feature.** It is available on all plans. A rule matches an app or window title and starts a timer against a project or task, with a description. VS Code and Vivaldi window titles contain the folder and page title, so a rule such as "title contains The Plan" can start the right entry with no manual step. Limits I found:
- Rules can't set tags.
- Vivaldi behaviour is unverified.
- The timer stops when no rule matches, if you enable that setting.

**Pop-ups and blockers.** Desktop reminders exist, off by default, and only fire when no timer is running. The plan table lists reminders as Premium and above, but the desktop page states no restriction. I found no blocker feature. A Jarvis pop-up would have to poll `GET /tracking/current` and nudge you itself.

## The device problem

Tags can't be set by Auto-Tracker rules, so the tag plan still needs a manual step. Cheaper options:
- Put the laptop in each rule's description, such as `[new] VS Code: The Plan`. Whether rules are stored per install or synced across laptops is unverified.
- Use a per-laptop prefix in how you start timers by CLI.

Either way, the weekly note per laptop is a filter over one merged stream.

## Is it worth the time

Yes, but only at the right size.

- **Tier 1, low friction:**
  - Take Starter.
  - Set up about five Auto-Tracker rules per laptop.
  - Run a nightly script that pulls entries, using a dated fetch and `TOGGL_API_TOKEN` in an environment variable.
  - Feed a new `plan-cli` command, so the engine produces the numbers.
  - Write the per-laptop weekly notes, then a daily-note summary line.
  - This gets precision at project and task level, not tab or file level.
- **Tier 2, if you want tab and file detail:**
  - Toggl can't do this through the API.
  - From my background knowledge (not researched this session), ActivityWatch is an open-source tracker that stores per-device window titles, browser tabs and editor activity locally, with a local REST API.
  - I haven't verified it covers Vivaldi or VS Code files on Windows, so treat that as a lead.

User reports I found are mixed. Reviewers say Toggl is mainly a timer you start yourself, and that passive trackers such as RescueTime suit passive tracking better. I found no Obsidian guides for 2.0, only older plugins and scripts written for Track's API.

## Still unverified

- Your plan.
- Vivaldi support in both the Timeline and Auto-Tracker.
- Windows VS Code detail.
- Whether CLI tags work in practice.
- Whether rules sync between laptops.
- The idle threshold.

I downloaded the OpenAPI spec and a small scan script into the session scratchpad only. I wrote nothing to the vault.

## Decisions for you

1. Check your plan: in the app, "Admin settings, then Billing" shows it for admins, and the sidebar upgrade prompts name it. Or I can look in the app myself if you enable computer use.
2. Do you want me to research ActivityWatch next, to see whether it fills the tab and file gap?

Sources:
- [Toggl 2.0 plans](https://docs.toggl.com/toggl-plans-whats-included)
- [Toggl 2.0 desktop app](https://docs.toggl.com/toggl-2-0-desktop-app)
- [Activity Timeline](https://docs.toggl.com/activity-timeline)
- [Browser extension](https://docs.toggl.com/[REDACTED])
- [Toggl 2.0 API authentication](https://engineering.toggl.com/docs/focus/start/authentication/)
- [Toggl 2.0 OpenAPI spec](https://engineering.toggl.com/docs/focus/openapi/)
- [@togglhq/cli](https://www.npmjs.com/package/@togglhq/cli)
- [@togglhq/mcp](https://www.npmjs.com/package/@togglhq/mcp)
- [Toggl Track review (Workyard)](https://www.workyard.com/compare/toggl-track-review)
- [Toggl Track review (ClickUp)](https://clickup.com/learn/topic/productivity/tools/toggl/)
- [Toggl Import plugin](https://community.obsidian.md/plugins/toggl-import)
- [Nightly Toggl summary in Obsidian](https://mandalivia-astro.pages.dev/obsidian/nightly-toggl-summary-in-your-obsidian-daily-note/)

### Tool Calls

- `PowerShell`
```powershell
$d="C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-The-Plan\045b6dda-a561-490b-a55b-b3f474963737\scratchpad"; New-Item -ItemType Directory -Force "$d\spec" | Out-Null; curl.exe -s -o "$d\spec\focus.json" "https://engineering.toggl.com/assets/files/focus-eaae2592f8f3a58a635b8550412a30c1.json"; (Get-Item "$d\spec\focus.json").Length
$js = @'
const fs=require("fs");const s=JSON.parse(fs.readFileSync(process.argv[2],"utf8"));
const out=[];for(const [p,m] of Object.entries(s.paths)){for(const [k,v] of Object.entries(m)){if(typeof v!=="object"||!v)continue;out.push(k.toUpperCase()+" "+p+" | "+(v.summary||""))}}
console.log("total ops",out.length);
const re=/webhook|subscri|sync|changes|updated_since|event|activity|timeline|tracker|idle|reminder|notif|device|integration|extension|browser|app-usage|screen/i;
console.log(out.filter(x=>re.test(x)).join("\n"));
console.log("--- tags on timeentry def");
const te=s.definitions["timeentry.TimeEntryWithTask"];console.log(Object.keys(te.properties).join(","));
console.log("--- securityDefinitions");console.log(JSON.stringify(s.securityDefinitions));
console.log("--- top-level path prefixes");console.log([...new Set(Object.keys(s.paths).map(p=>p.split("/").slice(1,4).join("/")))].slice(0,80).join("\n"));
'@
New-Item -ItemType Directory -Force "$d\tools" | Out-Null; Set-Content "$d\tools\scan.js" $js; node "$d\tools\scan.js" "$d\spec\focus.json"
```
```
2513565
total ops 505
GET /email/unsubscribe/{token} | Redirect a browser to the unsubscribe confirmation page
POST /email/unsubscribe/{token} | Unsubscribe from one Focus email via a signed link
GET /organizations/{organization_id}/audit-log/{from}/{to} | Fetch audit log events for a whole organization.
GET /organizations/{organization_id}/extension-integration-policies | List extension integration creation policies
PUT /organizations/{organization_id}/extension-integration-policies/{integration_key} | Set an integration's creation policy
DELETE /organizations/{organization_id}/extension-integration-policies/{integration_key} | Remove one creation policy row
GET /organizations/{organization_id}/extension-integrations | List extension integrations
POST /organizations/{organization_id}/extension-integrations | Create a new extension integration
GET /organizations/{organization_id}/extension-integrations/{extension_integration_id} | Get extension integration by ID
PUT /organizations/{organization_id}/extension-integrations/{extension_integration_id} | Upsert extension integration
DELETE /organizations/{organization_id}/extension-integrations/{extension_integration_id} | Delete an extension integration
GET /organizations/{organization_id}/subscriptions/current | Get current subscription
GET /organizations/{organization_id}/subscriptions/features-upsell | Get feature upsells
GET /organizations/{organization_id}/subscriptions/plans | Get Focus plans
GET /organizations/{organization_id}/subscriptions/trials/current | Get current trial
GET /organizations/{organization_id}/timeoff/timeline | List the time off timeline
GET /organizations/{organization_id}/timeoff/users/{user_id}/balances/changes | List a user's time off balance changes
GET /organizations/{organization_id}/workspaces/{workspace_id}/audit-log/{from}/{to} | Fetch audit log events.
GET /organizations/{organization_id}/workspaces/{workspace_id}/calendar/events | Get raw calendar events
POST /organizations/{organization_id}/workspaces/{workspace_id}/calendar/sync | Sync external calendar events for a date range
GET /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar | List calendar integrations
GET /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/mappings | List calendar event mapping rules
POST /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/mappings | Create or upsert a calendar event mapping rule
GET /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/mappings/{mapping_id} | Get a calendar event mapping rule
PUT /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/mappings/{mapping_id} | Update a calendar event mapping rule
DELETE /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/mappings/{mapping_id} | Delete a calendar event mapping rule
GET /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/push-target | Get the calendar push target
PUT /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/push-target | Set the calendar push target
DELETE /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/push-target | Clear the calendar push target
GET /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/setup | Setup calendar integration
GET /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/{integration_id} | List calendars for a particular integration
DELETE /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/{integration_id} | Delete a calendar integration
PUT /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/{integration_id}/calendars/{calendar_id} | Update calendar integration
PUT /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/{integration_id}/calendars/{calendar_id}/settings | Update per-calendar settings
GET /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/{integration_id}/reauth | Re-authorize calendar integration.
POST /organizations/{organization_id}/workspaces/{workspace_id}/integrations/calendar/{integration_id}/update | Update integration
POST /organizations/{organization_id}/workspaces/{workspace_id}/subscriptions/upsert-forced-trial | Upserts a trial
GET /organizations/{organization_id}/workspaces/{workspace_id}/tasks/calendar | Get raw calendar events
PUT /organizations/{organization_id}/workspaces/{workspace_id}/tasks/calendar | Sync tasks by calendar range
PUT /organizations/{organization_id}/workspaces/{workspace_id}/time-entries/sync/{client_uuid} | Push a time entry from an offline-capable client
POST /organizations/{organization_id}/workspaces/{workspace_id}/timesheets/bulk/request-changes | Request changes on multiple timesheets
POST /organizations/{organization_id}/workspaces/{workspace_id}/timesheets/{setup_id}/{start_date}/{user_account_id}/request-changes | Send a timesheet back to the member with an optional comment
POST /organizations/{organization_id}/workspaces/{workspace_id}/timesheets/{setup_id}/{start_date}/{user_account_id}/resubmit | Resubmit a timesheet after changes were requested
GET /workspaces/{workspace_id}/integrations/calendar | List calendar integrations
GET /workspaces/{workspace_id}/integrations/calendar/setup | Setup calendar integration
GET /workspaces/{workspace_id}/integrations/calendar/{integration_id}/reauth | Re-authorize calendar integration.
--- tags on timeentry def
archived_at,billable,billable_source,calendar_event,calendar_event_id,calendar_id,created_at,deleted_at,description,designation_id,duration,id,pattern_generated,pattern_managed,planned_at,planned_duration,planned_start,project,project_id,start,tag_ids,tags,task,task_id,time_block_id,timezone,toggl_user_id,tracked_at,type,updated_at,workspace_id
--- securityDefinitions
{"bearerAuth":{"type":"apiKey","name":"Authorization","in":"header"},"cookieAuth":{"type":"apiKey","name":"Cookie","in":"header"}}
--- top-level path prefixes
accounts/me/metadata
backoffice/betaflags
backoffice/betaflags/code
backoffice/betaflags/{user_id}
backoffice/organizations/{organization_id}
backoffice/user
backoffice/user/{user_id}
backoffice/users/{user_id}
dev/organizations/{organization_id}
email/unsubscribe/{token}
importer/{organization_id}/sources
importer/{organization_id}/{workspace_id}
intelligence/organizations/{organization_id}
organizations/{organization_id}/audit-log
organizations/{organization_id}/extension-integration-policies
organizations/{organization_id}/extension-integrations
organizations/{organization_id}/groups
organizations/{organization_id}/member-tags
organizations/{organization_id}/public-holidays
organizations/{organization_id}/roles
organizations/{organization_id}/subscriptions
organizations/{organization_id}/teams
organizations/{organization_id}/time-entries
organizations/{organization_id}/timeoff
organizations/{organization_id}/users
organizations/{organization_id}/workinghours
organizations/{organization_id}/workspaces
reports/workspaces/{workspace_id}
shared/{token}
shared/{token}/profitability
shared/{token}/query
shared/{token}/workload
users/me/settings
version
workspaces/{workspace_id}/clients
workspaces/{workspace_id}/composite
workspaces/{workspace_id}/context
workspaces/{workspace_id}/currency
workspaces/{workspace_id}/custom-reports
workspaces/{workspace_id}/export-branding
workspaces/{workspace_id}/integrations
workspaces/{workspace_id}/milestones
workspaces/{workspace_id}/permissions
workspaces/{workspace_id}/saved-views
workspaces/{workspace_id}/settings
workspaces/{workspace_id}/shared-reports
workspaces/{workspace_id}/statuses
workspaces/{workspace_id}/tags
workspaces/{workspace_id}/task-constraints
workspaces/{workspace_id}/time-entry-constraints
workspaces/{workspace_id}/users
workspaces/{workspace_id}/utilization-target
workspaces/{workspace_id}/watermark
{organization_id}/workspaces/{workspace_id}
```
- `Agent` -- ``{"description":"Verify Toggl 2.0 auth and CLI","subagent_type":"web-fetch","prompt":"Research Toggl 2.0 (focus.toggl.com) CLI and auth. Fetch: https://engineering.toggl.com/docs/focus/start/authentication/ , https://www.npmjs.com/package/@togglhq/cli , https://www.npmjs.com/package/@togglhq/mcp , https://toggl.com/ai/mcp , and try GitHub repos under github.com/toggl for the CLI/MCP (e.g. search github.com/toggl for \u0027cli\u0027 or \u0027mcp\u0027). Report exactly: (1) whether `toggl time-entries start` accepts tags / tag_ids / project / description flags or a --data JSON body (quote the README usage verbatim); (2) full list of CLI commands and MCP tool names; (3) whether the CLI/MCP can run non-interactively (API key or env var auth, headless), and whether tokens/API keys work with focus.toggl.com/api (quote the exact example); (4) any mention of tags, devices, activity, timeline, reminders in the CLI/MCP. Mark unverified items clearly."}``
- `Agent` -- `{"description":"Research Toggl 2.0 features and plans","subagent_type":"web-fetch","prompt":"Research the Toggl 2.0 product\u0027s features and pricing from official sources. Fetch https://toggl.com/pricing , https://toggl.com , https://docs.toggl.com (home and nav), and search within docs.toggl.com / toggl.com for pages on: desktop app, browser extension (Chrome/Vivaldi compatibility), VS Code or IDE integration, auto tracker / timeline / activity tracking / app and website usage tracking, idle detection, reminders / tracking pop-ups / nudges, calendar integration, time blocks, focus mode / blockers, offline tracking, and how to find which plan you are on (Settings \u003e Subscription). Report for each feature: does it exist in Toggl 2.0 (versus the older Toggl Track), which plan tier includes it (Free/Starter/Premium/Enterprise), and the exact page URL. Quote plan prices and limits. Flag anything that applies only to Toggl Track and not 2.0. Mark unverified items."}`
- `WebSearch` -- `{"query":"Toggl 2.0 review 2026 time tracking users experience automatic tracking","mode":"extended"}`
- `WebSearch` -- `{"query":"Toggl Track auto tracker timeline desktop app tracks which app window title website precise tracking review","mode":"standard"}`
- `WebSearch` -- `{"query":"Toggl Track API script export time entries to markdown daily note Obsidian sync","mode":"standard"}`
- `PowerShell`
```powershell
$d="C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-The-Plan\045b6dda-a561-490b-a55b-b3f474963737\scratchpad"; Set-Location $d; "== cli"; npm view @togglhq/cli version dist-tags.latest time.modified bin repository.url 2>&1 | Out-String; "== readme"; npm view @togglhq/cli readme 2>&1 | Out-String
```
````
== cli
version = '1.13.96'
dist-tags.latest = '1.13.96'
time.modified = '2026-10-29T00:28:49.530Z'
bin = { toggl: 'build/cli.js' }

== readme
# @toggl/cli

Command-line interface for [Toggl 2.0](https://focus.toggl.com).

## Installation

```bash
npm install -g @togglhq/cli
```

Or run without installing:

```bash
npx @togglhq/cli
```

## Authentication

```bash
toggl auth
```

Opens a browser for OAuth sign-in. On success, credentials are saved to `~/.toggl/focus-tools.json`. When `--profile` is omitted, the CLI saves the account under a name based on your account, such as `user-12345`, and makes it active.

**Options:**

| Flag                  | Description                                                           |
| --------------------- | --------------------------------------------------------------------- |
| `--workspace-id <id>` | Select a specific workspace (required when your account has multiple) |
| `--profile <name>`    | Save credentials under an explicit profile name                       |

Sessions refresh automatically. Re-run `toggl auth` only to switch workspaces or after 4 weeks of inactivity.

### API key (CI or headless)

Set `TOGGL_API_TOKEN` to a personal API key (`toggl_sk_…`, from Toggl 2.0 **Settings → API token**). It takes precedence over saved profiles; nothing opens a browser or writes to `~/.toggl/focus-tools.json`.

```bash
export TOGGL_API_TOKEN=toggl_sk_...
export TOGGL_ORGANIZATION_ID=4364968   # usually required: API keys cannot list organizations
toggl tasks list
```

`TOGGL_WORKSPACE_ID` (default: your current Toggl 2.0 workspace) and `TOGGL_USER_ID` (default: looked up from the key) are optional; `--workspace-id` overrides `TOGGL_WORKSPACE_ID`. `organization …` and `shared …` commands call Toggl Accounts, which does not accept API keys, so they ask you to unset the variable and run `toggl auth`. Profile and workspace switching are disabled in this mode.

## Profiles

Use profiles to switch between saved accounts and environments:

```bash
toggl profile list
toggl profile current
toggl profile switch user-12345
toggl profile switch   # omit name in a TTY: pick from a menu or use the only profile
toggl profile remove user-12345
```

The active profile controls both the account and environment for later commands. You can still override it for one call with the global `--profile <name>` flag.

## Agent skill setup

`@togglhq/cli` ships a `toggl-cli` agent skill under `skills/toggl-cli`. Install it with:

```bash
toggl skill setup
```

This delegates to the [`skills`](https://www.npmjs.com/package/skills) CLI, listed as a **dependency** of `@togglhq/cli` (no separate install). Interactive agent/scope prompts come from that CLI.

After upgrading the CLI, refresh the skill install:

```bash
toggl skill sync
```

By default the installer **symlinks** into your agent skill dirs so updates track CLI upgrades; use `--copy` only if you need a detached snapshot (then re-run `toggl skill sync` after upgrades). Pass flags for non-interactive setup:

```bash
toggl skill setup --agent cursor --global --copy --yes
toggl skill setup --agent cursor codex --copy --yes
```

## Command shape

Generated Toggl 2.0 commands look like:

```
toggl [global flags] <group> … <subcommand> [flags]
```

Many endpoints use two segments (`toggl tasks list`). Some use nested groups, including:

- **`toggl organization …`** — organization APIs (not `toggl org …`; there is no `org` top-level command). Examples: `toggl organization invitations list`, `toggl organization members get`, `toggl organization workspaces list`.
- **`toggl shared …`** — shared workspace/org data routed through `@toggl/queries` helpers (status, holidays, working hours, time off). Example: `toggl shared status get`.

Core resource groups still include `tasks`, `projects`, `time-entries`, `statuses`, `users`, `tags`, `clients`, and others surfaced by the public command catalog. Some low-level endpoints are omitted from the CLI and MCP. Existing public command paths and operation IDs stay stable; use `toggl --help` and `toggl <group> --help` to explore what shipped.

**Typical entity commands:**

| Resource       | Actions                                                  |
| -------------- | -------------------------------------------------------- |
| `tasks`        | `list` (alias `ls`), `get`, `create`, `update`, `delete` |
| `projects`     | `list` (alias `ls`), `get`, `create`, `update`, `delete` |
| `time-entries` | `list` (alias `ls`), `start`, `stop`                     |
| `statuses`     | `list` (alias `ls`)                                      |
| `users`        | `list` (alias `ls`)                                      |

Bulk mutations use `toggl <resource> bulk <verb>`; see `toggl tasks bulk --help`.

**Global flags** (placed before the command path):

| Flag                  | Description                                                   |
| --------------------- | ------------------------------------------------------------- |
| `--json`              | Pretty-printed JSON output (easier to pipe than human tables) |
| `--workspace-id <id>` | Override the active workspace for this call                   |
| `--profile <name>`    | Use a named auth profile                                      |

**Per-command flags** on generated operations always include `--data`, `--data-file`, and `--dry-run`. **`--interactive`** / **`--no-interactive`** appear only when the operation’s catalog metadata allows interactive prompting (read-only operations default to non-interactive unless marked otherwise). Interactive prompting requires a TTY and is disabled when you pass `--json`, `--data`, `--data-file`, `CI`, or `TOGGL_NON_INTERACTIVE`.

To see scalar flags for an operation, use **`toggl <group> … <command> --help`**. To print the resolved operation id and validated body without calling the API, use **`--dry-run`**.

## Providing input

There are three ways to pass the request body:

### 1. Scalar flags

Each input field maps to a `--field-name` flag. Numeric values are coerced automatically.

```bash
toggl tasks get --task-id 12345
toggl tasks list --project-id 999 --status-id 111222
toggl time-entries list --date-from 2025-01-01 --date-to 2025-01-07
toggl time-entries start --task-id 12345 --type activity
```

For `update` commands, payload fields use a `--payload-<field>` prefix:

```bash
toggl tasks update --task-id 12345 --payload-name "New name" --payload-status-id 456789
toggl projects update --project-id 999 --payload-name "Renamed"
```

### 2. `--data` inline JSON

Pass the full input as a JSON string:

```bash
toggl tasks list --data '{"project_id": 123456, "per_page": 50}'
toggl tasks create --data '{"name": "Fix login bug", "project_id": 123456}'
toggl tasks update --data '{"task_id": 12345, "payload": {"name": "Updated", "status_id": 456789}}'
```

### 3. `--data -` (stdin) or `--data-file <path>`

Read JSON from stdin or a file:

```bash
echo '{"task_id": 12345}' | toggl tasks get --data -
toggl tasks create --data-file ./new-task.json
```

## Output and errors

- Successful output goes to **stdout** as JSON (pretty-printed; `--json` keeps JSON while skipping human-oriented formatting helpers).
- Validation errors and API errors go to **stderr**.
- Exit code `0` on success, `1` on error.

## Safety flags

### `--dry-run`

Preview the resolved input without making an API call. Output includes `dry_run: true`, the operation ID, and the validated input object:

```bash
toggl tasks delete --task-id 12345 --dry-run
# {"dry_run":true,"operation":"focus.tasks.delete","input":{"task_id":12345}}
```

### `--yes` (destructive operations)

`delete` commands require `--yes` to execute. Omitting it prints an error to stderr:

```bash
toggl tasks delete --task-id 12345 --yes
toggl projects delete --project-id 999 --yes
```

## Examples

**Tasks**

```bash
# List all tasks in a project
toggl tasks list --project-id 123456

# Get a single task
toggl tasks get --task-id 12345

# Create a task
toggl tasks create --data '{"name": "Write release notes", "project_id": 123456}'

# Move task to "In Progress"
toggl tasks update --task-id 12345 --payload-status-id 456789

# Delete a task (requires --yes)
toggl tasks delete --task-id 12345 --yes
```

**Projects**

```bash
toggl projects list
toggl projects get --project-id 123456
toggl projects create --data '{"name": "Q3 Planning", "workspace_id": 789012}'
toggl projects update --project-id 123456 --payload-name "Q3 Planning (archived)"
toggl projects delete --project-id 999 --yes
```

**Time entries**

```bash
# List time entries for a week
toggl time-entries list --date-from 2025-01-01 --date-to 2025-01-07

# Start tracking (defaults type to 'activity')
toggl time-entries start --task-id 12345

# Start a break
toggl time-entries start --type break

# Stop the running timer
toggl time-entries stop
```

**Reference data**

```bash
# List workspace statuses (useful for getting status IDs)
toggl statuses list

# List workspace members (useful for getting user IDs)
toggl users list
```

## Dates

`--date-from` and `--date-to` accept:

- `YYYY-MM-DD` — expanded to `T00:00:00Z` (from) or `T23:59:59Z` (to)
- RFC 3339 datetime — used as-is (e.g. `2025-01-01T08:00:00+02:00`)

## Troubleshooting

**Not authenticated**

```
Not authenticated. Run `toggl auth` to sign in.
```

Run `toggl auth`. Credentials are stored in `~/.toggl/focus-tools.json`. If you previously authenticated with an older version, your session at `~/.toggl-focus-mcp/config.json` is still read automatically.

**Invalid JSON from `--data`**

```
Invalid JSON from --data: Unexpected token ...
```

Verify your JSON is well-formed. Use `--data-file` with a file if quoting is difficult in your shell.

**Validation error**

```
Invalid input: date_from: must be YYYY-MM-DD or RFC3339 datetime
```

Check field names and types. Use `--dry-run` to validate input without executing.

**Debug API responses**

```bash
TOGGL_DEBUG=1 toggl tasks list
```

Prints schema validation warnings from API responses to stderr.

## Privacy & analytics

Public builds may send product analytics: command path, the leaf command as `action`, outcome (`success` or `error`), client, session id and package version. Command arguments and output are never collected. Signed-in sessions are identified by your Toggl account id so repeat use is not counted as a new person each time; unauthenticated processes stay anonymous.

Disable product analytics:

```bash
TOGGL_PRODUCT_ANALYTICS=off
```

Error reporting is on by default. It sends a redacted error category, the stack trace with package-relative file paths, the CLI, Node and OS versions, and sampled request timings without query strings. It never sends command arguments, output, exception text, your hostname, local paths, or your project's dependency list. Disable it with `TOGGL_SENTRY=off`, or send it to your own Sentry project with `TOGGL_SENTRY_DSN`.

## License

Proprietary Toggl software. See [LICENSE](LICENSE) and [Toggl legal terms](https://toggl.com/legal/).
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `PowerShell`
```powershell
$d="C:\Users\anant\AppData\Local\Temp\claude\D---Anant-20-Progress-Documents-The-Plan\045b6dda-a561-490b-a55b-b3f474963737\scratchpad"; Set-Location $d; "== mcp"; npm view @togglhq/mcp version time.modified bin 2>&1 | Out-String; npm view @togglhq/mcp readme 2>&1 | Out-String
```
````
== mcp
version = '1.13.96'
time.modified = '2026-10-29T00:30:24.088Z'
bin = { mcp: 'build/cli.js', 'toggl-mcp': 'build/cli.js' }

# Toggl 2.0 MCP Server

A local MCP (Model Context Protocol) server that connects to the Toggl 2.0 API. Works with any MCP client including Claude Code and Claude Desktop.

The server supports MCP `2026-07-28` and keeps compatibility with legacy MCP clients. JSON tool results include `structuredContent` for modern clients and a text fallback for older clients.

## One-click install

[![Install in VS Code](https://img.shields.io/badge/[REDACTED]?style=flat-square&logo=visualstudiocode&logoColor=white)](https://vscode.dev/redirect/mcp/install?name=toggl&config=%7B%22command%22%3A%22npx%22%2C%22args%22%3A%5B%22-y%22%2C%22%40togglhq%2Fmcp%22%5D%2C%22env%22%3A%7B%7D%7D)
[![Add to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/install-mcp?name=toggl&config=[REDACTED]%3D%3D)

On first use, call the **auth** MCP tool to sign in (opens your browser). For Claude Code and Claude Desktop, see **Add to your MCP client** below.

## Install

```bash
npm install @togglhq/mcp
# or: pnpm add @togglhq/mcp
```

Authenticate once the MCP server is connected — call the **auth** tool (opens your browser). Or from a terminal:

```bash
npx @togglhq/mcp auth
```

For one-off runs without a local install: `npx -y @togglhq/mcp auth`.

## Add to your MCP client

### Claude Code

```bash
claude mcp add toggl-focus -- npx @togglhq/mcp
```

### Claude Desktop

Add to your Claude Desktop config file:

- **macOS**: `~/Library/Application Support/Claude/claude_desktop_config.json`
- **Windows**: `%APPDATA%\Claude\claude_desktop_config.json`

```json
{
  "mcpServers": {
    "toggl-focus": {
      "command": "npx",
      "args": ["@togglhq/mcp"]
    }
  }
}
```

Restart Claude Desktop after saving.

## Authentication

Uses **OAuth2 with PKCE** via the Toggl Accounts service. Credentials are stored in `~/.toggl/focus-tools.json` (mode 0600). Access tokens refresh automatically — call **auth** again (or run `npx @togglhq/mcp auth`) to switch workspaces or if your refresh token expires (after 4 weeks of inactivity).

> **Upgrading from an older version?** Sessions previously stored at `~/.toggl-focus-mcp/config.json` are still read automatically — no re-authentication needed.

> **Unified config vs legacy file:** MCP **logout** only removes credentials when there is a matching profile row under **`~/.toggl/focus-tools.json`** with **`active.mcp`** set. Call **`auth`** once to migrate into the unified file if logout reports nothing was cleared (or run `npx @togglhq/mcp auth` from a terminal).

### CI or headless environments

Set `TOGGL_API_TOKEN` to a personal Toggl API key (`toggl_sk_…`, from Toggl 2.0 **Settings → API token**). It takes precedence over any OAuth profile: no browser opens, nothing refreshes, and nothing is written to `~/.toggl/focus-tools.json`.

```bash
claude mcp add toggl-focus \
  -s user \
  -e TOGGL_API_TOKEN=<your-api-key> \
  -e TOGGL_ORGANIZATION_ID=<your-org-id> \
  -- npx @togglhq/mcp
```

| Variable                | Required | Default when unset                                                                                        |
| ----------------------- | -------- | --------------------------------------------------------------------------------------------------------- |
| `TOGGL_API_TOKEN`       | Yes      | OAuth profile from `auth`                                                                                 |
| `TOGGL_ORGANIZATION_ID` | Usually  | The organization last selected in Toggl's hosted MCP, if it is for the same workspace; otherwise an error |
| `TOGGL_WORKSPACE_ID`    | No       | Your current Toggl 2.0 workspace                                                                          |
| `TOGGL_USER_ID`         | No       | Looked up from the API key                                                                                |

API keys cannot list organizations, so set `TOGGL_ORGANIZATION_ID` unless the default above applies. App URLs read `focus.toggl.com/<organization_id>/workspaces/<workspace_id>/…`. The server checks the key and the organization/workspace pair at startup and reports a revoked key or a missing org membership by name.

API keys only reach the Toggl 2.0 API. Tools that call Toggl Accounts return `requires OAuth sign-in (run auth)` in this mode: `org-invitations`, `org-members`, `org-time-off-me`, `org-workspaces`, `shared-holidays`, `shared-status`, `shared-working-hours`, and `workspace-list` with `refresh: true`. `workspace-switch`, `profile-switch` and `profile-remove` are disabled, and `auth`, `logout` and `profile-list` report token mode instead of touching saved profiles. To use those tools, unset `TOGGL_API_TOKEN` and run `npx @togglhq/mcp auth`.

The `toggl` CLI (`@togglhq/cli`) honours the same variables; `--workspace-id` overrides `TOGGL_WORKSPACE_ID` there. The key is never logged and is redacted from error reports.

## Tools

### Entity tools

One tool per domain (for example `tasks`, `projects`, `time-entries`, `organization`). Each tool accepts:

- **`action`** (required)
- **`data`** (optional)
- **`confirm_token`** (optional) — second step for mutating operations
- **`dry_run`** (optional) — validates input without calling the API

**Mutation confirmation:** mutating tools return `confirm_required` with a `confirm_token` on the first call; repeat with `confirm_token` to execute.

### Workspace, profiles, and auth

- **workspace-list** — list workspaces (`refresh: true` refetches from Accounts)
- **workspace-switch** — set the active workspace
- **profile-list**, **profile-switch**, **profile-remove** — manage `active.mcp` in `~/.toggl/focus-tools.json`
- **auth**, **logout** — sign in or clear the active MCP profile

Agent-oriented guidance ships in `skills/toggl-mcp/SKILL.md` inside this package.

## Privacy & analytics

Public builds may send product analytics: tool name, entity-tool `action` (for example `list`), outcome (`success`, `error`, or `confirmation_required`), client, session id and package version. Tool arguments and results are never collected. Signed-in sessions are identified by your Toggl account id so repeat use is not counted as a new person each time; unauthenticated processes stay anonymous.

Disable product analytics:

```bash
TOGGL_PRODUCT_ANALYTICS=off
```

Error reporting is on by default. It sends the tool name, a redacted error category, the stack trace with package-relative file paths, the MCP, Node and OS versions, and sampled request timings without query strings. It never sends tool arguments, results, exception text, console output, your hostname, local paths, or your project's dependency list. Disable it with `TOGGL_SENTRY=off`, or send it to your own Sentry project with `TOGGL_SENTRY_DSN`.

## License

Proprietary Toggl software. See [LICENSE](LICENSE) and [Toggl legal terms](https://toggl.com/legal/).
Shell cwd was reset to D:\_Anant\20_Progress\Documents\The Plan
````
- `Agent` -- `{"description":"Read Toggl activity timeline docs","subagent_type":"web-fetch","prompt":"Fetch these Toggl pages and answer specifically. 1) https://docs.toggl.com/activity-timeline : exactly what is recorded (app name, window title, VS Code project/file, browser tab title/URL or site only, Vivaldi support), retention, whether it is queryable via API/CLI/MCP or only inside the app, whether it can be exported, which plan, and whether tracked entries can be created from it. 2) https://docs.toggl.com/toggl-2-0-desktop-app : Auto-Tracker rules (can a rule start a timer with a specific project/task/tags? quote how rules are defined), reminders, idle detection details. 3) https://docs.toggl.com/[REDACTED] : whether it works in Vivaldi/Chromium browsers and what it records. 4) https://docs.toggl.com/how-does-toggl-compare-to-toggl-track and https://docs.toggl.com/toggl-track-features-and-their-toggl-equivalents : which Track features (e.g. timeline, tags, auto tracker, VS Code/IDE integration) exist or not in 2.0. 5) https://docs.toggl.com/toggl-plans-whats-included : confirm whether Public API and MCP are Starter and above, and whether Free allows API/CLI/MCP at all. Quote relevant sentences exactly. Mark unverified items."}`
- `WebSearch` -- `{"query":"Toggl 2.0 Activity Timeline Auto-Tracker rules reddit OR community.toggl.com experience Windows","mode":"standard"}`

## You

[Image #3] 

So, my plan is going to be something that was described above. 

<pasted_content id="539e">
I don’t know the exact extent of the damage, but here’s what we can do: I prefer not to share computer views because that would consume too many tokens. If the task becomes too complex, I’ll use computer views; otherwise, I’ll continue exploring the app and getting the hang of it.
Please give me instructions to implement this process, including the logging. Based on what you’ve said, it’s worth the effort. The logging is self‑monitored and self‑editable, so pulling information from the app and the API requests I’ve described should be straightforward and accurate.
We should implement the recommended workflow, both the old and new development versions, so that time is documented and Jarvis remains unconfused. Time logging occurs only during closures and weekly reviews. On closing days the agent reviews the time logs to ensure accuracy. I don’t want to enter time logs into Jarvis manually; the information should be captured automatically when a skill is invoked and stored for that week.
**Plan overview**
The dashboard will track:
- Time spent working on the laptop
- Time spent on other activities
- General documentation of time
The two note types I created are:
1. Weekly usage for each laptop
2. Daily note
In each daily note, a summary at the bottom records all actions and time‑consuming events on both the old and new laptops. This summary reflects the actions logged in Toggl.
The daily‑note information will flow through the dashboard’s loop and appear on the dashboard (that part is not your concern). Your focus is to make Toggl accessible from the daily note and to design Toggl for this specific use case.
**Next steps**
1. Determine how to document both laptops.
2. Define how to record tasks we are not performing.
3. Ensure we stay on the current task without jumping to others, while documenting time accurately.
We must follow all official Toggl resources and ensure every required step is completed correctly.
</pasted_content id="539e">


[image attached]

## You

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\images\3.png]

## Claude

The screenshot shows **Trial - Focus Premium** with 0 licenses, so you're on a Premium trial and not a paid plan. Premium includes the API, MCP and reminders, so everything works for now. I can't see the trial end date. Open the **⋮** menu on that row or the **Details** tab to find it. If the trial lapses into Free, the API stops working, and the plan falls back to manual logging, so buy a Starter license before it ends. Starter has the API and MCP. Reminders are listed as Premium only, so don't build the plan around them.

I'm giving you instructions here and changing nothing. Every vault write below follows your existing pattern of showing the exact write and waiting for your yes.

## Design in one paragraph

Toggl is the only place time is recorded. The vault never receives a live feed. When you run `closeday`, a new read-only engine command pulls the day's entries, checks them, and the skill shows the proposed daily-note summary and weekly laptop-note rows. `weekly-review` re-pulls the week and finalizes the totals. You never type time into Jarvis.

## Phase 1: Set up Toggl (you, in the app)

1. **Tags** (Settings, Tags): create `dev-new` and `dev-old`.
2. **Projects:** create a handful matching your areas, plus these two non-task buckets:
   - `Unplanned`: work you did that wasn't a listed task.
   - `Off-task`: drift and distractions.
3. **Breaks:** use the timer's break type for rests, so they never count as work.
4. **Convention:** the entry description is the exact daily-note task text. That makes per-task mapping a text match instead of a Toggl task for every line.
5. **Install** the app on the old laptop and sign in with the same account.

## Phase 2: Settle the laptop split (10-minute test)

Auto-Tracker rules can't set tags, so test the fallback before relying on it.
1. On the new laptop, create one rule with the description `[new] VS Code: The Plan`.
2. On the old laptop, check whether that rule appears.
3. If rules are not shared, give each laptop its own rule descriptions. The prefix then identifies the device.
4. If they are shared, use the tag for manual starts, and let the engine flag any entry with no device marker for you to assign at closeday.

One limit: Toggl allows one running timer per account, and starting a new one stops the old. Two laptops can't be recorded in parallel, which also keeps you on one current task.

## Phase 3: Credentials (you, once per laptop)

1. In Toggl, go to Settings, API token, and create the key. It is shown once and creating a new one revokes the old one.
2. Set `TOGGL_API_TOKEN` and `TOGGL_ORGANIZATION_ID` as Windows user environment variables on both laptops. Never put the key in the vault, which auto-syncs to git.
3. I won't read the key. I'll only run commands that use it.

## Phase 4: Engine command (needs your approval)

In the `the-plan-dashboard` repo, I'd add a read-only `plan-cli toggl day <date>` and `toggl week <YYYY-Www>`. They return JSON with time per laptop, project and task, off-task time, untracked gaps, and review flags. The flags would cover:
- A timer still running.
- Overlapping entries.
- Entries with no project or task.
- Entries with no device marker.
- Gaps over a set length.
- The number of task switches.

I'd add tests, then follow your build and deploy steps. This is the first command that needs network access, so tell me if you object.

## Phase 5: Notes and skills (needs your approval)

- **Weekly laptop notes:** one per laptop per ISO week. Sections: summary, entries by day, untracked gaps, review flags. I need a folder and naming decision (see below).
- **Daily note:** one new section at the bottom, "Time (Toggl)", with per-laptop totals, top tasks, off-task and untracked time. It needs a Daily Note Schema change, which I'd propose first, then check with `validate` so the streak engine isn't affected.
- **Skills:** add a Toggl step to `closeday` and `weekly-review`. The accuracy review happens in `closeday`, where the engine's flags are shown before you say yes. Your edits in Toggl after closeday get picked up at the weekly review, which flags entries changed since the daily write.
- **Agent:** `daily-auditor` gets a check that the time section matches the engine JSON.

## Your three goals

1. **Both laptops:** device marker from Phase 2, one weekly note each.
2. **Time not on listed tasks:** `Unplanned`, `Off-task` and breaks, plus engine-computed untracked gaps you attribute at closeday.
3. **Staying on one task:** one running timer, Auto-Tracker's "Stop timer when no activity matches rules" (raise the 5-second start delay if switches are noisy), and a task-switch count in the closeday review. Toggl has no blocker. A Jarvis nudge that polls the running timer is for later.

## Decisions for you

1. Where should the weekly laptop notes live, and what should they be called?
2. Do you approve a read-only network command in the engine?
3. Do you want me to start with Phase 4, or hold until you've run Phase 2?

## You

The screenshot shows Trial - Focus Premium with 0 licenses, so you're on a Premium trial and not a paid plan. Premium includes the API, MCP and reminders, so everything works for now. I can't see the trial end date. Open the ⋮ menu on that row or the Details tab to find it. If the trial lapses into Free, the API stops working, and the plan falls back to manual logging, so buy a Starter license before it ends. Starter has the API and MCP. do not rely on this because we will not be paying for this tool at all, revise the plan provided to be solely focused on the free plan and everything work regardless of the paid version. What are limited to the free version?

## Claude

Understood, no paid plan. The Free limits are only partly clear: the plan table says Free has no API, but other pages imply the MCP works on Free. I'll check both, plus the free route that doesn't depend on Toggl's API.

Everything below is rebuilt around the Free plan. The main change is that **I can't confirm Toggl's API works on Free**, so the plan no longer depends on it.

## What is limited on Free

| Limit | Status |
|---|---|
| 3 members | Verified (plan table and pricing page). Fine for one person. |
| 30 report-data requests per month, in the web app, MCP and CLI | Verified (MCP/CLI docs). |
| 30 API requests per hour, per user, per organization. Going over returns HTTP 402. | Verified (engineering docs). |
| No CSV or XLSX report export, only PDF of the Summary and Time Logs reports. The PDF likely carries a watermark. | Plan table says this. One search result says Toggl 2.0 allows CSV on Free, so this conflicts. Unverified. |
| No reminders and project alerts, no custom fields, no required fields, no AI chat, no report sharing, no scheduled reports. | Verified (plan table). Personal desktop reminders on Free: unverified. |
| No data-retention limit found. | Unverified either way. |
| Public API and MCP | **Conflicting.** The plan table leaves Free blank. The MCP page says "The MCP server and CLI are on the free plan." The MCP/CLI docs say core features are available on Free. The quota table lists a Free API quota. I read the table as the stale outlier, but that is my inference. |
| Auto-Tracker | Verified: "Available on all plans." |
| Activity Timeline, idle detection, browser extension | Plan not stated. Unverified. |
| What happens to your workspace when the trial ends | Unverified. Cancelling a trial ends it immediately. |

## What changes in the plan

1. **Don't build on the trial.** Your current workspace keeps Premium until the trial ends, but nothing in the design may need it.
2. **Stay inside the quotas.**
   - Pull once per `closeday` using the time-entries list or stream, not the reports endpoint. That is a handful of requests against the 30 per hour.
   - Never poll the running timer from Jarvis more than a few times an hour.
   - Whether the time-entries list counts as a "report data request" is unverified, so I would test it.
3. **Treat the vault as the archive.** Free retention is unverified, so `closeday` copies the day into the notes and nothing depends on Toggl keeping history.
4. **Drop the tags and Premium features.** Reminders and project alerts are out.

## Revised plan

**Phase 0: test Free before building (about 15 minutes).**
Your current workspace is on a trial, and cancelling it can't be undone. So test with a second, throwaway Toggl account and cancel its trial. Check four things:
- Can you create an API key?
- Does `toggl time-entries list` work with `TOGGL_API_TOKEN`?
- Does the MCP connect?
- Do the exports include CSV?

The result picks Path A or Path B.

**Path A, if the API works on Free.**
Same design as before: a read-only `plan-cli toggl day|week` command, run by `closeday` and `weekly-review`, writing a daily-note section and a per-laptop weekly row after your yes.

**Path B, if it doesn't.**
Toggl stays an optional timer, and the record comes from ActivityWatch (below).

**ActivityWatch as the base layer, recommended either way.**
It is free forever (MPL-2.0), local only, and solves the device problem without tags:
- Each laptop's data is stored under its hostname, so "which laptop" is automatic.
- It records window title and app on Windows. Its browser extension records tab title and URL, and Vivaldi is unverified but plausible, since it installs from the Chrome Web Store.
- Its idle watcher flags 3 minutes of inactivity by default, which gives you the "where time is lost" signal.
- Its local REST API is on port 5600, with date-range queries.
- The VS Code add-on records file, project and language, but its last commit is from 2023. VS Code's window title may be the more reliable source.

Because each laptop writes its own weekly note from its own local ActivityWatch, no raw data has to move between laptops. The vault's normal sync carries the notes, and the daily summary reads both. Two caveats: the other laptop's rows may lag until its sync arrives, and ActivityWatch has no pop-ups or blockers.

**Phase 1 to 4 (same as before, simplified):**
- Toggl setup: projects, `Unplanned` and `Off-task` buckets, breaks, and descriptions that match the daily-note task text.
- Credentials: environment variables, never in the vault.
- Engine command (needs your approval).
- Notes and skill changes (need your approval).

When both sources exist, the engine can join them by time overlap and assign each Toggl entry to the laptop that was active, with no tags needed.

## Decisions for you

1. Are you willing to create a throwaway Toggl account for Phase 0?
2. Do you want me to research ActivityWatch further, in particular Vivaldi and its categorization rules, before choosing it?

Sources:
- [Toggl 2.0 plans](https://docs.toggl.com/toggl-plans-whats-included)
- [Toggl MCP](https://toggl.com/ai/mcp)
- [Toggl 2.0 API overview](https://engineering.toggl.com/docs/focus/)
- [Toggl exporting data](https://support.toggl.com/exporting-data)
- [ActivityWatch docs](https://docs.activitywatch.net/en/latest/)
- [aw-watcher-web](https://github.com/ActivityWatch/aw-watcher-web)
- [aw-watcher-vscode](https://github.com/ActivityWatch/aw-watcher-vscode)

### Tool Calls

- `Agent` -- `{"description":"Verify Toggl Free plan limits","subagent_type":"web-fetch","prompt":"I need exact Free-plan limits for the Toggl 2.0 product (docs.toggl.com, focus.toggl.com), not Toggl Track. Fetch and quote exactly: https://docs.toggl.com/toggl-plans-whats-included , https://toggl.com/ai/mcp , https://toggl.com/pricing , https://docs.toggl.com/toggl-mcp-and-cl (may 404, try anyway), https://docs.toggl.com/subscription-billing , and https://engineering.toggl.com/docs/focus/ . Also look for docs pages on: exporting time logs / reports (CSV, PDF, Excel, copy to clipboard) and what Free allows; the Time Logs report; report data request limits (\u002730 per month\u0027); what happens to a workspace when a trial ends (downgrade to Free, data retention, history limits, member limits); whether the Auto-Tracker, Activity Timeline (My activity), Smart Suggestions, idle detection, desktop reminders, and browser extension are available on Free. Answer these questions with exact quotes and URLs: (1) Can a Free workspace use the Public API, API key, CLI or MCP? Resolve the conflict between the plans table (Public API, MCP blank for Free) and the quota docs (Free 30 requests/hour) and toggl.com/ai/mcp. (2) What export is possible on Free? (3) Any history or data-retention limit on Free? (4) What exactly is limited on Free in total? Mark unverified items clearly."}`
- `Agent` -- `{"description":"Research ActivityWatch for Windows","subagent_type":"web-fetch","prompt":"Research ActivityWatch (open-source automatic time tracker) for a Windows 11 user who uses Vivaldi (Chromium) and VS Code. Fetch https://docs.activitywatch.net/en/latest/ (and its pages on watchers, REST API, buckets, exporting data, remote/multi-device, installation on Windows), https://github.com/ActivityWatch/activitywatch , https://github.com/ActivityWatch/aw-watcher-web , https://github.com/ActivityWatch/aw-watcher-vscode , and https://github.com/ActivityWatch/aw-watcher-window . Report with quotes and URLs: (1) what the window watcher records on Windows (app name, window title); (2) whether aw-watcher-web works in Vivaldi/Chromium and what it records (URL, tab title, audible, incognito); (3) what aw-watcher-vscode records (file, project, language, git branch) and its maintenance status; (4) the local REST API: default port, endpoints to query events for a date range, and the query language (e.g. the \u0027canonicalEvents\u0027 or categorization); (5) per-device identity (hostname in bucket ids) and how to combine data from two computers; (6) AFK/idle watcher; (7) data storage location and privacy (local only?); (8) license/cost; (9) last release date and any known Windows problems. Mark unverified items."}`
- `WebSearch` -- `{"query":"Toggl 2.0 free plan API access MCP CLI free plan limits export CSV","mode":"extended"}`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_

