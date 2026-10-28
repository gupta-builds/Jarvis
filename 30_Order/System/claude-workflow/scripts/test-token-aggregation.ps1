# Standalone proof that tools_used/tokens/cost_usd/model aggregation actually
# populates (not the WSL-style silent-empty bug) before running any real
# backfill. Builds its own synthetic transcript with known values, feeds it to
# Export-Session, and diffs the written frontmatter against expected numbers.

$ErrorActionPreference = "Stop"

$scriptPath = Join-Path $PSScriptRoot "export-claude-session.ps1"
. $scriptPath   # dispatch is guarded off since no -TranscriptPath/-BackfillAll passed here

$work = Join-Path $env:TEMP "export-agg-test-$(Get-Random)"
$srcDir = Join-Path $work "src"
$OutRoot = Join-Path $work "out"
New-Item -ItemType Directory -Path $srcDir, $OutRoot -Force | Out-Null

# Two responses. msg_1 spans two JSONL lines (same id, same usage) so the dedup is
# exercised too. Totals: input 300, output 135, cache_read 20, 5m write 10, 1h write 5.
$usage1 = @{ input_tokens = 100; output_tokens = 40; cache_read_input_tokens = 10; cache_creation = @{ ephemeral_5m_input_tokens = 10; ephemeral_1h_input_tokens = 0 } }
$usage2 = @{ input_tokens = 200; output_tokens = 95; cache_read_input_tokens = 10; cache_creation = @{ ephemeral_5m_input_tokens = 0; ephemeral_1h_input_tokens = 5 } }
function New-AssistantLine($id, $uuid, $usage, $block, $ts) {
    $msg = @{ id = $id; role = "assistant"; model = "claude-sonnet-5"; content = @($block); usage = $usage }
    (@{ type = "assistant"; uuid = $uuid; timestamp = $ts; cwd = $VaultRoot; message = $msg } | ConvertTo-Json -Depth 8 -Compress)
}
$lines = @(
    (@{ type = "user"; uuid = "u1"; timestamp = "2026-10-22T10:00:00Z"; cwd = $VaultRoot; message = @{ role = "user"; content = "hello" } } | ConvertTo-Json -Depth 6 -Compress),
    (New-AssistantLine "msg_1" "a1" $usage1 @{ type = "tool_use"; id = "toolu_1"; name = "Bash"; input = @{ command = "echo one" } } "2026-10-22T10:00:01Z"),
    (New-AssistantLine "msg_1" "a2" $usage1 @{ type = "tool_use"; id = "toolu_2"; name = "Read"; input = @{ file_path = "/tmp/b.txt" } } "2026-10-22T10:00:02Z"),
    (New-AssistantLine "msg_2" "b1" $usage2 @{ type = "tool_use"; id = "toolu_3"; name = "Write"; input = @{ file_path = "/tmp/a.txt"; content = "x" } } "2026-10-22T10:00:03Z"),
    (New-AssistantLine "msg_2" "b2" $usage2 @{ type = "tool_use"; id = "toolu_4"; name = "Bash"; input = @{ command = "echo two" } } "2026-10-22T10:00:04Z")
)
$fakeTranscript = Join-Path $srcDir "test-session-001.jsonl"
[System.IO.File]::WriteAllLines($fakeTranscript, $lines, (New-Object System.Text.UTF8Encoding($false)))

$r = Export-Session -TranscriptPathIn $fakeTranscript -SessionIdIn "test-session-001" -CwdIn $VaultRoot -SourceAppIn "ClaudeCode"

Write-Output "Export-Session status: $($r.Status)"
Write-Output "Project dir: $($r.ProjectDir)"

$mdFile = Get-ChildItem -LiteralPath $r.ProjectDir -Filter "*.md" | Select-Object -First 1
if (-not $mdFile) {
    Write-Output "FAIL: no markdown file was written"
    exit 1
}

$content = Get-Content -LiteralPath $mdFile.FullName -Raw -Encoding UTF8
Write-Output "--- written frontmatter ---"
Write-Output ($content -split '---')[1]

$expected = @{
    '(?m)^\s+Bash: 2\s*$'   = 'tools_used.Bash == 2'
    '(?m)^\s+Read: 1\s*$'   = 'tools_used.Read == 1'
    '(?m)^\s+Write: 1\s*$'  = 'tools_used.Write == 1'
    'input: 300'                    = 'tokens.input == 300'
    'output: 135'                   = 'tokens.output == 135'
    'cache_creation: 15'             = 'tokens.cache_creation == 15'
    'cache_read: 20'                 = 'tokens.cache_read == 20'
    'total: 470'                     = 'tokens.total == 470'
    'cost_usd: 0.001999'             = 'cost_usd == 0.001999'
    'claude-sonnet-5'                = 'model list contains claude-sonnet-5'
    '/tmp/a.txt'                     = 'files_touched contains /tmp/a.txt'
    '/tmp/b.txt'                     = 'files_touched contains /tmp/b.txt'
}

$allPass = $true
foreach ($pattern in $expected.Keys) {
    $label = $expected[$pattern]
    if ($content -match $pattern) {
        Write-Output "PASS: $label"
    }
    else {
        Write-Output "FAIL: $label (pattern not found: $pattern)"
        $allPass = $false
    }
}

# Cleanup: remove the junction by itself first, never recurse through it.
Get-ChildItem -LiteralPath $OutRoot -Recurse -Directory -Force -ErrorAction SilentlyContinue | Where-Object { $_.Attributes -band [IO.FileAttributes]::ReparsePoint } | ForEach-Object { [System.IO.Directory]::Delete($_.FullName) }
Remove-Item -LiteralPath $work -Recurse -Force -ErrorAction SilentlyContinue

if ($allPass) {
    Write-Output "=== ALL AGGREGATION CHECKS PASSED ==="
    exit 0
}
else {
    Write-Output "=== AGGREGATION CHECKS FAILED ==="
    exit 1
}
