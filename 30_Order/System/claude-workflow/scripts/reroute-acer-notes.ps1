# Plans and applies the move of Acer conversation notes into the project folders the
# routing file (capture-projects.json) gives. Dry run by default; changes only with -Apply.
# Nothing is deleted: moved-out, superseded and retired items go to -ArchiveRoot with a
# SHA-256 manifest (MANIFEST.csv there; later runs append).
#
#   .\reroute-acer-notes.ps1                 # print the plan
#   .\reroute-acer-notes.ps1 -Apply          # carry it out
#
# What it plans, per session (the folder a note belongs in comes from the transcript's
# first cwd when the transcript still exists, else from the note's own cwd line):
#   move-orphan       note has no live transcript and sits in the wrong folder: the note and
#                     its .exported marker move to the right folder, and its project: line is
#                     rewritten. A pre-edit copy goes to the archive.
#   archive-duplicate session has two notes: the one with the later exported_at stays, the
#                     other (and its marker) goes to the archive.
#   release-marker    note has a live transcript and sits in the wrong folder: only its marker
#                     moves to the archive, so the exporter (which keeps a session in the
#                     folder holding its marker) writes the regenerated note into the right
#                     folder. The old note stays until the next run, where it is a duplicate
#                     and is archived.
#   retire-folder     a project folder left with no notes goes to the archive. Each
#                     _raw_jsonl junction is removed with `cmd /c rmdir` first (never
#                     Remove-Item -Recurse), and the live transcript set is re-checked.
# Folders named by a routing rule are never retired.
param(
    [string]$NotesRoot = "",
    [string]$TranscriptsRoot = "",
    [string]$RoutingFile = "",
    [string]$ArchiveRoot = "D:\_Anant\99_Archive\Acer Conversation Reroute 2026-10-22",
    [switch]$Apply
)

$ErrorActionPreference = "Stop"

$argNotes = $NotesRoot
$argTranscripts = $TranscriptsRoot
$argRouting = $RoutingFile
$argArchive = $ArchiveRoot
$doApply = [bool]$Apply

. (Join-Path $PSScriptRoot "export-claude-session.ps1")

$notesDir = if ($argNotes) { $argNotes } else { $OutRoot }
$transcriptsDir = if ($argTranscripts) { $argTranscripts } else { Join-Path $env:USERPROFILE ".claude\projects" }
if ($argRouting) { $script:CaptureRoutingFile = $argRouting }
$script:RoutingRules = $null
if (-not $notesDir) { Write-Output "No notes root: this host has no capture output folder."; exit 2 }

function Read-Head {
    param([string]$Path, [int]$Max)
    $out = New-Object System.Collections.Generic.List[string]
    $sr = New-Object System.IO.StreamReader($Path, [System.Text.Encoding]::UTF8)
    try { while ($out.Count -lt $Max -and -not $sr.EndOfStream) { $out.Add($sr.ReadLine()) } }
    finally { $sr.Dispose() }
    return , $out
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

function Get-LiveTranscripts {
    $map = @{}
    foreach ($d in Get-ChildItem -LiteralPath $transcriptsDir -Directory | Where-Object { $_.Name -ne 'template' }) {
        foreach ($t in Get-ChildItem -LiteralPath $d.FullName -Filter "*.jsonl" -File) { $map[$t.BaseName] = $t.FullName }
    }
    return $map
}

function Get-YamlScalar {
    param([string]$Value)
    $v = $Value.Trim()
    if ($v.Length -ge 2 -and $v.StartsWith("'") -and $v.EndsWith("'")) { return $v.Substring(1, $v.Length - 2).Replace("''", "'") }
    if ($v.Length -ge 2 -and $v.StartsWith('"') -and $v.EndsWith('"')) { return $v.Substring(1, $v.Length - 2).Replace('\\', '\') }
    return $v
}

$routedNames = @((Get-RoutingRules) | ForEach-Object { $_.Project })

# ---- read the notes ---------------------------------------------------------------------
$live = Get-LiveTranscripts
$liveCountBefore = $live.Count
$noteList = New-Object System.Collections.Generic.List[object]
$folders = @(Get-ChildItem -LiteralPath $notesDir -Directory | Where-Object { -not $_.Name.StartsWith('_') -and $_.Name -ne 'Cowork' })
foreach ($d in $folders) {
    foreach ($f in Get-ChildItem -LiteralPath $d.FullName -Filter "*.md" -File) {
        if ($f.Name -like "00 -*") { continue }
        $head = Read-Head -Path $f.FullName -Max 40
        $rec = [pscustomobject]@{ Sid = $null; Cwd = $null; Exported = $null; Folder = $d.Name; Path = $f.FullName; Name = $f.Name; Marker = $null }
        foreach ($l in $head) {
            if ($l -match '^session_id:\s*(\S+)\s*$') { $rec.Sid = $Matches[1] }
            elseif ($l -match '^cwd:\s*(.+)$') { $rec.Cwd = Get-YamlScalar $Matches[1] }
            elseif ($l -match '^exported_at:\s*(\S+)\s*$') { $rec.Exported = $Matches[1] }
        }
        if (-not $rec.Sid) { Write-Warning "No session_id, skipped: $($f.FullName)"; continue }
        $when = [datetime]::MinValue
        if (-not [datetime]::TryParse([string]$rec.Exported, [ref]$when)) { $when = $f.LastWriteTime }
        $rec.Exported = $when
        $m = Join-Path $d.FullName ".exported\$($rec.Sid).done"
        if (Test-Path -LiteralPath $m) { $rec.Marker = $m }
        $noteList.Add($rec)
    }
}

# ---- plan ------------------------------------------------------------------------------
$plan = New-Object System.Collections.Generic.List[object]
function Add-Plan($sid, $from, $to, $action, $reason, $rec) {
    $script:plan.Add([pscustomobject]@{ Session = $sid; From = $from; To = $to; Action = $action; Reason = $reason; Rec = $rec })
}

$remaining = @{}
foreach ($d in $folders) { $remaining[$d.Name] = 0 }
$bySid = $noteList | Group-Object Sid
foreach ($g in $bySid) {
    $sid = $g.Name
    $recs = @($g.Group | Sort-Object @{ Expression = { $_.Exported }; Descending = $true }, @{ Expression = { (Get-Item -LiteralPath $_.Path).LastWriteTimeUtc }; Descending = $true })
    $isLive = $live.ContainsKey($sid)
    $cwd = if ($isLive) { Get-FirstCwd $live[$sid] } else { $recs[0].Cwd }
    if (-not $cwd) { $cwd = $recs[0].Cwd }
    $target = Get-ProjectName -CwdPath $cwd
    $keep = $recs[0]
    for ($i = 1; $i -lt $recs.Count; $i++) {
        Add-Plan $sid $recs[$i].Folder "(archive)" "archive-duplicate" "second note for the session; kept the one exported at $($keep.Exported.ToString('yyyy-MM-dd HH:mm:ss')) in $($keep.Folder)" $recs[$i]
    }
    if ($keep.Folder -ne $target) {
        if ($isLive) {
            Add-Plan $sid $keep.Folder $target "release-marker" "live transcript; marker leaves so the regenerated note lands in the right folder, old note archived next run" $keep
            $remaining[$keep.Folder]++
        }
        else {
            $dest = Join-Path (Join-Path $notesDir $target) $keep.Name
            if (Test-Path -LiteralPath $dest) {
                Add-Plan $sid $keep.Folder $target "conflict" "a file with this name already exists in the target; not moved" $keep
                $remaining[$keep.Folder]++
            }
            else {
                Add-Plan $sid $keep.Folder $target "move-orphan" "transcript already swept; note and marker move, project: line updated" $keep
                if (-not $remaining.ContainsKey($target)) { $remaining[$target] = 0 }
                $remaining[$target]++
            }
        }
    }
    else { $remaining[$keep.Folder]++ }
}

foreach ($d in $folders) {
    if ($remaining[$d.Name] -gt 0 -or $routedNames -contains $d.Name) { continue }
    $extra = @(Get-ChildItem -LiteralPath $d.FullName -Force | Where-Object { $_.Name -notlike "00 -*" -and $_.Name -ne '.exported' -and $_.Name -ne '_raw_jsonl' -and $_.Name -notlike '*.md' })
    $leftNotes = @(Get-ChildItem -LiteralPath $d.FullName -Filter *.md -File | Where-Object { $_.Name -notlike "00 -*" })
    # notes that are planned to move or be archived out are fine; anything else (a note with no session_id) blocks retirement
    $planned = @($plan | Where-Object { $_.From -eq $d.Name } | ForEach-Object { $_.Rec.Name })
    $stray = @($leftNotes | Where-Object { $planned -notcontains $_.Name })
    if ($extra.Count -gt 0 -or $stray.Count -gt 0) {
        Add-Plan "-" $d.Name "-" "keep-folder" "folder has unexpected content ($($extra.Count + $stray.Count) item(s)); not retired" $null
        continue
    }
    Add-Plan "-" $d.Name "(archive)" "retire-folder" "no notes left after this plan" $d
}

# ---- print the plan --------------------------------------------------------------------------
Write-Output "=== Reroute plan ($(if ($doApply) { 'APPLY' } else { 'DRY RUN' })) ==="
Write-Output "Notes root   : $notesDir"
Write-Output "Archive root : $argArchive"
Write-Output "Live transcripts: $liveCountBefore"
Write-Output ""
$plan | Sort-Object Action, From, Session | Format-Table Session, From, To, Action, Reason -AutoSize -Wrap | Out-String -Width 300 | Write-Output
$n = @{}
foreach ($p in $plan) { if (-not $n.ContainsKey($p.Action)) { $n[$p.Action] = 0 }; $n[$p.Action]++ }
$moveNotes = [int]$n['move-orphan']
$archDup = [int]$n['archive-duplicate']
$release = [int]$n['release-marker']
$retire = [int]$n['retire-folder']
$markersMoved = @($plan | Where-Object { $_.Action -eq 'move-orphan' -and $_.Rec.Marker }).Count
$markersArchived = @($plan | Where-Object { @('archive-duplicate', 'release-marker') -contains $_.Action -and $_.Rec.Marker }).Count
$retireFiles = 0
$leaving = @{}
foreach ($p in ($plan | Where-Object { $_.Rec -and $_.Rec.Path })) {
    $leaving[$p.Rec.Path] = $true
    if ($p.Rec.Marker) { $leaving[$p.Rec.Marker] = $true }
}
foreach ($p in ($plan | Where-Object { $_.Action -eq 'retire-folder' })) {
    # files still in the folder once the moves above have happened (index notes, stray markers);
    # counted without following the junction
    $here = @(Get-ChildItem -LiteralPath $p.Rec.FullName -Force -File)
    $dotDir = Join-Path $p.Rec.FullName ".exported"
    if (Test-Path -LiteralPath $dotDir) { $here += @(Get-ChildItem -LiteralPath $dotDir -Force -File) }
    $retireFiles += @($here | Where-Object { -not $leaving.ContainsKey($_.FullName) }).Count
}
Write-Output ("Summary: {0} note(s) + {1} marker(s) move to the right folder; {2} duplicate note(s) archived; {3} marker(s) archived ({4} released, {5} with duplicates); {6} folder(s) retired ({7} loose files archived); {8} conflict(s)." -f `
        $moveNotes, $markersMoved, $archDup, $markersArchived, $release, ($markersArchived - $release), $retire, $retireFiles, [int]$n['conflict'])
Write-Output ("Files that change place: {0} moved + {1} archived (notes, markers, folder contents; junctions are removed, not archived)." -f `
        ($moveNotes + $markersMoved), ($archDup + $markersArchived + $retireFiles))

if (-not $doApply) {
    Write-Output "Dry run: nothing was changed. Re-run with -Apply to carry this out."
    exit 0
}

# ---- apply -------------------------------------------------------------------------------------
$liveSnapshot = @($live.Values)
function Assert-TranscriptsIntact {
    param([string]$When)
    $missing = @($liveSnapshot | Where-Object { -not (Test-Path -LiteralPath $_) })
    if ($missing.Count -gt 0) {
        throw "STOP ($When): $($missing.Count) live transcript(s) no longer exist, e.g. $($missing[0])"
    }
}
Assert-TranscriptsIntact "before apply"

if (-not (Test-Path -LiteralPath $argArchive)) { New-Item -ItemType Directory -Path $argArchive -Force | Out-Null }
$manifestPath = Join-Path $argArchive "MANIFEST.csv"
if (-not (Test-Path -LiteralPath $manifestPath)) {
    [System.IO.File]::WriteAllText($manifestPath, "sha256,action,session,original_path,new_path,sha256_after`r`n", (New-Object System.Text.UTF8Encoding($false)))
}
function Add-Manifest($sha, $action, $sid, $orig, $new, $shaAfter) {
    $cells = @($sha, $action, $sid, $orig, $new, $shaAfter) | ForEach-Object { '"' + ([string]$_).Replace('"', '""') + '"' }
    [System.IO.File]::AppendAllText($manifestPath, (($cells -join ',') + "`r`n"), (New-Object System.Text.UTF8Encoding($false)))
}
function Get-Sha($path) { (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant() }
function Get-FreeName($dest) {
    if (-not (Test-Path -LiteralPath $dest)) { return $dest }
    $dir = Split-Path $dest -Parent; $base = [IO.Path]::GetFileNameWithoutExtension($dest); $ext = [IO.Path]::GetExtension($dest)
    for ($i = 2; $i -lt 1000; $i++) {
        $c = Join-Path $dir "$base ($i)$ext"
        if (-not (Test-Path -LiteralPath $c)) { return $c }
    }
    throw "No free name for $dest"
}
function Move-ToArchive($src, $subdir, $action, $sid) {
    $destDir = Join-Path $argArchive $subdir
    if (-not (Test-Path -LiteralPath $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
    $dest = Get-FreeName (Join-Path $destDir (Split-Path $src -Leaf))
    $sha = Get-Sha $src
    Move-Item -LiteralPath $src -Destination $dest
    Add-Manifest $sha $action $sid $src $dest ""
}

foreach ($p in ($plan | Where-Object { $_.Action -eq 'archive-duplicate' })) {
    Move-ToArchive $p.Rec.Path "notes\$($p.From)" "archive-duplicate" $p.Session
    if ($p.Rec.Marker) { Move-ToArchive $p.Rec.Marker "markers\$($p.From)" "archive-duplicate-marker" $p.Session }
}
foreach ($p in ($plan | Where-Object { $_.Action -eq 'release-marker' })) {
    if ($p.Rec.Marker) { Move-ToArchive $p.Rec.Marker "markers\$($p.From)" "release-marker" $p.Session }
}
foreach ($p in ($plan | Where-Object { $_.Action -eq 'move-orphan' })) {
    $rec = $p.Rec
    $shaBefore = Get-Sha $rec.Path
    $backupDir = Join-Path $argArchive "moved-originals\$($p.From)"
    if (-not (Test-Path -LiteralPath $backupDir)) { New-Item -ItemType Directory -Path $backupDir -Force | Out-Null }
    $backup = Get-FreeName (Join-Path $backupDir $rec.Name)
    Copy-Item -LiteralPath $rec.Path -Destination $backup
    $targetDir = Join-Path $notesDir $p.To
    if (-not (Test-Path -LiteralPath (Join-Path $targetDir ".exported"))) { New-Item -ItemType Directory -Path (Join-Path $targetDir ".exported") -Force | Out-Null }
    $destNote = Join-Path $targetDir $rec.Name
    Move-Item -LiteralPath $rec.Path -Destination $destNote
    # byte-preserving edit of the first project: line (BOM and line endings stay as they were)
    $bytes = [System.IO.File]::ReadAllBytes($destNote)
    $hasBom = $bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF
    $text = (New-Object System.Text.UTF8Encoding($false)).GetString($bytes, $(if ($hasBom) { 3 } else { 0 }), $bytes.Length - $(if ($hasBom) { 3 } else { 0 }))
    $re = New-Object System.Text.RegularExpressions.Regex('(?m)^project:[^\r\n]*')
    $text = $re.Replace($text, "project: $($p.To)", 1)
    [System.IO.File]::WriteAllText($destNote, $text, (New-Object System.Text.UTF8Encoding($hasBom)))
    Add-Manifest $shaBefore "move-orphan" $p.Session $rec.Path $destNote (Get-Sha $destNote)
    if ($rec.Marker) {
        $destMarker = Join-Path $targetDir ".exported\$($p.Session).done"
        $shaM = Get-Sha $rec.Marker
        Move-Item -LiteralPath $rec.Marker -Destination $destMarker
        Add-Manifest $shaM "move-orphan-marker" $p.Session $rec.Marker $destMarker ""
    }
}
Assert-TranscriptsIntact "after moves"

foreach ($p in ($plan | Where-Object { $_.Action -eq 'retire-folder' })) {
    $dir = $p.Rec.FullName
    # junctions first, by themselves: cmd rmdir removes the link and never touches its target
    foreach ($j in @(Get-ChildItem -LiteralPath $dir -Force -Directory | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint })) {
        & cmd.exe /c rmdir "$($j.FullName)" | Out-Null
        if (Test-Path -LiteralPath $j.FullName) { throw "STOP: could not remove junction $($j.FullName)" }
        Assert-TranscriptsIntact "after removing junction $($j.FullName)"
    }
    # a junction nested anywhere else under the folder would make the next step unsafe
    $nested = @(Get-ChildItem -LiteralPath $dir -Force -Recurse -Directory | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint })
    if ($nested.Count -gt 0) { throw "STOP: reparse point left under $dir" }
    foreach ($f in Get-ChildItem -LiteralPath $dir -Force -Recurse -File) {
        Add-Manifest (Get-Sha $f.FullName) "retire-folder" "-" $f.FullName ($f.FullName.Replace($notesDir, (Join-Path $argArchive "folders"))) ""
    }
    $destFolder = Get-FreeName (Join-Path (Join-Path $argArchive "folders") $p.From)
    if (-not (Test-Path -LiteralPath (Split-Path $destFolder -Parent))) { New-Item -ItemType Directory -Path (Split-Path $destFolder -Parent) -Force | Out-Null }
    Move-Item -LiteralPath $dir -Destination $destFolder
    Assert-TranscriptsIntact "after retiring $($p.From)"
}

$liveAfter = Get-LiveTranscripts
Write-Output ""
Write-Output "Applied. Top-level transcripts: $liveCountBefore before, $($liveAfter.Count) after (every one of the $liveCountBefore still present)."
Write-Output "Manifest: $manifestPath ($(@(Get-Content -LiteralPath $manifestPath).Count - 1) rows)"
exit 0
