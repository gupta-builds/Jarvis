---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "session-wrapup.ps1 stop hook syntax errors"
started_at: 2026-09-06T18:59:25
ended_at: 2026-09-06T19:04:37
exported_at: 2026-09-07T11:30:03
duration_minutes: 5.2
project: Home
cwd: 'C:\Users\Anant Gupta'
session_id: a381cf32-364f-410f-93fb-d5d58de84a35
status: raw
turn_count: 2
tools_used:
  Bash: 7
  Edit: 4
  PowerShell: 2
  Read: 2
tokens:
  input: 48
  output: 35305
  cache_creation: 96160
  cache_read: 1662744
  total: 1794257
cost_usd: 1.070335
model:
  - "claude-sonnet-5"
files_touched:
  - "C:\\Users\\Anant Gupta\\.claude\\hooks\\after-edit-log.ps1"
  - "C:\\Users\\Anant Gupta\\.claude\\hooks\\session-wrapup.ps1"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# session-wrapup.ps1 stop hook syntax errors

## You

We have two stop hook errors that need to be fixed: ```
● Ran 2 stop hooks
  ⎿  Stop hook error: Failed with non-blocking status code: At C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1:19 char:111
  + ...  $today �?" run /second-brain-compress or vault /closeday when done."
  +                                                                         ~
  The string is missing the terminator: ".
  At C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1:18 char:36
  +     if (-not (Test-Path $logFile)) {
  +                                    ~
  Missing closing '}' in statement block or type definition.
  At C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1:7 char:5
  + try {
  +     ~
  Missing closing '}' in statement block or type definition.
  At C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1:26 char:1
  +
  The Try statement is missing its Catch or Finally block.
      + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException
      + FullyQualifiedErrorId : TerminatorExpectedAtEndOfString```. This was discovered in a session on the home directory and is not visible on jarvis for some reason. Might just be a stop hook error for this home directory sessions. Get a deeper look into these rrors and get to the root of the problem. After identifying the root cause, find a detailed solution to it and write exceptionally well hooks now. Look at the previous details provided by these hooks already being run. After that, make these hooks even better than before. Act as a superior being to modify these settings. Do not make mistakes, do not overdo the task. Your main goal is to fix the error that was just provided to you.

## Claude

Found the root cause. Both `session-wrapup.ps1` and `after-edit-log.ps1` contain em dashes (U+2014) saved as UTF-8 without a BOM. Windows PowerShell 5.1 (`powershell.exe`, invoked via the `Stop`/`PostToolUse` hook commands) doesn't auto-detect BOM-less UTF-8 — it decodes `.ps1` files using the system codepage, which mangles the em dash's multi-byte sequence. In `session-wrapup.ps1` line 19 that mangled byte lands inside a double-quoted string and gets misread as a stray quote, terminating the string early — a **parse-time** syntax error, which happens before the script's own `try/catch` (or even `$ErrorActionPreference`) ever runs, so nothing in the script itself could have caught it. `after-edit-log.ps1` has the same em dash issue but only inside `#` comments, so it silently parses fine — that's why only one of the two Stop hooks visibly errors.

Fixing it: replacing the em dashes with hyphens (which also satisfies your global "never use em dash" rule) removes the only non-ASCII bytes from both files, so the codepage/BOM mismatch can no longer bite regardless of which PowerShell reads them.

Now verify: confirm no non-ASCII bytes remain, and actually parse/run both scripts under Windows PowerShell 5.1 to prove the fix works.

Both hooks now parse and run cleanly under Windows PowerShell 5.1 (exit code 0, correct message output).

**Root cause:** Both `session-wrapup.ps1` and `after-edit-log.ps1` contained em dashes (U+2014), saved as UTF-8 *without a BOM*. The `Stop` and `PostToolUse` hooks invoke them via `powershell` (Windows PowerShell 5.1, `powershell.exe`), which — unlike PowerShell 7 (`pwsh`) — does not auto-detect BOM-less UTF-8 and instead decodes the file using the system's ANSI codepage. That mangles the em dash's 3-byte UTF-8 sequence. In `session-wrapup.ps1` the mangled bytes landed inside a double-quoted string (line 19) and were misread as a stray `"`, terminating the string early and cascading into the exact parse errors you saw (`missing terminator`, `Missing closing '}'`, `Try statement is missing its Catch`). Because this is a **parse-time** error, the script's own `try/catch`/`$ErrorActionPreference` never got a chance to run — no amount of internal error handling could have saved it.

`after-edit-log.ps1` had the same em dash, but only inside `#` comments, so it happened to parse fine — which is why only one hook visibly errored. This also explains why it wasn't visible on Jarvis: that machine likely runs the WSL/`pwsh` variant of these hooks, which defaults to UTF-8 and isn't affected.

**Fix applied:** replaced both em dashes with plain hyphens, making both files pure ASCII (verified with a byte scan) — this sidesteps the codepage/BOM issue entirely, regardless of which PowerShell or environment runs them, and also matches your global "no em dash" style rule. I added a short comment at the top of each explaining the ASCII-only constraint so it doesn't get reintroduced later. Verified both scripts now execute successfully end-to-end under Windows PowerShell 5.1.

### Tool Calls

- `Read` -- `C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1`
- `Bash` -- `file "C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1" 2>/dev/null; echo "---"; xxd "C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1" | sed -n '1,5p'; echo "---line19---"; sed -n '19p' "C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1" | xxd | head -20`
```
C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1: Unicode text, UTF-8 text
---
00000000: 2320 7365 7373 696f 6e2d 7772 6170 7570  # session-wrapup
00000010: 2e70 7331 0a23 2050 7269 6e74 7320 6120  .ps1.# Prints a 
00000020: 6f6e 652d 6c69 6e65 2072 656d 696e 6465  one-line reminde
00000030: 7220 746f 206c 6f67 2074 6865 2073 6573  r to log the ses
00000040: 7369 6f6e 2069 6620 6e6f 206c 6f67 2065  sion if no log e
---line19---
00000000: 2020 2020 2020 2020 5772 6974 652d 486f          Write-Ho
00000010: 7374 2022 5b20 7365 7373 696f 6e20 5d20  st "[ session ] 
00000020: 4e6f 206c 6f67 2066 6f72 2024 746f 6461  No log for $toda
00000030: 7920 e280 9420 7275 6e20 2f73 6563 6f6e  y ... run /secon
00000040: 642d 6272 6169 6e2d 636f 6d70 7265 7373  d-brain-compress
00000050: 206f 7220 7661 756c 7420 2f63 6c6f 7365   or vault /close
00000060: 6461 7920 7768 656e 2064 6f6e 652e 220a  day when done.".
```
- `Bash` -- `ls -la "C:\Users\Anant Gupta\.claude\hooks\" 2>/dev/null`
```
Exit code 2
/usr/bin/bash: eval: line 1: unexpected EOF while looking for matching `"'
```
- `Bash` -- `ls "C:\Users\Anant Gupta\.claude\hooks\" 2>/dev/null`
```
Exit code 2
/usr/bin/bash: eval: line 1: unexpected EOF while looking for matching `"'
```
- `Bash` -- `cat "C:\Users\Anant Gupta\.claude\settings.json" 2>/dev/null`
```
{
  "agentPushNotifEnabled": true,
  "autoMode": {
    "environment": [
      "### Org-wide",
      "**Organization**: None configured",
      "**Cloud provider(s)**: None configured",
      "**Repository visibility**: assume private unless the remote host and repo name indicate otherwise, or a visibility check in the transcript shows public — no remotes configured for this repo",
      "**Internal sharing / snippet hosting**: None configured — treat public paste/gist services as outside the trust boundary",
      "**Secrets management**: None configured",
      "**Default / protected branches**: not queryable (no remotes; org/repo not derivable)",
      "**CI/CD deploy targets**: None configured",
      "**Network posture**: None configured",
      "**Source control**: The trusted repo and its remote(s) only (no additional orgs configured) — no remotes are configured for this repo",
      "**Trusted internal domains**: None configured",
      "**Trusted cloud buckets**: None configured",
      "**Key internal services**: None configured",
      "**Internal package registry**: None configured",
      "**Sensitive data locations & audiences**: any file or store holding personal data, confidential business data, credentials, regulated data, or similarly sensitive material; preserve exact handles when known and share only with audiences cleared at the [named+specifics] bar — note sensitive-looking paths found on this machine: .claude/.credentials.json, .config/merget/secrets.toml, AppData/Local/hermes/.env, AppData/Roaming/firecrawl-cli/credentials.json, AppData/Roaming/jupyter/notebook_secret, miniconda3/Lib/secrets.py (and its compiled .pyc)",
      "**Data retention / declassification**: None configured",
      "**Sensitive remote targets**: any namespace, host, or container whose name carries `prod` or `production` as a whole word or name segment (hyphen/underscore/dot-delimited — e.g. matches `prod-db`, not `producer`)",
      "**Protected deployment namespaces / environments**: None configured — fall back to the Sensitive remote targets heuristic",
      "**Protected IaC scopes**: IAM, RBAC, networking, quota, and node-pool resources; anything whose name or tag carries `prod` or `production` as a whole word or name segment",
      "### User-specific",
      "**Primary use of Claude Code**: software development, plus a personal/hobby knowledge-management workflow (Jarvis vault session-export skill, local scripting)",
      "**Trusted repo**: The git repository the agent started in (its working directory) and its configured remote(s) — this repo currently has 0 tracked files and no remotes configured, so no additional trust can be extended beyond the local working directory itself",
      "**Org-specific CLIs**: None configured — frequently used non-standard/local CLIs observed: wsl, cmd, ollama, claude, javac, java, conda, openclaw, ocaml, codex, kiro, docker, cursor, gh, opam, jupyter, ocamllsp"
    ]
  },
  "enabledPlugins": {
    "merget@merget": true
  },
  "extraKnownMarketplaces": {
    "merget": {
      "source": {
        "path": "C:\\Users\\Anant Gupta\\.merget\\plugins\\claude",
        "source": "directory"
      }
    }
  },
  "hooks": {
    "FileChanged": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event FileChanged",
            "type": "command"
          }
        ]
      }
    ],
    "Notification": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event Notification",
            "type": "command"
          }
        ]
      }
    ],
    "PermissionRequest": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event PermissionRequest",
            "type": "command"
          }
        ]
      }
    ],
    "PostToolBatch": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event PostToolBatch",
            "type": "command"
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "hooks": [
          {
            "command": "powershell -NoProfile -ExecutionPolicy Bypass -File \"C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1\"",
            "type": "command"
          }
        ],
        "matcher": "Write|Edit|MultiEdit"
      },
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event PostToolUse",
            "type": "command"
          }
        ]
      }
    ],
    "PostToolUseFailure": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event PostToolUseFailure",
            "type": "command"
          }
        ]
      }
    ],
    "PreCompact": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event PreCompact",
            "type": "command"
          }
        ]
      }
    ],
    "PreToolUse": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event PreToolUse",
            "type": "command"
          }
        ]
      }
    ],
    "SessionEnd": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event SessionEnd",
            "type": "command"
          }
        ]
      }
    ],
    "SessionStart": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event SessionStart",
            "type": "command"
          }
        ]
      }
    ],
    "Stop": [
      {
        "hooks": [
          {
            "command": "powershell -NoProfile -ExecutionPolicy Bypass -File \"C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1\"",
            "type": "command"
          }
        ]
      },
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event Stop",
            "type": "command"
          }
        ]
      }
    ],
    "StopFailure": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event StopFailure",
            "type": "command"
          }
        ]
      }
    ],
    "SubagentStart": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event SubagentStart",
            "type": "command"
          }
        ]
      }
    ],
    "SubagentStop": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event SubagentStop",
            "type": "command"
          }
        ]
      }
    ],
    "UserPromptSubmit": [
      {
        "hooks": [
          {
            "command": "\"C:/Users/Anant Gupta/.merget/bin/merget-hooks.exe\" record --agent claude --event UserPromptSubmit",
            "type": "command"
          }
        ]
      }
    ]
  },
  "inputNeededNotifEnabled": true,
  "model": "sonnet",
  "statusLine": {
    "command": "\"C:/Program Files/Git/bin/bash.exe\" ~/.claude/statusline.sh",
    "padding": 0,
    "refreshInterval": 30,
    "type": "command"
  }
}
```
- `Read` -- `C:\Users\Anant Gupta\.claude\hooks\after-edit-log.ps1`
- `Bash` -- `for f in "C:/Users/Anant Gupta/.claude/hooks/"*.ps1; do echo "== $f =="; LC_ALL=C grep -nP '[^\x00-\x7F]' "$f" || echo "  (all ASCII)"; done`
```
== C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1 ==
grep: -P supports only unibyte and UTF-8 locales
  (all ASCII)
== C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1 ==
grep: -P supports only unibyte and UTF-8 locales
  (all ASCII)
```
- `Bash` -- `python3 -c "
import sys
for f in ['C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1', 'C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1']:
    print('==', f, '==')
    with open(f, 'rb') as fh:
        data = fh.read()
    print('BOM:', data[:3] == b'\xef\xbb\xbf')
    for i, line in enumerate(data.decode('utf-8').splitlines(), 1):
        for ch in line:
            if ord(ch) > 127:
                print(f'  line {i}: U+{ord(ch):04X} {ch!r} -> {line!r}')
" 2>&1 || py -3 -c "
for f in ['C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1', 'C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1']:
    print('==', f, '==')
    with open(f, 'rb') as fh:
        data = fh.read()
    print('BOM:', data[:3] == b'\xef\xbb\xbf')
    for i, line in enumerate(data.decode('utf-8').splitlines(), 1):
        for ch in line:
            if ord(ch) > 127:
                print(f'  line {i}: U+{ord(ch):04X} {ch!r} -> {line!r}')
"
`
```
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
== C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1 ==
BOM: False
  line 3: U+2014 '�' -> '# PostToolUse hook � must NEVER exit non-zero, it is logging-only'
  line 38: U+2014 '�' -> '    # Silently swallow all errors � never block a turn'
== C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1 ==
BOM: False
  line 3: U+2014 '�' -> '# Stop hook � must NEVER exit non-zero'
  line 19: U+2014 '�' -> '        Write-Host "[ session ] No log for $today � run /second-brain-compress or vault /closeday when done."'
```
- `Edit` -- `C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1`
```diff
- # Stop hook — must NEVER exit non-zero
+ # Stop hook - must NEVER exit non-zero
# ASCII-only file: Windows PowerShell 5.1 (powershell.exe) reads BOM-less
# .ps1 files using the system codepage, not UTF-8, so any non-ASCII
# character here (em dashes included) can corrupt into a stray quote and
# cause a parse-time syntax error that no try/catch in this file can catch.
```
- `Edit` -- `C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1`
```diff
-         Write-Host "[ session ] No log for $today — run /second-brain-compress or vault /closeday when done."
+         Write-Host "[ session ] No log for $today - run /second-brain-compress or vault /closeday when done."
```
- `Edit` -- `C:\Users\Anant Gupta\.claude\hooks\after-edit-log.ps1`
```diff
- # PostToolUse hook — must NEVER exit non-zero, it is logging-only
+ # PostToolUse hook - must NEVER exit non-zero, it is logging-only
# ASCII-only file: Windows PowerShell 5.1 (powershell.exe) reads BOM-less
# .ps1 files using the system codepage, not UTF-8, so any non-ASCII
# character here (em dashes included) can corrupt into a stray quote and
# cause a parse-time syntax error that no try/catch in this file can catch.
```
- `Edit` -- `C:\Users\Anant Gupta\.claude\hooks\after-edit-log.ps1`
```diff
-     # Silently swallow all errors — never block a turn
+     # Silently swallow all errors - never block a turn
```
- `Bash` -- `python3 --version 2>/dev/null
for f in "C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1" "C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1"; do
  echo "== $f =="
  if LC_ALL=en_US.UTF-8 grep -nP '[^\x00-\x7F]' "$f" 2>/dev/null; then
    echo "  NON-ASCII FOUND ^^^"
  else
    echo "  clean (all ASCII)"
  fi
done`
```
== C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1 ==
  clean (all ASCII)
== C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1 ==
  clean (all ASCII)
```
- `PowerShell` -- `{"command":"\u0026 powershell -NoProfile -ExecutionPolicy Bypass -File \"C:\\Users\\Anant Gupta\\.claude\\hooks\\session-wrapup.ps1\"; Write-Output \"EXIT CODE: $LASTEXITCODE\"","description":"Run session-wrapup.ps1 under Windows PowerShell 5.1 to confirm it now parses and runs"}`
- `PowerShell` -- `{"command":"$json = \u0027{\"tool_input\":{\"file_path\":\"C:\\\\test\\\\example.txt\"}}\u0027\n$json | \u0026 powershell -NoProfile -ExecutionPolicy Bypass -File \"C:\\Users\\Anant Gupta\\.claude\\hooks\\after-edit-log.ps1\"\nWrite-Output \"EXIT CODE: $LASTEXITCODE\"","description":"Run after-edit-log.ps1 under Windows PowerShell 5.1 with sample stdin to confirm it parses and runs"}`

## Actions Taken

**Files created:**
_None_

**Files modified:**
- `C:\Users\Anant Gupta\.claude\hooks\after-edit-log.ps1`
- `C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1`

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `file "C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1" 2>/dev/null; echo "---"; xxd "C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1" | sed -n '1,5p'; echo "---line19---"; sed -n '19p' "C:\Users\Anant Gupta\.claude\hooks\session-wrapup.ps1" | xxd | head -20`
- `ls -la "C:\Users\Anant Gupta\.claude\hooks\" 2>/dev/null`
- `ls "C:\Users\Anant Gupta\.claude\hooks\" 2>/dev/null`
- `cat "C:\Users\Anant Gupta\.claude\settings.json" 2>/dev/null`
- `for f in "C:/Users/Anant Gupta/.claude/hooks/"*.ps1; do echo "== $f =="; LC_ALL=C grep -nP '[^\x00-\x7F]' "$f" || echo "  (all ASCII)"; done`
- `python3 -c "
import sys
for f in ['C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1', 'C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1']:
    print('==', f, '==')
    with open(f, 'rb') as fh:
        data = fh.read()
    print('BOM:', data[:3] == b'\xef\xbb\xbf')
    for i, line in enumerate(data.decode('utf-8').splitlines(), 1):
        for ch in line:
            if ord(ch) > 127:
                print(f'  line {i}: U+{ord(ch):04X} {ch!r} -> {line!r}')
" 2>&1 || py -3 -c "
for f in ['C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1', 'C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1']:
    print('==', f, '==')
    with open(f, 'rb') as fh:
        data = fh.read()
    print('BOM:', data[:3] == b'\xef\xbb\xbf')
    for i, line in enumerate(data.decode('utf-8').splitlines(), 1):
        for ch in line:
            if ord(ch) > 127:
                print(f'  line {i}: U+{ord(ch):04X} {ch!r} -> {line!r}')
"
`
- `python3 --version 2>/dev/null
for f in "C:/Users/Anant Gupta/.claude/hooks/after-edit-log.ps1" "C:/Users/Anant Gupta/.claude/hooks/session-wrapup.ps1"; do
  echo "== $f =="
  if LC_ALL=en_US.UTF-8 grep -nP '[^\x00-\x7F]' "$f" 2>/dev/null; then
    echo "  NON-ASCII FOUND ^^^"
  else
    echo "  clean (all ASCII)"
  fi
done`


