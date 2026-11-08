---
type: system
status: sprout
created: 2026-09-15
updated: 2026-11-07
tags:
  - system
  - standards
  - writing
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Human Content Writer]]"
  - "[[Researcher]]"
  - "[[Application Document Preparation]]"
gold_standard: none
notes:
  - "[[HUMAN_WRITING]]"
  - "[[Decoration Standard]]"
  - "[[Humanizer]]"
  - "[[Resume Alteration Standard]]"
  - "[[Cover Letter Alteration Standard]]"
---
# Human Writing Standard
==Voice lives in HUMAN_WRITING. This Standard is the prose check a reviewer or an agent runs on a draft, and it ends in lines that can be pointed at.==
This is the checkable counterpart to [[HUMAN_WRITING]]. It does not restate how prose should sound; read that file for the why. It lists the tests that decide whether a draft or rewrite passes, who runs them, and what a rewrite must keep. It also holds the three extra checks that a resume or cover letter needs, which used to be a separate Standard.
## The check
| # | Check | Passes when | Enforced by |
|---|---|---|---|
| 1 | Delete test | No sentence could be pasted into a generic productivity blog or AI newsletter. A sentence survives only if it carries a mechanism, an example, a contrast, or a decision | Reader |
| 2 | Section job | Each section does at least one of: define, say why it matters, show how it works, contrast with a neighbor, give a real example, record a failure mode, show where it was used, state what is unclear | Reader |
| 3 | Suspicious words | transformative, robust, seamless, leverage, delve, landscape, journey, unlock, powerful, comprehensive, game-changer, cutting-edge, furthermore, passionate about, excited to, dynamic team player, results-driven, hardworking appear only where they are the most accurate word, not the most polished | Reader |
| 4 | No em dash | No em dash in prose an agent writes: use two sentences, a comma, a colon, or a parenthesis | Reader |
| 5 | Structural tells | No three or more adjacent sentences or bullets with the same opener, uniform sentence length, or a three-part parallel list in every paragraph. One is style; a repeating pattern is a tell | Reader |
| 6 | Tone against fact | No claim sounds louder than the fact behind it, even when the fact is true | Reader |
| 7 | Honest uncertainty | Inferred material is marked inferred, incomplete material says what is missing, a weak source is called weak. Never "complete framework" over partial understanding | Reader |
| 8 | Evidence survives the pass | After a tone rewrite every claim still traces to the same source. A claim that drifts from its source is a regression | Reader |
| 9 | Thin thinking | If a note is thin because the thinking is thin, it says so instead of hiding it with better wording | Reader |
## Application documents
A resume content plan or cover letter draft runs all nine checks, then three more before it becomes a DOCX. This is the pass or fail gate behind [[Humanizer]]. It checks tone and phrasing only; factual correctness is the earlier gate in [[Resume Alteration Standard]] and [[Cover Letter Alteration Standard]].

| # | Check | Passes when | Enforced by |
|---|---|---|---|
| 10 | One person | The draft reads as one consistent person, not a template with company names swapped in | Reader |
| 11 | Boilerplate | A reader would not recognize it at once as AI boilerplate. If they would, it fails even when every line looks fine alone | Reader |
| 12 | Evidence after tone | Every claim still traces to the evidence it had before the tone pass (check 8, applied again here because the earlier gate owns evidence) | Reader |
The global humanizer agent, skill, and command system, and networking-message drafting, are out of scope. Both are separate, larger work tracked in [[Humanizer]].
## Rewrite rules
| Rule | Why | Enforced by |
|---|---|---|
| A rewrite keeps frontmatter, wikilinks, code blocks, supported facts, and any structure that is already good | Those are the owner's and the vault's, not the draft's | Reader |
| A rewrite never invents a fact to sound better and never overwrites a raw clipping in `60_Claude/05_Clippings/` | A raw source is read-only | Reader |
| A rewrite leaves the note shorter or denser unless meaning would be lost | Filler is the thing being removed | Reader |
| A review reports each flag as the exact phrase, the check number it breaks, and a suggested fix. It never gives a bare "sounds off" and never rewrites silently | A flag the owner cannot point at cannot be fixed or disputed | Reader |
| A rewrite reports which kinds of slop it removed, whether it added a higher-signal section, and where the underlying thought is still weak | The owner needs to know what is still thin | Reader |
## Done Conditions
- Every flag cites a phrase, a check number, and a fix.
- The rewrite changed no frontmatter key, no wikilink target, and no code block.
- Every claim in the rewrite traces to the same source as before.
- The report names any section that is still thin.
- For an application document, checks 10 to 12 were run and a failing draft got line-cited flags.
## Gold Standard Example
None. A policy has no instance. No reviewed draft or flag report exists yet; applied in [[Human Content Writer]] and, for application documents, [[Application Document Preparation]].
