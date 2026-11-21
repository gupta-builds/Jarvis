---
type: system
status: sprout
created: 2026-07-16
updated: 2026-11-21
tags:
  - system
  - workflow
  - internship
system_kind: workflow
serves: "[[Internship Tracker Standard]]"
trigger: A posting is found, or an internship is being pursued or tracked.
notes:
  - "[[Application Document Preparation]]"
  - "[[Internship Review System]]"
  - "[[Internship Notes Standard]]"
  - "[[10_Areas/Career/Internships/Internships Hub]]"
---
# Internship Pipeline
Move a posting from found to an outcome recorded, in the lane its tier sets, without losing the research or the relationship.
## Use when
Finding, pursuing or tracking any internship. Research lives in `10_Areas/Career/Internships/`; live status in `20_Progress/Internship/`. Quotas and limits are in Source of Truth and the loop's config, not here.
## Steps
1. **Find.** The loop writes dossiers (by code), or Anant adds a manual find to `_Career Fair/` (by hand). Neither is a commitment.
2. **Screen.** By hand: read the posting for fit with the goal in [[Engineer Edge Roadmap]] and for PhD, clearance or citizenship requirements. Record `screened_*` on the dossier and set `starred` if wanted. Pay is never a factor.
3. **Choose the lane** by the dossier's `tier`. Tier 3 takes the fast lane: steps 7 to 9, no Program, Contact or Applying note. Tier 1 and tier 2 take the apply lane.
4. **Commit** (tier 1 and 2). Before apply day, one at a time with `/promote-dossier`, create the Program and Contact notes ([[Program Standard]], [[Contact Standard]]); no batch mode exists. A Program note is required before the dossier is ready to apply; a Contact note is not a gate.
5. **Reach out.** Anant drafts in the Contact note from `Mimic`, sends by hand, and logs every real exchange.
6. **Prepare** (tier 1 and 2). Create the Applying note, then run [[Application Document Preparation]].
7. **Apply.** Anant submits. By hand today: set `date_applied`; move the dossier to `Applied/`; create the Tracker in `Applied/` from its Template, copying `tier`, `starred`, `resume_variant` and `letter_mode`; add a row to `Now`; copy the resume, letter and `posting.md` into `Sent/<dossier file name>/`; note the follow-up dates. `mark_applied` will do this when built, and tier 3 confirms before it archives.
8. **Follow up and prepare.** Anant sends follow-ups from Mimic and logs each in the Tracker Timeline. When an interview is booked, write an [[Interview Prep Standard]] note and update the Tracker's Interview Steps.
9. **Close.** Set the outcome on the Applying note, move the Tracker to `Result/` with the same word, and leave the Program as reference.
## Do not
Do not create a Tracker before the application is submitted. Do not write a thinner Program for `Considering` than for `Serious`. Do not edit a Program note to record status. Do not treat a step as automated until its System record says it is built; today the loop only finds and writes dossiers.
## Done when
- Every submitted application has its dossier in `Applied/`, its Tracker in `Applied/`, its packet in `Sent/` and its follow-up dates.
- Every tier 1 and tier 2 application also has a Program, Contact and Applying note, cross-linked, and the Applying `stage` agrees with the Tracker folder.
- The reviews in [[Internship Review System]] were run when due.
