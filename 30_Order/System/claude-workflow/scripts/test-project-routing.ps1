# Regression test for exporter project misrouting: a session whose cwd moves into a
# vault subfolder (or whose derivation differs between the Stop hook's live cwd and
# the backfill's first cwd) must keep landing in ONE project folder, never a second
# sibling folder with a duplicate note.

$ErrorActionPreference = "Stop"

. (Join-Path $PSScriptRoot "export-claude-session.ps1")

$work = Join-Path $env:TEMP "project-routing-test-$(Get-Random)"
$srcDir = Join-Path $work "src"
$OutRoot = Join-Path $work "out"
New-Item -ItemType Directory -Path $srcDir, $OutRoot -Force | Out-Null

$fail = 0
function Check($label, $actual, $expected) {
    if ($actual -eq $expected) { Write-Output "PASS: $label ($actual)" }
    else { Write-Output "FAIL: $label (got '$actual', want '$expected')"; $script:fail++ }
}

# ---- pure name derivation ----------------------------------------------------
$planRoot = Join-Path (Split-Path $VaultRoot -Parent) "The Plan"
Check "vault root -> Jarvis" (Get-ProjectName $VaultRoot) "Jarvis"
Check "vault root trailing slash -> Jarvis" (Get-ProjectName ($VaultRoot + "\")) "Jarvis"
Check "vault subfolder -> Jarvis" (Get-ProjectName (Join-Path $VaultRoot "20_Progress\Projects\AI Use\Conversations")) "Jarvis"
Check "vault subfolder, different case -> Jarvis" (Get-ProjectName ((Join-Path $VaultRoot "30_Order\System\sync-workflow").ToUpperInvariant())) "Jarvis"
Check "The Plan root -> The Plan" (Get-ProjectName $planRoot) "The Plan"
Check "The Plan subfolder -> The Plan" (Get-ProjectName (Join-Path $planRoot "00_Live")) "The Plan"
Check "sibling with Jarvis prefix is not Jarvis" (Get-ProjectName ($VaultRoot + "-old\x")) "x"
Check "user profile -> Home" (Get-ProjectName $env:USERPROFILE) "Home"
Check "folder inside profile is its own project" (Get-ProjectName (Join-Path $env:USERPROFILE "some-repo")) "some-repo"
Check "unrelated path -> leaf" (Get-ProjectName "E:\code\my-app") "my-app"
Check "empty -> Unknown" (Get-ProjectName "") "Unknown"

# ---- session whose cwd changes between exports -----------------------------------
function New-Transcript($path, $extraTurns) {
    $l = New-Object System.Collections.Generic.List[string]
    $l.Add((@{ type = "user"; uuid = "u0"; timestamp = "2026-10-22T10:00:00Z"; cwd = $VaultRoot; message = @{ role = "user"; content = "hello" } } | ConvertTo-Json -Depth 6 -Compress))
    for ($i = 0; $i -le $extraTurns; $i++) {
        $msg = @{ id = "msg_$i"; role = "assistant"; model = "claude-sonnet-5"; content = @(@{ type = "text"; text = "reply $i" }); usage = @{ input_tokens = 1; output_tokens = 1 } }
        $l.Add((@{ type = "assistant"; uuid = "a$i"; timestamp = "2026-10-22T10:0$($i + 1):00Z"; cwd = $VaultRoot; message = $msg } | ConvertTo-Json -Depth 8 -Compress))
    }
    [System.IO.File]::WriteAllLines($path, $l, (New-Object System.Text.UTF8Encoding($false)))
}

$sid = "route-test-001"
$t = Join-Path $srcDir "$sid.jsonl"
New-Transcript $t 0
$sub = Join-Path $VaultRoot "20_Progress\Projects\AI Use\Conversations"
$r1 = Export-Session -TranscriptPathIn $t -SessionIdIn $sid -CwdIn $sub -SourceAppIn "ClaudeCode"
Check "first export from a vault subfolder -> Jarvis folder" (Split-Path $r1.ProjectDir -Leaf) "Jarvis"

New-Transcript $t 1
(Get-Item -LiteralPath $t).LastWriteTimeUtc = (Get-Date).ToUniversalTime().AddMinutes(5)
$r2 = Export-Session -TranscriptPathIn $t -SessionIdIn $sid -CwdIn "E:\somewhere\else" -SourceAppIn "ClaudeCode"
Check "re-export with a different cwd stays in the same folder" $r2.ProjectDir $r1.ProjectDir
Check "re-export updated in place" $r2.Status "written"
Check "exactly one project folder created" @(Get-ChildItem -LiteralPath $OutRoot -Directory).Count 1
Check "exactly one note for the session" @(Get-ChildItem -LiteralPath $OutRoot -Recurse -Filter "*.md" -File).Count 1

# ---- pre-existing duplicate (the Acer case): markers in two folders, newest wins -----
$sid2 = "route-test-002"
$t2 = Join-Path $srcDir "$sid2.jsonl"
New-Transcript $t2 0
foreach ($p in @("Conversations", "Jarvis")) {
    New-Item -ItemType Directory -Path (Join-Path $OutRoot "$p\.exported") -Force | Out-Null
    Set-Content -LiteralPath (Join-Path $OutRoot "$p\.exported\$sid2.done") -Value "old note.md"
    Set-Content -LiteralPath (Join-Path $OutRoot "$p\old note.md") -Value "---`nsession_id: $sid2`n---`nold"
}
(Get-Item -LiteralPath (Join-Path $OutRoot "Conversations\.exported\$sid2.done")).LastWriteTimeUtc = (Get-Date).ToUniversalTime().AddMinutes(-30)
(Get-Item -LiteralPath (Join-Path $OutRoot "Jarvis\.exported\$sid2.done")).LastWriteTimeUtc = (Get-Date).ToUniversalTime().AddMinutes(-10)
(Get-Item -LiteralPath $t2).LastWriteTimeUtc = (Get-Date).ToUniversalTime()
$r3 = Export-Session -TranscriptPathIn $t2 -SessionIdIn $sid2 -CwdIn $VaultRoot -SourceAppIn "ClaudeCode"
Check "two existing markers -> newest folder wins" (Split-Path $r3.ProjectDir -Leaf) "Jarvis"
Check "stale sibling copy is not touched" ((Get-Content -LiteralPath (Join-Path $OutRoot "Conversations\old note.md") -Raw).Trim().EndsWith("old")) $true

# ---- cleanup (remove junctions by themselves first, never recurse through them) ------
Get-ChildItem -LiteralPath $OutRoot -Recurse -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint } | ForEach-Object { [System.IO.Directory]::Delete($_.FullName) }
Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL PROJECT ROUTING CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail PROJECT ROUTING CHECK(S) FAILED ==="; exit 1 }
