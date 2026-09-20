---
type: input
input_kind: ai-conversation
source_app: cursor
source_os: wsl
title: "Internship resume and cover letter research"
started_at: 2026-08-28T15:38:10
ended_at: 2026-08-28T15:38:16
exported_at: 2026-09-20T16:50:03
project: internship-research-loop
cwd: "/home/anant_gupta/projects/work/internship-research-loop"
session_id: 90999160-f5c3-4c09-a982-701c14e1dada
status: raw
turn_count: 2
tools_used:
  CallDynamicTool: 25
  GetDynamicTools: 5
  ReadFile: 1
  WebFetch: 12
  WebSearch: 20
files_touched:
  - "/home/anant_gupta/.claude/skills/obsidian-search/SKILL.md"
files_changed_count: 0
lines_added: 0
lines_removed: 0
tags:
  - input
  - ai-conversation
  - cursor
  - wsl
---

# Internship resume and cover letter research

## You

<timestamp>Saturday, Aug 29, 2026, 12:38 AM (UTC+4)</timestamp>
<user_query>
Continue the internship-loop resume/cover-letter ATS research from Session 1.

Read `20_Progress/Internship/Building System/Resume & Cover Letter — ATS Research Log.md`
in the Jarvis vault in full first — especially its "Session 2 Task List" at the bottom.
Do NOT re-search anything already resolved in Session 1's findings (§A–§G of that note).

Your tasks, in the order listed in that note:
1. Find Lever's own candidate-facing resume upload/parsing documentation (help.lever.co or
   Lever's developer docs) — Session 1 found Greenhouse's and Ashby's own docs but did not
   check Lever, which is a live source in this pipeline per `Research Loop - Resources.md`.
2. Find Workday's own public candidate-facing documentation on resume parsing/scoring —
   Session 1 searched and found nothing at (a) tier; every Workday claim in circulation
   traces only to third-party SEO blogs. Confirm whether an official source exists at all,
   or confirm honestly that it doesn't.
3. Check Jane Street, Citadel, Hudson River Trading, and Two Sigma's own careers/FAQ pages
   directly for any application-format guidance. Session 1 found zero (a)/(b) sources for
   these — only third-party quant-career blogs repeating unverified conventions (one-page
   LaTeX, GPA ~3.7 threshold). Don't rely further on those without checking the firms directly.
4. Check whether Microsoft (Explore), Google (ASDI), LinkedIn (First Play), Capital One,
   Bloomberg, MLH Fellowship, or NASA OSTEM publish resume/application guidance specific to
   their named early-talent program (not just general company hiring advice).
5. Try to confirm which university actually published the uConnect-hosted "CARS-669" resume
   PDF cited in Session 1 §C — right now it's used content-only, unattributed to a specific
   school.
6. If task 1 or 2 turns up a real keyword-matching description, cross-check it against
   Session 1's §E keyword-density convergent rule (2–4 mentions/keyword, no universal
   percentage) — that rule currently rests only on third-party convergence, not a primary
   ATS-vendor source.
7. Check whether any target company publishes cover-letter-specific (not just resume)
   guidance — Session 1 found resume guidance for Google/Amazon but nothing cover-letter
   specific anywhere. Confirm "none exists" is the honest answer if that's what you find.

Classify every new source using the same tiers defined in the research log's own
"Source Tiers" section — (a) primary/official, (a-assoc) professional association,
(b) university career-service, (c-1) empirically-tested tool endorsed by a university,
(c-2) SEO/AI-generated advisory site. Do not upgrade a source's tier without a real citation.

When done, append a new `## Session 2 (<date>)` section to the SAME research log note
(don't overwrite Session 1's section), following the same structure. Then update
`30_Order/Standards/Resume Alteration Standard.md` §4/§8 and
`30_Order/Standards/Cover Letter Alteration Standard.md` §7 with whatever new (a)/(b)
citations you find, the same way Session 1 did — read those sections first to match the
existing format before editing.
</user_query>

## Cursor

**Researching vault consent**

I need to gather research on writing personal vault consent since the user explicitly asked. I should start by checking the relevant skill to see what I can find. Obsidian research seems relevant here, and I might need to create findings that stand alone, possibly using a canvas. I’m also noticing that the user has made a direct request, so I want to make sure I read the research skill thoroughly first.

I’ll extend only the seven unresolved gaps. I’ll preserve the source-tier evidence standard; no vendor or employer claim will be added unless it comes from its own published material.

**Preparing for research**

I'm planning to carry out a web search to gather a wide range of information. Since the topic is broad, I think I'll use multiple parallel searches for different categories. Later on, I’ll verify the details directly by fetching data from the web. It's important to get every source covered to ensure I'm providing thorough and accurate information! Let’s get started on that!

**Searching for internship programs**

I need to look up specific programs like Microsoft careers for the "Associate Software Developer Internship." It sounds like the user is after that role, so I'll do a search for any relevant listings. I'll check vault resources for the most accurate and up-to-date information about the program. I should also read through any pertinent standards and resources to provide a clear and helpful answer for the user.

Key correction: Workday does publish official product documentation, but it is recruiter/admin-facing—not candidate-facing—and its HiredScore grading explicitly excludes campus/graduate requisitions. It supports a JD-match claim, but not the Session 1 “2–4 mentions” keyword-density rule.

**Preparing patch content**

I need to focus on getting patch three ready. I should prepare the exact content instead of the entire document, specifically just the relevant section. Since there are multiple changes that the user requested, it might make sense to run transformations simultaneously, especially since these refer to different files and revisions. That feels like a good plan! Let's make sure everything is organized for the user.

**Confirming changes through mapping**

I need to verify the changes by reading the relevant sections and using the log tail. It looks like I may need to map or read the Session 2 target since it's currently unknown from the map. First, I’ll focus on conducting full research on the map, and then I can target the specific elements I need to address. It feels important to get this right!

Session 2 is complete and appended to `Resume & Cover Letter — ATS Research Log.md`.

Key outcomes:
- Lever has primary parsing/upload documentation; image/scanned resumes are not parseable.
- Workday has official product docs for parsing/JD matching, but no candidate-facing guidance—and HiredScore excludes campus/graduate requisitions.
- No official format/GPA/LaTeX rules found for Jane Street, Citadel, HRT, or Two Sigma.
- Strong named-program guidance found for MLH Fellowship and NASA OSTEM; OSTEM does not accept a resume upload.
- `CARS-669` origin remains unverified, so it is no longer treated as attributable (b)-tier university guidance.
- Found narrow Google apprenticeship cover-letter instructions and Capital One company-published general cover-letter advice; neither is a universal internship requirement.
- Removed the unsupported claim that ATS vendors endorse “2–4 mentions per keyword.”

Updated:
- `30_Order/Standards/Resume Alteration Standard.md` §§4, 8
- `30_Order/Standards/Cover Letter Alteration Standard.md` §7

No repository code changed, so lint/typecheck/test/build commands do not apply.

**Tool calls:**

- `ReadFile` — `{"path":"/home/anant_gupta/.claude/skills/obsidian-search/SKILL.md"}`
- `GetDynamicTools` — `{"namespace":"user-jarvis","toolName":"vault_read"}`
- `GetDynamicTools` — `{"namespace":"user-jarvis","toolName":"vault_append"}`
- `GetDynamicTools` — `{"namespace":"user-jarvis","toolName":"vault_get_document_map"}`
- `GetDynamicTools` — `{"namespace":"user-jarvis","toolName":"search_simple"}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the complete ATS research log before continuing its research."},"arguments":{"path":"20_Progress/Internship/Building System/Resume & Cover Letter — ATS Research Log.md"}}`
- `WebSearch` — `{"search_term":"site:help.lever.co candidate resume upload parsing resume official Lever","explanation":"Locate Lever's own candidate-facing resume upload or parsing documentation."}`
- `WebSearch` — `{"search_term":"site:workday.com OR site:community.workday.com candidate resume parsing scoring application resume official","explanation":"Determine whether Workday publishes official candidate-facing resume parsing or scoring guidance."}`
- `WebSearch` — `{"search_term":"site:jane-street.com careers application resume cover letter FAQ","explanation":"Check Jane Street's official careers pages for application-format guidance."}`
- `WebSearch` — `{"search_term":"site:citadel.com careers application resume cover letter FAQ OR site:citadel.com \"Launch\"","explanation":"Check Citadel's official careers pages for application-format guidance."}`
- `WebSearch` — `{"search_term":"site:hudsonrivertrading.com careers application resume cover letter FAQ","explanation":"Check HRT's official careers pages for application-format guidance."}`
- `WebSearch` — `{"search_term":"site:twosigma.com careers application resume cover letter FAQ OR \"First-Year\"","explanation":"Check Two Sigma's official careers pages for application-format guidance."}`
- `WebSearch` — `{"search_term":"\"[REDACTED].pdf\"","explanation":"Identify the university that published the uConnect-hosted CARS-669 resume handout."}`
- `WebSearch` — `{"search_term":"site:microsoft.com \"Explore Microsoft\" resume application cover letter","explanation":"Find Microsoft-published resume or application guidance specifically for Explore."}`
- `WebSearch` — `{"search_term":"site:google.com \"ASDI\" resume application cover letter Google","explanation":"Find Google-published guidance specific to the ASDI program."}`
- `WebSearch` — `{"search_term":"site:linkedin.com \"First Play\" resume application cover letter","explanation":"Find LinkedIn-published guidance specific to First Play."}`
- `WebSearch` — `{"search_term":"site:capitalonecareers.com OR site:capitalone.com careers internship resume application cover letter official","explanation":"Find Capital One-published early-talent resume or application guidance."}`
- `WebSearch` — `{"search_term":"site:bloomberg.com/company OR site:careers.bloomberg.com internship resume application cover letter official","explanation":"Find Bloomberg-published early-talent resume or application guidance."}`
- `WebSearch` — `{"search_term":"site:mlh.io fellowship resume application cover letter","explanation":"Find MLH's official Fellowship application-material guidance."}`
- `WebSearch` — `{"search_term":"site:nasa.gov OSTEM internship resume application cover letter guidance","explanation":"Find NASA-published OSTEM-specific resume or application guidance."}`
- `WebSearch` — `{"search_term":"site:careers.google.com OR site:google.com/about/careers cover letter application Google resume","explanation":"Check Google's own pages for cover-letter-specific application guidance."}`
- `WebSearch` — `{"search_term":"site:amazon.com OR site:aboutamazon.com career cover letter application resume tips","explanation":"Check Amazon's own pages for cover-letter-specific application guidance."}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the resume standard sections that may need citation updates."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["4. Source Register & Reliability Rules"],"scope…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the resume standard checklist section before updating it."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["8. ATS Format & Keyword Baseline"],"scope":"marker…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the cover-letter standard citation section before updating it."},"arguments":{"path":"30_Order/Standards/Cover Letter Alteration Standard.md","targetType":"heading","target":["7. Source Register & Evidence"],"scope"…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the research resources to confirm named early-talent program names."},"arguments":{"path":"20_Progress/Internship/Building System/Research Loop - Resources.md"}}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_get_document_map","mcpDetails":{"description":"Inspect the resume standard headings before its targeted updates."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md"}}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_get_document_map","mcpDetails":{"description":"Inspect the cover-letter standard headings before its targeted update."},"arguments":{"path":"30_Order/Standards/Cover Letter Alteration Standard.md"}}`
- `WebSearch` — `{"search_term":"\"Associate Software Development Internship\" Google careers 2027 application","explanation":"Verify the Google early-talent program name and locate official program guidance."}`
- `WebSearch` — `{"search_term":"site:careers.microsoft.com \"Explore\" program application resume","explanation":"Search Microsoft's careers site for Explore-specific application guidance."}`
- `WebSearch` — `{"search_term":"site:careers.linkedin.com OR site:linkedin.com/company \"First Play\" \"resume\"","explanation":"Search LinkedIn-owned pages for First Play-specific application guidance."}`
- `WebSearch` — `{"search_term":"\"CARS-669\" resume","explanation":"Find a university attribution for the CARS-669 resume handout."}`
- `WebFetch` — `{"url":"https://help.lever.co/hc/en-us/articles/[REDACTED]"}`
- `WebFetch` — `{"url":"https://doc.workday.com/hiredscore/en-us/workday-hiredscore/recruiter-productivity-/concept--hiredscore-grades.html"}`
- `WebFetch` — `{"url":"https://www.nasa.gov/learning-resources/internship-programs/intern-frequently-asked-questions/"}`
- `WebFetch` — `{"url":"https://www.nasa.gov/learning-resources/tips-to-craft-standout-internship-application/"}`
- `WebFetch` — `{"url":"https://fellowship.mlh.io/apply"}`
- `WebFetch` — `{"url":"https://www.bloomberg.com/company/careers/application-process/engineering-student/"}`
- `WebFetch` — `{"url":"https://www.capitalonecareers.com/faq"}`
- `WebFetch` — `{"url":"https://www.capitalone.com/learn-grow/life-events/how-to-write-a-cover-letter/"}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the resume standard source-register section for citation updates."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["Resume Alteration Standard","4. Source Reg…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the resume ATS checklist section for citation updates."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["Resume Alteration Standard","8. ATS Format & Keyword …`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Read the cover-letter source register for citation updates."},"arguments":{"path":"30_Order/Standards/Cover Letter Alteration Standard.md","targetType":"heading","target":["Cover Letter Alteration Standard","7. Source Re…`
- `WebFetch` — `{"url":"https://careers.microsoft.com/v2/global/en/exploremicrosoft"}`
- `WebFetch` — `{"url":"https://www.hudsonrivertrading.com/student-opportunities/"}`
- `WebFetch` — `{"url":"https://www.citadel.com/careers/career-perspectives/our-engineering-interview-process/"}`
- `WebFetch` — `{"url":"https://www.bloomberg.com/company/careers/how-we-hire/"}`
- `GetDynamicTools` — `{"namespace":"user-jarvis","toolName":"vault_patch"}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_append","mcpDetails":{"description":"Append the dated Session 2 ATS research findings to the existing research log."},"arguments":{"path":"20_Progress/Internship/Building System/Resume & Cover Letter — ATS Research Log.md","content":"\n\n## Session 2 (202…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_patch","mcpDetails":{"description":"Update the resume source register with Session 2 official evidence."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["Resume Alteration Standard","4. Source Regis…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_patch","mcpDetails":{"description":"Correct the resume ATS checklist to match Session 2 primary evidence."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["Resume Alteration Standard","8. ATS Format…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_patch","mcpDetails":{"description":"Update the cover-letter source register with Session 2 official evidence."},"arguments":{"path":"30_Order/Standards/Cover Letter Alteration Standard.md","targetType":"heading","target":["Cover Letter Alteration Standard…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_get_document_map","mcpDetails":{"description":"Refresh the resume standard version after source-register updates."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md"}}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_get_document_map","mcpDetails":{"description":"Refresh the cover-letter standard version before its citation update."},"arguments":{"path":"30_Order/Standards/Cover Letter Alteration Standard.md"}}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_patch","mcpDetails":{"description":"Update the cover-letter source register with Session 2 official evidence.","requestSmartModeApproval":true,"smartModeBlockReason":"This is a scoped update to a specific standards note within the active research workflow…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_patch","mcpDetails":{"description":"Correct the resume ATS checklist to match Session 2 primary evidence."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["Resume Alteration Standard","8. ATS Format…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_patch","mcpDetails":{"description":"Correct the resume ATS checklist to match Session 2 primary evidence.","requestSmartModeApproval":true,"smartModeBlockReason":"This is a broad repository patch that updates a standards file based on research the user as…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Verify the appended Session 2 research log section."},"arguments":{"path":"20_Progress/Internship/Building System/Resume & Cover Letter — ATS Research Log.md","targetType":"heading","target":["Session 2 (2026-08-29) — pr…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Verify the revised resume source register."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["Resume Alteration Standard","4. Source Register — External Resume-Writ…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Verify the revised resume ATS baseline."},"arguments":{"path":"30_Order/Standards/Resume Alteration Standard.md","targetType":"heading","target":["Resume Alteration Standard","8. ATS Format & Keyword Baseline (Sourced)"]…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Verify the revised cover-letter source register."},"arguments":{"path":"30_Order/Standards/Cover Letter Alteration Standard.md","targetType":"heading","target":["Cover Letter Alteration Standard","7. Source Register — Ex…`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_get_document_map","mcpDetails":{"description":"Inspect the research log headings to verify the appended session."},"arguments":{"path":"20_Progress/Internship/Building System/Resume & Cover Letter — ATS Research Log.md"}}`
- `CallDynamicTool` — `{"namespace":"user-jarvis","toolName":"vault_read","mcpDetails":{"description":"Verify the complete appended Session 2 research findings."},"arguments":{"path":"20_Progress/Internship/Building System/Resume & Cover Letter — ATS Research Log.md","targetType":"heading","target":["Resume & Cover Letter…`

## Actions Taken
- Summary: Read SKILL.md
- Files changed (Cursor): 0
- Lines: +0 / -0
- Files touched (from tool calls): /home/anant_gupta/.claude/skills/obsidian-search/SKILL.md
- Commands run: (none)
- Tool call tally: CallDynamicTool (25), GetDynamicTools (5), ReadFile (1), WebFetch (12), WebSearch (20)
