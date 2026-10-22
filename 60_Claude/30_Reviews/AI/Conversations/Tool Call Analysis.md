---
type: review
status: sprout
created: 2026-10-21
updated: 2026-10-21
tags:
  - review
  - audit
  - ai-tools
  - conversations
review_kind: audit
notes:
  - "[[20_Progress/Projects/AI Use/Conversations/Claude Code Session Source|Claude Code Session Source]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Export Conformance|Export Conformance]]"
  - "[[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|Conversation Loop Research Plan]]"
  - "[[60_Claude/30_Reviews/AI/Conversations/Conversation Loop Review|Conversation Loop Review]]"
  - "[[30_Order/Standards/AI Loop/Tool Calls|Tool Calls]]"
---
# Tool Call Analysis
## Summary
Tool calls are the richest thing a Claude Code session produces and the least recoverable from the notes. On the Acer's 122 raw transcripts there are 6,507 tool calls across 42 tools; shell commands are 40 percent of them, PowerShell fails 17 percent of the time, and skills, slash commands, and subagents are visible only in the raw transcripts. The exported notes keep a tool-name count per session and the command text inside the body, and nothing structured about commands, CLI tools, or errors. This is a first measurement to show what the research plan has to work with, not a finished analysis.
## Scope
Raw transcripts in `C:\Users\anant\.claude\projects\` on the Acer, top-level files only (122 sessions, about the last 30 days), counted by a script on 2026-10-21; no transcript text was copied. The exported notes' `tools_used` maps, across all 630 notes with overlaps. The term here is the Claude Code tool call, not the `30_Order` [[30_Order/Standards/AI Loop/Tool Calls|Tool Calls]] policy about which tool an agent should pick, and not the `Tool log.md` rows, which record skill and command use.
## Findings
### 1. The notes keep counts by tool name and nothing finer
`tools_used` in each note's frontmatter is a map of tool name to count. Summed over the archive, by track: Acer Windows 6,663, Acer WSL 1,281, Dell Windows 15,365, Dell WSL 18,441, legacy Windows 7,592 (duplicates counted). Whatever sits beneath a count, such as which command ran, with what result, on which file, is in the body as text.
### 2. Shell commands are 40 percent of all calls
| Tool | Calls | Errors | Error rate |
|---|---|---|---|
| Bash | 2,053 | 133 | 6.5% |
| Read | 1,624 | 26 | 1.6% |
| Edit | 835 | 29 | 3.5% |
| PowerShell | 550 | 94 | 17.1% |
| Write | 365 | 6 | 1.6% |
| Grep | 293 | 8 | 2.7% |
| Glob | 204 | 5 | 2.5% |
| Agent | 96 | n/a | n/a |
Overall 316 of 6,318 tool results were errors (5.0 percent). The error flag lives on the `tool_result` block and is in no note. PowerShell's rate is the outlier, and the cause is not known from counts alone.
### 3. Writes land mostly on markdown inside the vault
Of Write, Edit, and MultiEdit targets, `.md` is 902; the next extension is `.ps1` at 75. By folder inside the Jarvis vault: `20_Progress` 428, `30_Order` 145, `40_Resources` 132, `60_Claude` 43, `10_Areas` 15. Outside it: `C:/Users/anant` 112 (settings and home files), and the other tree on the same drive, `D:/_Anant/20_Progress/Documents/The Plan` 186 and `D:/_Anant/20_Progress/Projects/the-plan-dashboard` 68. So roughly 30 percent of the file writes in these sessions are not in Jarvis at all.
### 4. CLI tools can be tallied, but not by splitting on the first word
A rough pass over the shell commands (first word of each `&&`, `;`, `|` segment) gives, as real tools: `grep` 1,021, `head` 985, `git` 711, `ls` 596, `find` 508, `sed` 458, `cat` 377, `wc` 328, `node` 258, `tail` 234, `sort` 200, `wsl` 124. The same pass also counts `echo` 2,238, `cd` 1,439, `for`, `do`, `done`, `if`, `const`, `import`, `return`, `eof`, which are shell syntax and the text of heredoc scripts, not tools. A usable CLI-tool tally needs a real command parser. Git subcommands came out cleaner: `status` 179, `log` 129, `diff` 47, `show` 46, `ls-files` 43, `add` 33, `stash` 33, `commit` 22, `push` 12.
### 5. Skills, slash commands, subagents, and MCP calls exist only in the raw transcripts
- `Skill` tool: 9 calls (pdf 2, weekly-review 2, xlsx, schedule, copilot-web-fetch, mentorship, json-canvas).
- Slash commands from `<command-name>` tags: `/clear` 33, `/startday` 6, `/model` 6, `/weekly-review` 3, `/mcp` 3, `/compact` 2, `/config` 2.
- `Agent` calls: 96, by type: `fork` 41, `web-fetch` 25, `general-purpose` 11, `research-distiller` 5, `vault-curator` 4, `Explore` 3, `claude-code-guide` 3, `daily-operator` 2.
- MCP servers: `jarvis` 129 calls, `the-plan` 22, Google Calendar 6, Gmail 5, Context7 5, Drive 4.
Notes count `Agent` and MCP tool names in `tools_used` but drop slash-command turns and do not name the subagent type or the skill.
### 6. The tool vocabulary differs by source
Cursor notes use `Shell` (1,016) and `StrReplace` (593); Cowork notes use `mcp__workspace__bash` (822); `TaskCreate` and `TaskUpdate` appear 850 and 1,344 times in notes. Claude Code transcripts use `Bash`, `Edit`, and `PowerShell`. Any cross-platform analysis has to map these first.
### 7. Questions the current notes cannot answer
- Which CLI tools did I use most this month, and which commands failed?
- Which skill or subagent did the work in a given session?
- How many tool errors did a session have, and were they retries or dead ends?
- Which folders did a session change, as opposed to read?
- How long did each turn take? `turn_duration` is in the transcripts (320 entries) and in no note.
## Priority Queue
1. Fold these tallies into step 3 of [[20_Progress/Projects/AI Use/Conversations/Conversation Loop Research Plan|the research plan]] and mark each recoverable from the transcript, needs a hook, or lost. Answers findings 1, 4, 5, and 7.
2. Decide whether command-level and error-level detail belongs in the note, in a sidecar record, or only in the raw transcript. Answers findings 1 and 2. Owner decision after the research.
3. Find out why PowerShell fails 17 percent of the time. Answers finding 2.
## Open Questions
- [ ] Do the 316 errors include permission denials and user interrupts, or only tool failures?
- [ ] Are Cowork and Cursor tool names mappable to Claude Code's, or do they need their own vocabulary?
- [ ] Does the `Agent` count in `tools_used` include forks, or only named subagents?
