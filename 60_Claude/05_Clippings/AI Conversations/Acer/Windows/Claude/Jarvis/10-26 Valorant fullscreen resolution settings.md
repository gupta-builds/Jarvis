---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Valorant fullscreen resolution settings"
started_at: 2026-10-26T22:17:10
ended_at: 2026-10-27T23:02:12
exported_at: 2026-10-27T23:03:13
duration_minutes: 1485
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis'
session_id: fc64a558-0fb7-49f1-bec9-d00fcd7a2632
status: raw
turn_count: 9
tools_used:
  Agent: 1
  Glob: 1
  Grep: 3
  PowerShell: 4
  Read: 1
  ToolSearch: 1
  WebSearch: 4
tokens:
  input: 24
  output: 10385
  cache_creation: 119430
  cache_read: 622536
  total: 752375
cost_usd: null
model:
  - "claude-sonnet-5-5"
files_touched:
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\40_Resources\\CS\\Concepts\\New Laptop\\Old Laptop Rebuild\\Task Bar Changes.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Valorant fullscreen resolution settings

## You

<local-command-caveat>The command below was run directly in Claude Code, not sent to you as a request, and its output goes straight to the user. It's recorded here as context for later messages.</local-command-caveat>

## You

<command-name>/clear</command-name>
            <command-message>clear</command-message>
            <command-args></command-args>

## You

[Image #3] i think a while i ago i changed the settings for valorant on display because of the taskbar but taskbar has been updated and the settings needed to be changed to full screen resolutions. The best resolutions for the game need to be set based on solid reseaerch

[image attached]

## You

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\[REDACTED]\[REDACTED]\images\3.png]

## Claude

I'll check your actual display setup and the taskbar note first, then research the Valorant side.

Short version: set Valorant to **2560x1600, Fullscreen, Aspect Ratio Method: Fill**. The taskbar is no longer a reason to keep a smaller or 16:9 setting.

**What I found on your machine**
- Your panel is 2560x1600 (16:10) at 240 Hz, on an Acer Predator with an RTX 5070 Ti Laptop GPU.
- The screenshot is 16:9 content with black bars top and bottom. That is a 16:9 image on a 16:10 screen, so the game is not filling your panel.
- Valorant's saved config files list 2560x1600, fullscreen mode 0 (Fullscreen) and `bShouldLetterbox=True` (letterboxing on). So the bars may come from the letterbox setting or from an unsaved in-game change. I can't tell which from the files. The game is running now and rewrites these files, so I didn't edit them.
- Your taskbar is now auto-hide, 36 px and transparent, per your [[Task Bar Changes]] note. That is why the old workaround of shrinking the game to leave room for it is no longer needed.

**What the research supports**
- Riot lists 2560x1600 as a supported 16:10 resolution. It also says 16:10 in full-screen "may" cause issues and recommends windowed mode. It strongly recommends 16:9 for the best experience ([Riot support](https://support.riotgames.com/en-us/valorant/support-tools/supported-resolutions-in-valorant)).
- Riot's page says nothing about the Fill vs Letterbox option or windowed fullscreen. The Fill advice comes from community guides, which pair Fill with Windowed Fullscreen and then switch back to Fullscreen ([Sportskeeda](https://sportskeeda.com/valorant/[REDACTED])). That advice was written for ultrawide monitors, so treat it as a likely fix, not a confirmed one.
- One guide says Fullscreen gives the best frame rates and lowest input lag ([esports.net](https://www.esports.net/news/valorant/valorant-fullscreen-vs-windowed)). I couldn't verify that independently.
- I found no reliable source on whether native 16:10 shows extra vertical view. Check that in game rather than trusting me on it.

**Settings to try, in order**
1. In Windows Display settings, confirm 2560x1600 at 240 Hz.
2. In Valorant, open Settings, Video, General. Set Display Mode to **Fullscreen**, Resolution to **2560 x 1600**, and Aspect Ratio Method to **Fill**.
3. If Fullscreen gives flicker, a stuck resolution or alt-tab problems (the 16:10 issues Riot warns about), switch to **Windowed Fullscreen** at 2560x1600 with Fill.
4. If you want more fps and don't mind a softer image, 1920x1200 is the next native 16:10 step down. A 5070 Ti should not need it.
5. Avoid 2560x1440. It is Riot's recommended ratio, but on your panel it is the black-bar look in your screenshot.

One more check: make sure Windows runs Valorant on the NVIDIA GPU, not the Intel one. In Settings, System, Display, Graphics, set it to High performance. This is from my own knowledge, not these sources.

I can set the config values directly if you want, but only with the game closed. Otherwise it overwrites them on exit and may re-sync from your account.

Sources:
- [Supported Resolutions in VALORANT (Riot)](https://support.riotgames.com/en-us/valorant/support-tools/supported-resolutions-in-valorant)
- [VALORANT: How to fix ultrawide issue (Sportskeeda)](https://sportskeeda.com/valorant/[REDACTED])
- [VALORANT Fullscreen vs Windowed Mode (esports.net)](https://www.esports.net/news/valorant/valorant-fullscreen-vs-windowed)

### Tool Calls

- `PowerShell` -- `{"command":"Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Screen]::AllScreens | ForEach-Object { \"$($_.DeviceName) $($_.Bounds.Width)x$($_.Bounds.Height) primary=$($_.Primary)\" }; Get-CimInstance Win32_VideoController | Select-Object Name,CurrentHorizontalResolution,CurrentVerticalResolution,CurrentRefreshRate,MaxRefreshRate | Format-List; Get-CimInstance Win32_ComputerSystem | Select-Object Manufacturer,Model | Format-List","description":"Query display resolution, GPU and laptop model"}`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\40_Resources\CS\Concepts\New Laptop\Old Laptop Rebuild\Task Bar Changes.md`
- `Glob` -- pattern `VALORANT/Saved/Config/**/GameUserSettings.ini` path `C:\Users\anant\AppData\Local`
- `ToolSearch` -- `{"query":"select:WebSearch","max_results":1}`
- `Grep` -- pattern `ResolutionSize|WindowPosition|FullscreenMode|LastConfirmedFullscreenMode|PreferredFullscreenMode|DesiredScreen|FrameRateLimit|AspectRatio|bShouldLetterbox|bUseVSync|HDR|Mode` path `C:\Users\anant\AppData\Local\VALORANT\Saved\Config\WindowsClient\GameUserSettings.ini`
- `WebSearch` -- `{"query":"Valorant 16:10 display 2560x1600 laptop black bars letterbox fullscreen resolution settings","mode":"standard"}`
- `WebSearch` -- `{"query":"Valorant Display settings Fullscreen vs Windowed Fullscreen Letterboxing aspect ratio method Fill explained","mode":"standard"}`
- `Agent` -- `{"description":"Read Riot supported resolutions page","subagent_type":"web-fetch","prompt":"Fetch https://support-valorant.riotgames.com/hc/en-us/articles/[REDACTED] (fallback: https://support.riotgames.com/en-us/valorant/support-tools/supported-resolutions-in-valorant). Report exactly what Riot says about: (1) the list of supported resolutions, especially 16:10 ones such as 2560x1600, 1920x1200, 1680x1050; (2) the recommendation on fullscreen vs windowed vs windowed fullscreen for 16:10; (3) anything about letterbox, black bars, the Aspect Ratio Method (Fill vs Letterbox) setting, or how 16:10 is rendered (extra vertical view or cropped). Quote the relevant sentences."}`
- `Grep` -- pattern `ResolutionSize|FullscreenMode|bShouldLetterbox|FrameRateLimit` path `C:\Users\anant\AppData\Local\VALORANT\Saved\Config`
- `WebSearch` -- `{"query":"Valorant 16:10 resolution 1920x1200 2560x1600 extra vertical field of view competitive advantage pros","mode":"standard"}`

## You

the valorant settings are correct but still it's like that

## Claude

The settings file still says letterboxing is on, which matches what you're seeing. Valorant is running, and all three of its config files have `bShouldLetterbox=True` (the common one and both account ones). The same files show 2560x1600 and Fullscreen. So the resolution is right and the letterbox flag is the problem.

I'm inferring from the name that this flag is the Aspect Ratio Method: `True` would mean Letterbox, `False` would mean Fill. I haven't confirmed that mapping. The most likely reasons it still says `True`:
- Fill was never saved. The game may only write the file on exit.
- The menu option isn't what I assumed.
- Your account's cloud-synced settings re-applied Letterbox.

**The fix I'd try first:** close Valorant completely, including the Riot client, and tell me. I'll set `bShouldLetterbox=False` in the three config files. If the bars are gone next launch, that confirms it. The game rewrites these files while running, so editing now would be pointless.

**Other causes, if that doesn't work.** These come from guides for other setups, not your exact laptop:
1. **GPU scaling.** In NVIDIA Control Panel, open Adjust desktop size and position. Set Scaling to GPU and tick "Override the scaling mode set by games or programs" ([source](https://www.technewstoday.com/fix-ultrawide-issue-in-valorant/)). Hybrid laptops also have an Intel scaling option. A Counter-Strike thread suggests setting Intel's scaling to full screen, but that thread isn't about Valorant.
2. **Windows GPU choice.** Valorant's entry under Settings, System, Display, Graphics is set to "let Windows decide" (`GpuPreference=0`). Setting it to High performance puts the game on the RTX 5070 Ti and removes one hybrid-graphics variable.
3. **Fullscreen optimizations.** Right-click `D:\Games\Riot Games\VALORANT\live\ShooterGame\Binaries\Win64\VALORANT-Win64-Shipping.exe`, open Properties, then Compatibility, and tick "Disable fullscreen optimizations". One guide recommends this for hybrid-graphics laptops.
4. **Windowed Fullscreen at 2560x1600 with Fill.** This is the fallback Riot's own page points to for 16:10, since it says full-screen mode can have issues there ([Riot](https://support.riotgames.com/en-us/valorant/support-tools/supported-resolutions-in-valorant)).

I found nothing written for a 2560x1600 laptop in Valorant, so all of this is adapted from other setups.

Sources:
- [How to Fix Ultrawide Issue in Valorant (Tech News Today)](https://www.technewstoday.com/fix-ultrawide-issue-in-valorant/)
- [Supported Resolutions in VALORANT (Riot)](https://support.riotgames.com/en-us/valorant/support-tools/supported-resolutions-in-valorant)

### Tool Calls

- `Grep` -- pattern `ResolutionSize|FullscreenMode|bShouldLetterbox|DesiredScreen|bUseDesired` path `C:\Users\anant\AppData\Local\VALORANT\Saved\Config`
- `WebSearch` -- `{"query":"Valorant black bars top and bottom 16:10 laptop 2560x1600 fullscreen \"Letterbox\" fix NVIDIA scaling","mode":"extended"}`
- `PowerShell` -- `{"command":"Get-Process | Where-Object { $_.ProcessName -match \u0027VALORANT\u0027 } | Select-Object ProcessName,Id | Format-Table; Get-ItemProperty \u0027HKCU:\\Software\\Microsoft\\DirectX\\UserGpuPreferences\u0027 -ErrorAction SilentlyContinue | Select-Object * -ExcludeProperty PS* | Format-List; Get-CimInstance -Namespace root\\wmi -ClassName WmiMonitorBasicDisplayParams -ErrorAction SilentlyContinue | Select-Object InstanceName,MaxHorizontalImageSize,MaxVerticalImageSize | Format-Table","description":"Check Valorant process, GPU preference, monitor size"}`

## You

I am not sure what it is but it needs to be fixed, look into it yourslef.

## Claude

I made one change. Valorant is now set to run on the RTX 5070 Ti ("High performance") instead of "let Windows decide". It was `GpuPreference=0` before and is `2` now. Fullscreen optimizations were already disabled for the game, so I left that alone. Neither change takes effect until the game restarts, and I haven't tested whether they fix the bars.

I haven't fixed the black bars yet. The cause I found is `bShouldLetterbox=True` in all three Valorant config files. I assumed that flag is the Aspect Ratio Method, but I haven't confirmed it. Valorant is still running and rewrites its config on exit, so I can't change the flag safely now.

Close Valorant fully (quit from the Riot client too), then tell me. I'll set the flag to `False` in all three files and re-read them to confirm. Then relaunch with Fullscreen at 2560x1600 and see whether the bars are gone.

If they are still there, the next step is NVIDIA Control Panel. Under Adjust desktop size and position, set Scaling to GPU and tick the override box. I can't script that from here, so you would need to click through it.

### Tool Calls

- `PowerShell` -- `{"command":"Get-Process | Where-Object { $_.ProcessName -match \u0027VALORANT|RiotClient|Riot\u0027 } | Select-Object ProcessName,Id,StartTime | Format-Table; Get-ChildItem \u0027C:\\Users\\anant\\AppData\\Local\\VALORANT\\Saved\\Config\u0027 -Recurse -Filter GameUserSettings.ini | Select-Object FullName,LastWriteTime | Format-Table -AutoSize","description":"Check whether Valorant is running and config timestamps"}`
- `PowerShell` -- `{"command":"$exe = \u0027D:\\Games\\Riot Games\\VALORANT\\live\\ShooterGame\\Binaries\\Win64\\VALORANT-Win64-Shipping.exe\u0027\n$gpu = \u0027HKCU:\\Software\\Microsoft\\DirectX\\UserGpuPreferences\u0027\n$lay = \u0027HKCU:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\AppCompatFlags\\Layers\u0027\n\"before gpu: \" + (Get-ItemProperty $gpu -Name $exe -ErrorAction SilentlyContinue).$exe\n\"before layers: \" + (Get-ItemProperty $lay -Name $exe -ErrorAction SilentlyContinue).$exe\nSet-ItemProperty -Path $gpu -Name $exe -Value \u0027GpuPreference=2;\u0027\nif (-not (Test-Path $lay)) { New-Item -Path $lay -Force | Out-Null }\nSet-ItemProperty -Path $lay -Name $exe -Value \u0027~ DISABLEDXMAXIMIZEDWINDOWEDMODE\u0027\n\"after gpu: \" + (Get-ItemProperty $gpu -Name $exe).$exe\n\"after layers: \" + (Get-ItemProperty $lay -Name $exe).$exe","description":"Set Valorant to high performance GPU, disable fullscreen optimizations"}`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_


