---
type: system
status: sprout
created: 2026-08-28
updated: 2026-10-16
tags:
  - system
  - workflow
  - internship
system_kind: workflow
serves: "[[Applying Standard]]"
trigger: Real preparation of an application starts (Pipeline step 5).
notes:
  - "[[Internship Pipeline]]"
  - "[[Resume Alteration Standard]]"
  - "[[Cover Letter Alteration Standard]]"
  - "[[Humanized Writing Standard]]"
---
# Application Document Preparation
Produce one resume and one cover letter for an application with a single approval, and tie them to the Applying note.
## Use when
A Program is ready to be applied to. Promotion to a Program stays document-free; this starts at Tailor. Only Prepare can run today: no drafting skill exists and neither Main file is complete.
## Steps
1. **Prepare.** Create the Applying note from [[Applying Template]] before any document exists: `stage: Preparing`, `date_applied` blank, with program, tracker, contact, and the job URL.
2. **Draft.** Read `Main Resume.md`, `Main Cover Letter.md`, the Applying note, and linked project notes. If a JD needs a fact that is not sourced, ask the human.
3. **Plan.** Propose a traceable content plan for each document: which bullets and paragraphs, in what order, what is rephrased, and which JD terms are honest gaps. Write nothing yet.
4. **Approve.** The human approves both plans in one sitting. Changes return to the plan step, never a partial write.
5. **Humanize.** Each approved plan passes the Humanizer gate. A fail returns to draft with specific flags.
6. **Write.** Write or overwrite one `Resumes/<Role> - <Company>.docx` and one `Cover Letters/<Role> - <Company>.docx`. Overwrite in place until `date_applied` is set.
7. **Link.** Point `resume_version` and `cover_letter` at the files and add one line to Documents on what each leads with.
## Do not
Do not write before approval, version files as `v1` and `v2`, or add a claim that has no source.
## Done when
- The Applying note links both files, and both trace to approved sources.
- No file exists for an application whose plan was not approved.
