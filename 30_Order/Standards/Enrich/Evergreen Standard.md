---
type: system
status: sprout
created: 2026-06-01
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: distilled
tier: 1
maps_to:
  - "[[Evergreen Note Template]]"
  - "[[Cross-Domain Synthesis Template]]"
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
This is the Standard for `evergreen` notes in `60_Claude/20_Distilled_Notes/` and the identity notes in `10_Areas/Life/Truths of Life/`. It is not a source summary, which is fixed to one source and never grows ([[Source Summary Standard]]), and not a course concept, which is exam-facing ([[Concept Standard]]). Implementation plans and audits kept in the distilled folder are not evergreen notes.
## Spec
```json
{
  "family": "distilled",
  "tier": 1,
  "template": "Evergreen Note Template",
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
  "template": "Cross-Domain Synthesis Template",
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

| Item | Rule |
|---|---|
| Allowed folders | Distilled: `60_Claude/20_Distilled_Notes/`. Synthesis: `60_Claude/20_Distilled_Notes/Synthesis/`. Identity: `10_Areas/Life/Truths of Life/`. |
| File name | The idea, or `A vs B` for a synthesis (`Rust Ownership vs OCaml Immutability`). Unique in the vault. |
| Kind | `type: evergreen` with `evergreen_kind: distilled`, `synthesis`, or `identity`. |
| Status | `seed` on first write. `tree` only after the idea has been reused in other work. |
## Headings
### Frontmatter
- **Write:** `evergreen_kind`, `track`, and `notes` linking the summaries and neighbors it came from. A synthesis sets `concepts` and `tracks` (lists) for the ideas and domains it joins.
- **Length:** one line per key; `notes` holds every source.
- **Never:** `status: tree` on first write, or an empty `notes:`. Both leave the note out of every backlink.
- **Right:** `tracks:`
- **Wrong:** `type: concept`
### Core Claim
- **Write:** what the note establishes, in `==highlight==`. A synthesis states the one parallel both domains share.
- **Length:** one sentence.
- **Never:** a topic label. A claim says something that could be wrong.
- **Right:** `Two type systems that prevent bugs at compile time, but through different mechanisms.`
- **Wrong:** `## Deep Dive`
### Mechanism
- **Write:** how it works, in your own words, with named parts in bold and `$...$` for notation. Use a table when mapping two domains row by row.
- **Length:** the bulk of the note.
- **Never:** a restatement of the source. The mechanism is what survives without it.
- **Right:** `Rust prevents data races and use-after-free through **ownership and borrowing**.`
- **Wrong:** None seen.
### Why This Matters Here
- **Write:** the project, course, or decision it serves.
- **Length:** two to four sentences.
- **Never:** "valuable resource" padding.
- **Right:** None yet.
- **Wrong:** None seen.
### Failure Modes
- **Write:** where the mechanism breaks, or the neighbor it is confused with, anchored by a `> [!WARNING]` when a real trap exists.
- **Length:** one to three modes.
- **Never:** generic risks that apply to every idea.
- **Right:** `**The essay's central "proof" does not hold up and should not be cited as evidence.**`
- **Wrong:** None seen.
### Evidence
- **Write:** verified wikilinks to the summaries it distills and the work that proves it.
- **Length:** every source, and the work that used the idea.
- **Never:** a link to a note that does not exist.
- **Right:** None yet.
- **Wrong:** None seen.
### Related
- **Write:** genuine neighbors.
- **Length:** three to seven links.
- **Never:** every keyword.
- **Right:** None yet.
- **Wrong:** None seen.
### Where They Converge
- **Write:** the mapping between the two domains, as a table if rows help.
- **Length:** a short paragraph or a table.
- **Never:** a restatement of Core Claim.
- **Right:** `Both languages force you to think about data flow explicitly:`
- **Wrong:** `## The Structural Parallel`
### Where They Diverge
- **Write:** where the parallel breaks.
- **Length:** a short list.
- **Never:** a divergence that is only a difference of vocabulary.
- **Right:** `- Rust allows mutation but controls it. OCaml discourages mutation entirely.`
- **Wrong:** None seen.
### Transfer Value
- **Write:** what you already know that carries over, as a drill when possible.
- **Length:** a short list.
- **Never:** a vague "useful in many fields".
- **Right:** `- Why immutability makes concurrent code safer (OCaml insight applied to Rust)`
- **Wrong:** `## The Key Insight`
### Log (identity notes)
- **Write:** builder-identity evidence only: a dated entry pointing at shipped work, added in the weekly, monthly, and yearly review.
- **Length:** one or two dense sentences per entry.
- **Never:** aspiration or personal reflection. Those belong in The Plan.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| Headings for the kind appear in order and are not empty | Retrieval reads sections by name | Lint, check 2 |
| `evergreen_kind` is set and `notes` is a list | The three kinds are found by kind | Lint, check 1 |
| One highlight in the Core Claim | The highlight is the card or the claim a reader keeps | Reader |
| Search `20_Distilled_Notes/` first and extend before creating a sibling | Two notes on one idea split the backlinks | Reader |
| An identity line traces to completed, logged work | Aspiration is not evidence | Reader |
| `Evidence` and `Related` links resolve | A dead link is an unproven claim | Lint, check 3 |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `type: concept` deep dives (`Career Strategy`, `AI-Assisted Trading`, `Index Fund Investing`, `Mentorship and Networking`, `Scarcity Imprint`) with `Deep Dive`, `Diagnostic Questions`, drill keys | `type: evergreen`, `evergreen_kind: distilled`, the six headings; drop drill keys unless the drill loop is run | Judgment |
| Synthesis notes with `The Parallel`, `The Key Insight`, `Transfer Drill` | `Core Claim`, `Where They Converge`, `Where They Diverge`, `Transfer Value`; add `evergreen_kind: synthesis` | Judgment |
| `Synthesis Index`, `Distilled Notes Board` | Retype `index` or `dashboard` | Mechanical |
| `Sources - Plan/*` implementation plans, audits, restructure plans | Not evergreen; retype by use (`project_kind: plan`, `review_kind: audit`) | Judgment |
| `The Plan/*` staging notes | Move out when The Plan takes them | Judgment, needs a yes |
| `Identities`, `Personality` | Add `evergreen_kind: identity` | Mechanical |
## Done Conditions
- A reader learns the mechanism without opening the sources.
- One highlight, a named use, a failure mode, and a contrast where one exists.
- `Evidence` and `Related` resolve, and gaps are stated.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[Observability in Backend vs Evaluation in AI]]: one parallel claim, a mapping of backend concept to ML analog, and a named transfer drill. It does not pass lint: it predates `evergreen_kind` and the current synthesis headings.
Measured 2026-11-07: distilled 15 notes, synthesis 4, identity 2; none pass. No distilled note has the six headings yet.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Observability in Backend vs Evaluation in AI (gold) | `60_Claude/20_Distilled_Notes/Synthesis/` | Parallel, mapping, transfer drill | `evergreen_kind`, `Core Claim`, `Where They Converge` |
| Rust Ownership vs OCaml Immutability | `60_Claude/20_Distilled_Notes/Synthesis/` | Has Converge, Diverge, Transfer Value | `evergreen_kind`, `Core Claim`, one dead frontmatter link |
| Identities | `10_Areas/Life/Truths of Life/` | A scope rule | `evergreen_kind`; the Log is empty |
