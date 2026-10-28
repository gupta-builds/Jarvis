# Synthetic-folder test for check-capture-coverage.ps1: one session per case (ok,
# no note, two notes, wrong folder, no assistant turn) plus a note whose transcript is
# gone. Runs the script under the same shell as this test and checks exit code and output.

$ErrorActionPreference = "Stop"

$fail = 0
function Check($label, $actual, $expected) {
    if ($actual -eq $expected) { Write-Output "PASS: $label ($actual)" }
    else { Write-Output "FAIL: $label (got '$actual', want '$expected')"; $script:fail++ }
}

$work = Join-Path $env:TEMP "coverage-test-$(Get-Random)"
$tr = Join-Path $work "projects\slug-one"
$notesRoot = Join-Path $work "notes"
$areaA = Join-Path $work "areas\alpha"
New-Item -ItemType Directory -Path $tr, $notesRoot -Force | Out-Null
foreach ($p in "Alpha", "Beta") { New-Item -ItemType Directory -Path (Join-Path $notesRoot $p) -Force | Out-Null }

$routing = Join-Path $work "routing.json"
$cfg = @{ version = 1; fallback = "leaf"; rules = @(@{ project = "Alpha"; match = "under"; path = (Join-Path $work "areas\alpha") }) }
[System.IO.File]::WriteAllText($routing, ($cfg | ConvertTo-Json -Depth 5), (New-Object System.Text.UTF8Encoding($false)))

function New-Transcript($sid, $cwd, $withAssistant) {
    $l = New-Object System.Collections.Generic.List[string]
    $l.Add((@{ type = "user"; uuid = "u0"; timestamp = "2026-10-28T10:00:00Z"; cwd = $cwd; message = @{ role = "user"; content = "hi" } } | ConvertTo-Json -Depth 6 -Compress))
    if ($withAssistant) {
        $l.Add((@{ type = "assistant"; uuid = "a0"; timestamp = "2026-10-28T10:01:00Z"; cwd = $cwd; message = @{ id = "m0"; role = "assistant"; content = @(@{ type = "text"; text = "ok" }) } } | ConvertTo-Json -Depth 8 -Compress))
    }
    [System.IO.File]::WriteAllLines((Join-Path $tr "$sid.jsonl"), $l, (New-Object System.Text.UTF8Encoding($false)))
}
function New-Note($folder, $name, $sid, $reviewState) {
    $body = "---`ntype: input`nsession_id: $sid`n"
    if ($reviewState) { $body += "review_state: raw`n" }
    $body += "---`ntext`n"
    [System.IO.File]::WriteAllText((Join-Path $notesRoot "$folder\$name.md"), $body, (New-Object System.Text.UTF8Encoding($false)))
}

New-Transcript "s-ok" $areaA $true;                New-Note "Alpha" "ok note" "s-ok" $true
New-Transcript "s-nonote" $areaA $true
New-Transcript "s-two" $areaA $true;               New-Note "Alpha" "two a" "s-two" $true; New-Note "Beta" "two b" "s-two" $true
New-Transcript "s-wrong" $areaA $true;             New-Note "Beta" "wrong note" "s-wrong" $true
New-Transcript "s-junk" $areaA $false
New-Note "Beta" "orphan note" "s-gone" $false
[System.IO.File]::WriteAllText((Join-Path $notesRoot "Alpha\00 - Session Index.md"), "---`ntype: generated`n---`n", (New-Object System.Text.UTF8Encoding($false)))

$exe = (Get-Process -Id $PID).Path
$script = Join-Path $PSScriptRoot "check-capture-coverage.ps1"
$before = Get-ChildItem -LiteralPath $work -Recurse -File | ForEach-Object { "$($_.FullName)|$($_.Length)|$($_.LastWriteTimeUtc.Ticks)" }

$out = & $exe -NoProfile -ExecutionPolicy Bypass -File $script -TranscriptsRoot (Join-Path $work "projects") -NotesRoot $notesRoot -RoutingFile $routing 2>&1 | Out-String
Check "mixed tree exits 1" $LASTEXITCODE 1
Check "counts 5 transcripts" ($out -match 'Top-level transcripts\s*:\s*5') $true
Check "counts 1 ok" ($out -match 'ok \(one note, right folder\)\s*:\s*1\b') $true
Check "counts 1 no note" ($out -match 'no note\s*:\s*1\b') $true
Check "counts 1 two notes" ($out -match 'two or more notes\s*:\s*1\b') $true
Check "counts 1 wrong folder" ($out -match 'wrong folder\s*:\s*1\b') $true
Check "counts 1 no assistant" ($out -match 'no assistant turn \(exempt\)\s*:\s*1\b') $true
Check "orphan note counted without review_state" ($out -match 'no live transcript\s*:\s*1 \(1 without review_state\)') $true
Check "lists s-nonote" ($out -match 's-nonote\s+no-note') $true
Check "lists s-two" ($out -match 's-two\s+two-notes\s+Alpha \+ Beta') $true
Check "lists s-wrong with expected Alpha" ($out -match 's-wrong\s+wrong-folder\s+Beta\s+Alpha') $true
Check "does not list s-ok" ($out -notmatch 's-ok\s+(ok|no-note|two-notes|wrong-folder)') $true
Check "does not list s-junk as a failure" ($out -notmatch 's-junk\s+(no-note|two-notes|wrong-folder)') $true

$after = Get-ChildItem -LiteralPath $work -Recurse -File | ForEach-Object { "$($_.FullName)|$($_.Length)|$($_.LastWriteTimeUtc.Ticks)" }
Check "script is read-only (no file changed or created)" (($before -join "`n") -eq ($after -join "`n")) $true

# fix the three bad sessions -> clean tree passes
Remove-Item -LiteralPath (Join-Path $tr "s-nonote.jsonl"), (Join-Path $tr "s-two.jsonl"), (Join-Path $tr "s-wrong.jsonl")
$out2 = & $exe -NoProfile -ExecutionPolicy Bypass -File $script -TranscriptsRoot (Join-Path $work "projects") -NotesRoot $notesRoot -RoutingFile $routing 2>&1 | Out-String
Check "clean tree exits 0" $LASTEXITCODE 0
Check "clean tree reports PASS" ($out2 -match '=== PASS') $true

Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL COVERAGE CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail COVERAGE CHECK(S) FAILED ==="; exit 1 }
