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
next: "Anant sends the Codex P2 to rewrite the instruction notes against this kit, then the loop-code prompts for the Contracts; Weekend Build step 2 owns the diagnosis of the loop runs listed under Phase 2 closing pass."
related_progress: []
notes:
  - "[[Instruction Notes Rewrite Plan]]"
  - "[[Weekend Build]]"
  - "[[Source of Truth]]"
  - "[[Dossier Corrections]]"
  - "[[System - Build Log]]"
  - "[[Note Type Registry]]"
  - "[[Spec and Plan Standard]]"
---
# System Rebuild Plan
## Goal
==Cut the internship kit from 31 files to 20, add a System record set for the loop, and write every Standard, Template, Workflow and record from what the system will do from Sunday on, so that each matches the code, each rule can fail a real note, and no note type survives without an instance or a use this week.==
## Current State
Audited read-only on 2026-11-21 with `node vault-lint.js` (node v24.20.0, 77 Specs from 59 Standards), the code repo read through WSL, and frontmatter surveys of the instance folders. Dossier bodies were not read, so nothing in them was followed. The premise that the Standards are long is mostly false: the 11 Standards run 854 to 1,346 words against a 2,000 limit and `--kit` prints no warning for any of them. The real problems are drift from the code, 0% fit on every instance family, and overlap between files.
### Phase 2 outcome, 2026-11-21
Checks run 2026-11-21 with `node vault-lint.js` (node v24.20.0). `--kit`: 0 errors, 7 warnings, none from an internship file (the baseline had 8, one of them the redirect stub I deleted). `--specs`: 75 Specs from 56 Standards, which equals the 75 parsable Spec blocks that carry a `family` key in `30_Order/Standards/` (76 blocks minus the course-concept example inside Note Kit Standard); it was 77 from 59. `--path 30_Order/`: 130 of 132 fit; the 2 misses are the course workflows CSCI 4061 and CSCI 5304, not mine. `--path "20_Progress/Internship/Building System/"`: 3 of 26, all failures in older notes outside my scope; this plan note passes. `--path 30_Order/Standards/Internship/`: 8 of 8. `--path 30_Order/System/internship-loop/`: 4 of 4.
Every instance family is still at 0% because the notes predate their Standards and no note was edited: dossiers 0 of 354, career-fair 0 of 4, tracker 0 of 32, applying 0 of 1, program 0 of 31, contact 0 of 30, loop reviews 0 of 2 each. No note matches interview-prep, resume-alteration or cover-letter. I read the lint reasons for two notes per family: each fails on keys the new Spec requires and that the note predates, never on a rule that is wrong.
The guard hook `jarvis-internship-note-guard.ps1` parses and, run against one real note of each of the six families, lists exactly the keys the new Spec requires and the note lacks (for example `tier`, `starred`, `resume_variant`, `letter_mode` on the Uber Tracker; `type`, `reference_kind`, `status`, `created`, `updated` on `2027-Nuro-AI-Platform-SWE`). Running it appended lines to its git-ignored log.
Files. Created: Application Documents Standard, Loop Contract Change, four records in `30_Order/System/internship-loop/`. Rewritten: the seven kept Standards, the eight Templates, four Workflows, the guard hook. Edited: Note Type Registry, Workflows Index, System Component Standard, Human Writing Standard (links only). Moved: Promotion to `Workflows/Enrichment/`. Deleted: Career Fair, Resume Alteration, Cover Letter Alteration and Deadline and Intake Triage Standards; Cheat, Job & Company, LinkedIn Post and Postings Log Templates; Internship Tracking Workflow, Internship - Design Rationale and the redirect stub.
Decisions I made that Anant did not approve: dossiers and Trackers carry no approval key and `Viewed/` and `_Career Fair/` dossiers may carry neither deadline key; the dossier Spec requires `tier`, `resume_variant` and `letter_mode` but not `starred`; the Tracker Spec allows `Current/` as a legacy folder and requires the four copied keys but allows them blank; the Program Spec requires 14 keys and drops `applying_note` and `role_type` as well as the unfilled ones; the weekly and monthly review heading names; the registry rows `application-packet` and `apply-lane-generated`; the Interview Prep classifier and the generated-note skip list in the hook; the Design Rationale transition table was not folded into Pipeline, because Pipeline had to stay under 350 words, so those conditions now live only in the Pipeline steps and Source of Truth; the Notes Standard is about 1,700 words, above the 600 to 1,100 target, because it holds two Specs and the state table; Application Document Preparation now serves Application Documents Standard.
Could not check: why the scheduled runs stopped after 2026-08-29, whether `JARVIS_PUSH_TOKEN` has expired, the header that carries a token's expiry date, how Dataview renders any dashboard, whether any review schedule exists, Syncthing's staggered versioning settings (only `.stignore` was read), the other issue titles the loop files, and whether the loop repo's code, which changes today under Weekend Build, still matches record A.
Follow-ups outside my scope. Loop code: write the Contracts keys (`type`, `input_kind`, `status: seed`, `review_state`, `created`, `updated`, `tier`, `resume_variant`, `letter_mode`), stop the bare `matched_reason`, set `status: archived` on the `Viewed/` mover, build the daily Archived mover, `mark_applied` with the duplicate-key record and the dry-run deletion check, the four generated notes built locally, `companies.yml`, the count of `_Career Fair/`, the hyphen Excluded log name, `type: generated` on Run Log, a non-empty posting check, and a daily expiry check once the header is verified. Loop repo agents and `CLAUDE.md`: `tracking` still creates the Tracker at promotion in `Current/` and cites Internship Tracking Workflow; `applying`, `cover-letter-builder` and the two `generating-*-docx` skills cite the two deleted Standards; the `CLAUDE.md` contract and `promote-dossier/reference/note-templates.md` field lists; the copies under `20_Progress/AI/Claude Code/internship-research-loop/.claude`. Vault notes outside my write scope that still link to cut files: Weekend Build, V0 Resume Alteration, Cover Letter Alteration, ATS Research Log and HackerRank Rubric, Resume & Cover Letter - System Map, Applications-to-Create, Trackings-to-Create, Ready to Screen, Main Log, the Internships README, Posts README, and Weekly Synthesis W45 and W46. Git: ignore lines for the eight private folders and `git rm --cached` for the tracked files (Cover Letters 5, Applying 4, Preperation 4, Career Fair 3, Programs 33, Tracker 38), and the public history already holds them. Hand-offs to the Codex session: the old Deadline Tracker note, the ten seed stubs, `_Today/`, Networking Strategies, Run Log, the two how-to guides (both Workflows now stand alone), and the ledger's Decisions, which were still empty at the last read. The scripted mechanical fix for the 354 dossiers, the 32 Trackers and the Programs and Contacts awaits a separate approval. The Graphify folder recommendation stands. The guard hook should read the Specs directly, which shrinks Loop Contract Change.
### Phase 2 closing pass, 2026-11-21
Anant accepted Phase 2 and set Parts 1 to 4. Changes in this pass, all checked by a command I ran. `_Career Fair/` dossiers stay exempt from the deadline rule; the Notes Standard and the Pipeline say the Archived mover skips them and that Anant archives a fair dossier by hand, and the Weekly Review Standard and Template add the `_Career Fair/` count to Loop Run Health. The 29 Trackers in `Current/` stay; the Tracker Standard says a Tracker outside `Applied/` is not an application. `role_type` is back in the Program Spec (15 keys), the Template and the hook, and the hook ran against `2027-Nuro-AI-Platform-SWE` without naming it missing. `role_type` is filled on 31 of 31 Programs (30 `internship`, 1 `co-op`); `applying_note` is read only by the Programs MOC query and stays dropped (0 of 31). The Notes Standard is 1,499 words by the Note Kit measure (Spec blocks and comments excluded) and 1,654 by a raw `wc -w`, which counts the frontmatter and two Spec blocks; the rules that keep it there are the state table, nine five-bullet entries and the Rules and Legacy Shapes tables. The V0 trace added or restored 12 rules in the Application Documents, Program and Notes Standards. Thirty-one wikilinks in six notes were retargeted, links only. The number search of the kit came back clean. `--kit` has 0 errors.
Records A and B state what read-only commands showed on 2026-11-21: the `run` workflow is `active`, its newest scheduled run is 2026-11-21 17:51 UTC with conclusion `failure`, the one before it is 2026-08-29 09:33 UTC `success`, and no scheduled run is listed between; `recheck` last ran 2026-09-20 and `revalidate` 2026-09-14, all `success`; issues 4 to 11 are open and unlabelled. The cause is unknown, so both records stay `sprout`.
Added follow-ups. For the codebase and Weekend Build step 2, which owns the diagnosis: the failed run is id 44932281369; read it with `gh run view 44932281369 --repo gupta-builds/internship-research-loop --log-failed`; list state with `gh run list --repo gupta-builds/internship-research-loop --workflow run --event schedule --limit 5` and `gh api repos/gupta-builds/internship-research-loop/actions/workflows`; the open issues are 4 (AI/ML bucket threshold), 5 (CyS & Finance bucket), 6 (Other bucket), 7 (total crossed 190), 8 (total crossed 200), all 2026-08-21, and 9, 10, 11 (revalidate, 15 live dossiers fail current rules) of 2026-08-31, 09-07 and 09-14; none is labelled. The loop repo's `promote-dossier/scripts/validate_note_trio.py` (under `.claude` and `.codex`) requires `role_type` and also `applying_note`, which no Program fills; with `CLAUDE.md`, `AGENTS.md`, `promote-dossier/reference/note-templates.md` and `.cursor/rules/internship-loop-core.mdc` it is a seventh copy of the field list, and it must follow the Program Spec. For the Codex session, notes that still link to a cut file: Applications-to-Create (line 23, Resume Alteration Standard and Cover Letter Alteration Standard), Trackings-to-Create (line 11, Internship Tracking Workflow), Ready to Screen (lines 13 and 18) and Main Log (line 63), both Deadline and Intake Triage Standard, the Internships README (line 21, Cheat Template) and the Posts README (line 12, LinkedIn Post Template). Weekly Synthesis W45 and W46 name the cut files only as plain text and are historical.
### Second closing pass, 2026-11-21: the Codex test of the kit
Codex tested the kit on three guide notes and found two contradictions, both in `30_Order`. Fix 1: the Reference Standard Spec path was `^(40_Resources|10_Areas)/`, so a guide under `20_Progress/Internship/Applying`, `Resumes` or `Cover Letters` failed placement; the Kit map had assigned them to reference-resource without being tested against lint. The Spec path is now `^(40_Resources|10_Areas|20_Progress/Internship)/`, with the Standard's Allowed folders row, its scope sentence and the registry row to match; the `legacy_match` entries are untouched. `--family reference-resource` is 35 of 119 before and after; no note changed family or pass count, and the only change is that three existing notes under `20_Progress/Internship/` lose a `4:wrong-folder` failure (F4 7 to 4; near-fit 4 to 5). A scratch root with a copy of a real reference note under each of the three folders returned `4:wrong-folder` under the old Spec and none under the new, and a control copy under `20_Progress/Projects/` still returned it. Fix 2: Anant decided on 2026-11-21 that working resume exports go in `Resumes/Altered/<Role> - <Company>.docx` and the packet in `Sent/<dossier file name>/`. The Application Documents Standard (Allowed folders, File name, Legacy Shapes), Application Document Preparation step 6 and the registry row prescribed flat output in `Resumes/`; all now name `Resumes/Altered/`, and the Legacy Shapes row no longer flattens `Altered/`. A search of `30_Order`, the Templates and the guard hook found no other flat path, and no Spec path needed a change because the resume Spec matches `Resumes/` and its subfolders. The decision was silent on letters, so working letters stay in `Cover Letters/`. `--kit` shows 0 errors, `--specs` is still 75 from 56, and `--path 30_Order/` is still 130 of 132.
### V0 trace
Every rule or action in the V0 notes that govern documents and dossiers, and where it lives now. Weekend Build promised that V0 is implemented; this is the check. Rows: 48; carried 32, added in the closing pass 6, not carried 9, dropped on purpose 1. No row is unexplained.

| Rule or action | V0 note | Where it lives now | Status |
|---|---|---|---|
| Evidence rule: every claim traces to an approved bullet, a project note or a fact Anant supplied | Resume Alteration | Application Documents Standard, Rules table | carried |
| A posting requirement with no evidence is a logged gap, never invented | Resume Alteration | Application Documents Standard, Rules table and Logged Gaps entries | carried |
| Tailoring may select, reorder and rephrase, never invent a number, skill or scope | Resume Alteration | Application Documents Standard, Rules table | carried |
| Promotion stays document-free; no resume work before real preparation | Resume Alteration | Internship Pipeline, steps 4 and 6 | carried |
| Applying note created when preparation starts, not at submission | Resume Alteration | Application Document Preparation step 1; Applying Standard | carried |
| Draft reads Main Resume, the Applying note and project notes, and asks for unsourced facts | Resume Alteration | Application Document Preparation step 2 | carried |
| A traceable content plan is proposed and approved before anything is written | Resume Alteration | Application Document Preparation steps 3 and 4 | carried, approval extended to every tier by decision Q11 |
| Overwrite in place until applied, no v1 and v2 files; frozen after | Resume Alteration | Application Documents Standard, File name row; Application Document Preparation Do not | carried, frozen at archive in Sent/ |
| resume_version links the file and Documents carries a one-line summary | Resume Alteration | Application Document Preparation step 7; Applying Standard, Documents | carried |
| Markdown is authoritative; DOCX and PDF are generated; Main Resume names reserved | Resume Alteration | Application Documents Standard, Rules row 1 and File name row | carried, reserved names added in the closing pass |
| Main Resume rebuild, DOCX mechanism and drafting agent are not built | Resume Alteration | Main Resume rebuilt 2026-08-29; the agent and builders in System records C and D | carried as status, not a rule |
| Cover letter is a fragment bank, not one fixed letter | Cover Letter Alteration | Application Documents Standard, Letter bank entry | carried |
| Letter evidence rule, and a company fact cites its source | Cover Letter Alteration | Application Documents Standard, Rules table | carried |
| Two or three real experiences and a company-specific opening, never generic passion | Cover Letter Alteration | Application Documents Standard, Rules table and Letter bank Never | carried |
| Letter length 250 to 350 words, a different length needs a stated reason | Cover Letter Alteration | Application Documents Standard, Letter bank Length | carried |
| Resume and letter share one sitting, one Applying note and one approval gate | Cover Letter Alteration | Application Document Preparation | carried |
| Main Cover Letter has to be written from scratch | Cover Letter Alteration | Weekend Build step 13; Internship Apply Lane | carried as status, not a rule |
| Gate contract: pass or fail with line-level flags, never a silent rewrite | Humanizer | Application Documents Standard, Rules table | carried |
| Each flag names the phrase, the pattern it breaks and a suggested fix | Humanizer | Application Documents Standard, Rules table | added in the closing pass |
| The gate runs after plan approval and before any DOCX is written | Humanizer | Application Document Preparation steps 4 to 6 | carried |
| Evidence and tone are separate checks | Humanizer | Application Documents Standard, approval row; Human Writing Standard | carried |
| The checklist the gate runs | Humanizer | Human Writing Standard (nine checks and three more before a DOCX) | carried |
| Networking-message humanization and voice matching | Humanizer | Not carried: deferred in the note itself to a global build; Anant writes outreach from Mimic | not carried |
| Self-audit: personal repos are not open source; every project has a working link; no tutorial-shaped project; portfolio site and LinkedIn listed | HackerRank Rubric | Application Documents Standard, Rules table | added in the closing pass |
| The 120 point split, bonus list and the tier (d) evidence class | HackerRank Rubric | Not carried: one company's tool, and the note says not to wire it in; the research tiers stay in the ATS Research Log | not carried |
| Duplicate dossiers, the same posting filed twice | Dossier Corrections | Internship Notes Standard, Rules table (one posting, one dossier) and File name row; code check exists | added in the closing pass |
| The contested ByteDance pair and the AMD generic-template pair | Dossier Corrections | Not carried: instance checks for Weekend Build step 8 | not carried |
| Quant firms split across role folders | Dossier Corrections | Internship Notes Standard, Rules table | added in the closing pass |
| Grainger business-systems role in AI and ML | Dossier Corrections | Not carried: the CS relevance gate is code, owned by Source of Truth | not carried |
| Empty captures and Zipline directory-page captures | Dossier Corrections | Internship Notes Standard, Body and ready to apply | carried, directory pages added in the closing pass |
| Lapsed deadlines | Dossier Corrections | Internship Notes Standard, state table and Deadline entry | carried |
| PhD and clearance roles | Dossier Corrections | Internship Notes Standard, Screen fields | carried |
| Montenson for Mortenson | Dossier Corrections | Internship Notes Standard, Company entry | carried |
| Company field naming a placement intermediary | Dossier Corrections | Internship Notes Standard, Company entry (decision Q4) | carried |
| The expired certificate on the Acds careers page | Dossier Corrections | Not carried: a one-off finding about an external site | not carried |
| A deadline from a secondary source is not recorded (PIMCO) | Dossier Corrections | Program Standard, Frontmatter | added in the closing pass |
| A program-wide page has no deadline but each requisition does (Deutsche Bank) | Dossier Corrections | Program Standard, Frontmatter | added in the closing pass |
| A program with no company page (Robert Bosch Venture Capital) | Dossier Corrections | Not carried: an instance finding; the Eligibility rule already bars claims not taken from the posting | not carried |
| Greenhouse parse failures: size, graphics, tables, headers, columns, unclear sections, legal suffix, full job titles | ATS Research Log | Application Documents Standard, ATS baseline row | carried, details restored in the closing pass |
| Ashby needs a PDF with a name and one identifier; Lever text must be highlightable | ATS Research Log | Application Documents Standard, ATS baseline row | carried, restored in the closing pass |
| Google resume tips: PDF, one page, the accomplished X as measured by Y by doing Z formula; NACE verb, task, result | ATS Research Log | Application Documents Standard, ATS baseline row and Resume Experience entry | carried, bullet shape added in the closing pass |
| Letter format: plain text, standard font, one page; a posting that asks for a letter overrides the default | ATS Research Log | Application Documents Standard, Rules table | carried, restored in the closing pass |
| Keyword density has no verified percentage; the 2 to 4 mention rule was retracted | ATS Research Log | Application Documents Standard, ATS baseline row (terms only where true, no count) | carried as a prohibition |
| Workday HiredScore skips campus requisitions; Amazon says do not rebuild per role | ATS Research Log | Not carried: findings with no action beyond the tailoring rule | not carried |
| Named-program specifics (MLH essays, NASA OSTEM entry fields, Capital One and Bloomberg process) | ATS Research Log | Program Standard, Traps and Gotchas, one program at a time | carried by design |
| Quant firm resume conventions (LaTeX, GPA threshold) have no source | ATS Research Log | Not carried: nothing to enforce; no company-owned guidance exists | not carried |
| Penn State: always include a letter when the option exists | ATS Research Log | Dropped on purpose by decision Q11: tier 3 has no letter unless the form requires one | dropped on purpose |
| Source tiers (a), (b), (c), the Jobscan 75 percent target and the unresolved uConnect PDF | ATS Research Log | Stay in the ATS Research Log as a research register, not note rules | not carried |
### Design Rationale conditions
Recovered with `git show HEAD:` from `30_Order/Workflows/Internship/Internship - Design Rationale.md`, seven conditions. The Pipeline is at its 350 word limit, so the dossier conditions went into the state table.

| Condition | Carried to, or dropped | Why |
|---|---|---|
| Dossier to Screened needs an explicit fit weighing against the Engineer Edge Roadmap, not "it looked interesting" | Internship Notes Standard, States and moves, row "Same folder, screened" | It is a rule about when a dossier changes state |
| Screened to Committed: the fit test passed; contact reachability and pay never block it | Internship Notes Standard, States and moves, same row | Same transition; Pipeline step 2 already says pay is never a factor |
| Committed to Contacted needs a real contact found; an empty search is valid and blocks nothing | Contact Standard, Rules table | It is a rule about the Contact note, not about a dossier |
| Considering or Serious to Ended needs an application actually submitted, not decided or drafted | Internship Notes Standard, States and moves, row `Applied/`; Internship Tracker Standard, Rules table | Ended is retired; the same condition now gates `Applied/` and the Tracker |
| Ended with no Applying note becomes Discarded | Dropped | The Ended and Discarded folders are gone, and tier 3 has no Applying note by decision Q1 |
| Any stage to Job & Company created when about to apply | Dropped | The Job & Company note was cut; Program Standard, Company Information carries the company research |
| Applying to Result needs a real outcome, not a guess | Internship Tracker Standard, Rules table (`result` row) | It is a rule about the Tracker's result keys |
### Kit map for the instruction notes
Tested against lint on 2026-11-21 after the Codex session found the first version wrong: I had never run the three `20_Progress/Internship/` guide paths (Applying, Resumes, Cover Letters) through lint, and the Reference Standard Spec accepted only `40_Resources` and `10_Areas`, so all three drafts returned `4:wrong-folder`. The Spec path now also accepts `20_Progress/Internship`. For the Codex session, which rewrites these 30 notes against the kit. Nothing here decides what a note says. Public means tracked in the public vault repo today; private means the decision is private and the ignore rule is pending unless `git check-ignore` confirms it. Where a note keeps a guide, the guide states only what to create for each lane and points to the Workflow, so it never restates a step: both how-to Workflows, Internship Pipeline and Application Document Preparation, now carry the steps and stand alone.

| Family | Governing Standard | Template | Workflow | Registry row | Public or private | By hand or by code | Where it lives |
|---|---|---|---|---|---|---|---|
| How-to guides: Applications-to-Create, Programs-to-Create, and the resume and cover-letter guides | Reference Standard, `reference_kind: resource` | Reference Guide Template | Application Document Preparation, Internship Pipeline | reference-resource | Private, ignore pending | by hand | `20_Progress/Internship/Applying/`, `Resumes/`, `Cover Letters/` and `10_Areas/Career/Internships/Programs/` |
| Application dashboards: Now, Application Tracker, Tracker kanban | Dashboard Standard | Dashboard Template | none | dashboard | Now private (ignore pending); the other two in `Tracker/`, undecided | by hand, Dataview | `20_Progress/Internship/Applying/` and `10_Areas/Career/Internships/Tracker/` |
| Whole-loop status: Internship - Dashboard, Internships Hub, Main Log | Dashboard Standard; Logs Standard for a log | Dashboard Template | none | dashboard, log | Public today | by hand | `10_Areas/Career/Internships/` and `Tracker/` |
| Folder MOCs: Dossiers MOC, Programs MOC, Contacts MOC | MOC Standard | Folder MOC Template | none | moc | Dossiers MOC public, a fixed path the writer links; Programs MOC private pending; Contacts MOC private (git-ignored) | by hand, Dataview | `10_Areas/Career/Internships/List/`, `Programs/`, `Contacts/` |
| Entry and navigation: README, Links & Interlinks | MOC Standard; Reference Standard, `reference_kind: link-hub` | Folder MOC Template; Reference Guide Template | none | moc, reference-resource | Public | by hand | `10_Areas/Career/Internships/` |
| Outreach reference: Mimic, Outreach Discovery & Automation Status | Reference Standard, `reference_kind: resource` | Reference Guide Template | none | reference-resource | Mimic public (the one tracked file under `Contacts/`); the other private | by hand | `10_Areas/Career/Internships/Contacts/` |
| Cheats: LinkedIn Premium, Resume Tailoring cheat | Reference Standard, `reference_kind: research` | Reference Guide Template | none | reference-resource | Public | by hand | `10_Areas/Career/Internships/Cheats/` |
| Generated logs: Run Log and the two Excluded logs | Generated Output Standard | none (code-written) | none | generated-output | Public | by code (`core/run_log.py`) | `10_Areas/Career/Internships/List/` |
| Generated apply-lane notes: Apply Queue, Follow-ups, Deadline Map, Loop Status | Generated Output Standard | none (script-written) | none | apply-lane-generated, planned | Private | by hand today; planned by a local builder | `20_Progress/Internship/Applying/` |
| Packet archive | Application Documents Standard | none | Application Document Preparation | application-packet, planned | Private | by hand today; planned by `mark_applied` | `20_Progress/Internship/Sent/<dossier file name>/` |
| Old Deadline Tracker and seed stubs | none | none | none | none | Deadline Tracker public in `Tracker/`; stubs private pending | by hand | A hand-off: the Codex session decides |
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
| Applying Standard | Live hub for one prepared application | Application Document Preparation | 1 (withdrawn), 0% | KEEP for tier 1 and tier 2 (Operator decision 11), about 700 words. Stays `built (unexercised)`. |
| Program Standard | Static research on one internship | Pipeline, `program-writer` agent | 31, 0% | KEEP for tier 1 and tier 2. Required keys fall from 23 to about 14: `deadline_real`, `applying_note`, `benefits` are 0 of 31 filled, `wave` 9, `opens_date` 4. About 800 words. |
| Contact Standard | Outreach file for one internship | Pipeline, `contact-researcher` | 30, 0%. `email` filled on 1, `last_contact_date` on 0, so no outreach has been logged | KEEP, one per internship, for tier 1 and tier 2. About 650 words. |
| Resume Alteration Standard | Evidence rule and resume bank | Application Document Preparation | 0 match | MERGE into a new Application Documents Standard. Adds `resume_variant`. |
| Cover Letter Alteration Standard | Fragment bank and letter length rule | Application Document Preparation | 0 | MERGE into the same Standard. Adds `letter_mode`. Target about 1,150 words with two Specs. |
| Deadline and Intake Triage Standard | Governs two notes of the manual sweep | Review System, Ready to Screen link | 3, 0%. Last sweep 2026-10-04 | CUT (Operator decision 18). The deadline map becomes a weekly generated note covered by Generated Output Standard, and the intake log has no reader. |
| Internship Loop Review Standard | Checks the bot's output and promotion stalls | Review System | 4, 0%. None since 2026-09. Run by hand. | KEEP, thinner. Weekly shows three numbers, Monthly four decisions (Operator decisions 15 and 16). About 950 words. |
| Interview Prep Standard | Spoken plan for one interview | None today; Operator decision 17 makes the prep note part of the interview step | 0 match | KEEP (Operator decision 17), rebuilt to the new Applying and Tracker fields. About 750 words. |
### Workflow verdicts
| File | Words | Verdict |
|---|---|---|
| Internship Pipeline | 403 | KEEP, rewrite to 350 or fewer, two lanes. Folds in the transition conditions of Design Rationale. |
| Application Document Preparation | 325 | KEEP. Adds classification and the archive step. |
| Career Fair Intake | 260 | KEEP, now serves Internship Notes Standard. |
| Internship Review System | 404 | KEEP, trim to 350 or fewer. Says plainly that the reviews are run by hand and claims no schedule (Operator decision 16). |
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
### Phase 1b: instruction-note families
Source: the Codex ledger `Instruction Notes Rewrite Plan` (read 2026-11-21, 36 KB, still being updated) and the general Standards for MOC, Dashboard, Logs, Generated Output, Reference, Plan, Action and Project. The test: an internship Standard is warranted only if the loop, a skill or a named agent writes or reads the family by fixed fields. Fixed-field readers found: the writer links `Dossiers MOC` and `Viewed/Removed Dossiers MOC` from every dossier, the code writes `Run Log` and the two Excluded logs, `startday` expects counts from `Tracker/Tracker.md`, and the promote-dossier skill reference names `Mimic`. None needs fields beyond what a general Standard supplies, so no instruction-note family gets an internship Standard.

| Family | Notes | Job | Covering Standard, Template, Workflow | Gap | Verdict |
|---|---|---|---|---|---|
| How-to guides: Applications-to-Create, Programs-to-Create | 2 | Tell a person how to do a pipeline step | Reference Standard allows guides, but both restate Workflow steps. No Template, no Workflow of their own. | Nothing says a how-to belongs in a Workflow. Programs-to-Create also holds the Job & Company spec (two jobs). | MERGE into Application Document Preparation and Pipeline, then cut the notes |
| Application dashboards: Now, Application Tracker, Tracker kanban | 3 | Show in-flight and applied applications | Dashboard Standard, Dashboard Template, no Workflow | The queries read `Applied/` and `Result/` folders that do not exist and read `status` as the funnel stage. The kanban has no query and only the `startday` skill reads it. Only reader is Dataview for the first two. | KEEP one, `Now`, reading Tracker `Applied/` plus tier 1 Applying notes. MERGE the other two into it. |
| Whole-loop status: Internship - Dashboard, Internships Hub, Main Log | 3 | Tell Anant where the loop stands | Dashboard Standard for the first, Logs Standard for a log, Action Standard for a queue | Hub and Dashboard compete. Main Log does three jobs: escalation queue, dated census, cadence history. | KEEP Dashboard. MERGE Hub into it. SPLIT Main Log: open escalations stay, history goes to the Build Log or git. |
| Folder MOCs: Dossiers MOC, Programs MOC, Contacts MOC | 3 | Map a folder, and count it | MOC Standard (`type: index`, prose Purpose and Map), Folder MOC Template, no Workflow | All three are Dataview queries typed `evergreen`. Dossiers MOC mixes a map with a capacity query and is a fixed path the writer links. Programs MOC and Contacts MOC have Dataview as their only reader. | KEEP Dossiers MOC as a real MOC and move its capacity view to the Dashboard. Programs MOC and Contacts MOC: decide in the interview. |
| Entry and navigation: README, Links & Interlinks | 2 | Map the folders, list links | MOC Standard, Reference Standard with `reference_kind: link-hub` | README is a map plus a changelog (two jobs). | KEEP both, rewritten to those Standards. Drop the changelog. |
| Outreach reference: Mimic, Outreach Discovery & Automation Status, Networking Strategies | 3 | Message bank, tool status, nothing | Reference Standard with `reference_kind: resource` | Networking Strategies is 0 bytes. The status note mixes a tool choice with a dated status snapshot. | KEEP Mimic. Status note: keep the tool choice, drop the snapshot. Networking Strategies: ask. |
| Cheats: LinkedIn Premium, Resume Tailoring cheat | 2 | Tactics and search operators | Reference Standard with `reference_kind: research` | Both overlap each other and Mimic. Registry row `cheat` points at the wrong folder. | KEEP as reference once the registry row is cut. Split each by topic. |
| Generated log: Run Log | 1 | Weekly roll-up of the bot's runs | Generated Output Standard (`type: generated`, `gen_kind: report`, no `status`) | The code (`core/run_log.py`) writes its own frontmatter and header without `type: generated`. No reader. | KEEP as generated. Code follow-up. |
| Deadline Tracker | 1 | Group posting and personal deadlines | Dashboard Standard | Two jobs: a current sweep and August history. No frontmatter. | HELD with Deadline and Intake Triage Standard |
| Seed stubs: 5 under Resumes, 5 under Cover Letters | 10 | Nothing | None. They match no family. | Zero inbound links, zero tool references. | CUT. Ledger marks this as an ask. |
Notes that do two or more jobs: Programs-to-Create, Main Log, Dossiers MOC, README, Internships Hub, Deadline Tracker, Outreach Discovery & Automation Status, LinkedIn Premium. Families whose only reader is Dataview: Programs MOC, Contacts MOC, Application Tracker, `Now`.
### Phase 1b: the loop's System kit
Read: System Component Standard in full; the seven existing `spec` records (Jarvis Memory and Vault Lint in full, Sync Workflow's Trigger section, and the headings, `trigger` and `owner` lines of Claude Workflow, Cursor Workflow, Excalidraw MCP and Jarvis Ops CLI; I did not read the others in full); and in the loop repo through WSL the five workflows, `run_pipeline.py`, `recheck.py`, `screen_report.py`, `core/git_ops.py`, `core/run_log.py`, `vault_writer/`, `docs/PIPELINE_CONTRACT.md`, `CLAUDE.md` and the agent files. The repo is public. Its default branch is `master` and its code is changing today under Weekend Build, so every record must be verified against merged code when written.

| Component | Runs | Writes to | Built | Record |
|---|---|---|---|---|
| Hourly run: `run.yml`, `run_pipeline.py`, plus manual `reseed.yml` | Cron `0 * * * *` UTC, dispatch; reseed by dispatch with a typed confirmation | Dossiers into the Jarvis repo; `state/*.json` and `logs/runs.jsonl` into the loop repo; issues `dossier-ready`; `gh workflow disable run` at the hard pause | Yes | A: Internship Loop Run |
| Dossier writer and write gate: `vault_writer/` | Inside the run | The dossier frontmatter and body | Yes | A |
| Limits and the pause: quota 2/1/1/2, bucket 50, thresholds, hard pause 300, `MAX_DEBATE_LOSSES` 48 | Inside the run | Issues, the pause | Yes, today at 300 and not 200 | A |
| Seen-mark and state: `commit_and_push_with_retry` | Inside the run | Pushes to `master` with one retry; nothing is marked seen if the push fails | Yes | A |
| Run Log and the two Excluded logs: `core/run_log.py` | Inside the run | `List/Run Log`, `List/Excluded - Losing The Debate`, `List/Excluded - Failed The Write Gate` | Yes, with a file name mismatch | A |
| Daily recheck: `recheck.yml` | Cron `30 6 * * *` UTC | Moves closed postings to `Viewed/`; `logs/rechecks.jsonl`; issue on a mass-deletion brake or push failure | Yes | B: Internship Loop Upkeep |
| Weekly revalidate: `revalidate.yml` | Cron `0 8 * * 1` UTC | One digest issue, no vault write | Yes | B |
| Promotion agents and skills: `/promote-dossier`, `/promote-manual-find`, `promotion`, `program-writer`, `tracking`, `contact-researcher`, `applying` | Human started, consent gated | Program, Contact, Tracker and Applying notes into the vault | Yes, `applying` blocked | C: Internship Promotion Agents |
| Apply Queue, `mark_applied`, follow-up note, `Archived/` mover, resume variants, letter bank, document gates, `companies.yml` | Planned | Generated notes, dossier moves, Tracker, `Now` row, packet archive | No | D: Internship Apply Lane, status `seed` |
| `test.yml` | Push and pull request | Nothing in either vault | Yes | None: writes to neither the vault nor a public repo |
| `screen_report.py` | Manual CLI, read-only | Stdout | Yes | None until it is extended into the Apply Queue |
| `jarvis-internship-note-guard.ps1` hook | PostToolUse in the vault | `claude-workflow/logs/internship-note-guard.jsonl`, 1 line since 2026-10-04 | Yes | Already inside the Claude Workflow record. See Corrections. |
| Weekly and monthly review schedule | Claimed cron in Internship Review System | Review notes and the Main Log | Unknown. No scheduled task found in the repo or the vault scripts I read. | Ask in the interview |
Decision offered to Anant, with the cost of each. One record per component would give about ten files that repeat the same checkout, token and state paragraphs and drift apart. One record for the loop would be a single file to open, but `status` is per file, so planned work cannot be marked `seed` inside a built record, which the brief forbids. Recommended: four records in one folder `30_Order/System/internship-loop/`, grouped by failure domain, A to D above. Cost: four files to keep current instead of one.
System needs one Workflow. Real failure behind it: the same field list now lives in six places (the vault Specs, the vault Templates, the PowerShell guard, the loop repo `CLAUDE.md`, the promote-dossier skill reference, the four note-writing agents) and they already disagree. Proposed name `Loop Contract Change`, 350 words or fewer: change the Spec first, then the Template, the guard list, the loop contract and the agents, then run `--kit`. The registry row for system-component would name it.
System Component Standard fit for a component that runs on GitHub Actions. System drift, one line each, none applied yet:
- Trigger: say the runner (GitHub-hosted) and that cron times are UTC, not "on which machine".
- State: the loop tracks `state/` and `logs/` in its own repo on purpose, committed by the workflow, so the rule "name the ignore rule" needs an alternative for state tracked by design.
- Failure Behavior: name every secret by name and how its expiry is checked. `JARVIS_PUSH_TOKEN` was created 2026-07-17 and the last scheduled runs were in September.
- Allowed folders: one folder may hold several related records.
- Registry row for system-component has Workflow `none`, which changes with the new Workflow.
### Phase 1b: target kit after the interview
| Group | Files | Target size |
|---|---|---|
| Standards, 8 | Internship Notes (dossier plus career-fair capture Specs), Tracker, Applying, Program, Contact, Application Documents (resume and cover-letter Specs, replaces Resume and Cover Letter Alteration), Loop Review (weekly and monthly Specs), Interview Prep | 650 to 1,150 words each, no entry over 180 |
| Templates, 8 | Applying, Contact, Cover Letter, Program, Loop Weekly Review, Loop Monthly Review, Tracker, Interview Prep | The Spec keys and headings, one comment line each |
| Workflows, 5 | Internship Pipeline, Application Document Preparation, Career Fair Intake, Internship Review System, and new Loop Contract Change in System | 350 words or fewer, each ending in `Done when` |
| System records, 4 | Internship Loop Run, Internship Loop Upkeep, Internship Promotion Agents, Internship Apply Lane (`seed`) in `30_Order/System/internship-loop/` | About 700 to 1,000 words each, seven headings, D about 500 |
| Instruction-note families, 30 notes | No new Standard. They follow MOC, Dashboard, Reference, Generated Output and Logs Standards per the family table. | Codex rewrites them against the kit |
| Gone | Career Fair Standard and Cover Letter Alteration Standard (merged), Deadline and Intake Triage Standard, Cheat, Job & Company, LinkedIn Post and Postings Log Templates, Internship Tracking Workflow (merged), Design Rationale, the redirect stub, Promotion (moved out) | |
### Phase 1b: Content Needed
Unknowns are closed by an Operator decision, or named as still open for Checkpoint 2.

| File | Must state | Source | Status |
|---|---|---|---|
| Internship Notes Standard | Eight folders and the move into each; the target frontmatter with `tier`, `starred`, `resume_variant`, `letter_mode`, `date_applied`, `review_state`; one deadline field; `company` is the host employer; link dossiers by file name; `Archived/` moves set `removed_date` and `removed_reason`; `_Career Fair/` rules; ready to apply | `writer.py`, Weekend Build, Dossier Corrections, decisions Q2, Q4, Q8, Q10, Q18, Q19 | Closed |
| Internship Tracker Standard | Created at apply time in `Applied/`; `program` and `contact` optional; copies `tier`, `starred`, `resume_variant`, `letter_mode`; follow-up lines at 7 and 14 days in the Timeline; result values; no approval field; the three folders and which two must be created | Q1, Q9, Q10, Q19, Checkpoint 2 | Closed |
| Applying Standard | Tier 1 and tier 2 only; its fields; `stage` values including `awaiting-approval` and `approved`; read by `Now` | Q11, Checkpoint 2 | Closed |
| Program Standard | Tier 1 and tier 2, created beforehand by the promotion agent; the 14 keys that stay | Q13, fill rates | Closed. The key cut is my proposal. |
| Contact Standard | One per internship, tier 1 and tier 2; Anant writes outreach from Mimic; `contact-researcher` finds sourced names and links | Q13 | Closed |
| Application Documents Standard | Variant from the role folder with override; letter by tier; approval before anything is sent, tier 3 included; the packet in `Sent/`; private | Q11, Q12, Checkpoint 2 | Closed |
| Internship Loop Review Standard | Weekly three numbers, Monthly four decisions, run by hand | Q15, Q16 | Closed |
| Interview Prep Standard | Prep note when an interview is booked; agent drafts JD analysis and questions, Anant writes pitch and answers | Q17 | Closed |
| Templates (8) | The Spec keys and headings | The Standards above | Closed once the Standards are final |
| Internship Pipeline | Tier 3 fast lane; tier 1 and tier 2 apply lane with Program and Contact created beforehand; steps 1 to 9; `Done when` | Q1, Q11, Q13 | Closed |
| Application Document Preparation | The eight steps, with approval for every tier and the archive step | Q11, Weekend Build | Closed |
| Career Fair Intake | The manual lane; transcripts private | Existing Workflow, Q19 | Closed |
| Internship Review System | By hand, Friday and the 1st, no schedule claimed | Q16 | Closed |
| Loop Contract Change (new) | Change the Spec, Template, guard list, loop contract and agents in order, then run `--kit` | This plan | Draft known |
| System records A and B | Seven headings from the workflows and code; a failed push raises an issue and token expiry is not checked in advance; the banner is built locally | Repo, Q14, Q18, Checkpoint 2 | Closed |
| System record C | Which agents write which notes, consent gates, tier 2 batch creation | Repo `CLAUDE.md`, Q13 | Closed. Batch creation is not a capability the agents have today. |
| System record D (seed) | The planned parts and that none is built | Weekend Build, Q6 to Q19 | Closed as plan |
| Instruction-note families | Which general Standard each follows | Family table, Q6, Q13 | Closed. The content of each note is Codex's and Anant's. |
## Non-Goals
- No edit to any instance note, the code repo, `.claude`, `.codex`, `.cursor`, `.agents`, `.obsidian`, `50_Archive` or the vault root.
- No new note type, no instance clean-up, no redesign of the binding decisions.
- No change to the Frontmatter Standard vocabulary. The proposed mapping fits the existing tables.
## Decisions
Binding decisions from Weekend Build are encoded as written: `tier` replaces `preference_tier`; the dossier states are the four role folders, `Viewed/`, `_Career Fair/`, `Applied/`, `Archived/`, with the last two excluded from counts; tier 2 and 3 need no Program or Contact; `resume_variant` and `letter_mode` classify each application; the eight step sequence and the evidence rule stay; applying produces `date_applied`, a Tracker note, a `Now.md` row and an archive copy with follow-ups at 7 and 14 days.
### Operator decisions
- 2026-11-21, Q1 fast lane records: yes. Tier 3 skips the Applying note. The Tracker is created at apply time straight into `Applied/`, with `program` and `contact` optional. `Now` reads those Trackers plus tier 1 Applying notes. The Commit-time Tracker rule in Pipeline and in the Tracker Standard changes. I read the wording as tier 1 and tier 2 both get an Applying note, and confirm it in the Documents batch.
- 2026-11-21, Q2 dossier vocabulary: `status` is `seed`, `tree` or `archived`, with `archived` for `Applied/`, `Archived/` and `Viewed/`, plus `review_state` and `tier`. The code repo is told later to write `type`, `input_kind` and `status: seed`. The 354 old dossiers stay at 0% until a scripted fix is approved separately. `unreviewed` and `removed` are not added to Frontmatter Standard.
- 2026-11-21, Q3 verdict tables approved as written. Interview Prep Standard and Deadline and Intake Triage Standard stay cut candidates until the interview shows what an interview and the daily deadline check need.
- 2026-11-21, Q4 `company` holds the host employer. The intermediary is named in the body.
- 2026-11-21, Q5 keep Weekly and Monthly reviews, thin, with limits read from Source of Truth.
- 2026-11-21, drift items approved: the registry qualifier after a kit state, the 350-word Workflow limit, and 16 internship rows.
- Assumption, not approved: `Archived/` sits under `List/Dossiers/`, as Weekend Build proposes and still lists as an open question.
- 2026-11-21, apply loop (Q6): the first screens are the Apply Queue note and the Internship Dashboard. The dashboard shows today's tasks, what shipped yesterday and this week, the streak and the monthly goals (read from the daily note and the weekly Goals note, not from loop files), the next action and open tasks of each starred internship, and a pending-actions list.
- 2026-11-21, apply loop (Q7): the Apply Queue row is dossier link, company, tier, role folder, deadline, `resume_variant`, `letter_mode`, estimated minutes (25, 12, 5 by tier), ordered by tier, soonest deadline, newest posting, then resume overlap; top 3, 10 and 30 per tier on Sunday, about 10 a day after.
- 2026-11-21, apply loop (Q8): a dossier is ready to apply when its posting text was captured, its deadline has not lapsed, it was not rejected at Screen for PhD, clearance or citizenship, `resume_variant` and `letter_mode` are set, and for tier 1 a Program note exists.
- 2026-11-21, apply loop (Q9): at apply the dossier gets `date_applied` and moves to `Applied/`, a Tracker is created in `Applied/` linking the dossier, a row appears in `Now`, the exact resume, letter and posting are archived, and follow-up dates at 7 and 14 days are set. Anant calls this the minimum.
- 2026-11-21, apply loop (Q10): an internship is starred by a `starred` field Anant sets on the dossier, copied to the Tracker at apply time. The pending list is a follow-up due at 7 or 14 days, a letter awaiting approval, a deadline within 3 days, an interview booked. Anant writes follow-ups from Mimic and logs each as a dated line in the Tracker Timeline.
- 2026-11-21, documents (Q11): tier 1 and tier 2 both get an Applying note. The resume variant is set by the loop from the role folder (1 - AI & ML is `ai`, 2 - Fullstack is `fullstack`, 3 - CyS & Finance is `systems`, Other takes the closest) and Anant can override it on the Apply Queue row. Tier 1 gets a tailored letter, tier 2 a bank letter plus one company hook, tier 3 no letter. Anant approves everything before it is sent, tier 3 resumes included.
- 2026-11-21, documents (Q12): the archived packet is private. Packets and `Cover Letters/` are git-ignored. Which other folders are public was settled by the public view decision below.
- 2026-11-21, programs and contacts (Q13): tier 1 and tier 2 both get a Program and a Contact note; only tier 3 skips them. This overrides the fast lane of Weekend Build for tier 2. Tier 2 Program and Contact notes are created beforehand, in batches by the promotion agent, so apply day only prepares documents and submits. A Contact note is one per internship, as today. Anant writes outreach from Mimic; `contact-researcher` finds sourced names and LinkedIn people-search links. Programs MOC and Contacts MOC stay as prose MOCs under MOC Standard, and the empty Networking Strategies note is cut.
- 2026-11-21, loop health (Q14): failures reach Anant as a GitHub issue plus a banner on the Internship Dashboard showing the last successful run time and turning to a warning when stale. The failures in scope: no successful hourly run in 3 hours, the hard pause, a failed push such as an expired `JARVIS_PUSH_TOKEN`, a write-gate rejection storm, the recheck mass-deletion brake, a source returning zero matches.
- 2026-11-21, loop health (Q15): the weekly review shows three numbers: new dossiers written this week by tier against quota; applications submitted this week and follow-ups overdue; days since the last successful hourly run with failed runs counted. The monthly review decides whether any company moves tier in `companies.yml`, whether quota or limits change, which sources to add or drop, and whether the loop keeps running.
- 2026-11-21, loop health (Q16): no review is on a schedule. Anant runs them by hand.
- 2026-11-21, interviews (Q17): when an interview is booked, a prep note exists in `Preperation/Interviews/` linked from the Applying note, with the format, JD analysis mapped to Anant's projects, a pitch, talking points, questions to ask and an After the Interview debrief within a day, and the Tracker's Interview Steps section is updated. An agent drafts the JD analysis and the questions; Anant writes the pitch and the answers. Interview Prep Standard and Template stay.
- 2026-11-21, deadlines (Q18): no daily deadline check. The deadline map is a weekly note generated by the loop with no LLM, listing every recorded deadline per application in buckets. A lapsed dossier moves to `Archived/` every day automatically, with `removed_date` and `removed_reason: deadline lapsed`.
- 2026-11-21, public view (Q19): dossiers and docs are public. Programs, Trackers, Applying, Contacts, Cover Letters, packets, interview prep and career fair transcripts are private and git-ignored. Dossiers keep `tier`, `starred`, `resume_variant` and `letter_mode` and stay public, and only `Applied/` is ignored. The view-only page shows company, title, locations, terms, deadline, posting link and matched reason, and no tier, starred or application status.
- 2026-11-21, Checkpoint 2 reply, packet: the folder is `20_Progress/Internship/Sent/<dossier file name>/` and holds the resume DOCX, the letter DOCX when one is sent, and `posting.md`. It is private and gets a registry row. For tier 1 and tier 2 the Applying note's `stage` must reach `approved` before anything is archived, and `awaiting-approval` and `approved` join the stage values if missing. For tier 3 `mark_applied` asks for confirmation before it archives and nothing else is recorded. The Tracker carries no approval field.
- 2026-11-21, Checkpoint 2 reply, `Now`: the columns are company, title, tier, `date_applied`, next follow-up date, result and a link to the Tracker. The Tracker copies `tier`, `starred`, `resume_variant` and `letter_mode` at apply time, because the dossier leaves for an ignored folder when the application is made and `Now` needs no join.
- 2026-11-21, Checkpoint 2 reply, token expiry: no check could be verified, so the records claim none. Records A and B say a failed push raises an issue and expiry is not checked in advance. Record D (seed) lists a daily expiry check as planned and says the response header that carries a token's expiry date has not been verified. No built record names the header.
- 2026-11-21, Checkpoint 2 reply, banner: the Apply Queue builder, run locally, writes Loop Status from a read-only `gh run list` on the run workflow (`last_run`, `last_success`, `paused`, `built_at`) into a git-ignored path. It makes no commit. The dashboard banner warns when `built_at` is over a day old or `last_success` is over 3 hours old. The GitHub issue covers failures while the loop runs.
- 2026-11-21, Checkpoint 2 reply, tier 2: accepted as decided, Program, Contact, Applying and Tracker for tier 1 and tier 2 and approval of every document. The Pipeline Workflow says tier 2 Program and Contact notes are created beforehand one at a time with `/promote-dossier` until a batch mode exists, and record C says batch creation is not built. Ready to apply needs a Program note for tier 1 and tier 2. A Contact note is not a gate. No Standard, Template or Workflow holds a quota, limit, minute estimate or Sunday count; they point to Source of Truth and the loop's config.
- 2026-11-21, Checkpoint 2 reply, `Applied/`: keep it ignored. Contract: before `mark_applied` or the Archived mover moves a dossier out of the tracked tree it writes that dossier's cross-source duplicate key into the loop repo's state, so the duplicate check stops depending on a scan of the public checkout. A dry run must show the move reaches the loop's checkout as a deletion from the role folder.
- 2026-11-21, Checkpoint 2 reply, public scope: accepted. The vault syncs between laptops by Syncthing and uses git for history only, so a git ignore does not stop syncing; it ends git history as a backup for those notes and Syncthing's staggered versioning becomes the only history. `.stignore` was read on 2026-11-21 and lists none of the eight folders. A Standard says "private" and says "git-ignored" only for a path where `git check-ignore` confirms it today (`Resumes/` and `Contacts/` except `Mimic.md`). For the rest it says "private, ignore rule pending".
- 2026-11-21, Checkpoint 2 reply, Excluded log: the vault's hyphen name wins. A code follow-up changes the name the loop writes.
- 2026-11-21, C1: the guard hook `jarvis-internship-note-guard.ps1` is in scope. Its field lists are updated in the same step as each Standard and each edit is proved by running it against a sample payload. Lint has no extra-key rule, so cutting a Program's required keys does not fail the notes agents write today, and the Program Standard says so.
- 2026-11-21, C2: System Component Standard gets the five drift edits before the records are written.
- 2026-11-21, C3: records A to D are written now from today's verified state, dated, with a Verify run against real output. Record A states today's values (the hard pause is 300 today). Record D is `seed`. Every later code prompt ends with "update the record through Loop Contract Change". Loop Contract Change says it shrinks once the guard hook reads the Specs directly.
- 2026-11-21, C4: the Notes Standard carries a dossier state table (folder, `status`, `review_state`, who or what moves it, when), derived from the Frontmatter Standard's status definitions. It needs no new vocabulary.
- 2026-11-21, C5: every Contracts row has a Today column, "by hand" or "by code". The Pipeline and Application Document Preparation steps each name who does it today. Sunday works with none of `mark_applied`, the Apply Queue generator or the Archived mover built; the Workflows give the by-hand path and the Tracker Template is filled by hand. Until the eligibility gate exists, Anant screens by eye on the posting.
- 2026-11-21, C6: dossiers keep `created` and `updated`. The other `input` Specs (Clipping Standard, Transcript Standard) require both, and Frontmatter Standard requires them on every tier 1 and tier 2 note. `created` is `date_found`; `updated` is `date_found` at write and is set by every mover. This reverses my unapproved Checkpoint 2 default of leaving them off.
- 2026-11-21, C7: Tracker folder row. `Tracker/Each One/` holds `Current/` (29 notes) and 3 loose files today. `Applied/` and `Result/` do not exist, so the first move into each creates it. The Standard names all three and says which two must be created.
- 2026-11-21, C8: a generated note that reads a private family is written under an ignored path. The Apply Queue, Follow-ups, Deadline Map and Loop Status go in `20_Progress/Internship/Applying/`. Because a GitHub Actions checkout of the public repo cannot see private folders, the builders that read Programs, Trackers and Applying notes run locally, not in Actions. The old `Deadline Tracker` note is a hand-off to the Codex session and is not touched here.
- 2026-11-21, C9 to C12: eight Templates, with Interview Prep. Deadline and Intake Triage Standard is CUT. Interview Prep Standard and Template stay. `Archived/` sits under `List/Dossiers/`. The proposal to merge the two how-to guides into the Workflows is a proposal for what the Workflows hold, not an order to cut: both Workflows stand alone, the ledger's Decisions are re-read before the registry step, and Reference Standard's `resource` kind ("a guide, definition set, or cheat sheet") already gives a surviving guide a home. Four records in `30_Order/System/internship-loop/`, the Loop Contract Change Workflow, the Program keys cut to about 14 and the five-item reading of Q9 are approved.
- 2026-11-21, Phase 2 reply, Part 1: `_Career Fair/` dossiers stay exempt from the deadline rule. The Notes Standard and the Pipeline Workflow say the daily Archived mover skips `_Career Fair/`, so nothing there carries `removed_reason: deadline lapsed`, and Anant archives a fair dossier by hand once its fair has passed. Because `_Career Fair/` counts toward the hard pause total, its count goes on the weekly review's Loop Run Health line. No new field. The 29 Trackers in `Current/` stay where they are; they are not applications, because nothing in `Current/` was submitted. The Tracker Standard says a Tracker outside `Applied/` is not an application, and `Now`, the weekly review and every count read `Applied/` only. Moving or retiring the 29 belongs to the separate scripted fix.
- 2026-11-21, Phase 2 reply, Part 2: approved as made: the dossier Spec requires `tier`, `resume_variant` and `letter_mode` and not `starred`; the Tracker Spec keeps `Current/` as legacy and requires the four copied keys but allows them blank; the Weekly and Monthly heading names; the registry rows `application-packet` and `apply-lane-generated`; the Interview Prep classifier and the four-note skip list in the hook; Application Document Preparation serving the Application Documents Standard. Changed: `role_type` is required again (15 keys) and `applying_note` stays dropped; the Design Rationale conditions are carried as the table under Phase 2 closing pass shows; the Notes Standard is trimmed to 1,500 words or fewer by the Note Kit measure.
- 2026-11-21, Phase 2 reply, Part 3: the V0 trace, the Kit map, the link-only repairs in six notes, the read-only run and issue facts in records A and B, the number search and the Contracts Today column check are done and recorded under Phase 2 closing pass.
## Sequence
Phase 2 order. Each file is re-read and its modified time compared before it is edited.
0. Apply the Checkpoint 2 corrections to this plan. Done when Operator decisions, Contracts, Sequence and Corrections carry them.
1. Registry definition line, then the five System Component Standard edits. Done when `--kit` has no new error and `--specs` still matches the Spec blocks.
2. Internship Notes Standard with the career-fair capture Spec, the dossier state table and the Tracker folder facts. Done when `--path 30_Order/Standards/Internship/` fits and `--specs` matches.
3. Tracker, Applying, Program, Contact, Interview Prep, one at a time. After each: lint, update the guard hook field list, run the hook against a sample payload and read its output.
4. Application Documents Standard, then Loop Review Standard.
5. The eight Templates, one comment line per heading.
6. Pipeline, Application Document Preparation, Career Fair Intake and Review System, each 350 words or fewer and ending in `Done when`. Create Loop Contract Change in System. Move Promotion. Update the Workflows Index.
7. The approved cuts, with every inbound link repaired first, including the registry, the Workflows Index and Jarvis Order Rebuild Design. List the loop repo's references as follow-ups.
8. Registry rows, with honest statuses, after re-reading the Codex ledger's Decisions.
9. The four System records, each with a Verify that ran and its date.
10. Run `--kit`, `--specs`, `--path 30_Order/` and `--path "20_Progress/Internship/Building System/"`, then read two real notes per kept family against its new Standard. The Spec count is expected near 75 from 56 Standards and the real number is reported.
11. Update Current State with the dated outcome and append one entry to System - Build Log.
Target: 8 Standards, 8 Templates, 4 Workflows in `Internship/` plus Loop Contract Change in System, 4 System records, no new instruction-note Standard.
## Contracts
What the code or a skill must write, in exact names. Today says who produces the value now: "by hand" means no code does it today. After every code prompt that changes one of these, the prompt ends with "update the record through Loop Contract Change".
### Dossier frontmatter
| Key | Value | Written by | Today | State |
|---|---|---|---|---|
| type, input_kind | `input`, `job-dossier` | Loop writer | by hand | The writer does not emit them |
| created, updated | `created` is `date_found`; `updated` is `date_found` at write and is set by every mover | Loop writer and movers | by hand | The writer does not emit them |
| company | The host employer as the posting names it | Loop writer | by code | Written; Montenson and Acds show the rule is not applied |
| title, url, source, terms, locations, target_year, date_posted, date_found | As today | Loop writer | by code | Written |
| deadline_posted or own_deadline | Exactly one; `own_deadline` is `date_found` plus 7 days | Loop writer | by code | Written and gated in `validate.py` |
| matched_reason | One sentence naming the signal, never the bare word `matched` | Loop writer | by code | Six of nine sources write the bare word |
| status, review_state | `seed`, `unreviewed` | Loop writer | by hand | The writer emits `status: unreviewed` |
| tier | 1, 2 or 3 from `companies.yml`, replaces `preference_tier` | Loop writer | by hand | Planned, Weekend Build step 4 |
| resume_variant, letter_mode | `ai`, `fullstack`, `systems`, `other`; `tailored`, `bank`, `none` | Loop writer | by hand | Planned, Weekend Build step 10 |
| starred | `true` or blank | Anant | by hand | New |
| next, notes, tags | Blank; the Dossiers MOC link; `internship`, `auto-discovered`, `company/<slug>` | Loop writer | by code | Written |
| screened_date, screened_decision, screened_reason | `pass` or `reject` with the signal | Anant at Screen | by hand | No writer; Anant screens by eye on the posting until the eligibility gate exists |
| date_applied | Set at submission; the dossier moves to `Applied/` | `mark_applied` | by hand | Planned |
| removed_date, removed_reason, status `archived` | On a move to `Viewed/` (closed posting) or `Archived/` (`removed_reason: deadline lapsed`) | Recheck, Archived mover | by code for `Viewed/`, by hand for `Archived/` | The writer sets `status: removed` today; the Archived mover is planned |
### Folders and fixed paths
| Contract | Value | Today | State |
|---|---|---|---|
| Dossier folders | `10_Areas/Career/Internships/List/Dossiers/`: `1 - AI & ML`, `2 - Fullstack`, `3 - CyS & Finance`, `Other`, `Viewed`, `_Career Fair`, `Applied`, `Archived` | by code for the first four and `Viewed`; by hand for the rest | `Applied/` and `Archived/` do not exist yet |
| Counts | Counted by the limits as Source of Truth and the loop config say; `Viewed`, `Applied` and `Archived` are excluded | by code | The code counts the four role folders only today |
| Fixed links the writer emits | `10_Areas/Career/Internships/List/Dossiers MOC` and `10_Areas/Career/Internships/List/Dossiers/Viewed/Removed Dossiers MOC` | by code | Renaming either breaks every dossier |
| Log files under `List/` | `Run Log`, `Excluded - Losing The Debate`, `Excluded - Failed The Write Gate` (hyphen names) | by code | The code writes an em dash in the first Excluded name; the hyphen name wins and the code changes |
| Tracker | `10_Areas/Career/Internships/Tracker/Each One/{Current,Applied,Result}/<dossier file name>.md` with `status: active`, `date_applied`, `tier`, `starred`, `resume_variant`, `letter_mode`, `related_notes` linking the dossier, `program` and `contact` blank unless those notes exist. No approval field. | by hand | Only `Current/` exists; the first move into `Applied/` or `Result/` creates it |
| Packet | `20_Progress/Internship/Sent/<dossier file name>/` with the resume DOCX, the letter DOCX when sent, and `posting.md`. Private. | by hand | Does not exist; registry row pending |
| Applying `stage` | `Preparing`, `awaiting-approval`, `approved`, `Applied`, `Offer`, `Rejected`, `Withdrawn`. Tier 1 and tier 2 reach `approved` before anything is archived. | by hand | `awaiting-approval` and `approved` are new |
| Duplicate key | Before `mark_applied` or the Archived mover moves a dossier out of the tracked tree, it writes the dossier's cross-source duplicate key into the loop repo's state | by hand | Planned. Today nothing records it. |
| Dry run | A dry run shows the move reaching the loop's checkout as a deletion from the role folder | by hand | Planned |
### Generated notes
All four are `type: generated`, `gen_kind: report`, with a `generator`, written under `20_Progress/Internship/Applying/` because they read private families. They are built locally, not in GitHub Actions, because an Actions checkout of the public repo cannot see private folders.

| Note | Content | Today | State |
|---|---|---|---|
| Apply Queue | Dossier link, company, tier, role folder, deadline, `resume_variant`, `letter_mode`, estimated minutes; ordered by tier, soonest deadline, newest posting, resume overlap | by hand | Planned. `screen_report.py` builds a different report on demand. |
| Follow-ups | Trackers whose `date_applied` plus 7 or plus 14 days has arrived with no follow-up line in the Timeline. Anant writes the follow-up and logs a dated Timeline line. | by hand | Planned |
| Deadline Map | Buckets Already Over, Soon, Next Week, Next Month, Later from live dossiers, Program `deadline_posted` and `deadline_real`, and Tracker `deadline`. Weekly. | by hand | Planned. The old `Tracker/Deadline Tracker.md` is a hand-off to the Codex session. |
| Loop Status | `last_run`, `last_success`, `paused`, `built_at`, from a read-only `gh run list` on the run workflow. No commit. The Dashboard banner warns when `built_at` is over a day old or `last_success` is over 3 hours old. | by hand | Planned. A daily token-expiry check is planned and the header is unverified. |
| `Now` rows | Company, title, tier, `date_applied`, next follow-up date, result, link to the Tracker | by hand | Reads Trackers in `Applied/` plus tier 1 and tier 2 Applying notes |
### Git and privacy follow-ups
Checked 2026-11-21 with `git check-ignore`: `20_Progress/Internship/Resumes/` and `10_Areas/Career/Internships/Contacts/` (except `Mimic.md`) are git-ignored. These are not: `Cover Letters/`, `Sent/`, `Applying/`, `Preperation/`, `Career Fair/`, `Programs/`, `Tracker/Each One/` and `List/Dossiers/Applied/`. `.stignore` lists none of the eight. Currently tracked: Cover Letters 5, Applying 4, Preperation 4, Career Fair 3, Programs 33, Tracker 38. These need ignore lines and `git rm --cached`, and the public history already holds them. Syncthing keeps syncing them.
- The PostToolUse guard keeps its own field lists until it reads the Specs; Loop Contract Change shrinks once it does.
- Issues the loop files: label `dossier-ready` and title `<N> new dossier(s) ready for /promote-dossier` are confirmed in `run.yml`. The other titles are in `run_pipeline.py` and `recheck.py`.
## Open Questions
- [x] Fast lane records. Answered 2026-11-21: yes, tier 3 skips the Applying note.
- [x] Dossier vocabulary. Answered 2026-11-21: accept the mapping.
- [x] Verdict tables. Answered 2026-11-21: approved, with Interview Prep and Deadline and Intake Triage held.
- [x] `company` for intermediaries. Answered 2026-11-21: the host employer.
- [x] Loop reviews. Answered 2026-11-21: keep both, thin.
- [x] Interview area 1, the daily apply loop. Answered 2026-11-21, decisions Q6 to Q10.
- [x] Interview area 2, documents. Answered 2026-11-21, decisions Q11 and Q12.
- [x] Interview area 3, programs, contacts and networking. Answered 2026-11-21, decision Q13.
- [x] Interview area 4, loop health and reviews. Answered 2026-11-21, decisions Q14 to Q16.
- [x] Interview area 5, interviews and the deadline check. Answered 2026-11-21, decisions Q17 and Q18.
- [x] Interview area 6, the public view. Answered 2026-11-21, decision Q19.
- [x] Checkpoint 2, answered 2026-11-21 (Part 2, item 1): tier 2 now gets Program, Contact, Applying and Tracker notes and Anant approves every document, tier 3 included. Weekend Build's 12 and 5 minute estimates assumed neither. Re-estimate Sunday.
- [x] Checkpoint 2, answered 2026-11-21 (Part 2, item 2): ignoring `Applied/` hides applied dossiers from the loop's duplicate check. Accept the gap, or let the loop read applied dossiers from a private list instead.
- [x] Checkpoint 2, answered 2026-11-21 (Part 1, item 4): the loop status note needs a commit per run, or the dashboard banner cannot detect a stale run. Pick one.
- [x] Checkpoint 2, answered 2026-11-21 (Part 1, items 1 and 2): packet folder name, how approval is recorded, the `Now` columns, and whether the Tracker copies `tier`, `starred`, `resume_variant` and `letter_mode`.
- [x] Phase 2 question, answered 2026-11-21: `_Career Fair/` dossiers stay exempt from the deadline rule; the Archived mover skips them, Anant archives them by hand, and the weekly review counts them.
- [x] Phase 2 question, answered 2026-11-21: the 29 Trackers in `Current/` stay; a Tracker outside `Applied/` is not an application; moving them belongs to the separate scripted fix.
No question is open.
## Corrections
- 2026-11-21: Phase 1 treated lint and the Workflows as the only consumers of the kit Standards. Wrong. The PostToolUse hook `jarvis-internship-note-guard.ps1` hardcodes the required keys for dossier, Program, Contact, Tracker and Applying notes, and the loop repo's `CLAUDE.md`, the promote-dossier skill reference and the agents `program-writer`, `tracking`, `promotion` and `applying` hold more copies of the same lists. Found by reading the hook and the repo in Phase 1b. Effect: Program, Contact, Tracker and Applying now have named writers, so KEEP rests on firmer ground, but a field change touches six places and the copies already disagree (the guard asks for `deadline_real`, filled on 0 of 31 Programs, and has no `stage`).
- 2026-11-21: Phase 1 said a first search found no tooling reference to any cut file. That search covered the vault's `.claude`, `.codex`, `.cursor` and `.agents`. The loop repo's own agents do cite the files: `tracking` cites Internship Tracking Workflow and Internship Tracker Standard, `applying` cites Application Document Preparation, and `CLAUDE.md` cites the Tracker and Applying Standards. These are follow-ups for the loop repo when Internship Tracking Workflow is merged and cut.
- 2026-11-21: the Checkpoint 2 Contracts put the deadline map at `Tracker/Deadline Tracker.md`, a public path, while it reads private Trackers and Programs, and gave the follow-up note no path. Found when Anant reviewed the privacy rule. Replaced by the Generated notes table, all under `20_Progress/Internship/Applying/` and built locally.
- 2026-11-21: the Checkpoint 2 family table said the queries read `Applied/` and `Result/` Tracker folders that do not exist, while the Contracts wrote the Tracker into `Tracker/Each One/Applied/` without saying it must be created. Listing `Tracker/Each One/` showed only `Current/` and 3 loose files. The Tracker contract now says the first move creates them.
- 2026-11-21: the Sequence said seven Templates and the target said eight. Eight is right: Interview Prep stays.
- 2026-11-21: Checkpoint 2 left `created` and `updated` off the dossier Spec as my own default. Reversed by decision C6.
- 2026-11-21: the ready-to-apply test names `screened_decision`, which no dossier carries and no writer sets, so every dossier passes it vacuously. The Contracts now say "by hand" and the Workflows name who screens.
## Evidence
- Lint 2026-11-21: `--specs` 77 Specs from 59 Standards; `--kit` 0 errors, 8 warnings; family runs for the 13 internship families; folder runs for Standards, Workflows, Dossiers, Tracker, Contacts, Programs, `20_Progress/Internship/`, the reviews folder and the Graphify folder.
- Code, read through WSL on 2026-11-21: `vault_writer/writer.py` lines 73 to 125 and 230 to 295, `vault_writer/validate.py`, `vault_writer/templates/dossier.md.j2`, `run_pipeline.py` `count_dossiers_by_bucket` at line 243.
- Phase 1b reads 2026-11-21: Codex ledger `Instruction Notes Rewrite Plan` (updated 02:56), System Component Standard and the System records, loop repo `.github/workflows` (all five), `docs/PIPELINE_CONTRACT.md`, `CLAUDE.md`, agent headers, `core/git_ops.py`, `core/run_log.py`, `screen_report.py`, `recheck.py`, `run_pipeline.py` constants and `run_once` head, `jarvis-internship-note-guard.ps1`, the root `.gitignore`, `git ls-files` counts for internship paths.
- Vault surveys 2026-11-21: dossier frontmatter keys and values (357 files with frontmatter), deadline dates per folder, Program, Contact and Tracker fill rates, Dossier Corrections items re-checked against the live files.
## Related Notes
- [[Weekend Build]] owns the binding decisions and [[Source of Truth]] owns the limits and gates.
- [[Dossier Corrections]] is the failure list behind the Missing table, and [[System - Build Log]] receives the Phase 2 entry.
