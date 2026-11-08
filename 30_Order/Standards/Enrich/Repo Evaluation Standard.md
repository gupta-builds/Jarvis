---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: repo-card
tier: 1
maps_to:
  - "[[GitHub Repo Card Template]]"
used_by: []
gold_standard: "[[60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/agentscope|agentscope]]"
notes:
  - "[[Source Summary Standard]]"
  - "[[40_Resources/CS/Repos]]"
---
# Repo Evaluation Standard
==A repo card answers one question for a starred repository: should this change what I build, and how would I run it on this machine.==
This is the Standard for the evaluation card of one GitHub repository in `60_Claude/10_Source_Summaries/Github Ingestion/`. It is not a source summary ([[Source Summary Standard]]): a repo has no text to replace, so the card holds a verdict, a use, and an install path instead. A repo that deserves only a link is a row in [[40_Resources/CS/Repos]], not a card.
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

| Item | Rule |
|---|---|
| Allowed folders | `60_Claude/10_Source_Summaries/Github Ingestion/<List> Starred/`, one folder per starred list. |
| File name | The repository's name (`agentscope`). |
| Kind | `type: input` with `input_kind: repo-card`. |
| Status | `sprout` once the card is written. `tree` after the install commands were run on this machine. `archived` when the repo is dropped. |
## Headings
### Frontmatter and header line
- **Write:** `input_kind: repo-card`, `source_url` (the repository), and `verdict` (`yes`, `no`, or `maybe`), repeated from the Caveats section so a query can list every repo marked `yes`. Under the title, one line: `**GitHub:** [owner/repo](url) | **Stars:** n | **Updated:** date (version, activity)`.
- **Length:** one header line.
- **Never:** a card with no `verdict` key. 94 of 94 cards lack it, so no query finds the repos worth building on.
- **Right:** `**GitHub:** [agentscope-ai/agentscope](https://github.com/agentscope-ai/agentscope) | **Stars:** 27.2k | **Updated:** Jun 26 2026 (v2.0.2, active)`
- **Wrong:** None seen.
### What it is
- **Write:** what the repo does, who maintains it, its license, in a short paragraph plus the core primitives as bullets.
- **Length:** one paragraph and three to six bullets; enough to decide without opening the README.
- **Never:** a one-line entry with no headings.
- **Right:** `Production-ready Python agent framework (v2.0, Apache 2.0) from Alibaba.`
- **Wrong:** `29K-star papers + tech blogs from companies sharing ML/data science in production; by Eugene Yan. (*GOLD*)`
### How Anant uses it
- **Write:** the concrete use in a named project, or the reason there is none. Compare against what the vault already does.
- **Length:** one to three sentences.
- **Never:** generic praise. The agentscope card ties its permission and sandbox primitives to the trading agents.
- **Right:** `Compare against TradingAgents architecture when designing the multi-agent trading system.`
- **Wrong:** None seen.
### How to install / run it (Windows)
- **Write:** real commands, runtime versions, and the demo path, as tested or read from the README. Say which one.
- **Length:** a code block and one line of requirements.
- **Never:** Linux-only commands presented as Windows steps.
- **Right:** `Requires Python 3.11+.`
- **Wrong:** None seen.
### Caveats / current state
- **Write:** activity, license, provider lock-in, version limits, and the verdict line.
- **Length:** one paragraph and one verdict line.
- **Never:** a verdict in the section with no reason.
- **Right:** `Very active (365 commits, v2.0.2 Jun 2026). Apache 2.0, so usable in any project.`
- **Wrong:** None seen.
### Connects to
- **Write:** wikilinks to `40_Resources/CS/Repos` and any project or concept note it feeds.
- **Length:** one to four links.
- **Never:** a link to a note that does not exist.
- **Right:** `- [[40_Resources/CS/Repos]]`
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The five headings appear in order and none is empty | Cards are read by section | Lint, check 2 |
| `verdict` is set in the frontmatter and the Verdict line | A query lists every repo marked `yes` | Lint, check 1 (key); Reader (the two agree) |
| The install section says which commands were run | An unrun install path looks proven | Reader |
| A repo that deserves only a link becomes a row in `40_Resources/CS/Repos` | A thin card costs more to maintain than it returns | Reader |
| `updated` is set from the last edit | A card is judged by its age | Lint, check 1 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| One-line entry with no headings (for example `applied-ml`) | Fold into a row in `40_Resources/CS/Repos` or expand to the five headings | Judgment, needs a yes before removing a card |
| `What It Is`, `Core Capabilities`, `Why It Matters`, `Use Cases for Jarvis`, `Tradeoffs`, `Related` | `What it is`, `How Anant uses it`, `Caveats / current state`, `Connects to`, with the install section added | Judgment |
| No `input_kind` or `verdict` (all 94) | `repo-card`; `verdict` from the Verdict line | Mechanical when a verdict line exists |
| No `updated` | Add from the last edit | Mechanical |
## Done Conditions
- All five headings appear in order and the verdict is set in both places.
- The install section names its runtime and says whether the commands were run.
- The card links to `40_Resources/CS/Repos` or a project, and every link resolves.
- The note passes [[Vault Lint]] for `repo-card`.
## Gold Standard Example
[[60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/agentscope|agentscope]]: all five headings, a header line with stars and version, a use tied to a project, and a verdict line. It does not pass lint: no `updated`, `input_kind`, or `verdict` key, and 12 extra blank lines.
Measured 2026-11-07 with `--family repo-card`: 94 notes, 0 pass. The largest folders are Claude Starred (35) and AI Starred (22).

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| agentscope (gold) | `60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/` | All five headings, a verdict | Three keys, blank lines |
| dots.ocr | `60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/` | A verdict with a reason | Same three keys; the verdict sits inside How Anant uses it |
| applied-ml | `60_Claude/10_Source_Summaries/Github Ingestion/AI Starred/` | A header line | Every heading |
