---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Note Kit Standard]]"
trigger: A note type is being written regularly and has no Standard, or an existing Standard fails its own checks.
notes:
  - "[[Note Type Registry]]"
  - "[[Standard Template]]"
  - "[[Workflow Template]]"
  - "[[Vault Lint]]"
---
# Building a Note Kit
Build a Standard, Template, and (only if the process repeats) Workflow from real notes, register them, and prove they measure.
## Use when
A lint run shows a family `unmapped`, a session meets a note type with no template, or a Standard's family sits under 50% fit for four reviews.
## Steps
1. Find or add the family's row in [[Note Type Registry]]. Set its tier, domain, and kit status to `planned`.
2. Read at least two real notes of the family and run `git log --follow` on a few. Record the headings and keys they actually use, and which older shapes exist.
3. Write the Standard from [[Standard Template]]: the Spec block first, then Headings, Legacy Shapes for every older shape found, Done Conditions, and a Gold Standard Example that exists.
4. Write the Template: the spec's keys and headings with one comment line each and no example prose ([[Note Kit Standard]]).
5. Write a Workflow from [[Workflow Template]] only if the note is created or updated by a repeated process. Otherwise record `none` in the registry.
6. Link them: `maps_to` and `used_by` on the Standard, `serves` on the Workflow, and the row in the registry. Add the Workflow to [[00_Workflows Index]].
7. Run [[Vault Lint]] on the new files and on three real notes of the family. The Standard must parse and the three notes must report sensibly, even if they fail.
8. Create one real note from the Template and lint it. It must pass.
9. Set the registry row to `built` and add a session-log line.
## Do not
Do not write a Standard for a family with no notes, repeat a rule from another Standard, or leave a file empty. Do not write a Standard longer than 700 words of prose.
## Done when
- The registry row is `built` and its links resolve.
- A note made from the Template passes lint.
- The Legacy Shapes table covers every older shape found in step 2.
