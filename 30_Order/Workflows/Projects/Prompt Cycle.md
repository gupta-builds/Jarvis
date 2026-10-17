---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Agent Prompt Standard]]"
trigger: A build or fix round on a codebase will be run by an agent session.
notes:
  - "[[Agent Prompt Template]]"
  - "[[Spec and Plan Standard]]"
---
# Prompt Cycle
Write the next prompt, run it, review the result against the repo, and archive it, so the queue only ever holds what runs next.
## Use when
A project like the internship research loop or CausalOps has a round of agent work to run. The Building System runs are the worked example.
## Steps
1. Open the queue note (`Claude Code Prompts`, `Codex Prompts`). It holds the next prompt and only that.
2. Check the evidence for Why This Exists against the live repo. A hypothesis the queue wrote itself is labeled, and said plainly when it turns out wrong.
3. Write the prompt from [[Agent Prompt Template]] with scope in Hard Rules and a Report Back section.
4. Run it in a fresh agent session.
5. Review Report Back against the repo: the commands and their output, not the agent's summary.
6. Move the finished prompt and its reviewed result to the Archive note and set its `status` to `complete`.
7. Rewrite the queue with the next prompt, and add a Log entry to the project note.
## Do not
Do not let finished prompts pile up in the queue, hand over an unchecked diagnosis, or accept a report you did not compare to the repo.
## Done when
- The queue holds only the next prompt.
- The finished prompt and its result are in the Archive note, with `status: complete`.
- The project Log names the round and what was verified.
