---
type: reference
status: sprout
created: 2026-04-24
updated: 2026-10-17
tags:
  - evergreen
  - system
  - jarvis
  - enrichment
notes:
  - "[[00_Dashboard]]"
  - "[[40_Resources/Obsidian/Vault Operating System]]"
  - "[[40_Resources/Capability/Capability Engine Guide]]"
  - "[[HUMAN_WRITING]]"
reference_kind: resource
area:
  - '[[10_Areas/AI/Claude Code]]'
---
# Jarvis Enrichment Engine
Jarvis should make existing notes stronger without erasing the human work already there.
The enrichment engine is the vault-wide layer that finds incomplete nodes, appends concrete knowledge, links the note into the graph, and turns the note into something you can learn from later.
## Core Rule
Preserve the original note. Add a clearly marked enrichment layer.
Jarvis can clean obvious encoding damage or metadata drift when asked, but the default behavior is append-first:
```text
human note
  -> gap scan
  -> source/context retrieval
  -> structured enrichment
  -> critic pass
  -> append under Jarvis Enrichment
  -> dashboard + drill scheduling
```
## What Counts As Enriched
A strong concept node should have:
- one-sentence version
- precise definition
- mechanism
- why it matters
- concrete example from this vault
- contrast with nearby ideas
- failure modes or misconceptions
- diagnostic questions
- source anchors
- drill cards or understanding proof
Not every note needs every section. The goal is useful density, not blank-section theater.
## Enrichment Modes
### Light
Use when a note is already good but missing retrieval hooks.
- add precise definition
- add 2-4 links
- add 2 diagnostic questions
### Standard
Use for most concept notes.
- add definition, mechanism, example, contrast, failure modes, questions, source anchors
- update `enrichment_status: enriched`
- add or update capability metadata if the note belongs to a track
### Deep
Use for flagship concepts that should become private textbook chapters.
- add formal model, worked examples, implementation notes, drills, proof of understanding
- connect to projects, outputs, and evidence
- create a synthesis note if it bridges multiple tracks
## Candidate Selection
Use the local CLI:
```powershell
.\30_Order\System\jarvis-cli\jarvis.ps1 enrich-candidates --limit 25
```
Prioritize notes that are:
- `type: concept`
- tracked with `track`
- `status: seed` or `status: sprout`
- missing source anchors, examples, or diagnostic questions
- linked from active courses or projects
## Write Pattern
Use this heading when enriching an existing note:
```markdown
## Jarvis Enrichment
```
Use this heading when the note is stable and the original should be visually isolated:
```markdown
## Addendum - Jarvis Enrichment 2026-04-24
```
Inside the section, prefer this order:
1. precise definition
2. mechanism
3. concrete example
4. contrast
5. failure modes
6. diagnostic questions
7. source anchors
8. drill cards
## Quality Gate
Before saving enriched prose, check:
- Does it define the thing more precisely than before?
- Does it explain mechanism, not just importance?
- Does it use a real example from this vault when possible?
- Does it preserve the original note?
- Does it cite source notes or source material?
- Could a future version of me learn from this without opening Google?
If the answer is no, the enrichment is not ready.
## Dashboard
Use [[Knowledge Enrichment Dashboard]] to find weak nodes, recent enrichments, missing source anchors, and concepts with no evidence.
## Corrections
### 2026-10-17: proposal versus deployment
The original design and dated observations above remain intact. They are historical input to [[Jarvis Restoration Build Plan]], not confirmation that an unattended workflow or retrieval service operates on this laptop. Use [[Jarvis Current State - 2026-10-17]] for the dated inventory and [[Jarvis Build History - July to October 2026]] for the evidence trail.
No embedding model, vector database, reranker, cloud provider, service framework, or deployment stack is selected by retaining this proposal. Token savings, portfolio claims, and blocked-command claims quoted from earlier work require a fresh local check before they are used to justify implementation. Enrichment remains source-grounded, preserves human notes, and needs an observed end-to-end run before it is called operational.
[[Jarvis AI Infrastructure - Concepts and Research]] preserves the conditional research backlog. Restoring the basic workflows and measuring a baseline come first.
