# Re-registers SecondBrainClaudekit-JarvisSync to run hidden (no console popup).
# Preserves the exact sync command (wsl → sync-jarvis.sh every 15 min).
# Idempotent.

$TaskName = "SecondBrainClaudekit-JarvisSync"

# Prefer a Windows-local copy of the silent launcher so Task Scheduler does not
# depend on \\wsl.localhost being awake at registration/run time for the .vbs itself.
$WinLauncherDir = $PSScriptRoot
$WinLauncher = Join-Path $WinLauncherDir "sync-jarvis-silent.vbs"

# The repo copy lives in the WSL user's home. Ask WSL for that home instead of
# naming one user; if WSL cannot be asked, $RepoLauncher stays empty and the
# Windows-side copy is used as it is.
function Get-WslDistro {
    # The distro name is detected, never assumed (this machine's is Ubuntu-24.04, not Ubuntu).
    # WSL_DISTRO overrides. Otherwise the first name that `wsl.exe -l -q` lists is the default
    # distro; that command writes UTF-16, so the console encoding is switched to match while it
    # runs and restored after. docker-desktop helper distros are skipped, and a candidate must
    # actually run a command before it is accepted.
    if ($env:WSL_DISTRO) { return $env:WSL_DISTRO }
    $previous = [Console]::OutputEncoding
    $names = @()
    try {
        [Console]::OutputEncoding = [System.Text.Encoding]::Unicode
        $names = @(& wsl.exe -l -q 2>$null | ForEach-Object { ([string]$_).Trim([char]0, [char]0xFEFF, ' ', "`r", "`n") } | Where-Object { $_ })
    } catch { $names = @() } finally { [Console]::OutputEncoding = $previous }
    foreach ($name in $names) {
        if ($name -match '^docker-desktop') { continue }
        & wsl.exe -d $name -e true 2>$null | Out-Null
        if ($LASTEXITCODE -eq 0) { return $name }
    }
    return $null
}

$WslDistro = Get-WslDistro
$WslHome = if ($WslDistro) { (& wsl.exe -d $WslDistro -e sh -c 'echo $HOME' 2>$null | Select-Object -First 1) } else { $null }
$RepoLauncher = ""
if ($WslDistro -and $WslHome -and ([string]$WslHome).StartsWith("/")) {
    $RepoLauncher = "\\wsl.localhost\$WslDistro" + (([string]$WslHome).Trim() -replace '/', '\') + "\projects\ai\claude\second-brain-claudekit\50_Claude\scripts\sync-jarvis-silent.vbs"
}

New-Item -ItemType Directory -Path $WinLauncherDir -Force | Out-Null

# Keep the Windows-side copy in sync with the repo source of truth
if ($RepoLauncher -and (Test-Path -LiteralPath $RepoLauncher)) {
    Copy-Item -LiteralPath $RepoLauncher -Destination $WinLauncher -Force
} elseif (-not (Test-Path -LiteralPath $WinLauncher)) {
    Write-Error "Missing silent launcher at both $RepoLauncher and $WinLauncher"
    exit 1
}

# Capture existing trigger cadence if present; otherwise default to 15 min daily re-arm
$existing = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue
Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false -ErrorAction SilentlyContinue

$action = New-ScheduledTaskAction `
    -Execute "wscript.exe" `
    -Argument "//B `"$WinLauncher`""

$trigger = New-ScheduledTaskTrigger -Daily -At "00:05"
$trigger.Repetition = (New-ScheduledTaskTrigger -Once -At "00:05" `
    -RepetitionInterval (New-TimeSpan -Minutes 15) `
    -RepetitionDuration (New-TimeSpan -Hours 23 -Minutes 55)).Repetition

$settings = New-ScheduledTaskSettingsSet `
    -AllowStartIfOnBatteries `
    -DontStopIfGoingOnBatteries `
    -StartWhenAvailable `
    -MultipleInstances IgnoreNew `
    -Hidden

$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive -RunLevel Limited

Register-ScheduledTask `
    -TaskName $TaskName `
    -Action $action `
    -Trigger $trigger `
    -Settings $settings `
    -Principal $principal `
    -Description "Bidirectional Unison sync of second-brain-claudekit .claude/ layer into Jarvis (hidden; no console popup)." |
    Out-Null

Write-Output "Registered scheduled task: $TaskName (every 15 min, hidden)"
Get-ScheduledTask -TaskName $TaskName | Format-List TaskName, State
(Get-ScheduledTask -TaskName $TaskName).Actions | Format-List Execute, Arguments
(Get-ScheduledTask -TaskName $TaskName).Settings | Format-List Hidden

# Also re-assert Cursor task is still on the silent launcher (no logic change)
$CursorTask = "Jarvis-Cursor-Session-Export"
$ct = Get-ScheduledTask -TaskName $CursorTask -ErrorAction SilentlyContinue
if ($ct) {
    $ca = $ct.Actions | Select-Object -First 1
    Write-Output "Cursor task check: Hidden=$($ct.Settings.Hidden) Execute=$($ca.Execute) Args=$($ca.Arguments)"
}
