---
type: system
status: sprout
created: 2026-08-28
updated: 2026-11-21
tags:
  - system
  - workflow
  - internship
system_kind: workflow
serves: "[[Application Documents Standard]]"
trigger: Real preparation of an application starts (Pipeline step 6), or a tier 3 application is about to be archived.
notes:
  - "[[Internship Pipeline]]"
  - "[[Applying Standard]]"
  - "[[Human Writing Standard]]"
---
# Application Document Preparation
Produce the resume, and the letter when the tier calls for one, with Anant's approval before anything is sent, and tie them to the Applying note.
## Use when
A tier 1 or tier 2 dossier is ready to apply. Promotion to a Program stays document-free. A tier 3 application uses steps 4 and 6 to 8 only. Until the resume variant builder and `Main Cover Letter.md` exist, Anant and a session do the build by hand from `Main Resume.md`; the `applying` agent refuses to draft against filler.
## Steps
1. **Prepare.** By hand: create the Applying note from [[Internship Applying Template]] before any document exists, `stage: Preparing`, with program, contacts and the job URL.
2. **Draft.** Read `Main Resume.md`, `Main Cover Letter.md`, the Applying note and the linked project notes. The dossier's `resume_variant` picks the bullets; `letter_mode` picks the letter: `tailored` for tier 1, `bank` plus one company hook for tier 2. If a fact is unsourced, ask Anant.
3. **Plan.** Propose a traceable content plan: which bullets and paragraphs, in what order, what is rephrased, and which posting terms are honest gaps. Write nothing yet.
4. **Approve.** Anant approves the plan in one sitting. Set `stage: awaiting-approval`, then `approved`. For tier 3, Anant confirms the variant resume when the packet is archived. Changes return to the plan, never a partial write.
5. **Humanize.** The approved draft passes the humanizer gate. A fail returns to Draft with line-level flags.
6. **Write.** Write or overwrite `Resumes/<Role> - <Company>.docx` and, when one is sent, `Cover Letters/<Role> - <Company>.docx`.
7. **Link.** Point `resume_version` and `cover_letter` at the files and add one Documents line on what each leads with.
8. **Archive.** At submission, copy the exact resume, letter and the posting text into `Sent/<dossier file name>/` (Pipeline step 7). Never edit a packet after.
## Do not
Do not write before approval, archive before `stage` is `approved` (tier 1 and 2), version files as `v1` and `v2`, or add a claim with no source.
## Done when
- The Applying note links the files, and every line traces to an approved source or a logged gap.
- The packet in `Sent/` holds the files that were sent, and no file exists for an application whose plan was not approved.
