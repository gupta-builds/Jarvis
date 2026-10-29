---
name: transcript-to-brief
description: Turns a meeting transcript note in the Jarvis vault into a six-section brief note by reading the whole transcript, asking the user only what the transcript cannot answer, and drafting to Brief Standard. Use when the user says "write the brief", "brief this meeting", "transcript to brief", "summarize this call into a brief", or points at a Transcript note (type input, input_kind transcript) that has no brief yet. Do NOT use for the action note (use note-to-actions), for AI conversation exports, or for clipping, PDF, or video summaries (use ingest-clipping).
argument-hint: "[path or name of the transcript note]"
allowed-tools: "Read Glob Grep Bash(node 30_Order/System/vault-lint/vault-lint.js *)"
metadata:
  author: Anant Gupta
  version: 2.0.0
  workflow: Meeting Workflow, steps 3 to 5
---
# Transcript to Brief
Compresses one transcript into what was decided and what mattered. Runs steps 3 to 5 of [[Meeting Workflow]]. The whole job is a conversation with the user: you propose, they correct, then you write.
## Critical rules
1. Never edit the transcript. The only change to it is its own `next` and `status`, in step 8.
2. Read the whole transcript before asking anything.
3. Ask in chat and wait. Do not write the brief until the user has approved the plan in step 5.
4. Never guess a garbled passage and never invent a decision for a thread the transcript left open. Both go in Open Questions.
5. Wikilink only notes that exist. Search first.
6. Write plain prose per HUMAN_WRITING. No em dashes. No blank lines in the note.
## Before you start
Read these, in this order:
1. `30_Order/Workflows/Ingestion/Meeting Workflow.md`
2. `30_Order/Standards/Ingestion/Brief Standard.md`
3. `30_Order/Templates/Capability/Brief Template.md`
4. `references/example-brief.md` in this skill folder: what a finished brief looks like and why it works
## Steps
### Step 1: Locate the transcript
Use the argument if given, otherwise the active file, otherwise ask. Confirm the frontmatter is `type: input` and `input_kind: transcript`. If the text is pasted loose with no note, stop and create it first from `30_Order/Templates/Capability/Transcript Template.md` (Meeting Workflow step 1).
Glob the sibling `Briefs/` folder and grep for the transcript's name in `source_note`. If a brief exists, ask whether to update it or stop.
### Step 2: Gather context
Search the vault, never `50_Archive/`:
- The transcript's `related_progress` notes, especially the project's plan note.
- The mentor or person's profile note, if the transcript names them.
- The previous brief and action note in the same project, to match terms and see what is already known.
- Any note the speakers name (a project, a program, a rule).
### Step 3: Read the transcript in full
Read in chunks of about 400 lines. Keep a running list of three things: decisions, threads, and passages you cannot read confidently. Speaker labels may be unreliable; say so if they are.
### Step 4: Decide whether it earns a brief
A brief needs a decision or a thread worth keeping. If the call had neither, say so, set the transcript's `next` to that, and stop.
### Step 5: Propose before writing
Post a short plan in chat, then ask. Cover:
- The decisions you found, one line each.
- The threads in the order you think they mattered, and what you would skip.
- Where the transcript conflicts with what the vault already says. Record what was said and flag it; do not silently correct either side.
Ask only what is needed, in this order, and quote the exact fragment when asking:
1. Disambiguation: garbled passages or speaker confusion that would change what you write.
2. What mattered: propose your own read first ("X and Y look like the substance, Z a tangent. Right?").
3. Context the vault lacks: a person, project, or term the speakers assume.
Batch unrelated questions. Ask one at a time when answers could change each other. Wait for answers.
### Step 6: Draft the brief
Copy the Brief Template shape exactly: the three source lines, then the six `##` sections. Follow the per-heading rules in Brief Standard. File name is the transcript's name plus "Brief", saved in the sibling `Briefs/` folder, otherwise beside the transcript. Set frontmatter per Step 8.
### Step 7: Show it and revise
Show the user the decisions, the thread headings, and the Open Questions, and ask "What should change?" Patch by heading and repeat until they say it is done. Ask them directly about any item they might want to add: a decision you missed, a thread to cut, a follow-up.
### Step 8: Frontmatter and links
- Brief: `type: input`, `status: sprout`, `input_kind: brief`, `source_note` as a quoted wikilink to the transcript (filename only), `related_progress`, and `next` as the action note's wikilink if one will be made, otherwise `None` with the reason.
- Transcript: set `next` to the brief's wikilink and `status` to `sprout`. Touch nothing else.
### Step 9: Lint and log
Run `node 30_Order/System/vault-lint/vault-lint.js --path "<folder of the brief>"` and fix every failure for the brief. Append one line to `60_Claude/07_AI_Information/Session Logs/log.md`.
### Step 10: Report
Say where the brief is, how many Open Questions remain, and whether `/note-to-actions` is the next step.
## Quality bar
- The brief is not a second transcript. If Key Threads is as long as the source, compress it.
- Every decision carries a bold label. "Nothing was decided" is a valid answer.
- Follow-Up Actions are high level. The step-by-step breakdown belongs in the action note.
## Troubleshooting
**The transcript has speaker labels like "Them" and "You".** Treat them as reliable only if the user confirms it. Otherwise write from substance and say so in What This Was.
**The transcript runs past the meeting (another call at the end).** Do not cut it here. Tell the user; the cut is made in the transcript note and named on its Captured with line.
**Lint says missing-heading or missing-key.** Compare the note to the Brief Template. All six headings must be present, in order, with content.
**Lint says bad-wikilink on `source_note` or `next`.** The target note does not exist yet, or the link has a folder path. Use the filename only.
**The user wants the actions in the same pass.** Finish and lint the brief first, then run `/note-to-actions` on it.
