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
trigger: GitHub Actions workflow run.yml, cron 0 * * * * (hourly, UTC) on a GitHub-hosted runner, plus manual dispatch; reseed.yml by manual dispatch only, with a typed confirmation.
owner: Anant, who has to notice when it stops. Nothing alerts him today.
notes:
  - "[[Internship Notes Standard]]"
  - "[[Loop Contract Change]]"
  - "[[Internship Loop Upkeep]]"
---
# Internship Loop Run
## Purpose
The hourly discovery pipeline of the `gupta-builds/internship-research-loop` repo: it fetches postings from the sources in `SOURCES` in `run_pipeline.py`, filters them with no LLM, runs a five-check write gate, writes the survivors as dossiers into the Jarvis vault repo, and commits its own state and logs back. If it stops, no new dossier arrives. Checked 2026-11-21: all five workflows list as `active`, but the last scheduled `run` was 2026-08-29 09:33 UTC and it wrote 2 dossiers; the cause is not determined. Both repos are public.
## Trigger
`.github/workflows/run.yml` runs hourly and on `workflow_dispatch`, with Python 3.12 on `ubuntu-latest`. It checks out the loop repo and `gupta-builds/Jarvis` (into `jarvis-checkout`, read as `JARVIS_DIR`), runs `python run_pipeline.py`, then opens an issue labelled `dossier-ready` when the run wrote dossiers. `.github/workflows/reseed.yml` is the cold-start burst pull: dispatch only, never scheduled, and it aborts unless the `confirm` input is exactly the required phrase.
```bash
gh run list --repo gupta-builds/internship-research-loop --workflow run --limit 4
gh workflow run run --repo gupta-builds/internship-research-loop
```
## Inputs and Outputs
Reads the sources, `core/profile.yaml`, the Jarvis checkout at `JARVIS_DIR`, and Firecrawl for posting text. Writes dossiers into `10_Areas/Career/Internships/List/Dossiers/<role folder>/` through `vault_writer/writer.py` (family `internship-dossier`), `List/Run Log` and the two Excluded logs under `List/`, then pushes with `commit_and_push_with_retry` (a `pull --rebase`, one retry; nothing is marked seen if the push fails). The dossier keys the writer emits today differ from the Internship Notes Standard (no `type` or `input_kind`, `status: unreviewed`, `preference_tier`); the first Excluded log is named with an em dash in code and with a hyphen in the vault, so a write may create a second file.
Limits today, from `run_pipeline.py`: the quota per run is 2 AI/ML, 1 Fullstack, 1 CyS & Finance, 2 Other, exact and all-or-nothing; a bucket notifies at 50; the hard pause is 300 dossiers and calls `gh workflow disable run`; `MAX_DEBATE_LOSSES` is 48; counting covers the four role folders only. Weekend Build lists new values; they are not in this record until the code has them.
## State
Tracked on purpose in the loop repo and committed by the workflow's last step (`Update state + logs`): `state/seen_ids.json`, `excluded_uids.json`, `debate_losses.json`, `dossier_uids.json`, `capacity_notified.json`, `opt_cache.json`, `interndock_seen_guides.json`, and `logs/runs.jsonl` (687 lines on 2026-11-21). `jarvis-checkout/` is ignored by the repo's `.gitignore`. Nothing runtime is kept under `30_Order/`.
## Failure Behavior
The write gate fails closed: the first failing check rejects a listing. The posting fetch fails open: with no Firecrawl credit a dossier is written without posting text. Issues are filed on schema drift, a failed push and a systemic write-gate rejection. Secrets, by name only: `JARVIS_PUSH_TOKEN` (checkout and push to the vault repo), `FIRECRAWL_API_KEY`, and the workflow's own `github.token`. A failed push raises an issue; token expiry is not checked in advance. A cron that simply stops raises nothing, which is what happened after 2026-08-29. Anant sees GitHub issues; no banner exists yet (see [[Internship Apply Lane]]).
## Verify
```bash
gh run list --repo gupta-builds/internship-research-loop --workflow run --limit 4
git log -3 --author="internship-research-loop bot" -- 10_Areas/Career/Internships/List/Dossiers
```
Expected: a scheduled `success` within the last two hours and a recent bot commit. Run 2026-11-21: the newest `run` was 2026-08-29 09:33 UTC, `success`; the newest bot commit touching the dossiers was 2026-09-17 (a recheck move). So Verify fails today, and that is the finding.
## Retire
Run `gh workflow disable run` and `gh workflow disable reseed` on the loop repo, then delete or rotate `JARVIS_PUSH_TOKEN` and `FIRECRAWL_API_KEY` in the repo secrets and delete this record in one commit that states the reason. Dossiers already written stay in the vault as notes.
