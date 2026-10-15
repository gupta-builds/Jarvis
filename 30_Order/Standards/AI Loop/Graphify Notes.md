---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
  - graphify
notes:
  - "[[30_Order/Templates/AI Toolkit/Graphify Notes|Graphify Notes template]]"
  - "[[Graphify Folders]]"
  - "[[How to use Graphify]]"
  - "[[Graphify Workflow]]"
---
# Graphify Notes
==A graphify folder is a generated mirror that graphify owns: read it, link to it, never hand-write inside it. Everything a human writes about it goes in one entry note outside it.==
This is the content standard for notes that come from a Graphify export into this vault, and for the one human-written entry note that wraps each export. It does not teach Graphify. Commands, the three-pass pipeline, and the hook behavior live in [[Graphify Workflow]] and [[How to use Graphify]].
## Maps To
- Template: [[30_Order/Templates/AI Toolkit/Graphify Notes|Graphify Notes template]] (the entry note only)
## Used By Workflow
- [[Graphify Folders]]
## What a graphify folder is
The vault convention is `60_Claude/40_Project_Briefs/<RepoName>/`, created with `/graphify . --obsidian --obsidian-dir "<that folder>"`. It holds machine-generated files:
- `00 Overview.md`, `GRAPH_REPORT.md`, `graph.html`
- `Communities/` (notes named `_COMMUNITY_<name>`) and `Nodes/`
- `.graphify_obsidian_manifest.json`, which tracks every file graphify wrote
Seen today in `TradingView/` and `Internship/`.
## Ownership rules
- **Graphify owns the folder.** Never hand-write or hand-edit a note inside it. A rebuild may prune or overwrite it.
- **Generated files carry no vault frontmatter.** `GRAPH_REPORT.md` starts with a plain `# Graph Report` heading. These files are exempt from the 30_Order frontmatter rule, and lint, enrichment, and link checks should skip them.
- **The entry note is human-owned.** One note per mirror, started from the template, kept outside the generated folder (in `40_Project_Briefs/`), holding the repo, the last build date, the health check result, and links in.
- **Link in, not through.** Other notes link to `GRAPH_REPORT.md` and to the entry note, not to individual generated node files.
> [!WARNING]
> Tooling exclusion is a rule here, not a verified fact. Confirm that `vault-curator` and `/ops` skip graphify folders before relying on a clean report. The Internship mirror once held about 350 orphaned notes with junk names such as `.increase_indent().md`, found only by the manual health check.
## Health check
Three numbers stay close together: the folder's real `.md` count, the manifest's tracked-file count, and `graph.json`'s node count. A real gap means orphans accumulated. The commands are in [[How to use Graphify]]. Record the three numbers and the date in the entry note every time they are checked.
## Done Conditions
- The folder sits at `60_Claude/40_Project_Briefs/<RepoName>/` and nothing in it was hand-edited.
- An entry note exists, started from the template, with a dated health check.
- The three counts agree, or the gap is recorded as an Open Question.
- The entry note links to `GRAPH_REPORT.md`.
## Gold Standard Example
None yet for the entry note. The closest is [[Graphify — Internship Research Loop Implementation]], which records the root cause and cleanup of the Internship mirror, but it predates this template.
