# Runs the /weekly-review skill headlessly via Claude Code's print mode.
# Registered as the Jarvis-WeeklyReview Scheduled Task (Sundays 06:00), independently
# on each laptop - the skill itself checks the Weekly Synthesis Index for this
# week's entry before doing real work, so a duplicate fire from the other
# laptop (both registered, both machines on) is a safe no-op, not an error.
#
# -DryRun (added 2026-11-05) resolves everything a real run needs, runs
# order-health.js (read-only, the same command the skill's Step 7.7 runs), prints the
# exact command a real run would execute, and stops. It does not start the model,
# take the lock, write a note or write the log. Run it the way the task does:
#   powershell.exe -NoProfile -ExecutionPolicy Bypass -File run-weekly-review.ps1 -DryRun
#
# ASCII-only: Windows PowerShell 5.1 reads .ps1 files using the system
# codepage, not UTF-8 - a non-ASCII character (em dashes included) can corrupt
# into a stray quote and break string literals with cascading parse errors.
param([switch]$DryRun)

$ErrorActionPreference = "Stop"
$VaultRoot = Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")
$LogFile = Join-Path $PSScriptRoot "..\logs\weekly-review.log"
$lockFile = Join-Path $PSScriptRoot ".weekly-review.lock"

function Write-Log {
    param([string]$Message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Add-Content -Path $LogFile -Value "$timestamp  $Message" -Encoding UTF8
}

function Resolve-ClaudeExe {
    # Default install folder first; then any claude.exe that PATH resolves.
    $exe = Join-Path $env:USERPROFILE ".local\bin\claude.exe"
    if (-not (Test-Path $exe)) {
        $found = Get-Command claude -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($found) { $exe = $found.Source }
    }
    return $exe
}

$prompt = "/weekly-review`n`nThis is an unattended, headless run via the Jarvis-WeeklyReview scheduled task - no human is present. Per the skill's own headless rule for Step 7.5 (Log Maintenance): do not delete any log content even if a log is over its cap - only summarize and flag it in this week's synthesis note's Vault Health section for a human to trim later in an interactive session."

if ($DryRun) {
    $claudeExe = Resolve-ClaudeExe
    $nodeCmd = Get-Command node -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
    $nodeExe = if ($nodeCmd) { $nodeCmd.Source } else { $null }
    $health = Join-Path $VaultRoot "30_Order\System\vault-lint\order-health.js"
    $skill = Join-Path $VaultRoot ".claude\skills\weekly-review\weekly-review.md"
    $index = Join-Path $VaultRoot "60_Claude\30_Reviews\Weekly Synthesis\Weekly Synthesis Index.md"
    $ok = $true
    function Show($label, $value, $good) {
        if (-not $good) { $script:ok = $false }
        Write-Output ("{0,-6} {1,-26} {2}" -f $(if ($good) { "OK" } else { "FAIL" }), $label, $value)
    }
    Write-Output "=== run-weekly-review.ps1 -DryRun (nothing is started, taken or written) ==="
    Write-Output ("process working directory: {0}" -f (Get-Location).Path)
    Write-Output ("running as: {0} | PowerShell {1}" -f $env:USERNAME, $PSVersionTable.PSVersion)
    Show "script folder" $PSScriptRoot (Test-Path -LiteralPath $PSScriptRoot)
    Show "vault root" $VaultRoot (Test-Path -LiteralPath (Join-Path $VaultRoot "00_Dashboard.md"))
    Show "claude.exe" $claudeExe (Test-Path -LiteralPath $claudeExe)
    $claudeVersion = if (Test-Path -LiteralPath $claudeExe) { (& $claudeExe --version 2>&1 | Select-Object -First 1) } else { "n/a" }
    Write-Output ("       claude version: {0}" -f $claudeVersion)
    Show "node.exe" $nodeExe ([bool]$nodeExe)
    Show "order-health.js" $health (Test-Path -LiteralPath $health)
    Show "skill file" $skill (Test-Path -LiteralPath $skill)
    Show "synthesis index" $index (Test-Path -LiteralPath $index)
    Show "log folder" (Split-Path -Parent $LogFile) (Test-Path -LiteralPath (Split-Path -Parent $LogFile))
    $lockState = if (Test-Path -LiteralPath $lockFile) { "present, age {0} min" -f [math]::Round(((Get-Date) - (Get-Item -LiteralPath $lockFile -Force).LastWriteTime).TotalMinutes, 1) } else { "absent" }
    Show "run lock" $lockState (-not (Test-Path -LiteralPath $lockFile) -or ((Get-Date) - (Get-Item -LiteralPath $lockFile -Force).LastWriteTime).TotalMinutes -ge 120)
    if ($nodeExe -and (Test-Path -LiteralPath $health)) {
        Push-Location $VaultRoot
        try {
            $report = @(& $nodeExe $health 2>&1)
            $code = $LASTEXITCODE
        } finally { Pop-Location }
        Show "order-health.js run" ("exit {0}, {1} lines, first line: {2}" -f $code, $report.Count, $report[0]) ($code -eq 0 -and $report.Count -gt 5)
    }
    Write-Output ""
    Write-Output "Command a real run would execute, from working directory $VaultRoot :"
    Write-Output ('"{0}" -p "<prompt below>" --permission-mode auto --output-format text' -f $claudeExe)
    Write-Output "Prompt:"
    Write-Output $prompt
    Write-Output ""
    Write-Output ("RESULT: " + $(if ($ok) { "every path a real run needs resolves" } else { "something a real run needs is missing (see FAIL)" }))
    exit $(if ($ok) { 0 } else { 1 })
}

if (Test-Path $lockFile) {
    $lockAge = (Get-Date) - (Get-Item $lockFile).LastWriteTime
    if ($lockAge.TotalMinutes -lt 120) {
        Write-Log "SKIPPED  lock held, age $([math]::Round($lockAge.TotalMinutes,1)) min"
        exit 0
    }
    Write-Log "Stale lock ($([math]::Round($lockAge.TotalMinutes,1)) min) - removing and proceeding"
    Remove-Item $lockFile -Force
}
New-Item -ItemType File -Path $lockFile -Force | Out-Null

try {
    Set-Location $VaultRoot
    Write-Log "Starting headless /weekly-review run"

    $claudeExe = Resolve-ClaudeExe
    if (-not (Test-Path $claudeExe)) {
        Write-Log "EXCEPTION  claude.exe not found at $claudeExe - Task Scheduler cannot rely on PATH resolution"
        exit 1
    }
    $output = & $claudeExe -p $prompt --permission-mode auto --output-format text 2>&1
    $exitCode = $LASTEXITCODE

    if ($exitCode -eq 0) {
        Write-Log "OK  exit=0"
    } else {
        Write-Log "FAILED  exit=$exitCode"
        Write-Log "Output: $($output -join ' | ')"
    }
}
catch {
    Write-Log "EXCEPTION  $($_.Exception.Message)"
}
finally {
    Remove-Item $lockFile -Force -ErrorAction SilentlyContinue
}
