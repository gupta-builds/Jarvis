---
type: system
status: sprout
created: 2026-04-24
updated: 2026-11-04
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
`report` writes to `60_Claude/30_Reviews/Ops Reports/` (the `REPORT_DIR` constant), the folder that holds the one existing report. It creates the folder if it is missing. Until 2026-11-04 the constant pointed at `60_Claude/50_Reviews/`, a folder that no longer exists, so a run would have recreated it.
> [!WARNING]
> `links` and `health` count a wikilink inside a Markdown table as broken when it uses an escaped pipe (`[[Note\|alias]]`), because the target keeps the backslash. On 2026-11-04 it reported 13,218 broken and 2,553 ambiguous links, and the first rows were of that shape. Treat those two numbers as an upper bound until the parser is fixed.
## State
None. It keeps no database or cache. The only file it ever creates is the report above.
## Failure Behavior
It never edits a note, repairs a link, or normalizes frontmatter. Unreadable files are decoded with replacement characters instead of failing the scan. `jarvis.ps1` exits 1 with "Python was not found on PATH" when neither `python` nor `py` resolves. On 2026-10-17 and again on 2026-11-04 `python` on this machine resolves to the Microsoft Store shim, which prints "Python was not found" and exits nonzero, and `py` is absent. `jarvis.ps1` picks `python` first, so it fails here even though a real Python 3.13 exists at `%USERPROFILE%\.local\bin\python3.13.exe`. Disable the app-execution alias, or call `jarvis_ops.py` with that interpreter and `--root`.
## Verify
```powershell
.\30_Order\System\jarvis-cli\jarvis.ps1 status
.\30_Order\System\jarvis-cli\jarvis.ps1 links --limit 5
```
`status` prints counts. Pick one broken link it reports and confirm by hand that the target is missing. On 2026-11-04 I ran `status` and `links --limit 5` through `python3.13.exe jarvis_ops.py --root <vault>` and both printed. I did not run `report`, because it writes a file into the vault.
## Retire
Delete `jarvis.ps1` and `jarvis_ops.py` in one commit that states the reason, and remove the `/ops` references to it. The reports already written stay in the reviews folder.
