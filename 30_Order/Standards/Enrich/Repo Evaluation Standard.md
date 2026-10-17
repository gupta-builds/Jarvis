---
type: system
status: sprout
created: 2026-10-16
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: repo-card
tier: 1
maps_to:
  - "[[Repo Evaluation Template]]"
used_by: []
gold_standard: "[[60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/agentscope|agentscope]]"
notes:
  - "[[Source Summary Standard]]"
  - "[[40_Resources/CS/Repos]]"
---
# Repo Evaluation Standard
==A repo card answers one question for a starred repository: should this change what I build, and how would I run it on this machine.==
This is the standard for the evaluation card of one GitHub repository in `60_Claude/10_Source_Summaries/Github Ingestion/` (96 cards in eight starred folders). It is not a [[Source Summary Standard]] summary: a repo has no text to replace, so the card holds a verdict, a use, and an install path instead. A repo that deserves only a link is a row in [[40_Resources/CS/Repos]], not a card.
## Spec
```json
{
  "family": "repo-card",
  "tier": 1,
  "match": {"type": "input", "kind": "repo-card", "path": "^60_Claude/10_Source_Summaries/Github Ingestion/", "strict_path": true, "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "input_kind", "source_url", "verdict", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["What it is", "How Anant uses it", "How to install / run it (Windows)", "Caveats / current state", "Connects to"],
  "optional_headings": [],
  "legacy_match": [{"type": "input", "path": "^60_Claude/10_Source_Summaries/Github Ingestion/"}]
}
```
## Headings
### Frontmatter and header line
`input_kind: repo-card`, `source_url` is the repository, and `verdict` is `yes`, `no`, or `maybe`, repeated from the Caveats section so a query can list every repo marked `yes`. Under the title, one line: `**GitHub:** [owner/repo](url) | **Stars:** n | **Updated:** date (version, activity)`.
### What it is
What the repo does, who maintains it, its license, in a short paragraph plus the core primitives as bullets.
*Density:* enough to decide without opening the README.
### How Anant uses it
The concrete use in a named project, or the reason there is none. Compare against what the vault already does.
> [!WARNING]
> Generic praise. The agentscope card ties its permission and sandbox primitives to the trading agents.
### How to install / run it (Windows)
Real commands, runtime versions, and the demo path, as tested or read from the README. Say which one.
### Caveats / current state
Activity, license, provider lock-in, version limits, and the verdict line: `**Verdict: yes** - the reason`.
### Connects to
Wikilinks to `40_Resources/CS/Repos` and any project or concept note it feeds.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| One-line entry with no headings (31 cards, for example `applied-ml`) | Fold into a row in `40_Resources/CS/Repos` or expand to the five headings | judgment, needs a yes before removing a card |
| `What It Is`, `Core Capabilities`, `Why It Matters`, `Use Cases for Jarvis`, `Tradeoffs`, `Related` (about 10 cards) | `What it is`, `How Anant uses it`, `Caveats / current state`, `Connects to`, with the install section added | judgment |
| No `input_kind` or `verdict` | `repo-card`; `verdict` from the Verdict line | mechanical when a verdict line exists |
| No `updated` (90 cards) | Add from the last edit | mechanical |
## Done Conditions
- All five headings appear in order and the verdict is set in both places.
- The install section names its runtime and says whether the commands were run.
- The card links to `40_Resources/CS/Repos` or a project, and every link resolves.
- The note passes [[Vault Lint]] for `repo-card`.
## Gold Standard Example
[[60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/agentscope|agentscope]]: all five headings, a header line with stars and version, a use tied to a project, and a verdict. It predates the `verdict` and `input_kind` keys.
