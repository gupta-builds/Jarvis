# Exports Claude Code (and Cowork) session transcripts to one Markdown note each.
# Run by the Stop/SessionEnd hook and by the 30-minute -BackfillAll task, under
# Windows PowerShell 5.1.
#
# Environment (TEST ONLY): JARVIS_CAPTURE_OUTROOT replaces the computed output
# root so tests and real-transcript checks write to a scratch folder instead of
# the vault. Leave it unset everywhere else.
param(
    [string]$TranscriptPath = "",
    [string]$SessionId = "",
    [string]$Cwd = "",
    [ValidateSet("ClaudeCode", "Cowork")]
    [string]$SourceApp = "ClaudeCode",
    [switch]$BackfillAll,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

$VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")).Path
$ConvRoot = Join-Path $VaultRoot "60_Claude\05_Clippings\AI Conversations"

# Machine segment (build 5c): output lands in <Machine>\Windows\Claude, with
# Machine taken from the host name. An unknown host writes nothing (see the
# dispatch block at the bottom).
function Get-CaptureMachine {
    switch ([Environment]::MachineName.ToLowerInvariant()) {
        'desktop-3vbg0jh' { return 'Dell' }
        'gupta-builds' { return 'Acer' }
        default { return $null }
    }
}
$Machine = Get-CaptureMachine
# TEST ONLY: JARVIS_CAPTURE_OUTROOT replaces the computed OutRoot, so tests and
# real-transcript checks can export to a scratch folder instead of the vault.
# Never set it in the hook or the scheduled task.
$OutRoot = if ($env:JARVIS_CAPTURE_OUTROOT) { $env:JARVIS_CAPTURE_OUTROOT }
elseif ($Machine) { Join-Path $ConvRoot "$Machine\Windows\Claude" }
else { $null }

# ---------------------------------------------------------------------------
# Pricing (dollars per million tokens). Source:
# https://platform.claude.com/docs/en/about-claude/pricing, read 2026-10-28.
# Cache multipliers on that page: 5-minute write 1.25x input, 1-hour write
# 2x input, cache read (hit) 0.1x input, except 0.05x on claude-opus-5-5 and
# claude-sonnet-5-5 (and 0.025x on Fable 5.1 / Mythos 5.1, not in this table).
# `read` below is that per-model cache-read multiplier.
# claude-sonnet-5: $2/$10 is now the standard price; the planned 2026-09-01
# increase to $3/$15 will not occur (page footnote 3).
# claude-haiku-5-5: rates are for prompts up to 100,000 tokens. Requests over
# that are billed at $0.50/$2.50 and are not priced here (the Acer's
# transcripts held no Haiku 5.5 usage as of 2026-10-28).
# Models absent from this table (claude-fable-5-1, claude-mythos-5-1, any
# unknown id) get cost_usd: null rather than an estimate.
# ---------------------------------------------------------------------------
$Pricing = @{
    "claude-fable-5"    = @{ input = 10.00; output = 50.00; read = 0.1 }
    "claude-mythos-5"   = @{ input = 10.00; output = 50.00; read = 0.1 }
    "claude-opus-5-5"   = @{ input = 4.00; output = 20.00; read = 0.05 }
    "claude-opus-5"     = @{ input = 5.00; output = 25.00; read = 0.1 }
    "claude-opus-4-8"   = @{ input = 5.00; output = 25.00; read = 0.1 }
    "claude-opus-4-7"   = @{ input = 5.00; output = 25.00; read = 0.1 }
    "claude-opus-4-6"   = @{ input = 5.00; output = 25.00; read = 0.1 }
    "claude-sonnet-5-5" = @{ input = 2.00; output = 10.00; read = 0.05 }
    "claude-sonnet-5"   = @{ input = 2.00; output = 10.00; read = 0.1 }
    "claude-sonnet-4-6" = @{ input = 3.00; output = 15.00; read = 0.1 }
    "claude-haiku-5-5"  = @{ input = 0.10; output = 0.50; read = 0.1 }
    "claude-haiku-4-5"  = @{ input = 1.00; output = 5.00; read = 0.1 }
}

function Resolve-PricingKey {
    param([string]$Model)
    if (-not $Model -or $Model -eq '<synthetic>') { return $null }
    $key = $Model -replace '-\d{8}$', '' -replace '\[1m\]$', ''
    if ($Pricing.ContainsKey($key)) { return $key }
    return $null
}

# cwd -> project name. Vault roots are resolved from this script's own location, never
# a hardcoded drive layout (the old literal map only matched the Dell). Anything inside
# the Jarvis or The Plan vault belongs to that vault's project: a session that cd's into
# a vault subfolder must not become its own sibling project. Home is exact-match only.
# Anything outside these roots falls back to the basename of cwd.
function Get-ProjectName {
    param([string]$CwdPath)
    if ([string]::IsNullOrWhiteSpace($CwdPath)) { return "Unknown" }
    $norm = $CwdPath.TrimEnd('\', '/')
    $vaults = @(
        @{ Name = 'Jarvis'; Root = $VaultRoot },
        @{ Name = 'The Plan'; Root = (Join-Path (Split-Path -Path $VaultRoot -Parent) 'The Plan') }
    )
    foreach ($v in $vaults) {
        $root = $v.Root.TrimEnd('\', '/')
        if ($norm -ieq $root -or $norm.StartsWith($root + '\', [StringComparison]::OrdinalIgnoreCase)) { return $v.Name }
    }
    if ($env:USERPROFILE -and $norm -ieq $env:USERPROFILE.TrimEnd('\', '/')) { return 'Home' }
    return (Split-Path -Path $norm -Leaf)
}

# The .exported marker lives inside the derived project folder, so any change in how a
# session's project name is derived (live cwd from the hook vs first cwd from backfill)
# used to lose the marker and re-export the whole session as a second note. A session
# that already has a marker stays in that folder; the newest marker wins if there are two.
function Find-ExistingSessionDir {
    param([string]$SessionIdIn)
    if (-not $OutRoot -or -not (Test-Path -LiteralPath $OutRoot)) { return $null }
    $best = $null
    foreach ($d in Get-ChildItem -LiteralPath $OutRoot -Directory -ErrorAction SilentlyContinue) {
        if ($d.Name.StartsWith('_') -or $d.Name -eq 'Cowork') { continue }
        $m = Join-Path $d.FullName ".exported\$SessionIdIn.done"
        if (Test-Path -LiteralPath $m) {
            $t = (Get-Item -LiteralPath $m).LastWriteTimeUtc
            if (-not $best -or $t -gt $best.Time) { $best = @{ Dir = $d.FullName; Time = $t } }
        }
    }
    if ($best) { return $best.Dir }
    return $null
}

function Redact-Secrets {
    param([string]$Text)
    if (-not $Text) { return $Text }
    $Text = $Text -replace '(sk-ant-[A-Za-z0-9_-]{10,})', '[REDACTED]'
    $Text = $Text -replace '(sk-[A-Za-z0-9]{20,})', '[REDACTED]'
    $Text = $Text -replace '(ghp_[A-Za-z0-9]{20,})', '[REDACTED]'
    $Text = $Text -replace '(xox[baprs]-[A-Za-z0-9-]{10,})', '[REDACTED]'
    $Text = $Text -replace '(AKIA[0-9A-Z]{12,})', '[REDACTED]'
    $Text = $Text -replace '(?i)(Bearer\s+)[A-Za-z0-9\-_.]{15,}', '$1[REDACTED]'
    $Text = $Text -replace '(?i)(SetEnvironmentVariable\(\s*"[^"]+"\s*,\s*")[^"]{8,}(")', '$1[REDACTED]$2'
    $Text = $Text -replace '\b(?=[A-Za-z0-9_-]*[0-9])(?=[A-Za-z0-9_-]*[A-Za-z])[A-Za-z0-9_-]{24,}\b', '[REDACTED]'
    return $Text
}

function Get-ToolResultText {
    param($Content)
    if ($null -eq $Content) { return "" }
    if ($Content -is [string]) { return $Content }
    $parts = New-Object System.Collections.Generic.List[string]
    foreach ($block in @($Content)) {
        if ($block -is [string]) { $parts.Add($block) }
        elseif ($block.type -eq 'text' -and $block.text) { $parts.Add([string]$block.text) }
        else { $parts.Add(($block | ConvertTo-Json -Compress -Depth 6)) }
    }
    return ($parts -join "`n")
}

# Writes text as UTF-8 without a byte-order mark. Set-Content -Encoding UTF8 adds
# a BOM under Windows PowerShell 5.1, which is the shell the hook runs.
function Write-Utf8NoBom {
    param([string]$Path, [string]$Text)
    [System.IO.File]::WriteAllText($Path, $Text, (New-Object System.Text.UTF8Encoding($false)))
}

# A fence must be longer than any run of backticks inside it, or tool output
# that contains three backticks closes the block early.
function Get-Fence {
    param([string]$Text)
    $max = 0
    foreach ($m in [regex]::Matches([string]$Text, '`+')) { if ($m.Length -gt $max) { $max = $m.Length } }
    return ('`' * [Math]::Max(3, $max + 1))
}

# Inline code span on one line. Newlines become spaces so no line inside the span
# can start with "- " or "1. " and be read as a task or list item by Obsidian's
# Tasks plugin. The delimiter is longer than any backtick run inside the text.
function Format-InlineCode {
    param([string]$Text)
    $t = ([string]$Text) -replace '\r?\n', ' '
    if ($t -eq '') { $t = ' ' }
    $max = 0
    foreach ($m in [regex]::Matches($t, '`+')) { if ($m.Length -gt $max) { $max = $m.Length } }
    $tick = '`' * ($max + 1)
    if ($t.StartsWith('`') -or $t.EndsWith('`')) { $t = " $t " }
    return "$tick$t$tick"
}

# Every line of a multi-line side gets the marker, not just the first.
function Format-DiffSide {
    param([string]$Marker, [string]$Text)
    $out = New-Object System.Collections.Generic.List[string]
    foreach ($l in ([string]$Text -split '\r?\n')) { $out.Add("$Marker $l") }
    return $out
}

function Add-FencedBlock {
    param($Lines, [string]$Body, [string]$Lang = '')
    $fence = Get-Fence $Body
    $Lines.Add("$fence$Lang")
    $Lines.Add($Body)
    $Lines.Add($fence)
}

function Add-DiffBlock {
    param($Lines, $Old, $New)
    $body = (@(Format-DiffSide '-' (Redact-Secrets ([string]$Old))) + @(Format-DiffSide '+' (Redact-Secrets ([string]$New)))) -join "`n"
    Add-FencedBlock -Lines $Lines -Body $body -Lang 'diff'
}

# Renders exactly one tool_use block into markdown lines. Called once per
# call, appended individually to a List[string] by the caller - never
# comma-joined, so N Bash calls in one turn produce N separate entries.
function Format-ToolCall {
    param($Block, [string]$ResultText)
    $lines = New-Object System.Collections.Generic.List[string]
    $in = $Block.input
    switch -Regex ($Block.name) {
        '^Read$' {
            $lines.Add("- ``Read`` -- $(Format-InlineCode ([string]$in.file_path))")
        }
        '^Write$' {
            $lines.Add("- ``Write`` -- $(Format-InlineCode ([string]$in.file_path))")
            if ($in.content) {
                Add-FencedBlock -Lines $lines -Body (Redact-Secrets ([string]$in.content))
            }
        }
        '^Edit$' {
            $lines.Add("- ``Edit`` -- $(Format-InlineCode ([string]$in.file_path))")
            Add-DiffBlock -Lines $lines -Old $in.old_string -New $in.new_string
        }
        '^MultiEdit$' {
            $lines.Add("- ``MultiEdit`` -- $(Format-InlineCode ([string]$in.file_path))")
            foreach ($edit in @($in.edits)) {
                Add-DiffBlock -Lines $lines -Old $edit.old_string -New $edit.new_string
            }
        }
        '^(Bash|PowerShell)$' {
            $lang = if ($Block.name -eq 'Bash') { 'bash' } else { 'powershell' }
            $lines.Add("- ``$($Block.name)``")
            Add-FencedBlock -Lines $lines -Body ([string]$in.command) -Lang $lang
            if ($ResultText) {
                Add-FencedBlock -Lines $lines -Body (Redact-Secrets $ResultText)
            }
        }
        '^(Grep|Glob)$' {
            $pat = if ($in.pattern) { [string]$in.pattern } else { "" }
            $pth = if ($in.path) { [string]$in.path } else { "" }
            $lines.Add("- ``$($Block.name)`` -- pattern $(Format-InlineCode $pat) path $(Format-InlineCode $pth)")
        }
        default {
            $dump = ($in | ConvertTo-Json -Compress -Depth 6)
            $lines.Add("- ``$($Block.name)`` -- $(Format-InlineCode (Redact-Secrets $dump))")
        }
    }
    return $lines
}

function Sanitize-Filename {
    param([string]$Name)
    if (-not $Name) { return "Untitled" }
    $clean = $Name -replace '[<>:"/\\|?*`]', ''
    $clean = $clean -replace '\s+', ' '
    $clean = $clean.Trim()
    if ($clean.Length -gt 80) {
        $truncated = $clean.Substring(0, 80)
        $lastSpace = $truncated.LastIndexOf(' ')
        if ($lastSpace -gt 20) { $truncated = $truncated.Substring(0, $lastSpace) }
        $clean = $truncated.Trim()
    }
    if (-not $clean) { return "Untitled" }
    return $clean
}

function New-SlugFromText {
    param([string]$Text)
    if (-not $Text) { return "" }
    $firstLine = ($Text -split "`n")[0]
    $firstLine = ($firstLine -split '(?<=[.!?])\s')[0]
    $clean = $firstLine -replace '[<>:"/\\|?*`]', ''
    $clean = $clean -replace '\s+', ' '
    $clean = $clean.Trim()
    if ($clean.Length -gt 60) {
        $truncated = $clean.Substring(0, 60)
        $lastSpace = $truncated.LastIndexOf(' ')
        if ($lastSpace -gt 20) { $truncated = $truncated.Substring(0, $lastSpace) }
        $clean = $truncated.Trim()
    }
    return $clean
}

function Write-YamlStringList {
    param([System.Text.StringBuilder]$Sb, [string]$Key, [string[]]$Items)
    $items = @($Items)
    if ($items.Count -eq 0) {
        [void]$Sb.AppendLine("$Key`: []")
    }
    else {
        [void]$Sb.AppendLine("$Key`:")
        foreach ($i in $items) {
            $escaped = ([string]$i) -replace '\\', '\\' -replace '"', '\"'
            [void]$Sb.AppendLine("  - `"$escaped`"")
        }
    }
}

# ---------------------------------------------------------------------------
# Aggregates per-model token usage from one assistant JSONL line's
# message.usage block into $ModelUsage (a hashtable keyed by model string).
# Pulled out as its own function specifically so it can be unit-tested
# standalone against a hand-built fake usage object before any real
# transcript is parsed (see scripts/test-token-aggregation.ps1).
# ---------------------------------------------------------------------------
function Add-ModelUsage {
    param([hashtable]$ModelUsage, [string]$Model, $Usage)
    if (-not $Model -or $Model -eq '<synthetic>') { return }
    if (-not $ModelUsage.ContainsKey($Model)) {
        $ModelUsage[$Model] = @{ input = 0; output = 0; cache_read = 0; cache_5m = 0; cache_1h = 0 }
    }
    if ($Usage.input_tokens) { $ModelUsage[$Model].input += [int]$Usage.input_tokens }
    if ($Usage.output_tokens) { $ModelUsage[$Model].output += [int]$Usage.output_tokens }
    if ($Usage.cache_read_input_tokens) { $ModelUsage[$Model].cache_read += [int]$Usage.cache_read_input_tokens }
    if ($Usage.cache_creation) {
        if ($Usage.cache_creation.ephemeral_5m_input_tokens) { $ModelUsage[$Model].cache_5m += [int]$Usage.cache_creation.ephemeral_5m_input_tokens }
        if ($Usage.cache_creation.ephemeral_1h_input_tokens) { $ModelUsage[$Model].cache_1h += [int]$Usage.cache_creation.ephemeral_1h_input_tokens }
    }
    elseif ($Usage.cache_creation_input_tokens) {
        $ModelUsage[$Model].cache_5m += [int]$Usage.cache_creation_input_tokens
    }
}

# One API response is written as several 'assistant' JSONL lines (one per content
# block: thinking, text, each tool_use), all sharing message.id and repeating the
# identical message.usage. Summing per line counted each response 2-3x.
function Set-ResponseUsage {
    param([hashtable]$UsageById, $AssistantLine)
    $m = $AssistantLine.message
    $key = if ($m.id) { [string]$m.id } else { [guid]::NewGuid().ToString() }
    $UsageById[$key] = @{ Model = [string]$m.model; Usage = $m.usage }
}

function Add-DedupedModelUsage {
    param([hashtable]$ModelUsage, [hashtable]$UsageById)
    foreach ($e in $UsageById.Values) {
        Add-ModelUsage -ModelUsage $ModelUsage -Model $e.Model -Usage $e.Usage
    }
}

function Get-SessionMonthBucket {
    param([string]$Path)
    try {
        $sample = Get-Content -LiteralPath $Path -TotalCount 10 -Encoding UTF8
        foreach ($l in $sample) {
            if ([string]::IsNullOrWhiteSpace($l)) { continue }
            try { $o = $l | ConvertFrom-Json } catch { continue }
            if ($o.timestamp) { return ([datetime]$o.timestamp).ToString("yyyy-MM") }
        }
    }
    catch {}
    return (Get-Item -LiteralPath $Path).LastWriteTime.ToString("yyyy-MM")
}

function Ensure-ProjectScaffold {
    param([string]$ProjectDir)
    if (-not (Test-Path -LiteralPath $ProjectDir)) {
        New-Item -ItemType Directory -Path $ProjectDir -Force | Out-Null
    }
    $markerDir = Join-Path $ProjectDir ".exported"
    if (-not (Test-Path -LiteralPath $markerDir)) {
        New-Item -ItemType Directory -Path $markerDir -Force | Out-Null
    }
}

# Sessions exported before build 5c live under the old Windows\ tree and the
# Dell\ archive. Their .exported markers count as "already exported", so the
# machine-aware layout never re-exports them. Read-only; built once per run.
$script:LegacyIds = $null
function Test-LegacyExported {
    param([string]$SessionIdIn)
    if ($null -eq $script:LegacyIds) {
        $script:LegacyIds = New-Object 'System.Collections.Generic.HashSet[string]'
        $patterns = @(
            'Windows\Claude Code\*\.exported\*.done',
            'Windows\Cowork\*\.exported\*.done',
            'Dell\Windows\Claude\*\.exported\*.done',
            'Dell\Windows\Claude\Cowork\*\.exported\*.done'
        )
        foreach ($p in $patterns) {
            Get-ChildItem -Path (Join-Path $ConvRoot $p) -File -Force -ErrorAction SilentlyContinue |
                ForEach-Object { [void]$script:LegacyIds.Add($_.BaseName) }
        }
    }
    return $script:LegacyIds.Contains($SessionIdIn)
}

function Update-Rollups {
    param([string]$ProjectDir)
    # Vault-relative when the folder is inside the vault; a ProjectDir outside it
    # (tests, JARVIS_CAPTURE_OUTROOT) falls back to its full path.
    $vaultPrefix = $VaultRoot.TrimEnd('\', '/') + '\'
    $vaultRel = if ($ProjectDir.StartsWith($vaultPrefix, [StringComparison]::OrdinalIgnoreCase)) {
        $ProjectDir.Substring($vaultPrefix.Length) -replace '\\', '/'
    }
    else {
        $ProjectDir -replace '\\', '/'
    }

    $indexPath = Join-Path $ProjectDir "00 - Session Index.md"
    $indexContent = @"
---
type: generated
generator: claude-session-exporter
gen_kind: index
---

``````dataview
TABLE WITHOUT ID
  file.link AS "Session",
  started_at AS "Session Ran",
  exported_at AS "Added to Jarvis",
  turn_count AS "Turns",
  duration_minutes AS "Duration (min)",
  tokens.total AS "Tokens",
  cost_usd AS "Cost (`$)"
FROM "$vaultRel"
WHERE type = "input"
SORT started_at DESC
``````
"@
    Write-Utf8NoBom -Path $indexPath -Text $indexContent

    $rollupPath = Join-Path $ProjectDir "00 - Tool Usage Rollup.md"
    $rollupContent = @"
---
type: generated
generator: claude-session-exporter
gen_kind: index
---

``````dataviewjs
const pages = dv.pages(``"$vaultRel"``).where(p => p.type === "input");
let toolTotals = {};
let tokenTotal = 0;
let costTotal = 0;
let fileSessions = {};
for (const p of pages) {
  for (const [tool, count] of Object.entries(p.tools_used ?? {})) {
    toolTotals[tool] = (toolTotals[tool] ?? 0) + count;
  }
  tokenTotal += p.tokens?.total ?? 0;
  costTotal += p.cost_usd ?? 0;
  for (const f of p.files_touched ?? []) {
    fileSessions[f] = (fileSessions[f] ?? 0) + 1;
  }
}
dv.paragraph("**Total sessions:** " + pages.length);
dv.paragraph("**Total tokens:** " + tokenTotal + " -- **Total cost:** `$" + costTotal.toFixed(4));
dv.header(2, "Tool usage");
dv.table(["Tool", "Total uses"], Object.entries(toolTotals).sort((a, b) => b[1] - a[1]));
dv.header(2, "Files touched (by session count)");
dv.table(["File", "Sessions"], Object.entries(fileSessions).sort((a, b) => b[1] - a[1]));
``````
"@
    Write-Utf8NoBom -Path $rollupPath -Text $rollupContent
}

# ---------------------------------------------------------------------------
# Main per-session pipeline. Returns a status object: Status is one of
# dup / junk / written / error. ProjectDir is set whenever scaffold work
# happened (so the caller knows to refresh that folder's rollups).
# ---------------------------------------------------------------------------
function Export-Session {
    param(
        [string]$TranscriptPathIn,
        [string]$SessionIdIn,
        [string]$CwdIn,
        [string]$SourceAppIn
    )

    $result = [ordered]@{ Status = "error"; ProjectDir = $null; Project = $null }

    $tpath = $TranscriptPathIn
    if ($tpath.Length -ge 250 -and -not $tpath.StartsWith('\\?\')) { $tpath = "\\?\$tpath" }
    if (-not (Test-Path -LiteralPath $tpath)) {
        $result.Status = "error"
        return $result
    }

    if ($SourceAppIn -eq "ClaudeCode") {
        $projectName = Get-ProjectName -CwdPath $CwdIn
        $projectDir = Join-Path $OutRoot $projectName
        $existingDir = Find-ExistingSessionDir -SessionIdIn $SessionIdIn
        if ($existingDir) {
            $projectDir = $existingDir
            $projectName = Split-Path -Path $existingDir -Leaf
        }
        $rawTarget = Split-Path -Path $TranscriptPathIn -Parent
    }
    else {
        $monthBucket = Get-SessionMonthBucket -Path $tpath
        $projectName = $monthBucket
        $projectDir = Join-Path $OutRoot "Cowork\$monthBucket"
        $rawTarget = $null
    }

    $result.ProjectDir = $projectDir
    $result.Project = $projectName

    $markerPath = Join-Path $projectDir ".exported\$SessionIdIn.done"
    $hasMarker = Test-Path -LiteralPath $markerPath
    if (-not $hasMarker -and (Test-LegacyExported $SessionIdIn)) {
        $result.Status = "legacy"
        return $result
    }
    if ($DryRun) {
        $grown = $true
        if ($hasMarker) {
            $grown = (Get-Item -LiteralPath $tpath).LastWriteTimeUtc -gt (Get-Item -LiteralPath $markerPath).LastWriteTimeUtc
        }
        $result.Status = if ($grown) { "pending" } else { "dup" }
        return $result
    }

    Ensure-ProjectScaffold -ProjectDir $projectDir

    $reuseOutputName = $null
    if (Test-Path -LiteralPath $markerPath) {
        $markerTime = (Get-Item -LiteralPath $markerPath).LastWriteTimeUtc
        $transcriptTime = (Get-Item -LiteralPath $tpath).LastWriteTimeUtc
        if ($transcriptTime -le $markerTime) {
            $result.Status = "dup"
            return $result
        }
        # Transcript grew since the last export (e.g. a Stop-hook export
        # caught this session mid-conversation) - re-render in place instead
        # of skipping. Reuse the marker's own stored filename so a title
        # change between renders (ai-title arriving late, or a slug from an
        # early turn getting replaced) never orphans a stale duplicate note.
        $storedName = Get-Content -LiteralPath $markerPath -Raw -Encoding UTF8 -ErrorAction SilentlyContinue
        if ($storedName) { $reuseOutputName = $storedName.Trim() }
        if (-not $reuseOutputName) {
            # Marker predates the filename-content change above and is an
            # empty touch file - fall back to finding the existing note by
            # its own session_id frontmatter, so a stale marker can never
            # spawn a "-2" duplicate instead of updating the real note.
            $existingMatch = Get-ChildItem -LiteralPath $projectDir -Filter "*.md" -File -ErrorAction SilentlyContinue |
                Where-Object { $_.Name -notlike "00 - *" } |
                Where-Object {
                    $head = Get-Content -LiteralPath $_.FullName -TotalCount 20 -Encoding UTF8 -ErrorAction SilentlyContinue
                    $head -match "^session_id: $([regex]::Escape($SessionIdIn))$"
                } |
                Select-Object -First 1
            if ($existingMatch) { $reuseOutputName = $existingMatch.Name }
        }
    }

    # Raw source: junction for Claude Code (one junction per project, mirrors
    # the whole ~/.claude/projects/<hash> folder live); per-session copy for
    # Cowork (sandboxes are scattered, no common parent folder to junction to).
    if ($SourceAppIn -eq "ClaudeCode") {
        $rawJsonlDir = Join-Path $projectDir "_raw_jsonl"
        if (-not (Test-Path -LiteralPath $rawJsonlDir) -and (Test-Path -LiteralPath $rawTarget)) {
            try { New-Item -ItemType Junction -Path $rawJsonlDir -Target $rawTarget -ErrorAction Stop | Out-Null } catch {}
        }
    }
    else {
        $rawJsonlDir = Join-Path $projectDir "_raw_jsonl"
        if (-not (Test-Path -LiteralPath $rawJsonlDir)) { New-Item -ItemType Directory -Path $rawJsonlDir -Force | Out-Null }
        $rawCopyPath = Join-Path $rawJsonlDir "$SessionIdIn.jsonl"
        if (-not (Test-Path -LiteralPath $rawCopyPath)) {
            try { Copy-Item -LiteralPath $tpath -Destination $rawCopyPath -Force } catch {}
        }
    }

    $lines = Get-Content -LiteralPath $tpath -Encoding UTF8

    $aiTitles = New-Object System.Collections.Generic.List[string]
    $toolResults = @{}
    $modelUsage = @{}
    $usageById = @{}
    $firstTimestamp = $null
    $lastTimestamp = $null

    # Pass 1: ai-title entries, tool_result-by-id index, token usage per model.
    foreach ($line in $lines) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        try { $o = $line | ConvertFrom-Json } catch { continue }

        if ($o.timestamp) {
            if (-not $firstTimestamp) { $firstTimestamp = $o.timestamp }
            $lastTimestamp = $o.timestamp
        }

        if ($o.type -eq 'ai-title' -and $o.aiTitle) {
            $aiTitles.Add([string]$o.aiTitle)
        }
        elseif ($o.type -eq 'user' -and $o.message -and ($o.message.content -is [System.Array])) {
            foreach ($block in @($o.message.content)) {
                if ($block.type -eq 'tool_result' -and $block.tool_use_id) {
                    $toolResults[[string]$block.tool_use_id] = Get-ToolResultText $block.content
                }
            }
        }
        elseif ($o.type -eq 'assistant' -and $o.message -and $o.message.usage) {
            Set-ResponseUsage -UsageById $usageById -AssistantLine $o
        }
    }
    Add-DedupedModelUsage -ModelUsage $modelUsage -UsageById $usageById

    # Pass 2: reconstruct turns. Consecutive assistant JSONL lines merge into
    # one turn; user string-content flushes as its own single turn; user
    # array-content is tool_result feedback UNLESS it also carries a real
    # text/image block (a genuine human turn, e.g. a Cowork screenshot upload
    # previously mis-classified as pure tool output and silently dropped).
    $toolTally = @{}
    $filesRead = New-Object System.Collections.Generic.List[string]
    $filesWritten = New-Object System.Collections.Generic.List[string]
    $filesEdited = New-Object System.Collections.Generic.List[string]
    $bashCommands = New-Object System.Collections.Generic.List[string]
    $modelsSeen = New-Object System.Collections.Generic.List[string]

    # $state is a hashtable (reference type) precisely so the nested
    # Invoke-FlushTurn below can mutate its entries and have that mutation
    # visible back here. A plain nested function reassigning bare locals
    # (e.g. $currentTextParts = New-Object ...) would NOT propagate back to
    # this scope in PowerShell - nested functions read the parent's locals
    # but reassignment creates a shadow copy local to the nested function.
    # (First draft of this script hit exactly that bug: Flush-Turn used
    # `$script:` instead, which pointed at the calling script's top-level
    # scope rather than this function's locals, leaving $turns permanently
    # empty and every session misclassified as junk. Caught by
    # test-token-aggregation.ps1 before any real transcript was touched.)
    $state = @{
        Turns     = (New-Object System.Collections.Generic.List[object])
        Role      = $null
        TextParts = (New-Object System.Collections.Generic.List[string])
        Calls     = (New-Object System.Collections.Generic.List[string])
    }

    function Invoke-FlushTurn {
        param($State)
        if ($State.Role -and ($State.TextParts.Count -gt 0 -or $State.Calls.Count -gt 0)) {
            $State.Turns.Add([pscustomobject]@{
                role  = $State.Role
                text  = ($State.TextParts -join "`n`n")
                calls = @($State.Calls)
            })
        }
        $State.TextParts = New-Object System.Collections.Generic.List[string]
        $State.Calls = New-Object System.Collections.Generic.List[string]
    }

    foreach ($line in $lines) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        try { $o = $line | ConvertFrom-Json } catch { continue }

        if ($o.type -eq 'user' -and $o.message) {
            $content = $o.message.content
            if ($content -is [string]) {
                if ($content.Trim() -eq '') { continue }
                Invoke-FlushTurn -State $state
                $state.Role = 'user'
                $state.TextParts.Add($content)
                Invoke-FlushTurn -State $state
                $state.Role = $null
            }
            elseif ($content -is [System.Array]) {
                $hasHumanContent = $false
                $humanParts = New-Object System.Collections.Generic.List[string]
                foreach ($block in @($content)) {
                    if ($block.type -eq 'text' -and $block.text) {
                        $hasHumanContent = $true
                        $humanParts.Add([string]$block.text)
                    }
                    elseif ($block.type -eq 'image') {
                        $hasHumanContent = $true
                        $humanParts.Add('[image attached]')
                    }
                }
                if ($hasHumanContent) {
                    Invoke-FlushTurn -State $state
                    $state.Role = 'user'
                    foreach ($p in $humanParts) { $state.TextParts.Add($p) }
                    Invoke-FlushTurn -State $state
                    $state.Role = $null
                }
            }
        }
        elseif ($o.type -eq 'assistant' -and $o.message) {
            if ($state.Role -ne 'assistant') {
                Invoke-FlushTurn -State $state
                $state.Role = 'assistant'
            }
            if ($o.message.model -and $o.message.model -ne '<synthetic>' -and ($modelsSeen -notcontains [string]$o.message.model)) {
                $modelsSeen.Add([string]$o.message.model)
            }
            foreach ($block in @($o.message.content)) {
                if ($block.type -eq 'text' -and $block.text -and $block.text.Trim() -ne '') {
                    $state.TextParts.Add($block.text)
                }
                elseif ($block.type -eq 'tool_use' -and $block.name) {
                    $toolTally[$block.name] = ([int]($toolTally[$block.name]) + 1)
                    $resultText = $toolResults[[string]$block.id]
                    $callLines = Format-ToolCall -Block $block -ResultText $resultText
                    foreach ($cl in $callLines) { $state.Calls.Add($cl) }

                    switch -Regex ($block.name) {
                        '^Read$' { if ($block.input.file_path) { $filesRead.Add([string]$block.input.file_path) } }
                        '^Write$' { if ($block.input.file_path) { $filesWritten.Add([string]$block.input.file_path) } }
                        '^(Edit|MultiEdit)$' { if ($block.input.file_path) { $filesEdited.Add([string]$block.input.file_path) } }
                        '^Bash$' { if ($block.input.command) { $bashCommands.Add([string]$block.input.command) } }
                    }
                }
            }
        }
    }
    Invoke-FlushTurn -State $state
    $turns = $state.Turns

    # @() forces array context - a single matching PSCustomObject has no
    # .Count property in Windows PowerShell 5.1, so without @() a
    # single-match result silently evaluates Count as $null (-gt 0 => False),
    # misclassifying a real session as junk. Caught by
    # test-token-aggregation.ps1's fake transcript (which merges into exactly
    # one assistant turn) before any real backfill.
    $hasRealAssistantContent = @($turns | Where-Object { $_.role -eq 'assistant' -and ($_.text -or $_.calls.Count -gt 0) }).Count -gt 0

    if ($turns.Count -eq 0 -or -not $hasRealAssistantContent) {
        # Junk: no real assistant turns at all. NOTE this deliberately does NOT
        # also require an ai-title, unlike the WSL rule - ai-title is a
        # Claude Code-only JSONL entry type. Cowork transcripts, and a few
        # older Claude Code sessions predating ai-title, never emit it, so
        # gating junk-detection on its presence would wrongly discard every
        # Cowork session and any pre-ai-title Claude Code session.
        New-Item -ItemType File -Path $markerPath -Force | Out-Null
        $result.Status = "junk"
        return $result
    }

    # Title: last ai-title if present; else the first real (non-synthetic-
    # wrapper) human turn, slugged; else a timestamp fallback. Synthetic
    # wrapper turns are Claude Code's own injected <local-command-caveat>,
    # <command-name>, <uploaded_files> blocks that arrive as ordinary
    # string-content user turns - skipping any turn whose trimmed text
    # starts with '<' is what fixes the garbled-title bug at its root.
    $createdDate = if ($firstTimestamp) { ([datetime]$firstTimestamp) } else { (Get-Item -LiteralPath $tpath).LastWriteTime }
    if ($aiTitles.Count -gt 0) {
        $titleLabel = $aiTitles[$aiTitles.Count - 1]
    }
    else {
        $firstRealUserTurn = $turns | Where-Object { $_.role -eq 'user' -and $_.text -and -not ($_.text.TrimStart().StartsWith('<')) -and -not ($_.text.TrimStart().StartsWith('Base directory for this skill:')) } | Select-Object -First 1
        if ($firstRealUserTurn) {
            $slug = New-SlugFromText $firstRealUserTurn.text
            $titleLabel = if ($slug) { $slug } else { "Session $($createdDate.ToString('HHmmss'))" }
        }
        else {
            $titleLabel = "Session $($createdDate.ToString('HHmmss'))"
        }
    }

    $startedAt = if ($firstTimestamp) { ([datetime]$firstTimestamp).ToString("yyyy-MM-ddTHH:mm:ss") } else { "" }
    $endedAt = if ($lastTimestamp) { ([datetime]$lastTimestamp).ToString("yyyy-MM-ddTHH:mm:ss") } else { $startedAt }
    $exportedAt = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
    $durationMinutes = 0
    if ($firstTimestamp -and $lastTimestamp) {
        $durationMinutes = [Math]::Round((([datetime]$lastTimestamp) - ([datetime]$firstTimestamp)).TotalMinutes, 1)
    }

    # Token/cost aggregation across all models used in the session.
    $totalInput = 0; $totalOutput = 0; $totalCacheRead = 0; $totalCacheCreation = 0
    $costUsd = 0.0; $costKnown = $true
    foreach ($m in $modelUsage.Keys) {
        $u = $modelUsage[$m]
        $totalInput += $u.input
        $totalOutput += $u.output
        $totalCacheRead += $u.cache_read
        $totalCacheCreation += ($u.cache_5m + $u.cache_1h)

        $pk = Resolve-PricingKey -Model $m
        if ($pk) {
            $rate = $Pricing[$pk]
            $costUsd += ($u.input * $rate.input + $u.output * $rate.output +
                         $u.cache_read * $rate.input * $rate.read +
                         $u.cache_5m * $rate.input * 1.25 +
                         $u.cache_1h * $rate.input * 2.0) / 1000000
        }
        else {
            $costKnown = $false
        }
    }
    $tokensTotal = $totalInput + $totalOutput + $totalCacheRead + $totalCacheCreation

    $filesTouched = @($filesRead + $filesWritten + $filesEdited) | Select-Object -Unique | Sort-Object

    # Filename: MM-DD {title}.md - no redundant app-name segment, the
    # per-project/per-month folder already identifies source app + project.
    # A re-render of a session already exported once (marker-staleness check
    # above) reuses its exact prior filename instead of computing a fresh
    # candidate - a title change between renders updates the existing note
    # in place, it never spawns a second one.
    if ($reuseOutputName -and (Test-Path -LiteralPath (Join-Path $projectDir $reuseOutputName))) {
        $outputPath = Join-Path $projectDir $reuseOutputName
    }
    else {
        $mmdd = $createdDate.ToString("MM-dd")
        $baseName = "$mmdd $(Sanitize-Filename $titleLabel)"
        $candidate = Join-Path $projectDir "$baseName.md"
        $n = 2
        while (Test-Path -LiteralPath $candidate) {
            $candidate = Join-Path $projectDir "$baseName-$n.md"
            $n++
        }
        $outputPath = $candidate
    }

    $sourceAppTag = if ($SourceAppIn -eq "Cowork") { "cowork" } else { "claude-code" }
    $titleEscaped = ($titleLabel -replace '\\', '\\' -replace '"', '\"')

    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("type: input")
    [void]$sb.AppendLine("input_kind: ai-conversation")
    [void]$sb.AppendLine("source_app: $sourceAppTag")
    [void]$sb.AppendLine("source_os: windows")
    [void]$sb.AppendLine("title: `"$titleEscaped`"")
    [void]$sb.AppendLine("started_at: $startedAt")
    [void]$sb.AppendLine("ended_at: $endedAt")
    [void]$sb.AppendLine("exported_at: $exportedAt")
    [void]$sb.AppendLine("duration_minutes: $durationMinutes")
    [void]$sb.AppendLine("project: $projectName")
    if ($CwdIn) { [void]$sb.AppendLine("cwd: '$CwdIn'") }
    [void]$sb.AppendLine("session_id: $SessionIdIn")
    $createdDay = if ($startedAt.Length -ge 10) { $startedAt.Substring(0, 10) } else { $exportedAt.Substring(0, 10) }
    [void]$sb.AppendLine("status: seed")
    [void]$sb.AppendLine("review_state: raw")
    [void]$sb.AppendLine("created: $createdDay")
    [void]$sb.AppendLine("updated: $($exportedAt.Substring(0, 10))")
    [void]$sb.AppendLine("turn_count: $($turns.Count)")
    if ($toolTally.Count -eq 0) {
        [void]$sb.AppendLine("tools_used: {}")
    }
    else {
        [void]$sb.AppendLine("tools_used:")
        foreach ($t in ($toolTally.Keys | Sort-Object)) {
            [void]$sb.AppendLine("  $t`: $($toolTally[$t])")
        }
    }
    [void]$sb.AppendLine("tokens:")
    [void]$sb.AppendLine("  input: $totalInput")
    [void]$sb.AppendLine("  output: $totalOutput")
    [void]$sb.AppendLine("  cache_creation: $totalCacheCreation")
    [void]$sb.AppendLine("  cache_read: $totalCacheRead")
    [void]$sb.AppendLine("  total: $tokensTotal")
    if ($costKnown) {
        [void]$sb.AppendLine("cost_usd: $([Math]::Round($costUsd, 6))")
    }
    else {
        [void]$sb.AppendLine("cost_usd: null")
    }
    Write-YamlStringList -Sb $sb -Key "model" -Items @($modelsSeen)
    Write-YamlStringList -Sb $sb -Key "files_touched" -Items @($filesTouched)
    [void]$sb.AppendLine("tags:")
    [void]$sb.AppendLine("  - input")
    [void]$sb.AppendLine("  - ai-conversation")
    [void]$sb.AppendLine("  - $sourceAppTag")
    [void]$sb.AppendLine("  - windows")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("# $titleLabel")
    [void]$sb.AppendLine("")

    foreach ($turn in $turns) {
        if ($turn.role -eq 'user') {
            [void]$sb.AppendLine("## You")
            [void]$sb.AppendLine("")
            [void]$sb.AppendLine((Redact-Secrets $turn.text))
            [void]$sb.AppendLine("")
        }
        else {
            [void]$sb.AppendLine("## Claude")
            [void]$sb.AppendLine("")
            if ($turn.text) {
                [void]$sb.AppendLine((Redact-Secrets $turn.text))
                [void]$sb.AppendLine("")
            }
            if ($turn.calls.Count -gt 0) {
                [void]$sb.AppendLine("### Tool Calls")
                [void]$sb.AppendLine("")
                foreach ($cl in $turn.calls) { [void]$sb.AppendLine($cl) }
                [void]$sb.AppendLine("")
            }
        }
    }

    [void]$sb.AppendLine("## Actions Taken")
    [void]$sb.AppendLine("")
    # Every pipeline result here is re-wrapped with @() on assignment, not
    # just on input - Windows PowerShell 5.1 collapses a single-element
    # pipeline result to a bare scalar (no .Count property), unlike pwsh 7.
    $uniqueWritten = @(@($filesWritten) | Select-Object -Unique | Sort-Object)
    $uniqueEdited = @(@($filesEdited) | Where-Object { $uniqueWritten -notcontains $_ } | Select-Object -Unique | Sort-Object)
    $deletedCommands = @(@($bashCommands) | Where-Object { $_ -match '(?i)^\s*(rm |del |remove-item|rd )' } | Select-Object -Unique)
    $uniqueCommands = @(@($bashCommands) | Select-Object -Unique)

    [void]$sb.AppendLine("**Files created:**")
    if ($uniqueWritten.Count -eq 0) { [void]$sb.AppendLine("_None_") } else { foreach ($f in $uniqueWritten) { [void]$sb.AppendLine("- $(Format-InlineCode $f)") } }
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("**Files modified:**")
    if ($uniqueEdited.Count -eq 0) { [void]$sb.AppendLine("_None_") } else { foreach ($f in $uniqueEdited) { [void]$sb.AppendLine("- $(Format-InlineCode $f)") } }
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("**Files deleted (heuristic, from Bash commands):**")
    if ($deletedCommands.Count -eq 0) { [void]$sb.AppendLine("_None detected_") } else { foreach ($c in $deletedCommands) { [void]$sb.AppendLine("- $(Format-InlineCode $c)") } }
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("**Commands run:**")
    if ($uniqueCommands.Count -eq 0) { [void]$sb.AppendLine("_None_") } else { foreach ($c in $uniqueCommands) { [void]$sb.AppendLine("- $(Format-InlineCode $c)") } }
    [void]$sb.AppendLine("")

    Write-Utf8NoBom -Path $outputPath -Text $sb.ToString()
    # Marker content is the note's own relative filename, not an empty touch
    # file - a later re-render (session grew since last export) reads this
    # back to overwrite the same note instead of guessing a fresh name.
    Write-Utf8NoBom -Path $markerPath -Text (Split-Path -Leaf $outputPath)

    $result.Status = "written"
    return $result
}

# ---------------------------------------------------------------------------
# Dispatch. Guarded so this file can be dot-sourced (e.g. by a standalone
# aggregation test) without triggering a real export.
# ---------------------------------------------------------------------------
if ($BackfillAll -or $TranscriptPath) {

    if (-not $OutRoot) {
        # Unknown host: write nothing, leave one line in a local (unsynced) log.
        try {
            $logDir = Join-Path $env:LOCALAPPDATA "claude-capture"
            if (-not (Test-Path -LiteralPath $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
            Add-Content -LiteralPath (Join-Path $logDir "unknown-host.log") -Value "$((Get-Date).ToString('yyyy-MM-ddTHH:mm:ss')) unknown host '$([Environment]::MachineName)': nothing written"
        }
        catch {}
        exit 0
    }

    if ($BackfillAll) {
        $stats = @{}
        $touchedDirs = New-Object System.Collections.Generic.List[string]

        $projectsRoot = Join-Path $env:USERPROFILE ".claude\projects"
        Get-ChildItem -LiteralPath $projectsRoot -Directory | Where-Object { $_.Name -ne 'template' } | ForEach-Object {
            $hashDir = $_.FullName
            Get-ChildItem -LiteralPath $hashDir -Filter "*.jsonl" -File | ForEach-Object {
                $tpath = $_.FullName
                $sid = $_.BaseName
                $cwd = $null
                foreach ($l in (Get-Content -LiteralPath $tpath -TotalCount 20 -Encoding UTF8)) {
                    if ([string]::IsNullOrWhiteSpace($l)) { continue }
                    try { $o = $l | ConvertFrom-Json } catch { continue }
                    if ($o.cwd) { $cwd = [string]$o.cwd; break }
                }
                try {
                    $r = Export-Session -TranscriptPathIn $tpath -SessionIdIn $sid -CwdIn $cwd -SourceAppIn "ClaudeCode"
                }
                catch {
                    # One session's failure (e.g. the note file locked by
                    # Obsidian/another process mid-write) must never abort
                    # the rest of the backfill batch.
                    $r = [ordered]@{ Status = "error"; ProjectDir = $null; Project = "unknown" }
                    Write-Warning "Export failed for session $sid : $_"
                }
                $key = "ClaudeCode:$($r.Project)"
                if (-not $stats.ContainsKey($key)) { $stats[$key] = @{ seen = 0; written = 0; junk = 0; dup = 0; legacy = 0; pending = 0; error = 0 } }
                $stats[$key].seen++
                $stats[$key][$r.Status]++
                if ($r.ProjectDir -and ($touchedDirs -notcontains $r.ProjectDir)) { $touchedDirs.Add($r.ProjectDir) }
            }
        }

        $coworkRoot = Join-Path $env:APPDATA "Claude\local-agent-mode-sessions"
        if (Test-Path -LiteralPath $coworkRoot) {
            $longRoot = if ($coworkRoot.StartsWith('\\?\')) { $coworkRoot } else { "\\?\$coworkRoot" }
            $files = [System.IO.Directory]::EnumerateFiles($longRoot, "*.jsonl", [System.IO.SearchOption]::AllDirectories) |
                Where-Object { (Split-Path $_ -Parent) -like "*-outputs" }
            foreach ($f in $files) {
                $sid = [System.IO.Path]::GetFileNameWithoutExtension($f)
                try {
                    $r = Export-Session -TranscriptPathIn $f -SessionIdIn $sid -CwdIn $null -SourceAppIn "Cowork"
                }
                catch {
                    $r = [ordered]@{ Status = "error"; ProjectDir = $null; Project = "unknown" }
                    Write-Warning "Export failed for Cowork session $sid : $_"
                }
                $key = "Cowork:$($r.Project)"
                if (-not $stats.ContainsKey($key)) { $stats[$key] = @{ seen = 0; written = 0; junk = 0; dup = 0; legacy = 0; pending = 0; error = 0 } }
                $stats[$key].seen++
                $stats[$key][$r.Status]++
                if ($r.ProjectDir -and ($touchedDirs -notcontains $r.ProjectDir)) { $touchedDirs.Add($r.ProjectDir) }
            }
        }

        if (-not $DryRun) {
            foreach ($d in $touchedDirs) { Update-Rollups -ProjectDir $d }
        }

        Write-Output "=== Backfill summary ($Machine, DryRun=$([bool]$DryRun)) ==="
        foreach ($k in ($stats.Keys | Sort-Object)) {
            $s = $stats[$k]
            Write-Output "$k -- seen:$($s.seen) written:$($s.written) junk:$($s.junk) dup:$($s.dup) legacy:$($s.legacy) pending:$($s.pending) error:$($s.error)"
        }
    }
    else {
        $r = Export-Session -TranscriptPathIn $TranscriptPath -SessionIdIn $SessionId -CwdIn $Cwd -SourceAppIn $SourceApp
        if ($r.ProjectDir -and -not $DryRun) { Update-Rollups -ProjectDir $r.ProjectDir }
        Write-Output "Status: $($r.Status) -- Project: $($r.Project)"
    }
}
