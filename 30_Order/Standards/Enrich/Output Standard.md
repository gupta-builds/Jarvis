---
type: system
status: sprout
created: 2026-10-16
updated: 2026-11-07
tags:
  - system
  - standards
system_kind: standard
family: output
tier: 1
maps_to:
  - "[[Interview Story Template]]"
  - "[[Portfolio Bullet Template]]"
  - "[[Project One-Pager Template]]"
used_by:
  - "[[Output with Provenance]]"
gold_standard: "[[Observability Debugging Story]]"
notes:
  - "[[Evergreen Standard]]"
  - "[[HUMAN_WRITING]]"
---
# Output Standard
==An output is something you hand to another person or system, so every claim in it must trace back to a vault note.==
This is the Standard for deliverables made from understanding: an interview story, a portfolio bullet, a one-page project brief. It is not a distilled note, which teaches you ([[Evergreen Standard]]); an output is judged by an outsider. Resumes and cover letters are in the internship Standards, and prompts and posts have no notes yet.
## Spec
```json
{
  "family": "output-story",
  "tier": 1,
  "template": "Interview Story Template",
  "match": {"type": "output", "kind": "story", "path": "^20_Progress/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "output_kind", "source_concepts"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list"},
  "headings": ["STAR Format", "Why This Story Works"],
  "optional_headings": [],
  "legacy_match": [{"type": "output", "where": {"output_kind": "interview-story"}}]
}
```
```json
{
  "family": "output-bullet",
  "tier": 1,
  "template": "Portfolio Bullet Template",
  "match": {"type": "output", "kind": "bullet", "path": "^20_Progress/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "output_kind", "source_concepts"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list"},
  "headings": ["Portfolio Bullet", "Quantified Impact"],
  "optional_headings": [],
  "legacy_match": [{"type": "output", "where": {"output_kind": "portfolio-bullet"}}]
}
```
```json
{
  "family": "output-one-pager",
  "tier": 1,
  "template": "Project One-Pager Template",
  "match": {"type": "output", "kind": "one-pager", "path": "^20_Progress/", "where": {}, "where_not": {}},
  "status": ["seed", "sprout", "tree", "archived"],
  "required_keys": ["type", "status", "created", "updated", "tags", "output_kind", "source_concepts"],
  "key_types": {"created": "date", "updated": "date", "tags": "list", "source_concepts": "list"},
  "headings": ["Problem", "Scope", "Architecture", "Stack", "Success Criteria", "Timeline"],
  "optional_headings": ["Honest Assessment"],
  "legacy_match": [{"type": "output", "where": {"output_kind": "project-brief"}}]
}
```

| Item | Rule |
|---|---|
| Allowed folders | Under `20_Progress/`, next to the project it serves (`20_Progress/Projects/Research/BOOM/`). There is no Outputs folder. |
| File name | The subject plus the kind (`Observability Debugging Story`, `BOOM Systems Engineering Bullet`). |
| Kind | `type: output` with `output_kind: story`, `bullet`, or `one-pager`. |
| Status | `seed` until reviewed, then `sprout`; `tree` after it has been used with an outsider. |
## Headings
### Frontmatter
- **Write:** `type: output`, `output_kind`, `source_concepts` (the vault notes every claim comes from), and `track`.
- **Length:** one line per key; one link per source note.
- **Never:** empty `source_concepts`, or links in it to notes that do not exist. That is a claim with no backing.
- **Right:** `- "[[Observability and Tracing]]"`
- **Wrong:** `output_kind: interview-story`
### STAR Format
- **Write:** story only. `### Situation`, `### Task`, `### Action`, `### Result`, each concrete and specific to the project.
- **Length:** two to four sentences each.
- **Never:** a generic result ("improved performance") with no before and after.
- **Right:** `Add structured observability so that every request and background job produces a traceable span tree.`
- **Wrong:** None seen.
### Why This Story Works
- **Write:** story only. Reasons an interviewer would care.
- **Length:** three or four bullets.
- **Never:** reasons that could apply to any story.
- **Right:** `- Has a clear before/after: guesswork → localized diagnosis`
- **Wrong:** None seen.
### Portfolio Bullet
- **Write:** bullet only. The bold project line, one dense paragraph, and a `**Stack**` line.
- **Length:** one paragraph.
- **Never:** adjectives in place of what was built.
- **Right:** `Built and instrumented a multi-stage astronomical alert processing pipeline in Rust.`
- **Wrong:** `output_kind: portfolio-bullet`
### Quantified Impact
- **Write:** bullet only. Measurable facts.
- **Length:** three to five bullets.
- **Never:** a measure the project notes do not support.
- **Right:** `- Instrumented 6+ subsystem boundaries with structured tracing spans`
- **Wrong:** None seen.
### Problem
- **Write:** one-pager only. The problem the project answers.
- **Length:** two to four sentences.
- **Never:** a solution in the problem.
- **Right:** `ML systems fail in the same ways as backend systems`
- **Wrong:** `output_kind: project-brief`
### Scope
- **Write:** what is built and what is not.
- **Length:** one paragraph.
- **Never:** a feature list with no boundary.
- **Right:** `Build a small ML inference pipeline with structured observability`
- **Wrong:** None seen.
### Architecture
- **Write:** the stages, in order.
- **Length:** a numbered list of three to seven stages.
- **Never:** a diagram with no words.
- **Right:** `1. **Ingestion**: read data from a queue or API endpoint`
- **Wrong:** None seen.
### Stack
- **Write:** the tools, grouped by job.
- **Length:** three to six bullets.
- **Never:** a tool the project does not use.
- **Right:** `- Python (FastAPI for API, OpenTelemetry for tracing)`
- **Wrong:** None seen.
### Success Criteria
- **Write:** checks that can pass or fail.
- **Length:** three to five bullets.
- **Never:** a criterion nobody can test.
- **Right:** `- Failures localize to the exact stage and input that caused them`
- **Wrong:** None seen.
### Timeline
- **Write:** dated or numbered steps.
- **Length:** one line per week or phase.
- **Never:** a timeline with no dependency order.
- **Right:** `- Week 1: Pipeline skeleton + OpenTelemetry setup`
- **Wrong:** None seen.
### Honest Assessment
- **Write:** optional. What is partial or unproven.
- **Length:** two to four sentences.
- **Never:** a hidden gap.
- **Right:** None yet.
- **Wrong:** None seen.
### Rules
| Rule | Why | Enforced by |
|---|---|---|
| The kind's headings appear in order and none is empty | A reader and a skill find sections by name | Lint, check 2 |
| `output_kind` is `story`, `bullet`, or `one-pager` | The vocabulary has no `interview-story` or `project-brief` | Lint, check 1 |
| Every claim traces to a note in `source_concepts` | An outsider will test the claim | Reader |
| An output lives next to its project, not in a library | A library of outputs drifts from the work | Lint, check 4 |
| A story or one-pager reads in about a minute | An outsider will not read more | Reader |
## Legacy Shapes
| Old shape | New shape | Move |
|---|---|---|
| `output_kind: interview-story`, `portfolio-bullet`, `project-brief` (all 6 outputs) | `story`, `bullet`, `one-pager` | Mechanical |
| An output in `40_Resources/CS/Concepts` (`Kafka Pipeline Architecture Story`) | Move next to its project | Judgment, needs a yes |
| `output_kind: project-brief` on a tool hub (`Stocks Trading AI Hub`) | Not an output; retype `reference` with `reference_kind: link-hub` | Judgment |
| The Output Index the old Standard mentioned | It never existed; use a Dataview over `type: output` | None |
## Done Conditions
- The kind's headings are all present and a stranger could read it cleanly.
- `source_concepts` lists real notes that support every claim.
- The note sits next to its project, not in a library.
- The note passes [[Vault Lint]] for its kind.
## Gold Standard Example
[[Observability Debugging Story]]: a full STAR account of the BOOM tracing work with a "why this story works" list. It does not pass lint: it still uses the legacy `interview-story` kind and has extra blank lines.
Measured 2026-11-07: story 3 notes, bullet 1, one-pager 2; none pass, all on the legacy kind.

| Note | Folder | Strength | Lacks |
|---|---|---|---|
| Observability Debugging Story (gold) | `20_Progress/Projects/Research/BOOM/` | STAR sections, reasons | Legacy kind, 14 extra blank lines |
| BOOM Systems Engineering Bullet | `20_Progress/Projects/Research/BOOM/` | Bullet, stack, impact | Legacy kind, 7 extra blank lines |
| Observability-First ML Pipeline Brief | `20_Progress/Projects/Research/BOOM/` | All six one-pager headings | Legacy kind |
