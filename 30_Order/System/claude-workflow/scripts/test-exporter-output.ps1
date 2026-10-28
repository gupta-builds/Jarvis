# Output conformance test for export-claude-session.ps1, run on synthetic
# transcripts only. Covers: Conversations Standard frontmatter, UTF-8 without a
# BOM, generated rollups, fenced/inline code rendering, per-model cost, and an
# en dash in a title surviving a second export (no second note).
# -ExporterPath lets the same test run against an older copy of the exporter.

param([string]$ExporterPath = (Join-Path $PSScriptRoot "export-claude-session.ps1"))

$ErrorActionPreference = "Stop"

. $ExporterPath

$work = Join-Path $env:TEMP "exporter-output-test-$(Get-Random)"
$srcDir = Join-Path $work "src"
$OutRoot = Join-Path $work "out"
New-Item -ItemType Directory -Path $srcDir, $OutRoot -Force | Out-Null

$fail = 0
function Assert($label, [bool]$ok) {
    if ($ok) { Write-Output "PASS: $label" }
    else { Write-Output "FAIL: $label"; $script:fail++ }
}

$utf8 = New-Object System.Text.UTF8Encoding($false)
$dash = [string][char]0x2013
$bt3 = '```'

function ConvertTo-Line($o) { $o | ConvertTo-Json -Depth 10 -Compress }
function New-Msg($id, $model, $usage, $blocks, $ts, $cwd) {
    ConvertTo-Line @{ type = "assistant"; uuid = "a-$id-$ts"; timestamp = $ts; cwd = $cwd; message = @{ id = $id; role = "assistant"; model = $model; content = @($blocks); usage = $usage } }
}
function New-UserText($text, $ts, $cwd) {
    ConvertTo-Line @{ type = "user"; uuid = "u-$ts"; timestamp = $ts; cwd = $cwd; message = @{ role = "user"; content = $text } }
}
function New-ToolResult($toolId, $text, $ts, $cwd) {
    ConvertTo-Line @{ type = "user"; uuid = "r-$toolId"; timestamp = $ts; cwd = $cwd; message = @{ role = "user"; content = @(@{ type = "tool_result"; tool_use_id = $toolId; content = $text }) } }
}
function Write-Transcript($path, $lines) { [System.IO.File]::WriteAllLines($path, [string[]]$lines, $utf8) }
function Test-NoBom($path) {
    $b = [System.IO.File]::ReadAllBytes($path)
    return -not ($b.Length -ge 3 -and $b[0] -eq 0xEF -and $b[1] -eq 0xBB -and $b[2] -eq 0xBF)
}
function Read-Text($path) { [System.IO.File]::ReadAllText($path, $utf8) }

# Splits a note body (frontmatter skipped) into fenced and unfenced lines the way
# CommonMark does: a fence closes on a backtick-only line at least as long as the opener.
function Get-BodyInfo($text) {
    $all = $text -split "`r?`n"
    $i = 0
    if ($all[0] -eq '---') { $i = 1; while ($all[$i] -ne '---') { $i++ }; $i++ }
    $inFence = $false; $fenceLen = 0
    $inside = New-Object System.Collections.Generic.List[string]
    $outside = New-Object System.Collections.Generic.List[string]
    for (; $i -lt $all.Count; $i++) {
        $l = $all[$i]
        if (-not $inFence) {
            if ($l -match '^(`{3,})[\w-]*\s*$') { $inFence = $true; $fenceLen = $Matches[1].Length; continue }
            $outside.Add($l)
        }
        else {
            if ($l -match '^(`{3,})\s*$' -and $Matches[1].Length -ge $fenceLen) { $inFence = $false; continue }
            $inside.Add($l)
        }
    }
    return @{ Inside = @($inside); Outside = @($outside); Closed = (-not $inFence) }
}
function Get-Cost($text) { if ($text -match '(?m)^cost_usd: (\S+)\s*$') { $Matches[1] } else { 'missing' } }

$usageStd = @{ input_tokens = 1000; output_tokens = 500; cache_read_input_tokens = 10000 }

# ---- Session 1: rendering, frontmatter, encoding, rollups ------------------------
$cwdRender = "E:\code\render-proj"
$sid1 = "out-test-render"
$tsBase = "2026-10-22T12:00:0"
$s1 = @(
    (New-UserText "hello" "${tsBase}0Z" $cwdRender),
    (ConvertTo-Line @{ type = "ai-title"; aiTitle = "Render check" }),
    (New-Msg "m1" "claude-sonnet-5" $usageStd @(
        @{ type = "text"; text = "running things" },
        @{ type = "tool_use"; id = "t_bash"; name = "Bash"; input = @{ command = "echo a`n- not a task`n1. also not a list`nls" } },
        @{ type = "tool_use"; id = "t_ps"; name = "PowerShell"; input = @{ command = "Get-ChildItem`n- not a task either" } },
        @{ type = "tool_use"; id = "t_edit"; name = "Edit"; input = @{ file_path = "/tmp/e.txt"; old_string = "o1`no2`no3"; new_string = "n1`nn2" } },
        @{ type = "tool_use"; id = "t_multi"; name = "MultiEdit"; input = @{ file_path = "/tmp/m.txt"; edits = @(@{ old_string = "p1`np2"; new_string = "q1`nq2`nq3" }) } },
        @{ type = "tool_use"; id = "t_agent"; name = "Agent"; input = @{ description = "x"; prompt = "line one`n- line two with ````ticks```` inside" } },
        @{ type = "tool_use"; id = "t_mcp"; name = "mcp__demo__lookup"; input = @{ q = "multi`nline" } },
        @{ type = "tool_use"; id = "t_read"; name = "Read"; input = @{ file_path = "/tmp/r.txt" } },
        @{ type = "tool_use"; id = "t_grep"; name = "Grep"; input = @{ pattern = "foo"; path = "/tmp" } }
    ) "${tsBase}1Z" $cwdRender),
    (New-ToolResult "t_bash" "before`n$bt3`nINSIDE_AFTER_FENCE_LINE`nlast" "${tsBase}2Z" $cwdRender),
    (New-ToolResult "t_ps" "PSRESULT_LINE" "${tsBase}3Z" $cwdRender)
)
$t1 = Join-Path $srcDir "$sid1.jsonl"
Write-Transcript $t1 $s1
$r1 = Export-Session -TranscriptPathIn $t1 -SessionIdIn $sid1 -CwdIn $cwdRender -SourceAppIn "ClaudeCode"
Assert "render session written" ($r1.Status -eq "written")
$note1 = Get-ChildItem -LiteralPath $r1.ProjectDir -Filter "*.md" -File | Select-Object -First 1
$text1 = Read-Text $note1.FullName
$marker1 = Join-Path $r1.ProjectDir ".exported\$sid1.done"

# frontmatter
$expCreated = ([datetime]"${tsBase}0Z").ToString("yyyy-MM-dd")
Assert "status is seed" ($text1 -match '(?m)^status: seed\s*$')
Assert "review_state is raw" ($text1 -match '(?m)^review_state: raw\s*$')
Assert "status: raw is gone" ($text1 -notmatch '(?m)^status: raw\s*$')
$okDates = $true
foreach ($k in 'created', 'updated') {
    if ($text1 -match "(?m)^${k}: (\S+)\s*$") {
        $d = [datetime]::MinValue
        if (-not [datetime]::TryParseExact($Matches[1], 'yyyy-MM-dd', [Globalization.CultureInfo]::InvariantCulture, 'None', [ref]$d)) { $okDates = $false }
    }
    else { $okDates = $false }
}
Assert "created and updated are valid dates" $okDates
Assert "created is the date of started_at" ($text1 -match "(?m)^created: $expCreated\s*$")
Assert "updated is the date of exported_at" ($text1 -match "(?m)^updated: $((Get-Date).ToString('yyyy-MM-dd'))\s*$")

# encoding
Assert "note has no BOM" (Test-NoBom $note1.FullName)
Assert "marker has no BOM" ((Test-Path -LiteralPath $marker1) -and (Test-NoBom $marker1))

# rollups
$rollupErr = $null
try { Update-Rollups -ProjectDir $r1.ProjectDir } catch { $rollupErr = $_.Exception.Message }
$idx = Join-Path $r1.ProjectDir "00 - Session Index.md"
$tur = Join-Path $r1.ProjectDir "00 - Tool Usage Rollup.md"
Assert "Update-Rollups tolerates a ProjectDir outside the vault" ($null -eq $rollupErr)
Assert "rollup files have no BOM" ((Test-Path -LiteralPath $idx) -and (Test-Path -LiteralPath $tur) -and (Test-NoBom $idx) -and (Test-NoBom $tur))
foreach ($p in $idx, $tur) {
    $leaf = Split-Path $p -Leaf
    $rt = if (Test-Path -LiteralPath $p) { Read-Text $p } else { "" }
    Assert "$leaf is type: generated, generator, gen_kind: index" (($rt -match '(?m)^type: generated\s*$') -and ($rt -match '(?m)^generator: claude-session-exporter\s*$') -and ($rt -match '(?m)^gen_kind: index\s*$') -and ($rt -notmatch '(?m)^type: index\s*$'))
}
$idxText = if (Test-Path -LiteralPath $idx) { Read-Text $idx } else { "" }
$fromPath = $r1.ProjectDir -replace '\\', '/'
Assert "Session Index keeps FROM (its own folder) and WHERE type = input" (($idxText.Contains("FROM `"$fromPath`"")) -and ($idxText -match '(?m)^WHERE type = "input"\s*$'))

# rendering
$info = Get-BodyInfo $text1
Assert "every fence is closed" $info.Closed
Assert "Bash command is a fenced block tagged bash" (($text1 -match '(?m)^```bash\s*$') -and ($info.Inside -contains "echo a") -and ($info.Inside -contains "- not a task"))
Assert "PowerShell command is a fenced block tagged powershell" (($text1 -match '(?m)^```powershell\s*$') -and ($info.Inside -contains "Get-ChildItem"))
Assert "PowerShell result is fenced like Bash results" ($info.Inside -contains "PSRESULT_LINE")
Assert "tool output containing three backticks stays inside a longer fence" (($text1 -match '(?m)^````\s*$') -and ($info.Inside -contains "INSIDE_AFTER_FENCE_LINE") -and ($info.Inside -contains "last"))
$strays = @($info.Outside | Where-Object { $_ -match '^\s*(-|\d+\.)\s' -and $_ -notmatch '^- `' })
Assert "no line outside a fence continues an inline span as a list item ($($strays.Count) stray)" ($strays.Count -eq 0)
Assert "multi-line Edit diff prefixes every line" ((@('- o1', '- o2', '- o3', '+ n1', '+ n2') | Where-Object { $info.Inside -notcontains $_ }).Count -eq 0)
Assert "multi-line MultiEdit diff prefixes every line" ((@('- p1', '- p2', '+ q1', '+ q2', '+ q3') | Where-Object { $info.Inside -notcontains $_ }).Count -eq 0)
Assert "Agent call is one inline span with a delimiter longer than its inner backticks" (@($info.Outside | Where-Object { $_.StartsWith('- `Agent` -- ```{') -and $_.EndsWith('}```') }).Count -eq 1)
Assert "MCP call is one inline line" (@($info.Outside | Where-Object { $_.StartsWith('- `mcp__demo__lookup` -- `{') }).Count -eq 1)
Assert "Read, Grep lines stay recognizable" (($info.Outside -contains '- `Read` -- `/tmp/r.txt`') -and ($info.Outside -contains '- `Grep` -- pattern `foo` path `/tmp`'))

# ---- Cost per model ------------------------------------------------------------
function Export-OneModel($model, $n) {
    $sid = "out-test-cost-$n"
    $cwd = "E:\code\cost-proj"
    $t = Join-Path $srcDir "$sid.jsonl"
    Write-Transcript $t @(
        (New-UserText "hi" "${tsBase}0Z" $cwd),
        (New-Msg "mc$n" $model $usageStd @(@{ type = "text"; text = "reply" }) "${tsBase}1Z" $cwd)
    )
    $r = Export-Session -TranscriptPathIn $t -SessionIdIn $sid -CwdIn $cwd -SourceAppIn "ClaudeCode"
    $f = Get-ChildItem -LiteralPath $r.ProjectDir -Filter "*.md" -File | Where-Object { (Read-Text $_.FullName) -match "(?m)^session_id: $sid\s*$" } | Select-Object -First 1
    return (Get-Cost (Read-Text $f.FullName))
}
# 1000 input, 500 output, 10000 cache read; read multiplier 0.05 for the two 5.5 models.
$priced = @(
    @{ Model = "claude-opus-5-5"; Want = 0.016 },
    @{ Model = "claude-sonnet-5-5"; Want = 0.008 },
    @{ Model = "claude-haiku-5-5"; Want = 0.00045 }
)
$n = 0
foreach ($p in $priced) {
    $n++
    $c = Export-OneModel $p.Model $n
    $val = 0.0
    $isNum = [double]::TryParse($c, [Globalization.NumberStyles]::Float, [Globalization.CultureInfo]::InvariantCulture, [ref]$val)
    Assert "$($p.Model) has a numeric cost ($c)" ($isNum -and [Math]::Abs($val - $p.Want) -lt 1e-9)
}
$cu = Export-OneModel "claude-unknown-9" 9
Assert "an unknown model gives cost_usd: null ($cu)" ($cu -eq 'null')

# ---- Session 2: en dash in the title survives a second export -----------------
$cwdDash = "E:\code\dash-proj"
$sid2 = "out-test-dash"
$t2 = Join-Path $srcDir "$sid2.jsonl"
$dashLines = @(
    (New-UserText "hello" "${tsBase}0Z" $cwdDash),
    (ConvertTo-Line @{ type = "ai-title"; aiTitle = "Plan weeks 1${dash}4" }),
    (New-Msg "md1" "claude-sonnet-5" $usageStd @(@{ type = "text"; text = "first" }) "${tsBase}1Z" $cwdDash)
)
Write-Transcript $t2 $dashLines
$d1 = Export-Session -TranscriptPathIn $t2 -SessionIdIn $sid2 -CwdIn $cwdDash -SourceAppIn "ClaudeCode"
Write-Transcript $t2 ($dashLines + (New-Msg "md2" "claude-sonnet-5" $usageStd @(@{ type = "text"; text = "second" }) "${tsBase}2Z" $cwdDash))
(Get-Item -LiteralPath $t2).LastWriteTimeUtc = (Get-Date).ToUniversalTime().AddMinutes(5)
$d2 = Export-Session -TranscriptPathIn $t2 -SessionIdIn $sid2 -CwdIn $cwdDash -SourceAppIn "ClaudeCode"
$dashNotes = @(Get-ChildItem -LiteralPath $d1.ProjectDir -Filter "*.md" -File | Where-Object { $_.Name -notlike "00 - *" })
Assert "title with an en dash: first export written" ($d1.Status -eq "written")
Assert "title with an en dash: second export rewrote in place" ($d2.Status -eq "written")
Assert "title with an en dash: still exactly one note ($($dashNotes.Count))" ($dashNotes.Count -eq 1)
Assert "title with an en dash: the note holds the second turn" ($dashNotes.Count -ge 1 -and (Read-Text $dashNotes[0].FullName).Contains("second"))

# ---- cleanup (remove junctions by themselves first, never recurse through them) ----
Get-ChildItem -LiteralPath $OutRoot -Recurse -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint } | ForEach-Object { [System.IO.Directory]::Delete($_.FullName) }
Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($fail -eq 0) { Write-Output "=== ALL EXPORTER OUTPUT CHECKS PASSED ==="; exit 0 }
else { Write-Output "=== $fail EXPORTER OUTPUT CHECK(S) FAILED ==="; exit 1 }
