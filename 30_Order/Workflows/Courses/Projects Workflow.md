---
type: system
status: sprout
created: 2026-09-08
updated: 2026-10-16
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Course Project Standard|Course Project Standard]]"
trigger: A course project or multi-week build is assigned.
notes:
  - "[[Project Template]]"
  - "[[Course Production Workflow]]"
---
# Projects Workflow
Document every option before committing, then keep the note open through the build so the reflection comes from real memory.
## Use when
A midterm project, final project, or multi-week course build is assigned.
## Steps
1. Read the course Project Standard (the `Standards/Courses/` one, not the `20_Progress` one). Create the main note from [[Project Template]] when the project is assigned, before choosing an option.
2. Read the full prompt and rubric, every file in the project folder, the shared scaffold, the lecture and textbook material that introduced it, and any named papers.
3. Write Overview, and record whether the artifact is a problem set, writing assignment, or final project, because the integrity and collaboration rules may differ.
4. If options are offered, document every one (purpose, technique, starting files, constraints, references). Mark the chosen one only when the choice is real.
5. Write Chosen Project with the data model, parameters, invariants, algorithm flow, tests, and outputs, precise enough to rebuild.
6. Keep the Work Log with dated, evidence-backed milestones and failures. Give the code walkthrough, oral-exam drills, a report, or option notes their own companion notes with `project_role: companion`, linked to this one.
7. Link Concept Links to the weeks, chapters, and concepts actually used.
8. Record Submission, then write Post-Submit Reflection within a day or two. Carry recurring patterns to the concept and preparation notes.
9. Run [[Vault Lint]] on the path.
## Do not
Do not claim a result, paper, or test you did not inspect.
## Done when
- Every offered option is documented.
- Chosen Project names real parameters and test data.
- The reflection was written close to submission.
