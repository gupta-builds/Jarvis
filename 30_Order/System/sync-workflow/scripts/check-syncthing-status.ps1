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

if ($folderStatus.needBytes -gt 0 -or $folderStatus.errors -gt 0) {
    Write-Output "  -> NOT fully synced locally."
    $exitCode = 1
}

# Devices actually sharing this folder, other than ourselves.
$folderCfg = $cfg.configuration.folder | Where-Object { $_.id -eq $FolderId }
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
        if ($completion.completion -ne 100 -or $completion.needBytes -gt 0) {
            Write-Output "    -> NOT fully synced against this device."
            $exitCode = 1
        }
    }
}

Write-Output "`nOverall: $(if ($exitCode -eq 0) { 'IN SYNC' } else { 'NOT IN SYNC' })"
exit $exitCode
