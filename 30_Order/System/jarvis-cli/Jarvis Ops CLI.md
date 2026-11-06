---
type: system
status: sprout
created: 2026-04-24
updated: 2026-11-05
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
Reads every Markdown file under the vault root, decoding with `utf-8-sig`. `.git` and `.obsidian` are always skipped; a top-level hidden folder is skipped unless `--include-tools` is passed. `jarvis.ps1` finds the root three folders up from itself, resolves a working Python, and passes `--root`. The order is: a real install under `%USERPROFILE%\.local\bin` or `%LOCALAPPDATA%\Programs\Python`, then `py -3`, then `python` on PATH. A `python` under `WindowsApps` (the Microsoft Store shim) is never used.
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
> The link counts are still large and mostly real. Until 2026-11-04 `links` and `health` also counted a wikilink inside a Markdown table as broken when it used an escaped pipe (`[[Note\|alias]]`), because the target kept the backslash. `clean_wikilink_target` now splits on `\|` as well as `|`, which took the broken count from 13,218 to 12,744 on the same vault (474 links). What remains includes links to `.excalidraw` and PDF files, to `Immediate Action` and other missing notes, and 2,559 ambiguous names such as `AGENTS` (10 matches) and `CLAUDE` (12), so treat the number as a to-do list, not a rate.
## State
None. It keeps no database or cache. The only file it ever creates is the report above.
## Failure Behavior
It never edits a note, repairs a link, or normalizes frontmatter. Unreadable files are decoded with replacement characters instead of failing the scan. `jarvis.ps1` exits 1 with "No working Python found" when none of its candidates works. On this machine `python` resolves to the Microsoft Store shim and `py` is absent, so until 2026-11-04 the launcher failed here although a real Python 3.13 exists at `%USERPROFILE%\.local\bin\python3.13.exe`; it now finds that one first.
## Verify
```powershell
.\30_Order\System\jarvis-cli\jarvis.ps1 status
.\30_Order\System\jarvis-cli\jarvis.ps1 links --limit 5
```
`status` prints counts. Pick one broken link it reports and confirm by hand that the target is missing. On 2026-11-04 I ran `help`, `status`, `health` and `links` through `jarvis.ps1` itself and all printed, then checked `clean_wikilink_target` on five sample targets (an escaped pipe, a plain pipe, a path with an escaped pipe, a heading, a bare name). I also ran `report` once, after confirming `REPORT_DIR` is the existing `60_Claude/30_Reviews/Ops Reports/`: it wrote `Jarvis Ops Report - 2026-11-04 20261104-022308.md` (15 KB) there. On 2026-11-05 the generator's frontmatter was changed to the shape the [[Generated Output Standard]] defines (`type: generated`, `generator: jarvis-cli`, `gen_kind: report`, `created`, `tags`, no `status`); `generated` and `gen_kind: report` already exist in the [[Frontmatter Standard]], so nothing new was invented. Both existing reports in the folder were rewritten to that frontmatter (bodies untouched; originals saved to the session scratchpad), and `node vault-lint.js --path "60_Claude/30_Reviews/Ops Reports/"` now maps them: 2 of 2 fit in family `generated-output`. A fresh `report` run was linted too (3 of 3). `--root` only counts when that folder holds `00_Dashboard.md` and `.obsidian`; otherwise the CLI falls back to the current folder and then to its own location, so a test run pointed at a scratch folder writes into the real vault.
## Retire
Delete `jarvis.ps1` and `jarvis_ops.py` in one commit that states the reason, and remove the `/ops` references to it. The reports already written stay in the reviews folder.
