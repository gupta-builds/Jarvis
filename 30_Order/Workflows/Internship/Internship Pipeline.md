---
type: system
status: sprout
created: 2026-07-16
updated: 2026-10-16
tags:
  - system
  - workflow
  - internship
system_kind: workflow
serves: "[[Internship Tracker Standard]]"
trigger: A posting is found, or an internship is being pursued or tracked.
notes:
  - "[[Internship - Design Rationale]]"
  - "[[Application Document Preparation]]"
  - "[[Internship Review System]]"
  - "[[10_Areas/Career/Internships/Internships Hub]]"
---
# Internship Pipeline
Move a posting from found to an offer or rejection recorded, without losing the research or the relationship. Why each step is shaped this way: [[Internship - Design Rationale]].
## Use when
Finding, pursuing, or tracking any internship. Research lives in `10_Areas/Career/Internships/`; live status lives in `20_Progress/Internship/`.
## Steps
1. **Find.** The research loop writes dossiers to `List/Dossiers/`, or you add a manual find ([[Internship Notes Standard]]). Neither is a commitment.
2. **Screen.** Does it push toward the goal in [[Engineer Edge Roadmap]], and fit what you have built or want to build? Contact reachability is noted, never a gate, and pay is never a factor. Record `screened_*` on the dossier.
3. **Commit.** Create a Program, a Contact, and a Tracker note in one sitting under one shared file name ([[Program Standard]], [[Contact Standard]], [[Internship Tracker Standard]]).
4. **Reach out.** Draft in the Contact note from `Mimic`, send by hand, and log every real exchange.
5. **Tailor.** Create the Applying note now, before any document exists ([[Applying Standard]]), then run [[Application Document Preparation]].
6. **Deep dive.** Only when ready to apply, write `Programs/Job & Company/<Company> - <Position>`. No Standard exists until a first note does.
7. **Apply.** Submit. Set `stage: Applied` and `date_applied`, move the Tracker to `Applied/` and the Program to `Ended/`, and add a row to `Applying/Now.md`.
8. **Prep.** When a screen or onsite is scheduled, write an [[Interview Prep Standard]] note and link it from the Applying note.
9. **Close.** Set the outcome on the Applying note, move the Tracker to `Result/` with the same word, and leave the Program as reference.
## Do not
Do not write a thinner note for `Considering` than for `Serious`. Do not edit a Program note to record status. Do not treat the manual steps as proven: no real Applying note exists yet.
## Done when
- Every program you pursue has a Program, Contact, and Tracker, cross-linked, plus an Applying note once preparation starts.
- No active Applying note goes a week without a Log entry.
- The reviews in [[Internship Review System]] have run on cadence.
