---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Random wallpaper changes"
started_at: 2026-11-03T18:44:01
ended_at: 2026-11-03T18:44:17
exported_at: 2026-11-03T18:46:57
duration_minutes: 0.3
project: Home
cwd: 'C:\Users\anant'
session_id: 3c23df14-5aa8-4306-ae70-fd75534352e9
status: seed
review_state: raw
created: 2026-11-03
updated: 2026-11-03
turn_count: 2
tools_used:
  PowerShell: 1
tokens:
  input: 4
  output: 1451
  cache_creation: 24022
  cache_read: 83270
  total: 108747
cost_usd: 0.118933
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Random wallpaper changes

## You

My wallpaper keeps changing randomly why is that?

## Claude

I'll check the usual causes on your machine: slideshow, Spotlight, and theme sync.

Your wallpaper is almost certainly being changed by **Windows Spotlight on the desktop**.

The current wallpaper file sits under `MicrosoftWindows.Client.CBS_cw5n1h2txyewy\LocalCache\Microsoft\IrisService\...`. That is the folder Windows Spotlight (the "Iris" service) downloads its rotating images into. Spotlight swaps the picture on its own schedule and can also pull in a new one at sign-in or after an update.

A second possible cause is **AICO Parallax Wallpaper**, which is running right now (PID 26876). It's a third-party wallpaper app. If it has a playlist or auto-change option turned on, it can also swap the wallpaper, and it can fight with the Windows setting.

**To stop Spotlight:**
1. Open Settings, then Personalization, then Background.
2. Change "Personalize your background" from **Windows Spotlight** to **Picture** (or Solid color).
3. Pick the image you want.

If you also see a "Learn more about this picture" icon on your desktop, that is Spotlight too. Switching to Picture removes it.

**If it keeps changing after that:** check AICO's settings for an auto-change or playlist option and turn it off. You could also quit AICO and see if the problem stops.

I only read settings and changed nothing. Do you want me to look further into the AICO app?

### Tool Calls

- `PowerShell`
```powershell
$p='HKCU:\Control Panel\Desktop'; (Get-ItemProperty $p).WallPaper
"--- Wallpapers key"; Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers' -ErrorAction SilentlyContinue | Select BackgroundType,SlideshowTickCount,SlideshowEmpty,SlideshowSourceDirectoriesSet | Format-List
"--- Spotlight / content delivery"; Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -ErrorAction SilentlyContinue | Select RotatingLockScreenEnabled,SubscribedContent-338387Enabled | Format-List
"--- Theme sync"; Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes' -ErrorAction SilentlyContinue | Select CurrentTheme,ThemeChangesDesktopWallpaper | Format-List
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization' -ErrorAction SilentlyContinue | Format-List
"--- Policies"; Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System' -ErrorAction SilentlyContinue | Select Wallpaper | Format-List
"--- Desktop spotlight"; Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -ErrorAction SilentlyContinue | Select *Spotlight* | Format-List
"--- Possible wallpaper apps"; Get-Process | Where-Object { $_.Name -match 'wallpaper|lively|rainmeter|bing|dreamscene|displayfusion|john' } | Select Name,Id
"--- Recent wallpaper files"; Get-ChildItem "$env:APPDATA\Microsoft\Windows\Themes" -ErrorAction SilentlyContinue | Select Name,LastWriteTime
```
```
C:\Users\anant\AppData\Local\Packages\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\LocalCache\Microsoft\IrisService\10190558792031361157\134382244168422649.jpg
--- Wallpapers key

BackgroundType                : 
SlideshowTickCount            : 
SlideshowEmpty                : 
SlideshowSourceDirectoriesSet : 1

--- Spotlight / content delivery

RotatingLockScreenEnabled       : 1
[REDACTED] : 

--- Theme sync

CurrentTheme                 : C:\Users\anant\AppData\Local\Microsoft\Windows\Themes\Custom.theme
ThemeChangesDesktopWallpaper : 

--- Policies
--- Desktop spotlight

--- Possible wallpaper apps

Name                        Id
----                        --
AICO Parallax Wallpaper  26876
--- Recent wallpaper files
TranscodedWallpaperCache      
TranscodedWallpaper
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_

