---
type: project
status: active
created: 2026-11-21
updated: 2026-11-21
tags:
  - internship
  - research-loop
  - weekend-build
project_kind: plan
next: "Saturday 2026-11-21, first block: update the notes in step 1, then dispatch revalidate.yml to test the push token (step 2). Anant's own first task: the 40 minute cover letter interview in step 13."
related_progress: []
notes:
  - "[[Source of Truth]]"
  - "[[Research Loop - Resources]]"
  - "[[Research Loop - Improvement Plan]]"
  - "[[Research Loop - Implementation Plan]]"
  - "[[Research Loop - Phase 7 Coverage Expansion]]"
  - "[[System - Build Log]]"
  - "[[Resume & Cover Letter - System Map]]"
  - "[[Resume Alteration]]"
  - "[[Cover Letter Alteration]]"
  - "[[Humanizer]]"
  - "[[Dossier Corrections]]"
  - "[[HackerRank Hiring-Agent Scoring Rubric]]"
  - "[[Resume & Cover Letter - ATS Research Log]]"
  - "[[Internship Pipeline]]"
  - "[[Internship Tracking Workflow]]"
  - "[[Internship Notes Standard]]"
  - "[[Career Fair '25 & '26]]"
  - "[[Career Fair Intake]]"
  - "[[Main Resume]]"
  - "[[Application Document Preparation]]"
  - "[[Resume Alteration Standard]]"
  - "[[Cover Letter Alteration Standard]]"
  - "[[Human Writing Standard]]"
---
# Weekend Build
## Goal
==By Sunday morning 2026-11-22 the research loop runs on three company tiers and the new limits, the stale dossiers are archived, and a ranked apply queue with a classified resume and cover letter per application exists, so Sunday is spent applying and not building.==
## Current State
Written Saturday 2026-11-21. Friday 2026-11-20 was research only: nothing in the repo, the workflows or the vault was changed, so the whole build lands today. The code repo is `gupta-builds/internship-research-loop` (WSL: `/home/anant_gupta/projects/work/internship-research-loop`) and the dossiers live in the public vault repo `gupta-builds/Jarvis`.
### What Anant asked for at the start of the weekend
- Apply for internships on Sunday 2026-11-22, up to the set limit, and track every dossier after submission.
- Get the research loop up, running and cleared, with the limits exactly right and the GitHub workflow and run exquisite.
- Pull the most crucial internships from the top companies first and make the dossiers massively ready to apply to.
- Get the README current and make the project live for any public user: a view-only page of dossiers, plus fork-and-bring-your-own `profile.yaml`. Anant's own profile stays hidden.
- Keep it a very simple closed automation that is completely functional, with the skills and agents completed.
- Cover letters and resumes generated clearly and classified per application.
- Make the applications stand out from other applicants. The honest version of that is in Decisions under The Edge.
### Measured state on 2026-11-20
| Part | State | Evidence |
|---|---|---|
| Hourly discovery pipeline | Built and tested, never run in production for quota, hard pause or deadline code | 529 tests pass via `uv run --no-project --with-requirements requirements.txt` in WSL |
| Schedules | All 5 workflows `active`, but the last scheduled runs were recheck 2026-09-20 and revalidate 2026-09-14 | `gh run list`. Cause unknown. `JARVIS_PUSH_TOKEN` was created 2026-07-17 and may have expired. |
| Branch | `dell-latitude/deadline-quota-and-reseed-fixes` has 6 unpushed commits and is 5 behind `origin/master` (uv adoption among them) | `git status` and `git log` |
| freehire connector | 4 defects: no `offset` pagination, no `countries=US`, no source allowlist, no title guard | `ingestion/freehire.py` (131 lines) |
| Tiers | Only `TIER_RANK = {"high": 0}` and an 11 company `preferred_companies` list in `core/profile.yaml`, which sits in a public repo | `core/company_registry.py`, `core/profile.yaml` |
| Dry run | `run_pipeline.py` has no argument parsing, so no `--dry-run`. `run.yml` takes no inputs and has no `concurrency` group. | `run_pipeline.py` (1,077 lines), `.github/workflows/run.yml` |
| Dossiers | 269 have an expired `own_deadline`. Zero applications exist. | Vault scan on 2026-11-20 |
| Resume | `Resumes/Main Resume.md` is evidence tagged since 2026-08-29. `Resumes/Altered/` is empty. | [[Main Resume]], [[Resume & Cover Letter - System Map]] |
| Cover letter | `Main Cover Letter.md` does not exist and the `Cover Letters/` folder does not exist | [[Cover Letter Alteration]] |
| Dead code | `core/company_cache.py` is imported nowhere. `enrich.py` was never run end to end. | grep of imports |
### What is known about the notes in V0
Every note in this folder is a design from August or September 2026. None of its tooling was built. [[Resume Alteration]] still says the Main Resume is a vague bullet bank and carries a correction saying otherwise. [[Dossier Corrections]] is a report-only audit dated 2026-08-28 and 2026-08-29, so each finding must be re-checked against today's vault before it is acted on. [[Humanizer]] is an interface-only contract with no implementation.
## Non-Goals
- No login-wall automation. Handshake and LinkedIn stay a manual lane through [[Career Fair Intake]] with `source: CareerFair-Manual`.
- No auto-submit and no sending messages. Every application is submitted by Anant.
- No LLM in the unattended hourly path. LLM steps only run in sessions Anant starts.
- No ranking finer than three tiers. Tiers are company grouping, nothing more.
- No refactor of `run_pipeline.py`. Tier and limit hooks go into `company_registry.py`, `debate.py` and `_select_exact_quota` only.
- No invented resume or letter content. The evidence rule in [[Resume Alteration]] holds: an approved Main Resume bullet, a linked project note, or a fact Anant supplies.
- No vault history work. Another session owns the Jarvis history question.
- No adoption of the `ai-job-search` or `career-ops` frameworks themselves, and no `llm-council`, JobSpy or Scrapegraph work this weekend.
## Decisions
### Limits
Approved by Anant on 2026-11-20.
- Total hard pause at **200** dossiers, replacing 300.
- A bucket at 50 skips only that bucket's writes. The other buckets keep writing.
- One reserved tier 1 slot per run, taken before the 2/1/1/2 bucket quota.
- `_Career Fair/` counts in the total but not toward a bucket's 50.
- A new `Applied/` state is excluded from every count. `Archived/` gets the same treatment.
- The old 150/170 info and 190/200 issue thresholds no longer fit under a 200 pause. Their new values are an open question below.
### Company tiers
Three tiers, grouping only. A tier decides which dossiers get applied to first in the week. It sits on top of the four role buckets (`1 - AI & ML`, `2 - Fullstack`, `3 - CyS & Finance`, `Other`). Three rules do more work than any list: a company with a Program or Contact note is at least tier 2, anything from the manual `CareerFair-Manual` lane is tier 2, and everything unlisted is tier 3. Quant and cybersecurity firms have no group of their own and fall to tier 3 unless the career fair lane brings them in. The CyS & Finance bucket quota of one per run still guarantees they flow.
*Tier 1, confirmed:* Anthropic, OpenAI, NVIDIA, Meta, Google, Amazon, Netflix, Microsoft, Apple.
| Tier 1 company | Backend to read | Verified 2026-11-20 |
|---|---|---|
| Anthropic | Greenhouse | 637 jobs |
| OpenAI | Ashby | 854 jobs |
| NVIDIA | Workday CXS `nvidia.wd5` / `NVIDIAExternalCareerSite` | 228 hits for "intern 2027" |
| Amazon | `amazon.jobs/en/search.json` | 480 hits for "intern" |
| Netflix, Microsoft | Eightfold | reached through freehire, native check needed |
| Google, Meta, Apple | Custom parsers (Google results HTML, Apple `jobs.apple.com`, Meta own site) | not built |
*Tier 2:*
| Group | Companies |
|---|---|
| Named by Anant | Seagate, Oracle, ABB |
| Career fair and job boards (Handshake, LinkedIn, others) | Micron, 3M, Xcel Energy, Toro, Tetra Pak, Teleflex, Bracco, Barr Engineering, Marvell, TSMC, Honeywell, Andersen, Viavi, NetSpi, RBC Wealth, Allianz Life, Blue Cross MN, Starkey, ALLETE, Banner Engineering, plus anything from the manual lane |
| Minnesota HQ, my additions and not yet confirmed | Target, Medtronic, UnitedHealth/Optum, U.S. Bank, Ameriprise, General Mills, Cargill, Best Buy, Thomson Reuters, Jamf, Sezzle |
| AI-forward, hiring interns for AI work as SWE | xAI, Palantir, Databricks, Snowflake, Salesforce, Scale AI, Cohere, Sierra, Together AI, Waymo, Nuro, Mercor, Perplexity, Cursor, Glean, Harvey, ElevenLabs, Fireworks AI, Modal, Hugging Face, Deepgram, Cognition |
| Startups | Stripe, Notion, Figma, Ramp, Verkada, Coinbase, Robinhood, DoorDash, Samsara |
*Tier 3:* everything else, including ByteDance, American Express, Zipline, Booz Allen, Vanguard, Capital One, Bloomberg, the quant firms and roles Anant applies to even though they fit poorly. The old 11 company `preferred_companies` seed is superseded.
The AI-forward group is my own judgment of who is ahead in AI, so it is a draft. A freehire check on 2026-11-20 counted US intern postings per company slug: Waymo 44, Palantir 20, Salesforce 14, xAI 13, Together AI 7, Databricks 6, Snowflake 6, Scale AI 4, Sierra 3, Mercor 3, Cohere 2, Nuro 1. Zero for the rest mostly means my guessed slug was wrong. freehire also tagged "Talent Partner, Emerging" and "Software Engineer, Ads Serving" as intern, so the title guard is mandatory. freehire had Anthropic at 0 and OpenAI at 1, so tier 1 needs the native feeds.
### Where tier is stored
One company file, `companies.yml`, in the code repo: name, tier, ATS type, tenant or slug, site, optional extra title keywords. It replaces the scattered company dicts and feeds `TIER_RANK = {1: 0, 2: 1, 3: 2}`. Every dossier gets a `tier` frontmatter field. The real tier list reveals priorities, so only `profile.example.yaml` and an example company file are public. The real `profile.yaml` loads from an Actions secret.
### Ranking inside the apply queue
Order by tier, then soonest deadline, then newest posting, then overlap with the Main Resume tags using the existing `grade_resume.py`. The earlier plan to park `grade_resume.py` is withdrawn: it is the seed of this ordering. An optional LLM triage runs only for tier 1 and tier 2 on apply day, with a compact brief and hard disqualifiers.
### Mentor repos
- **`career-ops-hq/career-ops`** (84k stars) is the mentor for discovery. Observed 2026-11-20: a `portals.yml` of tracked companies, zero-token scanning on a cron, a title filter with positive and negative keywords and per-company extras, `max_posting_age_days`, Playwright liveness with `scan --verify`, a `discover` mode that resolves company names to ATS boards, and about 150 provider modules under `providers/` including `workday.mjs`, `eightfold.mjs`, `smartrecruiters.mjs`, `google.mjs`, `apple.mjs`, `amazon.mjs` and `oraclecloud.mjs`. MIT licensed. The code is JavaScript, so port the logic and cite it.
- **`ai-job-search-dev/ai-job-search`** (73k stars) is the mentor for the apply side. It ships no scrapers of its own. Take the drafter and reviewer separation, the PDF text layer check, the posting integrity guard, the eligibility gate, `posted_date` persistence with an age flag, mass-posting detection and the `/outcome` follow-up with a per-application archive.
- Both are popular because they are plain files, one command per stage, a human who presses submit, and a believable story. Stars measure distribution, not accuracy, and neither repo publishes measured accuracy.
- Their word "tier" means seniority. Ours means company group, so keep the two names apart in code.
### Resume and cover letter classification
Every dossier carries three fields that decide what gets generated.
| Field | Values | Rule |
|---|---|---|
| `resume_variant` | `ai`, `fullstack`, `systems`, `other` | Chosen from the role bucket. `systems` serves CyS & Finance. `other` takes the closest of the three. |
| `tier` | 1, 2, 3 | From `companies.yml` |
| `letter_mode` | `tailored`, `bank`, `none` | Tier 1 `tailored`, tier 2 `bank` plus one company hook, tier 3 `none` unless the form requires one |
The three variants are built deterministically from the `#skill/...` tags in [[Main Resume]], with no LLM, then rendered through the existing `generate_resume_docx.py`. Tier 1 and tier 2 get a human approved tailoring pass on top, following the sequence in [[Application Document Preparation]]: prepare, draft, plan, approve, humanize, write, link, apply.
### The Edge
Making the applications stand out comes down to specific things, in this order:
- A company specific opening in tier 1 letters, taken from the Program note and never a generic mission line.
- A referral path per tier 1 and tier 2 application: LinkedIn people-search links for the recruiter and a role peer, generated as links for Anant to open. Nothing is scraped.
- A resume that survives screening: evidence tagged, one column, a verified text layer, and checked against [[HackerRank Hiring-Agent Scoring Rubric]].
- Every submitted application archived with the exact resume, letter and posting text sent, and followed up at 7 and 14 days.
- Honest gaps. The HackerRank rubric caps projects that are all personal repos, docks projects without a link and docks tutorial-shaped names. If Anant has no contribution to someone else's project, that is a real gap to close with real work, not a line to invent.
### Sunday volume
Anant accepted the time estimates on 2026-11-21: about 25 minutes per tier 1 application, 12 for tier 2 and 5 for tier 3. The planned day is 3 tier 1, 10 tier 2 and 30 tier 3, which is 43 applications in about 6 hours. After Sunday the pace is about 10 a day. This replaces the 500 by 12/31 goal in the Main Log, which is out of reach. AI labs fill early, so expect few open tier 1 intern roles. The volume has to come from tier 2 and 3.
## Sequence
Every code step ships as its own small change with a recorded API fixture, a test, and a real data citation, and gets a `/code-review` before the next one. "Must" steps are needed for Sunday. "Should" steps land Saturday if time allows. "Could" steps slip to Monday and later. The honest total is more than one day, so the order below puts what Sunday needs first and the connectors after.
1. **Update the existing notes first (Must, about 45 minutes).** Done when each of these carries today's decisions:
	- [[Source of Truth]]: the limits, the tiers, the `Applied/` and `Archived/` states.
	- [[Research Loop - Resources]]: the coverage table, freehire's role, what Workday really needs.
	- [[Research Loop - Improvement Plan]] and [[System - Build Log]]: the 2026-11-20 findings and this decision log.
	- [[Resume & Cover Letter - System Map]]: remove stale `.cursor` and `second-brain-claudekit` paths and record that `Altered/` is empty.
	- [[Internship Pipeline]] and [[Internship Tracking Workflow]]: a fast lane for tier 2 and 3 where Program and Contact notes are optional.
	- [[Internship Notes Standard]]: the new `tier`, `resume_variant`, `letter_mode` and `applied` fields.
	- [[Resume Alteration]] and [[Cover Letter Alteration]]: replace the stale "current state" paragraphs, and mark Main Resume as rebuilt.
	- The repo's `README.md`, `PRD.md` and `docs/codex/ARCHITECTURE.md`: correct the "private vault" claim and the limits.
2. **Test the gates (Must, 15 minutes).** Dispatch `revalidate.yml` by hand to test `JARVIS_PUSH_TOKEN`, check the PAT expiry in GitHub settings, and check Firecrawl credits. Done when a run is green and a push is confirmed, or the token is rotated.
3. **Rebase the 6 unpushed commits onto `origin/master` (Must).** Resolve conflicts, run the 529 test baseline with `uv`, then `/code-review`. Done when tests pass and the branch is merged.
4. **Tier registry (Must).** Add `companies.yml`, `TIER_RANK` for 1, 2 and 3, the `tier` frontmatter field, the Program and Contact and `CareerFair-Manual` rules, and `profile.example.yaml`. Add the reserved tier 1 slot to `_select_exact_quota`. Done when tests show a tier 1 listing wins a contested slot and an unlisted company lands in tier 3.
5. **Limits (Must).** Set the total pause to 200, the per-bucket skip at 50, `_Career Fair/` counted in the total only, and `Applied/` and `Archived/` excluded in `count_dossiers_by_bucket`. Rescale the info and issue thresholds. Done when tests cover a full bucket skipping only its own writes and the pause tripping at 200.
6. **Dry run and workflow inputs (Must).** Add argparse and `--dry-run` to `run_pipeline.py`, and `workflow_dispatch` inputs for dry run and a write cap. Add one `concurrency` group shared by run, recheck and reseed. Replace the one issue per run with a rolling daily issue. Done when a dry run against the real vault prints the planned writes and changes nothing.
7. **freehire fixes (Must).** Add `offset` pagination at 100 per page, `countries=US`, an allowlist of native ATS sources, a title guard (intern or co-op required; senior, staff, principal, talent and recruiter rejected, with per-company extras), and a tier driven company table. Persist `posted_date` and flag old postings. Stop `normalize_freehire` from setting `active=True` unconditionally. Done when fixtures show the noisy xAI and Capital One rows rejected and a paged fetch returns more than 100.
8. **Dossier clean-up (Must).** Re-check each finding in [[Dossier Corrections]] against today's vault, then apply what still holds:
	- Merge or archive the confirmed duplicate pairs (ByteDance, AbbVie, Humana, American Express, Montenson, Vanguard) and diff the `url` fields of the contested ByteDance pair.
	- Fix the `company:` typo Montenson to **Mortenson** in all 5 dossiers.
	- Make quant firm routing consistent so Optiver, IMC and Chicago Trading Company land in one bucket.
	- Reclassify the W.W. Grainger Business Systems Analyst dossier.
	- Re-fetch or archive the empty captures: the Google Telegram post, TMEIC, Belvedere and the seven Zipline listing-page captures.
	- Archive the lapsed deadlines: Walleye Capital, Moog, the two Google dossiers and RTX.
	- Mark the PhD-only and clearance roles (Walleye PhD, Optiver PhD, CACI TS/SCI) so they do not enter the apply queue.
	- Decide whether `company:` names the host employer or the placement intermediary, from the Acds and Apprenticely finding.
	- PIMCO: confirm the December 1, 2026 deadline on a PIMCO owned page or leave it off the tracker.
	- Done when the audit shows no open item, or each leftover has a reason written on it.
9. **Archive stale dossiers and relaunch (Must).** Move the 269 expired dossiers into `List/Dossiers/Archived/`. Never use `50_Archive/`. Keep the seen-state so archived listings do not re-enter, and verify that in the dry run first. Run a dry run, then one bounded live run with a write cap, then re-enable the cron. Close stale issues #4 to #11 once the sweep passes. Done when the live run pushes new tiered dossiers and the next scheduled hour runs on its own.
10. **Apply queue (Must).** Extend `screen_report.py` into a daily zero-LLM `Apply Queue` note, ordered as in Decisions, top N per tier and bucket, with `resume_variant` and `letter_mode` on every row. Done when it lists real dossiers with correct tiers.
11. **`mark_applied` and follow-ups (Must for mark_applied, Should for follow-ups).** `mark_applied` moves the dossier to `Applied/`, sets `date_applied`, creates the Tracker note, adds a row to `Applying/Now.md` and archives the exact resume, letter and posting text sent. A daily zero-LLM follow-up note surfaces anything quiet at 7 and 14 days. Done when a dry run on three dossiers produces all three artifacts.
12. **Resume variants (Must).** Write the builder that parses `#skill/...` tags in [[Main Resume]] into a `ResumePlan` and renders the `ai`, `fullstack` and `systems` variants through `generate_resume_docx.py`. Check the output folder rule in [[Resume Alteration Standard]]. Done when three DOCX files exist and the text layer check below passes.
13. **Cover letter bank (Must, needs Anant, about 40 minutes).** Run the `cover-letter-builder` agent as an interview and write `Cover Letters/Main Cover Letter.md`: four opening hooks by company type, four experience paragraphs each tied to a real project, and a closing. Then create the `Cover Letters/` folder and the DOCX export. Done when Anant has approved every fragment, and letters assemble at 250 to 350 words per [[Cover Letter Alteration Standard]].
14. **Document gates (Must for the first three, Should for the rest).**
	- Evidence rule: every claim traces to a bullet, a project note or a supplied fact, and gaps are logged and never guessed.
	- [[Humanizer]]: a pass or fail with line level flags and no silent rewriting, run before any DOCX is written.
	- Text layer check: extract the generated file's text with `python-docx` and verify contact details, keyword coverage, one column, approved fonts and the 550 word ceiling.
	- Drafter and reviewer separation: a fresh context reviewer agent checks the content plan against the evidence rule and the tailoring boundary, then the drafter revises.
	- Posting integrity guard: strip hidden text and instruction shaped lines from dossier bodies before any agent reads them, because dossiers are untrusted web text.
	- Eligibility gate: extend the OPT regex so a citizenship or clearance requirement fails, silence is marked unverified, and a named permit passes. Add mass-posting detection for cases like Capital One.
	- HackerRank self-audit on the Main Resume: personal repos are not open source, every project has a working link, nothing tutorial shaped, portfolio site and LinkedIn present.
	- Done when one resume and one letter pass every gate and are read back from disk.
15. **Skill tags and Anant's own gaps (Must, Anant).** [[Main Resume]] has no security or finance skill tags, so the `systems` variant has little to select. Anant either adds evidenced tags and bullets or accepts a thin variant. Anant also confirms the Minnesota HQ and AI-forward lists. Done when the open questions below are ticked.
16. **Native connectors (Should).** Add what tier 1 needs, porting logic from `career-ops` providers:
	- Anthropic and OpenAI: Greenhouse and Ashby tokens in the existing connectors.
	- A generic Workday CXS connector from a tenant table: NVIDIA `nvidia.wd5`, Capital One `capitalone.wd12/Capital_One`, 3M `3m.wd1/Search`, General Mills `genmills.wd1/GMI_External_Careers`, Xcel `xcelenergy.wd1/External`, Viavi `viavisolutions.wd1/careers`, Andersen `andersen.wd12/Andersen_External_Career_Site`, Intel `intel.wd1/External`.
	- Amazon, Eightfold (Netflix, Microsoft) and Oracle HCM (Honeywell, Oracle).
	- A `discover` helper that resolves a company name to its ATS board. Seagate left SmartRecruiters (the API shows one 2016 posting), so its Workday site name needs this.
	- Native liveness checks that replace HEAD requests, which give false 403 and 404 results.
	- Done when each connector returns live intern rows for its tenant with a cited count.
17. **Recheck coverage (Should).** Add native recheck for ApplyGuy, Freehire and InternDock, which `recheck.py` skips today.
18. **Review and verify (Must before the cron stays on).** `/code-review` on the full diff, then the `loop-verifier` agent. Done when both pass and the first unattended hourly run succeeds.
19. **Public page and BYO profile (Could).** Generate `internships.json` and a view-only page with no profile data. Document the fork steps: bring your own `profile.yaml` as a secret and enable Actions by hand, because forks do not run scheduled workflows by default. Refresh the README. Done when a clean fork runs a dry run.
20. **Custom parsers for Google, Apple and Meta (Could).** Port from `career-ops` `google.mjs` and `apple.mjs`. Until then these three stay on freehire and manual checks.
21. **Remaining ATS research (Could).** The open items in [[Resume & Cover Letter - ATS Research Log]]: the uConnect source's university, and quant firm application format guidance, which is still absent.
22. **Sunday 2026-11-22, apply day.** Refresh the queue, apply in order with 3 tier 1, 10 tier 2 and 30 tier 3, and run `mark_applied` right after each submission. Done when every submission has a Tracker note, an archived document set and a follow-up date.
## Done When
By end of Saturday:
- The cron is on and an unattended hourly run has succeeded under the new limits.
- Tiers, the reserved tier 1 slot, the 200 pause, the 50 bucket skip and `Applied/` exclusion are tested and merged.
- The stale dossiers are archived and the dossier audit is closed.
- The Apply Queue note lists real dossiers, each with a tier, `resume_variant` and `letter_mode`.
- Three resume variants and the cover letter bank exist and pass the document gates.
- The notes in step 1 match the code.
## Open Questions
- [ ] Rescale the info and issue thresholds under the 200 pause. Proposal: info at 120 and 150, issue at 170 and 190. Anant to confirm or change.
- [ ] Confirm the Minnesota HQ additions in tier 2, and confirm the AI-forward list or strike names from it.
- [ ] Where do per-application resumes go: `Resumes/` as [[Resume Alteration]] says, or `Resumes/Altered/` as the System Map says? Default: follow the Standard.
- [ ] Add evidenced `#skill/security` and `#skill/finance` content to [[Main Resume]], or accept a thin `systems` variant?
- [ ] Seagate's real Workday site name, found with the `discover` helper.
- [ ] Should `company:` hold the host employer or the placement intermediary for Acds and Apprenticely roles?
- [ ] Does the code repo need its `profile.yaml` removed from git history, or only from the tree going forward? The vault repo history is handled by another session.
- [ ] Is `Archived/` under `List/Dossiers/` the right home for the 269 stale dossiers?
## Evidence
- `Source of Truth.md` limits sections, read 2026-11-20: 50 per bucket, 150/170 info, 190/200 issue, hard pause 300, `MAX_DEBATE_LOSSES = 48`, quota 2/1/1/2.
- Repo reads 2026-11-20: `ingestion/freehire.py`, `ingestion/normalize.py`, `ingestion/sources.py`, `core/company_registry.py`, `core/debate.py`, `core/classify.py`, `core/profile.yaml`, `run_pipeline.py`, `.github/workflows/run.yml`, `screen_report.py`.
- Live probes 2026-11-20: Simplify `listings.json` has 17,687 entries and 5,140 active, vanshb03 has 4,125 and 2,503 active. The `Summer2026` and `Summer2027` Simplify URLs return identical data, so our `SIMPLIFY_URL` is only a stale name for a renamed repo.
- GitHub API 2026-11-20: `career-ops-hq/career-ops` 83,965 stars, created 2026-04-04, MIT. `ai-job-search-dev/ai-job-search` 72,842 stars, created 2026-03-18, MIT, with `community-portals` at 15 stars.
- SmartRecruiters `SeagateTechnology1` returned one posting from 2016. freehire had one Seagate row, on BambooHR.
## Related Notes
- [[Source of Truth]] owns the limits and gates. [[Research Loop - Improvement Plan]] and [[Research Loop - Implementation Plan]] are the earlier plans this one extends.
- [[Resume Alteration]], [[Cover Letter Alteration]], [[Humanizer]], [[HackerRank Hiring-Agent Scoring Rubric]] and [[Resume & Cover Letter - ATS Research Log]] are the V0 designs steps 12 to 14 implement. [[Dossier Corrections]] is step 8.
- [[Application Document Preparation]], [[Internship Pipeline]] and [[Internship Tracking Workflow]] are the workflows the apply lane shortens.
