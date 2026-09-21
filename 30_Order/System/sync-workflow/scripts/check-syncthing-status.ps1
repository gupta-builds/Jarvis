# Answers "is the jarvis folder actually fully synced right now" using Syncthing's
# own REST API only — no separate hashing/diffing. Works against one instance today
# (no second device paired yet); once a remote device is paired, it is picked up
# automatically from config.xml, no script changes needed for Build 4.
#
# Usage: .\check-syncthing-status.ps1 [-FolderId jarvis] [-SyncthingUrl http://127.0.0.1:8384]
# Exit code: 0 = fully synced (or no remote devices to check yet), 1 = not synced / error.

param(
    [string]$FolderId = "jarvis",
    [string]$SyncthingUrl = "http://127.0.0.1:8384",
    [string]$ConfigPath = "$env:LOCALAPPDATA\Syncthing\config.xml"
)

if (-not (Test-Path $ConfigPath)) {
    Write-Error "Syncthing config not found at $ConfigPath"
    exit 1
}

[xml]$cfg = Get-Content $ConfigPath
$apiKey = $cfg.configuration.gui.apikey
if (-not $apiKey) {
    Write-Error "No apikey found in $ConfigPath"
    exit 1
}
$headers = @{ "X-API-Key" = $apiKey }

$exitCode = 0

# The GUI/API listener is the authoritative local process. Syncthing normally
# uses a monitor process plus a child process, so process count alone is not a
# valid duplicate-instance test. A competing instance cannot own the same GUI
# port; verifying the listener and the API avoids false alarms on the normal
# monitor/child arrangement.
try {
    $listeners = @()
    try {
        $listeners = @(Get-NetTCPConnection -State Listen -LocalPort 8384 -ErrorAction Stop)
    } catch {
        # Windows PowerShell can deny Get-NetTCPConnection to a non-elevated
        # scheduled task. netstat still exposes the owning PID without the
        # process command line or any secret-bearing configuration.
        $listeners = @(netstat -ano 2>$null | ForEach-Object {
            $text = $_.ToString().Trim()
            if ($text -match '^(TCP|TCP6)\s+[^\s:]+:8384\s+[^\s]+\s+LISTENING\s+(\d+)$') {
                [pscustomobject]@{ OwningProcess = [int]$Matches[2] }
            }
        })
    }
    if ($listeners.Count -ne 1) {
        Write-Error "Expected exactly one Syncthing GUI listener on port 8384; found $($listeners.Count)."
        $exitCode = 1
    } else {
        $listenerPid = $listeners[0].OwningProcess
        $matchingProcess = @(Get-Process -Id $listenerPid -ErrorAction SilentlyContinue)
        if ($matchingProcess.Count -ne 1 -or $matchingProcess[0].ProcessName -ne 'syncthing') {
            Write-Error "Port 8384 is not owned by exactly one Syncthing process."
            $exitCode = 1
        }
    }
} catch {
    Write-Error "Could not verify the Syncthing process/listener: $_"
    $exitCode = 1
}

try {
    $myStatus = Invoke-RestMethod -Uri "$SyncthingUrl/rest/system/status" -Headers $headers -Method Get
} catch {
    Write-Error "Could not reach Syncthing REST API at $SyncthingUrl : $_"
    exit 1
}
$myId = $myStatus.myID
Write-Output "Local device ID: $myId"

# Folder-level state on this machine.
try {
    $folderStatus = Invoke-RestMethod -Uri "$SyncthingUrl/rest/db/status?folder=$FolderId" -Headers $headers -Method Get
} catch {
    Write-Error "db/status failed for folder '$FolderId': $_"
    exit 1
}
Write-Output "`nFolder '$FolderId' local state:"
Write-Output "  state       : $($folderStatus.state)"
Write-Output "  localFiles  : $($folderStatus.localFiles)"
Write-Output "  globalFiles : $($folderStatus.globalFiles)"
Write-Output "  needFiles   : $($folderStatus.needFiles)"
Write-Output "  needBytes   : $($folderStatus.needBytes)"
Write-Output "  errors      : $($folderStatus.errors)"

if ($folderStatus.needFiles -gt 0 -or $folderStatus.needBytes -gt 0 -or $folderStatus.errors -gt 0) {
    Write-Output "  -> NOT fully synced locally."
    $exitCode = 1
}

# The database can briefly look complete while Syncthing has preserved a
# conflict copy or left a transfer temp file on disk. Those are user-visible
# integrity failures, so the guard checks the folder itself as well.
$folderCfg = $cfg.configuration.folder | Where-Object { $_.id -eq $FolderId } | Select-Object -First 1
$folderPath = $folderCfg.path
if (-not $folderPath) {
    Write-Error "Folder '$FolderId' has no configured path."
    exit 1
}
$conflictFiles = @(Get-ChildItem -LiteralPath $folderPath -Force -Recurse -File -Filter "*.sync-conflict-*" -ErrorAction SilentlyContinue)
$tempFiles = @(Get-ChildItem -LiteralPath $folderPath -Force -Recurse -File -Filter "~syncthing~*.tmp" -ErrorAction SilentlyContinue)
if ($conflictFiles.Count -gt 0) {
    Write-Error "Found $($conflictFiles.Count) Syncthing conflict copy/copies."
    $conflictFiles | Select-Object -First 20 -ExpandProperty FullName | ForEach-Object { Write-Error "  $_" }
    $exitCode = 1
}
if ($tempFiles.Count -gt 0) {
    Write-Error "Found $($tempFiles.Count) Syncthing transfer temp file(s)."
    $tempFiles | Select-Object -First 20 -ExpandProperty FullName | ForEach-Object { Write-Error "  $_" }
    $exitCode = 1
}

try {
    $folderErrors = @(Invoke-RestMethod -Uri "$SyncthingUrl/rest/folder/errors?folder=$FolderId" -Headers $headers -Method Get).errors
    if ($folderErrors.Count -gt 0) {
        Write-Error "Syncthing reports $($folderErrors.Count) folder error(s)."
        $folderErrors | Select-Object -First 20 path,error | ForEach-Object {
            Write-Error "  $($_.path): $($_.error)"
        }
        $exitCode = 1
    }
} catch {
    Write-Error "folder/errors failed for folder '$FolderId': $_"
    $exitCode = 1
}

# Devices actually sharing this folder, other than ourselves.
$remoteDeviceIds = @()
if ($folderCfg) {
    $remoteDeviceIds = $folderCfg.device | Where-Object { $_.id -ne $myId } | ForEach-Object { $_.id }
}

if ($remoteDeviceIds.Count -eq 0) {
    Write-Output "`nNo remote devices share folder '$FolderId' yet (expected pre-Build 4)."
    Write-Output "Completion can only be checked against this device's own database until a"
    Write-Output "second device is paired. Local state above is the only signal available today."
} else {
    Write-Output "`nCompletion against remote devices:"
    foreach ($devId in $remoteDeviceIds) {
        try {
            $completion = Invoke-RestMethod -Uri "$SyncthingUrl/rest/db/completion?folder=$FolderId&device=$devId" -Headers $headers -Method Get
        } catch {
            Write-Error "db/completion failed for device $devId : $_"
            $exitCode = 1
            continue
        }
        Write-Output "  device $devId"
        Write-Output "    completion : $($completion.completion)%"
        Write-Output "    needBytes  : $($completion.needBytes)"
        Write-Output "    needItems  : $($completion.needItems)"
        if ($completion.completion -ne 100 -or $completion.needItems -gt 0 -or $completion.needBytes -gt 0) {
            Write-Output "    -> NOT fully synced against this device."
            $exitCode = 1
        }
    }
}

Write-Output "`nOverall: $(if ($exitCode -eq 0) { 'IN SYNC' } else { 'NOT IN SYNC' })"
exit $exitCode
