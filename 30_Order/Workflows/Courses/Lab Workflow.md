---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Lab Standard]]"
trigger: A lab prompt and starter files are available, or a lab session just happened.
notes:
  - "[[Lab Template]]"
  - "[[Weekly Workflow]]"
  - "[[Concept Workflow]]"
---
# Lab Workflow
Capture a lab's errors and fixes while they are still specific, not from memory days later.
## Use when
The lab prompt is available (create the note before or during the lab), or a session just ended.
## Steps
1. Read [[Lab Standard]]. Its Errors + fixes section is the point of the note.
2. Create `Lab - N` in the course's `Labs/` folder from [[Lab Template]] using the prompt, starter files, tests, and the paired lecture and textbook material.
3. Write the Goal and the Procedure in your own words, keeping the decision points: flags, config, commands.
4. As each error is resolved, write its Problem, Fix, Why, and Evidence on the spot. Take Evidence from the actual test or run output.
5. Record the observed Results. Keep collaboration rules and required submission steps separate from the implementation you chose.
6. Link the lab to its week and the concepts it exercised. Carry durable debugging patterns to the concept, preparation, and exam-practice notes.
7. Run [[Vault Lint]] on the path and fix what it reports.
## Do not
Do not claim tests passed without observed output, or paste a full solution only to make the note look complete.
## Done when
- Every real error has Problem, Fix, Why, and Evidence.
- Results are plain and the lab is linked to its week.
