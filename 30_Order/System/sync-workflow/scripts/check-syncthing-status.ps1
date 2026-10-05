# Answers "is the jarvis folder actually fully synced right now" using Syncthing's
# own REST API only — no separate hashing/diffing. Works against one instance today
# (no second device paired yet); once a remote device is paired, it is picked up
# automatically from config.xml, no script changes needed for Build 4.
#
# Usage: .\check-syncthing-status.ps1 [-FolderId jarvis] [-SyncthingUrl http://127.0.0.1:8384]
# Exit code: 0 = fully synced (or no remote devices to check yet), 1 = not synced / error.
#
# Build 9 (2026-10-02): this script used to exit 1 and rely on whoever happened to
# check Task Scheduler's LastTaskResult noticing. Build 8 found that guard silently
# stale for a week; Build 9 found it correctly running and correctly exiting 1 for
# three straight days (29-09 onward, 4 live conflict files) with nobody noticing —
# a Task Scheduler exit code is not a warning if nothing surfaces it. This version
# always reaches the alerting section at the bottom (no early `exit 1` before the
# problem list is built), writes a self-clearing banner into 00_Dashboard.md (the
# file this vault's own daily cadence already opens via /startday), and fires a
# best-effort Windows toast so the warning reaches the user even without opening
# Obsidian. Both are rate-limited via a small local state file so an unresolved
# problem reminds hourly instead of spamming every 5-minute tick.

param(
    [string]$FolderId = "jarvis",
    [string]$SyncthingUrl = "http://127.0.0.1:8384",
    [string]$ConfigPath = "$env:LOCALAPPDATA\Syncthing\config.xml"
)

$StateFile = Join-Path $PSScriptRoot ".sync-alert-state.json"
$exitCode = 0
$problems = [System.Collections.Generic.List[string]]::new()
$folderPath = $null

function Get-SyncAlertState {
    param([string]$Path)
    if (Test-Path $Path) {
        try {
            $raw = Get-Content -LiteralPath $Path -Raw | ConvertFrom-Json
            return [pscustomobject]@{ consecutiveFailures = [int]$raw.consecutiveFailures }
        } catch { }
    }
    return [pscustomobject]@{ consecutiveFailures = 0 }
}

function Save-SyncAlertState {
    param([string]$Path, $State)
    try { $State | ConvertTo-Json | Set-Content -LiteralPath $Path -Encoding utf8 } catch { }
}

function Send-SyncAlertToast {
    # Best-effort only: a failed toast must never change this script's exit code
    # or block the health check it exists to report on.
    param([string]$Title, [string]$Message)
    try {
        [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
        [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
        $template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText02)
        $textNodes = $template.GetElementsByTagName("text")
        $textNodes.Item(0).AppendChild($template.CreateTextNode($Title)) | Out-Null
        $textNodes.Item(1).AppendChild($template.CreateTextNode($Message)) | Out-Null
        $toast = [Windows.UI.Notifications.ToastNotification]::new($template)
        [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier("Windows PowerShell").Show($toast)
    } catch {
        Write-Error "Toast notification failed, non-fatal ($_)."
    }
}

#  Windows PowerShell 5.1's Get-Content/Set-Content, even with -Encoding utf8,
#  mis-decodes a BOM-less UTF-8 file (falls back to the system codepage) and
#  writes a BOM back out, corrupting every em dash/middot/smart-quote in the
#  file (caught live testing this script: "Jarvis OS - North Star" became
#  mojibake). Reading and writing through .NET's UTF8Encoding($false)
#  directly bypasses both cmdlets' encoding guessing.
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)
function Read-Utf8NoBom { param([string]$Path) [System.IO.File]::ReadAllText($Path, $Utf8NoBom) }
function Write-Utf8NoBom { param([string]$Path, [string]$Content) [System.IO.File]::WriteAllText($Path, $Content, $Utf8NoBom) }

# Build 11 (2026-10-04): this used to write the live banner text directly into
# 00_Dashboard.md - a file both laptops' health-check runs legitimately need to
# keep syncing for its OTHER content. Since each machine rewrites the banner
# independently every 5 minutes, that made the banner itself a permanent,
# by-design conflict source (Known Failure Mode 15) - one single reconciliation
# session hit 15+ Dashboard sync-conflicts from this alone. Fix: the live,
# divergent text now goes in $BannerFilePath, a small per-machine file excluded
# from both .gitignore and .stignore (same shape as .sync-alert-state.json).
# 00_Dashboard.md itself only ever gets ONE static line inserted, once, that
# embeds that file via Obsidian's ![[...]] transclusion - identical bytes on
# both machines forever after, so this mechanism can never conflict again.
# Obsidian re-reads an embed's target live on every view, so the embedded
# content still updates in real time; it just never has to be the same bytes
# across machines.
$BannerFilePath = Join-Path $PSScriptRoot "..\Sync Alert Banner.md"

function Set-DashboardSyncBanner {
    # Ensures the static embed line exists in 00_Dashboard.md (idempotent,
    # only actually writes the file the first time this runs on a given
    # machine) and writes the live, divergent content into the per-machine
    # banner file every call - this second write is the one that happens
    # every 5 minutes and it never touches a synced file.
    param([string]$DashboardPath, [string[]]$Problems)
    $beginMarker = "<!-- SYNC-ALERT:BEGIN -->"
    $endMarker = "<!-- SYNC-ALERT:END -->"
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
    $problemLines = ($Problems | ForEach-Object { "- $_" }) -join "`n"
    $bannerFileContent = "> [!danger] SYNC ALERT - content integrity at risk (detected $timestamp)`n> ``Jarvis-Syncthing-Health`` found a real problem. Do not assume notes are current until this clears on its own.`n$problemLines`n> Run ``check-syncthing-status.ps1`` for detail, or see [[Cross-Laptop Sync - Known Failure Modes and Prevention]].`n"
    Write-Utf8NoBom -Path $BannerFilePath -Content $bannerFileContent
    Ensure-DashboardEmbed -DashboardPath $DashboardPath -BeginMarker $beginMarker -EndMarker $endMarker
}

function Clear-DashboardSyncBanner {
    # Healthy state: blank the per-machine banner file (Obsidian renders an
    # empty embed as nothing visible) and leave 00_Dashboard.md's static
    # embed line in place - it never needs removing, only inserting once.
    param([string]$DashboardPath)
    Write-Utf8NoBom -Path $BannerFilePath -Content ""
    Ensure-DashboardEmbed -DashboardPath $DashboardPath -BeginMarker "<!-- SYNC-ALERT:BEGIN -->" -EndMarker "<!-- SYNC-ALERT:END -->"
}

function Ensure-DashboardEmbed {
    param([string]$DashboardPath, [string]$BeginMarker, [string]$EndMarker)
    if (-not $DashboardPath -or -not (Test-Path -LiteralPath $DashboardPath)) { return }
    $content = Read-Utf8NoBom -Path $DashboardPath
    $embedLine = "![[30_Order/System/sync-workflow/Sync Alert Banner]]"
    $staticBlock = "$BeginMarker`n$embedLine`n$EndMarker`n`n"
    # Matches either the old dynamic banner (Build 9/10, any content between
    # the markers) or an already-current static block - either way collapses
    # to exactly one copy of the static block, so a machine still carrying
    # the pre-Build-11 dynamic banner self-heals on its next run instead of
    # needing a manual one-time migration.
    $blockPattern = "(?s)" + [regex]::Escape($BeginMarker) + ".*?" + [regex]::Escape($EndMarker) + "\r?\n\r?\n?"
    if ($content -match $blockPattern) {
        if ($content -notmatch [regex]::Escape($embedLine)) {
            $content = [regex]::Replace($content, $blockPattern, { param($m) $staticBlock })
            Write-Utf8NoBom -Path $DashboardPath -Content $content
        }
        # Already the current static block - no write needed, no churn.
    } else {
        $content = [regex]::Replace($content, "(?s)^(---.*?---\r?\n)", { param($m) $m.Groups[1].Value + $staticBlock })
        Write-Utf8NoBom -Path $DashboardPath -Content $content
    }
}

function Complete-HealthCheck {
    param([int]$ExitCode, [string[]]$Problems, [string]$DashboardPath)
    $state = Get-SyncAlertState -Path $StateFile
    if ($ExitCode -ne 0) {
        $state.consecutiveFailures = [int]$state.consecutiveFailures + 1
        Set-DashboardSyncBanner -DashboardPath $DashboardPath -Problems $Problems
        # Toast on first detection, then hourly (every 12th five-minute tick) while
        # still broken — enough to stay noticeable without training the user to
        # dismiss/ignore a toast every 5 minutes.
        if ($state.consecutiveFailures -eq 1 -or ($state.consecutiveFailures % 12 -eq 0)) {
            $msg = ($Problems | Select-Object -First 3) -join "`n"
            Send-SyncAlertToast -Title "Jarvis sync problem detected" -Message $msg
        }
    } else {
        if ([int]$state.consecutiveFailures -gt 0) {
            Send-SyncAlertToast -Title "Jarvis sync recovered" -Message "Healthy again after $($state.consecutiveFailures) failed check(s)."
        }
        $state.consecutiveFailures = 0
        Clear-DashboardSyncBanner -DashboardPath $DashboardPath
    }
    Save-SyncAlertState -Path $StateFile -State $state
    Write-Output "`nOverall: $(if ($ExitCode -eq 0) { 'IN SYNC' } else { 'NOT IN SYNC' })"
    exit $ExitCode
}

if (-not (Test-Path $ConfigPath)) {
    Write-Error "Syncthing config not found at $ConfigPath"
    # No config means no known vault path either - nothing to write a banner to.
    Complete-HealthCheck -ExitCode 1 -Problems @("Syncthing config not found at $ConfigPath") -DashboardPath $null
}

[xml]$cfg = Get-Content $ConfigPath
$apiKey = $cfg.configuration.gui.apikey
if (-not $apiKey) {
    Write-Error "No apikey found in $ConfigPath"
    Complete-HealthCheck -ExitCode 1 -Problems @("No Syncthing apikey found in $ConfigPath") -DashboardPath $null
}
$headers = @{ "X-API-Key" = $apiKey }

# Resolved from config directly (not from a live API call) so the dashboard path
# is known even if the API below is unreachable - that case needs alerting too.
$folderCfg = $cfg.configuration.folder | Where-Object { $_.id -eq $FolderId } | Select-Object -First 1
$folderPath = $folderCfg.path
$dashboardPath = if ($folderPath) { Join-Path $folderPath "00_Dashboard.md" } else { $null }

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
        $problems.Add("Expected exactly one Syncthing GUI listener on port 8384; found $($listeners.Count).")
    } else {
        $listenerPid = $listeners[0].OwningProcess
        $matchingProcess = @(Get-Process -Id $listenerPid -ErrorAction SilentlyContinue)
        if ($matchingProcess.Count -ne 1 -or $matchingProcess[0].ProcessName -ne 'syncthing') {
            Write-Error "Port 8384 is not owned by exactly one Syncthing process."
            $exitCode = 1
            $problems.Add("Port 8384 is not owned by exactly one Syncthing process.")
        }
    }
} catch {
    Write-Error "Could not verify the Syncthing process/listener: $_"
    $exitCode = 1
    $problems.Add("Could not verify the Syncthing process/listener.")
}

try {
    $myStatus = Invoke-RestMethod -Uri "$SyncthingUrl/rest/system/status" -Headers $headers -Method Get
    $myId = $myStatus.myID
    Write-Output "Local device ID: $myId"
} catch {
    Write-Error "Could not reach Syncthing REST API at $SyncthingUrl : $_"
    $problems.Add("Syncthing REST API unreachable at $SyncthingUrl - Syncthing may not be running.")
    Complete-HealthCheck -ExitCode 1 -Problems $problems -DashboardPath $dashboardPath
}

# Folder-level state on this machine.
try {
    $folderStatus = Invoke-RestMethod -Uri "$SyncthingUrl/rest/db/status?folder=$FolderId" -Headers $headers -Method Get
} catch {
    Write-Error "db/status failed for folder '$FolderId': $_"
    $problems.Add("db/status failed for folder '$FolderId' - Syncthing may not be running or the folder is misconfigured.")
    Complete-HealthCheck -ExitCode 1 -Problems $problems -DashboardPath $dashboardPath
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
    $problems.Add("Folder not fully synced locally: needFiles=$($folderStatus.needFiles), needBytes=$($folderStatus.needBytes), errors=$($folderStatus.errors).")
}

if (-not $folderPath) {
    Write-Error "Folder '$FolderId' has no configured path."
    $exitCode = 1
    $problems.Add("Folder '$FolderId' has no configured path in Syncthing's config.")
    Complete-HealthCheck -ExitCode $exitCode -Problems $problems -DashboardPath $dashboardPath
}

# .stversions is Staggered File Versioning's own archive - it deliberately
# keeps old sync-conflict copies as version history, not a live problem. A
# recursive scan without this exclusion permanently flags every versioned
# conflict copy as an active incident, defeating the point of the check.
# 99_Archive is excluded for the identical reason (Build 11, 2026-10-04,
# found live on the Acer): every build's own conflict-reconciliation protocol
# writes resolved conflicts there, so a scan that doesn't exclude it flags its
# own archived history as a live problem the moment any session's own archive
# folder exists under the vault - 99_Archive should never actually live
# inside the vault (see AGENTS.md's vault-root rule; the real archive root is
# D:\...\99_Archive, outside the vault, per machine), but this exclusion is
# cheap insurance against the exact mistake that already happened once.
$excludePattern = '\\(\.stversions|99_Archive)\\'
$conflictFiles = @(Get-ChildItem -LiteralPath $folderPath -Force -Recurse -File -Filter "*.sync-conflict-*" -ErrorAction SilentlyContinue | Where-Object { $_.FullName -notmatch $excludePattern })
$tempFiles = @(Get-ChildItem -LiteralPath $folderPath -Force -Recurse -File -Filter "~syncthing~*.tmp" -ErrorAction SilentlyContinue | Where-Object { $_.FullName -notmatch $excludePattern })
if ($conflictFiles.Count -gt 0) {
    Write-Error "Found $($conflictFiles.Count) Syncthing conflict copy/copies."
    $conflictFiles | Select-Object -First 20 -ExpandProperty FullName | ForEach-Object { Write-Error "  $_" }
    $exitCode = 1
    $problems.Add("$($conflictFiles.Count) live .sync-conflict-* file(s) on disk - read each against its canonical counterpart before touching, never bulk-discard (see Known Failure Mode 6).")
}
if ($tempFiles.Count -gt 0) {
    Write-Error "Found $($tempFiles.Count) Syncthing transfer temp file(s)."
    $tempFiles | Select-Object -First 20 -ExpandProperty FullName | ForEach-Object { Write-Error "  $_" }
    $exitCode = 1
    $problems.Add("$($tempFiles.Count) stuck Syncthing transfer temp file(s) on disk.")
}

try {
    $folderErrors = @(Invoke-RestMethod -Uri "$SyncthingUrl/rest/folder/errors?folder=$FolderId" -Headers $headers -Method Get).errors
    if ($folderErrors.Count -gt 0) {
        Write-Error "Syncthing reports $($folderErrors.Count) folder error(s)."
        $folderErrors | Select-Object -First 20 path,error | ForEach-Object {
            Write-Error "  $($_.path): $($_.error)"
        }
        $exitCode = 1
        $problems.Add("Syncthing reports $($folderErrors.Count) folder error(s) via /rest/folder/errors.")
    }
} catch {
    Write-Error "folder/errors failed for folder '$FolderId': $_"
    $exitCode = 1
    $problems.Add("Could not query /rest/folder/errors for folder '$FolderId'.")
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
            $problems.Add("db/completion failed for remote device $devId.")
            continue
        }
        Write-Output "  device $devId"
        Write-Output "    completion : $($completion.completion)%"
        Write-Output "    needBytes  : $($completion.needBytes)"
        Write-Output "    needItems  : $($completion.needItems)"
        if ($completion.completion -ne 100 -or $completion.needItems -gt 0 -or $completion.needBytes -gt 0) {
            Write-Output "    -> NOT fully synced against this device."
            $exitCode = 1
            $problems.Add("Not fully synced against remote device $devId (completion=$($completion.completion)%, needBytes=$($completion.needBytes), needItems=$($completion.needItems)).")
        }
    }
}

Complete-HealthCheck -ExitCode $exitCode -Problems $problems -DashboardPath $dashboardPath
