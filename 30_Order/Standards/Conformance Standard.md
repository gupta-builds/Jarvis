---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Conformance on Touch]]"
gold_standard: none
notes:
  - "[[Note Kit Standard]]"
  - "[[Frontmatter Standard]]"
  - "[[Note Type Registry]]"
  - "[[Vault Lint]]"
---
# Conformance Standard
==A note fits when a script can prove it: the right keys with the right values, the right headings, working links, the right folder, and a clean file.==
This standard defines "fit" so the goal of 90% of notes meeting their Standard is a number, not a feeling. Every note in the vault has a tier. The tier decides how much of it is checked. Prose quality is not part of fit; that stays with [[HUMAN_WRITING]] and is sampled in review.
## Tiers
| Tier | What it covers | Checks that apply |
|---|---|---|
| 1 | Authored knowledge and work: concept, class, project, plan, evergreen, tracker, reference, index, action, output, review | All six |
| 2 | Records: logs, conversation exports, session notes, daily and weekly notes | Checks 1, 3, 4, 5, 6 (headings are not enforced) |
| 3 | `type: generated` notes written by a tool | Checks 1, 4, 6 with the generated key set |
| 4 | Tool-native files: skills, agents, commands, vendor mirrors | None. Listed by path in [[Note Type Registry]] |
Out of scope entirely: `50_Archive/`, `.git/`, `.obsidian/`, and attachments.
## The six checks
1. **Frontmatter.** Required keys present, `type`, `status`, and each `*_kind` in the vocabulary of [[Frontmatter Standard]], YAML types correct, no duplicate keys, no byte-order mark, no unresolved placeholder in a value.
2. **Headings.** The spec's `##` headings appear in order, and none is empty or holds only a template comment.
3. **Links.** Every wikilink in frontmatter resolves. A body link resolves or is labeled `(to create)`.
4. **Placement.** The path matches the Standard's `match.path`.
5. **Hygiene.** No `---` in the body, the blank-line rule of [[Jarvis Writing and Formatting]] holds, no trailing blank lines, and no leftover `<% %>`, `{{ }}`, `YYYY-MM-DD`, or `== ==`.
6. **Mapped.** The note matches exactly one family spec. A note that matches none is `unmapped`, which means the family has no Standard yet. A note that matches several is `ambiguous`, which means two specs overlap.
A check passes or fails. There is no partial credit toward the target. A note that fails exactly one check is `near-fit` and is listed first for fixing.
## Scoring
`fit % = notes that pass every check for their tier / notes in scope`. [[Vault Lint]] reports it overall, per tier, and per family. The target is 90% overall, with every family above 50%. A family stuck under 50% after four weekly reviews gets a scripted fix or a redesign of its Standard, because a Standard nobody can meet is the Standard's fault.
## How notes reach 90%
Notes improve by being touched. [[Conformance on Touch]] makes any session that opens a note bring it to its Standard in the same edit. Mechanical fixes may be scripted, always as a dry run first and a reviewed diff after: stripping a byte-order mark, resolving a date placeholder, mapping a legacy value from [[Frontmatter Standard]]. Judgment fixes, such as restructuring headings or rewriting a section, happen only on touch. Never rewrite notes in bulk.
## Exemptions
A `status: tree` note is not exempt. The rule in CLAUDE.md still holds: propose structural changes before making them. A note cannot opt out of fit. Only the registry can change a family's tier or put a path out of scope, and it states the reason.
## Done Conditions
- Every family in [[Note Type Registry]] has a tier, and every Tier 1 and Tier 2 family has a Standard with a valid Spec block.
- [[Vault Lint]] runs without errors and prints fit % overall, per tier, and per family.
- The weekly review records the number and names the three families most behind.
## Gold Standard Example
None. A policy has no instance. The first measured run is recorded in the session log when [[Vault Lint]] ships.
