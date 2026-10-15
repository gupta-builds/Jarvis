---
type: evergreen
status: sprout
created: 2026-10-15
updated: 2026-10-15
tags:
  - system
  - standards
notes:
  - "[[Source Summary Standard]]"
  - "[[Evergreen Standard]]"
  - "[[Capture to Summary]]"
  - "[[Summary to Distilled]]"
  - "[[Jarvis OS — North Star]]"
---
# Knowledge Noting
==Decide what a source becomes before writing anything: a summary, a distilled concept, or nothing.==
This is the decision standard for how raw material turns into knowledge. It does not say what a finished note looks like. [[Source Summary Standard]] fixes the shape of a summary and [[Evergreen Standard]] fixes the shape of a distilled concept; read those for headings and density. This Standard owns only the choice between them and the agent's behavior while reading.
## The loop
Capture, triage, distill, connect, promote, retrieve, review. A clipping lands in `60_Claude/05_Clippings/` or the Inbox, a triage pass routes it, and the sections below decide the route.
## The routing decision
Ask in this order and stop at the first yes.
1. **Will I act on it or reopen it?** If no, leave the clipping where it is. No summary. A summary of a source nobody needs is storage, not knowledge.
2. **Is it one source worth keeping beyond a link?** Write a source summary ([[Capture to Summary]]). One source in, one summary out. It replaces the source and is never extended later.
3. **Did the same concept recur across sources or in your own work?** Write or extend an evergreen note ([[Summary to Distilled]]). Search `20_Distilled_Notes/` first and extend before creating a sibling.
4. **Is the concept already understood from your own work, with no single source behind it?** Write the evergreen directly with `source_status: vault-grounded`. Do not invent a summary to justify it.
5. **Is the evergreen stable and reused?** Propose a promotion to `10_Areas/` or `40_Resources/`. The owner decides; nothing bulk-promotes.
## While reading
- Read the source once, fully, then write the note in the same session. A half-read source becomes a confident half-note.
- Mark every claim as source-grounded, inferred, or uncertain as you write it, not afterward.
- Link as you go. A note with no links to or from it is invisible to retrieval.
- Do not turn raw source into flashcards. Cards come after distillation.
> [!WARNING]
> Summarizing everything. `05_Clippings/` holds about 740 Markdown files as of 2026-10-15; a summary adds value only for the ones that clear step 2. Skipping the triage question is how `60_Claude` becomes a warehouse.
## Open question for the owner
`Source Summary Standard` ends each summary with a Flashcards section, while the rule above (and the Spaced Repetition guidance in [[AI_CONTEXT]]) says cards come after distillation. These disagree. One of them should change. This Standard follows the distillation-first rule until the owner decides.
## Done Conditions
- The routing decision was made explicitly, and a source that clears none of the steps was left alone.
- No new note duplicates an existing concept note.
- Every new note links to its source and to at least one neighbor.
- Claims are labeled by grounding.
## Gold Standard Example
None yet for the decision itself. For the finished shapes, see the examples named in [[Source Summary Standard]] (`Quant Foundations (PDF)`) and [[Evergreen Standard]] (`BOOM`).
