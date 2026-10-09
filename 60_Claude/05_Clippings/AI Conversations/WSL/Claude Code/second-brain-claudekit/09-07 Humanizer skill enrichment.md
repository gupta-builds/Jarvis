---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: wsl
title: "Humanizer skill enrichment"
started_at: 2026-09-07T04:51:12
ended_at: 2026-09-07T05:10:24
duration_minutes: 19
exported_at: 2026-10-08T21:15:03
project: second-brain-claudekit
cwd: '/home/anant_gupta/projects/ai/claude/second-brain-claudekit'
session_id: 2afc457c-d28f-4e36-8691-99d008a7a80d
status: raw
turn_count: 2
tools_used:
  Bash: 4
  Edit: 5
  Read: 5
  ToolSearch: 1
  WebFetch: 4
  WebSearch: 3
  Write: 2
tokens:
  input: 80
  output: 51115
  cache_creation: 202141
  cache_read: 4012978
  total: 4266314
cost_usd: 2.12247
model:
  - claude-sonnet-5
files_touched:
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/FOR-WHAT.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-05-test-log.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/SKILL.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/write-contract.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/ban-list.md"
  - "/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-07-enrichment-amendment.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - wsl
---

# Humanizer skill enrichment

## You

I want to work on the humanizer skill that has been created and make it extremely morerich. It always refers to afew studies established originally from professors about ai technical writing, ai writing, ai repetitie words, etc. Everything that is repetitive is added to an ban word listban that takes place at all time and is a rule globally as well for the humanizer skill, we takenotes of phrases, words and influencing sentences. We want it to strictly stick to the job provided - reduce token usage and always provided the right answer usingthe right tools. Find useful information about humanizer research papers andpopular writings that can be mimicked for actual studies to be copied over here.

## Claude

Found real, verifiable research to ground this in (not the sandboxed tool's own Wikipedia sourcing, but independent peer-reviewed/preprint studies): Kobak et al. 2025 (*Science Advances*), Liang et al. 2024 (Stanford, COLM/*Nature Human Behaviour*), and Juzek & Ward 2025 (COLING). All three independently measured real excess-word frequency spikes and name overlapping words (delve, realm, intricate, showcasing, pivotal, underscore, crucial, testament) — several of which the current skill doesn't yet list.

One repo-convention note before I edit: this repo's write-contract forbids silently hand-editing `tested-tools/` content — a real change there needs a dated, evidenced amendment, not a quiet patch. So I'll edit `tested-tools/_future/humanizer/SKILL.md` in place, add the new ban-list file alongside it, and write a dated amendment recording what changed and why (leaving `sandbox/humanizer/` untouched — that clone stays read-only).

Now update §7's word list with the newly-confirmed terms, and add the Research basis section before Source:

Now create the ban-list file:

Now the dated, evidenced amendment (write-contract requires this for any real change inside `tested-tools/`):

Now update `FOR-WHAT.md`, since it currently says the copy is unedited — that line is now false:

Structure is clean. Here's what changed:

**`tested-tools/_future/humanizer/SKILL.md`** (enriched fork, no longer a verbatim upstream copy):
- **Operating discipline** section — does only the rewrite the mode calls for, reads `ban-list.md` from disk instead of recalling it, no unrequested commentary. This is the "reduce token usage, stick to the job" part.
- **Standing ban list** section — checked *before* the 35 numbered patterns, not alongside them. Reads `ban-list.md` first (hard removal, overrides the false-positive exceptions), watches for real repeats during rewriting, and appends new confirmed repeats after each run — so it accumulates instead of resetting every session.
- **Research basis** section — three real, independently-verified studies (checked live via WebSearch/WebFetch, not recalled from training data): Kobak et al. 2025 (*Science Advances*), Liang et al. 2024 (Stanford, COLM/*Nature Human Behaviour*), Juzek & Ward 2025 (COLING — actual FSU professors researching exactly this). All three measure real excess-word frequency across millions of documents and name overlapping words.
- §7's word list picked up 4 terms the studies name but Wikipedia's list didn't have: *realm, meticulous(ly), strategically, surpass(es)*.

**New `tested-tools/_future/humanizer/ban-list.md`** — the cumulative global list itself, seeded from those studies, with an empty "Logged from real use" table that grows from actual sessions.

**Dated record**: `tests/skills/humanizer/[REDACTED].md` documents exactly what changed and why (required — the write-contract forbids silently hand-editing `tested-tools/` content), and `FOR-WHAT.md` was corrected since it previously (and now falsely) claimed the copy was unedited.

`sandbox/humanizer/` wasn't touched (stays read-only). This is still filed under `_future/` — nothing here creates a live use case; the `applying` agent is still blocked on missing resume/cover-letter files, per the original verdict.

**Tool calls:**

- `Bash` — `find . -iname "*humaniz*" -not -path "*/node_modules/*" 2>/dev/null`
  ```
./sandbox/humanizer
./tests/skills/humanizer
./tested-tools/_future/humanizer
./sandbox/obsidian-mind/.claude/commands/om-humanize.md
  ```
- `Bash`:
  ```bash
echo "=== sandbox/humanizer ==="; find ./sandbox/humanizer -type f | head -100
echo "=== tests/skills/humanizer ==="; find ./tests/skills/humanizer -type f | head -100
echo "=== tested-tools/_future/humanizer ==="; find ./tested-tools/_future/humanizer -type f | head -100
  ```
  ```
=== sandbox/humanizer ===
./sandbox/humanizer/SKILL.md
./sandbox/humanizer/README.md
./sandbox/humanizer/AGENTS.md
./sandbox/humanizer/LICENSE
./sandbox/humanizer/.claude-plugin/marketplace.json
./sandbox/humanizer/.claude-plugin/plugin.json
./sandbox/humanizer/scripts/validate-package.py
./sandbox/humanizer/agents/openai.yaml
./sandbox/humanizer/.git/HEAD
./sandbox/humanizer/.git/packed-refs
./sandbox/humanizer/.git/shallow
./sandbox/humanizer/.git/index
./sandbox/humanizer/.git/config
./sandbox/humanizer/.git/description
./sandbox/humanizer/.github/workflows/validate.yml
./sandbox/humanizer/.git/hooks/post-update.sample
./sandbox/humanizer/.git/hooks/pre-rebase.sample
./sandbox/humanizer/.git/hooks/update.sample
./sandbox/humanizer/.git/hooks/push-to-checkout.sample
./sandbox/humanizer/.git/hooks/pre-push.sample
./sandbox/humanizer/.git/hooks/pre-applypatch.sample
./sandbox/humanizer/.git/hooks/pre-merge-commit.sample
./sandbox/humanizer/.git/hooks/applypatch-msg.sample
./sandbox/humanizer/.git/hooks/prepare-commit-msg.sample
./sandbox/humanizer/.git/hooks/sendemail-validate.sample
./sandbox/humanizer/.git/hooks/commit-msg.sample
./sandbox/humanizer/.git/hooks/pre-receive.sample
./sandbox/humanizer/.git/hooks/fsmonitor-watchman.sample
./sandbox/humanizer/.git/hooks/pre-commit.sample
./sandbox/humanizer/.git/logs/HEAD
./sandbox/humanizer/.git/info/exclude
./sandbox/humanizer/.git/objects/pack/[REDACTED].rev
./sandbox/humanizer/.git/objects/pack/[REDACTED].pack
./sandbox/humanizer/.git/objects/pack/[REDACTED].idx
./sandbox/humanizer/.git/refs/heads/main
./sandbox/humanizer/.git/logs/refs/heads/main
./sandbox/humanizer/.git/refs/remotes/origin/HEAD
./sandbox/humanizer/.git/logs/refs/remotes/origin/HEAD
=== tests/skills/humanizer ===
./tests/skills/humanizer/2026-09-05-test-log.md
=== tested-tools/_future/humanizer ===
./tested-tools/_future/humanizer/FOR-WHAT.md
./tested-tools/_future/humanizer/SKILL.md
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/FOR-WHAT.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-05-test-log.md`
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/sandbox/humanizer/SKILL.md`
- `Bash` — `find . -iname "write-contract.md" -not -path "*/node_modules/*" -not -path "*/sandbox/*" 2>/dev/null`
  ```
./60_Claude/vault-rules/write-contract.md
  ```
- `Read` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/60_Claude/vault-rules/write-contract.md`
- `ToolSearch` — `{"query":"select:WebSearch,WebFetch","max_results":5}`
- `WebSearch` — `{"query":"Kobak \"excess vocabulary\" ChatGPT academic writing delve showcase paper"}`
- `WebSearch` — `{"query":"Liang Stanford \"Mapping the Increasing Use of LLMs\" peer review word frequency study"}`
- `WebSearch` — `{"query":"study words overused ChatGPT \"boasts\" \"testament\" \"delve\" linguistic fingerprint research paper"}`
- `WebFetch` — `{"url":"https://arxiv.org/abs/2412.11385","prompt":"Give me the exact author names, affiliations, publication venue, and abstract. Also list any specific overused words the paper identifies, and any key finding about the cause (e.g. RLHF, annotator demographics, Nigerian English)."}`
- `WebFetch` — `{"url":"https://arxiv.org/abs/2406.07016","prompt":"Give me the exact author names and affiliations, publication venue/date, and abstract. List the specific \"style words\" identified as excess vocabulary after ChatGPT's release, and any methodology detail worth citing (e.g. how they computed excess word frequency)."}`
- `WebFetch` — `{"url":"https://arxiv.org/abs/2404.01268","prompt":"Give me the exact author names and affiliations, publication venue/date, and abstract. List the specific words identified as most disproportionately used by LLMs vs humans, and any key percentage findings by field."}`
- `WebFetch` — `{"url":"https://news.fsu.edu/news/science-technology/2025/02/17/why-does-chatgpt-delve-so-much-fsu-researchers-begin-to-uncover-why-chatgpt-overuses-certain-words/","prompt":"List every one of the 21 (or however many) specific overused/focal words named in this article about the FSU ChatGPT word-overuse study. Also note any specific quotes about RLHF or annotator origin as a hypothesized cause."}`
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md`
  ```diff
  - license: MIT
metadata:
  version: "2.11.2"
---

# Humanizer: remove AI writing patterns

Rewrite AI-sounding text so it reads like the writer, not a chatbot. Do not change what it says or make up details.

The patterns below come from Wikipedia's ["Signs of AI writing"](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup.

## What to do
  + license: MIT
metadata:
  version: "2.11.2"
  enriched: "2026-09-07"
---

# Humanizer: remove AI writing patterns

Rewrite AI-sounding text so it reads like the writer, not a chatbot. Do not change what it says or make up details.

The patterns below come from Wikipedia's ["Signs of AI writing"](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup, cross-checked against the peer-reviewed word-frequency studies in [Research basis](#research-basis). This is an enriched fork of upstream `blader/humanizer` v2.11.2 (unmodified copy: `sandbox/humanizer/SKILL.md`) — see `tests/skills/humanizer/[REDACTED].md` for what changed and why.

## Operating discipline

- Do the rewrite the mode calls for, nothing more. Do not add commentary, alternatives, or offers beyond what [How to return the result](#how-to-return-the-result) specifies for that mode.
- Read `ban-list.md` (same folder) from disk each run. It grows over time; do not answer from a remembered snapshot of it.
- Match tool use to the job: read the file you need, edit only the file the mode requires, and stop. Do not re-derive something already on disk.

## What to do
  ```
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md`
  ```diff
  - When personality fits, keep the writer's opinions, uncertainty, mixed feelings, humor, asides, and uneven rhythm. Never invent facts to make the text feel personal.

## Content patterns
  + When personality fits, keep the writer's opinions, uncertainty, mixed feelings, humor, asides, and uneven rhythm. Never invent facts to make the text feel personal.

## Standing ban list (checked first, every time)

`ban-list.md` (same folder) is a cumulative, global rule for this skill — not one more pattern among the 35 below, but a hard filter that runs before them, every time, on every input.

1. **Before rewriting**, read `ban-list.md`. Every entry there is a hard removal, full stop. It applies even where the false-positive guidance in [Check for false positives](#check-for-false-positives) would normally excuse the word — an entry only lands on the list after it's shown up as a repeat, so the exception has already been used up.
2. **While rewriting**, watch for anything that repeats two or more times in the same input, or that the user names as a tell, even if it doesn't match any numbered pattern below. That's a new candidate.
3. **After rewriting**, append any new candidate to `ban-list.md`'s "Logged from real use" table: term, one-line reason, date. Dedupe against existing entries first (e.g. don't add "delving" if "delve" already covers it).
4. Once a term is on the list, it stays banned in every future run, not just flagged as overused. This is how the skill gets stricter with use instead of re-litigating the same tell every session.

## Content patterns
  ```
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md`
  ```diff
  - **High-frequency AI words:** Actually, additionally, align with, crucial, delve, emphasizing, enduring, enhance, fostering, garner, gate/gated/gating (figurative; preserve established technical usage), highlight (verb), interplay, intricate/intricacies, key (adjective), landscape (abstract noun), pivotal, quietly, showcase, tapestry (abstract noun), testament, underscore (verb), valuable, vibrant
  + **High-frequency AI words:** Actually, additionally, align with, boast(s), crucial, delve, emphasizing, enduring, enhance, fostering, garner, gate/gated/gating (figurative; preserve established technical usage), highlight (verb), interplay, intricate/intricacies, key (adjective), landscape (abstract noun), meticulous(ly), pivotal, quietly, realm, showcase, strategically, surpass(es), tapestry (abstract noun), testament, underscore (verb/noun), valuable, vibrant
  ```
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md`
  ```diff
  - ## Source

This skill is based on [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup. Its patterns come from reviews of AI-generated text on Wikipedia.

Wikipedia's main point: "LLMs use statistical algorithms to guess what should come next. The result tends toward the most statistically likely result that applies to the widest variety of cases."
  + ## Research basis

Wikipedia's "Signs of AI writing" comes from editors' pattern-matching on real edits. These three studies independently confirm a subset of it by measuring actual excess-word frequency across millions of real documents, not impression:

- Kobak, D., González-Márquez, R., Horvát, E.-Á., & Lause, J. (2025). "Delving into LLM-assisted writing in biomedical publications through excess vocabulary." *Science Advances*, 11(27) (preprint: arXiv:2406.07016, 2024). Measured excess-word frequency across 15M+ PubMed abstracts, 2010-2024. Found an abrupt post-ChatGPT rise in words including *delve*, *crucial*, and *testament*; estimated at least 13.5% of 2024 abstracts show LLM involvement, over 40% in some subfields.
- Liang, W., et al. (Stanford, 2024). "Mapping the Increasing Use of LLMs in Scientific Papers." arXiv:2404.01268 (COLM 2024; journal version: "Quantifying large language model usage in scientific papers," *Nature Human Behaviour*, 2025). Measured 950,965 papers (2020-2024) on arXiv, bioRxiv, and Nature-portfolio journals. Named *realm*, *intricate*, *showcasing*, and *pivotal* as the words most disproportionately used by LLMs versus humans; found up to 17.5% of computer-science papers show LLM modification, versus 6.3% for math and the Nature portfolio.
- Juzek, T. S., & Ward, Z. B. (2025). "Why Does ChatGPT 'Delve' So Much? Exploring the Sources of Lexical Overrepresentation in Large Language Models." Proceedings of COLING 2025 (arXiv:2412.11385). Identified 21 focal words with abnormal frequency spikes, including *delve*, *realm*, *intricate*, and *underscore*. Ruled out model architecture and training data as the sole cause; found evidence consistent with (not conclusive proof of) RLHF/human-preference tuning shaping the effect.

§7 already lists most of these terms; this section exists so each one traces back to a checkable source instead of house opinion, and so `ban-list.md`'s seeded rows cite something real rather than a restated hunch.

## Source

This skill is based on [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing), maintained by WikiProject AI Cleanup. Its patterns come from reviews of AI-generated text on Wikipedia.

Wikipedia's main point: "LLMs use statistical algorithms to guess what should come next. The result tends toward the most statistically likely result that applies to the widest variety of cases."
  ```
- `Write` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/ban-list.md`
  ```
---
name: humanizer-ban-list
created: 2026-09-07
type: standing-rule
---

# Humanizer ban list (cumulative, global)

Every entry below is banned from every future humanizer output, at all times — checked before `SKILL.md`'s 35 numbered patterns, not alongside them. See `SKILL.md`'s "Standing ban list" section for the read/append rule.

An entry lands here one of two ways:
1. **Seeded from a cited study or from Wikipedia's "Signs of AI writing"** — see `SKILL.md`'s "Research basis" section for the sources.
2. **Logged from real use** — a word, phrase, or sentence pattern that repeated two or more times in one real input, or that a person named as a tell, during an actual humanizer run.

## Seeded from research (2026-09-07)

| Term | Source |
|---|---|
| delve / delves / delving | Kobak et al. 2025; Juzek & Ward 2025 |
| realm | Liang et al. 2024; Juzek & Ward 2025 |
| intricate / intricacies | Kobak et al. 2025; Liang et al. 2024; Juzek & Ward 2025 |
| underscore(s) (verb/noun) | Juzek & Ward 2025 |
| showcasing / showcase | Liang et al. 2024 |
| pivotal | Liang et al. 2024 |
| meticulous(ly) | Juzek & Ward 2025 |
| strategically | Juzek & Ward 2025 |
| surpass(es) | Juzek & Ward 2025 |
| boast(s) | Juzek & Ward 2025 |
| garner(ed/ing) | Juzek & Ward 2025 |
| crucial | Kobak et al. 2025 |
| testament (to) | Kobak et al. 2025 |

Full citations: `SKILL.md`, "Research basis" section.

## Logged from real use

_(empty — the first real rewrite session that finds a genuine repeat adds a row here: term, one-line reason, date)_

  ```
- `Write` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-07-enrichment-amendment.md`
  ```
# Amendment — humanizer enrichment (2026-09-07)

Amends `tests/skills/humanizer/2026-09-05-test-log.md`. That log cleared `blader/humanizer` for use, unmodified, and filed it to `tested-tools/_future/humanizer/` with no current use case. This session enriched the filed copy on request — `tested-tools/_future/humanizer/SKILL.md` is no longer a verbatim copy of `sandbox/humanizer/SKILL.md`, per the write-contract's requirement that a real change to `tested-tools/` content get a dated record, not a silent edit.

`sandbox/humanizer/` itself was not touched — it stays the read-only, unmodified upstream clone.

## What changed and why

1. **Added a "Research basis" section citing three real, independently verified studies**, not the tool's own Wikipedia sourcing:
   - Kobak, D., González-Márquez, R., Horvát, E.-Á., & Lause, J. (2025). "Delving into LLM-assisted writing in biomedical publications through excess vocabulary." *Science Advances* 11(27); preprint arXiv:2406.07016 (2024).
   - Liang, W., et al. (2024). "Mapping the Increasing Use of LLMs in Scientific Papers." arXiv:2404.01268 (COLM 2024); journal version "Quantifying large language model usage in scientific papers," *Nature Human Behaviour* (2025).
   - Juzek, T. S., & Ward, Z. B. (2025). "Why Does ChatGPT 'Delve' So Much? Exploring the Sources of Lexical Overrepresentation in Large Language Models." Proceedings of COLING 2025; arXiv:2412.11385.

   Each was checked for real authorship, venue, and findings via `WebSearch` + `WebFetch` against arXiv/publisher pages this session (not taken from memory) — see the specific words and percentages quoted in the section, which came back from those fetches. All three measure real excess-word frequency across large corpora (15M+ PubMed abstracts; 950,965 papers; scientific abstracts generally), not editorial impression, and name overlapping words (*delve, realm, intricate, showcasing, pivotal, underscore, crucial, testament*) that corroborate §7 of the existing Wikipedia-sourced list.

2. **Added 4 words to §7's list that the studies name but the original list didn't have**: *realm*, *meticulous(ly)*, *strategically*, *surpass(es)*. Also added *boast(s)* to §7 (it already existed in §4's sales-language list; now cross-listed since Juzek & Ward 2025 name it independently as a high-frequency AI word, not just sales language).

3. **Added a "Standing ban list" mechanism** — a new `ban-list.md` file in the same folder, seeded from the three studies above, that the skill now reads before applying its 35 numbered patterns and appends to after every real rewrite when a genuine repeat is found. This is the persistent, cumulative, always-applied list the request asked for: it starts from cited research, not opinion, and grows from real use instead of staying a fixed snapshot.

4. **Added an "Operating discipline" section** near the top of `SKILL.md`, addressing the request to keep the skill strictly on-task: do only the rewrite the active mode calls for, read `ban-list.md` from disk each run instead of recalling it, and don't add commentary beyond what "How to return the result" already specifies.

## What did not change

- The Q1-Q4 verdict from `2026-09-05-test-log.md` stands: still a single dependency-free Markdown skill, still no current `internship-research-loop` use case (the `applying` agent is still blocked on `Main Resume.md`/`Main Cover Letter.md` not existing — not re-checked this session; see `tested-tools/_future/humanizer/FOR-WHAT.md`'s re-evaluation trigger for when to check).
- No package/dependency claims changed, so `validate-package.py` (which lives only in `sandbox/humanizer/`, not copied here) is not re-run — nothing it checks (package structure, no external deps) was touched.
- Filed location: still `tested-tools/_future/humanizer/`, per the same routing-table row (`tool that cleared tested-tools/ review, no current project needs it yet`). Enrichment doesn't create a new use case by itself.

## Provenance note

The user's original request referred to "professors" and "studies" without naming specific ones. The three cited above are the real, checkable studies that exist on this exact topic (LLM lexical overrepresentation) as of this session — found via live search, not supplied by the user and not invented to fit the request. Juzek and Ward (Florida State University) are literally professors researching this; Kobak et al. and Liang et al. are university-affiliated researchers (Tübingen; Stanford) publishing in peer-reviewed venues. No citation in `SKILL.md` or `ban-list.md` was fabricated or approximated from training-data recall alone — each was confirmed against a live arXiv/publisher/news page this session.

  ```
- `Edit` — `/home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/FOR-WHAT.md`
  ```diff
  - ## What's mapped here

`SKILL.md` — the real file, copied as-is from `sandbox/humanizer/SKILL.md` (not edited; `sandbox/`'s own copy stays read-only per the write-contract).
  + ## What's mapped here

`SKILL.md` — originally copied as-is from `sandbox/humanizer/SKILL.md`; enriched in place 2026-09-07 with cited research and a standing ban-list mechanism (see `tests/skills/humanizer/[REDACTED].md` for the dated record of what changed). No longer a verbatim copy of upstream. `sandbox/humanizer/SKILL.md` itself was not touched and stays the read-only, unmodified clone per the write-contract.

`ban-list.md` — new, added 2026-09-07. A cumulative, global list of banned words/phrases the skill checks before its numbered patterns and appends to from real use.
  ```
- `Bash` — `grep -n "^## " tested-tools/_future/humanizer/SKILL.md`
  ```
20:## Operating discipline
26:## What to do
37:## Match the writer's voice
47:## Add personality only when it fits
55:## Standing ban list (checked first, every time)
64:## Content patterns
126:## Language and grammar patterns
195:## Style patterns
250:## Chatbot patterns
281:## Filler and hedging
409:## Check for false positives
448:## How to return the result
456:## Rewrite process
468:## Research basis
478:## Source
  ```

## Actions Taken
- Files created: /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/ban-list.md, /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tests/skills/humanizer/2026-09-07-enrichment-amendment.md
- Files modified: /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/SKILL.md, /home/anant_gupta/projects/ai/claude/second-brain-claudekit/tested-tools/_future/humanizer/FOR-WHAT.md
- Files deleted: (none)
- Commands run: find . -iname "*humaniz*" -not -path "*/node_modules/*" 2>/dev/null, echo "=== sandbox/humanizer ==="; find ./sandbox/humanizer -type f | head -100 echo "=== tests/skills/humanizer ==="; find ./tests/skills/humanizer -type f | head -100 echo "=== tested-tools/_future/humanizer ==="; find ./tested-tools/_future/humanizer -type f | head -100, find . -iname "write-contract.md" -not -path "*/node_modules/*" -not -path "*/sandbox/*" 2>/dev/null, grep -n "^## " tested-tools/_future/humanizer/SKILL.md
- Tool call tally: Bash (4), Edit (5), Read (5), ToolSearch (1), WebFetch (4), WebSearch (3), Write (2)

