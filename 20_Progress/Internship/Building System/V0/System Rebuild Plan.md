---
type: project
status: active
created: 2026-11-21
updated: 2026-11-21
tags:
  - internship
  - research-loop
  - system-rebuild
project_kind: plan
next: "Anant answers the five Open Questions and the verdict tables at the Phase 1 checkpoint. Phase 2 starts only after that reply."
related_progress: []
notes:
  - "[[Weekend Build]]"
  - "[[Source of Truth]]"
  - "[[Dossier Corrections]]"
  - "[[System - Build Log]]"
  - "[[Note Type Registry]]"
  - "[[Spec and Plan Standard]]"
---
# System Rebuild Plan
## Goal
==Cut the internship kit from 31 files to 18 so that every Standard matches what the research loop really writes and what Weekend Build decided, every rule can fail a real note, and no note type survives without an instance or a use this week.==
## Current State
Audited read-only on 2026-11-21 with `node vault-lint.js` (node v24.20.0, 77 Specs from 59 Standards), the code repo read through WSL, and frontmatter surveys of the instance folders. Dossier bodies were not read, so nothing in them was followed. The premise that the Standards are long is mostly false: the 11 Standards run 854 to 1,346 words against a 2,000 limit and `--kit` prints no warning for any of them. The real problems are drift from the code, 0% fit on every instance family, and overlap between files.
### Hypotheses
| Hypothesis | Result | Evidence |
|---|---|---|
| Standards and Workflows overlap | True | Funnel state lives in five places: Tracker folder, Applying `stage`, Program `Ended/`, Contact folder, and the new dossier `Applied/`. Tracking Workflow steps 3 and 4 repeat Pipeline steps 7 and 9. Resume and Cover Letter Standards share three near identical rules (Markdown authoritative, evidence only, one DOCX per application overwritten until `date_applied`). Program, Contact and Tracker each restate the no-`null` and one-line-link rule that Frontmatter Standard owns. |
| Some families have no instance and no consumer | Partly true | No consumer and no instance: Cheat, Job & Company, LinkedIn Post, Postings Log, intake log. Interview Prep has one real note but it is typed `concept`, matches `technical-concept`, and no Workflow or agent reads the Standard. Applying, cover letter and resume are unexercised but Weekend Build needs them this week. |
| Internship Notes Standard drifted from the code | True, and it makes passing impossible | Spec requires `type` and `input_kind`, which the writer never emits. The writer emits `status: unreviewed` and on a move `status: removed`, neither in the vocabulary. It emits `deadline_posted`, `own_deadline` and `preference_tier`, which the Spec does not list. 0 of 354 dossiers can pass. |
| Narrative history inside Standards belongs in the Build Log | Mostly false for Standards, true for Workflows | Standards carry only short origin sentences (Career Fair Standard, Loop Review Standard). The history sits in `Internship - Design Rationale` (1,191 words, a guide in the Workflows folder). |
| Several Standards restate general rules | Partly true | See the overlap row. Each Standard also has a Legacy Shapes table, which the Note Kit Standard requires, so that part stays. |
### Measured fit
Lint run 2026-11-21 per family. Every kit Standard passes (11 of 11) and `--kit` reports 0 errors and 8 warnings, none from an internship Standard. Workflows fit 7 of 8, the miss being the redirect stub.

| Family | Notes | Pass | Top failure reasons |
|---|---|---|---|
| internship-dossier | 354 | 0 | no-type 354, status-off-vocab 354 (`unreviewed`), missing `notes` 242 |
| internship-tracker | 32 | 0 | no-status 32, missing created and updated 32, dead links 14 notes, wrong-folder 3 |
| internship-program | 31 | 0 | no-type 31, no-status 31, missing Company Information 26 |
| internship-contact | 30 | 0 | no-status 30, wrong-folder 12, extra blank lines 10 |
| internship-applying | 1 | 0 | `status: Withdrawn` off vocabulary, 6 missing keys |
| career-fair | 4 | 0 | empty `created` 3, bad date 3 |
| intake-log, deadline-tracker | 2, 1 | 0 | no frontmatter on all 3, 12 dead links, 22 extra blank lines |
| loop review weekly, monthly | 2, 2 | 0 | 16 missing headings, missing `review_kind` |
| interview-prep, resume-alteration, cover-letter | 0 | n/a | No note matches. `Main Resume` is typed `project`, ABB prep is typed `concept`, the 10 stubs are typed `evergreen`. |
Folder runs: `20_Progress/Internship/` 1 of 47 (2.1%), reviews folder 1 of 6 (the MOC), Graphify folder 0 of 1,396 (all `unmapped`). Rule quality: 22 of 61 Rules rows are lint-enforced, 39 are Reader only. Of 62 Headings entries, 47 have `Wrong: None seen` and 21 have `Right: None`. No Standard has a gold example that passes lint.
### Code versus Dossier Standard
The writer (`vault_writer/writer.py` `build_frontmatter`, 17 keys) and the gate (`validate.py` `REQUIRED_FRONTMATTER_FIELDS`) agree with each other and disagree with the Standard.

| Item | Code writes | Standard says |
|---|---|---|
| Keys | company, title, url, source, terms, locations, target_year, date_posted, date_found, deadline_posted, own_deadline, matched_reason, status, next, notes, preference_tier, tags | Adds `type`, `input_kind`. Omits the deadline pair and `preference_tier` from the Spec. |
| status | `unreviewed` on write, `removed` on move to `Viewed/` (plus `removed_date`, `removed_reason`) | `seed`, `tree`, `archived`, with `review_state` for human review |
| Deadline | Exactly one of the pair, enforced in `validate.py`; `own_deadline` is `date_found` plus 7 days | Same, but prose only |
| matched_reason | Six of nine sources write the bare word `matched`: 187 of 354 dossiers (zshah101 72, vanshb03 78, Greenhouse 16, AIJobs 11, ApplyGuy 7, Freehire 2, Lever 1) | Never write it. Not enforced anywhere. The count was 81 of 287 on 2026-W36. |
| screened_* | Never written | Added by a human at Pipeline step 2. Zero dossiers carry them. |
| Tier | `preference_tier` is `high` on 8, blank on 313, empty string on 34, the string `null` on 2 | Binding decision: `tier` 1, 2, 3 replaces it |
| Folders | `count_dossiers_by_bucket` counts only the four bucket folders, so `_Career Fair/` is outside the 200 pause total | Weekend Build: `_Career Fair/` counts in the total |
### Standards verdicts
| File | Job in one sentence | Consumers | Instances and fit | Verdict |
|---|---|---|---|---|
| Internship Notes Standard | Makes dossier frontmatter and folder states checkable | Code writer, Pipeline, Weekend Build step 1 | 354, 0% | KEEP. Rewrite to the code, `tier`, `resume_variant`, `letter_mode`, `date_applied`, the eight folders. Target about 1,000 words. |
| Career Fair Standard | Keeps raw fair captures untouched and sends every posting to a dossier | Career Fair Intake | 4, 0% | MERGE into Internship Notes Standard as a second Spec. Its naming rule duplicates the dossier file-name rule. |
| Internship Tracker Standard | One dated record per application | Tracking Workflow, planned `mark_applied` | 32, 0%, none applied | KEEP. `program` and `contact` become optional for the fast lane. Absorbs the Tracking Workflow rules. About 750 words. |
| Applying Standard | Live hub for one prepared application | Application Document Preparation | 1 (withdrawn), 0% | KEEP, apply lane only, about 700 words. Stays `built (unexercised)`. |
| Program Standard | Static research on one internship | Pipeline | 31, 0% | KEEP. Required keys fall from 23 to about 14: `deadline_real`, `applying_note`, `benefits` are 0 of 31 filled, `wave` 9, `opens_date` 4. About 800 words. |
| Contact Standard | Outreach file for one internship | Pipeline | 30, 0%. `email` filled on 1, `last_contact_date` on 0, so no outreach has been logged | KEEP, optional on the fast lane. About 650 words. |
| Resume Alteration Standard | Evidence rule and resume bank | Application Document Preparation | 0 match | MERGE into a new Application Documents Standard. Adds `resume_variant`. |
| Cover Letter Alteration Standard | Fragment bank and letter length rule | Application Document Preparation | 0 | MERGE into the same Standard. Adds `letter_mode`. Target about 1,150 words with two Specs. |
| Deadline and Intake Triage Standard | Governs two notes of the manual sweep | Review System, Ready to Screen link | 3, 0%. Last sweep 2026-10-04 | CUT. Dashboard Standard covers `Deadline Tracker`. The intake log has no Workflow and no reader. |
| Internship Loop Review Standard | Checks the bot's output and promotion stalls | Review System, cron | 4, 0%. None since 2026-09. The 2026-09-12 fire failed with a 401. | KEEP, thinner. Drop the 500 target and the 150/170 thresholds, which Weekend Build replaces. About 950 words. |
| Interview Prep Standard | Spoken plan for one interview | None | 0 match | CUT. Project Standard covers a prep note. Rebuild from git when the first interview is booked. |
### Workflow verdicts
| File | Words | Verdict |
|---|---|---|
| Internship Pipeline | 403 | KEEP, rewrite to 350 or fewer, two lanes. Folds in the transition conditions of Design Rationale. |
| Application Document Preparation | 325 | KEEP. Adds classification and the archive step. |
| Career Fair Intake | 260 | KEEP, now serves Internship Notes Standard. |
| Internship Review System | 404 | KEEP, trim to 350 or fewer. Cron mechanics move to one line. |
| Internship Tracking Workflow | 301 | MERGE into Pipeline and Tracker Standard, then CUT. Its Friday pass reads `Applying/_This Week.md`, which does not exist. |
| Internship - Design Rationale | 1,191 | CUT after the transition table moves into Pipeline. Source of Truth and the Build Log hold the reasoning. |
| Application Document Preparation 1 | 59 | CUT. A redirect stub linked only from the Workflows Index and Order Rebuild Design. |
| Promotion | 278 | MOVE to `30_Order/Workflows/Enrichment/`. It serves Reference Standard and nothing internship related. |
### Template verdicts
| File | Verdict |
|---|---|
| Internship Applying, Contact, Cover Letter, Program, Loop Weekly Review, Loop Monthly Review, Tracker | KEEP. Rebuilt from the new Specs. The Tracker Template stays in `Templates/Career/Tracking/`. |
| Cheat Template | CUT. The 2 real Cheats notes are typed `project` and live in `10_Areas/Career/Internships/Cheats/`, not where the registry says. |
| Internship Interview Prep Template | CUT with its Standard. |
| Job & Company Template | CUT. Program Standard's Company Information already carries the company research. 0 instances. |
| LinkedIn Post Template | CUT. `Posts/README.md` says no draft exists. 0 instances. |
| Internship Postings Log Template | CUT. It is not in the registry, and its one instance `2026-07 Found` is typed `input` with `input_kind: listing`, outside the vocabulary. |
No NEW file. The Apply Queue and follow-up notes in Weekend Build steps 10 and 11 are zero-LLM generated notes, so Generated Output Standard covers them if the code writes `type: generated`.
### Failures with no rule today
| Failure | Mapped to |
|---|---|
| `Montenson` for Mortenson, still in 5 dossiers | Standard rule (company is the employer the posting names), instance fix, code alias map |
| Duplicate postings, 9 files with a numeric suffix, known pairs in Dossier Corrections | Code check exists (`check_cross_source_duplicate`); Standard rule to say a suffix means a collision, not a duplicate |
| Quant firms split across buckets: Optiver 9 files in 3 folders, IMC 6 in 3, Chicago Trading 2 in 2 | Code allowlist; Reader rule in the Standard |
| Empty captures (`No posting content fetched`), and Firecrawl has 0 credits until 2026-11-27 | Standard rule plus a code check for non-empty posting text |
| Lapsed deadlines: all 267 `own_deadline` values and 6 posted ones are before 2026-11-21 | Standard rule: a lapsed dossier moves to `Archived/` |
| PhD and clearance roles | `screened_decision: reject` with a reason; code eligibility gate in Weekend Build step 14 |
| `company` naming a placement intermediary (Acds) | Open Question 4 |
| Dossier links by full path break when a dossier moves (12 dead links in `Deadline Tracker`) | Standard rule: link dossiers by file name |
| HEAD request liveness gives false 403 and 404 | Not a note rule; code follow-up |
### Contradictions between files
- Pipeline step 3 and Tracking Workflow create the Tracker at Commit. The binding fast lane creates it at apply time.
- Pipeline step 5 creates the Applying note. Weekend Build `mark_applied` creates a Tracker and a row in `Applying/Now.md`, and `Now.md` queries Applying notes by `status` while Applying Standard puts the funnel word in `stage`.
- Notes Standard calls `Viewed/` a human triage bin. `recheck.py` moves closed postings into it, and Source of Truth says the bot never writes there.
- Registry places Cheat in `20_Progress/Internship/` and Interview Prep notes in `Preperation/Interviews/`. The real notes sit elsewhere with other types.
- Registry has 16 internship rows on lines 56 to 71, not 15.
### Instance clean-up classes
None of these were touched. Dispositions are suggestions for Anant.

| Class | Count | Suggested disposition |
|---|---|---|
| Dossiers with `status: unreviewed` | 277 | Code writes the new vocabulary first. A scripted mechanical fix with a dry run for the old ones, only if approved. |
| Dossiers with `status: removed` in `Viewed/` | 74 | Same script maps them to `archived`. |
| Dossiers with a lapsed deadline | 273 (264 outside `Viewed/`; Weekend Build says 269) | Bot step 9 moves them to `Archived/`. |
| Bare `matched_reason: matched` | 187 | Leave. Fix the six sources in code. |
| Dossiers with no `notes` MOC link | 242 | Part of the scripted fix. |
| Numeric-suffix files | 9 (4 in buckets, 5 in `Viewed/`) | Weekend Build step 8 dedupe, then rename. |
| `company: Montenson` | 5 | Weekend Build step 8. |
| Quant firm split | Optiver 9, IMC 6, Chicago Trading 2 | Weekend Build step 8. |
| `_Career Fair/` dossiers with neither deadline field | 11 | Decide in the Standard rewrite: exempt like `Viewed/`. |
| Trackers with no `status`, `created`, `updated` | 32 (3 loose outside the three folders) | Scripted mechanical fix, then move the 3. |
| Loose Contact notes in `Each One/` | 12 | Move to `Ongoing/`, judgment per note. |
| Programs with no Company Information | 26 | Write on touch, tier 1 first. |
| Seed stubs in `Resumes/` and `Cover Letters/` | 10 (5 and 5, about 200 bytes each) | Delete after Application Documents Standard exists; git is the archive. Needs a yes. |
| Intake log and retired sweep notes in `_Today/` | 3 | Move out or delete with the cut. Needs a yes. |
| Applying folder | 4 (one real note, a pointer, `Now.md`, `Applications-to-Create`) | Decide with Open Question 1. |
| Graphify export in `60_Claude/40_Project_Briefs/Internship/` | 1,396 | Do not delete by hand. See the next section. |
### Findings outside the instructions
- The AI Toolkit hypothesis came out false. Its six templates are the AI reviews, tool profile, source summary, audit report and weekly synthesis, and the registry sends the loop's reviews to the Internship Loop templates. Only `30_Order/System/vault-lint` is relevant, and it works.
- Graphify folder: the 2026-08-22 handoff shows 350 uncommitted deletions that the hourly snapshot would have committed without review, and an open manifest-ownership bug. Recommendation: leave the folder alone, mark it out of scope for fit in the lint config as a follow-up, and if it is ever pruned, regenerate at the source and review a `git diff --stat` first. One of its nodes is named `CLAUDE.md` and loads into sessions as if it were instructions.
## Non-Goals
- No edit to any instance note, the code repo, `.claude`, `.codex`, `.cursor`, `.agents`, `.obsidian`, `50_Archive` or the vault root.
- No new note type, no instance clean-up, no redesign of the binding decisions.
- No change to the Frontmatter Standard vocabulary. The proposed mapping fits the existing tables.
## Decisions
Binding decisions from Weekend Build are encoded as written: `tier` replaces `preference_tier`; the dossier states are the four role folders, `Viewed/`, `_Career Fair/`, `Applied/`, `Archived/`, with the last two excluded from counts; tier 2 and 3 need no Program or Contact; `resume_variant` and `letter_mode` classify each application; the eight step sequence and the evidence rule stay; applying produces `date_applied`, a Tracker note, a `Now.md` row and an archive copy with follow-ups at 7 and 14 days.
Proposed, not yet approved: dossier `status` is `seed` for a new find, `tree` once promoted, `archived` for `Applied/`, `Archived/` and `Viewed/`, with `review_state` for human review. `Archived/` sits under `List/Dossiers/`, which Weekend Build still lists as an open question.
## Sequence
1. Re-read each file just before editing it and compare its modified time with this audit. Stop and report if it changed. Done when no edit ran on a stale read.
2. Registry definition line: allow a parenthetical qualifier after a kit state, since rows already use three. No Frontmatter Standard change. Done when `--kit` still reports 0 errors.
3. Rewrite Internship Notes Standard with the Career Fair Spec merged in. Done when `--path 30_Order/Standards/Internship/` fits and `--specs` matches the blocks written.
4. Rewrite Tracker, Applying, Program, Contact one at a time, each followed by the same two lint runs.
5. Create Application Documents Standard from the Resume and Cover Letter Standards, then Loop Review Standard thinner.
6. Rebuild the seven kept Templates from their Specs, one comment line per heading.
7. Rebuild Pipeline (fast lane and apply lane), Application Document Preparation, Career Fair Intake and Review System at 350 words or fewer, each ending in `Done when`. Move Promotion.
8. For each approved cut, search the vault except `50_Archive` for its name, repair every link, list every `.claude`, `.codex`, `.cursor` and `.agents` reference as a follow-up, then delete. A first search found no such reference to any cut file.
9. Update registry rows, keeping `built (unexercised)` and `built (no instance yet)` until an instance exists.
10. Run `--kit`, `--specs`, `--path 30_Order/` and `--path "20_Progress/Internship/Building System/"`, then read two real notes per kept family against the new Standard.
11. Update Current State with the dated outcome and append one entry at the end of System - Build Log.
Target after Phase 2: 7 Standards, 4 Workflows, 7 Templates, 74 Specs from 55 Standards.
## Open Questions
- [ ] Fast lane records: tier 2 and 3 get no Applying note, the Tracker is created at apply time straight into `Applied/` with `program` and `contact` optional, and `Now.md` reads those Trackers plus tier 1 Applying notes. This changes the Commit-time Tracker rule and `Now.md`. Recommended: yes.
- [ ] Dossier vocabulary: accept the proposed `status` mapping and `tier`, and accept that the code repo must write `type`, `input_kind`, `status: seed` and `review_state` or new dossiers fail lint. The 354 old ones stay at 0% until a scripted fix is approved. The alternative is adding `unreviewed` and `removed` to the Frontmatter Standard. Recommended: the mapping.
- [ ] Verdict tables: approve as written or name the rows to flip. The two I am least sure of are Interview Prep (CUT, but interviews will follow Sunday's applications) and Deadline Tracker (CUT the Standard, since the sweep stopped on 2026-10-04 and the Apply Queue replaces it).
- [ ] Should `company` hold the host employer or the placement intermediary (Acds, Apprenticely)? Recommended: the host employer, with the intermediary named in the body.
- [ ] Loop reviews: keep both Weekly and Monthly thin, or keep only Weekly? No review exists after 2026-09 and the cron failed on 2026-09-12. Recommended: keep both thin and read limits from Source of Truth.
## Evidence
- Lint 2026-11-21: `--specs` 77 Specs from 59 Standards; `--kit` 0 errors, 8 warnings; family runs for the 13 internship families; folder runs for Standards, Workflows, Dossiers, Tracker, Contacts, Programs, `20_Progress/Internship/`, the reviews folder and the Graphify folder.
- Code, read through WSL on 2026-11-21: `vault_writer/writer.py` lines 73 to 125 and 230 to 295, `vault_writer/validate.py`, `vault_writer/templates/dossier.md.j2`, `run_pipeline.py` `count_dossiers_by_bucket` at line 243.
- Vault surveys 2026-11-21: dossier frontmatter keys and values (357 files with frontmatter), deadline dates per folder, Program, Contact and Tracker fill rates, Dossier Corrections items re-checked against the live files.
## Related Notes
- [[Weekend Build]] owns the binding decisions and [[Source of Truth]] owns the limits and gates.
- [[Dossier Corrections]] is the failure list behind the Missing table, and [[System - Build Log]] receives the Phase 2 entry.
