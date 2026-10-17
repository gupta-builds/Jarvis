---
type: system
status: sprout
created: 2026-08-28
updated: 2026-10-16
tags:
  - system
  - standards
  - internship
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Application Document Preparation]]"
gold_standard: none
notes:
  - "[[Human Writing Standard]]"
  - "[[Humanizer]]"
  - "[[Resume Alteration Standard]]"
  - "[[Cover Letter Alteration Standard]]"
---
# Humanized Writing Standard
==For resumes and cover letters the prose check is the Human Writing Standard plus three checks that only an application document needs.==
This is the internship-application instance of [[Human Writing Standard]], scoped narrowly so resume and cover-letter drafting is not blocked. It is the pass or fail gate behind [[Humanizer]], applied at the `humanize` step of [[Application Document Preparation]] to every resume content plan and cover-letter draft before it becomes a DOCX. It checks tone and phrasing only. Factual correctness is the earlier gate in [[Resume Alteration Standard]] and [[Cover Letter Alteration Standard]].
## Checks
Run all nine checks of [[Human Writing Standard]]; its suspicious-word list already holds the generic claims such as "passionate about" and "results-driven". Then add:
1. **One person.** The draft reads as one consistent person, not a template with company names swapped in.
2. **Boilerplate.** A reader would not recognize it at once as AI boilerplate. If they would, it fails even when every line looks fine alone.
3. **Evidence after tone.** Every claim still traces to the evidence it had before the tone pass. A rewrite that drifts a claim from its source is a regression, caught here even though evidence tracing is the earlier gate's job.
## Output
Pass, or fail with line-level flags: the exact phrase, the check it breaks, and a suggested fix. Never a silent rewrite.
## Out of scope
The global humanizer agent, skill, and command system, and networking-message drafting. Both are separate, larger work tracked in [[Humanizer]].
## Done Conditions
- A failing draft gets line-cited flags, never a bare "sounds off".
- A passing draft keeps 100% of its claims traceable to the same evidence as before the tone pass.
## Gold Standard Example
None. A policy has no instance. Applied in [[Application Document Preparation]].
