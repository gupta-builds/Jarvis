---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - workflow
  - graphify
system_kind: workflow
serves: "[[30_Order/Standards/AI Loop/Graphify Notes|Graphify Notes]]"
trigger: A repo needs a navigable graph inside Jarvis, or a mirror's health check is due.
notes:
  - "[[How to use Graphify]]"
  - "[[Graphify Workflow]]"
  - "[[Generated Output Standard]]"
---
# Graphify Folders
Add a graphify mirror of a repo to the vault, or keep an existing one healthy. The commands and the three-pass pipeline are in [[How to use Graphify]] and [[Graphify Workflow]]; this covers only the vault side.
## Use when
A repo needs a graph in Jarvis, a mirror was rebuilt, or a mirror's health check is due.
## Steps
1. Check whether the repo is already mapped. If it is, skip to step 5.
2. Choose the folder `60_Claude/40_Project_Briefs/<RepoName>/`. It must not hold hand-written notes.
3. Build with `--obsidian --obsidian-dir` pointing at that folder, in the same pass as the graph build.
4. Create the entry note from [[30_Order/Templates/AI Toolkit/Graphify Notes|Graphify Notes Template]] and fill Source, Mirror, and Last Build.
5. Run the three-count health check (folder `.md` count, manifest count, `graph.json` nodes) and add a dated row to the entry note.
6. If the counts disagree, record the gap as an Open Question. Clean up orphans only after confirming in git that they are debris.
7. Append one line to the session log ([[Memory Management]]).
## Do not
Do not hand-edit a file inside the mirror, or link other notes to individual node files.
## Done when
- The mirror folder holds only graphify-generated files.
- The entry note exists with a dated health check.
- Any count gap is written down, not ignored.
