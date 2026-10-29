# Tests hooks\jarvis-session-continuity.ps1 as Claude Code runs it: a child
# shell, JSON on stdin, exit code and activity log checked. Uses synthetic
# transcripts only, and both test overrides (JARVIS_ACTIVITY_LOG,
# JARVIS_CAPTURE_OUTROOT), so nothing touches the vault or the real log.
# The hook runs in the same shell edition as this test (run-all-tests.ps1 runs
# the test under pwsh and under Windows PowerShell 5.1).
# Cases: empty stdin, garbage stdin, a missing transcript path, a valid
# transcript, and a transcript whose export throws.

$ErrorActionPreference = "Stop"

$hook = (Resolve-Path (Join-Path $PSScriptRoot "..\hooks\jarvis-session-continuity.ps1")).Path
$exe = if ($PSVersionTable.PSEdition -eq 'Core') { 'pwsh' } else { 'powershell' }

$work = Join-Path $env:TEMP "session-hook-test-$(Get-Random)"
$srcDir = Join-Path $work "src"
$outRoot = Join-Path $work "out"
$logPath = Join-Path $work "activity.jsonl"
New-Item -ItemType Directory -Path $srcDir, $outRoot -Force | Out-Null

$fail = 0
function Assert($label, [bool]$ok) {
    if ($ok) { Write-Output "PASS: $label" }
    else { Write-Output "FAIL: $label"; $script:fail++ }
}

$utf8 = New-Object System.Text.UTF8Encoding($false)
function ConvertTo-Line($o) { $o | ConvertTo-Json -Depth 10 -Compress }

# Runs the hook with $Stdin, the overrides set for the child, and returns the exit code.
function Invoke-Hook([string]$Stdin, [string]$OutRoot = $outRoot) {
    $env:JARVIS_ACTIVITY_LOG = $logPath
    $env:JARVIS_CAPTURE_OUTROOT = $OutRoot
    try {
        $Stdin | & $exe -NoProfile -ExecutionPolicy Bypass -File $hook | Out-Null
        return $LASTEXITCODE
    }
    finally {
        Remove-Item Env:JARVIS_ACTIVITY_LOG, Env:JARVIS_CAPTURE_OUTROOT -ErrorAction SilentlyContinue
    }
}
function Get-LogLines { if (Test-Path -LiteralPath $logPath) { @(Get-Content -LiteralPath $logPath -Encoding UTF8 | ForEach-Object { $_ | ConvertFrom-Json }) } else { @() } }
function Get-Results { @(Get-LogLines | Where-Object { $_.event -eq 'export_result' }) }
function Reset-Log { Remove-Item -LiteralPath $logPath -ErrorAction SilentlyContinue }
function New-HookJson($event, $sid, $tp) {
    ConvertTo-Line @{ hook_event_name = $event; session_id = $sid; transcript_path = $tp; cwd = "E:\code\hook-test-proj"; reason = "other" }
}

# ---- empty stdin: exit 0, nothing logged ------------------------------------
Reset-Log
$code = Invoke-Hook ""
Assert "empty stdin: exit 0" ($code -eq 0)
Assert "empty stdin: nothing logged" (@(Get-LogLines).Count -eq 0)

# ---- garbage stdin: exit 0, nothing logged ----------------------------------
Reset-Log
$code = Invoke-Hook "this is {not json"
Assert "garbage stdin: exit 0" ($code -eq 0)
Assert "garbage stdin: nothing logged" (@(Get-LogLines).Count -eq 0)

# ---- missing transcript path: exit 0, a skipped result with a reason --------
Reset-Log
$missing = Join-Path $srcDir "does-not-exist.jsonl"
$code = Invoke-Hook (New-HookJson "Stop" "hook-test-missing" $missing)
$res = @(Get-Results)
Assert "missing transcript: exit 0" ($code -eq 0)
Assert "missing transcript: one export_result" ($res.Count -eq 1)
Assert "missing transcript: status skipped, error says why" ($res.Count -eq 1 -and $res[0].status -eq "skipped" -and $res[0].error -eq "transcript not found")
Assert "missing transcript: no note written" (-not (Test-Path -LiteralPath (Join-Path $outRoot "hook-test-proj")))

# ---- valid transcript: written, then dup; fields exact; no transcript text --
Reset-Log
$cwdProj = "E:\code\hook-test-proj"
$sidOk = "hook-test-valid"
$tOk = Join-Path $srcDir "$sidOk.jsonl"
$secret = "TRANSCRIPT_TEXT_MUST_NOT_REACH_THE_LOG"
$lines = @(
    (ConvertTo-Line @{ type = "user"; uuid = "u-1"; timestamp = "2026-10-22T12:00:00Z"; cwd = $cwdProj; message = @{ role = "user"; content = $secret } }),
    (ConvertTo-Line @{ type = "assistant"; uuid = "a-1"; timestamp = "2026-10-22T12:00:01Z"; cwd = $cwdProj; message = @{ id = "m1"; role = "assistant"; model = "claude-sonnet-5"; content = @(@{ type = "text"; text = "reply" }); usage = @{ input_tokens = 10; output_tokens = 5 } } })
)
[System.IO.File]::WriteAllLines($tOk, [string[]]$lines, $utf8)
$code1 = Invoke-Hook (New-HookJson "Stop" $sidOk $tOk)
$code2 = Invoke-Hook (New-HookJson "SessionEnd" $sidOk $tOk)
$res = @(Get-Results)
Assert "valid transcript: both runs exit 0" ($code1 -eq 0 -and $code2 -eq 0)
Assert "valid transcript: two export_result lines" ($res.Count -eq 2)
Assert "valid transcript: first run written" ($res.Count -ge 1 -and $res[0].status -eq "written" -and $res[0].error -eq "")
Assert "valid transcript: second run dup" ($res.Count -ge 2 -and $res[1].status -eq "dup")
$fields = if ($res.Count -ge 1) { ($res[0].PSObject.Properties.Name -join ",") } else { "" }
Assert "valid transcript: fields are timestamp,event,session_id,status,ms,error" ($fields -eq "timestamp,event,session_id,status,ms,error")
Assert "valid transcript: session_id matches and ms is a number" ($res.Count -ge 1 -and $res[0].session_id -eq $sidOk -and $res[0].ms -is [ValueType] -and $res[0].ms -ge 0)
Assert "valid transcript: the Stop line is still written before the result" (@(Get-LogLines)[0].event -eq "Stop")
Assert "valid transcript: note exists in the override out root" (@(Get-ChildItem -LiteralPath (Join-Path $outRoot "hook-test-proj") -Filter "*.md" -File | Where-Object { $_.Name -notlike "00 - *" }).Count -eq 1)
Assert "valid transcript: no transcript text in the log" (-not ((Get-Content -LiteralPath $logPath -Raw -Encoding UTF8).Contains($secret)))

# ---- export throws: out root is a file, so creating the project folder fails -
Reset-Log
$badRoot = Join-Path $work "out-is-a-file"
[System.IO.File]::WriteAllText($badRoot, "not a folder", $utf8)
$code = Invoke-Hook (New-HookJson "Stop" "hook-test-throw" $tOk) $badRoot
$res = @(Get-Results)
Assert "exporter throws: exit 0" ($code -eq 0)
Assert "exporter throws: one export_result" ($res.Count -eq 1)
Assert "exporter throws: status error with a non-empty error" ($res.Count -eq 1 -and $res[0].status -eq "error" -and -not [string]::IsNullOrWhiteSpace($res[0].error))
Assert "exporter throws: error holds no path" ($res.Count -eq 1 -and $res[0].error -notmatch '[A-Za-z]:[\\/]')

# ---- cleanup (remove junctions by themselves first, never recurse through them) ----
Get-ChildItem -LiteralPath $outRoot -Recurse -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint } | ForEach-Object { [System.IO.Directory]::Delete($_.FullName) }
Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL SESSION HOOK CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail SESSION HOOK CHECK(S) FAILED ==="; exit 1 }
