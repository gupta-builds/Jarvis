---
type: input
status: sprout
created: <% tp.date.now("YYYY-MM-DD") %>
updated: <% tp.date.now("YYYY-MM-DD") %>
tags:
  - input
  - ai-conversation-summary
input_kind: ai-conversation-summary
source_app:
source_note:
project:
decision_count: 0
action_count: 0
notes: []
---
# <% tp.file.title %>
## What Was Decided
<!-- Each decision in one line with its reason. This sets decision_count. -->
## What Changed
<!-- Files, configs, or notes that now differ, as wikilinks or paths. -->
## Important Context
<!-- Only what a reader needs to understand the decisions: constraints and what was ruled out. -->
## Source Claims (Quoted From Transcript)
<!-- What the transcript states, quoted or tightly paraphrased. -->
## Inferred Claims (Distiller Interpretation)
<!-- What you concluded that the transcript did not say. -->
## Open Questions
<!-- What was left unresolved. Carries forward until answered. -->
## Follow-Up Actions
<!-- Task-formatted next steps with - [ ]. This sets action_count. -->
## Related Notes
<!-- Wikilinks to the project, concepts, and logs the conversation touched. -->
## Should Be Promoted?
<!-- decision: yes, no, or partial, and what moves where. The transcript itself is never promoted. -->
