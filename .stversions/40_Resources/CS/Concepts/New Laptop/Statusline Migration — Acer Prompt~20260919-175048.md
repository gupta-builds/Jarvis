---
type: input
status: seed
created: 2026-09-19
course: Life
track:
  - laptop
prerequisites:
  - "[[Installations]]"
  - "[[Acer Live State — 2026-09-16]]"
related:
  - "[[Installations]]"
  - "[[Acer Live State — 2026-09-16]]"
tags:
  - input
---
# Statusline Migration — Acer Prompt
## Why this note exists
The Dell's Claude Code `/statusline` was perfected in a 2026-09-19 session: fixed the cold-start bug (usage bars showed blank placeholders on a freshly opened terminal instead of last-known-real numbers), added a persistent rate-limit cache, and added a Tokyo Night Storm truecolor tier that matches the Acer's real Starship/Yazi theme. This note is the exact, self-contained prompt to paste into a **new Claude Code session running on the Acer** to install the same, finished config there. Copy it from this note's code fence - it isn't repeated in chat.
## Prompt
````text
Install a Claude Code statusline on this machine. This is a finished, already-tested config being migrated from another machine - your job is to install it exactly as given, verify it works on this machine's actual setup, and report back. Do not redesign it, do not add features, do not "improve" the approach - the design decisions below are already made and tested.

Context you need:

- This machine (an Acer laptop) runs Claude Code inside WSL (Ubuntu 24.04), inside tmux, inside WezTerm. The terminal's appearance - WezTerm's theme/font, Starship's Tokyo Night prompt config, tmux's config - is already finished and explicitly not to be touched by this task. Starship's config is real and already built against the Tokyo Night Storm palette; the statusline script below uses that exact same published palette so it visually matches.
- The statusline script auto-detects true-color support via $COLORTERM/$TERM and only uses the Tokyo Night colors when that's actually available, falling back to plain 16-color ANSI otherwise - so it can't visually break even if truecolor isn't wired all the way through tmux.
- `jq` must be present (`jq --version`). If missing, install it (`sudo apt install -y jq` on this Ubuntu setup) before proceeding - the whole script depends on it.

Do exactly this:

1. Create `~/.claude/statusline.sh` with EXACTLY the content in the fenced bash block below - byte for byte, no edits, no reformatting. Make it executable (`chmod +x ~/.claude/statusline.sh`).

2. Open `~/.claude/settings.json`. If a `"statusLine"` key already exists, replace only that key with the block below - do not touch any other key in the file. If the file doesn't have a `"statusLine"` key yet, add it at the top level. If `~/.claude/settings.json` doesn't exist at all, create it containing only this key:

```json
"statusLine": {
  "command": "bash ~/.claude/statusline.sh",
  "padding": 0,
  "refreshInterval": 30,
  "type": "command"
}
```

(Use `bash ~/.claude/statusline.sh`, not a Windows Git-Bash path - this machine runs the script from native WSL bash.)

3. Verify, in this order, and show me the actual output of each step - don't just say it worked:
   a. `bash -n ~/.claude/statusline.sh` - must print nothing (clean syntax).
   b. `echo $COLORTERM; echo $TERM` - tell me whether this indicates truecolor is available in the current shell. If `$COLORTERM` is not `truecolor`/`24bit` and `$TERM` doesn't end in `-truecolor`/`-direct`, the script will safely use the plain-ANSI fallback tier instead of the Tokyo Night colors - tell me plainly which tier is actually active, don't assume.
   c. Build a synthetic JSON fixture that matches this machine's real Claude Code project directory and a real transcript file under `~/.claude/projects/`, and pipe it through the script to confirm real output renders (folder, branch, model, context bar, token counts, 5h/7d bars, memory line). Then build a second fixture with `rate_limits` fully omitted to confirm the cold-start path shows either "warming up" (no prior cache) or a "(cached ...)" line if a real cache file already exists at `~/.claude/.statusline-ratelimit-cache.json` - don't fabricate rate_limit numbers, use whatever this account's real Claude Code session actually produces.
   d. Open an actual new Claude Code session in this project afterward and confirm the statusline renders in the real UI, not just when piped manually.
4. Tell me explicitly whether tmux is passing truecolor through to Claude Code's statusline (based on step 3b run *inside* an active tmux pane, not outside one). If it isn't, name the exact tmux config line needed (`set -ga terminal-overrides ",xterm-256color:Tc"` or whatever the real running terminal type requires) but do NOT edit tmux's config yourself - report it as a finding, since tmux's config here is a finished, settled setup that this task is explicitly not allowed to touch.
5. Report back: syntax check result, which color tier is active outside tmux and inside tmux, whether a live session's statusline actually renders correctly, and the exact tmux fix (if any) needed for truecolor - as a finding only, not applied.

The statusline script to install:

```bash
#!/usr/bin/env bash
# Claude Code status line: folder | git branch | model | context bar | tokens burnt
# then a merged 5-hour usage+rolling-timeline line, a 7-day weekly line, and a
# per-project memory-store summary line.
# Reads session JSON from stdin (see Claude Code statusLine docs). Dependency: jq.
#
# All rate-limit math reads rate_limits.*.used_percentage / resets_at directly -
# the same numbers the Claude app's own usage page reads - with no client-side
# recalculation, so the percentages here can never drift from the app.
#
# The tokens segment shows two numbers: the cumulative total burnt this session
# (summed across every model call in transcript_path, since context_window only
# reports the *live* window, not a running total) and, in parentheses, the live
# context window's absolute token count against its actual per-model ceiling
# (context_window.total_input_tokens / context_window.context_window_size - the
# exact numerator/denominator Claude Code itself divides to get used_percentage,
# so this can't drift from the ctx bar or the app either).
#
# The memory line reads <project-dir>/memory/ (sibling of the transcript files)
# - Claude Code's per-project persistent memory store - and reports how many
# notes it holds, their combined size, and how long ago the most recent one was
# touched. It is per *project*, not per conversation: every session opened in
# this same project directory shares one memory store.
#
# Cold-start fix: Claude Code doesn't send rate_limits (5h/7d) until after the
# first API turn, so a freshly opened terminal has nothing real to show yet.
# Every time live rate_limits arrive, they're persisted to
# ~/.claude/.statusline-ratelimit-cache.json; on a cold render with no live
# data, that cache is read back and shown (marked "cached Xm ago") as long as
# its resets_at hasn't already passed - so a new session shows last-known-real
# usage immediately instead of a blank placeholder, and self-corrects the
# moment live data lands. If the cached window has already rolled over, the
# number would be a guess, not a fact, so it's dropped back to "warming up".
#
# Color tier: this same script runs both here (plain Git Bash, no truecolor)
# and inside the Acer's WezTerm+tmux+Starship Tokyo Night setup. It detects
# 24-bit color support via $COLORTERM/$TERM and uses the real Tokyo Night
# Storm palette when available, falling back to plain 16-color ANSI everywhere
# else - so it never looks broken on a terminal that can't render truecolor.

input=$(cat)

# --- color tier detection: real Tokyo Night Storm truecolor where supported,
# safe 16-color ANSI fallback everywhere else (never assume, never break) ---
truecolor=0
case "${COLORTERM:-}" in
  truecolor|24bit) truecolor=1 ;;
esac
if [ "$truecolor" -eq 0 ]; then
  case "${TERM:-}" in
    *-truecolor|*-direct) truecolor=1 ;;
  esac
fi

RESET=$'\033[0m'
BOLD=$'\033[1m'
if [ "$truecolor" -eq 1 ]; then
  # Tokyo Night Storm (folke/tokyonight.nvim terminal palette) - matches the
  # Acer's real Starship/Yazi config, which is built against this same theme.
  CYAN=$'\033[38;2;125;207;255m'    # #7dcfff
  MAGENTA=$'\033[38;2;187;154;247m' # #bb9af7
  BLUE=$'\033[38;2;122;162;247m'    # #7aa2f7
  GREEN=$'\033[38;2;158;206;106m'   # #9ece6a
  YELLOW=$'\033[38;2;224;175;104m'  # #e0af68
  RED=$'\033[38;2;247;118;142m'     # #f7768e
  GRAY=$'\033[38;2;86;95;137m'      # #565f89 (Tokyo Night's own comment gray)
else
  CYAN=$'\033[36m'
  MAGENTA=$'\033[35m'
  BLUE=$'\033[34m'
  GREEN=$'\033[32m'
  YELLOW=$'\033[33m'
  RED=$'\033[31m'
  GRAY=$'\033[90m'
fi

# --- extract fields from stdin JSON ---
cwd=$(printf '%s' "$input" | jq -r '.workspace.current_dir // .cwd // empty' 2>/dev/null)
[ -z "$cwd" ] && cwd="$PWD"
folder=$(basename "${cwd//\\//}")

model=$(printf '%s' "$input" | jq -r '.model.display_name // .model.id // "unknown"' 2>/dev/null)
[ -z "$model" ] && model="unknown"

ctx_pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // empty' 2>/dev/null)
ctx_live=$(printf '%s' "$input" | jq -r '.context_window.total_input_tokens // empty' 2>/dev/null)
ctx_size=$(printf '%s' "$input" | jq -r '.context_window.context_window_size // empty' 2>/dev/null)
five_pct=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty' 2>/dev/null)
five_reset=$(printf '%s' "$input" | jq -r '.rate_limits.five_hour.resets_at // empty' 2>/dev/null)
week_pct=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty' 2>/dev/null)
week_reset=$(printf '%s' "$input" | jq -r '.rate_limits.seven_day.resets_at // empty' 2>/dev/null)
session_id=$(printf '%s' "$input" | jq -r '.session_id // empty' 2>/dev/null)
transcript_path=$(printf '%s' "$input" | jq -r '.transcript_path // empty' 2>/dev/null)

# --- git branch (fast, never hangs, silent outside a repo) ---
branch=""
if git -C "$cwd" --no-optional-locks rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  branch=$(git -C "$cwd" --no-optional-locks branch --show-current 2>/dev/null)
  if [ -z "$branch" ]; then
    branch=$(git -C "$cwd" --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    [ -n "$branch" ] && branch="detached:${branch}"
  fi
fi

# --- helpers ---
bar_width=10

# builds a two-tone bar: $1 filled count, $2 width, $3 fill-char, $4 empty-char
render_bar() {
  local filled=$1 width=$2 fillchar=$3 emptychar=$4 i bar=""
  [ "$filled" -gt "$width" ] && filled=$width
  [ "$filled" -lt 0 ] && filled=0
  local empty=$((width - filled))
  for ((i = 0; i < filled; i++)); do bar="${bar}${fillchar}"; done
  for ((i = 0; i < empty; i++)); do bar="${bar}${emptychar}"; done
  printf '%s' "$bar"
}

# thresholds shared by ctx/5h/7d usage bars
color_for_pct() {
  local pct=$1
  if [ "$pct" -ge 70 ]; then printf '%s' "$RED"
  elif [ "$pct" -ge 40 ]; then printf '%s' "$YELLOW"
  else printf '%s' "$GREEN"
  fi
}

# seconds -> "Xd Yh" / "Xh Ym" / "Xm" (always hour+minute granularity, never bare seconds)
fmt_duration() {
  local s=$1
  [ "$s" -lt 0 ] && s=0
  local d=$((s / 86400))
  local h=$(((s % 86400) / 3600))
  local m=$(((s % 3600) / 60))
  if [ "$d" -gt 0 ]; then
    printf '%dd %dh' "$d" "$h"
  elif [ "$h" -gt 0 ]; then
    printf '%dh %dm' "$h" "$m"
  else
    printf '%dm' "$m"
  fi
}

# tokens (int) -> "1M" / "23.9M" / "235.6K" / "42" (no trailing .0 on whole units)
fmt_tokens() {
  local n=$1
  if [ "$n" -ge 1000000 ]; then
    awk -v n="$n" 'BEGIN{v=n/1000000; if (v==int(v)) printf "%dM", v; else printf "%.1fM", v}' 2>/dev/null || printf '%dM' $((n / 1000000))
  elif [ "$n" -ge 1000 ]; then
    awk -v n="$n" 'BEGIN{v=n/1000; if (v==int(v)) printf "%dK", v; else printf "%.1fK", v}' 2>/dev/null || printf '%dK' $((n / 1000))
  else
    printf '%d' "$n"
  fi
}

# bytes (int) -> "42.6KB" / "1.2MB" / "512B"
fmt_bytes() {
  local b=$1
  if [ "$b" -ge 1048576 ]; then
    awk -v n="$b" 'BEGIN{v=n/1048576; if (v==int(v)) printf "%dMB", v; else printf "%.1fMB", v}' 2>/dev/null || printf '%dMB' $((b / 1048576))
  elif [ "$b" -ge 1024 ]; then
    awk -v n="$b" 'BEGIN{v=n/1024; if (v==int(v)) printf "%dKB", v; else printf "%.1fKB", v}' 2>/dev/null || printf '%dKB' $((b / 1024))
  else
    printf '%dB' "$b"
  fi
}

now=$(date +%s)

# --- persistent rate-limit cache (account-wide, survives closing the
# terminal) so a cold session can show last-known-real usage instead of a
# blank placeholder; see header comment for the full rationale ---
ratelimit_cache="$HOME/.claude/.statusline-ratelimit-cache.json"

cache_five_pct="" cache_five_reset="" cache_week_pct="" cache_week_reset="" cache_cached_at=""
if [ -f "$ratelimit_cache" ]; then
  cache_five_pct=$(jq -r '.five_pct // empty' "$ratelimit_cache" 2>/dev/null)
  cache_five_reset=$(jq -r '.five_reset // empty' "$ratelimit_cache" 2>/dev/null)
  cache_week_pct=$(jq -r '.week_pct // empty' "$ratelimit_cache" 2>/dev/null)
  cache_week_reset=$(jq -r '.week_reset // empty' "$ratelimit_cache" 2>/dev/null)
  cache_cached_at=$(jq -r '.cached_at // empty' "$ratelimit_cache" 2>/dev/null)
fi
cache_age=""
if [ -n "$cache_cached_at" ] && [ "$cache_cached_at" != "null" ]; then
  cache_age_s=$((now - cache_cached_at))
  if [ "$cache_age_s" -lt 60 ] 2>/dev/null; then
    cache_age="just now"
  else
    cache_age="$(fmt_duration "$cache_age_s") ago"
  fi
fi

# live data always wins and refreshes the cache; a corrupt/unreadable cache
# file is simply ignored, never fatal
if [ -n "$five_pct" ] && [ "$five_pct" != "null" ]; then
  mkdir -p "$(dirname "$ratelimit_cache")" 2>/dev/null
  tmp_cache="${ratelimit_cache}.tmp.$$"
  if jq -n \
    --arg five_pct "$five_pct" --arg five_reset "$five_reset" \
    --arg week_pct "$week_pct" --arg week_reset "$week_reset" \
    --arg cached_at "$now" \
    '{five_pct: ($five_pct|tonumber? // null),
      five_reset: ($five_reset|tonumber? // null),
      week_pct: ($week_pct|tonumber? // null),
      week_reset: ($week_reset|tonumber? // null),
      cached_at: ($cached_at|tonumber)}' >"$tmp_cache" 2>/dev/null; then
    mv -f "$tmp_cache" "$ratelimit_cache" 2>/dev/null
  else
    rm -f "$tmp_cache" 2>/dev/null
  fi
elif [ -n "$cache_five_reset" ] && [ "$cache_five_reset" != "null" ]; then
  # no live data this render - fall back to cache, but only while the cached
  # window is still the current one (its resets_at hasn't passed); once it
  # has, the real number is unknowable until the next live response, so don't
  # guess
  if awk -v r="$cache_five_reset" -v n="$now" 'BEGIN{exit !(r > n)}'; then
    five_pct="$cache_five_pct"
    five_reset="$cache_five_reset"
    five_is_cached=1
  fi
  if [ -n "$cache_week_reset" ] && [ "$cache_week_reset" != "null" ] && \
     awk -v r="$cache_week_reset" -v n="$now" 'BEGIN{exit !(r > n)}'; then
    week_pct="$cache_week_pct"
    week_reset="$cache_week_reset"
    week_is_cached=1
  fi
fi

# --- context usage progress bar (freshest number in the whole status line:
# Claude Code recomputes context_window from the live token count on every new
# assistant message, so this always reflects the last prompt/response exactly) ---
if [ -n "$ctx_pct" ] && [ "$ctx_pct" != "null" ]; then
  pct_int=$(printf '%.0f' "$ctx_pct" 2>/dev/null || echo 0)
  [ "$pct_int" -lt 0 ] 2>/dev/null && pct_int=0
  [ "$pct_int" -gt 100 ] 2>/dev/null && pct_int=100

  bar_color=$(color_for_pct "$pct_int")
  filled=$((pct_int * bar_width / 100))
  bar=$(render_bar "$filled" "$bar_width" "#" "-")

  ctx_str="${GRAY}ctx${RESET} ${bar_color}[${bar}] ${pct_int}%${RESET}"
  [ "$pct_int" -ge 70 ] && ctx_str="${ctx_str} ${RED}${BOLD}!${RESET}"
else
  # A session with no context_window data yet is a session that genuinely has
  # zero context (nothing sent/received) - an empty bar is the correct value
  # here, not a placeholder, so show it as real 0% rather than "no data yet".
  empty_bar=$(render_bar 0 "$bar_width" "#" "-")
  ctx_str="${GRAY}ctx${RESET} ${GREEN}[${empty_bar}] 0%${RESET}"
fi

# live/max absolute token counts - the same numerator/denominator Claude Code
# itself divides to produce context_window.used_percentage above
live_fmt=""
if [ -n "$ctx_live" ] && [ "$ctx_live" != "null" ] && [ -n "$ctx_size" ] && [ "$ctx_size" != "null" ]; then
  live_fmt=$(fmt_tokens "$(printf '%.0f' "$ctx_live" 2>/dev/null || echo 0)")
  max_fmt=$(fmt_tokens "$(printf '%.0f' "$ctx_size" 2>/dev/null || echo 0)")
fi

# --- cumulative tokens burnt this session (summed across every model call in
# the transcript), cached until the transcript file actually grows ---
cum_total=""
if [ -n "$transcript_path" ] && [ -f "$transcript_path" ] && [ -n "$session_id" ]; then
  cache_dir="${TMPDIR:-/tmp}/claude-statusline-tokens"
  mkdir -p "$cache_dir" 2>/dev/null
  cache_file="$cache_dir/${session_id}.total"

  src_mtime=$(stat -c %Y "$transcript_path" 2>/dev/null || stat -f %m "$transcript_path" 2>/dev/null || echo 0)
  cache_mtime=0
  [ -f "$cache_file" ] && cache_mtime=$(stat -c %Y "$cache_file" 2>/dev/null || stat -f %m "$cache_file" 2>/dev/null || echo 0)

  if [ "$src_mtime" -gt "$cache_mtime" ] 2>/dev/null || [ ! -s "$cache_file" ]; then
    jq -r -s '
      [ .[] | select(.type=="assistant" and .message.usage != null)
        | ((.message.usage.input_tokens // 0)
         + (.message.usage.output_tokens // 0)
         + (.message.usage.cache_creation_input_tokens // 0)
         + (.message.usage.cache_read_input_tokens // 0)) ]
      | add // 0
    ' "$transcript_path" 2>/dev/null | tr -d '\r' > "$cache_file"
  fi

  cum_total=$(cat "$cache_file" 2>/dev/null)
  cum_total=${cum_total%$'\r'}
fi
[ -z "$cum_total" ] && cum_total=0

tokens_str=""
if [ "$cum_total" != "0" ] || [ -n "$live_fmt" ]; then
  cum_fmt=$(fmt_tokens "$cum_total")
  tokens_str="${GRAY}${cum_fmt}${RESET}"
  [ -n "$live_fmt" ] && tokens_str="${tokens_str} ${GRAY}(${live_fmt}/${max_fmt}) tokens${RESET}"
fi

# --- per-project memory store summary (Claude Code's persistent memory files,
# living at <project-dir>/memory/ next to the session transcripts - shared by
# every session opened in this same project, not scoped to just this one) ---
mem_str=""
if [ -n "$transcript_path" ]; then
  memory_dir="$(dirname "$transcript_path")/memory"
  if [ -d "$memory_dir" ]; then
    mem_count=0
    mem_bytes=0
    mem_latest=0
    for f in "$memory_dir"/*.md; do
      [ -e "$f" ] || continue
      [ "$(basename "$f")" = "MEMORY.md" ] && continue
      mem_count=$((mem_count + 1))
      fsize=$(stat -c %s "$f" 2>/dev/null || stat -f %z "$f" 2>/dev/null || echo 0)
      mem_bytes=$((mem_bytes + fsize))
      fmtime=$(stat -c %Y "$f" 2>/dev/null || stat -f %m "$f" 2>/dev/null || echo 0)
      [ "$fmtime" -gt "$mem_latest" ] 2>/dev/null && mem_latest=$fmtime
    done

    if [ "$mem_count" -gt 0 ]; then
      mem_size_fmt=$(fmt_bytes "$mem_bytes")
      mem_ago_s=$((now - mem_latest))
      if [ "$mem_ago_s" -lt 60 ]; then
        mem_ago="just now"
      else
        mem_ago="$(fmt_duration "$mem_ago_s") ago"
      fi
      noun="notes"
      [ "$mem_count" -eq 1 ] && noun="note"
      mem_str="${GRAY}mem${RESET} ${mem_count} ${noun} ${GRAY}·${RESET} ${mem_size_fmt} ${GRAY}· updated ${mem_ago}${RESET}"
    fi
  fi
fi

# --- 5-hour session usage + rolling timeline, one line (this is the number the
# Claude app calls "current session" on the usage page -
# rate_limits.five_hour.used_percentage, shown unmodified so it can't drift
# from the app) ---
if [ -n "$five_pct" ] && [ "$five_pct" != "null" ]; then
  fpct_int=$(printf '%.0f' "$five_pct" 2>/dev/null || echo 0)
  [ "$fpct_int" -lt 0 ] 2>/dev/null && fpct_int=0
  [ "$fpct_int" -gt 100 ] 2>/dev/null && fpct_int=100

  five_color=$(color_for_pct "$fpct_int")
  ffilled=$((fpct_int * bar_width / 100))
  fbar=$(render_bar "$ffilled" "$bar_width" "#" "-")

  five_str="${GRAY}5h${RESET} ${five_color}[${fbar}] ${fpct_int}%${RESET}"
  [ "$fpct_int" -ge 70 ] && five_str="${five_str} ${RED}${BOLD}!${RESET}"
  if [ -n "${five_is_cached:-}" ]; then
    if [ -n "$cache_age" ]; then
      five_str="${five_str} ${GRAY}(cached ${cache_age})${RESET}"
    else
      five_str="${five_str} ${GRAY}(cached)${RESET}"
    fi
  fi

  if [ -n "$five_reset" ] && [ "$five_reset" != "null" ]; then
    five_reset_i=$(printf '%.0f' "$five_reset" 2>/dev/null || echo 0)
    remaining=$((five_reset_i - now))
    countdown=$(fmt_duration "$remaining")
    clock=$(date -d "@${five_reset_i}" +'%-I:%M %p' 2>/dev/null)

    # rolling timeline: where "now" sits inside the current 5h window. The
    # window is exactly 5h wide and always ends at five_reset_i, so its start
    # is derivable even though Claude Code doesn't send it directly.
    window_secs=$((5 * 3600))
    window_start=$((five_reset_i - window_secs))
    elapsed=$((now - window_start))
    [ "$elapsed" -lt 0 ] && elapsed=0
    [ "$elapsed" -gt "$window_secs" ] && elapsed=$window_secs

    timeline_width=14
    tfilled=$((elapsed * timeline_width / window_secs))
    tbar=$(render_bar "$tfilled" "$timeline_width" "=" ".")
    marker_pos=$tfilled
    [ "$marker_pos" -ge "$timeline_width" ] && marker_pos=$((timeline_width - 1))
    tbar="${tbar:0:marker_pos}>${tbar:marker_pos+1}"
    elapsed_str=$(fmt_duration "$elapsed")

    five_str="${five_str} ${CYAN}[${tbar}]${RESET} ${GRAY}${elapsed_str}/5h${RESET}"
    if [ -n "$clock" ]; then
      five_str="${five_str} ${GRAY}resets ${countdown} (${clock})${RESET}"
    else
      five_str="${five_str} ${GRAY}resets ${countdown}${RESET}"
    fi
  fi
else
  five_str="${GRAY}5h [warming up - appears after first message]${RESET}"
fi

# --- 7-day weekly usage bar (Pro/Max only; absent otherwise) ---
if [ -n "$week_pct" ] && [ "$week_pct" != "null" ]; then
  wpct_int=$(printf '%.0f' "$week_pct" 2>/dev/null || echo 0)
  [ "$wpct_int" -lt 0 ] 2>/dev/null && wpct_int=0
  [ "$wpct_int" -gt 100 ] 2>/dev/null && wpct_int=100

  week_color=$(color_for_pct "$wpct_int")
  wfilled=$((wpct_int * bar_width / 100))
  wbar=$(render_bar "$wfilled" "$bar_width" "#" "-")

  week_str="${GRAY}7d${RESET} ${week_color}[${wbar}] ${wpct_int}%${RESET}"
  [ "$wpct_int" -ge 70 ] && week_str="${week_str} ${RED}${BOLD}!${RESET}"
  if [ -n "${week_is_cached:-}" ]; then
    if [ -n "$cache_age" ]; then
      week_str="${week_str} ${GRAY}(cached ${cache_age})${RESET}"
    else
      week_str="${week_str} ${GRAY}(cached)${RESET}"
    fi
  fi

  if [ -n "$week_reset" ] && [ "$week_reset" != "null" ]; then
    week_reset_i=$(printf '%.0f' "$week_reset" 2>/dev/null || echo 0)
    wremaining=$((week_reset_i - now))
    wcountdown=$(fmt_duration "$wremaining")
    wclock=$(date -d "@${week_reset_i}" +'%a %-I:%M %p' 2>/dev/null)
    if [ -n "$wclock" ]; then
      week_str="${week_str} ${GRAY}resets in ${wcountdown} (${wclock})${RESET}"
    else
      week_str="${week_str} ${GRAY}resets in ${wcountdown}${RESET}"
    fi
  fi
else
  week_str="${GRAY}7d [no weekly limit data]${RESET}"
fi

# --- assemble output (multi-line) ---
sep=" ${GRAY}|${RESET} "

line1="${CYAN}${folder}${RESET}"
if [ -n "$branch" ]; then
  line1="${line1}${sep}${MAGENTA}${branch}${RESET}"
fi
line1="${line1}${sep}${BLUE}${model}${RESET}${sep}${ctx_str}"
[ -n "$tokens_str" ] && line1="${line1}${sep}${tokens_str}"

printf '%s\n' "$line1"
printf '%s\n' "$five_str"
printf '%s\n' "$week_str"
[ -n "$mem_str" ] && printf '%s\n' "$mem_str"
exit 0
```
````
## What this does NOT ask for
- Does not touch WezTerm config, Starship config, or tmux config - those are already finished and settled per [[Acer Live State — 2026-09-16]]. If truecolor turns out not to reach Claude Code, the fix is a *reported finding*, not an applied change.
- Does not change Claude Code's own response-formatting behavior - that's a separate global `CLAUDE.md` rule already in effect on both machines, not something to reinstall.
## Source
Written 2026-09-19 on the Dell after the statusline fix was built and tested there (cold-start cache, Tokyo Night truecolor tier, dead `statusline-command.sh` archived), grounded in [[Installations]] and [[Acer Live State — 2026-09-16]]'s record of the Acer's real, already-finished terminal stack.
