---
type: system
status: sprout
created: 2026-11-21
updated: 2026-11-21
tags:
  - system
  - tooling
  - internship
system_kind: spec
trigger: GitHub Actions workflows recheck.yml (cron 30 6 * * *, daily, UTC) and revalidate.yml (cron 0 8 * * 1, Mondays, UTC), plus manual dispatch, on GitHub-hosted runners.
owner: Anant, who reads the issues revalidate files and has to notice when recheck stops.
notes:
  - "[[Internship Notes Standard]]"
  - "[[Loop Contract Change]]"
  - "[[Internship Loop Run]]"
---
# Internship Loop Upkeep
## Purpose
The two maintenance jobs on dossiers already written. `recheck.py` moves a dossier whose posting has closed into `Viewed/`, and never deletes one. `revalidate.py` re-checks every live dossier's stored content against the current filter rules, read-only, and files one digest issue. If recheck stops, closed postings stay in the role folders as if still open. Checked 2026-11-21: both workflows list as `active`; the last scheduled `recheck` was 2026-09-20 and the last `revalidate` 2026-09-14.
## Trigger
`.github/workflows/recheck.yml` runs daily at 06:30 UTC and `revalidate.yml` Mondays at 08:00 UTC, each on `ubuntu-latest` with Python 3.12, both able to run on dispatch.
```bash
gh run list --repo gupta-builds/internship-research-loop --workflow recheck --limit 4
gh run list --repo gupta-builds/internship-research-loop --workflow revalidate --limit 3
```
## Inputs and Outputs
Both read the Jarvis checkout at `JARVIS_DIR` (the public vault repo, which holds the tracked dossiers only). Recheck compares each dossier with its source's live feed, then moves closed ones to `10_Areas/Career/Internships/List/Dossiers/Viewed/`, rewrites the frontmatter (today `status: removed`, `removed_date`, `removed_reason`, and the Removed Dossiers MOC link in `notes`), pushes to the vault repo, and appends `logs/rechecks.jsonl` in the loop repo. Revalidate writes nothing to the vault. It files one issue per run: issues 9, 10 and 11, "Revalidate: 15 live dossier(s) now fail current rules", are still open.
## State
Tracked on purpose in the loop repo: `logs/rechecks.jsonl`, committed by recheck. `dossier_uids.json` is repointed when a dossier moves. Revalidate keeps no state.
## Failure Behavior
Recheck has a mass-deletion brake and files an issue if it trips or if the push fails; it never deletes. Revalidate cannot change a dossier. Secret, by name only: `JARVIS_PUSH_TOKEN` (revalidate uses it for checkout with read access only). A failed push raises an issue; token expiry is not checked in advance. A cron that stops raises nothing. The daily Archived mover for lapsed deadlines does not exist; see [[Internship Apply Lane]].
## Verify
```bash
gh run list --repo gupta-builds/internship-research-loop --workflow recheck --limit 4
gh issue list --repo gupta-builds/internship-research-loop --state open
```
Expected: a scheduled `success` within the last day for recheck and within the last week for revalidate. Run 2026-11-21: newest recheck 2026-09-20 `success` (its last log line scanned 343 dossiers and made no removals), newest revalidate 2026-09-14 `success`, and 8 issues open (4 to 8 from the 2026-08-21 threshold crossings, 9 to 11 revalidate digests). Verify fails today.
## Retire
Run `gh workflow disable recheck` and `gh workflow disable revalidate` on the loop repo, delete or rotate `JARVIS_PUSH_TOKEN` if nothing else uses it, and delete this record in one commit that states the reason. Dossiers already moved to `Viewed/` stay.
