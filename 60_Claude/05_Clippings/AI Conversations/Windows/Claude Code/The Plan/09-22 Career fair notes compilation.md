---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "Career fair notes compilation"
started_at: 2026-09-22T11:56:45
ended_at: 2026-09-22T12:21:34
exported_at: 2026-09-23T09:00:02
duration_minutes: 24.8
project: The Plan
cwd: 'D:\Users\_Anant\10_Areas\Documents\The Plan'
session_id: 8973a321-f041-4a50-bf66-6bf502cd59ba
status: raw
turn_count: 4
tools_used:
  AskUserQuestion: 1
  Bash: 11
  Read: 6
  Write: 4
tokens:
  input: 100
  output: 72466
  cache_creation: 321814
  cache_read: 4144577
  total: 4538957
cost_usd: 2.841031
model:
  - "claude-sonnet-5"
files_touched:
  - "D:\\Users\\_Anant\\10_Areas\\Documents\\Jarvis\\20_Progress\\Internship\\Career Fair\\Transcript - OPT.md"
  - "D:\\Users\\_Anant\\10_Areas\\Documents\\Jarvis\\20_Progress\\Internship\\Career Fair\\Transcript - Sponsoring.md"
  - "D:\\Users\\_Anant\\10_Areas\\Documents\\The Plan\\20_Progress\\Career\\Career Fair\\Day - 1.md"
  - "D:\\Users\\_Anant\\10_Areas\\Documents\\The Plan\\20_Progress\\Career\\Career Fair\\OPT Companies.md"
  - "D:\\Users\\_Anant\\10_Areas\\Documents\\The Plan\\20_Progress\\Career\\Internship\\Companies giving OPT & CPT.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# Career fair notes compilation

## You

`

<pasted_content id="1474">
20_Progress/Career/Career Fair/Day - 1
</pasted_content id="1474">

`, `

<pasted_content id="1474">
20_Progress/Career/Career Fair/OPT Companies
</pasted_content id="1474">

`. Are the notes that need to be written based off these companies: `

<pasted_content id="1474">
20_Progress/Internship/Career Fair/Transcript - OPT
</pasted_content id="1474">

`, `

<pasted_content id="1474">
20_Progress/Internship/Career Fair/Transcript - Sponsoring
</pasted_content id="1474">

`. This list is a copy from handshake regarding the emplyers that are going to sponsoring opt candidates for the entire fair. Details of each comapny has been listed out in the note. Reflect that entire note onto the notes present inside the plan and mentioned to you for the career fair. The details are already present, you just need to go through each and every single thing in detail and note it down as a summary. I do not want a large file. Something that is easy to read and note down. A short sumjmary of what exact are they doing for fair. Or whatever that was listed in the summary and opt sponsorship is a must. Either ways everything listed down in both the files qualify it. Make sure to write both the notes neatly. For the day - 1. Anythiong that specifically says tuesday 22/9/2026 should be added on that file. Just the name and interlinks.

## Claude

I'll start by locating the relevant files in the vault to see what currently exists.

The transcript files don't exist at the path the user typed (`20_Progress/Internship/Career Fair/...`). Let me check what's actually in `20_Progress/Career/Internship` and `20_Progress/Career/Career Fair`.

There's an `Untitled.md` file in that same folder that isn't in the filesystem listing I did earlier (it was empty-dir at time of check) — let me check it and re-verify the two target files' actual content.

I checked the vault thoroughly and can't find the source data. Here's what I found:

- **`20_Progress/Career/Career Fair/Day - 1.md`** and **`OPT Companies.md`** — both exist but are **empty (0 bytes)**.
- **`20_Progress/Internship/Career Fair/Transcript - OPT`** and **`Transcript - Sponsoring`** (the paths you referenced as source) — **don't exist anywhere in the vault**. There's no `20_Progress/Internship` folder at all.
- I also searched the entire vault for "Handshake," "sponsor," and "Transcript - OPT/Sponsoring" by content and filename — no matches.
- There's also a stray empty **`Untitled.md`** in the same `Career Fair` folder, currently open in your Obsidian workspace, which is also empty.

It looks like the pasted blocks in your message only carried the **file path/title**, not the actual Handshake company-list content you copied. Since none of that data exists on disk yet, I can't summarize it - I'd just be guessing at company names.

The transcripts are in the **Jarvis vault**, not The Plan. Let me check there.

Found them. Let me read both transcript files.

Both transcripts are readable. Let me check an existing note's format for style consistency before writing the two summary notes.

Now let me read the two target (currently empty) files before writing, per tool requirements.

Confirmed empty. Now writing the two notes.

Both notes are written.

## What I did
Found the actual source data in the **Jarvis vault** (not The Plan, where you'd pointed me at first) — `20_Progress/Internship/Career Fair/Transcript - OPT.md` and `Transcript - Sponsoring.md`, both raw Handshake pastes for the U of M CSE Career Fair, Tue 9/22–Wed 9/23, 2026.

- **`OPT Companies.md`** — 31 unique employers (deduped across both transcripts), alphabetical, each a linkable heading with one line: sponsorship type (**OPT/CPT** vs **Sponsor**), day(s), and what they're actually recruiting for.
- **`Day - 1.md`** — just the 13 companies attending **Tuesday 9/22** (today), as names with `[[OPT Companies#...]]` interlinks, per your instruction.

**Note:** the `Transcript - OPT.md` file cuts off mid-list (ends at HDR, Inc.) — it's page 1 of 25 results and may have a page 2 that wasn't captured in the paste. If there's more, drop it into that transcript note and I'll fold the additions in. `Transcript - Sponsoring.md` looked complete (9 companies, no truncation).

### Tool Calls

- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find "20_Progress" -ipath "*Career Fair*" -o -ipath "*OPT*" 2>/dev/null`
```
20_Progress/Career/Career Fair
20_Progress/Career/Career Fair/Day - 1.md
20_Progress/Career/Career Fair/OPT Companies.md
20_Progress/Career/Internship/Companies giving OPT & CPT.md
20_Progress/UROP/Rust/03 Result Option and Error Handling.md
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find . -iname "*Transcript*" 2>/dev/null`
```
./.claude/skills/copilot-youtube-transcript
./50_Archive/copilot/copilot-custom-prompts/Clip YouTube Transcript.md
./copilot/skills/copilot-youtube-transcript
./copilot/skills/copilot-youtube-transcript/youtube-transcript.cmd
./copilot/skills/copilot-youtube-transcript/youtube-transcript.ps1
./copilot/skills/copilot-youtube-transcript/youtube-transcript.sh
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find "20_Progress/Internship" -maxdepth 3 2>/dev/null`
```
(Bash completed with no output)
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find "20_Progress" -maxdepth 2 -type d 2>/dev/null`
```
20_Progress
20_Progress/AI
20_Progress/AI/Claude
20_Progress/AI/Cursor
20_Progress/AI/Kiro
20_Progress/Career
20_Progress/Career/Career Fair
20_Progress/Career/Entrepreneur
20_Progress/Career/Internship
20_Progress/Mentorship Program
20_Progress/Mentorship Program/Meetings
20_Progress/Projects
20_Progress/Projects/AI Second Brain
20_Progress/Projects/CS
20_Progress/Projects/Extra
20_Progress/UROP
20_Progress/UROP/Learning
20_Progress/UROP/Mocks
20_Progress/UROP/Presentation Assets
20_Progress/UROP/Rust
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && echo "--- Career Fair ---" && ls -la "20_Progress/Career/Career Fair" && echo "--- Career/Internship ---" && ls -la "20_Progress/Career/Internship"`
```
--- Career Fair ---
total 0
drwxr-xr-x 1 Anant Gupta 197121 0 Sep 22 11:51 .
drwxr-xr-x 1 Anant Gupta 197121 0 Sep 22 11:51 ..
-rw-r--r-- 1 Anant Gupta 197121 0 Sep 22 11:51 Day - 1.md
-rw-r--r-- 1 Anant Gupta 197121 0 Sep 22 11:51 OPT Companies.md
--- Career/Internship ---
total 48
drwxr-xr-x 1 Anant Gupta 197121     0 Apr 26 16:35 .
drwxr-xr-x 1 Anant Gupta 197121     0 Sep 22 11:51 ..
-rw-r--r-- 1 Anant Gupta 197121 15072 Mar 20  2026 ABB Interview Prep.md
-rw-r--r-- 1 Anant Gupta 197121 10538 Mar 25 22:57 Companies giving OPT & CPT.md
-rw-r--r-- 1 Anant Gupta 197121  4964 Mar 16  2026 Interview Questions.md
-rw-r--r-- 1 Anant Gupta 197121  7234 Feb 22  2026 LinkedIn Premium.md
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find . -iname "*sponsor*" -o -iname "*Transcript - OPT*" -o -iname "*Transcript - Sponsoring*" 2>/dev/null | grep -v node_modules`
```
(Bash completed with no output)
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find . -iname ".trash" -type d 2>/dev/null; ls -la .trash 2>/dev/null; echo "---checking obsidian workspace for recent files---"; find .obsidian -iname "workspace*" 2>/dev/null`
```
./.trash
total 76
drwxr-xr-x 1 Anant Gupta 197121     0 Apr 28 14:58 .
drwxr-xr-x 1 Anant Gupta 197121     0 Sep 22 11:49 ..
drwxr-xr-x 1 Anant Gupta 197121     0 Apr 26 02:18 [REDACTED]
-rw-r--r-- 1 Anant Gupta 197121 62935 Mar 27 03:01 msitarzewskiagency-agents A complete AI agency at your fingertips - From frontend wizards to Reddit community ninjas, from whimsy injectors to reality checkers. Each agent is a specialized expert with personality, processes, and proven deliverab.md
---checking obsidian workspace for recent files---
.obsidian/plugins/workspaces-plus
.obsidian/plugins/workspaces-plus/workspaces.json.bak
.obsidian/workspace.json
.obsidian/workspaces.json
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && grep -o '"[^"]*\.md"' .obsidian/workspace.json | sort -u | head -50`
```
"00_Inbox/Headway/Books/Atomic Habits.md"
"00_Inbox/Headway/Enumerate/Daily/01-06-2026.md"
"00_Live/Dashboard.md"
"00_Live/Headway/Better.md"
"00_Live/Headway/Questions to Ask Yourself.md"
"20_Progress/Career/Career Fair/Day - 1.md"
"20_Progress/Career/Career Fair/OPT Companies.md"
"20_Progress/Career/Career Fair/Untitled.md"
"20_Progress/Projects/Extra/Guitar.md"
"40_Resources/CS/Links.md"
"copilot/skills/copilot-fetch-x/SKILL.md"
"copilot/skills/copilot-read-pdf/SKILL.md"
"copilot/skills/copilot-web-fetch/SKILL.md"
"copilot/skills/copilot-web-search/SKILL.md"
"copilot/skills/copilot-youtube-transcript/SKILL.md"
"copilot/skills/json-canvas/references/EXAMPLES.md"
"copilot/skills/json-canvas/SKILL.md"
"copilot/skills/obsidian-bases/references/EXAMPLES.md"
"copilot/skills/obsidian-bases/references/FUNCTIONS_REFERENCE.md"
"copilot/skills/obsidian-bases/SKILL.md"
"copilot/skills/obsidian-cli/SKILL.md"
"copilot/skills/obsidian-markdown/references/CALLOUTS.md"
"copilot/skills/obsidian-markdown/references/EMBEDS.md"
"copilot/skills/obsidian-markdown/references/PROPERTIES.md"
"copilot/skills/obsidian-markdown/SKILL.md"
"copilot/skills/openartifacts-publish/SKILL.md"
"copilot/skills/openartifacts-publish/themes/research-memo.md"
"copilot/skills/symposium-publish/SKILL.md"
"Import.md"
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && ls -la "20_Progress/Career/Career Fair/" && echo "--- Untitled size ---" && wc -c "20_Progress/Career/Career Fair/Untitled.md" 2>/dev/null`
```
total 0
drwxr-xr-x 1 Anant Gupta 197121 0 Sep 22 11:57 .
drwxr-xr-x 1 Anant Gupta 197121 0 Sep 22 11:51 ..
-rw-r--r-- 1 Anant Gupta 197121 0 Sep 22 11:51 Day - 1.md
-rw-r--r-- 1 Anant Gupta 197121 0 Sep 22 11:51 OPT Companies.md
-rw-r--r-- 1 Anant Gupta 197121 0 Sep 22 11:57 Untitled.md
--- Untitled size ---
0 20_Progress/Career/Career Fair/Untitled.md
```
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && grep -ril "handshake" . 2>/dev/null | grep -v ".obsidian"`
```
./.git/cursor/crepe/[REDACTED]/index.bin
./20_Progress/Career/Useful Links.md
./20_Progress/Mentorship Program/Plan.md
./50_Archive/Previous Classes/CSCI/CSCI 2011/Chapter - 10.md
```
- `AskUserQuestion` -- `{"questions":[{"question":"The transcript source notes with the actual Handshake company data don\u0027t exist anywhere in the vault (only empty files). How do you want to proceed?","header":"Missing source data","multiSelect":false,"options":[{"label":"Paste the content here","description":"Paste the raw Handshake text (OPT list and Sponsoring list) directly into the chat and I\u0027ll process it now."},{"label":"I\u0027ll save the notes first","description":"You\u0027ll create/paste the transcript notes in Obsidian at the correct path, then tell me to re-check and proceed."},{"label":"Different location","description":"The transcript notes exist somewhere else (different path/vault) that I haven\u0027t searched - tell me where."}]}]}`
- `Bash` -- `cd "/d/Users/_Anant/10_Areas/Documents/Jarvis" && find "20_Progress/Internship/Career Fair" -type f 2>/dev/null; echo "---"; find . -iname "*Transcript - OPT*" -o -iname "*Transcript - Sponsoring*" 2>/dev/null`
```
20_Progress/Internship/Career Fair/Transcript - OPT.md
20_Progress/Internship/Career Fair/Transcript - Sponsoring.md
---
./20_Progress/Internship/Career Fair/Transcript - OPT.md
./20_Progress/Internship/Career Fair/Transcript - Sponsoring.md
Shell cwd was reset to D:\Users\_Anant\10_Areas\Documents\The Plan
```
- `Read` -- `D:\Users\_Anant\10_Areas\Documents\Jarvis\20_Progress\Internship\Career Fair\Transcript - OPT.md`
- `Read` -- `D:\Users\_Anant\10_Areas\Documents\Jarvis\20_Progress\Internship\Career Fair\Transcript - Sponsoring.md`
- `Read` -- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Internship\Companies giving OPT & CPT.md`
- `Read` -- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\OPT Companies.md`
- `Read` -- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\Day - 1.md`
- `Write` -- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\OPT Companies.md`
```
---
type: project
status: sprout
created: 2026-09-22
tags:
  - career-fair
  - opt
related_progress:
  - "[[Day - 1]]"
  - "[[Companies giving OPT & CPT]]"
next:
---
# OPT Companies — CSE Career Fair, Fall 2026

Every employer below either **accepts OPT/CPT** or is **willing to sponsor** work authorization. Source: Handshake employer list for the U of M CSE Career Fair (Tue 9/22–Wed 9/23, 2026).

Legend: **OPT/CPT** = accepts OPT/CPT candidates · **Sponsor** = willing to sponsor candidates

## Companies (A–Z)

### 3M
OPT/CPT · Wed 9/23 — Science/industrial conglomerate; internships spanning chemE, CS, data, EE, mech, materials, physics.

### Aagard
Sponsor · Wed 9/23 — Designs and builds automated packaging machinery; CS, EE, ME roles.

### ACR Homes / ACR Healthcare
OPT/CPT · Tue 9/22 — Residential healthcare for people with disabilities; biomedical/biology internships and direct-care roles.

### Advanced Energy
Sponsor · Wed 9/23 — Precision power technology for semiconductor, industrial, medical markets; EE & ME roles.

### ALLETE Inc
OPT/CPT · Wed 9/23 — Clean-energy utility; Electrical Engineer II role, broad engineering/CS/math majors.

### Alliant Engineering, Inc.
Sponsor · Tue 9/22 — Employee-owned civil engineering, planning, and landscape architecture firm.

### Allianz Life
Sponsor · Tue 9/22 — Insurance/annuities company; Analyst roles for actuarial science, CS, math, data science.

### ARCO (ARCO/Murray National Construction)
Sponsor · Wed 9/23 — Design-build construction leader; PM/superintendent intern & co-op roles for civil/mech engineers.

### Banner Engineering Corp.
Sponsor · Wed 9/23 — Industrial automation sensors; broad engineering/CS internships.

### Barr Engineering Co.
OPT/CPT · Tue 9/22 — Employee-owned engineering/environmental consulting.

### Blue Cross and Blue Shield of Minnesota
OPT/CPT · Wed 9/23 — Health insurer; Data Engineer and Full Stack Engineer roles.

### Bostik, Inc.
OPT/CPT · Wed 9/23 — Global adhesives/sealants manufacturer; chemE, chemistry, materials internships.

### Bracco Medical Technologies
OPT/CPT · Tue 9/22 — Medical device maker (IVUS, FFR, contrast delivery systems); internship/co-op.

### Braun Intertec
OPT/CPT · Tue 9/22 — Employee-owned engineering/materials testing firm; civil/geo co-op.

### Calyan Technologies Inc
Sponsor · Wed 9/23 — Early-stage medtech (leadless pacemaker); EE/CompE roles.

### Cambrex
Sponsor · Tue 9/22 & Wed 9/23 — Contract pharma manufacturing (small-molecule APIs); chemistry/chemE roles.

### City of Minneapolis - Public Works
OPT/CPT · Tue 9/22 — Municipal infrastructure/maintenance department; broad STEM majors.

### City of Saint Paul
OPT/CPT · Wed 9/23 — Municipal government; Engineering Aide II (civil/environmental).

### Colder Products Company (CPC)
OPT/CPT · Wed 9/23 — Quick-connect couplings/fittings manufacturer; co-op for aero, biomed, chemE, materials.

### Cretex Medical
OPT/CPT · Wed 9/23 — Medical device engineering/manufacturing; biomedical, chemE, mech, industrial roles.

### DeZURIK, Inc.
OPT/CPT · Wed 9/23 — Valve technology for water/wastewater and industrial applications; mechanical engineering.

### Felsburg Holt & Ullevig
OPT/CPT · Wed 9/23 — Transportation planning, traffic, and civil engineering consulting.

### GEOTEK
Sponsor · Wed 9/23 — Fiberglass pultrusion products for utility/fencing; chemE, EE, mech.

### Harland Medical Systems
OPT/CPT · Tue 9/22 — Surface enhancement solutions for medical devices; biomedical, chemE, EE, materials internships.

### HDR, Inc.
Sponsor · Tue 9/22 — Multidisciplinary engineering/architecture firm; civil, EE, mech.

### Itasca Consulting Group
Sponsor · Wed 9/23 — Geomechanics engineering/software consulting; software engineer/dev intern roles.

### Micron Technology Inc.
Sponsor · Tue 9/22 — Memory/storage semiconductor leader; broad engineering/CS/data roles.

### Seagate Technology
Sponsor · Wed 9/23 — Hard drive/data storage technology; broad engineering/CS/math internships.

### Starkey Hearing Technologies
Sponsor · Tue 9/22 — Hearing aid manufacturer; biomedical, CS, EE, mech roles.

### The Toro Company
Sponsor · Tue 9/22 & Wed 9/23 — Turf, irrigation, and outdoor equipment maker; CS, EE, mech, industrial internships.

### Xcel Energy
Sponsor · Wed 9/23 — Energy utility; broad engineering/CS/data internships.

---
31 companies total · 25 OPT/CPT-or-sponsor list + 9 dedicated sponsor list (6 unique adds) → see [[Day - 1]] for who's here today.

```
- `Write` -- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\Day - 1.md`
```
---
type: project
status: sprout
created: 2026-09-22
tags:
  - career-fair
  - opt
related_progress:
  - "[[OPT Companies]]"
next:
---
# Day 1 — Tuesday, Sep 22, 2026

Employers from [[OPT Companies]] attending today (all OPT/CPT-accepting or sponsoring).

- [[OPT Companies#ACR Homes / ACR Healthcare]]
- [[OPT Companies#Alliant Engineering, Inc.]]
- [[OPT Companies#Allianz Life]]
- [[OPT Companies#Barr Engineering Co.]]
- [[OPT Companies#Bracco Medical Technologies]]
- [[OPT Companies#Braun Intertec]]
- [[OPT Companies#Cambrex]]
- [[OPT Companies#City of Minneapolis - Public Works]]
- [[OPT Companies#Harland Medical Systems]]
- [[OPT Companies#HDR, Inc.]]
- [[OPT Companies#Micron Technology Inc.]]
- [[OPT Companies#Starkey Hearing Technologies]]
- [[OPT Companies#The Toro Company]]

```

## You

You were right, now the transcript holds more information for you to go through - Transcript - OPT needs to revisted and written down again

## Claude

I'll re-read the updated transcript file to pick up the additional entries.

Page 2 was missing from what I read earlier — it adds 20 more employers (Idea Fund of La Crosse through Xcel Energy again). I'll merge these into both notes now.

Now updating `Day - 1.md` with the additional Tuesday employers from page 2.

Both notes are updated.

## What changed
The transcript had a **second page** (companies Idea Fund of La Crosse → Xcel Energy again) that got cut off in my first pass. Reprocessed both files:

- **`OPT Companies.md`** — now **51 companies** total (31 from before + 20 new). Marked as **`OPT-friendly*`**
- **`Day - 1.md`** — added 12 more Tuesday 9/22 employers from the new page (Idea Fund of La Crosse, ISG, Johnson Screens, Loram Maintenance of Way, Marvell, Menard USA, MnDOT, MPCA, MoDOT, Stanley Consultants, VAA, VivaQuant) — now **25 employers** for today.

*One caveat:* for the 20 new companies, the raw transcript's descriptions were truncated (`...More`) right before the **Work Authorization** line, so I couldn't confirm whether each is specifically "accepts OPT/CPT" vs. "willing to sponsor" — they're tagged `OPT-friendly*` since they passed the same Handshake filter as everyone else on the list. If you expand those cards in Handshake and want the exact tag per company, send the fuller text and I'll fold it in.

### Tool Calls

- `Read` -- `D:\Users\_Anant\10_Areas\Documents\Jarvis\20_Progress\Internship\Career Fair\Transcript - OPT.md`
- `Write` -- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\OPT Companies.md`
```
---
type: project
status: sprout
created: 2026-09-22
tags:
  - career-fair
  - opt
related_progress:
  - "[[Day - 1]]"
  - "[[Companies giving OPT & CPT]]"
next:
---
# OPT Companies — CSE Career Fair, Fall 2026

Every employer below either **accepts OPT/CPT** or is **willing to sponsor** work authorization. Source: Handshake employer list for the U of M CSE Career Fair (Tue 9/22–Wed 9/23, 2026), both pages.

Legend: **OPT/CPT** = accepts OPT/CPT candidates · **Sponsor** = willing to sponsor candidates · **OPT-friendly\*** = passed the same Handshake work-authorization filter as every other company here, but the raw capture was truncated before showing which of the two exact tags applies

## Companies (A–Z)

### 3M
OPT/CPT · Wed 9/23 — Science/industrial conglomerate; internships spanning chemE, CS, data, EE, mech, materials, physics.

### Aagard
Sponsor · Wed 9/23 — Designs and builds automated packaging machinery; CS, EE, ME roles.

### ACR Homes / ACR Healthcare
OPT/CPT · Tue 9/22 — Residential healthcare for people with disabilities; biomedical/biology internships and direct-care roles.

### Advanced Energy
Sponsor · Wed 9/23 — Precision power technology for semiconductor, industrial, medical markets; EE & ME roles.

### ALLETE Inc
OPT/CPT · Wed 9/23 — Clean-energy utility; Electrical Engineer II role, broad engineering/CS/math majors.

### Alliant Engineering, Inc.
Sponsor · Tue 9/22 — Employee-owned civil engineering, planning, and landscape architecture firm.

### Allianz Life
Sponsor · Tue 9/22 — Insurance/annuities company; Analyst roles for actuarial science, CS, math, data science.

### ARCO (ARCO/Murray National Construction)
Sponsor · Wed 9/23 — Design-build construction leader; PM/superintendent intern & co-op roles for civil/mech engineers.

### Banner Engineering Corp.
Sponsor · Wed 9/23 — Industrial automation sensors; broad engineering/CS internships.

### Barr Engineering Co.
OPT/CPT · Tue 9/22 — Employee-owned engineering/environmental consulting.

### Blue Cross and Blue Shield of Minnesota
OPT/CPT · Wed 9/23 — Health insurer; Data Engineer and Full Stack Engineer roles.

### Bostik, Inc.
OPT/CPT · Wed 9/23 — Global adhesives/sealants manufacturer; chemE, chemistry, materials internships.

### Bracco Medical Technologies
OPT/CPT · Tue 9/22 — Medical device maker (IVUS, FFR, contrast delivery systems); internship/co-op.

### Braun Intertec
OPT/CPT · Tue 9/22 — Employee-owned engineering/materials testing firm; civil/geo co-op.

### Calyan Technologies Inc
Sponsor · Wed 9/23 — Early-stage medtech (leadless pacemaker); EE/CompE roles.

### Cambrex
Sponsor · Tue 9/22 & Wed 9/23 — Contract pharma manufacturing (small-molecule APIs); chemistry/chemE roles.

### City of Minneapolis - Public Works
OPT/CPT · Tue 9/22 — Municipal infrastructure/maintenance department; broad STEM majors.

### City of Saint Paul
OPT/CPT · Wed 9/23 — Municipal government; Engineering Aide II (civil/environmental).

### Colder Products Company (CPC)
OPT/CPT · Wed 9/23 — Quick-connect couplings/fittings manufacturer; co-op for aero, biomed, chemE, materials.

### Cretex Medical
OPT/CPT · Wed 9/23 — Medical device engineering/manufacturing; biomedical, chemE, mech, industrial roles.

### DeZURIK, Inc.
OPT/CPT · Wed 9/23 — Valve technology for water/wastewater and industrial applications; mechanical engineering.

### Felsburg Holt & Ullevig
OPT/CPT · Wed 9/23 — Transportation planning, traffic, and civil engineering consulting.

### GEOTEK
Sponsor · Wed 9/23 — Fiberglass pultrusion products for utility/fencing; chemE, EE, mech.

### Harland Medical Systems
OPT/CPT · Tue 9/22 — Surface enhancement solutions for medical devices; biomedical, chemE, EE, materials internships.

### HDR, Inc.
Sponsor · Tue 9/22 — Multidisciplinary engineering/architecture firm; civil, EE, mech.

### Idea Fund of La Crosse
OPT-friendly* · Tue 9/22 — Seed-stage VC firm backing pre-revenue/early-stage Western Wisconsin startups.

### ISG
OPT-friendly* · Tue 9/22 — Employee-owned multidisciplinary architecture, engineering, environmental & planning firm.

### Itasca Consulting Group
Sponsor · Wed 9/23 — Geomechanics engineering/software consulting; software engineer/dev intern roles.

### Johnson Screens
OPT-friendly* · Tue 9/22 — Global screen/auxiliary solutions for water well, environmental, energy, mining industries.

### Loram Maintenance of Way
OPT-friendly* · Tue 9/22 — Leading manufacturer of railroad track maintenance equipment and services.

### Marvell Technology (Custom Computing Solutions)
OPT-friendly* · Tue 9/22 — Semiconductor solutions powering 5G, cloud, enterprise, and AI infrastructure.

### Menard USA
OPT-friendly* · Tue 9/22 — Design-build geotechnical contractor specializing in ground improvement.

### Micron Technology Inc.
Sponsor · Tue 9/22 — Memory/storage semiconductor leader; broad engineering/CS/data roles.

### Minnesota Department of Transportation
OPT-friendly* · Tue 9/22 — State transportation agency; safe, sustainable transportation systems.

### Minnesota Pollution Control Agency
OPT-friendly* · Tue 9/22 — State agency monitoring environmental quality and enforcing regulations.

### Missouri Department of Transportation
OPT-friendly* · Tue 9/22 — State transportation agency for a safe, reliable transportation system.

### Pace - Scientific Professional Services
OPT-friendly* · Wed 9/23 — National laboratory network for environmental/scientific testing services.

### Rust-Oleum Corporation
OPT-friendly* · Wed 9/23 — Worldwide leader in protective paints and coatings for home and industry.

### Seagate Technology
Sponsor · Wed 9/23 — Hard drive/data storage technology; broad engineering/CS/math internships.

### Stanley Consultants, Inc.
OPT-friendly* · Tue 9/22 — Engineering/consulting firm with projects across all 50 states and 100+ countries.

### Starkey Hearing Technologies
Sponsor · Tue 9/22 — Hearing aid manufacturer; biomedical, CS, EE, mech roles.

### Swagelok Minnesota
OPT-friendly* · Wed 9/23 — Fluid system products/assemblies for oil & gas, chemical, semiconductor, power industries.

### Teleflex
OPT-friendly* · Wed 9/23 — Global medical technology company (vascular, surgical, anesthesia, cardiac care).

### Terracon
OPT-friendly* · Wed 9/23 — 100% employee-owned multidiscipline engineering/consulting firm.

### Tetra Pak - Interns
OPT-friendly* · Wed 9/23 — World-leading food processing and packaging solutions company.

### The Toro Company
Sponsor · Tue 9/22 & Wed 9/23 — Turf, irrigation, and outdoor equipment maker; CS, EE, mech, industrial internships.

### TSMC
OPT-friendly* · Wed 9/23 — World's leading dedicated semiconductor foundry.

### VAA, LLC
OPT-friendly* · Tue 9/22 — Civil, structural, electrical & mechanical engineering consulting firm.

### VivaQuant, Inc. Rhythm Express
OPT-friendly* · Tue 9/22 — Remote cardiac monitoring technology; smallest one-piece wearable MCT device.

### Williams AV
OPT-friendly* · Wed 9/23 — Wireless audio/communication systems (hearing assistance, interpretation, AV).

### Xcel Energy
Sponsor · Wed 9/23 — Energy utility; broad engineering/CS/data internships.

---
51 companies total (31 from the first capture + 20 added from the second page of the transcript) → see [[Day - 1]] for who's here today.

```
- `Write` -- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\Day - 1.md`
```
---
type: project
status: sprout
created: 2026-09-22
tags:
  - career-fair
  - opt
related_progress:
  - "[[OPT Companies]]"
next:
---
# Day 1 — Tuesday, Sep 22, 2026

Employers from [[OPT Companies]] attending today (all OPT/CPT-accepting or sponsoring).

- [[OPT Companies#ACR Homes / ACR Healthcare]]
- [[OPT Companies#Alliant Engineering, Inc.]]
- [[OPT Companies#Allianz Life]]
- [[OPT Companies#Barr Engineering Co.]]
- [[OPT Companies#Bracco Medical Technologies]]
- [[OPT Companies#Braun Intertec]]
- [[OPT Companies#Cambrex]]
- [[OPT Companies#City of Minneapolis - Public Works]]
- [[OPT Companies#Harland Medical Systems]]
- [[OPT Companies#HDR, Inc.]]
- [[OPT Companies#Idea Fund of La Crosse]]
- [[OPT Companies#ISG]]
- [[OPT Companies#Johnson Screens]]
- [[OPT Companies#Loram Maintenance of Way]]
- [[OPT Companies#Marvell Technology (Custom Computing Solutions)]]
- [[OPT Companies#Menard USA]]
- [[OPT Companies#Micron Technology Inc.]]
- [[OPT Companies#Minnesota Department of Transportation]]
- [[OPT Companies#Minnesota Pollution Control Agency]]
- [[OPT Companies#Missouri Department of Transportation]]
- [[OPT Companies#Stanley Consultants, Inc.]]
- [[OPT Companies#Starkey Hearing Technologies]]
- [[OPT Companies#The Toro Company]]
- [[OPT Companies#VAA, LLC]]
- [[OPT Companies#VivaQuant, Inc. Rhythm Express]]

```

## Actions Taken

**Files created:**
- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\Day - 1.md`
- `D:\Users\_Anant\10_Areas\Documents\The Plan\20_Progress\Career\Career Fair\OPT Companies.md`

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find "20_Progress" -ipath "*Career Fair*" -o -ipath "*OPT*" 2>/dev/null`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find . -iname "*Transcript*" 2>/dev/null`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find "20_Progress/Internship" -maxdepth 3 2>/dev/null`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find "20_Progress" -maxdepth 2 -type d 2>/dev/null`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && echo "--- Career Fair ---" && ls -la "20_Progress/Career/Career Fair" && echo "--- Career/Internship ---" && ls -la "20_Progress/Career/Internship"`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find . -iname "*sponsor*" -o -iname "*Transcript - OPT*" -o -iname "*Transcript - Sponsoring*" 2>/dev/null | grep -v node_modules`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && find . -iname ".trash" -type d 2>/dev/null; ls -la .trash 2>/dev/null; echo "---checking obsidian workspace for recent files---"; find .obsidian -iname "workspace*" 2>/dev/null`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && grep -o '"[^"]*\.md"' .obsidian/workspace.json | sort -u | head -50`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && ls -la "20_Progress/Career/Career Fair/" && echo "--- Untitled size ---" && wc -c "20_Progress/Career/Career Fair/Untitled.md" 2>/dev/null`
- `cd "/d/Users/_Anant/10_Areas/Documents/The Plan" && grep -ril "handshake" . 2>/dev/null | grep -v ".obsidian"`
- `cd "/d/Users/_Anant/10_Areas/Documents/Jarvis" && find "20_Progress/Internship/Career Fair" -type f 2>/dev/null; echo "---"; find . -iname "*Transcript - OPT*" -o -iname "*Transcript - Sponsoring*" 2>/dev/null`


