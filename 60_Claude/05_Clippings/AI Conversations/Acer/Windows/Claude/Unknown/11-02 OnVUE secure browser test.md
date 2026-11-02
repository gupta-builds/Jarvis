---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "OnVUE secure browser test"
started_at: 2026-11-02T12:19:09
ended_at: 2026-11-02T12:23:36
exported_at: 2026-11-02T14:31:02
duration_minutes: 4.5
project: Unknown
cwd: 'D:\'
session_id: fc3b5326-982f-42f9-9a31-ed21de8ae1fb
status: seed
review_state: raw
created: 2026-11-02
updated: 2026-11-02
turn_count: 4
tools_used:
  PowerShell: 5
tokens:
  input: 16
  output: 1706
  cache_creation: 23196
  cache_read: 347058
  total: 371976
cost_usd: 0.144582
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# OnVUE secure browser test

## You



<pasted_content id="a81f">
If you are unable to pass the secure browser test, complete the following steps and try again:
Make sure you are connected to a home network. Corporate networks and mobile hotspots are a common source of issues.
Unplug all but one display to test on. Close the lid if you are using a laptop with an external display.
Disconnect and/or remove all other electronics that will not be used for testing. You need only a computer with a suitable display, microphone, speaker, and webcam.
If you are connected to a VPN (virtual private network) or proxy gateway, disconnect from that service.
In the OnVUE system test, select Test to check which applications must be closed and then close them by completing these steps on your computer:
Select Ctrl + Shift + Esc on your keyboard.
Select Details, then select an app that OnVUE indicated should be closed and choose End task.
Repeat the previous step until all indicated processes have been closed.
Please close the following applications and then select the Retest button.
claude (cowork-svc)
tailscale (tailscaled)
</pasted_content id="a81f">


Shut down these services for the exam. I am not able to test it

## Claude

Cowork stopped. Tailscale needs admin rights, so I'll request elevation (a UAC prompt will appear, please accept it).

Both are stopped, and no `cowork-svc` or `tailscaled` processes are left running.

- **Cowork:** I stopped the `CoworkVMService` service.
- **Tailscale:** I stopped the `Tailscale` service. This needed admin rights, so you had to accept a UAC prompt.

You may still see Tailscale's tray icon or the Claude desktop app. The processes OnVUE listed are gone, so click Retest now.

Both services are set to start automatically, so they'll come back after a reboot. To bring them back after the exam, run this in an admin PowerShell:

```
Start-Service Tailscale, CoworkVMService
```

Cowork features in Claude won't work until then. This CLI session should keep working. Good luck on the exam.

### Tool Calls

- `PowerShell`
```powershell
Get-Process | Where-Object { $_.Name -match 'cowork|tailscale' } | Select-Object Id,Name,Path; Get-Service | Where-Object { $_.Name -match 'cowork|tailscale' -or $_.DisplayName -match 'cowork|tailscale' } | Select-Object Name,Status,StartType
```
```
   Id Name            Path
   -- ----            ----
 8116 cowork-svc      
26764 tailscaled      
31648 tailscaled      
      CoworkVMService 
      Tailscale
```
- `PowerShell`
```powershell
Get-Service CoworkVMService,Tailscale | Select-Object Name,Status,StartType; Stop-Service CoworkVMService -Force -ErrorAction Continue; Stop-Service Tailscale -Force -ErrorAction Continue; Start-Sleep 3; Get-Service CoworkVMService,Tailscale | Select-Object Name,Status; Get-Process | Where-Object { $_.Name -match 'cowork|tailscale' } | Select-Object Id,Name
```
```
Name             Status StartType
----             ------ ---------
CoworkVMService Running Automatic
Tailscale       Running Automatic
Stop-Service: Service 'Tailscale (Tailscale)' cannot be stopped due to the following error: Cannot open 'Tailscale' service on computer '.'.
CoworkVMService Stopped          
Tailscale       Running          
tailscaled                       
tailscaled
```
- `PowerShell`
```powershell
Start-Process powershell -Verb RunAs -Wait -ArgumentList '-NoProfile','-Command','Stop-Service Tailscale -Force; Get-Process tailscaled -ErrorAction SilentlyContinue | Stop-Process -Force'; Start-Sleep 2; Get-Service Tailscale | Select-Object Name,Status; Get-Process | Where-Object { $_.Name -match 'cowork|tailscale' } | Select-Object Id,Name
```
```
Name       Status
----       ------
Tailscale Stopped
```

## You

Please close the following applications and then select the Retest button.
vmwp

## Claude

`vmwp` isn't running now. It was most likely the Cowork virtual machine, and it exited when I stopped `CoworkVMService`. A check for `vmwp`, `vmmem`, `cowork` and `tailscale` processes found none.

If OnVUE still lists `vmwp`, it may have started again since I checked. Click Retest, and if it shows up again, tell me and I'll look again. I can't see it right now, so I haven't stopped anything else.

### Tool Calls

- `PowerShell`
```powershell
Get-Process vmwp -ErrorAction SilentlyContinue | Select-Object Id,Name,StartTime; Get-VM -ErrorAction SilentlyContinue | Select-Object Name,State; Get-Service vmcompute,vmms -ErrorAction SilentlyContinue | Select-Object Name,Status
```
```
Exit code 1
Get-VM: The term 'Get-VM' is not recognized as a name of a cmdlet, function, script file, or executable program.
Check the spelling of the name, or if a path was included, verify that the path is correct and try again.

Name       Status
----       ------
vmcompute Running
```
- `PowerShell`
```powershell
Get-Process | Where-Object { $_.Name -match 'vmwp|vmmem|cowork|tailscale' } | Select-Object Id,Name
```
```
(PowerShell completed with no output)
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

