# wsl-session-export.ps1
# SessionEnd hook - exports every WSL Claude Code session to the Jarvis vault,
# per-project, with full tool-call capture (not just tool names).
# Must NEVER block session exit: every side effect is wrapped in try/catch
# that fails open, and this always exits 0.
#
# Also supports -BackfillAll: enumerate every ~/.claude/projects/**/*.jsonl
# and run each through the same export logic (idempotent - safe to re-run).

param(
    [switch]$BackfillAll,
    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

# Build 5c: shared vault copy, derived from the Dell's old hook file. Changed
# from that file: root resolution (from this script's own location, like the
# Windows exporter), the <Machine> segment, the legacy-marker check,
# create-if-missing, and -DryRun.
$VaultRoot = (Resolve-Path (Join-Path $PSScriptRoot "../../../..")).Path
$ConvRoot = Join-Path $VaultRoot "60_Claude/05_Clippings/AI Conversations"
$Machine = switch ([Environment]::MachineName.ToLowerInvariant()) {
    'desktop-3vbg0jh' { 'Dell' }
    'gupta-builds' { 'Acer' }
    default { $null }
}
if (-not $Machine) {
    # Unknown host: write nothing, leave one line in a local (unsynced) log.
    try {
        $logDir = Join-Path $env:HOME ".local/state/claude-capture"
        New-Item -ItemType Directory -Path $logDir -Force | Out-Null
        Add-Content -LiteralPath (Join-Path $logDir "unknown-host.log") -Value "$((Get-Date).ToString('yyyy-MM-ddTHH:mm:ss')) unknown host '$([Environment]::MachineName)': nothing written"
    }
    catch {}
    exit 0
}
$VaultConvRoot = Join-Path $ConvRoot "$Machine/WSL/Claude"
$VaultConvRel = "60_Claude/05_Clippings/AI Conversations/$Machine/WSL/Claude"

# Sessions exported before build 5c live under the old WSL/ tree and the Dell/
# archive. Their .exported markers count as "already exported". Read-only;
# built once per run.
$script:LegacyIds = $null
function Test-LegacyExported {
    param([string]$SessionIdIn)
    if ($null -eq $script:LegacyIds) {
        $script:LegacyIds = New-Object 'System.Collections.Generic.HashSet[string]'
        $patterns = @(
            'WSL/Claude Code/*/.exported/*.done',
            'Dell/WSL/Claude/*/.exported/*.done'
        )
        foreach ($p in $patterns) {
            Get-ChildItem -Path (Join-Path $ConvRoot $p) -File -Force -ErrorAction SilentlyContinue |
                ForEach-Object { [void]$script:LegacyIds.Add($_.BaseName) }
        }
    }
    return $script:LegacyIds.Contains($SessionIdIn)
}

# Pricing per Anthropic API list price, looked up 2026-07-30 via the claude-api
# skill (cached 2026-06-24). Update this table if pricing changes.
# Sonnet 5 intro pricing ($2/$10 per MTok) runs through 2026-08-31; reverts to
# $3/$15 after that date - update the row below once it lapses.
$Pricing = @{
    "claude-fable-5"    = @{ input = 10.00; output = 50.00 }
    "claude-mythos-5"   = @{ input = 10.00; output = 50.00 }
    "claude-opus-5"     = @{ input = 5.00; output = 25.00 }
    "claude-opus-4-8"   = @{ input = 5.00; output = 25.00 }
    "claude-opus-4-7"   = @{ input = 5.00; output = 25.00 }
    "claude-opus-4-6"   = @{ input = 5.00; output = 25.00 }
    "claude-sonnet-5"   = @{ input = 2.00; output = 10.00 }
    "claude-sonnet-4-6" = @{ input = 3.00; output = 15.00 }
    "claude-haiku-4-5"  = @{ input = 1.00; output = 5.00 }
}

function Resolve-PricingKey {
    param([string]$Model)
    if (-not $Model -or $Model -eq '<synthetic>') { return $null }
    $key = $Model -replace '-\d{8}$', '' -replace '\[1m\]$', ''
    if ($Pricing.ContainsKey($key)) { return $key }
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

function Sanitize-Filename {
    param([string]$Text)
    if (-not $Text) { return "" }
    $clean = $Text -replace '[<>:"/\\|?*`]', ''
    $clean = $clean -replace '\s+', ' '
    $clean = $clean.Trim()
    if ($clean.Length -gt 80) {
        $truncated = $clean.Substring(0, 80)
        $lastSpace = $truncated.LastIndexOf(' ')
        if ($lastSpace -gt 20) { $truncated = $truncated.Substring(0, $lastSpace) }
        $clean = $truncated.Trim()
    }
    return $clean
}

function Get-ToolResultText {
    param($Content)
    if (-not $Content) { return "" }
    if ($Content -is [string]) { return $Content }
    $parts = @($Content) | ForEach-Object {
        if ($_.type -eq 'text' -and $_.text) { $_.text } else { $_ | ConvertTo-Json -Compress -Depth 6 }
    }
    return ($parts -join "`n")
}

function Format-ToolCall {
    param($Block, [string]$ResultText)

    $name = $Block.name
    $input = $Block.input
    $result = Redact-Secrets $ResultText
    $lines = New-Object System.Collections.Generic.List[string]

    switch -Regex ($name) {
        '^(Read)$' {
            $lines.Add("- ``$name`` — ``$($input.file_path)``")
        }
        '^(Write)$' {
            $lines.Add("- ``$name`` — ``$($input.file_path)``")
            if ($input.content) {
                $lines.Add('  ```')
                $lines.Add((Redact-Secrets $input.content))
                $lines.Add('  ```')
            }
        }
        '^(Edit)$' {
            $lines.Add("- ``$name`` — ``$($input.file_path)``")
            $lines.Add('  ```diff')
            $lines.Add("  - $(Redact-Secrets $input.old_string)")
            $lines.Add("  + $(Redact-Secrets $input.new_string)")
            $lines.Add('  ```')
        }
        '^(MultiEdit)$' {
            $lines.Add("- ``$name`` — ``$($input.file_path)``")
            foreach ($edit in @($input.edits)) {
                $lines.Add('  ```diff')
                $lines.Add("  - $(Redact-Secrets $edit.old_string)")
                $lines.Add("  + $(Redact-Secrets $edit.new_string)")
                $lines.Add('  ```')
            }
        }
        '^(Bash)$' {
            # A command with embedded newlines breaks a single-line backtick
            # span - render those in their own fenced block instead.
            if ($input.command -match "`n") {
                $lines.Add("- ``$name``:")
                $lines.Add('  ```bash')
                $lines.Add($input.command)
                $lines.Add('  ```')
            } else {
                $lines.Add("- ``$name`` — ``$($input.command)``")
            }
            if ($result) {
                $lines.Add('  ```')
                $lines.Add($result)
                $lines.Add('  ```')
            }
        }
        '^(Grep|Glob)$' {
            $pattern = if ($input.pattern) { $input.pattern } else { $input.glob_pattern }
            $path = if ($input.path) { $input.path } else { "." }
            $lines.Add("- ``$name`` — pattern ``$pattern``, path ``$path``")
        }
        default {
            $dump = Redact-Secrets ($input | ConvertTo-Json -Compress -Depth 6)
            $lines.Add("- ``$name`` — ``$dump``")
        }
    }
    return $lines
}

function Update-Rollups {
    # Fully static (per-project name is the only variable) - Obsidian's
    # Dataview plugin computes the actual aggregation at render time from
    # each session note's frontmatter, so this never drifts or needs to
    # re-parse existing notes.
    param([string]$ProjectDir, [string]$ProjectName)

    $indexPath = Join-Path $ProjectDir "00 - Session Index.md"
    $rollupPath = Join-Path $ProjectDir "00 - Tool Usage Rollup.md"
    $vaultRelPath = "$VaultConvRel/$ProjectName"

    $idx = @"
---
type: dashboard
status: auto-generated
tags:
  - claude-code
  - wsl
---
# Session Index — $ProjectName

``````dataview
TABLE WITHOUT ID
  file.link AS "Session",
  started_at AS "Session Ran",
  exported_at AS "Added to Jarvis",
  turn_count AS "Turns",
  duration_minutes AS "Duration (min)",
  tokens.total AS "Tokens",
  cost_usd AS "Cost (`$)"
FROM "$vaultRelPath"
WHERE type = "input"
SORT started_at DESC
``````
"@
    Set-Content -LiteralPath $indexPath -Value $idx -Encoding UTF8

    $roll = @"
---
type: dashboard
status: auto-generated
tags:
  - claude-code
  - wsl
---
# Tool Usage Rollup — $ProjectName

``````dataviewjs
const pages = dv.pages(`"$vaultRelPath"`).where(p => p.type === "input");
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
dv.paragraph("**Total tokens:** " + tokenTotal + " — **Total cost:** `$" + costTotal.toFixed(4));
dv.header(2, "Tool usage");
dv.table(["Tool", "Total uses"], Object.entries(toolTotals).sort((a, b) => b[1] - a[1]));
dv.header(2, "Files touched (by session count)");
dv.table(["File", "Sessions"], Object.entries(fileSessions).sort((a, b) => b[1] - a[1]));
``````
"@
    Set-Content -LiteralPath $rollupPath -Value $roll -Encoding UTF8
}

function Export-Session {
    param(
        [string]$TranscriptPath,
        [string]$Cwd,
        [string]$SessionId,
        [string]$ExportedAt
    )

    $result = [pscustomobject]@{ Status = "error"; Project = $null }

    if (-not $Cwd -or -not $SessionId -or -not $TranscriptPath) { return $result }
    if (-not (Test-Path -LiteralPath $TranscriptPath)) { return $result }

    $projectName = Split-Path -Path ($Cwd.TrimEnd('/')) -Leaf
    if (-not $projectName) { $projectName = "unknown" }
    $result.Project = $projectName

    $projectDir = Join-Path $VaultConvRoot $projectName
    $rawDir = Join-Path $projectDir "_raw_jsonl"
    $markerDir = Join-Path $projectDir ".exported"
    $markerPath = Join-Path $markerDir "$SessionId.done"

    $hasMarker = Test-Path -LiteralPath $markerPath
    if (-not $hasMarker -and (Test-LegacyExported $SessionId)) {
        $result.Status = "legacy"
        return $result
    }
    if ($DryRun) {
        $grown = $true
        if ($hasMarker) {
            $grown = (Get-Item -LiteralPath $TranscriptPath).LastWriteTimeUtc -gt (Get-Item -LiteralPath $markerPath).LastWriteTimeUtc
        }
        $result.Status = if ($grown) { "pending" } else { "dup" }
        return $result
    }

    # Create-if-missing: the first export on a machine builds the tree.
    New-Item -ItemType Directory -Path $rawDir -Force | Out-Null
    New-Item -ItemType Directory -Path $markerDir -Force | Out-Null

    # Marker mtime vs transcript mtime, matching export-claude-session.ps1's
    # Windows-side design (brought to parity 2026-08-11) - the raw copy used
    # to BE the dedup gate, which meant a session re-checked after it grew
    # (e.g. a Stop-hook export) was silently skipped forever instead of
    # updated. Now the marker is the gate and the raw copy is a plain mirror.
    $reuseOutputName = $null
    if (Test-Path -LiteralPath $markerPath) {
        $markerTime = (Get-Item -LiteralPath $markerPath).LastWriteTimeUtc
        $transcriptTime = (Get-Item -LiteralPath $TranscriptPath).LastWriteTimeUtc
        if ($transcriptTime -le $markerTime) {
            $result.Status = "dup"
            return $result
        }
        # Transcript grew since the last export - re-render in place. Reuse
        # the marker's stored filename (or find the note by its own
        # session_id frontmatter, for markers from before this change) so a
        # later ai-title never orphans a stale duplicate note.
        $storedName = Get-Content -LiteralPath $markerPath -Raw -ErrorAction SilentlyContinue
        if ($storedName) { $reuseOutputName = $storedName.Trim() }
        if (-not $reuseOutputName) {
            $existingMatch = Get-ChildItem -LiteralPath $projectDir -Filter "*.md" -File -ErrorAction SilentlyContinue |
                Where-Object { $_.Name -notlike "00 - *" } |
                Where-Object {
                    $head = Get-Content -LiteralPath $_.FullName -TotalCount 20 -ErrorAction SilentlyContinue
                    $head -match "^session_id: $([regex]::Escape($SessionId))$"
                } |
                Select-Object -First 1
            if ($existingMatch) { $reuseOutputName = $existingMatch.Name }
        }
    }

    $rawCopyPath = Join-Path $rawDir "$SessionId.jsonl"
    Copy-Item -LiteralPath $TranscriptPath -Destination $rawCopyPath -Force

    $lines = Get-Content -LiteralPath $TranscriptPath -Encoding UTF8

    # Pass 1: tool_result text by tool_use_id, per-model token usage, ai-title(s), timestamps.
    $toolResults = @{}
    $modelUsage = @{}
    $aiTitles = New-Object System.Collections.Generic.List[string]
    $firstTimestamp = $null
    $lastTimestamp = $null

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
        elseif ($o.type -eq 'user' -and $o.message -and ($o.message.content -is [array])) {
            foreach ($block in @($o.message.content)) {
                if ($block.type -eq 'tool_result' -and $block.tool_use_id) {
                    $toolResults[$block.tool_use_id] = Get-ToolResultText $block.content
                }
            }
        }
        elseif ($o.type -eq 'assistant' -and $o.message -and $o.message.usage) {
            $model = [string]$o.message.model
            if ($model -and $model -ne '<synthetic>') {
                if (-not $modelUsage.ContainsKey($model)) {
                    $modelUsage[$model] = @{ input = 0; output = 0; cache_read = 0; cache_5m = 0; cache_1h = 0 }
                }
                $u = $o.message.usage
                if ($u.input_tokens) { $modelUsage[$model].input += [int]$u.input_tokens }
                if ($u.output_tokens) { $modelUsage[$model].output += [int]$u.output_tokens }
                if ($u.cache_read_input_tokens) { $modelUsage[$model].cache_read += [int]$u.cache_read_input_tokens }
                if ($u.cache_creation) {
                    if ($u.cache_creation.ephemeral_5m_input_tokens) { $modelUsage[$model].cache_5m += [int]$u.cache_creation.ephemeral_5m_input_tokens }
                    if ($u.cache_creation.ephemeral_1h_input_tokens) { $modelUsage[$model].cache_1h += [int]$u.cache_creation.ephemeral_1h_input_tokens }
                }
                elseif ($u.cache_creation_input_tokens) {
                    $modelUsage[$model].cache_5m += [int]$u.cache_creation_input_tokens
                }
            }
        }
    }

    # Pass 2: reconstruct turns, tool tally, files created/modified, commands run.
    $turns = New-Object System.Collections.Generic.List[object]
    $toolTally = @{}
    $filesCreated = New-Object System.Collections.Generic.List[string]
    $filesModified = New-Object System.Collections.Generic.List[string]
    $filesTouched = New-Object System.Collections.Generic.List[string]
    $commandsRun = New-Object System.Collections.Generic.List[string]
    # A shared hashtable (not bare variables) so the nested Flush-Turn can
    # mutate the loop's accumulator state - PowerShell nested functions don't
    # share a parent function's local scope, but they do share a reference
    # object's contents.
    $state = @{
        Role      = $null
        TextParts = (New-Object System.Collections.Generic.List[string])
        Calls     = (New-Object System.Collections.Generic.List[string])
    }

    function Flush-Turn {
        if ($state.Role -and ($state.TextParts.Count -gt 0 -or $state.Calls.Count -gt 0)) {
            $turns.Add([pscustomobject]@{
                role  = $state.Role
                text  = ($state.TextParts -join "`n`n")
                calls = @($state.Calls)
            })
        }
        $state.TextParts = New-Object System.Collections.Generic.List[string]
        $state.Calls = New-Object System.Collections.Generic.List[string]
    }

    foreach ($line in $lines) {
        if ([string]::IsNullOrWhiteSpace($line)) { continue }
        try { $o = $line | ConvertFrom-Json } catch { continue }

        if ($o.type -eq 'user' -and $o.message) {
            $content = $o.message.content
            if ($content -is [string]) {
                if ($content.Trim() -eq '') { continue }
                Flush-Turn
                $state.Role = 'user'
                $state.TextParts.Add($content)
                Flush-Turn
                $state.Role = $null
            }
            elseif ($content -is [array]) {
                # A tool_result echo (already captured in Pass 1 for tool-call
                # rendering) is not a human turn, but a genuine text/image
                # block attached alongside one is - this was previously
                # dropped silently. Same fix Windows/Claude Code applied
                # 2026-07-31 for the equivalent Cowork-attachment bug.
                $humanParts = New-Object System.Collections.Generic.List[string]
                foreach ($block in @($content)) {
                    if ($block.type -eq 'text' -and $block.text -and $block.text.Trim() -ne '') {
                        $humanParts.Add($block.text)
                    }
                    elseif ($block.type -eq 'image') {
                        $humanParts.Add("[image attached]")
                    }
                }
                if ($humanParts.Count -gt 0) {
                    Flush-Turn
                    $state.Role = 'user'
                    foreach ($p in $humanParts) { $state.TextParts.Add($p) }
                    Flush-Turn
                    $state.Role = $null
                }
            }
        }
        elseif ($o.type -eq 'assistant' -and $o.message) {
            if ($state.Role -ne 'assistant') {
                Flush-Turn
                $state.Role = 'assistant'
            }
            foreach ($block in @($o.message.content)) {
                if ($block.type -eq 'text' -and $block.text -and $block.text.Trim() -ne '') {
                    $state.TextParts.Add($block.text)
                }
                elseif ($block.type -eq 'tool_use' -and $block.name) {
                    $toolTally[$block.name] = ($toolTally[$block.name] + 1)
                    $resultText = $toolResults[$block.id]
                    $callLines = Format-ToolCall -Block $block -ResultText $resultText
                    foreach ($cl in $callLines) { $state.Calls.Add($cl) }

                    switch -Regex ($block.name) {
                        '^(Read|Write|Edit|MultiEdit)$' {
                            if ($block.input.file_path) {
                                [void]$filesTouched.Add($block.input.file_path)
                                if ($block.name -eq 'Write') { [void]$filesCreated.Add($block.input.file_path) }
                                if ($block.name -in @('Edit', 'MultiEdit')) { [void]$filesModified.Add($block.input.file_path) }
                            }
                        }
                        '^Bash$' {
                            if ($block.input.command) { [void]$commandsRun.Add($block.input.command) }
                        }
                    }
                }
            }
        }
    }
    Flush-Turn

    $hasRealAssistantContent = ($turns | Where-Object { $_.role -eq 'assistant' -and ($_.text -or $_.calls.Count -gt 0) }).Count -gt 0

    if (-not $hasRealAssistantContent) {
        New-Item -ItemType File -Path $markerPath -Force | Out-Null
        $result.Status = "junk"
        return $result
    }

    # ai-title is preferred, but its absence must not discard an otherwise
    # real session - fall back to the first real human turn, skipping any
    # text that starts with '<' (Claude Code's own injected wrapper blocks:
    # <local-command-caveat>, <command-name>, <uploaded_files>, etc.). Same
    # fix Windows/Claude Code applied 2026-07-31 for its garbled-title bug,
    # and the same reason it does NOT require ai-title either.
    $sessionTitle = $null
    if ($aiTitles.Count -gt 0) {
        $sessionTitle = $aiTitles[$aiTitles.Count - 1]
    }
    else {
        $firstHumanTurn = $turns | Where-Object { $_.role -eq 'user' -and $_.text -and -not $_.text.TrimStart().StartsWith('<') } | Select-Object -First 1
        if ($firstHumanTurn) {
            $collapsed = ($firstHumanTurn.text -replace '\s+', ' ').Trim()
            if ($collapsed.Length -gt 80) { $collapsed = $collapsed.Substring(0, 80).Trim() }
            if ($collapsed) { $sessionTitle = $collapsed }
        }
    }

    if (-not $sessionTitle) {
        New-Item -ItemType File -Path $markerPath -Force | Out-Null
        $result.Status = "junk"
        return $result
    }
    $sanitizedTitle = Sanitize-Filename $sessionTitle

    $createdDate = if ($firstTimestamp) { [datetime]$firstTimestamp } else { Get-Date }
    $startedAt = if ($firstTimestamp) { ([datetime]$firstTimestamp).ToString("yyyy-MM-ddTHH:mm:ss") } else { "" }
    $endedAt = if ($lastTimestamp) { ([datetime]$lastTimestamp).ToString("yyyy-MM-ddTHH:mm:ss") } else { "" }
    $durationMinutes = 0
    if ($firstTimestamp -and $lastTimestamp) {
        $durationMinutes = [Math]::Round((([datetime]$lastTimestamp) - ([datetime]$firstTimestamp)).TotalMinutes)
    }

    if ($reuseOutputName -and (Test-Path -LiteralPath (Join-Path $projectDir $reuseOutputName))) {
        $outputPath = Join-Path $projectDir $reuseOutputName
    }
    else {
        $mmdd = $createdDate.ToString("MM-dd")
        $baseName = "$mmdd $sanitizedTitle"
        $candidate = Join-Path $projectDir "$baseName.md"
        $n = 2
        while (Test-Path -LiteralPath $candidate) {
            $candidate = Join-Path $projectDir "$baseName-$n.md"
            $n++
        }
        $outputPath = $candidate
    }

    # Cost: per model, summed. cache_5m at 1.25x input rate, cache_1h at 2x,
    # cache_read at 0.1x - see shared/prompt-caching.md pricing multipliers.
    $totalInput = 0; $totalOutput = 0; $totalCacheRead = 0; $totalCacheCreation = 0
    $costUsd = 0
    $costKnown = $true
    $modelList = New-Object System.Collections.Generic.List[string]
    foreach ($model in $modelUsage.Keys) {
        $u = $modelUsage[$model]
        $totalInput += $u.input
        $totalOutput += $u.output
        $totalCacheRead += $u.cache_read
        $totalCacheCreation += ($u.cache_5m + $u.cache_1h)
        $modelList.Add($model)

        $priceKey = Resolve-PricingKey $model
        if (-not $priceKey) { $costKnown = $false; continue }
        $rate = $Pricing[$priceKey]
        $costUsd += ($u.input * $rate.input + $u.output * $rate.output +
                     $u.cache_read * $rate.input * 0.1 +
                     $u.cache_5m * $rate.input * 1.25 +
                     $u.cache_1h * $rate.input * 2.0) / 1000000
    }
    $tokensTotal = $totalInput + $totalOutput + $totalCacheRead + $totalCacheCreation

    $filesCreatedUniq = @($filesCreated | Select-Object -Unique)
    $filesModifiedUniq = @($filesModified | Select-Object -Unique)
    $filesTouchedUniq = @($filesTouched | Select-Object -Unique)
    $commandsRunUniq = @($commandsRun | Select-Object -Unique)

    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("type: input")
    [void]$sb.AppendLine("input_kind: ai-conversation")
    [void]$sb.AppendLine("source_app: claude-code")
    [void]$sb.AppendLine("source_os: wsl")
    [void]$sb.AppendLine("title: `"$($sessionTitle -replace '"','\"')`"")
    [void]$sb.AppendLine("started_at: $startedAt")
    [void]$sb.AppendLine("ended_at: $endedAt")
    [void]$sb.AppendLine("duration_minutes: $durationMinutes")
    [void]$sb.AppendLine("exported_at: $ExportedAt")
    [void]$sb.AppendLine("project: $projectName")
    [void]$sb.AppendLine("cwd: '$Cwd'")
    [void]$sb.AppendLine("session_id: $SessionId")
    [void]$sb.AppendLine("status: raw")
    [void]$sb.AppendLine("turn_count: $($turns.Count)")
    [void]$sb.AppendLine("tools_used:")
    foreach ($t in ($toolTally.Keys | Sort-Object)) {
        [void]$sb.AppendLine("  $t`: $($toolTally[$t])")
    }
    [void]$sb.AppendLine("tokens:")
    [void]$sb.AppendLine("  input: $totalInput")
    [void]$sb.AppendLine("  output: $totalOutput")
    [void]$sb.AppendLine("  cache_creation: $totalCacheCreation")
    [void]$sb.AppendLine("  cache_read: $totalCacheRead")
    [void]$sb.AppendLine("  total: $tokensTotal")
    if ($costKnown) {
        [void]$sb.AppendLine("cost_usd: $([Math]::Round($costUsd, 6))")
    } else {
        [void]$sb.AppendLine("cost_usd: null")
    }
    [void]$sb.AppendLine("model:")
    foreach ($m in $modelList) { [void]$sb.AppendLine("  - $m") }
    if ($filesTouchedUniq.Count -gt 0) {
        [void]$sb.AppendLine("files_touched:")
        foreach ($f in $filesTouchedUniq) { [void]$sb.AppendLine("  - `"$f`"") }
    }
    [void]$sb.AppendLine("tags:")
    [void]$sb.AppendLine("  - input")
    [void]$sb.AppendLine("  - ai-conversation")
    [void]$sb.AppendLine("  - claude-code")
    [void]$sb.AppendLine("  - wsl")
    [void]$sb.AppendLine("---")
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("# $sessionTitle")
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
                [void]$sb.AppendLine("**Tool calls:**")
                [void]$sb.AppendLine("")
                foreach ($cl in $turn.calls) { [void]$sb.AppendLine($cl) }
                [void]$sb.AppendLine("")
            }
        }
    }

    [void]$sb.AppendLine("## Actions Taken")
    [void]$sb.AppendLine("- Files created: $(if ($filesCreatedUniq.Count -gt 0) { $filesCreatedUniq -join ', ' } else { '(none)' })")
    [void]$sb.AppendLine("- Files modified: $(if ($filesModifiedUniq.Count -gt 0) { $filesModifiedUniq -join ', ' } else { '(none)' })")
    [void]$sb.AppendLine("- Files deleted: (none)")
    # Collapse embedded newlines per-command so a multi-line script doesn't
    # blow up this one-line summary - the full command is already in the
    # per-turn Tool Calls section above with its own fenced block.
    $commandsRunFlat = @($commandsRunUniq | ForEach-Object { $_ -replace '\s+', ' ' })
    [void]$sb.AppendLine("- Commands run: $(if ($commandsRunFlat.Count -gt 0) { (Redact-Secrets ($commandsRunFlat -join ', ')) } else { '(none)' })")
    $tallyStr = ($toolTally.Keys | Sort-Object | ForEach-Object { "$_ ($($toolTally[$_]))" }) -join ', '
    [void]$sb.AppendLine("- Tool call tally: $tallyStr")

    Set-Content -LiteralPath $outputPath -Value $sb.ToString() -Encoding UTF8
    Set-Content -LiteralPath $markerPath -Value (Split-Path -Leaf $outputPath) -Encoding UTF8

    $result.Status = "written"
    return $result
}

try {
    if ($BackfillAll) {
        # Plain ISO, no fractional seconds/offset - matches started_at/ended_at
        # and Windows/Claude Code's 2026-07-31 rebuild, which normalized this
        # exact inconsistency (WSL previously used the round-trip "o" format
        # for this one key only).
        $exportedAt = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")
        $projectsRoot = Join-Path $env:HOME ".claude/projects"
        $touchedProjects = @{}
        $counts = @{}

        $transcripts = Get-ChildItem -LiteralPath $projectsRoot -Directory |
            Where-Object { $_.Name -ne "template" } |
            ForEach-Object { Get-ChildItem -LiteralPath $_.FullName -Filter "*.jsonl" -File -ErrorAction SilentlyContinue }

        foreach ($t in $transcripts) {
            $cwd = $null
            $sessionId = [System.IO.Path]::GetFileNameWithoutExtension($t.Name)
            try {
                foreach ($line in (Get-Content -LiteralPath $t.FullName -Encoding UTF8 -TotalCount 20)) {
                    if ([string]::IsNullOrWhiteSpace($line)) { continue }
                    try { $o = $line | ConvertFrom-Json } catch { continue }
                    if ($o.cwd) { $cwd = [string]$o.cwd; break }
                }
            } catch { continue }
            if (-not $cwd) { continue }

            try {
                $r = Export-Session -TranscriptPath $t.FullName -Cwd $cwd -SessionId $sessionId -ExportedAt $exportedAt
            }
            catch {
                # One session's failure (e.g. a locked note file) must never
                # abort the rest of the backfill batch.
                Write-Warning "Export failed for session $sessionId : $_"
                continue
            }
            if ($r.Project) {
                $touchedProjects[$r.Project] = $true
                if (-not $counts.ContainsKey($r.Project)) {
                    $counts[$r.Project] = @{ seen = 0; written = 0; junk = 0; dup = 0; legacy = 0; pending = 0 }
                }
                $counts[$r.Project].seen++
                switch ($r.Status) {
                    "written" { $counts[$r.Project].written++ }
                    "junk"    { $counts[$r.Project].junk++ }
                    "dup"     { $counts[$r.Project].dup++ }
                    "legacy"  { $counts[$r.Project].legacy++ }
                    "pending" { $counts[$r.Project].pending++ }
                }
            }
        }

        if (-not $DryRun) {
            foreach ($p in $touchedProjects.Keys) {
                $projectDir = Join-Path $VaultConvRoot $p
                try { Update-Rollups -ProjectDir $projectDir -ProjectName $p } catch {}
            }
        }

        Write-Output "=== Backfill summary ($Machine, DryRun=$([bool]$DryRun)) ==="
        foreach ($p in ($counts.Keys | Sort-Object)) {
            $c = $counts[$p]
            Write-Output "$p : seen=$($c.seen) written=$($c.written) junk=$($c.junk) dup=$($c.dup) legacy=$($c.legacy) pending=$($c.pending)"
        }
    }
    else {
        $rawInput = [Console]::In.ReadToEnd()
        if ([string]::IsNullOrWhiteSpace($rawInput)) { exit 0 }

        $hookInput = $null
        try { $hookInput = $rawInput | ConvertFrom-Json } catch { exit 0 }
        if (-not $hookInput) { exit 0 }
        $eventName = [string]$hookInput.hook_event_name
        if ($eventName -ne "SessionEnd" -and $eventName -ne "Stop") { exit 0 }

        $cwd = [string]$hookInput.cwd
        $sessionId = [string]$hookInput.session_id
        $transcriptPath = [string]$hookInput.transcript_path
        # Plain ISO, no fractional seconds/offset - matches started_at/ended_at
        # and Windows/Claude Code's 2026-07-31 rebuild, which normalized this
        # exact inconsistency (WSL previously used the round-trip "o" format
        # for this one key only).
        $exportedAt = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ss")

        $r = Export-Session -TranscriptPath $transcriptPath -Cwd $cwd -SessionId $sessionId -ExportedAt $exportedAt
        if ($r.Project) {
            try {
                $projectDir = Join-Path $VaultConvRoot $r.Project
                Update-Rollups -ProjectDir $projectDir -ProjectName $r.Project
            } catch {}
        }
    }
} catch {
    # fail open - never block session exit on a bad or half-written transcript
}

exit 0
