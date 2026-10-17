---
type: system
status: sprout
created: 2026-05-31
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Evergreen Standard]]"
trigger: A concept recurs across summaries, or one summary holds an idea worth owning.
notes:
  - "[[Source Summary Standard]]"
  - "[[Promotion]]"
---
# Summary to Distilled
Turn summaries into knowledge you understand: your mechanism in your words, not a record of what a source said.
## Use when
The same idea shows up in two or more summaries, or one summary contains something you will reuse. A comparison of two domains is a synthesis note.
## Steps
1. Search `60_Claude/20_Distilled_Notes/` for the concept. If a note exists, extend it instead of creating a sibling.
2. Choose the kind. A single idea uses [[Deep Dive Template]] (`evergreen_kind: distilled`). A comparison of two domains uses [[Synthesis Note Template]] and goes in `Synthesis/`.
3. Read [[Evergreen Standard]], then write the claim in one sentence and the mechanism in your own words with one example from your own work.
4. Record the failure mode, or what the idea is confused with.
5. Link the summaries it came from under Evidence and its neighbors under Related. Set `status: seed`.
6. State what is still unclear. A distilled note may be honest about its gaps.
7. Run [[Vault Lint]] on the path and add one line to the session log.
## Do not
Do not file an implementation plan or an audit here, and do not copy a source's wording in place of the mechanism. Drill dates and `enrichment_*` keys are not set by this workflow.
## Done when
- The note teaches the idea without the reader opening the sources.
- It links its summaries and neighbors and names its gaps.
- After the idea is reused, raise `status` to `tree` and consider [[Promotion]].
