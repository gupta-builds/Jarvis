# Scheduled git auto-commit/push for the Jarvis vault (Build 7).
#
# Syncthing keeps the working tree converged across laptops in real time, but
# git's own history and GitHub backup only happen when someone commits. This
# script closes that gap: pull --rebase, commit a real diff if one exists,
# push, and on a rejected push (the other laptop pushed first) pull --rebase
# again and retry once before giving up and logging the conflict for a human.
#
# Operates on whatever branch is currently checked out, deliberately
# branch-agnostic, so this same script keeps working unchanged once the
# working tree moves from infra/cross-laptop-sync to master for real
# day-to-day use (the roadmap's locked-in direct-to-master strategy).
#
# A dry run with nothing to commit exits 0 with nothing staged, never
# creates an empty commit.
#
# Usage: .\git-auto-sync.ps1
# Exit codes: 0 = clean (nothing to do, or committed and pushed successfully)
#             1 = a real problem a human needs to look at (rebase conflict,
#                 push failed twice, lock held by a stuck prior run, etc.)
#
# When dot-sourced instead of run directly, only the functions below are
# defined (used by the test harness to exercise Invoke-PushWithRebaseRetry
# against a real, hand-crafted rejected-push state without waiting on a race).

param(
    [string]$VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..\.."))
)

$LogDir = Join-Path $PSScriptRoot "..\logs"
$LogFile = Join-Path $LogDir "git-auto-sync.log"
$LockFile = Join-Path $PSScriptRoot ".git-auto-sync.lock"
$LockStaleMinutes = 30

function Write-SyncLog {
    # Deliberately Write-Host, not Write-Output: this is called from inside
    # functions that return $true/$false, and Write-Output would leak into
    # that return value (a non-empty array is always truthy under -not,
    # which silently defeats every caller's success/failure check). Caught
    # by real testing, not reasoned out in advance, see Build 7 Findings.
    param([string]$Message)
    $line = "[$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')] $Message"
    Write-Host $line
    if (-not (Test-Path $LogDir)) {
        New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
    }
    Add-Content -Path $LogFile -Value $line
}

function Get-CurrentBranch {
    (git rev-parse --abbrev-ref HEAD).Trim()
}

function Invoke-PullRebase {
    # --autostash: this runs before the commit step, so uncommitted changes
    # sitting in the working tree are the normal case, not an edge case.
    # Without it, pull --rebase refuses outright on a dirty tree (exit 128,
    # "You have unstaged changes") - hit for real on this script's first
    # live run, see Build 7 Findings.
    param([string]$Branch)
    git pull --rebase --autostash origin $Branch 2>&1 | Out-String | ForEach-Object { $_.Trim() } | Where-Object { $_ } | ForEach-Object { Write-SyncLog "  $_" }
    if ($LASTEXITCODE -ne 0) {
        Write-SyncLog "pull --rebase failed (exit $LASTEXITCODE), aborting rebase to avoid leaving the repo mid-rebase."
        git rebase --abort 2>&1 | Out-Null
        return $false
    }
    return $true
}

function Test-HasRealChanges {
    git add -A | Out-Null
    git diff --cached --quiet
    return ($LASTEXITCODE -ne 0)
}

function Invoke-CommitIfNeeded {
    if (-not (Test-HasRealChanges)) {
        Write-SyncLog "No real diff to commit, clean, nothing staged."
        return $false
    }
    $summary = (git diff --cached --stat | Select-Object -Last 1)
    $commitMsg = "Auto-sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm'), $summary"
    git commit -m $commitMsg 2>&1 | Out-String | ForEach-Object { $_.Trim() } | Where-Object { $_ } | ForEach-Object { Write-SyncLog "  $_" }
    if ($LASTEXITCODE -ne 0) {
        Write-SyncLog "git commit failed (exit $LASTEXITCODE)."
        return $false
    }
    Write-SyncLog "Committed: $commitMsg"
    return $true
}

function Invoke-PushWithRebaseRetry {
    param([string]$Branch, [int]$MaxRetries = 1)

    $pushOutput = git push origin $Branch 2>&1 | Out-String
    if ($LASTEXITCODE -eq 0) {
        Write-SyncLog "Pushed cleanly to origin/$Branch."
        return $true
    }

    Write-SyncLog "Push rejected (exit $LASTEXITCODE): $($pushOutput.Trim())"

    for ($attempt = 1; $attempt -le $MaxRetries; $attempt++) {
        Write-SyncLog "Retry $attempt of $MaxRetries, pulling --rebase and retrying push."
        if (-not (Invoke-PullRebase -Branch $Branch)) {
            Write-SyncLog "CONFLICT: rebase during retry $attempt failed. Manual resolution needed."
            return $false
        }
        $pushOutput = git push origin $Branch 2>&1 | Out-String
        if ($LASTEXITCODE -eq 0) {
            Write-SyncLog "Pushed cleanly to origin/$Branch after retry $attempt."
            return $true
        }
        Write-SyncLog "Retry $attempt push also failed (exit $LASTEXITCODE): $($pushOutput.Trim())"
    }

    Write-SyncLog "CONFLICT: push failed after $MaxRetries retry/retries. Logged for manual resolution."
    return $false
}

function Invoke-GitAutoSync {
    Set-Location $VaultRoot

    if (Test-Path $LockFile) {
        $lockAge = (Get-Date) - (Get-Item $LockFile).LastWriteTime
        if ($lockAge.TotalMinutes -lt $LockStaleMinutes) {
            Write-SyncLog "Lock held (age $([math]::Round($lockAge.TotalMinutes,1)) min), another run in progress, skipping."
            exit 0
        }
        Write-SyncLog "Stale lock (age $([math]::Round($lockAge.TotalMinutes,1)) min), removing and proceeding."
        Remove-Item $LockFile -Force
    }
    New-Item -ItemType File -Path $LockFile -Force | Out-Null

    try {
        $branch = Get-CurrentBranch
        Write-SyncLog "=== git-auto-sync start (branch: $branch) ==="

        if (-not (Invoke-PullRebase -Branch $branch)) {
            Write-SyncLog "CONFLICT: initial pull --rebase failed. Manual resolution needed."
            exit 1
        }

        $committed = Invoke-CommitIfNeeded
        if (-not $committed) {
            Write-SyncLog "=== git-auto-sync end (nothing to do) ==="
            exit 0
        }

        if (-not (Invoke-PushWithRebaseRetry -Branch $branch -MaxRetries 1)) {
            Write-SyncLog "=== git-auto-sync end (FAILED, needs manual attention) ==="
            exit 1
        }

        Write-SyncLog "=== git-auto-sync end (success) ==="
        exit 0
    } finally {
        Remove-Item $LockFile -Force -ErrorAction SilentlyContinue
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    Invoke-GitAutoSync
}
