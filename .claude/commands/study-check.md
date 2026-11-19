---
description: Report what was actually read and reviewed in a course, find the weak and strong topics, test a few questions, and name the next step. Usage /study-check CSCI 4521
---
Use the `coach` agent on the course named in the arguments (default `CSCI 4521`).
1. Run `node 30_Order/System/course-tools/course-status.js "<course>"` and use only its output for the report.
2. Follow the coach loop in `.claude/agents/coach.md`: report, weak and strong, three to five graded questions, propose tracking edits as a diff, next step.
3. Do not scan the vault, create files, or tick anything the user did not confirm.
