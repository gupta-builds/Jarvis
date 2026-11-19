param()

# PostToolUse check for course notes. Fires after Write/Edit/MultiEdit and is a no-op
# outside 20_Progress/Degree/ or for non-Markdown files. It runs Vault Lint on the one
# file that was written and reports any failure or warning (cards in a textbook note,
# a note over the word budget, a missing heading) back to the model as context.
# Informational only: PostToolUse cannot undo a write. Fails open on any problem.

$ErrorActionPreference = "Stop"
$raw = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }
try { $payload = $raw | ConvertFrom-Json } catch { exit 0 }

$tool = [string]$payload.tool_name
if ($tool -notin @("Write", "Edit", "MultiEdit")) { exit 0 }
$filePath = [string]$payload.tool_input.file_path
if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }
if (-not $filePath.ToLowerInvariant().EndsWith(".md")) { exit 0 }

$root = (Resolve-Path (Join-Path $PSScriptRoot "..\..\..\..")).Path
$norm = ($filePath -replace '/', '\')
if (-not $norm.ToLowerInvariant().StartsWith($root.ToLowerInvariant())) { exit 0 }
$rel = $norm.Substring($root.Length).TrimStart([char]92).Replace([string][char]92, '/')
if ($rel -notmatch '^20_Progress/Degree/') { exit 0 }
if ($rel -match '\(Prompts\)\.md$') { exit 0 }

try {
    $lint = Join-Path $root "30_Order\System\vault-lint\vault-lint.js"
    $out = & node $lint --path $rel --list 5 2>&1 | Out-String
} catch { exit 0 }

$lines = $out -split "\r?\n" | Where-Object { $_ -match "^\s+20_Progress/" -or $_ -match "^FIT" }
$bad = $lines | Where-Object { $_ -match "^\s+20_Progress/" }
if (-not $bad) { exit 0 }

$msg = "course-lint: " + (($bad | Select-Object -First 4) -join " | ") + ". Fix against the note's Standard in 30_Order/Standards/Courses/ before moving on."
@{
    hookSpecificOutput = @{
        hookEventName     = "PostToolUse"
        additionalContext = $msg
    }
} | ConvertTo-Json -Depth 5 -Compress
exit 0
