---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Startup programs on laptop boot"
started_at: 2026-10-26T18:45:11
ended_at: 2026-10-26T18:45:41
exported_at: 2026-10-26T18:45:41
duration_minutes: 0.5
project: Home
cwd: 'C:\Users\anant'
session_id: 4db8e529-8678-4f78-be00-8ff8849354ea
status: raw
turn_count: 2
tools_used:
  PowerShell: 5
tokens:
  input: 6
  output: 3066
  cache_creation: 26181
  cache_read: 137247
  total: 166500
cost_usd: null
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Startup programs on laptop boot

## You

I have not opened anything, i have just restarted the laptop. I want to know everything that launched as soon as the laptop is launched. Tell me everything that launched, we need to configure the things open up.

## Claude

I'll check what's running now, plus the startup entries that launch it (registry Run keys, Startup folders, logon tasks, auto-start services).

Boot was at 18:41:34. This is everything that started on its own since then, grouped by how it launches.

## Registry "Run" keys (current user)
| App | Starts at boot? |
|---|---|
| Discord (starts inactive) | **Yes** |
| Google Drive | **Yes** |
| Riot Client | Disabled |
| Loom | Disabled |
| Docker Desktop | Disabled |
| Slack | Disabled |

## Startup folders
| App | Starts at boot? |
|---|---|
| Wispr Flow | **Yes** |
| Tailscale (all-users folder) | **Yes** |
| Ollama | Disabled |

## Registry "Run" keys (machine-wide, run for every user)
These weren't checked against Windows' on/off switch.
- Windows Security tray icon
- Realtek audio service
- Riot Vanguard tray (`vgtray.exe`)
- Discord install check

## Scheduled tasks that run at logon or boot
| Task | What it does |
|---|---|
| `cua-driver-serve` | Starts the Cua agent cursor overlay (visible at 18:42:13). |
| `Jarvis-Codex-Daemon-Guard` | Runs a hidden script from your Jarvis folder on D:. It is probably what started the `codex` processes at 18:42:44. |
| OneDrive Startup Task | Starts OneDrive. |
| PredatorSenseLauncher | Starts Acer PredatorSense (4 processes). |
| StorPSCTL | Acer storage control. |
| UEIPInvitation | Acer user experience program check. |
| PowerToys "Autorun" | Starts PowerToys, which brings up FancyZones, Peek, Advanced Paste, AlwaysOnTop, Shortcut Guide, PowerOCR, Quick Access and Command Palette. |

## Auto-start services (non-Windows)
- Tailscale
- WSL
- NVIDIA LocalSystem Container
- Microsoft Office Click-to-Run
- Zoom Sharing Service

## Other things that appeared, with no startup entry I found
- **ChatGPT desktop** (18:43:10), **Spotify launcher** and **Phone Link / PhoneExperienceHost**. These likely register themselves in a way I didn't check, such as a Store app startup task.
- **Windows Terminal** (18:42:47), **Claude Code** (18:44:26) and **WSL bash** (18:44:30). These are probably from the terminal or VS Code profile you use, since you said you opened nothing manually. I haven't traced what triggered them.

## Not running
The MCP servers `firecrawl`, `jarvis` and `the-plan` failed to connect. `jarvis` and `the-plan` refused the connection, so something that should be listening locally isn't up. `firecrawl` timed out.

## To configure it
Tell me which apps to keep at boot and which to remove. I can switch Run-key and Startup-folder items off the same way Task Manager does, and disable scheduled tasks (some need an admin shell). Otherwise, Task Manager's Startup apps tab (Ctrl+Shift+Esc) shows the same on/off list.

I changed nothing and wrote no files.

### Tool Calls

- `PowerShell` -- `{"command":"$boot=(Get-CimInstance Win32_OperatingSystem).LastBootUpTime; \"Boot: $boot\"; Get-Process | Where-Object { $_.StartTime -and $_.StartTime -gt $boot.AddMinutes(-1) -and $_.MainWindowTitle -ne \u0027\u0027 } | Select-Object Name,Id,StartTime,MainWindowTitle | Sort-Object StartTime | Format-Table -AutoSize | Out-String -Width 200","description":"List visible windows opened since boot"}`
- `PowerShell` -- `{"command":"$keys=\u0027HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\u0027,\u0027HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\u0027,\u0027HKLM:\\Software\\WOW6432Node\\Microsoft\\Windows\\CurrentVersion\\Run\u0027; foreach($k in $keys){\"== $k\"; $p=Get-ItemProperty $k -ErrorAction SilentlyContinue; if($p){$p.PSObject.Properties | Where-Object {$_.Name -notlike \u0027PS*\u0027} | ForEach-Object {\"$($_.Name) = $($_.Value)\"}}}; \"== Startup folders\"; Get-ChildItem \"$env:APPDATA\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\",\"$env:ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\StartUp\" -ErrorAction SilentlyContinue | Select-Object FullName; \"== StartupApproved (disabled=03/other)\"; foreach($k in \u0027HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\StartupApproved\\Run\u0027,\u0027HKCU:\\Software\\Microsoft\\Windows\\CurrentVersion\\Explorer\\StartupApproved\\StartupFolder\u0027){ $p=Get-ItemProperty $k -ErrorAction SilentlyContinue; if($p){$p.PSObject.Properties | Where-Object {$_.Name -notlike \u0027PS*\u0027} | ForEach-Object {\"$($_.Name) : state byte $($_.Value[0])\"}}}","description":"List registry Run keys and Startup folders"}`
- `PowerShell` -- `{"command":"Get-ScheduledTask | Where-Object { $_.State -ne \u0027Disabled\u0027 -and $_.TaskPath -notlike \u0027\\Microsoft\\*\u0027 -and ($_.Triggers | Where-Object { $_.CimClass.CimClassName -match \u0027Logon|Boot\u0027 }) } | Select-Object TaskName,TaskPath,State,@{n=\u0027Action\u0027;e={($_.Actions|ForEach-Object{$_.Execute+\u0027 \u0027+$_.Arguments}) -join \u0027; \u0027}} | Format-List | Out-String -Width 200","description":"List non-Microsoft logon/boot scheduled tasks"}`
- `PowerShell` -- `{"command":"Get-CimInstance Win32_Service | Where-Object { $_.StartMode -eq \u0027Auto\u0027 -and $_.State -eq \u0027Running\u0027 -and $_.PathName -notmatch \u0027System32|svchost|SysWOW64|Windows Defender|WindowsApps\u0027 } | Select-Object Name,DisplayName,PathName | Format-Table -AutoSize -Wrap | Out-String -Width 220","description":"List third-party auto-start running services"}`
- `PowerShell` -- `{"command":"$boot=(Get-CimInstance Win32_OperatingSystem).LastBootUpTime; Get-Process | Where-Object { $_.StartTime -and $_.StartTime -gt $boot -and $_.Path -and $_.Path -notmatch \u0027\\\\Windows\\\\\u0027 } | Group-Object Name | Select-Object Name,Count,@{n=\u0027First\u0027;e={($_.Group|Sort-Object StartTime|Select-Object -First 1).StartTime.ToString(\u0027HH:mm:ss\u0027)}} | Sort-Object First | Format-Table -AutoSize | Out-String -Width 200","description":"List non-Windows processes started since boot"}`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_


