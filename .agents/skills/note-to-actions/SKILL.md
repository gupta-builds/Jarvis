---
name: note-to-actions
description: Turns a brief, or any dense interlinked note, in the Jarvis vault into an action note, a link-dense map of concrete next steps with one section per thread, by asking the user what each thread actually requires. Use when the user says "write the actions", "what do I need to do after this meeting", "note to actions", "turn this brief into next steps", or points at a brief whose Follow-Up Actions has no action note yet. Do NOT use to summarize a transcript (use transcript-to-brief) or to make a checklist or task list.
argument-hint: "[path or name of the brief or note]"
allowed-tools: "Read Glob Grep Bash(node 30_Order/System/vault-lint/vault-lint.js *)"
metadata:
  author: Anant Gupta
  version: 2.0.0
  workflow: Meeting Workflow, steps 6 to 8
---
# Note to Actions
Maps what still needs doing after a meeting. Runs steps 6 to 8 of [[Meeting Workflow]]. It is not a second brief and does not re-summarize. The next steps come from the user, not from you.
## Critical rules
1. Statements only. No checkboxes, no prose paragraphs, one sentence per step.
2. Every statement carries at least one wikilink to the project, concept, person, or note it concerns. A statement with no link has not been mapped to anything; rewrite it or ask.
3. Do not infer a step the source does not support. Ask.
4. Ask in chat and wait. Do not write the note until the user has confirmed the threads in step 4.
5. Never create a stub note for a missing link target. Ask what to do instead.
6. Nothing is silently dropped. Every source thread becomes a section or a line under Open Threads.
7. Write plain prose per HUMAN_WRITING. No em dashes. No blank lines in the note.
## Before you start
Read these, in this order:
1. `30_Order/Workflows/Ingestion/Meeting Workflow.md`
2. `30_Order/Standards/Ingestion/Action Standard.md`
3. `30_Order/Templates/Capability/Action Template.md`
4. `references/example-action.md` in this skill folder: a finished action note and a before-and-after of a paragraph turned into statements
## Steps
### Step 1: Locate the source
Use the argument if given, otherwise the active file, otherwise ask. It is usually a brief with `input_kind: brief`. Glob the sibling `Action/` folder and grep for the source's name in `source_note`; if an action note exists, ask whether to update it.
### Step 2: Understand the source and its context
Read the whole source, then every note it links that you need to understand a thread: the transcript for exact wording, the project's plan note, the profile of the person involved, and earlier action notes in the same project for dates and commitments already made. Search the vault, never `50_Archive/`.
### Step 3: Collect candidate steps
For each thread in the source (a brief's `### Key Threads`), draft candidate statements from what the source supports. Mark anything that would need a decision from the user. Check dates the source mentions against today.
### Step 4: Ask what each thread requires
Go thread by thread, in the source's order. For each, show the candidates and ask:
- What is the actual next move on this thread, and does the candidate match?
- On what, by when, and with whom?
- Is there a step you would add, change, or drop?
Offer your candidate and confirm it; do not just assume. Ask a thread at a time when the threads are independent, and batch the simple ones. Ask the user directly for anything only they know: a date they committed to, a person they will contact, a thing they decided not to do.
### Step 5: Missing link targets
If a step needs a person, project, or concept that has no vault note, ask: link it anyway to a note to be created, skip the link, or record the gap under Open Threads. Wait for the answer.
### Step 6: Draft the note
Copy the Action Template shape: an opening line naming the source and the rule, then one `##` per source thread in the source's order with the same heading words, then `## Open Threads`. Name the file after the meeting plus "Actions". Save in the sibling `Action/` folder, otherwise beside the source.
### Step 7: Show it and revise
Show the sections and ask "What should change, and what is missing?" Patch by heading and repeat until the user says it is done.
### Step 8: Frontmatter and links
- Action note: `type: action`, `status: active`, `source_note` as a quoted wikilink to the source (filename only), `related_progress`, and `next` as the single statement to close out first.
- Source brief: make sure its `next` and `## Follow-Up Actions` name the action note. Touch nothing else.
### Step 9: Lint and log
Run `node 30_Order/System/vault-lint/vault-lint.js --path "<folder of the action note>"` and fix every failure for the new note. Append one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
### Step 10: Report
Say where the note is, what `next` is, and what sits under Open Threads.
## Quality bar
- Terse. A step that needs a paragraph is explained in the source, not here.
- Concrete verbs: send, ask, book, look up, compare. Not "consider" or "follow up".
- The user's dates are used as given; no invented deadlines.
## Troubleshooting
**The source is not a brief and has no Key Threads.** Use its own section headings as the threads and say so in the opening line.
**A thread produced no concrete step.** Put it under Open Threads as a statement naming what is unresolved.
**Lint says missing-heading.** The note must end with `## Open Threads` and have content under it.
**Lint says bad-wikilink on `source_note`.** Use the filename only, in quotes, and check the brief exists.
**The user gives a step with no clear link target.** Link to the plan note of the project, or ask which note it belongs to.
