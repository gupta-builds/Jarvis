---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "GitHub Education location verification"
started_at: 2026-11-03T18:57:29
ended_at: 2026-11-03T18:57:55
exported_at: 2026-11-03T18:57:56
duration_minutes: 0.4
project: The Plan
cwd: 'D:\_Anant\20_Progress\Documents\The Plan'
session_id: e749ec39-20e7-48e5-a53d-9ccc81fd3506
status: seed
review_state: raw
created: 2026-11-03
updated: 2026-11-03
turn_count: 3
tools_used:
  PowerShell: 2
tokens:
  input: 6
  output: 2720
  cache_creation: 29263
  cache_read: 144249
  total: 176238
cost_usd: 0.158689
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# GitHub Education location verification

## You

I am facing this issue while applying for the student benefits on github. Github is having problems verifying my location due to using vivaldi. So, i decided to switch to edge. But whenever i click get location for edge. The page just does not load further: `[Image #2] `. Here is the previous rejected application information: ```

<pasted_content id="6f16">
We were unfortunately not able to verify your academic status. Please address the following issues and apply again.

You must configure your browser and operating system to allow location access. You may not use a VPN. If you believe that our information about your school is incomplete or incorrect, then please select ‘My selected school has incorrect or incomplete information e.g. domains or campus location’ option when submitting a GitHub Education support ticket.
The school you selected does not appear to have a campus location in your country. Your school-provided academic affiliation document must indicate virtual learning if you are remote. If you believe that the school you have applied for has incorrect information that affects your current application e.g. incorrect email domain, please select ‘My selected school has incorrect or incomplete information e.g. domains or campus location’ option when submitting a GitHub Education support ticket.
Please use your device camera to submit academic affiliation documents.
You appear not to be near any campus location for the school you have selected. Your academic affiliation documentation must indicate virtual learning if you are remote. You must configure your browser and operating system to allow location access. You may not use a VPN. If you believe that our information about your school is incomplete or incorrect e.g. missing campus location(s), then please select ‘My selected school has incorrect or incomplete information e.g. domains or campus location’ option when submitting a GitHub Education support ticket.
You are unlikely to be verified until you have completed your GitHub user profile with your full name exactly as it appears in your academic affiliation document. Please do not use a variation of your name or a nickname. Once you have updated your profile information log out and log back into GitHub before re-applying.


Visit our EDU community for FAQs and tips.
</pasted_content id="6f16">

```.

Is there some sort of a location blocker that is there on this device right now blocking access to the accurate location? Vivaldi might have some browser protection but even edge does not get my ip address down correctly for some reason. What's going on over here? Look through some of these browser settings, device settingds to have a better understanding of why is this happening and how to resolve it so that i can apply for the github education.

[image attached]

## You

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\7776f00ad8139643\[REDACTED]\images\2.png]

## Claude

I'll check Windows location settings, the location service, VPN or proxy state, and Edge policies. These are read-only.

The machine-wide location consent is set to **Deny**. I'll confirm the service state and check whether Tailscale is routing your traffic.

I found the cause, and it's in Windows, not in Vivaldi or Edge. Two things are blocking location, and both are machine-level settings that every browser inherits.

**What's wrong**
1. **The Geolocation Service (`lfsvc`) is Disabled and Stopped.** This is the Windows service that gives browsers a location. Without it, the "Getting location..." button waits forever, which is what you saw in Edge.
2. **Location access is set to Deny for the whole device** (`HKLM ... ConsentStore\location = Deny`). Your per-user setting says Allow, but the machine-wide Deny overrides it. That's likely why Vivaldi also failed.

**What's not the problem**
- Your public IP resolves correctly to Minneapolis, MN. It isn't the cause.
- No VPN or proxy is active. Tailscale is running but has no exit node set, so it doesn't route your internet traffic. There are no Edge policies blocking location either.
- NordVPN is installed (an Acer component), but I saw no active connection. Make sure it's fully off anyway.

**How to fix it**
Open PowerShell **as Administrator** and run these, or I can walk you through the GUI:

```powershell
Set-Service lfsvc -StartupType Manual
Start-Service lfsvc
Set-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name Value -Value Allow
```

Or in Settings: **Privacy & security > Location**, then turn on **Location services**, **Let apps access your location**, and **Let desktop apps access your location**. The toggle may be greyed out while the service is disabled, so the commands are more reliable.

Then:
1. Fully close Edge and reopen it.
2. In Edge, go to **Settings > Cookies and site permissions > Location** and make sure it isn't set to blocked. Also check that `github.com` isn't in the Block list.
3. Reload the GitHub Education page and choose **Allow** when Edge asks for location.
4. Check the location is accurate at a site like `https://browserleaks.com/geo`. It should place you in Minneapolis.

Also, your rejection notice asks that you update your GitHub profile with your full name exactly as it appears on your academic document, and log out and back in before reapplying. Since you're likely at or near campus, a Wi-Fi-based location should place you within range of the University of Minnesota.

I haven't changed anything on your machine. Do you want me to run the fix commands? They need an elevated shell, so you'd have to run them yourself with `! ` or in an admin terminal.

### Tool Calls

- `PowerShell`
```powershell
"--- Location consent (machine / user) ---"
Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -ErrorAction SilentlyContinue | Select-Object Value
Get-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -ErrorAction SilentlyContinue | Select-Object Value
"--- Location policies ---"
Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors' -ErrorAction SilentlyContinue
"--- Location service (lfsvc) ---"
Get-Service lfsvc | Select-Object Name,Status,StartType
"--- Per-app desktop consent (edge/vivaldi) ---"
Get-ChildItem 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\NonPackaged' -ErrorAction SilentlyContinue | ForEach-Object { $v=(Get-ItemProperty $_.PSPath).Value; "$($_.PSChildName) => $v" }
"--- Edge policies ---"
Get-ItemProperty 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -ErrorAction SilentlyContinue | Format-List DefaultGeolocationSetting,GeolocationBlockedForUrls
Get-ItemProperty 'HKCU:\SOFTWARE\Policies\Microsoft\Edge' -ErrorAction SilentlyContinue | Format-List DefaultGeolocationSetting,GeolocationBlockedForUrls
"--- Proxy ---"
Get-ItemProperty 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings' | Select-Object ProxyEnable,ProxyServer,AutoConfigURL
netsh winhttp show proxy
"--- VPN-like adapters ---"
Get-NetAdapter | Select-Object Name,InterfaceDescription,Status | Format-Table -AutoSize
Get-VpnConnection -ErrorAction SilentlyContinue | Select-Object Name,ServerAddress,ConnectionStatus
"--- Public IP geo ---"
try { Invoke-RestMethod 'https://ipinfo.io/json' -TimeoutSec 10 | Select-Object city,region,country,org } catch { "ip lookup failed: $_" }
```
```
--- Location consent (machine / user) ---


Current WinHTTP proxy settings:

    Direct access (no proxy server).

Value
-----
Deny
Allow
--- Location policies ---
--- Location service (lfsvc) ---

--- Per-app desktop consent (edge/vivaldi) ---
C:#Program Files (x86)#Acer#NordVPN#wlanBroker.exe => 
C:#Program Files (x86)#Microsoft#Edge#Application#msedge.exe => 
C:#Program Files#NVIDIA Corporation#NVIDIA App#CEF#NVIDIA App.exe => 
C:#Program Files#NVIDIA Corporation#NVIDIA App#CEF#NVIDIA Overlay.exe => 
C:#Riot Games#Riot Client#RiotClientElectron#Riot Client.exe => 
C:#Windows#System32#dllhost.exe => 
D:#Games#Riot Games#Riot Client#RiotClientElectron#Riot Client.exe => 
D:#Games#Riot Games#VALORANT#live#Engine#Binaries#Win64#EpicWebHelper.exe => 
Executables => 
--- Edge policies ---
--- Proxy ---

--- VPN-like adapters ---


Name                     InterfaceDescription                                                Status
----                     --------------------                                                ------
vEthernet (FSE HostVnic) Hyper-V Virtual Ethernet Container Adapter                          Up
Ethernet                 Killer E3100G 2.5 Gigabit Ethernet Controller                       Disconnected
Wi-Fi                    Killer(R) Wi-Fi 6E AX1675i 160MHz Wireless Network Adapter (211NGW) Up
Tailscale                Tailscale Tunnel                                                    Up

--- Public IP geo ---

city        region    country org
----        ------    ------- ---
Minneapolis Minnesota US      AS3356 Level 3 Parent, LLC
```
- `PowerShell`
```powershell
"lfsvc:"; (Get-Service -Name lfsvc -ErrorAction SilentlyContinue | Format-List Name,Status,StartType | Out-String)
sc.exe query lfsvc
"HKLM consent:"; (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location').Value
"HKCU consent:"; (Get-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location').Value
"Edge per-app:"; (Get-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\NonPackaged\C:#Program Files (x86)#Microsoft#Edge#Application#msedge.exe' -ErrorAction SilentlyContinue).Value
"Tailscale status:"; & tailscale status 2>&1 | Select-Object -First 8
tailscale debug prefs 2>&1 | Select-String 'ExitNode'
```
```
lfsvc:

Name      : lfsvc
Status    : Stopped
StartType : Disabled



SERVICE_NAME: lfsvc 
        TYPE               : 20  WIN32_SHARE_PROCESS  
        STATE              : 1  STOPPED 
        WIN32_EXIT_CODE    : 1077  (0x435)
        SERVICE_EXIT_CODE  : 0  (0x0)
        CHECKPOINT         : 0x0
        WAIT_HINT          : 0x0
HKLM consent:
Deny
HKCU consent:
Allow
Edge per-app:
Tailscale status:
100.84.91.11    gupta-builds  anantmahi721@  windows  -  
100.94.129.113  dell-wsl      anantmahi721@  linux    -  

	"ExitNodeID": "",
	"ExitNodeIP": "",
	"InternalExitNodePrior": "",
	"ExitNodeAllowLANAccess": false,
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

