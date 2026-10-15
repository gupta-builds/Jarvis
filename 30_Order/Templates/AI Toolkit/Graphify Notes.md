---
type: evergreen
status: sprout
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - evergreen
  - graphify
repo:
mirror_folder: "60_Claude/40_Project_Briefs/<RepoName>/"
last_build:
notes:
  - "[[How to use Graphify]]"
next:
---
# Graphify: <RepoName>
==One line: what this graph answers about the repo.==
## Source
The repo path, what it contains, and why it was mapped.
## Mirror
Folder: `60_Claude/40_Project_Briefs/<RepoName>/` (graphify-owned, never hand-edited). Report: [[<RepoName>/GRAPH_REPORT|GRAPH_REPORT]]
## Last Build
Date, command used, and whether docs or PDFs changed since (those need a full `/graphify --update`).
## Health Check
| Date | Folder `.md` count | Manifest count | `graph.json` nodes |
|---|---|---|---|
|  |  |  |  |
A real gap means orphans. Cleanup steps are in [[How to use Graphify]].
## Open Questions
- [ ]
