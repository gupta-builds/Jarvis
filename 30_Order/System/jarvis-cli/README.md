---
type: system
status: sprout
created: 2026-04-24
updated: 2026-10-17
tags:
  - system
  - tooling
  - cli
system_kind: spec
trigger: On demand from the vault root with jarvis.ps1, and by agents during /ops health-check.
owner: Anant, and any session that changes vault structure and runs a health check afterward.
notes:
  - "[[Orchestration]]"
  - "[[Vault Lint]]"
---
# Jarvis Ops CLI
## Purpose
A small read-only audit CLI for the vault: it reports metadata gaps, broken and ambiguous links, future-dated fields, likely encoding damage, stalled projects, and notes worth enriching. It gives visibility before repair. [[Vault Lint]] is the newer tool and measures fit to the Standards; this one measures general vault health.
## Trigger
Run by hand from the vault root, or by an agent through `/ops health-check`:
```powershell
.\30_Order\System\jarvis-cli\jarvis.ps1 health
```
Commands: `status`, `health`, `context`, `projects`, `links`, `dates`, `encoding`, `enrich-candidates`, `report`. Options: `--limit N` (rows per section, default 25) and `--include-tools` (also scan hidden tool folders). No schedule.
## Inputs and Outputs
Reads every Markdown file under the vault root, decoding with `utf-8-sig`. `.git` and `.obsidian` are always skipped; a top-level hidden folder is skipped unless `--include-tools` is passed. `jarvis.ps1` finds the root three folders up from itself, picks `python` (or `py -3`), and passes `--root`.
- `health`: counts of metadata gaps, future dates, projects with no `next`, duplicate file names, link health, and likely mojibake.
- `context`: a compact context pack from `Vault Map.md`, `AGENTS.md`, `AI_CONTEXT.md`, `00_Dashboard.md`, and the Architecture note, plus the session log tail and active projects.
- `projects`: active project notes with a missing `next` or a stale modified date (older than 30 days).
- `links`: broken and ambiguous wikilinks, with obvious placeholder links filtered in template-heavy zones.
- `dates`: `created`, `updated`, `reviewed`, `last_drilled`, and `next_drill` later than today's date.
- `encoding`: common broken smart-punctuation and UTF-8 marker sequences.
- `enrich-candidates`: ranked notes with missing learning sections, by type, track, and maturity.
- `report`: writes one diagnostic Markdown file; every other command only prints.
> [!WARNING]
> `report` writes to `60_Claude/50_Reviews/Ops Reports/` (the `REPORT_DIR` constant) and creates the folder if it is missing. That folder does not exist; the one existing report is in `60_Claude/30_Reviews/Ops Reports/`. Running `report` today creates a folder the Architecture says is gone. Change the constant before using it.
## State
None. It keeps no database or cache. The only file it ever creates is the report above.
## Failure Behavior
It never edits a note, repairs a link, or normalizes frontmatter. Unreadable files are decoded with replacement characters instead of failing the scan. `jarvis.ps1` exits 1 with "Python was not found on PATH" when neither `python` nor `py` resolves. On 2026-10-17 `python` in this shell resolves to the Microsoft Store shim, which prints "Python was not found" and exits nonzero, so install Python or disable the app-execution alias first.
## Verify
```powershell
.\30_Order\System\jarvis-cli\jarvis.ps1 status
.\30_Order\System\jarvis-cli\jarvis.ps1 links --limit 5
```
`status` prints counts. Pick one broken link it reports and confirm by hand that the target is missing. I did not run it on 2026-10-17 because Python was unusable.
## Retire
Delete `jarvis.ps1` and `jarvis_ops.py` in one commit that states the reason, and remove the `/ops` references to it. The reports already written stay in the reviews folder.
