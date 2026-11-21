param()

# PostToolUse validator for the internship system's six governed note types.
# Fires after every Write/Edit/MultiEdit; a no-op for anything outside
# 10_Areas/Career/Internships/ or 20_Progress/Internship/Applying/.
#
# What it checks: the required keys of each family's Spec in
# 30_Order/Standards/Internship/ (Internship Notes Standard for dossiers,
# Program Standard, Contact Standard, Internship Tracker Standard, Applying
# Standard). The lists below are a hand-kept copy of those Specs until this
# hook reads the Specs directly; change a Spec and its list in the same step
# (see the Loop Contract Change Workflow). Updated 2026-11-21.
# A missing field is surfaced via additionalContext (informational, never
# blocking - PostToolUse can't undo a write that already happened) and one
# line is appended to logs/internship-note-guard.jsonl, per the North Star's
# Part 5.3 invariant: every automatic action logs a trace.
#
# Does NOT resolve wikilink targets (that needs reading other files - a
# separate, more expensive check than this hook's per-write budget affords).
# Only checks that the required field itself is present in frontmatter.
#
# Fails open on any parse problem, same discipline as jarvis-write-guard.ps1.

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
$normLower = $norm.ToLowerInvariant()
$rootLower = $root.ToLowerInvariant()
if (-not $normLower.StartsWith($rootLower)) { exit 0 }

$rel = $norm.Substring($root.Length).TrimStart('\')
$relLower = $rel.ToLowerInvariant()
$fileName = Split-Path $norm -Leaf
$fileNameLower = $fileName.ToLowerInvariant()

# Skip meta-notes: directive stubs, MOCs, templates - not real instances of a governed type.
if ($fileNameLower.EndsWith("-to-create.md") -or $fileNameLower -match "moc\.md$" -or $fileNameLower -match "template") {
    exit 0
}

# --- Classify by path into one of the five governed note types ---
$noteType = $null
$requiredFields = @()

if ($relLower -match '^10_areas\\career\\internships\\list\\dossiers\\' -and $relLower -notmatch '\\_today\\') {
    $noteType = "dossier"
    $requiredFields = @("type", "input_kind", "status", "review_state", "created", "updated", "tags", "company", "title", "url", "source", "terms", "locations", "target_year", "date_posted", "date_found", "deadline_posted", "own_deadline", "matched_reason", "next", "notes", "tier", "resume_variant", "letter_mode")
}
elseif ($relLower -match '^10_areas\\career\\internships\\programs\\(serious|considering)\\' -and $relLower -notmatch '\\ended\\' ) {
    $noteType = "program"
    $requiredFields = @("type", "reference_kind", "status", "created", "updated", "tags", "name", "company", "program_type", "role_type", "deadline_posted", "deadline_real", "application_url", "list_origin", "recruiter_contact")
}
elseif ($relLower -match '^10_areas\\career\\internships\\contacts\\each one\\(ongoing|ended|come back)\\') {
    $noteType = "contact"
    $requiredFields = @("type", "status", "created", "updated", "tags", "name", "role", "company", "linkedin_url", "email", "how_found", "relationship", "related_programs", "last_contact_date", "next")
}
elseif ($relLower -match '^10_areas\\career\\internships\\tracker\\each one\\(current|applied|result)\\') {
    $noteType = "tracker"
    $requiredFields = @("type", "status", "created", "updated", "tags", "program", "contact", "company", "url", "tier", "starred", "resume_variant", "letter_mode", "date_noted", "date_researched", "date_created", "date_applied", "date_result", "result", "deadline", "related_notes", "next")
}
elseif ($relLower -match '^20_progress\\internship\\applying\\' -and $fileNameLower -notin @("now.md", "_this week.md", "apply queue.md", "follow-ups.md", "deadline map.md", "loop status.md")) {
    $noteType = "applying"
    $requiredFields = @("type", "project_kind", "status", "stage", "created", "updated", "tags", "program", "tracker", "company", "job_url", "date_applied", "date_response", "next_deadline", "resume_version", "cover_letter", "contacts", "interview_note", "related_progress", "next")
}
elseif ($relLower -match '^20_progress\\internship\\preperation\\interviews\\' -and $fileNameLower -ne "interview questions.md") {
    $noteType = "interview-prep"
    $requiredFields = @("type", "project_kind", "status", "created", "updated", "tags", "company", "applying", "interview_date", "next")
}
else {
    exit 0
}

# --- Read the file's actual current frontmatter (PostToolUse fires after the write lands) ---
if (-not (Test-Path -LiteralPath $norm)) { exit 0 }
try { $content = Get-Content -LiteralPath $norm -Raw -Encoding UTF8 } catch { exit 0 }
if ($content -notmatch '(?s)^---\r?\n(.*?)\r?\n---') { exit 0 }
$frontmatter = $Matches[1]
$fmLines = $frontmatter -split '\r?\n'

$missing = @()
foreach ($field in $requiredFields) {
    $pattern = "^" + [regex]::Escape($field) + "\s*:"
    $found = $false
    foreach ($line in $fmLines) {
        if ($line -match $pattern) { $found = $true; break }
    }
    if (-not $found) { $missing += $field }
}

# --- Log line (always, pass or fail) ---
try {
    $logDir = Join-Path $root "30_Order\System\claude-workflow\logs"
    if (-not (Test-Path -LiteralPath $logDir)) { New-Item -ItemType Directory -Path $logDir -Force | Out-Null }
    $logPath = Join-Path $logDir "internship-note-guard.jsonl"
    $entry = [ordered]@{
        timestamp = (Get-Date).ToString("o")
        file      = $rel
        note_type = $noteType
        missing   = $missing
        verdict   = if ($missing.Count -eq 0) { "pass" } else { "warn" }
    }
    ($entry | ConvertTo-Json -Compress) | Add-Content -LiteralPath $logPath -Encoding UTF8
} catch {
    # fail open - never block on the log write
}

if ($missing.Count -eq 0) { exit 0 }

# --- Informational only - PostToolUse cannot undo the write, so surface, don't block ---
$msg = "internship-note-guard: '$rel' ($noteType) is missing required frontmatter field(s): " + ($missing -join ", ") + ". See the matching Standard in 30_Order/Standards/Internship/ before considering this note done."

@{
    hookSpecificOutput = @{
        hookEventName     = "PostToolUse"
        additionalContext = $msg
    }
} | ConvertTo-Json -Depth 5 -Compress
exit 0
