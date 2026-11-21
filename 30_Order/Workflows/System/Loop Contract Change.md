---
type: system
status: sprout
created: 2026-11-21
updated: 2026-11-21
tags:
  - system
  - workflow
  - internship
system_kind: workflow
serves: "[[System Component Standard]]"
trigger: A change to what the internship research loop writes into the vault (a key, a folder, a note shape), or to a System record for the loop.
notes:
  - "[[Internship Notes Standard]]"
  - "[[Internship Tracker Standard]]"
---
# Loop Contract Change
Keep the one list of keys and folders the loop writes in agreement across every place that copies it. It exists because the same field list lived in six places and they already disagreed.
## Use when
Any change to a Spec in `30_Order/Standards/Internship/`, to what `vault_writer` or an agent in the loop repo writes, or to a System record under `30_Order/System/internship-loop/`. Every later code prompt for the loop ends with "update the record through Loop Contract Change".
## Steps
1. Change the Spec first, in the family's Standard, then its Template.
2. Change the hand-kept copies: the field lists in `jarvis-internship-note-guard.ps1`, then the contract in the loop repo's `CLAUDE.md`, the promote-dossier skill reference, and the agents that write the notes.
3. Change the code and its tests in the loop repo.
4. Update the System record's Contracts State and Today columns, and write the date.
5. Run `node vault-lint.js --kit` and `--specs`, and run the guard against a sample payload; read its output.
## Do not
Do not change code before the Spec. Do not strip a key an agent still writes; lint has no extra-key rule. Do not mark a contract "by code" until you saw the code write it.
## Done when
- The Spec, Template, guard list, loop contract and record all name the same keys.
- `--kit` has no new error and the guard output lists exactly the Spec's required keys.
This Workflow shrinks to steps 1, 3 and 4 once the guard hook reads the Specs directly.
