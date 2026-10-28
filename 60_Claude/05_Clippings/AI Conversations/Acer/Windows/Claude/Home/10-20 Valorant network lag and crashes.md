---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Valorant network lag and crashes"
started_at: 2026-10-20T22:02:36
ended_at: 2026-10-27T22:57:26
exported_at: 2026-10-28T16:15:10
duration_minutes: 10134.8
project: Home
cwd: 'C:\Users\anant'
session_id: a89d5721-ad89-4818-92ab-7e5878fb7e94
status: seed
review_state: raw
created: 2026-10-20
updated: 2026-10-28
turn_count: 2
tools_used:
  Grep: 2
  PowerShell: 9
tokens:
  input: 14
  output: 6386
  cache_creation: 40108
  cache_read: 388882
  total: 435390
cost_usd: 0.263208
model:
  - "claude-sonnet-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Valorant network lag and crashes

## You

I am running valorant right now and there are too many network issues and crashes taking palce for some reason. The screen gets stuck and freezes till some few seconds pass. Fix this issue by looking into it, tell me how you fixed it.

## Claude

I'll start with read-only diagnostics: network adapter, latency and packet loss, Vanguard status, and recent crash events.

The gateway ping already shows spikes up to 152 ms with 0% loss, which points at Wi-Fi jitter. I'll check signal and band, Wi-Fi power saving, the Killer software, and Tailscale.

Latency is mostly fine (average 7 ms, 0% loss), with occasional Wi-Fi spikes. Now I'll check the Valorant log for the actual network and crash cause.

Those warnings are normal Unreal noise. I'll search for actual connection-quality signals.

I couldn't change the adapter settings because this session isn't running as administrator. I did stop the `PowerToys.Peek.UI` process.

## What I found
- **Wi-Fi is the main suspect.** Pings to your router spike to 60–150 ms even though loss is 0%, and the game's own server heartbeats were healthy (about 100 ms, all responses 200). That pattern means the spikes come from the wireless link, not Riot's servers or your ISP.
- **The connection itself looks fine.** You're on 5 GHz at 80% signal with no adapter errors, and DNS is Cloudflare.
- **Not the cause:** Vanguard (`vgc` and `vgk` are running) and the Killer services (all disabled). I found no Valorant crash dumps, GPU driver resets or game-side network errors. The `PowerToys.Peek.UI` process was only a CPU drain, not the freeze.
- **A game that's already under load makes it worse.** Valorant uses about 3 GB and CPU sits around 60%, so any Wi-Fi hiccup shows up as a freeze.

## What I changed
- Stopped `PowerToys.Peek.UI`, which was burning CPU while idle. PowerToys will relaunch it if you use Peek.

## What you need to do (needs admin)
Open an **admin** PowerShell (right-click Start, then Terminal (Admin)) and run:
```powershell
Set-NetAdapterAdvancedProperty -Name Wi-Fi -DisplayName 'Packet Coalescing' -DisplayValue 'Disabled'
Set-NetAdapterAdvancedProperty -Name Wi-Fi -DisplayName 'MIMO Power Save Mode' -DisplayValue 'No SMPS'
Restart-NetAdapter -Name Wi-Fi
```
Or tell me to retry from an elevated session. To undo, set them back to `Enabled` and `Auto SMPS`.

## Other things worth trying
- **Plug in Ethernet.** The laptop has an Ethernet port, and it's the most reliable fix for Wi-Fi jitter in a competitive game.
- **Check the router.** BSSID `5c:83:6c:a7:ab:d1` on channel 149 may be shared with neighbors. Try a different 5 GHz channel in the router settings.
- **Close PredatorSense.** It runs five processes and a few have been on since the morning. Quit it while gaming.
- **Tailscale is not the cause.** I checked whether it was routing game traffic and it isn't.

I haven't tested after these changes. If freezes continue after the admin step, tell me whether they hit at round start, mid-fight or at random. That narrows it to network, GPU or Vanguard.

### Tool Calls

- `PowerShell`
```powershell
Get-NetAdapter | Where-Object Status -eq 'Up' | Select Name,InterfaceDescription,LinkSpeed,MediaType | Format-Table -AutoSize | Out-String; Get-NetIPConfiguration | Select InterfaceAlias,@{n='GW';e={$_.IPv4DefaultGateway.NextHop}},@{n='DNS';e={$_.DNSServer.ServerAddresses -join ','}} | Format-Table | Out-String; powercfg /getactivescheme
```
```
Name      InterfaceDescription                                                LinkSpeed MediaType
----      --------------------                                                --------- ---------
Wi-Fi     Killer(R) Wi-Fi 6E AX1675i 160MHz Wireless Network Adapter (211NGW) 130 Mbps  Native 802.11
Tailscale Tailscale Tunnel                                                    100 Gbps  IP



InterfaceAlias GW       DNS
-------------- --       ---
Tailscale               fec0:0:0:ffff::1,fec0:0:0:ffff::2,fec0:0:0:ffff::3
Wi-Fi          10.5.8.1 1.1.1.1,1.0.0.1
Ethernet                40.30.1.56


Power Scheme GUID: [REDACTED]  (Ultimate Performance)
```
- `PowerShell`
```powershell
$gw=(Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Sort RouteMetric | Select -First 1).NextHop; "Gateway $gw"; ping -n 30 $gw | Select -Last 4; "--- 8.8.8.8"; ping -n 30 8.8.8.8 | Select -Last 4
```
```
Gateway 10.5.8.1
Ping statistics for 10.5.8.1:
    Packets: Sent = 30, Received = 30, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 1ms, Maximum = 152ms, Average = 9ms
--- 8.8.8.8
Ping statistics for 8.8.8.8:
    Packets: Sent = 30, Received = 29, Lost = 1 (3% loss),
Approximate round trip times in milli-seconds:
    Minimum = 11ms, Maximum = 156ms, Average = 25ms
```
- `PowerShell`
```powershell
Get-Service vgc,vgk -ErrorAction SilentlyContinue | Select Name,Status,StartType | Format-Table | Out-String; Get-WinEvent -FilterHashtable @{LogName='Application';Level=1,2;StartTime=(Get-Date).AddDays(-3)} -MaxEvents 25 -ErrorAction SilentlyContinue | Select TimeCreated,ProviderName,Id,@{n='Msg';e={$_.Message.Substring(0,[Math]::Min(140,$_.Message.Length))}} | Format-List | Out-String; Get-WinEvent -FilterHashtable @{LogName='System';Level=1,2;StartTime=(Get-Date).AddDays(-3)} -MaxEvents 25 -ErrorAction SilentlyContinue | Select TimeCreated,ProviderName,Id,@{n='Msg';e={$_.Message.Substring(0,[Math]::Min(140,$_.Message.Length))}} | Format-List | Out-String
```
```
Name  Status StartType
----  ------ ---------
vgc  Running    Manual
vgk  Running    System




TimeCreated  : 10/20/2026 4:00:31 PM
ProviderName : Microsoft-Windows-WindowsUpdateClient
Id           : 20
Msg          : Installation Failure: Windows failed to install the following update with error 0x80073D02: 9MV0B5HZVK9Z-Microsoft.GamingApp.

TimeCreated  : 10/20/2026 7:54:35 AM
ProviderName : Microsoft-Windows-DNS-Client
Id           : 1012
Msg          : There was an error while attempting to read the local hosts file.

TimeCreated  : 10/20/2026 7:53:57 AM
ProviderName : Service Control Manager
Id           : 7000
Msg          : The AICO2_svc service failed to start due to the following error: 
               The system cannot find the file specified.

TimeCreated  : 10/20/2026 7:53:28 AM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/20/2026 7:53:28 AM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/20/2026 7:53:28 AM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/19/2026 9:16:18 AM
ProviderName : Service Control Manager
Id           : 7000
Msg          : The AICO2_svc service failed to start due to the following error: 
               The system cannot find the file specified.

TimeCreated  : 10/19/2026 9:15:48 AM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/19/2026 9:15:48 AM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/19/2026 9:15:48 AM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/18/2026 1:12:52 PM
ProviderName : Microsoft-Windows-DNS-Client
Id           : 1012
Msg          : There was an error while attempting to read the local hosts file.

TimeCreated  : 10/18/2026 1:12:13 PM
ProviderName : Service Control Manager
Id           : 7000
Msg          : The AICO2_svc service failed to start due to the following error: 
               The system cannot find the file specified.

TimeCreated  : 10/18/2026 1:11:51 PM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/18/2026 1:11:51 PM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/18/2026 1:11:51 PM
ProviderName : Microsoft-Windows-BitLocker-Driver
Id           : 24641
Msg          : An unexpected error was encountered attempting to retrieve the BitLocker volume master key during restart.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:52 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.

TimeCreated  : 10/18/2026 1:58:51 AM
ProviderName : Microsoft-Windows-DistributedCOM
Id           : 10010
Msg          : The server {[REDACTED]} did not register with DCOM within the required timeout.
```
- `PowerShell`
```powershell
netsh wlan show interfaces | Select-String 'SSID|BSSID|Radio|Band|Channel|Signal|Receive rate|Transmit rate|State'; "--- power mgmt"; Get-NetAdapterPowerManagement -Name Wi-Fi | Format-List AllowComputerToTurnOffDevice,DeviceSleepOnDisconnect | Out-String; "--- advanced"; Get-NetAdapterAdvancedProperty -Name Wi-Fi | Select DisplayName,DisplayValue | Format-Table -AutoSize | Out-String
```
```
    State                  : connected
    SSID                   : The Standard
    AP BSSID               : 5c:83:6c:a7:ab:d1
    Band                   : 5 GHz
    Channel                : 149
    Radio type             : 802.11ax
    Receive rate (Mbps)    : 155
    Transmit rate (Mbps)   : 206
    Signal                 : 80% 
--- power mgmt
Get-NetAdapterPowerManagement: A device attached to the system is not functioning. 

--- advanced

DisplayName                 DisplayValue
-----------                 ------------
Sleep on WoWLAN Disconnect  Disabled
Packet Coalescing           Enabled
ARP offload for WoWLAN      Enabled
NS offload for WoWLAN       Enabled
GTK rekeying for WoWLAN     Enabled
Wake on Magic Packet        Enabled
Wake on Pattern Match       Enabled
Channel Width for 2.4GHz    Auto
Channel Width for 5GHz      Auto
Channel Width for 6GHz      Auto
Mixed Mode Protection       RTS/CTS Enabled
Fat Channel Intolerant      Disabled
Human Presence Detection    Auto
Transmit Power              5. Highest
802.11n/ac/ax Wireless Mode 4. 802.11ax
Ultra High Band (6GHz)      Enabled
MIMO Power Save Mode        Auto SMPS
Roaming Aggressiveness      1. Lowest
Preferred Band              5. Prefer 5GHz + 6GHz band
Throughput Booster          Disabled
U-APSD support              Disabled
802.11a/b/g Wireless Mode   6. Dual Band 802.11a/b/g
```
- `PowerShell`
```powershell
Get-Service | Where-Object { $_.DisplayName -match 'Killer|Intelligence|Tailscale|Rivet|Nahimic|Packet' -or $_.Name -match 'Killer|Tailscale|RivetNet' } | Select Name,DisplayName,Status,StartType | Format-Table -AutoSize | Out-String; tailscale status 2>&1 | Select -First 8; Get-NetTCPConnection -State Established | Group-Object OwningProcess | Sort Count -Descending | Select -First 6 | ForEach-Object { "{0} conns: {1}" -f $_.Count,(Get-Process -Id $_.Name -ErrorAction SilentlyContinue).ProcessName }; Get-Process | Sort CPU -Descending | Select -First 8 Name,CPU,@{n='MB';e={[int]($_.WS/1MB)}} | Format-Table | Out-String
```
```
Name                                DisplayName                          Status StartType
----                                -----------                          ------ ---------
KAPSService                         Killer Smart AP Selection Service   Stopped  Disabled
Killer Analytics Service            Killer Analytics Service            Stopped  Disabled
Killer Network Service              Killer Network Service              Stopped  Disabled
Killer Provider Data Helper Service Killer Provider Data Helper Service Stopped  Disabled
KNDBWM                              Killer Dynamic Bandwidth Management Stopped  Disabled
Tailscale                           Tailscale                           Running Automatic


100.84.91.11    gupta-builds  anantmahi721@  windows  -  
100.94.129.113  dell-wsl      anantmahi721@  linux    -  
30 conns: claude
9 conns: RiotClientServices
8 conns: vivaldi
7 conns: PredatorSense
7 conns: Obsidian
7 conns: VALORANT-Win64-Shipping

Name                         CPU   MB
----                         ---   --
VALORANT-Win64-Shipping 16654.86 2974
PowerToys.Peek.UI        8533.28  130
PredatorSense            4176.55  171
PredatorSense            2944.14  475
vivaldi                  1443.03  148
audiodg                  1240.23  212
ChatGPT                  1055.20   90
Obsidian                  558.20  734
```
- `PowerShell`
```powershell
Get-Process PowerToys.Peek.UI,PredatorSense | Select Id,Name,StartTime,@{n='Threads';e={$_.Threads.Count}} | Format-Table | Out-String; (Get-Counter '\Processor(_Total)\% Processor Time' -SampleInterval 1 -MaxSamples 5).CounterSamples.CookedValue -join ', '; Get-Process | Sort {$_.CPU} -Descending | Select -First 1 | Out-Null; $a=Get-Process PowerToys.Peek.UI -ErrorAction SilentlyContinue; if($a){$c1=$a.CPU; Start-Sleep 3; $c2=(Get-Process -Id $a.Id).CPU; "Peek CPU secs used in 3s: $($c2-$c1)"}
Get-WinEvent -FilterHashtable @{LogName='System';ProviderName='Display';StartTime=(Get-Date).AddDays(-7)} -MaxEvents 10 -ErrorAction SilentlyContinue | Select TimeCreated,Id,@{n='M';e={$_.Message.Substring(0,100)}} | Format-List | Out-String
Get-WinEvent -FilterHashtable @{LogName='Application';ProviderName='Application Error';StartTime=(Get-Date).AddDays(-7)} -MaxEvents 10 -ErrorAction SilentlyContinue | Select TimeCreated,@{n='M';e={($_.Message -split "`n")[0]}} | Format-List | Out-String
Get-ChildItem "$env:LOCALAPPDATA\VALORANT\Saved\Logs" -ErrorAction SilentlyContinue | Sort LastWriteTime -Descending | Select -First 4 Name,LastWriteTime,Length | Format-Table | Out-String
Get-CimInstance Win32_VideoController | Select Name,DriverVersion,DriverDate | Format-Table | Out-String
```
```
   Id Name              StartTime              Threads
   -- ----              ---------              -------
17392 PowerToys.Peek.UI 10/20/2026 7:54:13 AM       57
13624 PredatorSense     10/20/2026 7:54:20 AM       19
16260 PredatorSense     10/20/2026 7:54:20 AM       65
18380 PredatorSense     10/20/2026 7:54:19 AM       46
18508 PredatorSense     10/20/2026 7:54:21 AM       36
38236 PredatorSense     10/20/2026 10:01:26 PM      31


48.6068756106667, 62.168169850073, 64.309237428877, 60.0167443078615, 71.5864541873955
Peek CPU secs used in 3s: 1.203125

TimeCreated : 10/19/2026 10:36:59 AM
Id          : 4107
M           : 



TimeCreated : 10/17/2026 6:20:55 PM
M           : Faulting application name: wslsettings.exe, version: 3.0.3.0, time stamp: 0x6a5a0000

TimeCreated : 10/15/2026 5:34:20 PM
M           : Faulting application name: pnpm.exe, version: 0.0.0.0, time stamp: 0x6ac91ca1

TimeCreated : 10/15/2026 5:30:24 PM
M           : Faulting application name: pnpm.exe, version: 0.0.0.0, time stamp: 0x6ac91ca1

TimeCreated : 10/15/2026 5:30:06 PM
M           : Faulting application name: pnpm.exe, version: 0.0.0.0, time stamp: 0x6ac91ca1



Name                                       LastWriteTime          Length
----                                       -------------          ------
cef3.log                                   10/20/2026 9:44:02 PM   51563
ShooterGame.log                            10/20/2026 8:58:30 PM       0
cef3-backup-2026.10.20-23.54.05.log        10/20/2026 6:54:05 PM  332558
ShooterGame-backup-2026.10.20-23.54.05.log 10/20/2026 6:54:05 PM 7302913



Name                                  DriverVersion DriverDate
----                                  ------------- ----------
Intel(R) Graphics                     32.0.101.8132 9/18/2025 7:00:00 PM
NVIDIA GeForce RTX 5070 Ti Laptop GPU 32.0.16.1742  9/29/2026 7:00:00 PM
```
- `PowerShell`
```powershell
ping -n 100 -w 1000 10.5.8.1 | Select -Last 4; Get-DnsClientServerAddress -InterfaceAlias Tailscale,Wi-Fi | Select InterfaceAlias,AddressFamily,ServerAddresses | Format-Table | Out-String
```
```
Ping statistics for 10.5.8.1:
    Packets: Sent = 100, Received = 100, Lost = 0 (0% loss),
Approximate round trip times in milli-seconds:
    Minimum = 1ms, Maximum = 61ms, Average = 7ms

InterfaceAlias AddressFamily ServerAddresses
-------------- ------------- ---------------
Tailscale                  2 {}
Tailscale                 23 {fec0:0:0:ffff::1, fec0:0:0:ffff::2, fec0:0:0:ffff::3}
Wi-Fi                      2 {1.1.1.1, 1.0.0.1}
Wi-Fi                     23 {}
```
- `Grep` -- pattern `(?i)(packet loss|netspeed|hitch|timeout|disconnect|vanguard|fatal|crash|VAN-|ping.*high|TDR|device lost)` path `C:\Users\anant\AppData\Local\VALORANT\Saved\Logs\ShooterGame-backup-2026.10.20-23.54.05.log`
- `Grep` -- pattern `(?i)(Low Pro|Net.*(Loss|Lag)|Hitch|Network Instability|ConnectionLost|Connection timed|Heartbeat|Dropped|Fatal error|Ensure condition|DXGI|Lost Device|VideoMemory|OutOfMemory)` path `C:\Users\anant\AppData\Local\VALORANT\Saved\Logs\ShooterGame-backup-2026.10.20-23.54.05.log`
- `PowerShell`
```powershell
Get-NetAdapterStatistics -Name Wi-Fi | Select ReceivedDiscardedPackets,ReceivedPacketErrors,OutboundDiscardedPackets,OutboundPacketErrors | Format-List | Out-String; netsh interface tcp show global | Select-String 'Auto-Tuning|Receive-Side|Chimney|ECN|Timestamps'; Get-ChildItem 'C:\Users\anant\AppData\Local\CrashDumps' -ErrorAction SilentlyContinue | Sort LastWriteTime -Descending | Select -First 5 Name,LastWriteTime | Format-Table | Out-String; Get-ChildItem 'C:\Users\anant\AppData\Local\VALORANT\Saved\Crashes' -ErrorAction SilentlyContinue | Select -First 5 Name,LastWriteTime | Format-Table | Out-String
```
```
ReceivedDiscardedPackets : 0
ReceivedPacketErrors     : 0
OutboundDiscardedPackets : 0
OutboundPacketErrors     : 0



Receive-Side Scaling State          : enabled 
Receive Window Auto-Tuning Level    : normal 
ECN Capability                      : disabled 
RFC 1323 Timestamps                 : allowed
```
- `PowerShell`
```powershell
$admin=([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator); "Admin: $admin"
Stop-Process -Name PowerToys.Peek.UI -Force -ErrorAction SilentlyContinue; "Peek stopped"
try { Set-NetAdapterAdvancedProperty -Name Wi-Fi -DisplayName 'Packet Coalescing' -DisplayValue 'Disabled' -ErrorAction Stop; Set-NetAdapterAdvancedProperty -Name Wi-Fi -DisplayName 'MIMO Power Save Mode' -DisplayValue 'No SMPS' -ErrorAction Stop; "adapter tweaks applied" } catch { "FAILED: $($_.Exception.Message)" }
```
```
Admin: False
Peek stopped
FAILED: Access is denied.
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

