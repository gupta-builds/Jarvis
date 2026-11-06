# Scheduled git auto-commit/push for the Jarvis vault (Build 7).
#
# Syncthing keeps the working tree converged across laptops in real time, but
# git's own history and GitHub backup only happen when someone commits. This
# script closes that gap: pull --rebase, commit a real diff if one exists,
# push, and on a rejected push (the other laptop pushed first) pull --rebase
# again and retry once before giving up and logging the conflict for a human.
#
# Operates on whatever branch is currently checked out, deliberately
# branch-agnostic. Since 2026-11-04 that branch is master, tracking
# origin/master (direct-to-master). The vault root comes from this script's own
# location (four folders up), never from a fixed path.
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
    # Another process can briefly hold this log open (found 2026-10-09: a locked append
    # dropped the "=== end (success) ===" line the health check reads), so retry.
    for ($attempt = 0; $attempt -lt 5; $attempt++) {
        try { Add-Content -Path $LogFile -Value $line -ErrorAction Stop; break }
        catch { Start-Sleep -Milliseconds 200 }
    }
}

function Get-CurrentBranch {
    (git rev-parse --abbrev-ref HEAD).Trim()
}

# Coordination with the local Syncthing instance, added after the Sep 2026 conflict-file
# incident: this script's own pull/rebase/autostash writes to the working tree are, from
# Syncthing's fs watcher, indistinguishable from a real edit. Running blind on a fixed
# 15-minute clock, independently on each laptop, raced Syncthing's own live propagation
# and manufactured .sync-conflict-* files on files nobody was actually editing. These
# helpers make each run check Syncthing's own state first (skip rather than barge in while
# a sync is still converging) and pause this machine's folder for the few seconds this
# script is actually rewriting files, so Syncthing here never offers or accepts a write on
# this folder mid-rebase. Best-effort: if Syncthing isn't installed/running, these no-op
# rather than block git from working at all.
function Get-SyncthingApiContext {
    $configPath = Join-Path $env:LOCALAPPDATA "Syncthing\config.xml"
    if (-not (Test-Path $configPath)) { return $null }
    try {
        [xml]$cfg = Get-Content $configPath
        $apikey = $cfg.configuration.gui.apikey
        if (-not $apikey) { return $null }
        return @{ Headers = @{ "X-API-Key" = $apikey }; BaseUrl = "http://127.0.0.1:8384" }
    } catch {
        return $null
    }
}

function Test-SyncthingIdle {
    param([string]$FolderId = "jarvis")
    $ctx = Get-SyncthingApiContext
    if (-not $ctx) {
        Write-SyncLog "Syncthing API not reachable, proceeding without coordination."
        return $true
    }
    try {
        $status = Invoke-RestMethod -Uri "$($ctx.BaseUrl)/rest/db/status?folder=$FolderId" -Headers $ctx.Headers -TimeoutSec 5
        $idle = ($status.state -eq "idle") -and ($status.needBytes -eq 0) -and ($status.errors -eq 0)
        if (-not $idle) {
            Write-SyncLog "Syncthing not idle (state=$($status.state), needBytes=$($status.needBytes), errors=$($status.errors)), skipping this run."
        }
        return $idle
    } catch {
        Write-SyncLog "Syncthing status check failed ($($_.Exception.Message)), proceeding without coordination."
        return $true
    }
}

$HotFileThresholdSeconds = 20

function Test-AnyFileRecentlyModified {
    # Guards against a narrower variant of the Syncthing race above: this script's own
    # `git add -A` / `git commit` reads and hashes every dirty file's on-disk bytes, which
    # is indistinguishable in effect from Syncthing's checkout writes - if Obsidian (or any
    # editor) is mid-save to that exact file when this read happens, Windows can throw a
    # sharing violation on Obsidian's side ("UNKNOWN: unknown error, open ..."). Found live
    # 2026-10-19: a brand-new, never-yet-committed note was actively being typed into at the
    # same minute this script's 30-minute tick ran `git add -A` over a 498-insertion, 6-file
    # batch; the commit itself succeeded on the snapshot it saw, and the existing
    # Test-HasRealChanges check correctly caught the file going dirty again immediately after
    # (logged "FAILED, local changes could not be committed", no corruption), but the read
    # during `git add -A` still collided with Obsidian's write and produced the save-failure
    # spam the user saw. Checking each dirty path's LastWriteTime before touching anything,
    # and deferring to the next tick if any file was written to within the last
    # $HotFileThresholdSeconds seconds, avoids starting that race at all - same "defer rather
    # than barge in" pattern as Test-SyncthingIdle and Test-GitIndexLocked above.
    param([string]$VaultRoot)
    $raw = git status --porcelain 2>$null
    if (-not $raw) { return $false }
    $now = Get-Date
    foreach ($line in $raw) {
        if ($line.Length -lt 4) { continue }
        $pathPart = $line.Substring(3)
        $paths = if ($pathPart -match ' -> ') { $pathPart -split ' -> ' } else { @($pathPart) }
        foreach ($p in $paths) {
            $p = $p.Trim().Trim('"')
            $full = Join-Path $VaultRoot $p
            if (-not (Test-Path -LiteralPath $full -PathType Leaf)) { continue }
            # -Force: a hidden tracked file (.stignore) otherwise throws here and the run died
            # silently with no end line (found 2026-11-05).
            $age = ($now - (Get-Item -LiteralPath $full -Force).LastWriteTime).TotalSeconds
            if ($age -lt $HotFileThresholdSeconds) {
                Write-SyncLog "File '$p' was written to $([math]::Round($age,1))s ago (under the ${HotFileThresholdSeconds}s threshold), deferring this run rather than racing an in-progress save."
                return $true
            }
        }
    }
    return $false
}

function Set-SyncthingFolderPaused {
    param([bool]$Paused, [string]$FolderId = "jarvis")
    $ctx = Get-SyncthingApiContext
    if (-not $ctx) { return }
    try {
        $body = @{ paused = $Paused } | ConvertTo-Json
        Invoke-RestMethod -Uri "$($ctx.BaseUrl)/rest/config/folders/$FolderId" -Headers $ctx.Headers -Method Patch -Body $body -ContentType "application/json" -TimeoutSec 5 | Out-Null
        Write-SyncLog "Syncthing folder '$FolderId' paused=$Paused"
    } catch {
        Write-SyncLog "Could not set Syncthing folder paused=$Paused ($($_.Exception.Message))."
    }
}

function Invoke-PullRebase {
    # --autostash: this runs before the commit step, so uncommitted changes
    # sitting in the working tree are the normal case, not an edge case.
    # Without it, pull --rebase refuses outright on a dirty tree (exit 128,
    # "You have unstaged changes") - hit for real on this script's first
    # live run, see Build 7 Findings.
    param([string]$Branch)
    $output = git pull --rebase --autostash origin $Branch 2>&1 | ForEach-Object { $_.ToString() } | Out-String
    $output.Trim() -split "`r?`n" | Where-Object { $_ } | ForEach-Object { Write-SyncLog "  $_" }
    if ($LASTEXITCODE -ne 0) {
        # "untracked working tree files would be overwritten" happens when a note
        # was created locally (by Obsidian, Claude Code, anything) but never
        # committed, and the OTHER laptop independently created and already pushed
        # a commit touching that exact path - git refuses to silently clobber an
        # untracked local file. Observed live 2026-10-06/07: this aborted three
        # runs in a row (22:03/22:33/23:03) before silently resolving itself only
        # because obsidian-git's own 2-minute auto-commit happened to absorb the
        # untracked file into a real commit in between - a dependency that no
        # longer exists now that auto-commit is intentionally disabled (see
        # Failure Mode 5's 2026-10-07 update). Fix: commit the untracked local
        # file(s) as their own real commit first, then retry the pull once -
        # exactly what obsidian-git was accidentally doing, done deliberately and
        # logged instead of relying on luck and a second process's timing.
        if ($output -match 'untracked working tree files would be overwritten') {
            Write-SyncLog "Untracked local file(s) collide with an incoming commit - committing them locally first, then retrying the pull once."
            git rebase --abort 2>&1 | Out-Null
            $null = Invoke-GitAddAll
            git diff --cached --quiet
            if ($LASTEXITCODE -ne 0) {
                git commit -m "Auto-sync: pre-pull commit of untracked file(s) colliding with an incoming change" 2>&1 | ForEach-Object { $_.ToString() } | Out-String | ForEach-Object { $_.Trim() } | Where-Object { $_ } | ForEach-Object { Write-SyncLog "  $_" }
                $retry = git pull --rebase --autostash origin $Branch 2>&1 | ForEach-Object { $_.ToString() } | Out-String
                $retry.Trim() -split "`r?`n" | Where-Object { $_ } | ForEach-Object { Write-SyncLog "  $_" }
                if ($LASTEXITCODE -eq 0) { return $true }
                Write-SyncLog "Retry after untracked-file commit still failed (exit $LASTEXITCODE)."
            } else {
                Write-SyncLog "Expected untracked files to stage but none did - unexpected state, falling through to normal failure handling."
            }
        }
        Write-SyncLog "pull --rebase failed (exit $LASTEXITCODE), aborting rebase to avoid leaving the repo mid-rebase."
        git rebase --abort 2>&1 | Out-Null
        return $false
    }
    return $true
}

function Get-ConflictMarkerFiles {
    # Only ever checks files currently DIRTY against HEAD (git diff --name-only) -
    # never the whole tree. A whole-tree `git grep` false-positives on any file that
    # legitimately contains conflict-marker-shaped text as documented/example
    # content - this vault has several: obsidian-git's own shipped main.js embeds a
    # literal <<<<<<< HEAD / >>>>>>> origin/main example string in its own
    # conflict-help text, and multiple AI-conversation clippings quote past
    # incidents verbatim. Caught live 2026-10-07: this guard's first real run
    # flagged 11 files, 10 of which were this exact false positive, which would
    # have permanently blocked every future sync (those files never change) -
    # worse than the corruption bug this guard exists to catch. Restricting to
    # currently-dirty files keeps the real case (an autostash-pop conflict always
    # leaves the conflicted file modified-but-uncommitted) while dropping clean,
    # already-committed files from consideration entirely.
    # Checks what the current diff itself ADDS (lines prefixed +), not whether the
    # file contains marker-shaped text anywhere - several vault files legitimately
    # have pre-existing lines like this (quoted history) untouched by today's edit,
    # and flagging on mere presence would re-trigger every time any of those files
    # changes for an unrelated reason. A real autostash-pop conflict always INSERTS
    # new marker lines relative to HEAD, so this stays precise for the real case.
    # Requires the <<<<<<< opening marker specifically, not just any one of the
    # three in isolation. Caught live 2026-10-07: a live-appended AI-conversation
    # export (WSL/Claude Code/10-07 Wsl-host-step.ps1 sparse VHD failure.md) added a
    # bare "=======" line as part of its own genuine content (no accompanying
    # <<<<<<</>>>>>>> anywhere in the file) and tripped this check on every tick for
    # 30+ minutes straight, blocking real commits over a non-conflict. A real
    # autostash-pop conflict always inserts <<<<<<< first - nothing in ordinary
    # prose, code, or transcripts does - so anchoring on that marker alone stays
    # precise for the real case while dropping this false-positive shape entirely.
    $dirtyFiles = @(git diff --name-only 2>$null | Where-Object { $_ })
    $hits = [System.Collections.Generic.List[string]]::new()
    foreach ($f in $dirtyFiles) {
        if (-not (Test-Path -LiteralPath $f)) { continue }
        $addedMarkerLine = git diff -- "$f" 2>$null | Where-Object { $_ -match '^\+<{7}( |$)' }
        if ($addedMarkerLine) { $hits.Add($f) }
    }
    return $hits
}

function Test-WorkingTreeHasConflictMarkers {
    # pull --rebase --autostash can report success on the rebase itself while its own
    # autostash-pop step conflicts underneath it - git writes literal <<<<<<< Updated
    # upstream / ======= / >>>>>>> Stashed changes markers into the working tree file
    # in that case, but does not fail the wrapping command's exit code, so
    # Invoke-PullRebase never saw it. The incident this guards against is the
    # Pointers and Addresses.md corruption, 2026-10-06: three separate auto-sync
    # runs each committed one more nested layer of markers because nothing between
    # the pull and the commit ever looked at actual file content.
    return (Get-ConflictMarkerFiles).Count -gt 0
}

function Invoke-GitAddAll {
    # Stages everything and, when git refuses, logs git's own error text and the
    # offending path. Before 2026-11-05 this output was thrown away, so a file git
    # cannot index (a stray file named nul, con or aux on Windows, found 2026-11-04)
    # only showed up as "local changes could not be committed" with no reason.
    $out = @(git add -A 2>&1 | ForEach-Object { $_.ToString() })
    $exit = $LASTEXITCODE
    if ($exit -ne 0) {
        Write-SyncLog "git add -A failed (exit $exit):"
        foreach ($line in $out) {
            if ($line -and $line -notmatch '^warning: in the working copy') { Write-SyncLog "  $line" }
        }
        $paths = @($out | ForEach-Object {
            if ($_ -match "unable to index file '([^']+)'") { $Matches[1] }
            elseif ($_ -match 'error: open\("([^"]+)"\)') { $Matches[1] }
            elseif ($_ -match "error: '([^']+)' does not have a commit checked out") { $Matches[1] }
        } | Select-Object -Unique)
        foreach ($p in $paths) { Write-SyncLog "  offending path: $p" }
    }
    return ($exit -eq 0)
}

function Test-HasRealChanges {
    $null = Invoke-GitAddAll
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
    git commit -m $commitMsg 2>&1 | ForEach-Object { $_.ToString() } | Out-String | ForEach-Object { $_.Trim() } | Where-Object { $_ } | ForEach-Object { Write-SyncLog "  $_" }
    if ($LASTEXITCODE -ne 0) {
        Write-SyncLog "git commit failed (exit $LASTEXITCODE)."
        return $false
    }
    Write-SyncLog "Committed: $commitMsg"
    return $true
}

function Invoke-PushWithRebaseRetry {
    param([string]$Branch, [int]$MaxRetries = 1)

    $pushOutput = git push origin $Branch 2>&1 | ForEach-Object { $_.ToString() } | Out-String
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
        $pushOutput = git push origin $Branch 2>&1 | ForEach-Object { $_.ToString() } | Out-String
        if ($LASTEXITCODE -eq 0) {
            Write-SyncLog "Pushed cleanly to origin/$Branch after retry $attempt."
            return $true
        }
        Write-SyncLog "Retry $attempt push also failed (exit $LASTEXITCODE): $($pushOutput.Trim())"
    }

    Write-SyncLog "CONFLICT: push failed after $MaxRetries retry/retries. Logged for manual resolution."
    return $false
}

function Test-GitIndexLocked {
    # obsidian-git runs real `git` child processes from inside Obsidian itself
    # (status poll every 7s, auto-commit every 2min, via the simple-git library -
    # confirmed in .obsidian/plugins/obsidian-git/main.js), completely uncoordinated
    # with this script. If that poll or auto-commit is mid-flight when this script's
    # own pull --rebase starts, the two git processes race .git/index.lock - at best
    # one fails cleanly, at worst obsidian-git's own error handling for "another git
    # process is running" is the thing that has been taking the whole Jarvis Obsidian
    # window down to a blank render (2026-10-07 incident). Checking for the lock
    # before touching anything costs nothing and avoids starting that race at all.
    param([string]$VaultRoot)
    return (Test-Path (Join-Path $VaultRoot ".git\index.lock"))
}

function Remove-TrackedSkillAliases {
    # Each laptop owns its Git index. A synced ignore file cannot untrack an
    # already tracked junction there, so repair only verified canonical aliases.
    foreach ($skillRoot in @('.claude/skills', '.opencode/skills')) {
        $rootPath = Join-Path $VaultRoot $skillRoot
        if (-not (Test-Path -LiteralPath $rootPath)) { continue }
        foreach ($alias in @(Get-ChildItem -LiteralPath $rootPath -Directory | Where-Object LinkType -eq 'Junction')) {
            $targetValue = @($alias.Target)[0]
            $target = [IO.Path]::GetFullPath([string]$targetValue)
            $canonicalRoot = [IO.Path]::GetFullPath((Join-Path $VaultRoot 'copilot/skills')) + [IO.Path]::DirectorySeparatorChar
            if (-not $target.StartsWith($canonicalRoot, [StringComparison]::OrdinalIgnoreCase)) { continue }
            $relative = $skillRoot + '/' + $alias.Name
            git check-ignore --no-index --quiet -- ($relative + '/')
            if ($LASTEXITCODE -ne 0) { continue }
            $tracked = @(git ls-files -- $relative)
            if ($tracked.Count -eq 0) { continue }
            $canonical = $target.Substring($VaultRoot.TrimEnd('\').Length + 1).Replace('\', '/')
            if (@(git ls-files -- $canonical).Count -eq 0) {
                throw "Refusing to untrack $relative because its canonical target is not tracked."
            }
            git rm -r --cached --ignore-unmatch -- $relative | Out-Null
            if ($LASTEXITCODE -ne 0) { throw "Could not untrack duplicate alias $relative." }
            Write-SyncLog "Untracked duplicate junction $relative; physical files and canonical target retained."
        }
    }
}

function Get-UnsafeNames {
    # Read-only pre-flight (2026-11-05). On Windows a file named nul, con, prn, aux, com1-9
    # or lpt1-9 (with or without an extension), a name ending in a dot or a space, or a name
    # with an illegal character makes `git add -A` abort, and every later run then ends
    # FAILED until someone removes it (a stray nul stopped the sync on 2026-11-04). This only
    # lists such names. It never deletes or renames anything.
    param([string]$Root)
    $reserved = '^(con|prn|aux|nul|com[1-9]|lpt[1-9])(\..*)?$'
    $found = [System.Collections.Generic.List[string]]::new()
    $stack = [System.Collections.Generic.Stack[string]]::new()
    $stack.Push($Root)
    while ($stack.Count -gt 0) {
        $dir = $stack.Pop()
        foreach ($entry in [System.IO.Directory]::EnumerateFileSystemEntries($dir)) {
            $name = [System.IO.Path]::GetFileName($entry)
            if ($name -match $reserved -or $name -match '[. ]$' -or $name -match '[<>:"|?*\x00-\x1f]') {
                $found.Add($entry)
            }
            if ([System.IO.Directory]::Exists($entry) -and @('.git', '.stversions', 'node_modules') -notcontains $name) {
                if (-not ([System.IO.File]::GetAttributes($entry) -band [System.IO.FileAttributes]::ReparsePoint)) { $stack.Push($entry) }
            }
        }
    }
    return $found
}

function Invoke-LogCap {
    # Called inside the run lock, so nothing else is appending. Past $MaxBytes the whole log
    # moves to git-auto-sync.log.1 (one previous generation, replaced each time) and only the
    # newest $KeepLines lines stay in git-auto-sync.log. Both files are in .gitignore and .stignore.
    param([int64]$MaxBytes = 1048576, [int]$KeepLines = 2000)
    try {
        if (-not (Test-Path -LiteralPath $LogFile)) { return }
        $size = (Get-Item -LiteralPath $LogFile).Length
        if ($size -le $MaxBytes) { return }
        # Byte level on purpose: older lines were written in a legacy code page and must not be re-decoded.
        $bytes = [System.IO.File]::ReadAllBytes($LogFile)
        $seen = 0
        $start = 0
        for ($i = $bytes.Length - 2; $i -ge 0; $i--) {
            if ($bytes[$i] -eq 10) {
                $seen++
                if ($seen -ge $KeepLines) { $start = $i + 1; break }
            }
        }
        Copy-Item -LiteralPath $LogFile -Destination "$LogFile.1" -Force
        $tmp = "$LogFile.tmp"
        $keep = New-Object byte[] ($bytes.Length - $start)
        [System.Array]::Copy($bytes, $start, $keep, 0, $keep.Length)
        [System.IO.File]::WriteAllBytes($tmp, $keep)
        Move-Item -LiteralPath $tmp -Destination $LogFile -Force
        Write-SyncLog "Log capped: was $([math]::Round($size / 1KB)) KB, kept the newest $KeepLines lines, previous generation in git-auto-sync.log.1."
    } catch {
        Write-SyncLog "Log cap failed (non-fatal): $($_.Exception.Message)"
    }
}

function Invoke-GitAutoSync {
    Set-Location $VaultRoot

    # Idempotent, cheap to set every run: without it, the pull --rebase/merge
    # steps below compare raw stored blobs instead of EOL-normalized content,
    # so a CRLF-vs-LF difference between the two laptops (e.g. one laptop's
    # editor writes CRLF) looks like a full-file conflict even when the real
    # text is identical. Self-configures both laptops without a manual step.
    git config merge.renormalize true

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
    Invoke-LogCap

    $pausedSyncthing = $false
    try {
        $branch = Get-CurrentBranch
        Write-SyncLog "=== git-auto-sync start (branch: $branch) ==="

        if (Test-GitIndexLocked -VaultRoot $VaultRoot) {
            Write-SyncLog "git's own index.lock is held (most likely obsidian-git's own background commit/status poll mid-operation), deferring to next tick rather than racing it."
            Write-SyncLog "=== git-auto-sync end (deferred, git index locked) ==="
            exit 0
        }

        $unsafeNames = @(Get-UnsafeNames -Root "$VaultRoot")
        if ($unsafeNames.Count -gt 0) {
            Write-SyncLog "Files git cannot add (Windows reserved or unsafe names). Nothing was deleted or renamed; remove or rename them by hand:"
            foreach ($u in ($unsafeNames | Select-Object -First 20)) { Write-SyncLog "  $u" }
            Write-SyncLog "=== git-auto-sync end (FAILED, unsafe file name: $($unsafeNames[0])) ==="
            exit 1
        }

        if (-not (Test-SyncthingIdle)) {
            Write-SyncLog "=== git-auto-sync end (deferred, Syncthing still converging) ==="
            exit 0
        }

        if (Test-AnyFileRecentlyModified -VaultRoot $VaultRoot) {
            Write-SyncLog "=== git-auto-sync end (deferred, a dirty file was just written to) ==="
            exit 0
        }

        # Pause this machine's Syncthing folder for the duration of our own working-tree
        # writes (rebase checkout, autostash pop) so it never races an inbound or outbound
        # transfer on the same files. Always resumed in the finally block below.
        Set-SyncthingFolderPaused -Paused $true
        $pausedSyncthing = $true

        Remove-TrackedSkillAliases

        # Save local edits before a pull can rewrite the working tree.
        if (Test-WorkingTreeHasConflictMarkers) {
            Write-SyncLog "=== git-auto-sync end (FAILED, existing conflict markers) ==="
            exit 1
        }
        $null = Invoke-CommitIfNeeded
        git diff --quiet
        $unstaged = $LASTEXITCODE
        git diff --cached --quiet
        $staged = $LASTEXITCODE
        if (($unstaged -ne 0) -or ($staged -ne 0)) {
            # Say which files are left, so the log shows the cause (2026-11-05).
            Write-SyncLog "Left after the commit step: unstaged changes=$($unstaged -ne 0), staged changes=$($staged -ne 0). git status (first 15 paths):"
            @(git status --short 2>&1 | ForEach-Object { $_.ToString() } | Select-Object -First 15) | ForEach-Object { Write-SyncLog "  $_" }
            Write-SyncLog "=== git-auto-sync end (FAILED, local changes could not be committed) ==="
            exit 1
        }

        if (-not (Invoke-PullRebase -Branch $branch)) {
            # Found 2026-10-08: this path, and the one below it, were the only two
            # exit paths in this whole function that never wrote a matching
            # "=== git-auto-sync end ===" line - every other path does. Because
            # check-syncthing-status.ps1's own FAILED-detector (added 2026-10-07)
            # only checks the most recent "=== git-auto-sync end" line, a failure
            # on either of these two paths was completely invisible to it: this
            # exact rebase conflict repeated every 30 minutes for roughly 25 hours
            # straight (69 occurrences across this log's full history) with
            # consecutiveFailures staying at 0 and the Dashboard banner empty the
            # entire time. The missing log line, not the detector's regex, was the
            # actual gap - fixed here so any future failure path added to this
            # function stays visible by construction, not by remembering to extend
            # a regex somewhere else every time.
            Write-SyncLog "CONFLICT: initial pull --rebase failed. Manual resolution needed."
            Write-SyncLog "=== git-auto-sync end (FAILED, pull --rebase conflict) ==="
            exit 1
        }

        $conflictFiles = Get-ConflictMarkerFiles
        if ($conflictFiles.Count -gt 0) {
            Write-SyncLog "CONFLICT: pull --rebase --autostash reported success but left unresolved merge markers in currently-dirty file(s): $($conflictFiles -join ', '). This is a failed autostash pop, not a clean rebase - refusing to commit broken content. The conflicting stash is preserved in 'git stash list' for manual resolution."
            Write-SyncLog "=== git-auto-sync end (FAILED, autostash-pop conflict markers) ==="
            exit 1
        }

        $committed = Invoke-CommitIfNeeded
        # Retry publishing commits preserved by a previous failed run too.
        $ahead = [int](git rev-list --count "origin/$branch..HEAD")
        if ((-not $committed) -and ($ahead -eq 0)) {
            Write-SyncLog "=== git-auto-sync end (nothing to do) ==="
            exit 0
        }

        if (-not (Invoke-PushWithRebaseRetry -Branch $branch -MaxRetries 1)) {
            Write-SyncLog "=== git-auto-sync end (FAILED, needs manual attention) ==="
            exit 1
        }

        Write-SyncLog "=== git-auto-sync end (success) ==="
        exit 0
    } catch {
        # Any unexpected error used to end the run with no end line and exit code 0, which the
        # health check cannot see. Log it and fail loudly instead.
        Write-SyncLog "Unexpected error at script line $($_.InvocationInfo.ScriptLineNumber): $($_.Exception.Message)"
        Write-SyncLog "=== git-auto-sync end (FAILED, unexpected error) ==="
        exit 1
    } finally {
        if ($pausedSyncthing) {
            Set-SyncthingFolderPaused -Paused $false
        }
        Remove-Item $LockFile -Force -ErrorAction SilentlyContinue
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    Invoke-GitAutoSync
}
