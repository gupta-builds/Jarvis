---
type: evergreen
status: sprout
created: 2026-09-08
updated: 2026-09-08
tags:
  - system
  - workflow
notes:
  - "[[Project Standard]]"
  - "[[00_Workflows Index]]"
---
# Projects Workflow
Document every option a project offers before committing to one, then keep the note open through the whole build so the post-submit reflection is written from real memory, not reconstructed after the deadline.
**Use when:** a multi-week course project gets assigned.
**Moves:** the assignment's option list + the shared starter scaffold → `<Course>/<Project Name>.md` plus a matching working folder, per [[Project Standard]].
**Template:** [[Project Template]]
## Steps
1. Read [[Project Standard]] (the `Standards/Courses/` one, not the general `20_Progress/` Project Standard) before writing.
2. As soon as the assignment is out, create the project note from [[Project Template]] and document every option offered under `## Project Options` — even the ones not being picked.
3. Once an option is chosen, mark it `(chosen)` in its heading and write `## Chosen Project` with the actual mechanism, real parameters, and real test setup — specific enough to rebuild from the note alone.
4. Link `## Concept Links` to the specific weeks and chapters the chosen approach draws from, verified to exist.
5. Build the project, using the note's Work Log (from [[Project Template]]) to track real progress, not a plan written in advance.
6. Within a day or two of submitting, write `## Post-Submit Reflection` — what failed first, and what pattern that suggests for the next project.
## Frontmatter to set
```yaml
type: class
input_kind: project
status: seed
```
## Done when
- Every option the assignment offered is documented, chosen or not.
- Chosen Project names real specifics, not a generic description of the algorithm.
- Post-Submit Reflection exists and was written close to submission, not months later.
- `status` moves to `sprout` once Chosen Project and Concept Links are both filled in.
