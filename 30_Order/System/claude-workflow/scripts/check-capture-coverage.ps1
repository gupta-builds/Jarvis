# Read-only coverage check. For every top-level transcript under -TranscriptsRoot it
# reports whether the session has an assistant turn, whether exactly one note exists
# for it under -NotesRoot (matched on the session_id line in the note head), and whether
# that note sits in the project folder the routing rules give for the transcript's
# first cwd. Also counts notes whose transcript is gone and that lack review_state.
# Exits 1 if any session has no note, two notes, or a wrong folder; otherwise 0.
#
#   .\check-capture-coverage.ps1
#   .\check-capture-coverage.ps1 -TranscriptsRoot <dir> -NotesRoot <dir> -RoutingFile <json>
#
# Sessions with no assistant turn are expected to have no note and are not failures.
# Sessions that only exist in the legacy trees (the exporter skips them) are listed as
# legacy and are not failures.
param(
    [string]$TranscriptsRoot = "",
    [string]$NotesRoot = "",
    [string]$RoutingFile = ""
)

$ErrorActionPreference = "Stop"

$argTranscripts = $TranscriptsRoot
$argNotes = $NotesRoot
$argRouting = $RoutingFile

. (Join-Path $PSScriptRoot "export-claude-session.ps1")

$transcriptsDir = if ($argTranscripts) { $argTranscripts } else { Join-Path $env:USERPROFILE ".claude\projects" }
$notesDir = if ($argNotes) { $argNotes } else { $OutRoot }
if ($argRouting) { $script:CaptureRoutingFile = $argRouting }
$script:RoutingRules = $null

if (-not $notesDir) { Write-Output "No notes root: this host has no capture output folder."; exit 2 }

function Read-Head {
    param([string]$Path, [int]$Max)
    $out = New-Object System.Collections.Generic.List[string]
    $sr = New-Object System.IO.StreamReader($Path, [System.Text.Encoding]::UTF8)
    try {
        while ($out.Count -lt $Max -and -not $sr.EndOfStream) { $out.Add($sr.ReadLine()) }
    }
    finally { $sr.Dispose() }
    return , $out
}

function Test-HasAssistantTurn {
    param([string]$Path)
    $sr = New-Object System.IO.StreamReader($Path, [System.Text.Encoding]::UTF8)
    try {
        while (-not $sr.EndOfStream) {
            if ($sr.ReadLine().Contains('"type":"assistant"')) { return $true }
        }
    }
    finally { $sr.Dispose() }
    return $false
}

function Get-FirstCwd {
    param([string]$Path)
    foreach ($l in (Read-Head -Path $Path -Max 20)) {
        if ([string]::IsNullOrWhiteSpace($l)) { continue }
        try { $o = $l | ConvertFrom-Json } catch { continue }
        if ($o.cwd) { return [string]$o.cwd }
    }
    return $null
}

# ---- index the notes: session id -> list of {Folder, Path, HasReviewState} -----------------
$notes = @{}
$noteTotal = 0
$perFolder = @{}
foreach ($d in Get-ChildItem -LiteralPath $notesDir -Directory -ErrorAction SilentlyContinue) {
    if ($d.Name.StartsWith('_') -or $d.Name -eq 'Cowork') { continue }
    foreach ($f in Get-ChildItem -LiteralPath $d.FullName -Filter "*.md" -File -ErrorAction SilentlyContinue) {
        if ($f.Name -like "00 -*") { continue }
        $head = Read-Head -Path $f.FullName -Max 40
        $sid = $null
        foreach ($l in $head) { if ($l -match '^session_id:\s*(\S+)\s*$') { $sid = $Matches[1]; break } }
        if (-not $sid) { continue }
        $hasRs = $false
        foreach ($l in $head) { if ($l -match '^review_state:') { $hasRs = $true; break } }
        if (-not $notes.ContainsKey($sid)) { $notes[$sid] = New-Object System.Collections.Generic.List[object] }
        $notes[$sid].Add(@{ Folder = $d.Name; Path = $f.FullName; HasReviewState = $hasRs })
        $noteTotal++
        if (-not $perFolder.ContainsKey($d.Name)) { $perFolder[$d.Name] = 0 }
        $perFolder[$d.Name]++
    }
}

# ---- walk the transcripts ----------------------------------------------------------------
$seen = New-Object 'System.Collections.Generic.HashSet[string]'
$rows = New-Object System.Collections.Generic.List[object]
foreach ($slug in Get-ChildItem -LiteralPath $transcriptsDir -Directory | Where-Object { $_.Name -ne 'template' }) {
    foreach ($t in Get-ChildItem -LiteralPath $slug.FullName -Filter "*.jsonl" -File) {
        $sid = $t.BaseName
        [void]$seen.Add($sid)
        $hasAsst = Test-HasAssistantTurn -Path $t.FullName
        $cwd = Get-FirstCwd -Path $t.FullName
        $expected = Get-ProjectName -CwdPath $cwd
        # @() matters: one note comes back as a bare hashtable, whose .Count is its key count.
        $found = @(if ($notes.ContainsKey($sid)) { $notes[$sid].ToArray() })
        $status = 'ok'
        if (-not $hasAsst) { $status = 'no-assistant' }
        elseif ($found.Count -eq 0) { $status = if (Test-LegacyExported $sid) { 'legacy' } else { 'no-note' } }
        elseif ($found.Count -gt 1) { $status = 'two-notes' }
        elseif ($found[0].Folder -ne $expected) { $status = 'wrong-folder' }
        $rows.Add([pscustomobject]@{
                Session  = $sid
                Slug     = $slug.Name
                Assistant = $hasAsst
                Notes    = $found.Count
                Folders  = (@($found | ForEach-Object { $_.Folder }) -join ' + ')
                Expected = $expected
                Status   = $status
            })
    }
}

# ---- notes whose transcript is gone ----------------------------------------------------------
$orphans = @($notes.Keys | Where-Object { -not $seen.Contains($_) })
$orphanNotes = 0
$orphanNoRs = 0
foreach ($sid in $orphans) {
    foreach ($n in $notes[$sid]) {
        $orphanNotes++
        if (-not $n.HasReviewState) { $orphanNoRs++ }
    }
}

# ---- report --------------------------------------------------------------------------------
function Count-Status($s) { @($rows | Where-Object { $_.Status -eq $s }).Count }
$bad = @($rows | Where-Object { @('no-note', 'two-notes', 'wrong-folder') -contains $_.Status })

Write-Output "=== Capture coverage ==="
Write-Output "Transcripts root : $transcriptsDir"
Write-Output "Notes root       : $notesDir"
Write-Output ""
Write-Output ("Top-level transcripts          : {0}" -f $rows.Count)
Write-Output ("  with an assistant turn       : {0}" -f @($rows | Where-Object { $_.Assistant }).Count)
Write-Output ("  ok (one note, right folder)  : {0}" -f (Count-Status 'ok'))
Write-Output ("  no note                      : {0}" -f (Count-Status 'no-note'))
Write-Output ("  two or more notes            : {0}" -f (Count-Status 'two-notes'))
Write-Output ("  wrong folder                 : {0}" -f (Count-Status 'wrong-folder'))
Write-Output ("  legacy only (exempt)         : {0}" -f (Count-Status 'legacy'))
Write-Output ("  no assistant turn (exempt)   : {0}" -f (Count-Status 'no-assistant'))
Write-Output ("Notes in the tree              : {0}" -f $noteTotal)
Write-Output ("Notes with no live transcript  : {0} ({1} without review_state)" -f $orphanNotes, $orphanNoRs)
Write-Output ""
Write-Output "Notes per project folder:"
foreach ($k in ($perFolder.Keys | Sort-Object)) { Write-Output ("  {0,-20} {1}" -f $k, $perFolder[$k]) }

if ($bad.Count -gt 0) {
    Write-Output ""
    Write-Output "Sessions needing attention:"
    $bad | Sort-Object Status, Session | Format-Table Session, Status, Folders, Expected, Slug -AutoSize | Out-String -Width 240 | Write-Output
    Write-Output "=== FAIL: $($bad.Count) session(s) without exactly one note in the right folder ==="
    exit 1
}
Write-Output "=== PASS: every session with an assistant turn has one note in the right folder ==="
exit 0
