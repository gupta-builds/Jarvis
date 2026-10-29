---
type: system
status: sprout
created: 2026-10-28
updated: 2026-10-28
tags:
  - system
  - workflow
system_kind: workflow
serves: "[[Transcript Standard]], [[Brief Standard]], [[Action Standard]]"
trigger: A meeting, call, or conversation has been recorded and needs its transcript, and its brief and action note if it earned them.
notes:
  - "[[Transcript Template]]"
  - "[[Brief Template]]"
  - "[[Action Template]]"
  - "[[00_Workflows Index]]"
---
# Meeting Workflow
Turn any meeting into up to three linked notes: transcript, brief, action. `/transcript-to-brief` runs steps 3 to 5; `/note-to-actions` runs 6 to 8.
## Use when
A meeting or call has been recorded, whether or not you took part.
## Steps
1. Copy [[Transcript Template]] into a `Transcripts/` folder beside the project's meeting notes and paste the raw text in. One conversation per note; cut and name any other conversation the recording caught.
2. Decide what the meeting needs. Every meeting keeps its transcript. A brief follows if it carried a decision or a thread worth keeping, an action note only if the follow-ups each need a concrete step. If neither, say so in the transcript's `next` and stop.
3. Read [[Brief Standard]], then the whole transcript once before asking anything.
4. Ask only what the transcript requires: garbled passages, which threads mattered, missing context. Search before linking any name.
5. Copy [[Brief Template]], write the six sections, and set `source_note` to a quoted wikilink to the transcript. Save in a sibling `Briefs/` folder, else beside the transcript.
6. Read [[Action Standard]], then the brief and its links. For each thread ask for the concrete next step; infer none.
7. Copy [[Action Template]]: one `##` per brief thread in order, one linked statement per step, the unresolved under Open Threads. Ask about a missing link target; no stubs. Save in a sibling `Action/` folder if one exists, otherwise beside the brief.
8. Link forward: the transcript's `next` names the brief and it becomes `sprout`; the brief's `next` and Follow-Up Actions name the action note.
9. Run [[Vault Lint]] on each new note; add one session log line.
## Do not
Do not edit the transcript beyond the named cut, guess a garbled passage, or invent a decision. Do not add a prep, summary, or log note; planning lives in the project's plan.
## Done when
- The transcript is untouched and each later note links back to its source.
- Every ambiguous passage is resolved or named in Open Questions.
- Lint passes each note.
