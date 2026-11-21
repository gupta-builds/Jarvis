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
Move a posting from found to an outcome recorded, in the lane its tier sets.
## Use when
Finding, pursuing or tracking any internship. Limits live in Source of Truth.
## Steps
1. **Find.** The loop writes dossiers (by code), or Anant adds a manual find to `_Career Fair/` (by hand). The Archived mover skips `_Career Fair/`; Anant archives a fair dossier by hand once its fair has passed, and the weekly review counts them.
2. **Screen.** By hand: read the posting for fit with [[Engineer Edge Roadmap]] and for PhD, clearance or citizenship requirements. Record `screened_*`; set `starred` if wanted.
3. **Choose the lane** by `tier`. Tier 3 takes the fast lane: steps 7 to 9, with no Program, Contact or Applying note. Tier 1 and 2 take the apply lane.
4. **Commit** (tier 1 and 2). Before apply day, create the Program and Contact notes one at a time with `/promote-dossier`; no batch mode exists. Only the Program gates applying.
5. **Reach out.** Anant drafts from `Mimic`, sends by hand, and logs each exchange.
6. **Prepare** (tier 1 and 2). Create the Applying note and run [[Application Document Preparation]].
7. **Apply.** Anant submits. By hand today: set `date_applied`; move the dossier to `Applied/`; create the Tracker in `Applied/` from its Template, copying `tier`, `starred`, `resume_variant`, `letter_mode`; add a `Now` row; copy the resume, letter and `posting.md` into `Sent/<dossier file name>/`; note the follow-up dates.
8. **Follow up.** Send follow-ups from Mimic and log each in the Tracker Timeline. When an interview is booked, write an [[Interview Prep Standard]] note.
9. **Close.** Set the outcome on the Applying note and move the Tracker to `Result/` with the same word.
## Do not
Do not create a Tracker before submission or edit a Program to record status. Treat no step as automated until its System record says it is built.
## Done when
- Every submitted application has its dossier and Tracker in `Applied/`, its packet in `Sent/`, and its follow-up dates.
- Every tier 1 and 2 application also has a Program, Contact and Applying note.
