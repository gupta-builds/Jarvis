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
Prepare the resume and any required letter. Anant approves each before sending. Link them to the Applying note for tiers 1 and 2.
## Use when
A tier 1 or 2 dossier is ready to apply. A tier 3 application uses steps 4, 6 and 8. Until the variant builder and `Main Cover Letter.md` exist, Anant and a session build by hand from `Main Resume.md`; the `applying` agent refuses to draft against filler.
## Steps
1. **Prepare.** By hand: create the Applying note from [[Internship Applying Template]], `stage: Preparing`, before any document exists.
2. **Draft.** Read `Main Resume.md`, the Applying note and linked project notes. Use `resume_variant` for bullets. Tailor tier 1 letters. For tier 2, use the bank and one company hook when available. Until then, omit optional letters and tailor required ones individually. Ask Anant for unsourced facts.
3. **Plan.** Propose a traceable content plan: bullets, order, rephrasing, honest gaps. Write nothing yet.
4. **Approve.** For tiers 1 and 2, Anant approves the plan and `stage` goes from `awaiting-approval` to `approved`. For tier 3, Anant confirms the variant resume before sending. Changes return to the plan.
5. **Humanize.** The draft passes the humanizer gate; a fail returns to Draft with line-level flags.
6. **Write.** Write `Resumes/Altered/<Role> - <Company>.docx` and, when one is sent, `Cover Letters/Altered/<Role> - <Company>.docx`.
7. **Link.** For tiers 1 and 2, set `resume_version` and `cover_letter` and add one Documents line per file.
8. **Archive.** Once Anant adds the `Sent/` ignore rule, the first archive creates `Sent/` and `Sent/<dossier file name>/`. At submission copy the exact files and posting text there. Leave the packet unchanged.
## Do not
Do not write before approval, archive before `stage` is `approved` (tier 1 and 2), version files as `v1` and `v2`, or add a claim with no source.
## Done when
- The Applying note links files for tiers 1 and 2. Record their outcome on that note. For tier 3, record it in the Tracker’s `result` key.
- The packet in `Sent/` holds the files that were sent.
