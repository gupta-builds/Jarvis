# Keeps the Codex background server (app-server daemon) startable on Windows.
#
# Failure this prevents: `codex` exits with
#     Error: failed to open daemon process: Access is denied. (os error 5)
# Root cause (found 2026-10-21): the daemon records itself in
# ~/.codex/app-server-daemon/daemon.pid and removes that file only on a clean
# `daemon stop`. A reboot, a kill, or a crash leaves the file behind naming a dead PID.
# Windows can keep a phantom process object alive for that PID, so OpenProcess on it
# returns error 5 (access denied) instead of 87 (not found). Codex 0.163 treats error 5
# as fatal instead of as "stale pid file", so every launch fails until the file is cleared.
# The 2026-10-12 fix repaired a different fault (missing packages\...\current junction)
# and nothing covered stale runtime state, which is why this came back.
#
# What this does, in order:
#   1. If `codex app-server daemon version` succeeds, the daemon is healthy: exit 0.
#   2. Otherwise check each pid file. A pid file is live only if its PID exists AND the
#      process start time matches the one recorded in the file (guards PID reuse).
#   3. Remove pid files that are not live, plus the unix socket that belongs to them.
#   4. Start the daemon again and confirm it answers.
#
# Usage: .\codex-daemon-guard.ps1 [-NoStart] [-WhatIf]
# Exit code: 0 = daemon healthy (or repaired), 1 = still not healthy after repair.
# Log (only written when something was wrong): %LOCALAPPDATA%\codex-guard\guard.log

[CmdletBinding(SupportsShouldProcess)]
param(
    [switch]$NoStart
)

$ErrorActionPreference = 'Stop'
$CodexHome = Join-Path $env:USERPROFILE '.codex'
$DaemonDir = Join-Path $CodexHome 'app-server-daemon'
$ControlDir = Join-Path $CodexHome 'app-server-control'
$LogDir = Join-Path $env:LOCALAPPDATA 'codex-guard'
$LogFile = Join-Path $LogDir 'guard.log'

function Write-GuardLog {
    param([string]$Message)
    try {
        New-Item -ItemType Directory -Force -Path $LogDir | Out-Null
        Add-Content -LiteralPath $LogFile -Value ("{0:yyyy-MM-dd HH:mm:ss} {1}" -f (Get-Date), $Message)
        $lines = Get-Content -LiteralPath $LogFile -ErrorAction SilentlyContinue
        if ($lines.Count -gt 300) { $lines | Select-Object -Last 200 | Set-Content -LiteralPath $LogFile }
    } catch { }
}

function Get-CodexCommand {
    $cmd = Get-Command codex.cmd -CommandType Application -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($cmd) { return $cmd.Source }
    $fallback = 'D:\AI\npm-global\codex.cmd'
    if (Test-Path -LiteralPath $fallback) { return $fallback }
    throw 'codex.cmd not found on PATH or at D:\AI\npm-global'
}

# Windows PowerShell 5.1 turns a native command's stderr into a terminating error under
# $ErrorActionPreference = 'Stop', so native calls run with it relaxed.
function Invoke-Codex {
    param([string]$Codex, [string[]]$Arguments)
    $previous = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        & $Codex @Arguments 2>&1 | Out-Null
        return $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previous
    }
}

function Test-DaemonHealthy {
    param([string]$Codex)
    return ((Invoke-Codex -Codex $Codex -Arguments 'app-server', 'daemon', 'version') -eq 0)
}

# A pid file is live only when the PID exists and its start time matches the recorded
# one. Anything unreadable, missing, or mismatched counts as stale.
function Test-PidFileLive {
    param([string]$PidFile)
    try {
        $rec = Get-Content -LiteralPath $PidFile -Raw | ConvertFrom-Json
        $proc = Get-Process -Id ([int]$rec.pid) -ErrorAction Stop
        $recorded = [DateTime]::FromFileTime([int64]$rec.processStartTime)
        return ([Math]::Abs(($proc.StartTime - $recorded).TotalSeconds) -lt 5)
    } catch {
        return $false
    }
}

$codex = Get-CodexCommand

if (Test-DaemonHealthy -Codex $codex) { exit 0 }

Write-GuardLog 'daemon not answering, checking for stale state'

# pid file -> socket that goes stale with it
$pairs = @(
    @{ Pid = Join-Path $DaemonDir 'daemon.pid';         Sock = Join-Path $ControlDir 'app-server-control.sock' },
    @{ Pid = Join-Path $DaemonDir 'daemon-updater.pid'; Sock = Join-Path $DaemonDir 'daemon-updater.sock' }
)

foreach ($p in $pairs) {
    if (-not (Test-Path -LiteralPath $p.Pid)) { continue }
    if (Test-PidFileLive -PidFile $p.Pid) { continue }
    foreach ($target in $p.Pid, $p.Sock) {
        if (-not (Test-Path -LiteralPath $target)) { continue }
        if ($PSCmdlet.ShouldProcess($target, 'Remove stale Codex daemon state')) {
            Remove-Item -LiteralPath $target -Force
            Write-GuardLog "removed stale $target"
        }
    }
}

if ($NoStart) { exit 0 }

Invoke-Codex -Codex $codex -Arguments 'app-server', 'daemon', 'start' | Out-Null
if (Test-DaemonHealthy -Codex $codex) {
    Write-GuardLog 'daemon started and answering'
    exit 0
}

Write-GuardLog 'daemon still not healthy after cleanup and start'
exit 1
