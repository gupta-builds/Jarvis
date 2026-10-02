---
type: class
input_kind: project
status: seed
created: 2026-10-02
updated: 2026-10-02
area:
  - "[[CSCI 4061 Board]]"
  - "[[20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment|Project - 1 Assignment]]"
deadline: 2026-10-02
related: []
tags:
  - "#class"
next: "Copy the prompt below into a new Sonnet 5 (high effort) session, then let that session overwrite this entire file with the real implementation record once work begins"
---
# Project - 1 Code
This note is currently just a holder for a disposable launch prompt — copy the block below into a fresh session. Per the prompt's own instructions, that session will delete everything in this file (this paragraph included) and replace it with the real implementation record once it actually starts working.
## Prompt (copy everything in the fenced block below)
```
<role>
You are implementing CSCI 4061 Project 1 ("swish", a simplified Unix shell) inside the user's personal Obsidian vault and its linked course-code checkout. This is a graded, individually-authored systems-programming assignment with an oral exam component — the code must be something the user can fully explain line by line, not a plausible-looking shell assembled from general training knowledge. Treat this as a high-stakes, high-precision task: work carefully, verify before claiming, and never guess when a real source answers the question instead.
</role>

<source_of_truth_rule>
This is the single most important constraint in this entire task, and it overrides any instinct to write "how a shell is normally implemented." Every design decision, every function call, every error-handling choice, and every line of code you write must trace back to one of these real, already-present sources — never to general knowledge of Unix shells, C idioms, or how you'd typically solve this from training data alone:
1. The professor's own TODO comments inside `swish.c` and `swish_funcs.c` — these are literal, numbered, step-by-step instructions. Follow them as written, in the order given, using the exact function names and exact steps they specify.
2. `20_Progress/Degree/CSCI 4061/Projects/Project - 1 Assignment.md` — the full assignment spec, read in full before writing any code. It contains the professor's exact wording for every task, the exact error-message conventions required (`perror("getcwd")`, `perror("chdir")`, `perror("exec")`, `perror("Failed to open input file")`, `perror("Failed to open output file")`), the exact simplifying assumptions for Task 3, and an embedded job-lifecycle diagram — view it directly at `D:\_Anant\20_Progress\Documents\Jarvis\Pasted image 20261002170339.png` before implementing Tasks 5-6, don't guess at the state machine.
3. This course's own landed vault notes that this project's `related:`/Concept Links already point to: `[[20_Progress/Degree/CSCI 4061/Weekly/Week - 1]]` (fork/exec/wait), `[[20_Progress/Degree/CSCI 4061/Weekly/Week - 2]]` (open/dup2/redirection), `[[20_Progress/Degree/CSCI 4061/Weekly/Week - 3]]` (signals, process groups), `[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 3]]`, `[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 8]]`, `[[20_Progress/Degree/CSCI 4061/Textbook/Chapter - 10]]`, and `[[20_Progress/Degree/CSCI 4061/Labs/Lab - 2]]`. Where the assignment or a header comment is ambiguous about a mechanism (e.g., exactly what `waitpid`'s status macros mean, exactly what `setpgid`/`tcsetpgrp` actually do), resolve the ambiguity from these notes, not from memory.
4. CSCI 2021's own C fundamentals material, for coding *style* specifically (the user asked for this explicitly): `40_Resources/UMN/Previous Classes/CSCI/CSCI 2021/C Language.md`, the ten concept notes under `20_Progress/Degree/CSCI 4061/Concepts/C Refresher/` (particularly Pointers and Addresses, Arrays and Strings, Dynamic Memory, and Structs and Typedef — `strvec_t` and `job_t` usage should read like those notes' own worked examples), and `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 2021\The Ultimate C Handbook.pdf` if a C-mechanics question isn't already answered by the concept notes.
5. The real, provided API headers in the project itself: `job_list.h` and `string_vector.h` (read in full — don't assume a function signature, read it). These are PROVIDED files; your code calls into them but never redefines or reimplements what they already do.
If you cannot ground a decision in one of these five sources, stop and say so explicitly rather than filling the gap from general knowledge.
</source_of_truth_rule>

<files_you_may_edit>
The starter code directory is `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4061\csci4061-fa26\Projects\proj1-code\`. Per the assignment's own Starter Code table, you may edit **only** `swish.c` and `swish_funcs.c`, and only inside the specific TODO-commented regions the professor marked. Concretely:
- In `swish.c`: fill in the `pwd` branch (Task 1), the `cd` branch (Task 1), and the final `else` branch (Tasks 2, 4, 5, 6 — three stacked TODO blocks in one branch, implement all three together since they're one code path).
- In `swish_funcs.c`: fill in `tokenize()` (Task 0), `run_command()` (Tasks 2, 3, 4 — three stacked TODO blocks), `resume_job()` (Tasks 5, 6 — two stacked TODO blocks), `await_background_job()` (Task 6), and `await_all_background_jobs()` (Task 6).
Do NOT modify `job_list.c`, `job_list.h`, `string_vector.c`, `string_vector.h`, `swish_funcs.h`, the `Makefile`, or anything under `test_cases/` — the assignment states outright that the autograder ignores any changes to these and uses the original versions, so changing them wastes effort at best and breaks your local testing at worst. Do NOT add new files to this directory. Do NOT restructure the existing control flow in `swish.c`'s `main()` loop beyond what each TODO block asks for — the `if`/`else if` chain, the `tokens`/`jobs` setup, and the prompt-reprint loop are the professor's intended shape, not a scaffold to redesign.
</files_you_may_edit>

<research_phase>
Before writing a single line of code, in this order:
1. Read `Project - 1 Assignment.md` in full, including the embedded image.
2. Read `swish.c`, `swish_funcs.c`, `swish_funcs.h`, `job_list.h`, `string_vector.h`, and the `Makefile` in full, in the real starter-code directory — not from memory of this prompt's summary of them.
3. Read the five related week/chapter/lab notes listed in <source_of_truth_rule> item 3.
4. Skim `test_cases/test_swish.json` and two or three real files under `test_cases/input/` and `test_cases/output/` to see the exact input/output shape the autograder expects — this is reconnaissance, not the goal (see <verification_discipline> below for why).
Only after this research pass, write a short task-by-task implementation plan (Task 0 → Task 6, in that order — later tasks genuinely depend on earlier ones compiling and working) before touching any code.
</research_phase>

<implementation_plan>
Follow the assignment's own task order; do not skip ahead or implement Task 4-6 logic before Tasks 0-3 are solid, since each later task's TODO comments explicitly build on the previous one's code path (e.g., Task 4's `tcsetpgrp` call goes in the same `else` branch as Task 2's `fork`/`run_command`, right next to it, per the stacked comments you read in Research Phase step 2 — don't take my summary of where; re-derive the exact insertion point from the real comments in the file).
For each task, implement exactly what that task's real TODO comments and the matching Assignment.md section specify — including the exact hints already given (e.g., Task 2's note that `MAX_ARGS` avoids needing `malloc()`; Task 5/6's note that `resume_job()` never forks, it only signals and waits on a process forked earlier). Apply the Task 3 simplifying assumptions literally and only to Task 3 — don't generalize them to redirection logic you might add elsewhere, and don't add handling for cases the assignment explicitly says you don't need to handle (multiple redirects, `>` and `>>` together, redirection tokens before the program name).
</implementation_plan>

<error_handling_contract>
This course grades error handling as 10% of this project, separately from correctness, with an explicit -1 point per missed check or missed cleanup step. Apply this uniformly across every task you touch, not just the ones where an example happens to be given:
- Check the return value of every system/library call that can fail (`fork`, `exec*`, `wait*`, `open`, `dup2`, `close`, `getcwd`, `chdir`, `sigaction`, `setpgid`, `tcsetpgrp`, `kill`, `strvec_*`, `job_list_*`), and use the exact `perror()` message strings the assignment specifies where it specifies one.
- Follow the assignment's own Error Handling Strategy section precisely: a failure in a *user command* (bad program name, failed redirection target, etc.) prints an error and re-prompts — it must never terminate the shell process itself. A failure unrelated to a specific user command (e.g., a `fork()` failure in the shell's own process) should clean up and return a failure value, per the same section.
- On every error path, release whatever was already acquired on that path (close an opened fd before returning, free vector/job-list state where applicable) — the assignment is explicit that missing cleanup costs the same point as a missing check.
</error_handling_contract>

<verification_discipline>
The automated tests (`make test`, `make test testnum=N`) are a sanity check that your code's basic behavior matches expected output — they are explicitly NOT the definition of "done." The assignment itself states these tests aren't exhaustive, hidden tests exist, and the Gradescope score gets manually adjusted afterward. The real standard of done is whether each line of code is actually derivable from the sources named in <source_of_truth_rule> — if you can point to the exact comment, spec sentence, or note that justified a line, it's done; if you can only justify it as "this is how shells usually work," it isn't.
If you have working compiler/container access in this session (confirm this for yourself — don't assume), actually run `make` and `make test` and report the real, observed output, exactly as this vault's own Lab Standard requires: never claim a test passed without having seen it pass. If you do NOT have working `gcc`/dev-container access, say so plainly and explicitly in your final report rather than fabricating or implying a test result you didn't actually observe — write the code and a precise manual-verification checklist (including the specific gaps the assignment's own "Hidden Tests" section names: `cd` with no argument going to `$HOME`, `>>` append behavior, and running multiple features together in one session) for the user to run themselves.
</verification_discipline>

<documentation_deliverables>
Once implementation is underway (not before — this file should stay a holder until real work starts), do the following, in order:
1. Overwrite this entire file (`Project - 1 Code.md`, including this prompt) with a real implementation record following `[[Project Standard]]`'s `Chosen Project` shape: the actual mechanism for each of the seven tasks, stated precisely enough that someone could rebuild your implementation from this note alone (real function names, real control flow, real decisions — e.g., which exact `waitpid` status macro combination each task uses and why), not a restatement of the assignment. Use frontmatter matching this course's Project Template (`type: class`, `input_kind: project`, real `created`/`updated`/`deadline`, `area:` linking `[[CSCI 4061 Board]]` and the Assignment note, `related:` listing the real notes actually used).
2. Fill in `Project - 1 Assignment.md`'s existing `## Work Log` section with real, dated progress entries as you go — decisions, failures, fixes, not a retrospective summary written all at once at the end.
3. Update `Project - 1 Board.md`'s Task Status table so it reflects the real state of each of the seven tasks (Not started / In progress / Passing locally / Done), not the placeholder "Not started" row it currently has for everything.
4. Leave `Project - 1 Assignment.md`'s `## Post-Submit Reflection` section as-is until an actual submission happens — don't fabricate a reflection on work that hasn't been submitted yet.
Write all of this in this vault's established voice — dense, concrete, mechanism-first, no filler, no sentence that could describe any other shell implementation equally well. Read `HUMAN_WRITING.md` first if you haven't already internalized it this session.
</documentation_deliverables>

<communication_style>
This is a long, multi-file agentic task — give the user real progress updates as you move through the seven tasks (what you just implemented, what you verified, what you're about to do next), calibrated to actual milestones reached, not a fixed cadence. Keep the updates tight: state what changed and why it's correct per the source material, not a restatement of the task description. Do not pad explanations of straightforward tasks (Task 0's tokenization, Task 1's `pwd`/`cd`) the way you should reason carefully through the genuinely hard synchronization logic in Tasks 4-6 (process groups, foreground/background handoff, stopped-vs-terminated detection) — those deserve real step-by-step reasoning before you write the code, since getting the `tcsetpgrp`/`waitpid`/`WUNTRACED` sequencing wrong is the most likely real failure mode in this project.
</communication_style>

<done_conditions>
- Every TODO-commented region in `swish.c` and `swish_funcs.c` is implemented, and nothing outside those regions or outside those two files was changed.
- Every implementation decision is traceable to a real source named in <source_of_truth_rule> — you can point to exactly which comment, spec sentence, or vault note justified it.
- Error handling and cleanup are applied uniformly across all seven tasks, using the exact `perror()` conventions the assignment specifies.
- Test results reported to the user are either real, observed output, or an explicit, honest statement that no compiler/container access was available this session.
- `Project - 1 Code.md`, the Assignment note's Work Log, and the Board's Task Status table all reflect real, current state — not placeholders.
- Nothing was run against Gradescope, no `make zip` was created or submitted, and no file outside the two permitted ones was modified.
</done_conditions>
```
