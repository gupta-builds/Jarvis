---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-04
tags:
  - system
  - tooling
system_kind: spec
trigger: On demand with node, from the note-to-actions and transcript-to-brief skills, after any change to a Standard, and every Sunday from Step 7.7 of the weekly-review skill (through order-health.js).
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
Run by hand: `node vault-lint.js` from this folder. Run `--kit` after any change to a Standard, Template, or Workflow. The `note-to-actions` and `transcript-to-brief` skills call it on the one folder they just wrote to. No scheduled task of its own exists. Until 2026-11-04 nothing recorded the fit percentage on a schedule: neither the `weekly-review` skill nor `run-weekly-review.ps1` called it (checked by searching the skill, `run-weekly-review.ps1`, its registration script and its launcher for `vault-lint`, `vault lint`, `fit %` and `conformance`). Now Step 7.7 of `.claude/skills/weekly-review/weekly-review.md` (and its `.agents` copy) runs `order-health.js`, pastes the block under `Vault Health` in the Weekly Synthesis note and adds one sentence on the fit change. That wiring is text in the skill, so it first takes effect on the next run (the `Jarvis-WeeklyReview` task, Sunday 2026-11-08 at 06:00) and I have not seen it produce a note yet.
## Inputs and Outputs
Reads every `.md` file under the vault root (found three folders up from the script), the Spec blocks in `30_Order/Standards/`, the vocabulary tables in [[Frontmatter Standard]], and `vault-lint.config.json`. By default it writes nothing into the vault; only `--fix` writes (see below). `--json FILE` writes a report wherever you point it, which should be an ignored or scratch folder.
Beyond front matter, headings, links, and placement, it enforces the shape of an action note from [[Action Standard]] and warns about two formatting rules from [[Jarvis Writing and Formatting]]. Failure codes read `<check>:<reason>`. Warnings list line numbers as `L12,L40`.
- Warnings `table-no-blank-above` and `dataview-no-blank-above`: a Markdown table, or a fenced `dataview` or `dataviewjs` block, starts on the line after text. A heading, a closing code fence, a callout title, or the end of an HTML comment above is allowed, and so is a blank line. Tables inside fenced code and frontmatter are ignored. The single blank line that fixes it is not counted as `extra-blank-lines`. They are warnings only: they never fail a note or change the fit percentage, so that number stays a pure structure measure. They print in a Warnings section after the report (first 20 notes, or `--list N`) and in the `--json` output under `warns`. `--fix` repairs them, and nothing else (see below).
- `7:todo-missing`, `7:todo-not-under-opening`, `7:todo-lines:N`, `7:todo-next-mismatch`, `7:checkbox-outside-todo:N`, `7:missing-subheading:<name>`: for `action` notes, a `> [!todo]` callout sits directly under the opening line, holds one to three `- [ ]` lines, the first equal to `next`, no checkbox appears outside it, and Open Threads has the subheadings the Spec names. The Spec keys are `todo_callout` and `open_threads_subheadings` in [[Action Standard]]; change the Standard, not the script.
`order-health.js` is the weekly report. `node order-health.js` runs `vault-lint.js` and `vault-lint.js --kit` with `--json` into the OS temp folder (deleted afterward), reads `30_Order/Note Type Registry.md`, and prints one Markdown block to stdout: the fit line, the kit error and warning counts, a table of families below 100% with their top three failure reasons (`--top N` changes the three), the families that have a Spec and no notes, the Standards, Templates and Workflows with no link in the Registry (files starting `00_` are skipped), and a short list of proposals. It never passes `--fix` and writes no file; whoever calls it decides where the text goes. For the weekly review that place is the `Vault Health` section of the Weekly Synthesis note, under a line `Order health`.
```powershell
node vault-lint.js                                  # fit %, by tier, by family, top failure reasons
node vault-lint.js --path 30_Order/Standards/       # one folder
node vault-lint.js --family course-concept --list 20   # failing notes in a family
node vault-lint.js --specs                          # Spec blocks, names, empty files
node vault-lint.js --kit                            # Standard, Template, Workflow consistency
node vault-lint.js --path 30_Order/ --dry-run       # list the blank lines --fix would insert, write nothing
node vault-lint.js --path 30_Order/ --fix           # insert them
node vault-lint.js --fix --skip 60_Claude/05_Clippings/   # whole vault, but leave raw captures alone
node order-health.js                                # read-only weekly report, Markdown on stdout
```
## State
None. `vault-lint.config.json` is tracked source: `out_of_scope`, `tier4`, and `template_paths` regular expressions. The type and status vocabulary is read from the tables in [[Frontmatter Standard]]; change the tables, not the script.
## Failure Behavior
It edits a note only under `--fix`: it inserts one blank line above each table or fenced `dataview`/`dataviewjs` block flagged by the two warnings, and changes nothing else. It never touches frontmatter or tables inside fenced code, keeps a file's line endings, and checks that removing blank lines from the old and new text gives identical text before it writes (a note that fails the check is skipped and reported). `--dry-run` prints the same changes and writes nothing, and wins if both flags are given. `--skip PREFIX,PREFIX` leaves path prefixes alone, for example the read-only clippings. Run `--dry-run` first. A Spec block that is not valid JSON is reported as an error, and notes of that family then fall to `unmapped`. `--kit` exits with status 1 when it finds an error, so it can gate a commit. A `maps_to` entry in a Standard resolves to a file when the link equals the file's vault-relative path without `.md`, or the file's path ends in `/` plus the link (so `[[Name]]` and `[[30_Order/Templates/AI Toolkit/Name]]` both work, and a link no longer matches a file whose name merely ends with the same letters). That fix is at `vault-lint.js` line 439 to 440, and on 2026-11-04 all 62 `maps_to` entries in the Standards (60 bare names, 2 with a folder path) resolved. The duplicate-file-name check used to skip `30_Order/System/`, so the six same-named `README.md` files there were never reported; since 2026-11-04 (line 406) it covers all of `30_Order/`, System included, and the six files are renamed. The empty-file check still skips System, because `Sync Alert Banner.md` is empty by design when sync is healthy.
## Verify
Run `node vault-lint.js --specs` and compare the Spec count with the number of Spec blocks you wrote. Lint a note you know fits and one you know does not. On a whole-vault run the scanned count plus the excluded counts equals the number of `.md` files under the root; with `--path` the excluded counts still cover the whole vault, so the sum is larger. On 2026-11-04: `--path 30_Order/System/` fit 8 of 8, `--kit` found 0 errors and 12 warnings, and a whole-vault run fit 240 of 5,626 notes (4.3%). Run `node order-health.js` and check that the fit line equals the whole-vault run. To test the duplicate-name check, copy two same-named files into two folders under `30_Order/System/` of a scratch root and run `node vault-lint.js --kit --root <scratch>`: it reports `duplicate file name` (done 2026-11-04 with two `README.md` files).
## Retire
Delete this folder in one commit, and remove the lint calls from the `note-to-actions` and `transcript-to-brief` skills, Step 7.7 of the `weekly-review` skill and the "Run Vault Lint" steps in the Standards and Workflows under `30_Order/`. The fit number then goes back to being unmeasured.
