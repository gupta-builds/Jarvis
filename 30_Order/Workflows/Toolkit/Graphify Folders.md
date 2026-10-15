---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - workflow
  - graphify
notes:
  - "[[00_Workflows Index]]"
  - "[[30_Order/Standards/AI Loop/Graphify Notes|Graphify Notes]]"
  - "[[How to use Graphify]]"
---
# Graphify Folders
Add a Graphify mirror of a repo to the vault, or keep an existing one healthy.
**Use when:** a repo needs a navigable graph inside Jarvis, or a mirror's health check is due.
**Serves Standard:** [[30_Order/Standards/AI Loop/Graphify Notes|Graphify Notes]]. **Template:** [[30_Order/Templates/AI Toolkit/Graphify Notes|Graphify Notes]].
The commands and the three-pass pipeline are in [[How to use Graphify]] and [[Graphify Workflow]]. This workflow covers only the vault side.
## Steps
1. Check whether the repo is already mapped. If it is, skip to step 5.
2. Choose the target folder: `60_Claude/40_Project_Briefs/<RepoName>/`. It must not already hold hand-written notes.
3. Build with `--obsidian --obsidian-dir` pointing at that folder, in the same pass as the graph build.
4. Create the entry note from the Graphify Notes template and fill Source, Mirror, and Last Build.
5. Run the three-count health check and record it in the entry note's Health Check table.
6. If the counts disagree, record the gap as an Open Question. Clean up orphans only after confirming in git that they are debris.
7. Append one line to the session log ([[Memory Management]]).
## Done when
- The mirror folder holds only graphify-generated files.
- The entry note exists with a dated health check.
- Any count gap is written down, not ignored.
