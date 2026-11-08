---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
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
This Standard defines "fit" so the goal of 90% of notes meeting their Standard is a number, not a feeling. It is not a measure of prose quality, which stays with [[HUMAN_WRITING]] and is sampled in review. Every note has a tier, and the tier decides how much of it is checked.
## Tiers
| Tier | What it covers | Checks that apply |
|---|---|---|
| 1 | Authored knowledge and work: concept, class, project, plan, evergreen, tracker, reference, index, action, output, review | All six |
| 2 | Records: logs, conversation exports, session notes, daily and weekly notes | Checks 1, 3, 4, 5, 6 (headings are not enforced) |
| 3 | `type: generated` notes written by a tool | Checks 1, 4, 6 with the generated key set |
| 4 | Tool-native files: skills, agents, commands, vendor mirrors | None. Listed by path in [[Note Type Registry]] |
Out of scope entirely: `50_Archive/`, `.git/`, `.obsidian/`, and attachments.
## The six checks
| # | Check | Passes when | Example failure code |
|---|---|---|---|
| 1 | Frontmatter | Required keys are present; `type`, `status`, and each `*_kind` are in the vocabulary of [[Frontmatter Standard]]; YAML types are right; no duplicate key, byte-order mark, or placeholder in a value | `missing-key:updated`, `status-off-vocab:active` |
| 2 | Headings | The Spec's `##` headings appear in order and none is empty | `missing-heading:Purpose` |
| 3 | Links | Every frontmatter link resolves; a body link resolves or is labeled `(to create)` | `dead-body-links:2` |
| 4 | Placement | The path matches the Standard's `match.path` | `wrong-folder` |
| 5 | Hygiene | No `---` in the body, the blank-line rule of [[Jarvis Writing and Formatting]] holds, no trailing blank lines, no leftover `<% %>`, `{{ }}`, `YYYY-MM-DD`, or `== ==` | `extra-blank-lines:13` |
| 6 | Mapped | The note matches exactly one family Spec. None is `unmapped`: the family has no Standard yet. Several is `ambiguous`: two Specs overlap | `unmapped`, `legacy-shape` |
A check passes or fails. A note that fails exactly one check is `near-fit` and is listed first for fixing.
## Scoring
`fit % = notes that pass every check for their tier / notes in scope`. [[Vault Lint]] reports it overall, per tier, and per family. Measured 2026-11-07 with `node vault-lint.js`: 255 of 5,648 notes, 4.5%, against a target of 90% overall with every family above 50%.
## Rules
| Rule | Why | Enforced by |
|---|---|---|
| A check passes or fails, with no partial credit | A half-pass hides which check is the problem | Lint |
| Notes improve by being touched ([[Conformance on Touch]]); no bulk rewrite | A bulk rewrite of thousands of notes cannot be reviewed | Reader |
| A scripted fix is a dry run first, then a reviewed diff. It covers only mechanical changes: a byte-order mark, a date placeholder, a legacy value from [[Frontmatter Standard]] | A script that restructures headings damages the owner's writing | Reader |
| A `status: tree` note is not exempt; propose the change before making it | Stable notes are the ones other notes lean on | Reader |
| Only the Registry changes a family's tier or puts a path out of scope, and it states the reason | A note cannot opt out of fit | Reader |
| A family under 50% after four weekly reviews gets a scripted fix or a redesigned Standard | A Standard nobody can meet is the Standard's fault | Reader |
| Prose quality is not part of fit | A script cannot prove it | Reader |
## Done Conditions
- Every family in [[Note Type Registry]] has a tier, and every Tier 1 and Tier 2 family has a Standard with a valid Spec block.
- [[Vault Lint]] runs without errors and prints fit % overall, per tier, and per family.
- The weekly review records the number and names the three families most behind.
## Gold Standard Example
None. A policy has no instance. No Weekly Synthesis records the fit number yet (searched `Weekly Synthesis/` for "Order health", "FIT:" and "fit %" on 2026-11-07); the first one that pastes the `order-health.js` block and names the three families most behind qualifies.
