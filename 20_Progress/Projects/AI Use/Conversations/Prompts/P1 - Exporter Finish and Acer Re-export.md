---
type: project
status: active
created: 2026-10-22
updated: 2026-10-22
tags:
  - project
  - ai
  - conversations
  - prompt
project_kind: prompt
task: exporter-finish-and-acer-reexport
model: claude-sonnet-5-5
---
# P1 - Exporter Finish and Acer Re-export
Paste into a fresh Claude Code session started in the Jarvis vault: `Read and run 20_Progress/Projects/AI Use/Conversations/Prompts/P1 - Exporter Finish and Acer Re-export.md. Follow Hard Rules and Report Back exactly.`
## Why This Exists
Build B1 is half done. A Dell session on 2026-10-22 added message-id token dedup and a vault-root-aware `Get-ProjectName` with per-session folder stickiness to both exporters, plus `test-token-dedup.ps1` and `test-project-routing.ps1`. Those changes are uncommitted in the shared tree. The remaining defects are listed in [[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]].
- **Verified 2026-10-22:** `test-token-dedup.ps1` passes under PowerShell 7 (all checks, Windows and WSL helpers). Not yet run under Windows PowerShell 5.1, which the hook uses.
- **Still wrong, by reading the script:** `status: raw` is written (about line 742); no `review_state`, `created`, or `updated`; the price table (lines 35 to 45) has no entry for `claude-opus-5-5`, `claude-sonnet-5-5`, or `claude-haiku-5-5`, and the Sonnet 5 rate carries a comment that it ended 2026-08-31; notes are written with `Set-Content -Encoding UTF8`, which adds a BOM under 5.1 (351 of 630 old notes start with one); multi-line Bash and PowerShell commands go inside inline backticks, which the Tasks plugin parses as task syntax. Line numbers drift, so re-find each.
- **Owner decisions 2026-10-22:** the Acer is a fresh tree for testing the new design. Project-based sessions are re-exported from their live transcripts so their totals are deduplicated. Older notes whose transcripts were already swept stay as they are.
- **Assumed, verify:** a note written by the finished exporter is recognizable by the presence of `review_state`, so no new frontmatter key is needed to mark deduplicated totals.
## Hard Rules
- Scope is the Acer, Windows side, Claude Code only. Do not touch WSL, the Dell, Cowork, Cursor, Codex, or `.obsidian/`. `wsl-session-export.ps1` only has to keep its test green; record its parity gap as build B9 debt.
- Do not edit `30_Order/Standards`, `Templates`, or `Workflows`. Scripts under `30_Order/System/claude-workflow/` are the build surface.
- Never read or print `.credentials.json`, `.env*`, tokens, or `history.jsonl` text. Use synthetic fixtures in tests. Reading transcripts through the exporter is allowed; do not paste their text into any report.
- Search before creating. Write only the files named below. Scratch work goes to the session scratchpad. Nothing at the vault root.
- Do not run `git commit` or `git push`. `Jarvis-GitAutoSync` is the only git writer.
- After any vault write, search for `.sync-conflict-*` copies of what you wrote and restore the corrected text.
- Notes: no em dashes, no blank line after a heading, path-qualified wikilinks, patch by heading, update `updated:`.
- Every change keeps both tests green under PowerShell 7 and Windows PowerShell 5.1.
- Do not delete or move any existing note, marker, or folder. Report leftovers instead.
- Do not re-export anything until the owner has confirmed the tracked project list in step 7.
- Do not set the status of this prompt to `complete`. The owner does that.
## Implementation Order
1. Run `test-token-dedup.ps1` and `test-project-routing.ps1` under `pwsh` and under `powershell.exe -NoProfile -File`. Record all four outputs.
2. Prices: read the official Anthropic pricing page for the three missing models and for the current Sonnet 5 rate. Add dated entries to the table in `export-claude-session.ps1`, fix the stale comment, and keep `cost_usd: null` for any model still absent. If the page cannot be read, stop and ask. Do not guess a rate.
3. Frontmatter in `Export-Session`: `status: seed`, `review_state: raw`, `created` as the date of `started_at`, `updated` as the date of `exported_at`. Add no other keys. Match [[30_Order/Standards/AI Loop/Conversations|Conversations]] (spec `ai-conversation-export`).
4. Encoding: write notes, markers, and rollups with `[System.IO.File]::WriteAllText` and `New-Object System.Text.UTF8Encoding($false)`. Keep the BOM on the `.ps1` files themselves.
5. `Update-Rollups`: write `00 - Session Index.md` and `00 - Tool Usage Rollup.md` as `type: generated`, `generator: claude-session-exporter`, `gen_kind: index`, with the Dataview `FROM` set to the file's own folder. Confirm the Dataview `WHERE` still matches notes typed `input`.
6. `Format-ToolCall`: render Bash and PowerShell commands in fenced blocks (` ```bash ` and ` ```powershell `), never an inline span. Keep Write and Edit rendering as it is.
7. Tests: add `scripts/test-exporter-frontmatter.ps1` asserting `status: seed`, `review_state: raw`, `created` and `updated` dates, the first three bytes are not `EF BB BF`, a multi-line command is fenced, a model with no price gives `cost_usd: null`, and the three new models are priced. Then run `-BackfillAll -DryRun` and list the Acer project folders with note counts. **Stop and ask the owner which projects are tracked.** Offer Jarvis, The Plan, and Home as the default.
8. Add a `-Force` switch (re-render even when the marker is current) and a `-Project` filter to `export-claude-session.ps1`, documented in the header. Run it with `-BackfillAll -Force` for the tracked projects only. Confirm the note count per project is unchanged and no second folder appeared for any session (`Find-ExistingSessionDir` should keep the old folder).
9. Hand verification: pick two re-exported sessions. Count deduplicated tokens independently of the exporter (a Node one-liner grouping assistant lines by `message.id`) and compare with each note's `tokens:` block. Totals must be within 5%.
10. List the sessions that still exist in two project folders (4 on the Acer at the last count, 3 inside `Acer/Windows/Claude`). Do not fix them.
11. Patch [[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]] with a dated Corrections entry saying what is now fixed and what was measured, and [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]] for the new switches.
## Report Back
- The four test outputs from step 1 and the new test's output under both shells.
- The price source URL and the values added.
- Before and after note counts per project, and the number of notes rewritten.
- The two hand comparisons from step 9 with both numbers.
- The leftover duplicate list, and the WSL parity gap.
- Anything you could not do, and anything the owner must decide.
## What Not To Do
- Do not recompute the 606 old notes or strip their token fields.
- Do not change `Get-CaptureMachine` or the redaction rules.
- Do not assume a session's `cwd` stays constant across its life.
## Related Notes
[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Build Plan|Build Plan]], [[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]], [[20_Progress/Projects/AI Use/Conversations/Capture Scripts|Capture Scripts]], [[60_Claude/07_AI_Information/Session Logs/log|Session log]] (the 2026-10-22 Dell entry).
