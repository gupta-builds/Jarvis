---
type: system
status: sprout
created: 2026-06-01
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: distilled
tier: 1
maps_to:
  - "[[Deep Dive Template]]"
  - "[[Synthesis Note Template]]"
used_by:
  - "[[Summary to Distilled]]"
gold_standard: "[[Observability in Backend vs Evaluation in AI]]"
notes:
  - "[[Source Summary Standard]]"
  - "[[Concept Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Evergreen Standard
==An evergreen note distills a mechanism that outlives any one source. It exists because the idea recurred across sources or work, not because one source was worth keeping.==
This is the standard for `evergreen` notes in `60_Claude/20_Distilled_Notes/` and the identity notes in `10_Areas/Life/Truths of Life/`. A source summary is fixed to one source and never grows; an evergreen is owned knowledge that grows. A course concept is exam-facing and lives under [[Concept Standard]]. Implementation plans and audits kept in this folder are not evergreen notes; see Legacy Shapes.
## Spec
```json
{
  "family": "distilled",
  "tier": 1,
  "template": "Deep Dive Template",
  "match": {"type": "evergreen", "kind": "distilled", "path": "^60_Claude/20_Distilled_Notes/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "evergreen_kind", "track", "notes"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "notes": "list"},
  "headings": ["Core Claim", "Mechanism", "Why This Matters Here", "Failure Modes", "Evidence", "Related"],
  "optional_headings": [],
  "legacy_match": [{"type": "concept", "path": "^60_Claude/20_Distilled_Notes/"}, {"type": "evergreen", "path": "^60_Claude/20_Distilled_Notes/", "absent": ["evergreen_kind"]}]
}
```
```json
{
  "family": "synthesis",
  "tier": 1,
  "template": "Synthesis Note Template",
  "match": {"type": "evergreen", "kind": "synthesis", "path": "^60_Claude/20_Distilled_Notes/Synthesis/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "evergreen_kind", "concepts", "tracks"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "concepts": "list", "tracks": "list"},
  "headings": ["Core Claim", "Where They Converge", "Where They Diverge", "Transfer Value"],
  "optional_headings": ["Diagnostic Question"],
  "legacy_match": [{"type": "evergreen", "path": "^60_Claude/20_Distilled_Notes/Synthesis/"}]
}
```
```json
{
  "family": "identity-note",
  "tier": 1,
  "match": {"type": "evergreen", "kind": "identity", "path": "^10_Areas/Life/Truths of Life/", "strict_path": true, "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "evergreen_kind"],
  "key_types": {"created": "date", "updated": "date", "tags": "list"},
  "headings": ["Log"],
  "optional_headings": [],
  "legacy_match": [{"type": "evergreen", "path": "^10_Areas/Life/Truths of Life/"}]
}
```
## Headings
### Frontmatter
`type: evergreen`, `evergreen_kind` (`distilled`, `synthesis`, or `identity`), `status: seed` on first write and `tree` only after the idea has been reused, `track`, and `notes` linking the summaries and neighbors it came from. A synthesis note sets `concepts` and `tracks` (lists) for the ideas and domains it joins.
> [!WARNING]
> `status: tree` on first write, or an empty `notes:` that leaves the note out of every backlink.
### Core Claim
One sentence in `==highlight==` stating what the note establishes. A topic label is not a claim.
### Mechanism
How it works, in your own words, with named parts in bold and `$...$` for notation. Use a table when mapping two domains row by row.
*Density:* the bulk of the note. [[BOOM]] explains why Redis sits beside Kafka (fast internal handoff against a public stream), not just that both exist.
### Why This Matters Here
Two to four sentences naming the project, course, or decision it serves.
### Failure Modes
Where the mechanism breaks, or the neighbor it is confused with, anchored by a `> [!WARNING]` when a real trap exists.
### Evidence
Verified wikilinks to the summaries it distills and the work that proves it.
### Related
Three to seven genuine neighbors. Not every keyword.
### Synthesis headings
*Core Claim:* the one parallel both domains share. *Where They Converge* and *Where They Diverge:* the mapping, with a table if rows help. *Transfer Value:* what you already know that carries over, as a drill when possible.
### Identity notes
Builder-identity evidence only. A dated `## Log` entry of one or two dense sentences, each pointing at shipped work, appended in the weekly, monthly, and yearly review.
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| April `type: concept` deep dives (`Career Strategy`, `AI-Assisted Trading`, `Index Fund Investing`, `Mentorship and Networking`, `Scarcity Imprint`) with `Deep Dive`, `Diagnostic Questions`, drill dates | `type: evergreen`, `evergreen_kind: distilled`, the six headings; drop drill keys unless the drill loop is run | judgment |
| Synthesis notes with `The Parallel`, `The Key Insight`, `Transfer Drill` | `Core Claim`, `Where They Converge`, `Where They Diverge`, `Transfer Value`; add `evergreen_kind: synthesis` | judgment |
| `Synthesis Index`, `Distilled Notes Board` | Retype `index` or `dashboard` | mechanical |
| `Sources - Plan/*` implementation plans, audits, restructure plans | Not evergreen; retype by use (`project_kind: plan`, `review_kind: audit`) | judgment |
| `The Plan/*` staging notes | Move out when The Plan takes them | judgment, needs a yes |
| `Identities`, `Personality` | Add `evergreen_kind: identity` | mechanical |
## Done Conditions
- A reader learns the mechanism without opening the sources.
- One highlight, a named use, a failure mode, and a contrast where one exists.
- `Evidence` and `Related` resolve, and gaps are stated.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[Observability in Backend vs Evaluation in AI]]: one parallel claim, a mapping of backend concept to ML analog, and a named transfer drill. It predates the current synthesis headings, which the Legacy Shapes table maps.
