---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Codex config.toml duplicate key error"
started_at: 2026-10-07T15:09:45
ended_at: 2026-10-07T15:13:19
exported_at: 2026-10-28T16:15:10
duration_minutes: 3.6
project: Home
cwd: 'C:\Users\anant'
session_id: ba6b93b9-651f-451c-ab91-440bdb302edc
status: seed
review_state: raw
created: 2026-10-07
updated: 2026-10-28
turn_count: 3
tools_used:
  Bash: 1
  Edit: 1
  PowerShell: 1
  Read: 1
tokens:
  input: 8
  output: 1271
  cache_creation: 27232
  cache_read: 189002
  total: 217513
cost_usd: 0.140554
model:
  - "claude-sonnet-5-5"
files_touched:
  - "C:\\Users\\anant\\.codex\\config.toml"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Codex config.toml duplicate key error

## You

While trying to fix the codex configuration with codex, i accidentally broke codex, i was facing the issue provided in the image in the start and we began to fix it using codex cli inside jarvis for the task. But now you are have been moved to the main c directory in which .codex/ lives. You are quired to look through the config errors that are caused on codex and help me fix them completely: ```

<pasted_content id="a32f">
took 27s ❯ codex
Token usage: total=75,265 input=69,978 (+ 372,352 cached) output=5,287 (reasoning 1,998)
To continue this session, run:
  codex resume [REDACTED]
Or run codex resume and select Fix Codex configuration.
PS>codex resume [REDACTED]
Error: loading config.toml:
C:\Users\anant\.codex\config.toml:30:1: duplicate key
   |
30 | skill_search = false
   | ^^^^^^^^^^^^

░▒▓ 󰍲  …\Jarvis   infra/cross-laptop-sync ⇕ 
✗1 ❯ codex
Error: loading config.toml:
C:\Users\anant\.codex\config.toml:30:1: duplicate key
   |
30 | skill_search = false
</pasted_content id="a32f">

```. Here is the image: [Image #2]. Fix this issue

[image attached]

## You

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\C--Users-anant\[REDACTED]\images\2.png]

## Claude

Python isn't available for a TOML check, so I'll let codex validate the config itself.

Codex now loads `config.toml` without the duplicate-key error. I confirmed that by running `codex features list`, which read the config cleanly.

**The cause:** the `[features]` table in `C:\Users\anant\.codex\config.toml` set `skill_search` twice. Line 26 had `true` and line 30 had `false`. When you were fixing the daemon prompt, the repair added the explicit feature block, and that left the duplicate.

**What I changed:** I deleted the second line (`skill_search = false`) and kept `skill_search = true`. That matches the comment above it, "Search the vetted local skill catalog", which reads as deliberate. If you want it off, change line 26 to `false`.

**The "Background server has incompatible feature settings" prompt:** I made no change for this one. The explicit `[features]` block already has the four values the dialog lists:
- `api_key_model_discovery = true`
- `auth_elicitation = true`
- `code_mode_host = true`
- `mcp_oauth_refresh_coordination = false`

If the prompt still shows up, the daemon is probably still running with the old values. Choose "Restart with these settings" once. After that the daemon and new sessions agree and the prompt shouldn't come back. I haven't started an interactive `codex` session to check that.

I didn't see any other problems in the file. The rest of the TOML looks fine on a read-through, but I couldn't run a separate parse check because Python isn't installed here.

### Tool Calls

- `Read` -- `C:\Users\anant\.codex\config.toml`
- `Edit` -- `C:\Users\anant\.codex\config.toml`
```diff
- remote_plugin = false
- skill_search = false
- 
+ remote_plugin = false
+ 
```
- `Bash`
```bash
cd ~ && python -c "import tomllib;tomllib.load(open('.codex/config.toml','rb'));print('valid toml')" 2>&1 || py -c "import tomllib;tomllib.load(open('.codex/config.toml','rb'));print('valid toml')"; codex --version 2>&1 | head -3
```
```
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
/usr/bin/bash: line 1: py: command not found
codex-cli 0.161.0
```
- `PowerShell`
```powershell
codex features list 2>&1 | Select-Object -First 40
```
```
agent_message_board                      under development  false
analytics_plan_history                   experimental       false
api_key_cyber_access_programs            stable             false
api_key_model_discovery                  stable             true
apply_patch_freeform                     removed            false
apply_patch_preserve_line_endings        under development  false
apply_patch_streaming_events             under development  false
apps                                     stable             false
apps_mcp_path_override                   removed            false
artifact                                 under development  false
auth_elicitation                         stable             true
background_paginated_rollout_migration   under development  false
bedrock_setup_wizard                     under development  false
browser_annotation_api                   stable             true
browser_use                              stable             false
browser_use_external                     stable             false
browser_use_full_cdp_access              stable             true
chronicle                                under development  false
cli_daybreak                             under development  false
code_mode                                under development  false
code_mode_buffered_exec                  removed            false
code_mode_host                           stable             true
code_mode_interrupt                      under development  false
code_mode_only                           under development  false
code_mode_prewarm                        under development  false
[REDACTED]                under development  false
codex_git_commit                         removed            false
collaboration_modes                      removed            true
compaction_image_budget                  stable             true
computer_use                             stable             false
concurrent_reasoning_summaries           under development  false
content_item_kinds                       stable             true
context_management                       under development  false
current_time_reminder                    under development  false
cwd_relative_turn_diffs                  under development  false
daemon_auto_start                        stable             true
default_mode_request_user_input          under development  false
defer_mailbox_preemption                 under development  false
deferred_executor                        under development  false
deferred_tool_world_state                under development  false
```

## Actions Taken

**Files created:**
_None_

**Files modified:**
- `C:\Users\anant\.codex\config.toml`

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd ~ && python -c "import tomllib;tomllib.load(open('.codex/config.toml','rb'));print('valid toml')" 2>&1 || py -c "import tomllib;tomllib.load(open('.codex/config.toml','rb'));print('valid toml')"; codex --version 2>&1 | head -3`

