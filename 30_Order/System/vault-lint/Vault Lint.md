---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-29
tags:
  - system
  - tooling
system_kind: spec
trigger: On demand with node, in the weekly review, and after any change to a Standard.
owner: Anant, and any session that changes a Standard or a Spec block.
notes:
  - "[[Conformance Standard]]"
  - "[[Note Kit Standard]]"
  - "[[Conformance on Touch]]"
---
# Vault Lint
## Purpose
Measures how many notes fit their Standard and checks that the kit files (Standards, Templates, Workflows) agree with each other. Without it the goal of 90% fit has no number, and a Standard can drift from its Template unnoticed.
## Trigger
Run by hand: `node vault-lint.js` from this folder. The weekly review records the fit percentage. Run `--kit` after any change to a Standard, Template, or Workflow. No scheduled task exists yet.
## Inputs and Outputs
Reads every `.md` file under the vault root (found three folders up from the script), the Spec blocks in `30_Order/Standards/`, the vocabulary tables in [[Frontmatter Standard]], and `vault-lint.config.json`. It writes nothing into the vault. `--json FILE` writes a report wherever you point it, which should be an ignored or scratch folder.
Beyond front matter, headings, links, and placement, it enforces the shape of an action note from [[Action Standard]] and warns about two formatting rules from [[Jarvis Writing and Formatting]]. Failure codes read `<check>:<reason>`. Warnings list line numbers as `L12,L40`.
- Warnings `table-no-blank-above` and `dataview-no-blank-above`: a Markdown table, or a fenced `dataview` or `dataviewjs` block, starts on the line after text. A heading, a closing code fence, a callout title, or the end of an HTML comment above is allowed, and so is a blank line. Tables inside fenced code and frontmatter are ignored. The single blank line that fixes it is not counted as `extra-blank-lines`. They are warnings only: they never fail a note or change the fit percentage, so that number stays a pure structure measure. They print in a Warnings section after the report (first 20 notes, or `--list N`) and in the `--json` output under `warns`. There is no fix mode: the lint reports and a person or session edits.
- `7:todo-missing`, `7:todo-not-under-opening`, `7:todo-lines:N`, `7:todo-next-mismatch`, `7:checkbox-outside-todo:N`, `7:missing-subheading:<name>`: for `action` notes, a `> [!todo]` callout sits directly under the opening line, holds one to three `- [ ]` lines, the first equal to `next`, no checkbox appears outside it, and Open Threads has the subheadings the Spec names. The Spec keys are `todo_callout` and `open_threads_subheadings` in [[Action Standard]]; change the Standard, not the script.
```powershell
node vault-lint.js                                  # fit %, by tier, by family, top failure reasons
node vault-lint.js --path 30_Order/Standards/       # one folder
node vault-lint.js --family course-concept --list 20   # failing notes in a family
node vault-lint.js --specs                          # Spec blocks, names, empty files
node vault-lint.js --kit                            # Standard, Template, Workflow consistency
```
## State
None. `vault-lint.config.json` is tracked source: `out_of_scope`, `tier4`, and `template_paths` regular expressions. The type and status vocabulary is read from the tables in [[Frontmatter Standard]]; change the tables, not the script.
## Failure Behavior
It never edits a note. A Spec block that is not valid JSON is reported as an error, and notes of that family then fall to `unmapped`. `--kit` exits with status 1 when it finds an error, so it can gate a commit.
## Verify
Run `node vault-lint.js --specs` and compare the Spec count with the number of Spec blocks you wrote. Lint a note you know fits and one you know does not. The scanned count plus the excluded counts equals the number of `.md` files under the root.
## Retire
Delete this folder in one commit and remove the lint step from the weekly review. The fit number then goes back to being unmeasured.
