---
type: system
status: sprout
created: 2026-09-15
updated: 2026-10-16
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
gold_standard: none
notes:
  - "[[HUMAN_WRITING]]"
  - "[[Decoration Standard]]"
  - "[[Humanized Writing Standard]]"
---
# Human Writing Standard
==Voice lives in HUMAN_WRITING. This Standard is the prose check a reviewer or an agent runs on a draft, and it ends in lines that can be pointed at.==
This is the checkable counterpart to [[HUMAN_WRITING]]. It does not restate how prose should sound; read that file for the why. It lists the tests that decide whether a draft or rewrite passes, who runs them, and what a rewrite must keep. The internship-document version is [[Humanized Writing Standard]].
## The check
1. **Delete test.** A sentence that could be pasted into a generic productivity blog or AI newsletter is deleted. A sentence survives only if it carries a mechanism, an example, a contrast, or a decision.
2. **Section job.** Each section does at least one of: define, say why it matters, show how it works, contrast with a neighbor, give a real example, record a failure mode, show where it was used, state what is unclear. A section that does none is filler.
3. **Suspicious words.** transformative, robust, seamless, leverage, delve, landscape, journey, unlock, powerful, comprehensive, game-changer, cutting-edge, furthermore, passionate about, excited to, dynamic team player, results-driven, hardworking. A word stays only if it is the most accurate word, not the most polished one.
4. **No em dash** in prose an agent writes. Use two sentences, a comma, a colon, or a parenthesis.
5. **Structural tells.** Three or more adjacent sentences or bullets with the same opener, uniform sentence length, or a three-part parallel list in every paragraph. One is style; a repeating pattern is a tell.
6. **Tone against fact.** A claim that sounds louder than the fact behind it is flagged even when the fact is true.
7. **Honest uncertainty.** Inferred material is marked inferred, incomplete material says what is missing, a weak source is called weak. Never "complete framework" over partial understanding.
8. **Evidence survives the pass.** After a tone rewrite every claim still traces to the same source. A rewrite that drifts a claim away from its source is a regression.
9. **Thin thinking.** If a note is thin because the thinking is thin, say so instead of hiding it with better wording.
## Rewrite rules
A rewrite keeps frontmatter, wikilinks, code blocks, supported facts, and any structure that is already good. It never invents a fact to sound better and never overwrites a raw clipping in `60_Claude/05_Clippings/`. It leaves the note shorter or denser unless meaning would be lost.
## Reporting
A review reports each flag as the exact phrase, the check number it breaks, and a suggested fix. It never gives a bare "sounds off" and never rewrites silently. A rewrite reports which kinds of slop it removed, whether it added a higher-signal section, and where the underlying thought is still weak.
## Done Conditions
- Every flag cites a phrase, a check number, and a fix.
- The rewrite changed no frontmatter key, no wikilink target, and no code block.
- Every claim in the rewrite traces to the same source as before.
- The report names any section that is still thin.
## Gold Standard Example
None. A policy has no instance. Applied in [[Human Content Writer]] and, for application documents, [[Humanized Writing Standard]].
