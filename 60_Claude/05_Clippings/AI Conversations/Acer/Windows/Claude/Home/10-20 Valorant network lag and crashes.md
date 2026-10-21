---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Valorant network lag and crashes"
started_at: 2026-10-20T22:02:36
ended_at: 2026-10-20T22:09:54
exported_at: 2026-10-20T22:24:16
duration_minutes: 7.3
project: Home
cwd: 'C:\Users\anant'
session_id: a89d5721-ad89-4818-92ab-7e5878fb7e94
status: raw
turn_count: 2
tools_used:
  Grep: 2
  PowerShell: 9
tokens:
  input: 48
  output: 22288
  cache_creation: 171937
  cache_read: 1256180
  total: 1450453
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

- `PowerShell` -- `{"command":"Get-NetAdapter | Where-Object Status -eq \u0027Up\u0027 | Select Name,InterfaceDescription,LinkSpeed,MediaType | Format-Table -AutoSize | Out-String; Get-NetIPConfiguration | Select InterfaceAlias,@{n=\u0027GW\u0027;e={$_.IPv4DefaultGateway.NextHop}},@{n=\u0027DNS\u0027;e={$_.DNSServer.ServerAddresses -join \u0027,\u0027}} | Format-Table | Out-String; powercfg /getactivescheme","description":"Show active adapters, DNS, power plan"}`
- `PowerShell` -- `{"command":"$gw=(Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Sort RouteMetric | Select -First 1).NextHop; \"Gateway $gw\"; ping -n 30 $gw | Select -Last 4; \"--- 8.8.8.8\"; ping -n 30 8.8.8.8 | Select -Last 4","description":"Ping gateway and internet for loss/latency"}`
- `PowerShell` -- `{"command":"Get-Service vgc,vgk -ErrorAction SilentlyContinue | Select Name,Status,StartType | Format-Table | Out-String; Get-WinEvent -FilterHashtable @{LogName=\u0027Application\u0027;Level=1,2;StartTime=(Get-Date).AddDays(-3)} -MaxEvents 25 -ErrorAction SilentlyContinue | Select TimeCreated,ProviderName,Id,@{n=\u0027Msg\u0027;e={$_.Message.Substring(0,[Math]::Min(140,$_.Message.Length))}} | Format-List | Out-String; Get-WinEvent -FilterHashtable @{LogName=\u0027System\u0027;Level=1,2;StartTime=(Get-Date).AddDays(-3)} -MaxEvents 25 -ErrorAction SilentlyContinue | Select TimeCreated,ProviderName,Id,@{n=\u0027Msg\u0027;e={$_.Message.Substring(0,[Math]::Min(140,$_.Message.Length))}} | Format-List | Out-String","description":"Check Vanguard services and recent error events"}`
- `PowerShell` -- `{"command":"netsh wlan show interfaces | Select-String \u0027SSID|BSSID|Radio|Band|Channel|Signal|Receive rate|Transmit rate|State\u0027; \"--- power mgmt\"; Get-NetAdapterPowerManagement -Name Wi-Fi | Format-List AllowComputerToTurnOffDevice,DeviceSleepOnDisconnect | Out-String; \"--- advanced\"; Get-NetAdapterAdvancedProperty -Name Wi-Fi | Select DisplayName,DisplayValue | Format-Table -AutoSize | Out-String","description":"Wi-Fi signal, band, and adapter settings"}`
- `PowerShell` -- `{"command":"Get-Service | Where-Object { $_.DisplayName -match \u0027Killer|Intelligence|Tailscale|Rivet|Nahimic|Packet\u0027 -or $_.Name -match \u0027Killer|Tailscale|RivetNet\u0027 } | Select Name,DisplayName,Status,StartType | Format-Table -AutoSize | Out-String; tailscale status 2\u003e\u00261 | Select -First 8; Get-NetTCPConnection -State Established | Group-Object OwningProcess | Sort Count -Descending | Select -First 6 | ForEach-Object { \"{0} conns: {1}\" -f $_.Count,(Get-Process -Id $_.Name -ErrorAction SilentlyContinue).ProcessName }; Get-Process | Sort CPU -Descending | Select -First 8 Name,CPU,@{n=\u0027MB\u0027;e={[int]($_.WS/1MB)}} | Format-Table | Out-String","description":"Check Killer, Tailscale, and busy processes"}`
- `PowerShell` -- `{"command":"Get-Process PowerToys.Peek.UI,PredatorSense | Select Id,Name,StartTime,@{n=\u0027Threads\u0027;e={$_.Threads.Count}} | Format-Table | Out-String; (Get-Counter \u0027\\Processor(_Total)\\% Processor Time\u0027 -SampleInterval 1 -MaxSamples 5).CounterSamples.CookedValue -join \u0027, \u0027; Get-Process | Sort {$_.CPU} -Descending | Select -First 1 | Out-Null; $a=Get-Process PowerToys.Peek.UI -ErrorAction SilentlyContinue; if($a){$c1=$a.CPU; Start-Sleep 3; $c2=(Get-Process -Id $a.Id).CPU; \"Peek CPU secs used in 3s: $($c2-$c1)\"}\nGet-WinEvent -FilterHashtable @{LogName=\u0027System\u0027;ProviderName=\u0027Display\u0027;StartTime=(Get-Date).AddDays(-7)} -MaxEvents 10 -ErrorAction SilentlyContinue | Select TimeCreated,Id,@{n=\u0027M\u0027;e={$_.Message.Substring(0,100)}} | Format-List | Out-String\nGet-WinEvent -FilterHashtable @{LogName=\u0027Application\u0027;ProviderName=\u0027Application Error\u0027;StartTime=(Get-Date).AddDays(-7)} -MaxEvents 10 -ErrorAction SilentlyContinue | Select TimeCreated,@{n=\u0027M\u0027;e={($_.Message -split \"`n\")[0]}} | Format-List | Out-String\nGet-ChildItem \"$env:LOCALAPPDATA\\VALORANT\\Saved\\Logs\" -ErrorAction SilentlyContinue | Sort LastWriteTime -Descending | Select -First 4 Name,LastWriteTime,Length | Format-Table | Out-String\nGet-CimInstance Win32_VideoController | Select Name,DriverVersion,DriverDate | Format-Table | Out-String","description":"Check CPU load, GPU resets, app crashes, Valorant logs"}`
- `PowerShell` -- `{"command":"ping -n 100 -w 1000 10.5.8.1 | Select -Last 4; Get-DnsClientServerAddress -InterfaceAlias Tailscale,Wi-Fi | Select InterfaceAlias,AddressFamily,ServerAddresses | Format-Table | Out-String","description":"Longer gateway latency sample and DNS config","timeout":150000}`
- `Grep` -- pattern `(?i)(packet loss|netspeed|hitch|timeout|disconnect|vanguard|fatal|crash|VAN-|ping.*high|TDR|device lost)` path `C:\Users\anant\AppData\Local\VALORANT\Saved\Logs\ShooterGame-backup-2026.10.20-23.54.05.log`
- `Grep` -- pattern `(?i)(Low Pro|Net.*(Loss|Lag)|Hitch|Network Instability|ConnectionLost|Connection timed|Heartbeat|Dropped|Fatal error|Ensure condition|DXGI|Lost Device|VideoMemory|OutOfMemory)` path `C:\Users\anant\AppData\Local\VALORANT\Saved\Logs\ShooterGame-backup-2026.10.20-23.54.05.log`
- `PowerShell` -- `{"command":"Get-NetAdapterStatistics -Name Wi-Fi | Select ReceivedDiscardedPackets,ReceivedPacketErrors,OutboundDiscardedPackets,OutboundPacketErrors | Format-List | Out-String; netsh interface tcp show global | Select-String \u0027Auto-Tuning|Receive-Side|Chimney|ECN|Timestamps\u0027; Get-ChildItem \u0027C:\\Users\\anant\\AppData\\Local\\CrashDumps\u0027 -ErrorAction SilentlyContinue | Sort LastWriteTime -Descending | Select -First 5 Name,LastWriteTime | Format-Table | Out-String; Get-ChildItem \u0027C:\\Users\\anant\\AppData\\Local\\VALORANT\\Saved\\Crashes\u0027 -ErrorAction SilentlyContinue | Select -First 5 Name,LastWriteTime | Format-Table | Out-String","description":"Adapter error counters, TCP settings, crash dumps"}`
- `PowerShell` -- `{"command":"$admin=([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator); \"Admin: $admin\"\nStop-Process -Name PowerToys.Peek.UI -Force -ErrorAction SilentlyContinue; \"Peek stopped\"\ntry { Set-NetAdapterAdvancedProperty -Name Wi-Fi -DisplayName \u0027Packet Coalescing\u0027 -DisplayValue \u0027Disabled\u0027 -ErrorAction Stop; Set-NetAdapterAdvancedProperty -Name Wi-Fi -DisplayName \u0027MIMO Power Save Mode\u0027 -DisplayValue \u0027No SMPS\u0027 -ErrorAction Stop; \"adapter tweaks applied\" } catch { \"FAILED: $($_.Exception.Message)\" }","description":"Apply Wi-Fi tweaks and stop runaway process"}`

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_


