---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Toggl API time tracking"
started_at: 2026-10-28T22:26:20
ended_at: 2026-10-28T22:30:14
exported_at: 2026-10-28T22:30:15
duration_minutes: 3.9
project: The Plan
cwd: 'D:\_Anant\20_Progress\Documents\The Plan'
session_id: 045b6dda-a561-490b-a55b-b3f474963737
status: seed
review_state: raw
created: 2026-10-28
updated: 2026-10-28
turn_count: 2
tools_used:
  Agent: 2
  PowerShell: 3
  ToolSearch: 1
  WebSearch: 3
tokens:
  input: 14
  output: 5263
  cache_creation: 46142
  cache_read: 207551
  total: 258970
cost_usd: 0.257981
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

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_

