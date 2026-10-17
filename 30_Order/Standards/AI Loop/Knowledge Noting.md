---
type: system
status: sprout
created: 2026-10-15
updated: 2026-10-16
tags:
  - system
  - standards
system_kind: standard
family: policy
maps_to: []
used_by:
  - "[[Capture to Summary]]"
  - "[[Summary to Distilled]]"
gold_standard: none
notes:
  - "[[Source Summary Standard]]"
  - "[[Evergreen Standard]]"
  - "[[Conversations]]"
  - "[[Jarvis OS — North Star]]"
---
# Knowledge Noting
==Decide what a source becomes before writing anything: a summary, a distilled concept, or nothing.==
This is the decision policy for how raw material turns into knowledge. It does not say what a finished note looks like: [[Source Summary Standard]] fixes the shape of a summary and [[Evergreen Standard]] the shape of a distilled concept. This policy owns the choice between them and the agent's behavior while reading. For AI conversations the same choice is made by [[Conversations]].
## The loop
Capture, triage, distill, connect, promote, retrieve, review. A clipping lands in `60_Claude/05_Clippings/` or the Inbox, a triage pass routes it, and the steps below decide the route.
## The routing decision
Ask in this order and stop at the first yes.
1. **Will I act on it or reopen it?** If no, leave the clipping where it is. A summary of a source nobody needs is storage, not knowledge.
2. **Is it one source worth keeping beyond a link?** Write a source summary ([[Capture to Summary]]). One source in, one summary out. It replaces the source and is not extended later.
3. **Did the same concept recur across sources or in your own work?** Write or extend an evergreen note ([[Summary to Distilled]]). Search `20_Distilled_Notes/` first and extend before creating a sibling.
4. **Is the concept already understood from your own work, with no single source behind it?** Write the evergreen directly with `source_status: vault-grounded`. Do not invent a summary to justify it.
5. **Is the evergreen stable and reused?** Propose a promotion to `10_Areas/` or `40_Resources/`. The owner decides; nothing bulk-promotes.
## While reading
- Read the source once, fully, then write the note in the same session. A half-read source becomes a confident half-note.
- Mark every claim as source-grounded, inferred, or uncertain as you write it.
- Link as you go. A note with no links to or from it is invisible to retrieval.
- Do not turn raw source into flashcards. Cards come after distillation. Where [[Source Summary Standard]] still asks for a Flashcards section, this rule wins until the owner decides otherwise.
> [!WARNING]
> Summarizing everything. `05_Clippings/` holds about 740 Markdown files, and a summary adds value only for the ones that clear step 2.
## Done Conditions
- The routing decision was made explicitly, and a source that clears no step was left alone.
- No new note duplicates an existing concept note.
- Every new note links to its source and to at least one neighbor.
- Claims are labeled by grounding.
## Gold Standard Example
None for the decision itself. For the finished shapes, see the examples named in [[Source Summary Standard]] and [[Evergreen Standard]].
