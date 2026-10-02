---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-20
tags:
  - system
  - workflow
notes:
  - "[[Lab Standard]]"
  - "[[00_Workflows Index]]"
---
# Lab Workflow
Capture a lab session's errors and fixes while they're still fresh, right after the lab — not from memory days later once the specifics have blurred.
**Use when:** a graded or ungraded lab session just happened.
**Moves:** lab session → `<Course>/Lab/` or the course's assignment folder (wherever the course keeps individually-submitted work), one note per lab.
**Template:** [[Lab Template]]
## Normative procedure
Create the note before or during the lab if the prompt and starter files are available. Read the lab source, tests, paired lecture/textbook material, and actual run output. Record the goal in your own words, the decision points needed to reproduce the work, and the observed result. As each error occurs, write `Problem / Fix / Why / Evidence`; the error log is the durable output, not a polished claim that everything worked.
Verify tests from output rather than memory. Link the lab to its week and reusable concepts, then propagate durable debugging patterns to the concept, preparation, and exam-practice layers. Keep collaboration/tool rules and required submission steps separate from the implementation chosen.
## Steps
1. Read [[Lab Standard]] before writing — it governs the note this workflow creates, and its Errors + Fixes section is the point.
2. Create the lab note from [[Lab Template]] during or immediately after the lab session, while the errors hit are still specific in memory.
3. Fill in Goal and Procedure first, in your own words — not copied from the assignment sheet.
4. Fill in Errors + Fixes as errors get resolved, not reconstructed afterward — write each one down the moment it's fixed.
5. Link the lab back to the week it paired with, and to any concept notes it exercised.
## Frontmatter to set
```yaml
type: class
input_kind: lab
status: seed
```
## Done when
- Every real error hit during the lab has a Problem/Fix/Why entry.
- The note is linked to its paired week.
- Results are stated plainly, not padded.
