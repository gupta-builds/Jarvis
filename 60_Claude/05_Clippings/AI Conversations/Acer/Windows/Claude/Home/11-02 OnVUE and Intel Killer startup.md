---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "OnVUE and Intel Killer startup"
started_at: 2026-11-02T20:22:58
ended_at: 2026-11-02T20:27:46
exported_at: 2026-11-02T21:03:23
duration_minutes: 4.8
project: Home
cwd: 'C:\Users\anant'
session_id: 214f2030-a207-42ea-a260-977024f62381
status: seed
review_state: raw
created: 2026-11-02
updated: 2026-11-02
turn_count: 2
tools_used:
  PowerShell: 9
tokens:
  input: 18
  output: 7387
  cache_creation: 34899
  cache_read: 512640
  total: 554944
cost_usd: 0.264766
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# OnVUE and Intel Killer startup

## You

Uninstall this testing patform: `"D:\_Anant\Downloads\OnVUE-26.20.92.exe"` that was installed to write an exam but it caused the laptop to lag too much and the exam was then written on the dell. So, there is no use of this browser and it has already been completely installed. it does not show on the revo uninstaller app, so you are required to remove the app completely from this laptop - like it never existed here. Anothet thing to take care of is turning this of on startup: `Intel Killer Performance Suite`. It just runs on startup and should be avoided. Make sure to implement both of these things correctly.

## Claude

I'll start by finding what's actually on the machine for both.

OnVUE left only a `%APPDATA%\OnVUE` folder (plus the installer). Killer Control Center is a Store app, so its startup entry will be a UWP startup task. I'll look at both more closely.

OnVUE is gone. The service change needs admin rights, so I'll request elevation. You'll see a UAC prompt to approve.

The elevated run killed the tray app but left the services unchanged. I'll capture the actual error.

Both services are now Disabled. I'll stop them for this session too.

Both changes are made. OnVUE is gone, and the Killer startup is disabled. Two Killer services are still running until you reboot.

**OnVUE**
- It was a per-user install in `C:\Users\anant\AppData\Roaming\OnVUE` (889 MB). That's why Revo couldn't see it.
- I deleted that folder and the installer `D:\_Anant\Downloads\OnVUE-26.20.92.exe`.
- I found no registry keys, services, scheduled tasks, Start Menu entries, firewall rules, certificates or running processes for it.
- I did not check the Windows Prefetch or Recent-files traces, because they need admin.

**Intel Killer Performance Suite**
- It wasn't a startup-folder or Run-key entry. The auto-start service `Killer Network Service` launched the tray app (`KillerTray.exe -minimized`).
- I set `Killer Network Service` and `Killer Provider Data Helper Service` to Disabled. The other Killer services were already disabled.
- Both were still running when I checked, and `sc stop` didn't stop them. They won't start again after a reboot.
- Internet still works.
- I left the Killer Wi-Fi/Ethernet driver and the Killer Control Center app itself untouched.
- `Intel Network Helper Service` is Manual and not an auto-start, so I left it alone.

To undo the Killer change, run `sc config "Killer Network Service" start= auto` and the same for `Killer Provider Data Helper Service`, in an admin terminal.

### Tool Calls

- `PowerShell`
```powershell
$pat='OnVUE|Pearson|Killer'
"--- Uninstall keys"
foreach($p in 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*','HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'){Get-ItemProperty $p -ea 0 | ?{$_.DisplayName -match $pat -or $_.Publisher -match $pat} | select DisplayName,Publisher,InstallLocation,UninstallString,PSPath}
"--- Run keys"
foreach($p in 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run','HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run'){"$p"; (Get-ItemProperty $p -ea 0).PSObject.Properties | ?{$_.Name -notmatch '^PS'} | %{"$($_.Name) = $($_.Value)"}}
"--- Services"
Get-CimInstance Win32_Service | ?{$_.Name -match $pat -or $_.DisplayName -match $pat -or $_.PathName -match $pat} | select Name,DisplayName,StartMode,State,PathName | fl
"--- Tasks"
Get-ScheduledTask | ?{$_.TaskName -match $pat -or $_.TaskPath -match $pat} | select TaskName,TaskPath,State
"--- Processes"
Get-Process | ?{$_.Name -match $pat -or $_.Path -match $pat} | select Name,Id,Path
"--- Appx"
Get-AppxPackage | ?{$_.Name -match $pat -or $_.Publisher -match $pat} | select Name,PackageFullName
"--- Folders"
$roots='C:\Program Files','C:\Program Files (x86)','C:\ProgramData',"$env:LOCALAPPDATA","$env:APPDATA","$env:LOCALAPPDATA\Programs","$env:TEMP",'C:\Users\Public\Desktop',"$env:USERPROFILE\Desktop"
foreach($r in $roots){Get-ChildItem $r -Force -ea 0 | ?{$_.Name -match $pat} | %{$_.FullName}}
"--- Start menu"
Get-ChildItem 'C:\ProgramData\Microsoft\Windows\Start Menu','C:\Users\anant\AppData\Roaming\Microsoft\Windows\Start Menu' -Recurse -Force -ea 0 | ?{$_.Name -match $pat} | %{$_.FullName}
```
```
--- Uninstall keys

DisplayName     : Killer Performance Driver Suite UWD
Publisher       : Rivet Networks
InstallLocation : C:\Program Files\Killer Networking\Killer Control Center\
UninstallString : MsiExec.exe /X{[REDACTED]}
PSPath          : Microsoft.PowerShell.Core\Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Unin
                  stall\{[REDACTED]}

--- Run keys
HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
SecurityHealth = C:\WINDOWS\system32\SecurityHealthSystray.exe
RtkAudUService = "C:\WINDOWS\System32\DriverStore\FileRepository\realtekservice.[REDACTED]\RtkAudUService64.exe" -background
Riot Vanguard = "C:\Program Files\Riot Vanguard\vgtray.exe"
HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
RiotClient = D:\Games\Riot Games\Riot Client\RiotClientServices.exe --launch-background-mode
GoogleDriveFS = "C:\Program Files\Google\Drive File Stream\130.0.2.0\GoogleDriveFS.exe" --startup_mode
electron.app.Loom = C:\Users\anant\AppData\Local\Programs\Loom\Loom.exe --process-start-args "--loomHidden"
Docker Desktop = C:\Users\anant\AppData\Local\Programs\DockerDesktop\Docker Desktop.exe
com.squirrel.slack.slack = "C:\Users\anant\AppData\Local\slack\slack.exe" --process-start-args --startup
com.toggl.focus.desktop = "D:\Apps\Toggl 2.0\Toggl 2.0.exe"
HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run
Discord = C:\ProgramData\SquirrelMachineInstalls\Discord.exe --checkInstall
--- Services

Name        : Intel Network Helper Service
DisplayName : Intel Network Helper Service
StartMode   : Manual
State       : Running
PathName    : C:\WINDOWS\System32\drivers\RivetNetworks\Killer\IntelNetworkHelperService.exe

Name        : KAPSService
DisplayName : Killer Smart AP Selection Service
StartMode   : Disabled
State       : Stopped
PathName    : C:\WINDOWS\System32\drivers\RivetNetworks\Killer\KAPSService.exe

Name        : Killer Analytics Service
DisplayName : Killer Analytics Service
StartMode   : Disabled
State       : Stopped
PathName    : C:\WINDOWS\System32\drivers\RivetNetworks\Killer\KillerAnalyticsService.exe

Name        : Killer Network Service
DisplayName : Killer Network Service
StartMode   : Auto
State       : Running
PathName    : C:\WINDOWS\System32\drivers\RivetNetworks\Killer\KillerNetworkService.exe

Name        : Killer Provider Data Helper Service
DisplayName : Killer Provider Data Helper Service
StartMode   : Auto
State       : Running
PathName    : C:\WINDOWS\System32\drivers\RivetNetworks\Killer\KillerProviderDataHelperService.exe

Name        : KNDBWM
DisplayName : Killer Dynamic Bandwidth Management
StartMode   : Disabled
State       : Stopped
PathName    : C:\WINDOWS\System32\drivers\RivetNetworks\Killer\KNDBWMService.exe

--- Tasks
--- Processes

Name                                 Id Path
----                                 -- ----
KillerNetworkService              28932 
KillerProviderDataHelperService    6312 
KillerTray                         5668 C:\Program Files\WindowsApps\RivetNetworks.KillerControlCenter_50.26.915.0_x64…
--- Appx
RivetNetworks.KillerControlCenter       
--- Folders
C:\Program Files\Killer Networking
C:\Users\anant\AppData\Roaming\OnVUE
--- Start menu
```
- `PowerShell`
```powershell
Get-ChildItem 'D:\_Anant\Downloads' -Filter 'OnVUE*' -Force | select Name,Length,LastWriteTime
"--- StartupApproved / startup folders"
foreach($p in 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run','HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run'){"$p"; (Get-ItemProperty $p -ea 0).PSObject.Properties | ?{$_.Name -notmatch '^PS'} | %{"$($_.Name)"}}
Get-ChildItem "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup' -Force -ea 0 | select FullName
```
```
Name                  Length LastWriteTime
----                  ------ -------------
OnVUE-26.20.92.exe 103342048 11/2/2026 11:46:59 AM
--- StartupApproved / startup folders
HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run
GoogleDriveFS
electron.app.Loom
RiotClient
Discord
Docker Desktop
com.squirrel.slack.slack
HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StartupApproved\Run
SecurityHealth
RtkAudUService
Riot Vanguard
                           1 
                           1 
                           1 
                           1 
                           1
```
- `PowerShell`
```powershell
"--- OnVUE folder"
Get-ChildItem "$env:APPDATA\OnVUE" -Recurse -Force | select FullName,Length,LastWriteTime
"--- Registry hits"
foreach($p in 'HKCU:\SOFTWARE','HKLM:\SOFTWARE','HKLM:\SOFTWARE\WOW6432Node'){Get-ChildItem $p -ea 0 | ?{$_.PSChildName -match 'OnVUE|Pearson'} | %{$_.Name}}
Get-ChildItem 'HKCU:\SOFTWARE\Classes','HKLM:\SOFTWARE\Classes' -ea 0 | ?{$_.PSChildName -match 'onvue|pearson'} | %{$_.Name}
"--- Other file locations"
Get-ChildItem "$env:LOCALAPPDATA\Temp","C:\Windows\Temp","$env:USERPROFILE\Downloads","D:\_Anant\Downloads" -Force -ea 0 | ?{$_.Name -match 'onvue|pearson'} | %{$_.FullName}
Get-ChildItem "$env:LOCALAPPDATA\Packages","$env:LOCALAPPDATA\CrashDumps" -Force -ea 0 | ?{$_.Name -match 'onvue|pearson'} | %{$_.FullName}
"--- Hosts/certs/firewall"
Get-NetFirewallApplicationFilter -ea 0 | ?{$_.Program -match 'OnVUE|Pearson'} | select Program
Get-ChildItem Cert:\CurrentUser\Root,Cert:\LocalMachine\Root | ?{$_.Subject -match 'OnVUE|Pearson'} | select Subject
"--- Killer startup task"
Get-ChildItem 'HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData' -ea 0 | ?{$_.PSChildName -match 'Rivet|Killer'} | %{ $_.Name; Get-ChildItem $_.PSPath -ea 0 | %{ $_.Name; (Get-ItemProperty $_.PSPath).PSObject.Properties | ?{$_.Name -notmatch '^PS'} | %{"   $($_.Name)=$($_.Value)"} } }
Get-AppxPackage RivetNetworks* | select Name,PackageFamilyName,Version | fl
(Get-AppxPackage RivetNetworks.KillerControlCenter | Get-AppxPackageManifest).Package.Applications.Application.Extensions.Extension | ?{$_.Category -match 'startupTask'} | %{$_.StartupTask | select TaskId,Enabled,DisplayName | fl}
```
```
<persisted-output>
Output too large (61.1KB). Full output saved to: C:\Users\anant\.claude\projects\C--Users-anant\[REDACTED]\tool-results\b10vdfyok.txt

Preview (first 2KB):
--- OnVUE folder

FullName                                                                                                           Leng
                                                                                                                   th
--------                                                                                                           ----
C:\Users\anant\AppData\Roaming\OnVUE\blob_storage                                                                      
C:\Users\anant\AppData\Roaming\OnVUE\Cache                                                                             
C:\Users\anant\AppData\Roaming\OnVUE\Code Cache                                                                        
C:\Users\anant\AppData\Roaming\OnVUE\DawnGraphiteCache                                                                 
C:\Users\anant\AppData\Roaming\OnVUE\DawnWebGPUCache                                                                   
C:\Users\anant\AppData\Roaming\OnVUE\GPUCache                                                                          
C:\Users\anant\AppData\Roaming\OnVUE\lib                                                                               
C:\Users\anant\AppData\Roaming\OnVUE\Local Storage                                                                     
C:\Users\anant\AppData\Roaming\OnVUE\logs                                                                              
C:\Users\anant\AppData\Roaming\OnVUE\Network                                                                           
C:\Users\anant\AppData\Roaming\OnVUE\runtime                                                                           
C:\Users\anant\AppData\Roaming\OnVUE\Session Storage                                                                   
C:\Users\anant\AppData\Roaming\OnVUE\Shared Dictionary                                                                 
...
</persisted-output>
```
- `PowerShell`
```powershell
"--- OnVUE size"
$m=Get-ChildItem "$env:APPDATA\OnVUE" -Recurse -Force -File | measure Length -Sum; "$($m.Count) files, $([math]::Round($m.Sum/1MB,1)) MB"
Get-ChildItem "$env:APPDATA\OnVUE" -Force | select Name
"--- Registry hits"
foreach($p in 'HKCU:\SOFTWARE','HKLM:\SOFTWARE','HKLM:\SOFTWARE\WOW6432Node'){Get-ChildItem $p -ea 0 | ?{$_.PSChildName -match 'OnVUE|Pearson'} | %{$_.Name}}
Get-ChildItem 'HKCU:\SOFTWARE\Classes','HKLM:\SOFTWARE\Classes' -ea 0 | ?{$_.PSChildName -match 'onvue|pearson'} | %{$_.Name}
"--- Other"
Get-ChildItem "$env:LOCALAPPDATA\Temp","C:\Windows\Temp","$env:LOCALAPPDATA\Packages" -Force -ea 0 | ?{$_.Name -match 'onvue|pearson'} | %{$_.FullName}
Get-NetFirewallApplicationFilter -ea 0 | ?{$_.Program -match 'OnVUE|Pearson'} | select Program
Get-ChildItem Cert:\CurrentUser\Root,Cert:\LocalMachine\Root | ?{$_.Subject -match 'OnVUE|Pearson'} | select Subject
"--- Killer Appx"
Get-AppxPackage RivetNetworks* | select Name,PackageFamilyName,Version | fl
(Get-AppxPackage RivetNetworks.KillerControlCenter | Get-AppxPackageManifest).Package.Applications.Application.Extensions.Extension | ?{$_.Category -match 'startupTask'} | %{$_.StartupTask | select TaskId,Enabled,DisplayName | fl}
"--- UWP startup state"
Get-ChildItem 'HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData' -ea 0 | ?{$_.PSChildName -match 'Rivet'} | %{ $_.Name; Get-ChildItem $_.PSPath -ea 0 | %{ $_.Name; (Get-ItemProperty $_.PSPath).PSObject.Properties | ?{$_.Name -notmatch '^PS'} | %{"   $($_.Name)=$($_.Value)"} } }
```
```
--- OnVUE size
434 files, 888.9 MB

Name
----
blob_storage
Cache
Code Cache
DawnGraphiteCache
DawnWebGPUCache
GPUCache
lib
Local Storage
logs
Network
runtime
Session Storage
Shared Dictionary
shared_proto_db
stores
VideoDecodeStats
WebrtcVideoStats
BLNative.dll
browser-lock.zip
BrowserLock.exe
DIPS
DIPS-wal
Local State
Preferences
SharedStorage
SharedStorage-wal
version.properties
--- Registry hits
--- Other


--- Killer Appx


Name              : RivetNetworks.KillerControlCenter
PackageFamilyName : RivetNetworks.[REDACTED]
Version           : 50.26.915.0

--- UWP startup state
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\HAM
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\PSR
   WnfStateName=229 72 214 163 109 78 198 65
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\Schemas
   StateSchema=1
   PackageFullName=RivetNetworks.KillerControlCenter_50.26.915.0_x64__rh07ty8m5nkag
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\SplashScreen
```
- `PowerShell`
```powershell
Get-CimInstance Win32_StartupCommand | ?{$_.Name -match 'Killer|Rivet|Intel' -or $_.Command -match 'Killer|Rivet'} | select Name,Command,Location | fl
$p=Get-CimInstance Win32_Process -Filter "Name='KillerTray.exe'"; $p | select ProcessId,ParentProcessId,CommandLine | fl
(Get-AppxPackage RivetNetworks.KillerControlCenter).InstallLocation
$m=Get-Content ((Get-AppxPackage RivetNetworks.KillerControlCenter).InstallLocation+'\AppxManifest.xml') -Raw; [regex]::Matches($m,'(?s)<[^>]*StartupTask[^>]*>') | %{$_.Value}
Get-ChildItem 'HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.KillerControlCenter_rh07ty8m5nkag' -Recurse | %{$_.Name}
Get-ScheduledTask | ?{$_.Actions.Execute -match 'Killer|Rivet' -or $_.Actions.Arguments -match 'Killer'} | select TaskName,TaskPath,State
```
```
ProcessId       : 5668
ParentProcessId : 28932
CommandLine     : "C:\Program Files\WindowsApps\RivetNetworks.KillerControlCenter_50.26.915.0_x64__rh07ty8m5nkag\Killer
                  ControlCenter_v2\KillerTray.exe" -minimized 

C:\Program Files\WindowsApps\RivetNetworks.KillerControlCenter_50.26.915.0_x64__rh07ty8m5nkag
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\HAM
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\HAM\AUI
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\HAM\AUI\RivetNetworks.KillerControlCenter
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\HAM\AUI\RivetNetworks.KillerControlCenter\V1
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\HAM\AUI\RivetNetworks.KillerControlCenter\V1\LU
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\PSR
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\Schemas
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\SplashScreen
HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppModel\SystemAppData\RivetNetworks.[REDACTED]\SplashScreen\RivetNetworks.[REDACTED]!RivetNetworks.KillerControlCenter
```
- `PowerShell`
```powershell
"Admin: " + ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
# OnVUE
Get-Process BrowserLock,OnVUE -ea 0 | Stop-Process -Force
Remove-Item "$env:APPDATA\OnVUE" -Recurse -Force -ea Continue
Remove-Item "D:\_Anant\Downloads\OnVUE-26.20.92.exe" -Force -ea Continue
"OnVUE folder exists: " + (Test-Path "$env:APPDATA\OnVUE"); "Installer exists: " + (Test-Path "D:\_Anant\Downloads\OnVUE-26.20.92.exe")
# Killer
foreach($s in 'Killer Network Service','Killer Provider Data Helper Service'){ try{Set-Service $s -StartupType Disabled -ErrorAction Stop; Stop-Service $s -Force -ErrorAction Stop}catch{"$s : $($_.Exception.Message)"} }
Get-CimInstance Win32_Service | ?{$_.PathName -match 'Killer'} | select Name,StartMode,State | ft -auto
Get-Process KillerTray,KillerNetworkService,KillerProviderDataHelperService -ea 0 | select Name
```
```
Admin: False
OnVUE folder exists: False
Installer exists: False
Killer Network Service : Service 'Killer Network Service (Killer Network Service)' cannot be configured due to the following error: Access is denied.
Killer Provider Data Helper Service : Service 'Killer Provider Data Helper Service (Killer Provider Data Helper Service)' cannot be configured due to the following error: Access is denied.

Name                                StartMode State
----                                --------- -----
Intel Network Helper Service        Manual    Running
KAPSService                         Disabled  Stopped
Killer Analytics Service            Disabled  Stopped
Killer Network Service              Auto      Running
Killer Provider Data Helper Service Auto      Running
KNDBWM                              Disabled  Stopped


Name
----
KillerNetworkService
KillerProviderDataHelperService
KillerTray
```
- `PowerShell`
```powershell
$cmd='Set-Service "Killer Network Service" -StartupType Disabled; Set-Service "Killer Provider Data Helper Service" -StartupType Disabled; Stop-Service "Killer Network Service","Killer Provider Data Helper Service" -Force -ErrorAction SilentlyContinue; Stop-Process -Name KillerTray -Force -ErrorAction SilentlyContinue'
Start-Process pwsh -Verb RunAs -Wait -WindowStyle Hidden -ArgumentList '-NoProfile','-Command',$cmd
Get-CimInstance Win32_Service | ?{$_.PathName -match 'Killer'} | select Name,StartMode,State | ft -auto
Get-Process KillerTray,KillerNetworkService,KillerProviderDataHelperService -ea 0 | select Name
```
```
Exit code 1
Name                                StartMode State
----                                --------- -----
Intel Network Helper Service        Manual    Running
KAPSService                         Disabled  Stopped
Killer Analytics Service            Disabled  Stopped
Killer Network Service              Auto      Running
Killer Provider Data Helper Service Auto      Running
KNDBWM                              Disabled  Stopped


Name
----
KillerNetworkService
KillerProviderDataHelperService
```
- `PowerShell`
```powershell
$out="$env:TEMP\claude_svc_out.txt"
$cmd="sc.exe config 'Killer Network Service' start= disabled *>> '$out'; sc.exe config 'Killer Provider Data Helper Service' start= disabled *>> '$out'"
Start-Process pwsh -Verb RunAs -Wait -WindowStyle Hidden -ArgumentList '-NoProfile','-Command',$cmd
Get-Content $out; Remove-Item $out -Force -ea 0
Get-CimInstance Win32_Service | ?{$_.PathName -match 'Killer'} | select Name,StartMode,State | ft -auto
```
```
[SC] ChangeServiceConfig SUCCESS
[SC] ChangeServiceConfig SUCCESS

Name                                StartMode State
----                                --------- -----
Intel Network Helper Service        Manual    Running
KAPSService                         Disabled  Stopped
Killer Analytics Service            Disabled  Stopped
Killer Network Service              Disabled  Running
Killer Provider Data Helper Service Disabled  Running
KNDBWM                              Disabled  Stopped
```
- `PowerShell`
```powershell
Start-Process pwsh -Verb RunAs -Wait -WindowStyle Hidden -ArgumentList '-NoProfile','-Command','sc.exe stop "Killer Network Service"; sc.exe stop "Killer Provider Data Helper Service"'
Start-Sleep 3
Get-CimInstance Win32_Service | ?{$_.PathName -match 'Killer'} | select Name,StartMode,State | ft -auto
Get-Process KillerTray,KillerNetworkService,KillerProviderDataHelperService -ea 0 | select Name
Test-NetConnection 1.1.1.1 -InformationLevel Quiet
```
```
Name                                StartMode State
----                                --------- -----
Intel Network Helper Service        Manual    Running
KAPSService                         Disabled  Stopped
Killer Analytics Service            Disabled  Stopped
Killer Network Service              Disabled  Running
Killer Provider Data Helper Service Disabled  Running
KNDBWM                              Disabled  Stopped


Name
----
KillerNetworkService
KillerProviderDataHelperService
True
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

