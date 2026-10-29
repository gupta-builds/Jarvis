# Claude Code SessionStart / Stop / SessionEnd hook. Runs under Windows PowerShell 5.1.
#
# Activity log: every Stop and SessionEnd appends two lines to
# ~/.claude/jarvis-session-activity.jsonl. The first is written before the
# export (event, session_id, cwd, reason, transcript_path, in_jarvis). The second
# is the outcome: {timestamp, event: "export_result", session_id, status, ms,
# error}. status is the exporter's own status (written, dup, junk, legacy, error),
# "skipped" when no export was attempted (error says why), or "no_status" when
# the exporter printed none. error is empty on success; on an exception it holds
# the exception type and the script line only, never a path or transcript text.
#
# Environment (TEST ONLY, leave unset everywhere else):
#   JARVIS_ACTIVITY_LOG     replaces the activity log path, so tests and timing
#                           runs never touch the real log.
#   JARVIS_CAPTURE_OUTROOT  read by export-claude-session.ps1 (see its header);
#                           the hook passes it through unchanged by inheritance.
#   JARVIS_EXPORT_LOCK_WAIT_MS  replaces the 25000 ms wait for the per-session
#                           export lock, so a test can reach the "export in
#                           progress" path without waiting 25 seconds.
#
# Cowork sweep failures: a Cowork transcript whose export throws leaves one
# export_result line (status "error", session_id = the transcript's basename,
# error = exception type and script line). Successes leave no line.
param()

$ErrorActionPreference = "Stop"

# Fail open: any unexpected error must end the hook with exit 0.
trap { exit 0 }

$rawInput = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($rawInput)) {
    exit 0
}

try {
    $hookInput = $rawInput | ConvertFrom-Json
} catch {
    exit 0
}

$eventName = [string]$hookInput.hook_event_name
$cwd = [string]$hookInput.cwd
$jarvisRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")).Path

function Test-IsInsideJarvis {
    param([string]$Path)

    if ([string]::IsNullOrWhiteSpace($Path)) {
        return $false
    }

    $normalizedPath = $Path.TrimEnd('\', '/').ToLowerInvariant()
    $normalizedRoot = $jarvisRoot.TrimEnd('\', '/').ToLowerInvariant()
    return ($normalizedPath -eq $normalizedRoot -or $normalizedPath.StartsWith($normalizedRoot + "\"))
}

# Appends one JSON line to the activity log. Never throws.
function Add-ActivityLine {
    param([System.Collections.IDictionary]$Entry)

    try {
        $path = if ($env:JARVIS_ACTIVITY_LOG) { $env:JARVIS_ACTIVITY_LOG } else { Join-Path (Join-Path $env:USERPROFILE ".claude") "jarvis-session-activity.jsonl" }
        $dir = Split-Path -Parent $path
        if ($dir -and -not (Test-Path -LiteralPath $dir)) {
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
        ($Entry | ConvertTo-Json -Compress) | Add-Content -LiteralPath $path -Encoding UTF8
    } catch {
        # fail open - never block session shutdown on the activity log
    }
}

if ($eventName -eq "SessionStart" -and (Test-IsInsideJarvis -Path $cwd)) {
    $context = @"
Jarvis context-pack policy:
- Read first: 60_Claude/07_AI_Information/Jarvis OS — North Star.md (strategy spine), then AGENTS.md (write contract + routing), then 40_Resources/Obsidian/Jarvis Vault Architecture.md (folder placement).
- Before writing any note: read 30_Order/ (Templates + Workflows for the note type).
- For current state: 60_Claude/07_AI_Information/AI_CONTEXT.md, 00_Dashboard.md, then tail of 60_Claude/07_AI_Information/Session Logs/log.md.
- If unsure where a note goes: write it to 60_Claude/00_Inbox/. Never invent a folder.
- Load task-specific notes only after the task is clear. Do not dump the vault.
- Skill directories live at .claude/skills/<gerund-name>/SKILL.md — load SKILL.md first, reference.md only if needed.
- Use Sonnet for normal work, reserve Opus for hard planning or stuck debugging.
- Desktop is read-first planning/review; Claude Code is the implementation surface; mobile is capture only.
"@

    @{
        hookSpecificOutput = @{
            hookEventName = "SessionStart"
            additionalContext = $context
        }
    } | ConvertTo-Json -Depth 5 -Compress

    exit 0
}

if ($eventName -eq "SessionEnd" -or $eventName -eq "Stop") {
    # Stop fires after every turn (far more reliable than SessionEnd, which
    # depends on a clean process exit that doesn't always happen). Running
    # the same export path on both events means a session is never lost to
    # an ungraceful exit - the last Stop-triggered export already has it,
    # and export-claude-session.ps1's marker-staleness check (2026-08-11)
    # makes re-running safe: it updates the same note in place as the
    # session grows rather than creating a duplicate or skipping it.
    $isJarvis = Test-IsInsideJarvis -Path $cwd
    $transcriptPath = [string]$hookInput.transcript_path
    $sessionId = [string]$hookInput.session_id

    Add-ActivityLine ([ordered]@{
        timestamp = (Get-Date).ToString("o")
        event = $eventName
        session_id = $sessionId
        cwd = $cwd
        reason = [string]$hookInput.reason
        transcript_path = $transcriptPath
        in_jarvis = $isJarvis
    })

    # Tier 1 (mechanical, ~0 tokens): auto-export this session's transcript to
    # the raw archive the moment it ends, so capture is live rather than
    # depending on a manual /export-ai-session pass. Distillation (tier 2)
    # stays manual - a hook can't invoke an LLM to synthesize a summary.
    #
    # Unconditional (no $isJarvis gate) - every Windows Claude Code project
    # (Home, Jarvis, The Plan, and anything new) gets exported and routed to
    # its own per-project folder by export-claude-session.ps1 itself, keyed
    # off the session's real cwd. Dedup is now a per-session marker file
    # inside that project folder (checked by the export script itself), not
    # a shared exported-claude-sessions.json index - so no index file to
    # read/write here at all.
    #
    # The outcome (status, elapsed ms, error) goes to the activity log before
    # the exception is swallowed, so a failed or slow export leaves a trace.
    $exportStatus = "skipped"
    $exportError = ""
    $exportSw = [System.Diagnostics.Stopwatch]::StartNew()
    try {
        $exportScript = Join-Path $jarvisRoot "30_Order\System\claude-workflow\scripts\export-claude-session.ps1"

        if (-not $sessionId) {
            $exportError = "no session_id"
        } elseif (-not $transcriptPath) {
            $exportError = "no transcript_path"
        } elseif (-not (Test-Path -LiteralPath $transcriptPath)) {
            $exportError = "transcript not found"
        } else {
            # One export per session at a time. An async Stop export can still be
            # running when the next Stop or SessionEnd fires for the same session;
            # two renders with no marker yet each write their own note, so a
            # session ended up with two. The second hook waits here (up to 25 s,
            # inside SessionEnd's 30 s timeout), then finds the marker current and
            # returns "dup". If the wait runs out, it skips and says so.
            $exportMutex = $null
            $haveLock = $false
            try {
                $mutexName = "Local\jarvis-session-export-" + ($sessionId -replace '[^A-Za-z0-9_-]', '_')
                $exportMutex = New-Object System.Threading.Mutex($false, $mutexName)
                try {
                    $lockWaitMs = 25000
                    if ($env:JARVIS_EXPORT_LOCK_WAIT_MS -match '^\d{1,6}$') { $lockWaitMs = [int]$env:JARVIS_EXPORT_LOCK_WAIT_MS }
                    $haveLock = $exportMutex.WaitOne($lockWaitMs)
                } catch [System.Threading.AbandonedMutexException] {
                    # the previous holder was killed; this thread owns the mutex now
                    $haveLock = $true
                }
            } catch {
                # no mutex available: export unlocked rather than not at all
                $haveLock = $true
                $exportMutex = $null
            }

            if (-not $haveLock) {
                $exportError = "export in progress"
            } else {
                try {
                    $exportSw.Restart()
                    $exportOutput = & $exportScript -TranscriptPath $transcriptPath -SessionId $sessionId -Cwd $cwd -SourceApp "ClaudeCode"
                    $exportStatus = "no_status"
                    if (($exportOutput | Out-String) -match '(?m)^Status:\s*(\w+)') {
                        $exportStatus = $Matches[1]
                    }
                    if ($exportStatus -eq "error") {
                        $exportError = "exporter returned status error"
                    }
                } finally {
                    if ($exportMutex) {
                        try { $exportMutex.ReleaseMutex() } catch {}
                    }
                }
            }
            if ($exportMutex) { $exportMutex.Dispose() }
        }
    } catch {
        $exportStatus = "error"
        $exportError = try {
            "$($_.Exception.GetType().Name) at $(Split-Path -Leaf $_.InvocationInfo.ScriptName):$($_.InvocationInfo.ScriptLineNumber)"
        } catch {
            "exception"
        }
        # fail open - a bad transcript must never block Claude Code from exiting
    }
    $exportSw.Stop()
    Add-ActivityLine ([ordered]@{
        timestamp = (Get-Date).ToString("o")
        event = "export_result"
        session_id = $sessionId
        status = $exportStatus
        ms = [int]$exportSw.ElapsedMilliseconds
        error = $exportError
    })

    # Cowork sweep: Cowork/Agent-Mode sessions run in fully isolated .claude
    # sandboxes under %APPDATA%\Claude\local-agent-mode-sessions and never fire
    # this hook themselves, so they can't be captured live. Piggyback on every
    # normal session end instead - "eventually consistent" within one real
    # Claude Code use, not instant, but fully automatic.
    #
    # SessionEnd only, not Stop - Stop fires after every turn, and a full
    # enumeration of the Cowork sandbox tree that often has no bearing on
    # this session's own turns is unnecessary overhead per turn. Cowork
    # sessions aren't affected by how many turns this session takes.
    #
    # No shared cowork index file either - every candidate transcript found
    # this sweep is handed to export-claude-session.ps1, which checks its own
    # per-session marker (keyed on the transcript's own basename, grouped by
    # month) and returns instantly for anything already exported.
    if ($eventName -eq "SessionEnd") {
    try {
        $coworkRoot = Join-Path $env:APPDATA "Claude\local-agent-mode-sessions"
        if (Test-Path -LiteralPath $coworkRoot) {
            $exportScript = Join-Path $jarvisRoot "30_Order\System\claude-workflow\scripts\export-claude-session.ps1"

            # Only top-level session transcripts (parent dir ends "-outputs") -
            # never .credentials.json/.claude.json siblings, never nested
            # subagents/*.jsonl or tool-results/*.json fragments.
            # Cowork transcripts nest past the 260-char MAX_PATH (observed up
            # to ~440 chars) - Get-ChildItem -Recurse silently skips these, so
            # use .NET long-path enumeration with the \\?\ prefix instead.
            $longCoworkRoot = if ($coworkRoot.StartsWith('\\?\')) { $coworkRoot } else { "\\?\$coworkRoot" }
            $candidatePaths = [System.IO.Directory]::EnumerateFiles($longCoworkRoot, "*.jsonl", [System.IO.SearchOption]::AllDirectories) |
                Where-Object { (Split-Path $_ -Parent) -like "*-outputs" }

            foreach ($fullPath in $candidatePaths) {
                try {
                    $baseName = [System.IO.Path]::GetFileNameWithoutExtension($fullPath)
                    & $exportScript -TranscriptPath $fullPath -SessionId $baseName -SourceApp "Cowork" | Out-Null
                } catch {
                    # keep sweeping the rest, but leave a trace of this one
                    $sweepError = try {
                        "$($_.Exception.GetType().Name) at $(Split-Path -Leaf $_.InvocationInfo.ScriptName):$($_.InvocationInfo.ScriptLineNumber)"
                    } catch {
                        "exception"
                    }
                    Add-ActivityLine ([ordered]@{
                        timestamp = (Get-Date).ToString("o")
                        event = "export_result"
                        session_id = $baseName
                        status = "error"
                        ms = 0
                        error = $sweepError
                    })
                }
            }
        }
    } catch {
        # fail open
    }
    }
}

exit 0

