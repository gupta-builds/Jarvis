---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "CPT, OPT, H1B visa rules"
started_at: 2026-10-23T13:01:28
ended_at: 2026-10-23T13:10:07
exported_at: 2026-10-23T13:10:08
duration_minutes: 8.6
project: Jarvis
cwd: 'D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career'
session_id: a8711819-664b-4922-952b-4190546bfc01
status: raw
turn_count: 2
tools_used:
  Agent: 5
  Bash: 25
  Edit: 2
  Glob: 4
  Grep: 3
  Read: 10
  ToolSearch: 2
  WebSearch: 10
  Write: 1
tokens:
  input: 66
  output: 36011
  cache_creation: 170080
  cache_read: 4382438
  total: 4588595
cost_usd: null
model:
  - "claude-sonnet-5-5"
files_touched:
  - "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad/4jgrdi.txt"
  - "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad/9olqkx.txt"
  - "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad/qpd0h7.txt"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\10_Areas\\Career\\Useful Links.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\10_Areas\\Career\\VISAs & Work Auth\\Current News.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\10_Areas\\Career\\VISAs & Work Auth\\VISA Plan.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Standards\\Enrich\\Reference Standard.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\30_Order\\Templates\\Knowledge\\Reference Template.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\60_Claude\\07_AI_Information\\Jarvis Writing and Formatting.md"
  - "D:\\_Anant\\20_Progress\\Documents\\Jarvis\\HUMAN_WRITING.md"
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# CPT, OPT, H1B visa rules

## You

In one of the plans that's been worked on we have mentioned the H1B track which focuses on visa details that are required for me to go through. Now, with everything that's been coming out recently on the VISA statuses by the government. I am currently a junior, the CPT system has been closed for the university of minnesota. I want to research more in depth what exactly took place since august on these new rules. My major - computer science does not require a internship. So, i doubt the university is going to take any actions regarding this process. Now, we need to research in depth first to understand what exactly was announced, what actions are being taken as of today. How exactly can i get an internship this summer without opting in for pre - OPT. I do not wish to apply for the opt process yet, there is a lot of drawbacks on doing this before i graduate. OPT is as soon as i graduate and step opt is going to be after that, then the H1B visa. Let's lay out the track till h1b visa. Figure out everything about opt, cpt, step opt, recent announcements, etc. A lot of notes were just created in this folder: `10_Areas/Career/VISAs & Work Auth`, `10_Areas/Career/VISAs & Work Auth/VISA Plan` - main, `10_Areas/Life/Plans/Fall 2026` - plans, etc. There might be a few more h1b related files present in this vault  (some from ingestion). Your job is not to lay the notes that were just created. Let's focus on something much more precious and at hand. We have been provided with a lot of resources by the university: `https://isss.umn.edu/fstudents/employment/off-campus` and many more that need to be dug through. Let's dive in massive detail on the latest news and the information about opt/cpt that we require. Only latest research and on trusted non ai generated websites we find information. We are not researching "news", we are searching some law cases, papers, official announcements, official blogs/posts. Let's research first in massive detail on the information that you find. Only after that only write this one note: `10_Areas/Career/VISAs & Work Auth/Current News`. Filled with links that are truly useful for the purpose the plans and these notes have been created for. The research that lands needs to be completely guaranteed to be true. Let's not make assumptions and only list of out correct set of resources for this taks. Research through the internet using firecrawl (if available). Research through a substantial amount of data: solid 10 resources of various types need to land (all will be saying roughly the same thing, we need to find unique and abstract content that gives us more knowledge on the situation - not repetitive). Let's begin the research.

## Claude

I'll start by checking which research tools are available (Firecrawl, web search) and what the existing notes already cover.

The reports are in. Two gaps matter: the ICE broadcast messages and the complaint came back as unreadable PDFs, but the harness saved them locally. I'll extract the text myself.

pdftotext is available. I'll extract all three into the scratchpad.

The Federal Register API responds to curl, so I can verify the rules there myself. I'll pull the OPT fee notice metadata and the actual CPT/OPT/on-campus regulation text.

The Nov 6 hearing is confirmed on NAFSA's own page. Last, I'll check UMN's own pages for on-campus work, the CS co-op route, travel and work abroad, and the ISSS updates hub.

Let me verify one H-1B claim directly on USCIS's own page: whether the $100,000 payment reaches people already in the U.S. changing status from F-1.

All the research is in. Now I'll write the note, following the vault's Reference Standard (`type: reference`, `reference_kind: link-hub`) and the formatting rules.

Two lines need correcting: one claim about the CS degree and STEM status that I can't support, and one awkward phrase.

I wrote `10_Areas/Career/VISAs & Work Auth/Current News.md`. It holds about 25 linked primary sources. Firecrawl isn't installed here, so I read the documents directly (PDF text extraction and the Federal Register API). I didn't write anything else, and I didn't append to the session log because your global rule says not to. I haven't run Vault Lint on the note.

**What I verified in the primary text**
- **CPT guidance:** ICE's two broadcast messages (2608-01 on Aug 12, 2608-02 on Aug 24) say CPT is valid only if it is required of every student in the degree. 2608-02 says an optional elective fails that test. They don't change the regulation, 8 CFR 214.2(f)(10), and each says it is not itself a rule.
- **Why UMN paused:** The messages threaten schools with loss of SEVP certification and DSOs with perjury exposure. That explains the UMN pause.
- **ISSS pause:** ISSS's only exception is an experience "required for their degree." Its CPT pages were last updated Sept 3 and were unchanged when I read them today.
- **CPT lawsuit:** AAU v. DHS, No. 1:26-cv-14520 (D. Mass.), was filed Oct 5. NAFSA's page says the injunction hearing is Nov 6, and I found no ruling through Oct 22. The complaint says the old rule allowed CPT when it earned credit *or* was mandatory.
- **OPT fee proposal:** It is 91 FR 64566, with $70,000 for initial OPT and $30,000 for any later OPT, charged to the school. Comments close Nov 9, not Nov 7 as one source said. The notice says the $70,000 triggers on the first OPT recommendation of any type. Using pre-completion OPT would therefore spend it early, and a later post-completion OPT would then cost $30,000.
- **Duration of status rule:** It is blocked nationwide by a Sept 14 injunction. The government's appeal does not revive it.
- **H-1B:** The $100,000 payment is vacated, with an appeal pending. The weighted lottery is in effect. The $103,265 fee and the DOL wage rule are only proposed.

**For your summer, from what I could verify**
- Under the current guidance, CPT is closed for a CS major whose degree has no required internship. The Nov 6 hearing is the realistic chance of that changing, and it may not.
- On-campus work is the cleanest route. It allows 20 hours a week in term and full-time in breaks. ISSS says "on-campus" includes an off-campus site that is educationally affiliated through the curriculum or contractually funded research.
- Pre-completion OPT is the only authorized off-campus route left. Your instinct to skip it is backed by three costs. It comes out of your 12 months. Using all 12 forfeits STEM OPT. If the fee rule is finalized, it would also trigger the $70,000.
- Remote work for a foreign employer from abroad is unverified. No source I read answers it, so it is an open question for ISSS.

**What I couldn't verify**
- The Nov 6 hearing is from NAFSA's page. I didn't check the court docket.
- Whether the $100,000 payment applies to an F-1 student changing status inside the U.S. Only law firms and universities say it doesn't. I couldn't find a USCIS or court statement.
- Whether UMN would pay the OPT fee or pass it on.
- ISSS's duration-of-status FAQ contradicts its own hub banner on the effective date, and its transition cutoff (Mar 18, 2027) doesn't match six months from Sept 15 (Mar 15).

The note ends with six open-question tasks. The first is a written question to ISSS about non-required CPT and whether CS has any required experience.

### Tool Calls

- `ToolSearch` -- `{"query":"firecrawl","max_results":5}`
- `ToolSearch` -- `{"query":"select:WebSearch","max_results":1}`
- `Glob` -- pattern `10_Areas/Career/VISAs & Work Auth/**` path ``
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\VISAs & Work Auth\Current News.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\VISAs & Work Auth\VISA Plan.md`
- `WebSearch` -- `{"query":"University of Minnesota ISSS CPT suspended 2026 F-1 students","mode":"extended"}`
- `WebSearch` -- `{"query":"DHS proposed rule F-1 curricular practical training OPT Federal Register 2026","mode":"extended"}`
- `WebSearch` -- `{"query":"ICE SEVP broadcast message CPT 2026","mode":"extended"}`
- `Agent` -- `{"description":"Fetch UMN ISSS off-campus page","subagent_type":"web-fetch","prompt":"Fetch https://isss.umn.edu/fstudents/employment/off-campus and also https://isss.umn.edu/forms and https://isss.umn.edu/fstudents/employment (and follow any ISSS links on the off-campus page about CPT, pre-completion OPT, STEM OPT, post-completion OPT, on-campus employment, severe economic hardship, or the CPT pause / SEVP guidance, up to 6 additional isss.umn.edu pages). For each page report: exact URL, any \u0027last updated\u0027 date, and VERBATIM quotes of every passage about the CPT pause/hold, SEVP guidance, the lawsuit, the DHS rule, and what students may/may not do (including how students whose CS degree does not require an internship are treated, and OPT guidance). Also list every external link (ice.gov, studyinthestates, federalregister, uscis, nafsa etc.) these pages point to, with URLs. Do not paraphrase the key passages; quote them. Say clearly if a page could not be fetched."}`
- `Agent` -- `{"description":"Fetch ICE broadcast messages CPT","subagent_type":"web-fetch","prompt":"Fetch the ICE/SEVP primary documents on CPT from August 2026: https://www.ice.gov/doclib/sevis/pdf/bcm260801.pdf (BCM 2608-01, Aug 12 2026) and try to find and fetch the follow-up BCM 2608-02 (Aug 24 2026) from ice.gov (try https://www.ice.gov/doclib/sevis/pdf/bcm260802.pdf, and the SEVP broadcast messages index at https://www.ice.gov/sevis/broadcast-messages or https://studyinthestates.dhs.gov). Report: exact URL fetched, title, date, number, and VERBATIM the full operative text (or as much as possible) including the Q\u0026A, the definition of \u0027integral\u0027, what DSOs must do, any deadlines, documentation requests, certification consequences, and anything about OPT/pre-completion OPT/STEM OPT. Quote, do not paraphrase. State clearly if any document could not be retrieved or if you could only get a secondary summary."}`
- `Agent` -- `{"description":"Fetch OPT fee NPRM primary sources","subagent_type":"web-fetch","prompt":"Find and fetch the primary documents for the DHS proposed rule on OPT fees announced Oct 7 2026 (reported docket ICEB-2026-0100, $70,000 initial OPT / $30,000 subsequent OPT, published in Federal Register ~Oct 8 2026). Fetch https://www.dhs.gov/news/2026/10/07/dhs-proposes-fees-foreign-student-work-program-protect-american-jobs and locate the Federal Register notice on federalregister.gov (search federalregister.gov for the rule) and regulations.gov docket. Report: exact URLs, the rule title, agency, RIN, docket number, publication date, comment deadline (exact date), who is charged the fee (schools vs students vs employers), whether it covers STEM OPT, post-completion vs pre-completion OPT, CPT, effective date, and VERBATIM quotes of the key operative paragraphs and the summary. Also resolve the discrepancy: one source says comment deadline Nov 9, another ~Nov 7. Quote the Federal Register wording. State clearly if any page could not be fetched."}`
- `Agent` -- `{"description":"Fetch CPT lawsuit primary sources","subagent_type":"web-fetch","prompt":"Research the lawsuit filed around Oct 5 2026 by higher-education associations (reported: AAU, possibly ACE, APLU, NAFSA or similar) against DHS/ICE/SEVP over the August 2026 CPT guidance (BCM 2608-01 and 2608-02). Fetch primary or authoritative sources: the press release from the plaintiffs (e.g., aau.edu, acenet.edu, nafsa.org, aplu.org), court docket/complaint (courtlistener.com, the court\u0027s site, or the association\u0027s PDF), and any ruling or TRO/preliminary injunction since. Report: exact URLs, plaintiffs, defendants, court and case number, filing date, claims (APA etc.), relief requested, and the CURRENT status (any hearing dates, ruling, injunction) with dates, with VERBATIM quotes of key passages. Also fetch https://www.nafsa.org pages on the CPT guidance if available. Clearly say what is verified from a primary document vs only reported by secondary sources, and if a page could not be fetched."}`
- `Agent` -- `{"description":"Fetch DHS Sept 15 rule and lawsuit","subagent_type":"web-fetch","prompt":"UMN ISSS\u0027s forms page (https://isss.umn.edu/forms) reportedly says \u0027a lawsuit has paused implementation of a DHS rule that was originally set for September 15, 2026\u0027 affecting F-1 students. Fetch that page and identify which rule this is. Then find primary sources (federalregister.gov, dhs.gov, ice.gov, studyinthestates.dhs.gov, court docket) for that rule (possibly the \u0027duration of status\u0027 / fixed admission period rule for F-1/J-1, or another F-1 rule such as OPT changes, employment authorization, or SEVIS changes). Report: rule name, Federal Register citation and date, what it changes for F-1 students (including OPT/CPT/STEM OPT/work authorization and how long students may stay), the effective date, the lawsuit (court, case number, plaintiffs, date) and its CURRENT status (stay/injunction/ruling with dates). Give exact URLs and VERBATIM quotes of key passages. Clearly separate verified-from-primary from secondary-only claims, and say if a page could not be fetched."}`
- `Bash` -- `cd "C:/Users/anant/.claude/projects/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/tool-results/" && ls -la *.pdf && which pdftotext; python -I -c "import pypdf;print(pypdf.__version__)" 2>&1 | head -1; python -I -c "import fitz;print('fitz ok')" 2>&1 | head -1`
```
-rw-r--r-- 1 anant 197609 166258 Oct 23 13:02 [REDACTED].pdf
-rw-r--r-- 1 anant 197609 155113 Oct 23 13:02 [REDACTED].pdf
-rw-r--r-- 1 anant 197609 662713 Oct 23 13:02 [REDACTED].pdf
/mingw64/bin/pdftotext
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Apps > Advanced app settings > App execution aliases.
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `SRC="C:/Users/anant/.claude/projects/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/tool-results"; OUT="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; mkdir -p "$OUT"; for f in 4jgrdi 9olqkx qpd0h7; do pdftotext -layout "$SRC/webfetch-"*"-$f.pdf" "$OUT/$f.txt"; echo "== $f"; wc -c "$OUT/$f.txt"; head -8 "$OUT/$f.txt"; done`
```
== 4jgrdi
4752 C:/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/scratchpad/4jgrdi.txt
Broadcast Message: Reminder of Liability for DSOs Regarding CPT Authorization

To: PDSOs and DSOs at SEVP-certified schools

Date: August 12, 2026

BCM Number: 2608-01

== 9olqkx
7186 C:/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/scratchpad/9olqkx.txt
Broadcast Message: Guidance for Designated School Officials regarding Curricular
Practical Training

To: PDSOs and DSOs at SEVP-certified Schools

Date: August 24, 2026

BCM Number: 2608-02
== qpd0h7
92551 C:/Users/anant/AppData/Local/Temp/claude/[REDACTED]/[REDACTED]/scratchpad/qpd0h7.txt
     UNITED STATES DISTRICT COURT
FOR THE DISTRICT OF MASSACHUSETTS

ASSOCIATION OF AMERICAN
UNIVERSITIES;

PRESIDENTS' ALLIANCE ON HIGHER
EDUCATION AND IMMIGRATION;
```
- `Read` -- `C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad/4jgrdi.txt`
- `Read` -- `C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad/9olqkx.txt`
- `Read` -- `C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad/qpd0h7.txt`
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL -m 30 -o fr1.json -w "FR 2026-14439: %{http_code} %{size_download}\n" "https://www.federalregister.gov/api/v1/documents/2026-14439.json?fields[]=title&fields[]=citation&fields[]=publication_date&fields[]=effective_on&fields[]=html_url&fields[]=document_number&fields[]=docket_ids&fields[]=regulation_id_numbers"
curl -sL -m 30 -o ecfr.json -w "eCFR: %{http_code} %{size_download}\n" "https://www.ecfr.gov/api/versioner/v1/full/2026-10-01/title-8.xml?part=214&section=214.2"
head -c 600 fr1.json; echo; head -c 300 ecfr.json`
```
FR 2026-14439: 200 572
eCFR: 406 171
{"title":"Establishing a Fixed Time Period of Admission and an Extension of Stay Procedure for Nonimmigrant Academic Students, Exchange Visitors, and Representatives of Foreign Information Media","citation":"91 FR 44976","publication_date":"2026-07-17","effective_on":"2026-09-15","html_url":"https://www.federalregister.gov/documents/2026/07/17/2026-14439/establishing-a-fixed-time-period-of-admission-and-an-extension-of-stay-procedure-for-nonimmigrant","document_number":"2026-14439","docket_ids":["DHS Docket No. ICEB-2025-0001"],"regulation_id_numbers":["1653-AA95"]}
<error>
  <message>This endpoint requires response compression. Send an Accept-Encoding header that permits compression.</message>
  <supportCode>11</supportCode>
</error>
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `WebSearch` -- `{"query":"\"91 FR 64566\" Optional Practical Training fee proposed rule Federal Register","mode":"standard"}`
- `WebSearch` -- `{"query":"First Circuit duration of status preliminary injunction Saylor appeal stay October 2026","mode":"extended"}`
- `WebSearch` -- `{"query":"UMN CSE co-op international students CPT requirement 2026","mode":"standard"}`
- `WebSearch` -- `{"query":"H-1B $100,000 fee proclamation change of status F-1 exemption court ruling 2026 USCIS","mode":"extended"}`
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 40 "https://www.federalregister.gov/api/v1/documents/2026-20660.json?fields[]=title&fields[]=citation&fields[]=publication_date&fields[]=effective_on&fields[]=html_url&fields[]=docket_ids&fields[]=regulation_id_numbers&fields[]=comments_close_on&fields[]=type&fields[]=abstract&fields[]=dates&fields[]=agencies&fields[]=page_length" | head -c 2500; echo; echo ----;
curl -sL --compressed -m 60 -o ecfr.xml -w "eCFR: %{http_code} %{size_download}\n" "https://www.ecfr.gov/api/versioner/v1/full/2026-10-01/title-8.xml?part=214&section=214.2"; head -c 200 ecfr.xml`
```
{"title":"Optional Practical Training Fees","citation":"91 FR 64566","publication_date":"2026-10-08","effective_on":null,"html_url":"https://www.federalregister.gov/documents/2026/10/08/2026-20660/optional-practical-training-fees","docket_ids":["DHS Docket No. ICEB-2026-0100"],"regulation_id_numbers":["1653-AB01"],"comments_close_on":"2026-11-09","type":"Proposed Rule","abstract":"This rule proposes new fees for Optional Practical Training (OPT) to combat fraud, strengthen the integrity of the immigration system, and protect U.S. workers. The following fees would apply for each F-1 nonimmigrant student to engage in OPT through a Student and Exchange Visitor Program-certified institution: $70,000 for initial OPT; and $30,000 for any subsequent OPT.","dates":"Comments must be received on or before November 9, 2026. Information collection comment period: Comments on the information collection described in the Paperwork Reduction Act section below must be received by December 7, 2026.","agencies":[{"raw_name":"DEPARTMENT OF HOMELAND SECURITY","name":"Homeland Security Department","id":227,"url":"https://www.federalregister.gov/agencies/homeland-security-department","json_url":"https://www.federalregister.gov/api/v1/agencies/227","parent_id":null,"slug":"homeland-security-department"}],"page_length":35}
----
eCFR: 200 168537
<?xml version="1.0" encoding="UTF-8"?> 
<DIV8 N="214.2" TYPE="SECTION" hierarchy_metadata="{&quot;path&quot;:&quot;/on/_SUBSTITUTE_DATE_/title-8/section-214.2&quot;,&quot;citation&quot;:&quot;8 CFR 21
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 60 -o nprm.html "https://www.federalregister.gov/documents/full_text/html/2026/10/08/2026-20660.html" -w "%{http_code} %{size_download}\n"; 
curl -sL --compressed -m 60 -o nprm.json "https://www.federalregister.gov/api/v1/documents/2026-20660.json?fields[]=raw_text_url&fields[]=body_html_url"; cat nprm.json; echo
RT=$(sed -n 's/.*"raw_text_url":"\([^"]*\)".*/\1/p' nprm.json); echo $RT; curl -sL --compressed -m 60 -o nprm.txt "$RT" -w "%{http_code} %{size_download}\n"
grep -n -i -E "STEM|pre-completion|curricular|CPT|effective|post-completion|employer|E-Verify" nprm.txt | head -60`
```
200 69947
{"raw_text_url":"https://www.federalregister.gov/documents/full_text/text/2026/10/08/2026-20660.txt","body_html_url":"https://www.federalregister.gov/documents/full_text/html/2026/10/08/2026-20660.html"}
https://www.federalregister.gov/documents/full_text/text/2026/10/08/2026-20660.txt
200 58945
Binary file nprm.txt matches
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
sed -e 's/<[^>]*>/ /g' ecfr.xml | tr -s ' \n' > ecfr.txt; wc -c ecfr.txt
grep -n -o -E "\(10\) Practical training\..{0,100}" ecfr.txt | head; 
awk '/\(10\) Practical training\./{f=1} f{print} /\(11\) Reinstatement/{exit}' ecfr.txt | head -c 9000`
```
720978 ecfr.txt
458:(10) Practical training. Practical training may be authorized to an F-1 student who has been lawfully enrolled on a full-tim
 (10) Practical training. Practical training may be authorized to an F-1 student who has been lawfully enrolled on a full-time basis, in an approved SEVP-certified college, university, conservatory, or seminary for one full academic year. This paragraph (f)(10) also includes students who, during their course of study, were enrolled in a study abroad program, if the student had spent at least one full academic term enrolled in a full course of study in the United States prior to studying abroad. A student may be authorized 12 months of practical training, and becomes eligible for another 12 months of practical training when they change to a higher educational level. Students in English language training programs are ineligible for practical training. An eligible student may request employment authorization for practical training in a position that is directly related to their major area of study. There are two types of practical training available: 
 (i) Curricular practical training. An F-1 student may be authorized by the DSO to participate in a curricular practical training program that is an integral part of an established curriculum. Curricular practical training is defined to be alternative work/study, internship, cooperative education or any other type of required internship or practicum that is offered by sponsoring employers through cooperative agreements with the school. Students who have received one year or more of full time curricular practical training are ineligible for post-completion academic training. Exceptions to the one academic year requirement are provided for students enrolled in graduate studies that require immediate participation in curricular practical training. A request for authorization for curricular practical training must be made to the DSO. A student may begin curricular practical training only after receiving their Form I-20 or successor form with the DSO endorsement. To grant authorization for a student to engage in curricular practical training, a DSO will update the student's record in SEVIS as being authorized for curricular practical training that is directly related to the student's major area of study. The DSO will indicate whether the training is full-time or part-time, the employer and location, and the employment start and end date. The DSO must sign, date, and return the Form I-20 or successor form to the student prior to the student's commencement of employment indicating that curricular practical training has been approved. 
 (ii) Optional practical training —(A) General. Consistent with the application and approval process in paragraph (f)(11) of this section, a student may apply to USCIS for authorization for temporary employment for optional practical training directly related to the student's major area of study. The student may not begin optional practical training until the date indicated on his or her employment authorization document, Form I-766. A student may be granted authorization to engage in temporary employment for optional practical training: 
 ( 1 ) During the student's annual vacation and at other times when school is not in session, if the student is currently enrolled, and is eligible for registration and intends to register for the next term or session; 
 ( 2 ) While school is in session, provided that practical training does not exceed 20 hours a week while school is in session; or 
 ( 3 ) After completion of the course of study, or, for a student in a bachelor's, master's, or doctoral degree program, after completion of all course requirements for the degree (excluding thesis or equivalent). Continued enrollment, for the school's administrative purposes, after all requirements for the degree have been met does not preclude eligibility for optional practical training. A student must complete all practical training within a 14-month period following the completion of study, except that a 24-month extension pursuant to paragraph (f)(10)(ii)(C) of this section does not need to be completed within such 14-month period. 
 (B) Termination of practical training. Authorization to engage in optional practical training employment is automatically terminated when the student transfers to another school or begins study at another educational level. 
 (C) 24-month extension of post-completion OPT for a science, technology, engineering, or mathematics (STEM) degree. Consistent with paragraph (f)(11)(i)(C) of this section, a qualified student may apply for an extension of OPT while in a valid period of post-completion OPT authorized under 8 CFR 274a.12(c)(3)(i)(B). An extension will be for 24 months for the first qualifying degree for which the student has completed all course requirements (excluding thesis or equivalent), including any qualifying degree as part of a dual degree program, subject to the requirement in paragraph (f)(10)(ii)(C)( 3 ) of this section that previously obtained degrees must have been conferred. If a student completes all such course requirements for another qualifying degree at a higher degree level than the first, the student may apply for a second 24-month extension of OPT while in a valid period of post-completion OPT authorized under 8 CFR 274a.12(c)(3)(i)(B). In no event may a student be authorized for more than two lifetime STEM OPT extensions. A student who was granted a 17-month OPT extension under the rule issued at 73 FR 18944, whether or not such student requests an additional 7-month period of STEM OPT under 8 CFR 214.16, is considered to have been authorized for one STEM OPT extension, and may be eligible for only one more STEM OPT extension. Any subsequent application for an additional 24-month OPT extension under this paragraph (f)(10)(ii)(C) must be based on a degree at a higher degree level than the degree that was the basis for the student's first OPT extension. In order to qualify for an extension of post-completion OPT based upon a STEM degree, all of the following requirements must be met. 
 ( 1 ) Accreditation. The degree that is the basis for the 24-month OPT extension is from a U.S. educational institution accredited by an accrediting agency recognized by the Department of Education at the time of application. 
 ( 2 ) DHS-approved degree. The degree that is the basis for the 24-month OPT extension is a bachelor's, master's, or doctoral degree in a field determined by the Secretary, or his or her designee, to qualify within a science, technology, engineering, or mathematics field. 
 ( i ) The term “science, technology, engineering or mathematics field” means a field included in the Department of Education's Classification of Instructional Programs taxonomy within the two-digit series or successor series containing engineering, biological sciences, mathematics, and physical sciences, or a related field. In general, related fields will include fields involving research, innovation, or development of new technologies using engineering, mathematics, computer science, or natural sciences (including physical, biological, and agricultural sciences). 
 ( ii ) The Secretary, or his or her designee, will maintain the STEM Designated Degree Program List, which will be a complete list of qualifying degree program categories, published on the Student and Exchange Visitor Program Web site at http://www.ice.gov/sevis . Changes that are made to the Designated Degree Program List may also be published in a notice in the Federal Register. All program categories included on the list must be consistent with the definition set forth in paragraph (f)(10)(ii)(C)( 2 )( i ) of this section. 
 ( iii ) At the time the DSO recommends a 24-month OPT extension under this paragraph (f)(10)(ii)(C) in SEVIS, the degree that is the basis for the application for the OPT extension must be contained within a category on the STEM Designated Degree Program List. 
 ( 3 ) Previously obtained STEM degree(s). The degree that is the basis for the 24-month OPT extension under this paragraph (f)(10)(ii)(C) may be, but is not required to be, the degree that is the basis for the post-completion OPT period authorized under 8 CFR 274a.12(c)(3)(i)(B). If an application for a 24-month OPT extension under this paragraph (f)(10)(ii)(C) is based upon a degree obtained previous to the degree that provided the basis for the period of post-completion OPT authorized under 8 CFR 274a.12(c)(3)(i)(B), that previously obtained degree must have been conferred from a U.S. educational institution that is accredited and SEVP-certified at the time the student's DSO recommends the student for the 24-month OPT extension and must be in a degree program category included on the current STEM Designated Degree Program List at the time of the DSO recommendation. That previously obtained degree must have been conferred within the 10 years preceding the date the DSO recommends the student for the 24-month OPT extension. 
 ( 4 ) Eligible practical training opportunity. The STEM practical training
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
grep -a -n -i -E "STEM|pre-completion|curricular|effective date|proposed .*§|214\.2\(f\)" nprm.txt | head -50; echo ====; grep -a -n -i -B1 -A3 "Executive Summary\|II. Background" nprm.txt | head -40`
```
77:system, and protect U.S. workers. The following fees would apply for 
193:CPT Curricular Practical Training
209:SEVIS Student and Exchange Visitor Information System
211:STEM Science, Technology, Engineering, and Mathematics
272:acknowledged as a valid exercise of DHS's statutory authority stemming 
312:Visitor Information System (SEVIS), which collects information related 
391:    \22\ E.g. 8 CFR 214.2(f)(6)(iii)(A-C) (authorizing the DSO to 
392:reduce a student's course load); 214.2(f)(6)(iii)(E) (requiring DSOs 
393:to update SEVIS); 214.2(f)(7) (establishing the conditions under 
396:214.2(f)(9)(ii)(D) (requiring DSO to complete employment 
397:authorization certification in SEVIS); 214.2(f)(9)(iii) (requiring 
399:information); 214.2(f)(10)(ii)(C) (requiring DSOs to recommend OPT 
401:participation); 214.2(f)(11)(ii) (requiring additional DSO 
417:stated more generally in the prior regulations under 8 CFR 214.2(f)(10) 
427:2008, DHS officially coined two types of OPT as pre-completion and 
464:    \26\ See 8 CFR 214.2(f)(10) (current).
465:    \27\ See Pre-Completion Interval Training: F-1 Student Work 
468:Months for F-1 Nonimmigrant Students With STEM Degrees and Expanding 
478:technology, engineering, and mathematics (STEM) \29\ field from an 
480:STEM OPT rule, substantially increasing the duration of the post-
481:completion STEM OPT extension to 24 months while further adding 
483:and employers.\31\ The 2016 rule on STEM OPT largely remains 
487:    \29\ The educational degrees eligible for the STEM OPT extension 
488:must be in a field determined by DHS on the STEM Designated Degree 
489:Program List to qualify within a STEM field. Since the 2016 rule, 
490:DHS has periodically updated and published the STEM Designated 
493:of Homeland Security STEM Designated Degree Program List, 87 FR 3317 
494:(Jan. 21, 2022); Update to the Department of Homeland Security STEM 
496:to the Department of Homeland Security STEM Designated Degree 
499:Months for F-1 Nonimmigrant Students With STEM Degrees and Expanding 
503:Nonimmigrant Students with STEM Degrees and Cap-Gap Relief for All 
512:    \32\ See 8 CFR 214.2(f)(10)(ii)-(f)(12).
516:214.2(f)(5)(vi). Under the 2008 and 2016 rule, the cap-gap extension 
548:    \35\ See 8 CFR 214.2(f)(5)(vi). See also U.S. Citizenship and 
565:system used to facilitate the certification of schools, maintain 
583:under 8 CFR 214.2(f)(10) provides that an F-1 nonimmigrant student who 
588:current regulations provide two types of practical training: Curricular 
598:course of study . . . '' See also 8 CFR 214.2(f).
599:    \40\ See 8 CFR 214.2(f)(9)-(10); 8 CFR 274a.12(b)(6).
600:    \41\ See 8 CFR 214.2(f)(10).
601:    \42\ See 8 CFR 214.2(f)(10)(i).
616:    \43\ See 8 CFR 214.2(f)(10)(ii).
617:    \44\ See 8 CFR 214.2(f)(10)(i).
638:I-765. See 8 CFR 214.1(c); 214.2(f)(7)(v). Alternatively, if the F-1 
642:admission period. See 8 CFR 214.2(f)(10)(ii)(D).
645:    \45\ See 8 CFR 214.2(f)(11)(i)-(ii).
646:    \46\ See 8 CFR 214.2(f)(11).
647:    \47\ 8 CFR 214.2(f)(11)(ii).
648:    \48\ 8 CFR 214.2(f)(10)(ii), (f)(11)(iii).
651:2. STEM OPT Extension
====
213-
214:III. Background
215-
216-A. Legal Authority
217-
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
grep -a -n -i -E "subsequent OPT|initial OPT|each F-1|extension" nprm.txt | head -40; echo ===; grep -a -n "List of Subjects\|Regulatory Text\|PART 214\|§ 214" nprm.txt | head`
```
78:each F-1 nonimmigrant student to engage in OPT through a Student and 
80:OPT; and $30,000 for any subsequent OPT.
198:EOS Extension of Stay
395:extension of stay and requiring DSOs to update SEVIS); 
400:extension as a prerequisite for nonimmigrant students 
446:period subject to extension for not over two additional six-month 
453:to extension for not over two additional six-month periods . . .''); 
476:additional 17-month extension to the initial 12 months of OPT for F-1 
481:completion STEM OPT extension to 24 months while further adding 
487:    \29\ The educational degrees eligible for the STEM OPT extension 
516:214.2(f)(5)(vi). Under the 2008 and 2016 rule, the cap-gap extension 
549:Immig. Services, Extension of Post Completion Optional Practical 
551:Cap-Gap Regulations, available at <a href="https://www.uscis.gov/working-in-the-united-states/temporary-workers/[REDACTED]/[REDACTED]">https://www.uscis.gov/working-in-the-united-states/temporary-workers/[REDACTED]/[REDACTED]</a> (last visited Sept. 9, 2025).
637:apply for an extension of stay (EOS) with USCIS in addition to the Form 
651:2. STEM OPT Extension
658:post-completion OPT have the option to apply for a STEM OPT extension 
665:requesting a STEM OPT extension after the F-1 nonimmigrant student's 
667:need to apply for an extension of stay (EOS) with USCIS in addition to 
692:extension. See U.S. Immig. and Customs Enf't, DHS STEM Designated 
1016:Extension of Stay Procedure for Nonimmigrant Academic Students, 
1095:participating in the STEM OPT extensions in 2016).
1125:participants in the extension program far surpassed DHS's estimated 
1185:the STEM OPT extension was instituted to address the immediate 
1300:start of their STEM OPT extension and thus, be subject to FICA taxes 
1477:extension of stay when seeking to engage in a form of OPT. In other 
1480:student received an Extension of Stay (EOS) authorization through USCIS 
1484:believes that the initial OPT fee amount should be higher than the 
1510:``Establishing a Fixed Time Period of Admission and an Extension of 
1516:implemented additional changes to admission and extension 
1647:A. Establishing a Fee for Initial and Any Subsequent OPT
1660:educational institution must pay for each F-1 nonimmigrant student 
1668:subsequent OPT recommendation for an F-1 nonimmigrant student who has 
1669:previously participated in OPT and has previously paid the initial OPT 
1673:initial OPT (regardless of whether it is another pre-completion OPT, 
1674:post-completion OPT, or STEM OPT extension). Id. The OPT fee is not 
1683:As with the initial OPT fee, the subsequent OPT fee would need to be 
1706:    For the initial OPT fees, the proposed rule provides that a school 
1712:document for OPT. Id. Similarly, for subsequent OPT fees, the proposed 
1715:extension. See proposed 8 CFR 214.13(i)(2). The DSO would need to 
1752:subsequent OPT fee of $30,000 per alien. Id.
===
3217:List of Subjects in 8 CFR Part 214
3228:PART 214--NONIMMIGRANT CLASSES
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; sed -n '1645,1760p' nprm.txt`
```
V. Discussion of Changes

A. Establishing a Fee for Initial and Any Subsequent OPT

    The proposed rule would establish a fee of $70,000 per F-1 
nonimmigrant

[[Page 64577]]

student applicable to SEVP-certified schools that recommend an F-1 
nonimmigrant student to engage in OPT for the first time. See proposed 
8 CFR 214.2(f)(11)(ii) and 214.13(i)(1). This fee amount would apply to 
any type of OPT that the student participates in for the first time 
(irrespective of whether it is pre-completion OPT or post-completion 
OPT). Id. The initial $70,000 is a one-time fee that an SEVP-certified 
educational institution must pay for each F-1 nonimmigrant student 
prior to a DSO's initial recommendation of an F-1 nonimmigrant student 
to participate in any type of OPT under 8 CFR 214.2(f)(10)(ii) for the 
first time. To be clear, this OPT fee would not be tied to a specific 
employer; rather the OPT fee would be applicable when a school decides 
to recommend an F-1 nonimmigrant student for any type of OPT.
    The proposed rule would also establish a fee of $30,000 per F-1 
nonimmigrant student applicable to SEVP-certified schools that make any 
subsequent OPT recommendation for an F-1 nonimmigrant student who has 
previously participated in OPT and has previously paid the initial OPT 
fee of $70,000. See proposed 8 CFR 214.13(i)(2). As such, this 
subsequent $30,000 fee would apply to any type of OPT that an F-1 
nonimmigrant student participates in after having completed their 
initial OPT (regardless of whether it is another pre-completion OPT, 
post-completion OPT, or STEM OPT extension). Id. The OPT fee is not 
triggered by a change in employer but rather a school's decision to 
recommend a student for any type of OPT. For example, if an F-1 
nonimmigrant student obtains a DSO recommendation for pre-completion 
OPT and completes the training, they would need to obtain a subsequent 
DSO recommendation for post-completion OPT, regardless of whether the 
employer is the same for post-completion OPT and pre-completion OPT. In 
this instance, the school would need to pay $70,000 for the student's 
pre-completion OPT and $30,000 for the student's post-completion OPT. 
As with the initial OPT fee, the subsequent OPT fee would need to be 
paid for the F-1 nonimmigrant student prior to the DSO entering the OPT 
recommendation in SEVIS. See proposed 8 CFR 214.2(f)(11)(ii). 
Additionally, USCIS would not grant employment authorization to any 
student prior to payment of the applicable OPT fee for the student. See 
proposed 8 CFR 214.2(f)(11)(iii).
    The proposed rule reiterates that the schools must pay the 
applicable OPT fees prior to the DSO entering the OPT recommendation 
for an F-1 nonimmigrant student in SEVIS. See proposed 8 CFR 
214.2(f)(11)(i)-(ii), 214.13(i). A DSO may not enter the OPT 
recommendation in SEVIS if the OPT fee has not yet been paid. The 
proposed rule requires the DSO to confirm that the school has paid the 
applicable OPT fee prior to updating SEVIS with the DSO's 
recommendation and before the student can apply to USCIS for employment 
authorization. See proposed 8 CFR 214.2(f)(11)(ii)(B). The DSO would 
need to provide the F-1 nonimmigrant student with a new I-20 with the 
DSO's recommendation and OPT fee payment information so that the 
student may file the Form I-765 with USCIS. See proposed 8 CFR 
214.2(f)(11)(i), (ii)(C). The proposed rule provides that USCIS would 
not grant employment authorization to any student where the school has 
failed to pay the applicable OPT fee prior to issuing an OPT 
recommendation or in instances where the school has completely failed 
to pay the applicable OPT fees. See proposed 8 CFR 214.2(f)(11)(iii).
    For the initial OPT fees, the proposed rule provides that a school 
may request a refund if the F-1 nonimmigrant student has not received 
an employment authorization document for OPT for which the payment has 
been made. See proposed 8 CFR 214.13(i)(1). The proposed rule makes 
clear that this fee would not be refunded under any circumstances once 
the F-1 nonimmigrant student has received an employment authorization 
document for OPT. Id. Similarly, for subsequent OPT fees, the proposed 
rule provides that a school may request refund if the student has not 
received an employment authorization document for OPT or an OPT 
extension. See proposed 8 CFR 214.13(i)(2). The DSO would need to 
remove the F-1 nonimmigrant student's OPT recommendation in SEVIS 
before requesting a refund. For all refund requests, SEVP would review 
each request on a case-by-case basis and exercise discretion in 
adjudicating the request. See proposed 8 CFR 214.13(i)(1)-(2). The 
proposed rule also provides that SEVP may consider providing further 
guidance on its website regarding the refund request adjudication. Id. 
SEVP's determination on the refund request would be final and not 
appealable. Id.
    DHS has also considered, as an alternative to the approach 
described above, having the one-time initial fee of $70,000 apply again 
to any initial period of OPT following the F-1 student's change to a 
higher educational level (e.g., to a post-bachelor's degree OPT and 
again to the student's master's degree OPT). DHS welcomes public 
comments on the rule in its entirety but especially encourages input 
from the public on this potential alternative.

B. Technical Amendments

    Since an additional fee is being proposed within 8 CFR 214.13, DHS 
has also proposed some clarifying amendments to the current regulatory 
text to refer to a ``SEVIS fee'' rather than a ``fee.'' See proposed 8 
CFR 214.13(b), (e), (e)(1), (e)(3), (g)(3), and (h).

C. Transition Period and Effective Date of the Final Rule

    To facilitate the transition, DHS is proposing that the final rule 
take effect 60 days after the date of publication of the final rule in 
the Federal Register (``effective date''), which would allow school 
officials, F-1 nonimmigrant students, and employers to prepare for 
changes in this fee rule. See proposed 8 CFR 214.13(i)(3).
    The OPT fee of $70,000 would start to apply for F-1 nonimmigrant 
students who will receive a DSO recommendation for any type of OPT that 
is dated on or after the effective date of the final rule. See proposed 
8 CFR 214.13(i)(3). Thereafter, any subsequent DSO recommendations for 
OPT issued for any F-1 student who has previously participated in OPT, 
and for which the $70,000 OPT fee has been paid, will be subject to the 
subsequent OPT fee of $30,000 per alien. Id.

VI. Reliance interests

    Throughout this rulemaking process, DHS has considered whether 
there are any serious reliance interests that would be affected by the 
implementation of this rule. Based on its review and analysis, DHS is 
proposing to apply this rule prospectively to those F-1 nonimmigrant 
students who apply for OPT after the effective date. DHS has considered
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
q() { curl -sL --compressed -m 40 -G "https://www.federalregister.gov/api/v1/documents.json" --data-urlencode "conditions[term]=$1" --data-urlencode "conditions[publication_date][gte]=$2" --data-urlencode "order=newest" --data-urlencode "per_page=15" -d "fields[]=title" -d "fields[]=type" -d "fields[]=publication_date" -d "fields[]=citation" -d "fields[]=html_url" -d "fields[]=comments_close_on" -d "fields[]=effective_on" | tr '{' '\n' | grep -o '"title":"[^"]*"\|"type":"[^"]*"\|"publication_date":"[^"]*"\|"html_url":"[^"]*"\|"comments_close_on":[^,]*\|"effective_on":[^,]*' | paste -sd' ' | sed 's/"title"/\n"title"/g'; echo; }
echo "### H-1B"; q '"H-1B" "specialty occupation"' 2026-01-01
echo "### practical training"; q '"practical training" F-1' 2026-01-01
echo "### cap-subject fee"; q '"cap-subject" H-1B fee' 2026-06-01`
```
### H-1B

"title":"Enhancing Program Integrity and Interagency Coordination in the Administration of the H-1B Nonimmigrant Visa Program" "type":"Presidential Document" "publication_date":"2026-09-23" "html_url":"https://www.federalregister.gov/documents/2026/09/23/2026-19555/[REDACTED]" "comments_close_on":null "effective_on":null} 
"title":"Restriction on Entry of Certain Nonimmigrant Workers" "type":"Presidential Document" "publication_date":"2026-09-23" "html_url":"https://www.federalregister.gov/documents/2026/09/23/2026-19554/restriction-on-entry-of-certain-nonimmigrant-workers" "comments_close_on":null "effective_on":null} 
"title":"Eliminating the Discretionary 60-Day Grace Period" "type":"Proposed Rule" "publication_date":"2026-09-11" "html_url":"https://www.federalregister.gov/documents/2026/09/11/2026-18631/[REDACTED]" "comments_close_on":"2026-11-10" "effective_on":null} 
"title":"Fee for Certain H-1B Petitions" "type":"Proposed Rule" "publication_date":"2026-08-25" "html_url":"https://www.federalregister.gov/documents/2026/08/25/2026-17324/[REDACTED]" "comments_close_on":"2026-09-24" "effective_on":null} 
"title":"Mandatory Electronic Filing (e-Filing)" "type":"Rule" "publication_date":"2026-08-11" "html_url":"https://www.federalregister.gov/documents/2026/08/11/2026-16313/mandatory-electronic-filing-e-filing" "comments_close_on":"2026-10-13" "effective_on":"2026-08-11"} 
"title":"9-11 Response and Biometric Entry-Exit Fee for H-1B and L-1 Visas" "type":"Rule" "publication_date":"2026-08-10" "html_url":"https://www.federalregister.gov/documents/2026/08/10/2026-16231/[REDACTED]" "comments_close_on":null "effective_on":"2026-09-09"} 
"title":"Improving Wage Protections for the Temporary and Permanent Employment of Certain Foreign Nationals in the United States" "type":"Proposed Rule" "publication_date":"2026-03-27" "html_url":"https://www.federalregister.gov/documents/2026/03/27/2026-06017/improving-wage-protections-for-the-temporary-and-permanent-employment-of-certain-foreign-nationals" "comments_close_on":"2026-05-26" "effective_on":null} 
"title":"Improving Continuity for Religious Organizations and Their Employees" "type":"Rule" "publication_date":"2026-01-16" "html_url":"https://www.federalregister.gov/documents/2026/01/16/2026-00830/improving-continuity-for-religious-organizations-and-their-employees" "comments_close_on":"2026-03-17" "effective_on":"2026-01-16"}]}

### practical training

"title":"Optional Practical Training Fees" "type":"Proposed Rule" "publication_date":"2026-10-08" "html_url":"https://www.federalregister.gov/documents/2026/10/08/2026-20660/optional-practical-training-fees" "comments_close_on":"2026-11-09" "effective_on":null} 
"title":"Clinical Laboratory Improvement Amendments of 1988 (CLIA); Virtual Access, Gynecologic Cytology Proficiency Testing (PT), Personnel Qualifications, and Other Changes" "type":"Proposed Rule" "publication_date":"2026-10-08" "html_url":"https://www.federalregister.gov/documents/2026/10/08/2026-20613/[REDACTED]" "comments_close_on":"2026-12-07" "effective_on":null} 
"title":"Eliminating the Discretionary 60-Day Grace Period" "type":"Proposed Rule" "publication_date":"2026-09-11" "html_url":"https://www.federalregister.gov/documents/2026/09/11/2026-18631/[REDACTED]" "comments_close_on":"2026-11-10" "effective_on":null} 
"title":"Fee for Certain H-1B Petitions" "type":"Proposed Rule" "publication_date":"2026-08-25" "html_url":"https://www.federalregister.gov/documents/2026/08/25/2026-17324/[REDACTED]" "comments_close_on":"2026-09-24" "effective_on":null} 
"title":"Reducing Barriers to Medical Use Licensing" "type":"Proposed Rule" "publication_date":"2026-07-27" "html_url":"https://www.federalregister.gov/documents/2026/07/27/2026-15080/reducing-barriers-to-medical-use-licensing" "comments_close_on":"2026-09-10" "effective_on":null} 
"title":"Public Charge Ground of Inadmissibility" "type":"Rule" "publication_date":"2026-07-20" "html_url":"https://www.federalregister.gov/documents/2026/07/20/2026-14539/public-charge-ground-of-inadmissibility" "comments_close_on":null "effective_on":"2026-09-18"} 
"title":"Establishing a Fixed Time Period of Admission and an Extension of Stay Procedure for Nonimmigrant Academic Students, Exchange Visitors, and Representatives of Foreign Information Media" "type":"Rule" "publication_date":"2026-07-17" "html_url":"https://www.federalregister.gov/documents/2026/07/17/2026-14439/establishing-a-fixed-time-period-of-admission-and-an-extension-of-stay-procedure-for-nonimmigrant" "comments_close_on":null "effective_on":"2026-09-15"} 
"title":"Clarification of Discretionary Employment Authorization for Certain Aliens" "type":"Proposed Rule" "publication_date":"2026-06-05" "html_url":"https://www.federalregister.gov/documents/2026/06/05/2026-11285/clarification-of-discretionary-employment-authorization-for-certain-aliens" "comments_close_on":"2026-08-04" "effective_on":null} 
"title":"Adjustment to Premium Processing Fees" "type":"Rule" "publication_date":"2026-01-12" "html_url":"https://www.federalregister.gov/documents/2026/01/12/2026-00321/adjustment-to-premium-processing-fees" "comments_close_on":null "effective_on":"2026-03-01"}]}

### cap-subject fee

"title":"Removing Deference to Prior USCIS Determinations of Eligibility" "type":"Proposed Rule" "publication_date":"2026-10-14" "html_url":"https://www.federalregister.gov/documents/2026/10/14/2026-20941/removing-deference-to-prior-uscis-determinations-of-eligibility" "comments_close_on":"2026-11-13" "effective_on":null} 
"title":"Optional Practical Training Fees" "type":"Proposed Rule" "publication_date":"2026-10-08" "html_url":"https://www.federalregister.gov/documents/2026/10/08/2026-20660/optional-practical-training-fees" "comments_close_on":"2026-11-09" "effective_on":null} 
"title":"Fee for Certain H-1B Petitions" "type":"Proposed Rule" "publication_date":"2026-09-10" "html_url":"https://www.federalregister.gov/documents/2026/09/10/C1-2026-17324/[REDACTED]" "comments_close_on":null "effective_on":null} 
"title":"Fee for Certain H-1B Petitions" "type":"Proposed Rule" "publication_date":"2026-08-25" "html_url":"https://www.federalregister.gov/documents/2026/08/25/2026-17324/[REDACTED]" "comments_close_on":"2026-09-24" "effective_on":null} 
"title":"Unified Agenda of Federal Regulatory and Deregulatory Actions" "type":"Notice" "publication_date":"2026-08-14" "html_url":"https://www.federalregister.gov/documents/2026/08/14/2026-16605/unified-agenda-of-federal-regulatory-and-deregulatory-actions" "comments_close_on":null "effective_on":null} 
"title":"Mandatory Electronic Filing (e-Filing)" "type":"Rule" "publication_date":"2026-08-11" "html_url":"https://www.federalregister.gov/documents/2026/08/11/2026-16313/mandatory-electronic-filing-e-filing" "comments_close_on":"2026-10-13" "effective_on":"2026-08-11"} 
"title":"Establishing a Fixed Time Period of Admission and an Extension of Stay Procedure for Nonimmigrant Academic Students, Exchange Visitors, and Representatives of Foreign Information Media" "type":"Rule" "publication_date":"2026-07-17" "html_url":"https://www.federalregister.gov/documents/2026/07/17/2026-14439/establishing-a-fixed-time-period-of-admission-and-an-extension-of-stay-procedure-for-nonimmigrant" "comments_close_on":null "effective_on":"2026-09-15"} 
"title":"Naturalization Application Fee Adjustments" "type":"Proposed Rule" "publication_date":"2026-06-23" "html_url":"https://www.federalregister.gov/documents/2026/06/23/2026-12542/naturalization-application-fee-adjustments" "comments_close_on":"2026-08-24" "effective_on":null}]}
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
for d in 2026-18631 2026-17324 2026-11285 2026-19554 2026-19555 2026-06017 2026-14439; do echo "######## $d"; curl -sL --compressed -m 40 "https://www.federalregister.gov/api/v1/documents/$d.json?fields[]=title&fields[]=citation&fields[]=publication_date&fields[]=effective_on&fields[]=comments_close_on&fields[]=abstract&fields[]=dates&fields[]=docket_ids&fields[]=regulation_id_numbers&fields[]=agencies&fields[]=executive_order_number&fields[]=signing_date" | sed 's/"agencies":\[[^]]*\]/"agencies":"..."/' | head -c 2200; echo; done`
```
######## 2026-18631
{"title":"Eliminating the Discretionary 60-Day Grace Period","citation":"91 FR 57807","publication_date":"2026-09-11","effective_on":null,"comments_close_on":"2026-11-10","abstract":"The Department of Homeland Security (DHS) proposes to remove regulations at 8 CFR 214.1(l)(2) to restore its previous and long- standing policy of not providing aliens in certain nonimmigrant classifications (and their dependents) with an up to 60-day grace period upon cessation of employment prior to the expiration of the alien's authorized period of stay. This proposal restores a direct relationship between an alien's nonimmigrant status and the specific employment or activity that formed the basis of his or her admission or grant of status in the United States and reduces administrative burden.","dates":"Written comments on the notice of proposed rulemaking (NPRM) must be submitted on or before November 10, 2026. The electronic Federal Docket Management System will accept comments before midnight eastern time at the end of that day.","docket_ids":["CIS No. 2858-26","DHS Docket No. USCIS-2026-0364"],"regulation_id_numbers":["1615-AD22"],"agencies":"...","executive_order_number":null,"signing_date":null}
######## 2026-17324
{"title":"Fee for Certain H-1B Petitions","citation":"91 FR 54817","publication_date":"2026-08-25","effective_on":null,"comments_close_on":"2026-09-24","abstract":"The Department of Homeland Security (DHS) proposes to establish a $103,265 fee, payable at the time of filing, for all H-1B cap-subject petitions, including those eligible for the advanced degree exemption, which would be imposed in addition to all other applicable fees or payments. This fee would serve as a dedicated revenue mechanism to help recover a portion of the federal government's costs of administering the lawful immigration system, including activities carried out by DHS, the U.S. Department of Justice (DOJ), the U.S. Department of State (DOS), and the U.S. Department of Labor (DOL).","dates":"Submission of Public Comments: Written comments must be submitted on or before September 24, 2026. The electronic Federal Docket Management System will accept comments before midnight eastern time at the end of that day.","docket_ids":["CIS No. 2861-26","DHS Docket No. USCIS-2026-0298"],"regulation_id_numbers":["1615-AD20"],"agencies":"...","executive_order_number":null,"signing_date":null}
######## 2026-11285
{"title":"Clarification of Discretionary Employment Authorization for Certain Aliens","citation":"91 FR 34352","publication_date":"2026-06-05","effective_on":null,"comments_close_on":"2026-08-04","abstract":"The Department of Homeland Security proposes to limit and clarify eligibility for discretionary employment authorization for aliens paroled into the United States temporarily for urgent humanitarian reasons or significant public benefit, who have been granted deferred action, or against whom a final order of removal exists and who are temporarily released from custody on an order of supervision. DHS further proposes to specify that aliens applying for employment authorization who admit to committing, have been arrested for, or have been convicted of certain criminal acts do not warrant a favorable exercise of discretion unless there are significant countervailing public interests, which may include assisting law enforcement activity in the United States.","dates":"Submission of Public Comments: Written comments must be submitted on or before August 4, 2026. Comments on the information collection described in the \"Paperwork Reduction Act\" section of this proposed rule must be received on or before August 4, 2026. The electronic Federal Docket Management System will accept comments prior to midnight eastern time at the end of that day.","docket_ids":["CIS No. 2805-25","DHS Docket No. USCIS-2026-0067"],"regulation_id_numbers":["1615-AC98"],"agencies":"...","executive_order_number":null,"signing_date":null}
######## 2026-19554
{"title":"Restriction on Entry of Certain Nonimmigrant Workers","citation":"91 FR 60497","publication_date":"2026-09-23","effective_on":null,"comments_close_on":null,"abstract":null,"dates":null,"docket_ids":[],"regulation_id_numbers":[],"agencies":"...","executive_order_number":null,"signing_date":"2026-09-18"}
######## 2026-19555
{"title":"Enhancing Program Integrity and Interagency Coordination in the Administration of the H-1B Nonimmigrant Visa Program","citation":"91 FR 60501","publication_date":"2026-09-23","effective_on":null,"comments_close_on":null,"abstract":null,"dates":null,"docket_ids":[],"regulation_id_numbers":[],"agencies":"...","executive_order_number":"14431","signing_date":"2026-09-18"}
######## 2026-06017
{"title":"Improving Wage Protections for the Temporary and Permanent Employment of Certain Foreign Nationals in the United States","citation":"91 FR 15454","publication_date":"2026-03-27","effective_on":null,"comments_close_on":"2026-05-26","abstract":"The Department of Labor (DOL or the Department) is issuing this Notice of Proposed Rulemaking (NPRM) to solicit comments and public input regarding its proposal to revise Employment and Training Administration (ETA) regulations governing the prevailing wages for employment opportunities that United States (U.S.) employers seek to fill with alien workers on a permanent or temporary basis through certain EB-2 and EB-3 employment-based immigrant visas via the Permanent Labor Certification (PERM) program or through H-1B, H-1B1, or E-3 nonimmigrant visas. Specifically, DOL is proposing to amend its regulations governing the PERM program and Labor Condition Applications (LCAs) to incorporate changes to the computation of wage levels under the Department's four-tiered prevailing wage structure based on the Occupational Employment and Wage Statistics (OEWS) wage survey administered by the Department's Bureau of Labor Statistics (BLS). These proposed revisions aim to better align prevailing wage levels with the wages paid to U.S. workers who are similarly employed in the occupation and area of intended employment. The Department's proposed revisions also seek to strengthen program integrity by reducing the incentive for employers to use these programs to replace, rather than supplement, U.S. workers by employing lower-paid alien workers. In addition, the revision would enable the Department to more effectively ensure that the employment of immigrant and nonimmigrant workers admitted or otherwise provided one of the covered statuses does not adversely affect the wages and working conditions of U.S. workers.","dates":"Interested persons are invited to submit written comments on this proposed rule on or before May 26, 2026.","docket_ids":["DOL Docket No. ETA-2026-0001"],"regulation_id_numbers":["1205-AC30"],"agencies":"...","executive_order_number":null,"signing_date":null}
######## 2026-14439
{"title":"Establishing a Fixed Time Period of Admission and an Extension of Stay Procedure for Nonimmigrant Academic Students, Exchange Visitors, and Representatives of Foreign Information Media","citation":"91 FR 44976","publication_date":"2026-07-17","effective_on":"2026-09-15","comments_close_on":null,"abstract":"The Department of Homeland Security (DHS) is amending its regulations to change the admission period in the F, J, and I classifications from duration of status to an admission for a fixed time period, and additional changes to admission and extension requirements. This final rule will provide additional protections and oversight of these nonimmigrant categories and will allow DHS to better evaluate whether these nonimmigrants are maintaining status while temporarily in the United States. This final rule provides amendments to the proposed rule covering this topic that was published in the Federal Register on August 28, 2025.","dates":"This rule has been classified as a major rule subject to congressional review. The effective date is September 15, 2026. However, at the conclusion of the congressional review, if the effective date has been changed, DHS will publish a document in the Federal Register to establish the actual effective date or to terminate the rule.","docket_ids":["DHS Docket No. ICEB-2025-0001"],"regulation_id_numbers":["1653-AA95"],"agencies":"...","executive_order_number":null,"signing_date":null}
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
for d in "2026/09/23/2026-19554" "2026/09/23/2026-19555" "2026/09/11/2026-18631" "2026/08/25/2026-17324"; do n=$(basename $d); curl -sL --compressed -m 60 -o "t_$n.txt" "https://www.federalregister.gov/documents/full_text/text/$d.txt"; echo "$n $(wc -c < t_$n.txt)"; done
echo "=== 19554 (proclamation)"; sed -n '1,200p' t_2026-19554.txt | grep -a -v '^\s*$' | head -120`
```
2026-19554 17866
2026-19555 11259
2026-18631 183398
2026-17324 172209
=== 19554 (proclamation)
<html>
<head>
<title>Federal Register, Volume 91 Issue 183 (Wednesday, September 23, 2026)</title>
</head>
<body><pre>
[Federal Register Volume 91, Number 183 (Wednesday, September 23, 2026)]
[Presidential Documents]
[Pages 60497-60500]
From the Federal Register Online via the Government Publishing Office [<a href="http://www.gpo.gov">www.gpo.gov</a>]
[FR Doc No: 2026-19554]
[[Page 60495]]
Vol. 91
Wednesday,
No. 183
September 23, 2026
Part II
The President
-----------------------------------------------------------------------
Proclamation 11069--Restriction on Entry of Certain Nonimmigrant 
Workers
Executive Order 14431--Enhancing Program Integrity and Interagency 
Coordination in the Administration of the H-1B Nonimmigrant Visa 
Program
 
 
                         Presidential Documents 
 
 
  Federal Register / Vol. 91, No. 183 / Wednesday, September 23, 2026 / 
Presidential Documents  
 ___________________________________________________________________
 Title 3--
 The President
[[Page 60497]]
                Proclamation 11069 of September 18, 2026
Restriction on Entry of Certain Nonimmigrant 
                Workers
                By the President of the United States of America
                A Proclamation
                On September 19, 2025, Proclamation 10973 (Restriction 
                on Entry of Certain Nonimmigrant Workers) (2025 
                Proclamation), was issued to address significant abuses 
                of the H-1B nonimmigrant visa program. The restrictions 
                enacted by the 2025 Proclamation have proven to be 
                highly effective but the underlying conditions 
                necessitating the restrictions persist. It is therefore 
                in the interests of the United States to extend the 
                2025 Proclamation for an additional 12 months, until 
                12:00 a.m. eastern daylight time on September 21, 2027.
                As explained in the 2025 Proclamation, the H-1B 
                nonimmigrant visa program was created to bring 
                temporary workers in high-skilled functions into the 
                United States, but it has been exploited to replace, 
                not supplement, American workers with lower-paid labor. 
                Certain employers, including information technology 
                (IT) staffing and outsourcing firms, have abused the 
                system to suppress wages and displace American workers, 
                and this has both harmed the labor market for American 
                workers while also making it difficult to attract and 
                retain the most highly skilled temporary workers. IT 
                staffing and outsourcing firms were found to supply a 
                large volume of entry-level temporary H-1B workers, 
                generally at a much lower salary compared to full-time, 
                traditional workers, and some of these firms later 
                outsourced IT roles to cheap labor markets overseas. 
                This has led to a proliferation of lower-paid foreign 
                labor flooding the American labor market and making it 
                difficult for American workers and recent graduates, 
                especially in science, technology, engineering, and 
                math (STEM) fields, to find employment.
                To combat these abuses, the 2025 Proclamation set forth 
                a restriction on entry of certain H-1B nonimmigrant 
                workers, except for those petitions that were 
                accompanied or supplemented by a $100,000 payment, 
                subject to very limited exceptions. The 2025 
                Proclamation went into effect on September 21, 2025, 
                and, since then, the $100,000 payment has been made for 
                over 700 petitions.
                Additionally, the 2025 Proclamation required initiation 
                of rulemakings by the Department of Homeland Security 
                (DHS) and the Department of Labor (DOL) to address 
                systemic H-1B program concerns. On December 29, 2025, 
                DHS published a final rule, titled Weighted Selection 
                Process for Registrants and Petitioners Seeking to File 
                Cap-Subject H-1B Petitions, 90 Fed. Reg. 60864 (DHS 
                final rule), to address the policy goals consistent 
                with section 4(b) of the 2025 Proclamation. Through 
                this rule, DHS created and implemented a weighted 
                selection process that prioritizes the allocation of 
                visas to higher-skilled and higher-paid aliens to 
                better protect the wages, working conditions, and job 
                opportunities for American workers. This policy better 
                serves the intent of the H-1B statutory scheme, 
                incentivizes employers to recruit temporary workers for 
                roles at the highest pay and skill levels, and was in 
                effect for the Fiscal Year (FY) 2027 H-1B cap season. 
                On March 27, 2026, DOL published a notice of proposed 
                rulemaking, titled Improving Wage Protections for the 
                Temporary and Permanent Employment of Certain Foreign 
                Nationals in the United States, 91 Fed. Reg. 15454,
[[Page 60498]]
                to address the policy goals consistent with section 
                4(a) of the 2025 Proclamation. The DOL's analysis of 
                labor condition application data found that the average 
                wage actually paid to H-1B workers, and the prevailing 
                wage assigned to their positions, both remain well 
                below the average wage earned by comparable American 
                workers. The rule, once finalized, will better align 
                prevailing wage levels with wages paid to similarly 
                employed and located American workers and will 
                strengthen overall program integrity. Finally, my 
                Administration continues to explore other complementary 
                efforts that would, among other things, reform the H-1B 
                program and assist with cost-recovery for immigration 
                program administration.
                Since the effective date of the 2025 Proclamation and 
                subsequent promulgation of the DHS final rule, there 
                have been several measurable impacts on the H-1B 
                program, including a significant reduction in H-1B 
                registrations filed by large IT outsourcing firms, with
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
echo "=== PROC 11069 operative"; sed -n '/Sec. 1/,$p' t_2026-19554.txt | grep -a -v '^\s*$' | head -70
echo; echo "=== EO 14431"; grep -a -v '^\s*$' t_2026-19555.txt | sed -n '20,110p'`
```
=== PROC 11069 operative

=== EO 14431
Enhancing Program Integrity and Interagency 
                Coordination in the Administration of the H-1B 
                Nonimmigrant Visa Program
                By the authority vested in me as President by the 
                Constitution and the laws of the United States of 
                America, it is hereby ordered:
                Section 1. Purpose. The H-1B nonimmigrant visa program 
                was created to identify uniquely skilled and highly 
                specialized foreign temporary workers to strategically 
                supplement the United States economy. Instead, the 
                program has been widely abused by certain employers, 
                third-party placement groups, and outsourcing firms to 
                undercut and displace the supply of skilled United 
                States labor. The large-scale, systematic abuse of the 
                H-1B program to obtain non-qualifying foreign labor has 
                undermined the additive purpose of the program and 
                harmed the wages, working conditions, and job 
                opportunities of skilled American workers.
                The abuse of cheaper H-1B labor places downward 
                pressure on domestic pay. H-1B visa holders earn far 
                less than comparable United States-born workers, 
                despite the statutory mandate that H-1B workers be paid 
                equally to their domestic peers, with the estimated 
                wage gap starting at $9,000 and climbing as high as 
                $20,000 in H-1B reliant industries. One company even 
                warned its shareholders that restrictions on cheap H-1B 
                labor could force the company to use ``local'' workers, 
                which ``may only be available at higher wages.''
                Many employers have laid off large numbers of highly 
                skilled American workers, only to promptly hire large 
                numbers of H-1B workers who are often lower-skilled and 
                lower-paid. For instance, technology sector employers 
                have collectively requested H-1B visas for hundreds of 
                thousands of workers, yet have also laid off somewhere 
                between 800,000 to 1.3 million American employees from 
                2022 through 2026. Employers have even forced laid off 
                American workers to train their foreign replacements.
                Many jobs held by H-1B workers eventually leave the 
                United States entirely. Employers with outsourcing 
                business models use teams of H-1B visa holders to 
                replace United States workers at third-party client 
                businesses and liaise with other individuals working 
                off-site from their country of origin. As soon as 
                practicable, much of their own work is transferred 
                offshore. In Fiscal Year 2026, the top six users of the 
                H-1B program operating with this outsourcing business 
                model accounted for over 25,000 H-1B cap registrations. 
                One foreign country's foreign minister even publicly 
                admitted that H-1B ``has become the outsourcing visa.''
                The systematic and organized abuse of the H-1B program 
                is also a national security threat. Domestic law 
                enforcement agencies have investigated H-1B-reliant 
                outsourcing firms for engaging in visa fraud, 
                conspiracy to launder money, and other illicit 
                activities to encourage foreign workers to come to the 
                United States. Abuses of the H-1B program also present 
                a national security threat by discouraging Americans 
                from pursuing careers in science and technology, 
                risking vital United States leadership in these fields.
                Numerous executive departments and agencies (agencies) 
                have flagged employers' large-scale, systematic abuse 
                of the H-1B program to obtain lower-paid, lower-skilled 
                labor from abroad. These ongoing Government probes 
                continue to identify widespread fraud and noncompliance 
                among H-1B
[[Page 60502]]
                employers, such as: displacing American workers or 
                otherwise giving preference to alien workers; 
                misrepresenting the duties, requirements, or working 
                conditions of job opportunities to avoid hiring or 
                training American workers, falsely qualify jobs as 
                specialty occupations, or lower applicable wage 
                requirements; and misrepresenting aliens' 
                qualifications to perform specialty occupations by 
                submitting questionable foreign degrees from diploma 
                mills as support for their H-1B visa applications. The 
                pervasiveness of these violations and the persistence 
                of the violators confirm that more needs to be done to 
                preserve the H-1B program's integrity.
                I have determined that continued efforts must be made 
                to protect and prioritize the American workforce. It is 
                therefore the policy of the United States that all 
                relevant agencies shall implement appropriate measures 
                to protect American workers from abuse of the H-1B 
                program and ensure that the program serves the national 
                interest.
                Sec. 2. Interagency Coordination. When processing 
                petitions, labor condition applications, and visas for 
                the entry into the United States of aliens as 
                nonimmigrants to perform services in a specialty 
                occupation under section 101(a)(15)(H)(i)(b) of the
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
echo "=== 103,265 NPRM: change of status / F-1"; grep -a -n -i -E "change of status|F-1|cap-gap|already in the United States|effective" t_2026-17324.txt | head -30
echo "=== 60-day grace: classes / F-1"; grep -a -n -i -E "F-1|H-1B|classification" t_2026-18631.txt | head -25`
```
=== 103,265 NPRM: change of status / F-1
490:Department of Labor. Effective July 25, 2018, USCIS also collects 
813:Training and F-1 status for eligible students under the H-1B cap-gap 
830:Training (OPT) and F-1 Status for Eligible Students under the H-1B 
831:Cap-Gap Regulations, <a href="https://www.uscis.gov/working-in-the-united-states/temporary-workers/[REDACTED]/[REDACTED]">https://www.uscis.gov/working-in-the-united-states/temporary-workers/[REDACTED]/[REDACTED]</a> (last reviewed/updated Jan. 17, 2025).
=== 60-day grace: classes / F-1
53:classifications (and their dependents) with an up to 60-day grace 
105:    A. E-1, E-2, and E-3 Nonimmigrant Visa Classifications
106:    B. H-1B and H-1B1 Nonimmigrant Visa Classifications
107:    C. L-1 Nonimmigrant Visa Classification
108:    D. O-1 Nonimmigrant Visa Classification
109:    E. TN Nonimmigrant Visa Classification
157:NAICS--North American Industry Classification System
215:eligibility under these employment-based nonimmigrant classifications. 
216:By statute, an alien's lawful status in E-1, E-2, E-3, H-1B, H-1B1, L-
217:1, O-1, or TN nonimmigrant classification is directly connected to and 
221:these classifications to maintain his or her status, the alien 
224:classification and associated admission or grant of status. However, 
235:that was the basis of his or her initial classification or grant of 
239:provisions governing the relevant classifications by requiring an alien 
242:nonimmigrant classification or status (unless otherwise authorized to 
246:classifications, and their dependents, to encourage aliens who ceased 
249:lawful immigration status and, depending on the classification sought, 
258:activity that was the basis for the classification or status, DHS 
268:workers in these classifications, including those whose employment 
271:employer-sponsored nonimmigrant classifications or employment in the 
272:same classification with a new employer. The grace period also 
302:establishes classifications for aliens who are coming temporarily to 
303:the United States as nonimmigrants, including the E-1, E-2, E-3, H-1B, 
304:H-1B1, L-1 and O-1 classifications, see INA sec. 101(a)(15)(E)(i), (ii) 
314:authorizes the admission of aliens under the TN classification pursuant
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; grep -a -v '^\s*$' t_2026-19554.txt | sed -n '100,175p'; echo; echo "=== 17324 how applied"; grep -a -n -i -E "all H-1B cap-subject|petitions filed|in-country|consular|apply to|exempt" t_2026-17324.txt | head -20`
```
                Nationals in the United States, 91 Fed. Reg. 15454,
[[Page 60498]]
                to address the policy goals consistent with section 
                4(a) of the 2025 Proclamation. The DOL's analysis of 
                labor condition application data found that the average 
                wage actually paid to H-1B workers, and the prevailing 
                wage assigned to their positions, both remain well 
                below the average wage earned by comparable American 
                workers. The rule, once finalized, will better align 
                prevailing wage levels with wages paid to similarly 
                employed and located American workers and will 
                strengthen overall program integrity. Finally, my 
                Administration continues to explore other complementary 
                efforts that would, among other things, reform the H-1B 
                program and assist with cost-recovery for immigration 
                program administration.
                Since the effective date of the 2025 Proclamation and 
                subsequent promulgation of the DHS final rule, there 
                have been several measurable impacts on the H-1B 
                program, including a significant reduction in H-1B 
                registrations filed by large IT outsourcing firms, with 
                the largest IT staffing and outsourcing firms reducing 
                their combined H-1B registrations from 24,946 to 2,055, 
                a 92 percent decrease. There has also been a large 
                reduction in consular processing requests, which are 
                used to bring workers into the United States, noting a 
                nearly 97 percent decrease from the FY 2025 to FY 2027 
                cap seasons. Finally, there has been a positive shift 
                in FY 2027 H-1B registration and selection data toward 
                higher-skilled and higher-paid workers, with 
                registrations for beneficiaries with at least a U.S. 
                Master's degree rising from 45.1 percent of total 
                registrants for FY 2026 to 66.1 percent for FY 2027. 
                Job offers with wages corresponding to the two highest 
                wage levels accounted for approximately 46.3 percent of 
                H-1B registration selections while those corresponding 
                with the lowest wage level accounted for only 17.8 
                percent. It is reasonable to conclude that the required 
                $100,000 payment and newly implemented weighted 
                selection process have had the combined effect of 
                deterring low-wage and low-skilled recruitment while 
                increasing access for high-skilled and high-wage 
                workers, as intended by the 2025 Proclamation.
                Although the 2025 Proclamation and subsequent 
                rulemaking have had the desired effects, the underlying 
                conditions precipitating their issuance persist and, 
                without an extension of the 2025 Proclamation, it is 
                highly likely that progress will halt and program abuse 
                will resume, undermining American workers and posing a 
                threat to the labor market that would be detrimental to 
                the interests of the United States. The 2025 
                Proclamation highlighted a number of concerns, 
                including high unemployment rates for recent graduates, 
                wage suppression, fraud, and national security threats. 
                Currently, these issues continue to undermine our 
                economy, with unemployment rates for recent college 
                graduates standing at 5.7 percent as of June 2026, a 
                marginal decrease from September 2025, when the rate 
                was 5.8 percent. Underemployment for recent college 
                graduates also continues to cause concern, having risen 
                from 41.8 percent in September 2025 to 42 percent as of 
                June 2026. Additionally, while DOL is actively in the 
                process of promulgating a rule to restore integrity to 
                the prevailing wage system, it will take a significant 
                amount of time to correct and balance the labor market. 
                Finally, while fraud and abuse continue to be 
                identified and investigated, these are ongoing and 
                pervasive concerns that require a sustained, 
                comprehensive response reflected in the entry 
                restriction imposed by the 2025 Proclamation.
                A review of the 2025 Proclamation's impacts and other 
                recent policy changes has shown significant measurable 
                changes in H-1B filing patterns that demonstrate the 
                effectiveness of the 2025 Proclamation and a need for 
                its extension. An extension of the 2025 Proclamation 
                will continue to protect the economic and national 

=== 17324 how applied
36:exemption, which would be imposed in addition to all other applicable 
98:    5. DOS and Bureau of Consular Affairs Background
236:additional fee on all H-1B cap-subject petitions, payable at the time 
277:eligible for the advanced degree exemption (not to all H-1B petitions 
278:such as cap-exempt filings).
303:H-1B visa petitions filed on or after September 21, 2025, and before 
335:additional fee imposed on all H-1B cap-subject petitions filed, 
336:including those eligible for the advanced degree exemption under 
360:Immigration Court proceedings, consular visa processing, labor 
556:waived, and fee exempted requests across other fee-paying requests.\15\ 
738:Certain petitions are exempt from the 65,000 numerical limitation.\23\ 
740:annual exemption from the 65,000 cap for H-1B workers who have earned a 
748:    \23\ Exempt petitions include petitions for (1) employment (or 
753:qualifying U.S. master's degree or higher degree. Also exempt are 
758:admission, and those exempt from the 6 year period of authorized 
877:5. DOS and Bureau of Consular Affairs Background
897:Consular Affairs is the agency within the DOS that issues visas to 
1121:otherwise exempts the requirement. See, e.g. 90 FR 49062, 49074. In a 
1797:    As shown in Table 8, DOS incurs targeted costs for consular 
1804:Kentucky Consular Center, to enhance data sharing and risk screening
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 90 -o ds.txt "https://www.federalregister.gov/documents/full_text/text/2026/07/17/2026-14439.txt" -w "ds rule: %{http_code} %{size_download}\n"
grep -a -n -i -E "delayed (effective|implementation)|SEVIS functionality|OPT.*(effective|implementation)|effective.*OPT|six months after|180 days" ds.txt | head -30
echo ===; curl -sL -m 30 -A "Mozilla/5.0" -o pa.html -w "PA page: %{http_code} %{size_download}\n" "https://www.presidentsalliance.org/duration-of-status-litigation/"; sed -e 's/<script.*<\/script>//g' -e 's/<[^>]*>/ /g' pa.html | tr -s ' \n' | grep -i -E "first circuit|appeal|injunction|saylor|stay" | head -15`
```
ds rule: 200 351206
2596:legitimate reasons. Also, multi-year bars begin only after 180 days of 
3589:timely filed for the EOS and the 180 days will begin to toll only upon 
6204:ranging from 180 days to 12-18 months of lawful status while awaiting 
6341:up to 180 days after the expiration of their current EAD. Students may 
6927:for more than 180 days may result in bars to reentry under INA 
7386:STEM OPT within six months of the effective date of this final rule are 
7475:petitions remain pending beyond the 180 days provided. Commenters 
7877:exceed 180 days. See 8 CFR 214.2(f)(11)(i)(C) and 8 CFR 
8625:disruptions if they apply as early as possible (180 days) before the 
8925:the Form I-765, but not to exceed 180 days.
8967:another to a period of 180 days, and another that did not state a 
10259:One commenter suggested SEVIS functionality should be extended to 
14644:    DHS conducted a thorough review of all SEVIS functionality to 
14676:and recommended alignment between SEVIS functionality and regulatory 
15291:first six months after the effective date of the rule;
===
PA page: 200 88888
 First Circuit Court of Appeals Briefing Schedule 
 On October 16, 2026, U.S. district court judge F. Dennis Saylor IV ordered the government to produce the administrative record by October 23. Both parties may file supplemental summary judgment briefs by October 26, with replies due November 2. 
 At an October 2 status conference, the government said it plans to ask the First Circuit to expedite the appeal and also indicated that it wants to pause proceedings in the district court. The plaintiffs are asking the district court to move toward a prompt final judgment, which would allow the issues to proceed together in the First Circuit. Judge Saylor directed both sides to file their positions on the next steps and related procedural questions by October 9. We will share further updates as the case proceeds. 
 On September 30, 2026, the government filed a notice of appeal to the U.S. Court of Appeals for the First Circuit. The appeal does not put the D/S final rule into effect or change the district court’s order postponing the rule’s effective date. The rule remains blocked nationwide while the litigation continues. 
 On September 14, 2026, Judge F. Dennis Saylor IV granted nationwide preliminary relief, blocking the final rule from taking effect. The court postponed the rule’s effective date and prohibited DHS and ICE from taking any further action to implement it while the litigation proceeds. As a result, the longstanding Duration of Status system remains in place nationwide. The court found that the plaintiffs are likely to succeed in showing that the rule is arbitrary and capricious and that allowing it to take effect would cause immediate and irreparable harm. 
 On September 3, 2026, the Presidents’ Alliance and several of our co-plaintiffs, including NAFSA, the NewsGuild-CWA, GLO,  and UAW Local 2322, appeared before the U.S. District Court for the District of Massachusetts for a hearing on our requests for a preliminary injunction or summary judgement. Transcript is here.  
 On August 19, Judge F. Dennis Saylor IV issued an order setting the briefing schedule and setting a hearing date. The defendant’s response is due August 31, 2026. An in-person motion hearing is scheduled for September 3, 2026, at 11:00 a.m. in Courtroom 1. 
 Complaint and preliminary injunction filed on August 18, 2026 by a coalition of plaintiffs including NAFSA: Association of International Educators; the Presidents’ Alliance on Higher Education and Immigration; the Association of Independent Colleges and Universities in Massachusetts (AICUM); the American Federation Of Teachers (AFT); Graduate Labor Organization, AFT Local 6516 (GLO); International Union, United Automobile, Aerospace and Agricultural Implement Workers of America (UAW); United Auto Workers Local 2322; and The NewsGuild-CWA. The case was assigned to District Judge F. Dennis Saylor, IV. 
 Under the D/S framework, international students and scholars generally could remain in the United States as long as they continued making progress in their academic or exchange programs. The final rule instead imposes fixed admission periods and requires students and scholars who need additional time to complete their programs or training to apply for an Extension of Stay (EOS). It also introduces other restrictions and prohibitions, including limits on students’ ability to change educational objectives, transfer institutions, or pursue additional programs of study. The rule is scheduled to take effect on September 15, 2026. 
 On August 18, 2026 , a coalition that includes NAFSA: Association of International Educators; the Presidents’ Alliance on Higher Education and Immigration; the Association of Independent Colleges and Universities in Massachusetts (AICUM); the American Federation Of Teachers (AFT); Graduate Labor Organization, AFT Local 6516 (GLO); International Union, United Automobile, Aerospace and Agricultural Implement Workers of America (UAW); United Auto Workers Local 2322; and The NewsGuild-CWA filed a complaint and a motion for preliminary injunction in the U.S. District Court for the District of Massachusetts challenging the Department of Homeland Security’s (DHS) final rule ending the Duration of Status (D/S) framework for international students, exchange visitors, and representatives of foreign media. Plaintiffs are represented by McDermott Will &amp; Schulte . 
 Preliminary injunction filed on August 18, 2026  
 Memorandum and order on motion for preliminary injunction filed on September 14, 2026
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `WebSearch` -- `{"query":"\"26-cv-14520\" OR \"Association of American Universities v. Department of Homeland Security\" curricular practical training preliminary injunction hearing","mode":"standard"}`
- `WebSearch` -- `{"query":"studyinthestates.dhs.gov curricular practical training CPT SEVP guidance students employment F-1 2026","mode":"standard"}`
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 40 -A "Mozilla/5.0" -o nafsa_cpt.html -w "nafsa: %{http_code} %{size_download}\n" "https://www.nafsa.org/legal-defense-CPT"; sed -e 's/<script[^>]*>.*<\/script>//g' -e 's/<[^>]*>/ /g' nafsa_cpt.html | tr -s ' \n' | grep -i -E "hearing|november|updated|judge|ruling" | head -10
curl -sL --compressed -m 60 -A "Mozilla/5.0" -o memo.pdf -w "memo: %{http_code} %{size_download}\n" "https://www.aau.edu/uploads/files/general/Memo-in-Support-of-PI-and-Stay-AAU-v-DHS.pdf"; file memo.pdf | head -1; pdftotext -layout memo.pdf memo.txt 2>&1 | head -2; wc -c memo.txt
grep -n -i -E "computer science|November 6|hearing|Judge|1:26-cv|paused|halt|survey|schools have" memo.txt | head -40`
```
nafsa: 200 8853
 Last updated: October 8, 2026 Litigation On October 5, NAFSA: Association of International Educators joined the Association of American Universities, Presidents’ Alliance on Higher Education and Immigration, and the Association of Independent Colleges and Universities in Massachusetts (AICUM) in filing a complaint and a motion for preliminary injunction in response to two broadcast messages sent last August by Immigration and Customs Enforcement (ICE) that made drastic changes to Curricular Practical Training (CPT) for international students.&nbsp; These messages to university administrators state that students will only be eligible for CPT when such practical experiences are mandatory for all students in a program. This means that an academically supervised internship or practicum for course credit would be unavailable to an international student if it is an elective rather than a graduation requirement for their degree. This dramatically different interpretation from the agency that oversees CPT has put longstanding campus practices and students’ access to these opportunities at risk, without notice and comment or sufficient time for colleges and universities to respond. The suit, filed in the U.S. District Court for the District of Massachusetts, asks the court to stop the government’s actions before they cause further harm to students, universities, their communities, and the country. As conveyed in a joint press release , the legal complaint argues that the government’s new interpretation of longstanding CPT requirements would severely limit international students’ ability to participate in internships and other experiential learning opportunities that allow them to directly apply knowledge learned in the classroom and gain real-world experience. These hands-on training opportunities are directly connected to their academic courses of study and approved by their colleges and universities. The suit argues that the government’s actions are legally flawed and would cause irreparable harm for a number of reasons: The change was announced abruptly, without a substantive explanation, period for public comment, or acknowledgment that it departed from the federal government’s previous longstanding interpretation of CPT.&nbsp; The communications sent directly to campus university designated school officials (DSOs) threatened them with severe institutional penalties and potential personal liability for practices that the government had previously long permitted. The broadcast messages needlessly disrupt the plans and expectations of students, schools, and others in the community, who responsibly planned their affairs around the government’s longstanding position that these practical-training opportunities will remain permitted. “Changing how CPT is administered through broadcast messages, without formal rulemaking, is an aberration that must be challenged,” said NAFSA Executive Director and CEO Fanta Aw. “These abrupt changes have placed Designated School Officials—the professionals responsible for advising international students and ensuring institutional compliance—in an untenable position, forcing them to navigate significant new restrictions and uncertainty without the clarity and due process that formal rulemaking provides." The press release goes on to say, "the plaintiffs are seeking to restore the government’s longstanding CPT framework, protect students and institutions from retroactive penalties, and ensure that international students can continue to access academically meaningful training opportunities that benefit not only them, but employers, communities, and our entire nation."&nbsp; Hearing&nbsp; A hearing date has been set for November 6. At that time, the judge will hear arguments related to our request for a preliminary injunction and stay of agency action. Plaintiffs The plaintiffs are: the Association of American Universities (AAU); NAFSA: Association of International Educators; the Presidents’ Alliance on Higher Education and Immigration; the Association of Independent Colleges and Universities in Massachusetts (AICUM). The plaintiffs are represented by Jenner &amp; Block LLP . Resources NAFSA members can access a detailed description of the broadcast messages and historical context on NAFSA's website . 
 Whether you are looking for the latest news or job updates or simply want to keep a finger on the pulse of the international education community, NAFSA has a number of easy ways to stay updated—all in your preferred social media platform. NAFSA Blog NAFSA Facebook NAFSA Instagram NAFSA LinkedIn NAFSA TikTok NAFSA X/Twitter 
memo: 200 715641
memo.pdf: PDF document, version 1.7, 56 page(s)
129639 memo.txt
1:    Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 1 of 56
6:ASSOCIATION OF AMERICAN UNIVERSITIES;   Case No. 1:26-cv-14520
25:           Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 2 of 56
56:           Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 3 of 56
75:           Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 4 of 56
116:           Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 5 of 56
151:           Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 6 of 56
189:           Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 7 of 56
219:        Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 8 of 56
272:           Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 9 of 56
278:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 10 of 56
299:a law student interning in a judge's chambers during the semester, obtaining invaluable insight
306:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 11 of 56
335:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 12 of 56
363:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 13 of 56
384:universities have halted CPT authorizations mid-semester. Students, in turn, are losing unique
391:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 14 of 56
421:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 15 of 56
451:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 16 of 56
479:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 17 of 56
512:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 18 of 56
541:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 19 of 56
570:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 20 of 56
601:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 21 of 56
629:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 22 of 56
657:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 23 of 56
685:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 24 of 56
716:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 25 of 56
763:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 26 of 56
792:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 27 of 56
822:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 28 of 56
851:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 29 of 56
882:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 30 of 56
910:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 31 of 56
938:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 32 of 56
967:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 33 of 56
995:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 34 of 56
1023:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 35 of 56
1054:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 36 of 56
1084:          Case 1:26-cv-14520 Document 9-1 Filed 10/05/26 Page 37 of 56
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/&#039;|&rsquo;/'"'"'/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
for u in "https://isss.umn.edu/immigration-updates" "https://cse.umn.edu/coop/international-students" "https://isss.umn.edu/fstudents/employment/on-campus"; do echo "################ $u"; get "$u" | head -c 6000; echo; done`
```
################ https://isss.umn.edu/immigration-updates
 
 Immigration News and Updates | ISSS 
 Skip to main content
 On July 17, the Department of Homeland Security published a new rule that will have sweeping impacts on both current and new F and J visa holders. As a result, the information on this website regarding F and J visa status is only valid until the new rule goes into effect. The original implementation date was September 15, 2026, but a lawsuit has paused implementation of the rule. ISSS is monitoring the situation and will provide updates on the Duration of Status Information Hub . 
 Go to the University of Minnesota Twin Cities home page 
 One Stop 
 MyU : For Students, Faculty, and Staff 
 Search 
 Dedicated to serving the University's international community 
 International Student and Scholar Services 
 Submit Requests Contact Us MyISSS 
 Menu 
 Students 
 Scholars 
 Departments 
 News 
 Events 
 Resources 
 Resources 
 Events 
 News 
 Breadcrumb 
 Home 
 Immigration News And Updates
 Immigration News and Updates 
 ISSS understands that change and uncertainty in immigration policies outlined by the federal government can be incredibly challenging for members of our international community. ISSS is here for you. We are carefully monitoring any immigration changes, and we are working with national resources to understand more about what is taking place and how best to support international students and scholars. Current Information and Messages ISSS informs international students and scholars about immigration policy changes primarily through our newsletters. See a summary of recent messages and current advice (UMN login required). Newsletters and Information Sharing Below are the primary ways ISSS informs international students and scholars important news and requirements. ISSS Weekly Update The ISSS Weekly Update newsletter is published at the beginning of each week and has specific information for students on F-1 and J-1 visas. All Twin Cities international students are automatically added to the mailing list. Interested faculty, staff, and students from any campus may sign up to receive the Weekly Update . (Note that some content of the newsletter is focused on a Twin Cities audience.) New students who will begin in Fall 2025 can also may sign up to receive the Weekly Update . ISSS OPT Update Recent graduates on OPT, STEM OPT, and Academic Training (under ISSS's visa sponsorship) will receive the ISSS OPT Update on a regular basis. Read current and past issues here . UMN faculty, staff, and departments may subscribe to receive the OPT Update. Go to the ISSS OPT Messages List for Staff and Departments Google Group page and click "Join Group." Note: Those who are not on the Twin Cities campus should click on the "ask to join group" button. ISSS Scholar Update The Scholar Update newsletter is published monthly and has information specific to international faculty, postdocs, staff, and visiting scholars who are in J-1, H-1B, E-3, or TN status. To subscribe, go to the Scholar Update Google Group and click "Join Group." Department Contacts for Scholars: Faculty and staff who serve as department contacts for scholars and those on employment-based visas should go to the Information for Departments Google Group and click “Join Group.” Campus Resources The campus has a variety of units and other resources to support the community during this time. University’s Rapid Response: Federal Immigration Policies Federal Enforcement in Minnesota Student Legal Services: Know Your Rights Advice and Representation Services International Health, Safety, and Compliance: Guidance on International Travel International Travel Registry (for University-purpose travel only) Binger Center for New Americans (UMN Law School): Know Your Rights video and resources Immigrants (including Permanent Residents), Refugees, and Undocumented: A wide range of people within the UMN community may be impacted by immigration policy changes, and not all are supported by ISSS. (ISSS has training and expertise to support those on F-1, J-1, H-1B, E-3, or TN status.) Consult the University’s Rapid Response website for resources for immigrants (including permanent residents), refugees who have not yet received non-temporary status in the United States, undocumented, or others with temporary status. Contact an Immigration Attorney ISSS cannot make specific referrals to attorneys; however, we do provide resources that may help you locate an attorney who can handle your case. We recommend you discuss your need for an attorney with an ISSS advisor. Contact ISSS We encourage you to reach out to ISSS to discuss your concerns or specific situation. You can learn about the options on our Contact Us page. In an immigration-related emergency, international students may call ISSS’s emergency phone line . 
 Last updated: February 9, 2026 
 ISSS is a unit of the Global Programs and Strategy Alliance , the central international office for the University of Minnesota system. 
 © 2026 Regents of the University of Minnesota. All rights reserved. 
 The University of Minnesota is an equal opportunity educator and employer. 
 Privacy Statement | Report Web Disability-Related Issue 
 About ISSS 
 Mission and Values 
 Meet the Staff 
 Give to ISSS 
 Quick Links 
 Submit Requests 
 Contact Us 
 Students 
 New Students 
 Welcome 
 Complete Your ISSS New Student Requirements 
 Confirm Your Enrollment 
 Request Your I-20 or DS-2019 
 Financial Documentation Policies 
 Get a Visa 
 Get a New Visa 
 Transfer Your Visa 
 Dependent Visas 
 Frequently Asked Questions 
 Prepare for Arrival 
 Choose Your Arrival Date 
 Plan Your Expenses 
 Find Housing 
 Arrive in Minnesota 
 Transportation to Campus 
 Graduate Assistantship 
 Complete UMN Requirements 
 Claim Your UMN Email 
 Remove Registration Holds 
 Enroll in Duo 
 Submit Your Final Transcript 
 Submit Your Immunization Form 
 Pay Your Tuition 
 Living in Minnesota 
 Banking 
 Identification Documents 
 Climate and Clothing 
 Health and Insu
################ https://cse.umn.edu/coop/international-students
 
 International Students | College of Science and Engineering 
 Skip to main content
 Go to the University of Minnesota Twin Cities home page 
 One Stop 
 MyU : For Students, Faculty, and Staff 
 Search 
 College of Science and Engineering 
 Co-op Program 
 Home 
 About 
 About Us 
 Location and Hours 
 Staff 
 Student Experiences 
 Events 
 Employers 
 Program Overview 
 Program Structure and Requirements 
 Hiring Co-op Students 
 Supervisor Responsibilities 
 Prospective Students 
 Prospective Students Home 
 Eligibility 
 Locating and applying for a co-op 
 International Students 
 Important Dates 
 Participating Employers 
 Working Students 
 Newly Hired Students 
 Student Forms 
 Workplace/Academic Issues 
 Co-op Courses 
 Required Co-op Courses 
 Major-Specific Information 
 Credit Information 
 FAQs 
 Breadcrumb 
 Home 
 International Students
 International Students 
 Changes to CPT 
The Department of Homeland Security’s Student and Exchange Visitor Program has recently issued updated guidance regarding Curricular Practical Training (CPT). This guidance may impact CPT eligibility. As a result, ISSS is pausing CPT applications while they further review the new federal guidance and develop related information for our University community. If a student has an experience that is required for their degree and requires CPT, they should contact ISSS to review their situation and receive instructions on how to apply, if applicable. The content on this page may be outdated and will be updated soon. 
 International students in F-1 status are eligible to participate in the Co-op Program and work legally in the United States with Curricular Practical Training (CPT) authorization. International students must complete one full academic year of full-time coursework and must be pursuing an academic program to be eligible for CPT. CPT Authorization Once you have accepted the job offer, start the CPT process right away. DO NOT start the CPT/ISSS process until you have accepted the job offer. For students completing consecutive co-op semesters, only one CPT application will need to be submitted. This process needs to be completed before beginning work at your co-op site. Students must be registered for a co-op course in order for CPT to be approved by ISSS. Once your application has been fully approved in Handshake, the co-op program will email you a permission number to register for the co-op course. If your employer indicates they want you to work for 3 semesters, you must talk to the CSE Co-op Program about this prior to enrolling in a summer co-op course. You'd need to take a different CPT course offered by your department over the summer term. Please email [email&#160;protected] if you have any questions. Do not delay starting on the CPT application. Students cannot begin employment until the CPT authorization is processed. The CPT authorization takes 10 business days to administer by the ISSS office and another 2-5 business days by the Co-op office. International students should communicate this time constraint with their employer so the student’s start date does not have to be pushed back to allow time for CPT authorization. Process/Paperwork required by ISSS: Please visit the ISSS CPT page and proceed via the My ISSS Portal to begin the CPT process. Student Request and Academic Adviser Verification form: for the purposes of the co-op CPT, Prof. Kia Bazargan ( [email&#160;protected] ) will serve as the academic advisor for signing the paperwork. Financial Certification statement (if I-20 financial information will change by greater than 25 percent) A completed CPT form , signed by Prof. Kia Bazargan, the director of Co-op Program. Please list Prof. Kia Bazargan as your academic adviser and he will then receive an email requesting he access the portal and approve the student's CPT request. Allow 5 business days for this to be processed (this may be longer if submitted between semesters). Approval Letter from the CSE Co-op Office: Submit the Co-op Approval Letter Request form as soon as possible after accepting the Co-op job offer. It can take up to a week for the approval letter to be created. This letter will be emailed to you as a PDF, which you will then be required to upload with your CPT E-form via the CPT E-form application with ISSS. Important Information about Course Registration: Students will typically be registered for CSE 4896 for their first working semester and this is the course that your CPT will be based on. A course grade for CSE 4896 will not be given until after you have finished your entire co-op experience. The Co-op office will give you more information about this process once your application is approved. 
 Prospective Student Links Prospective Students Home Eligibility Locating and Applying for a Co-op International Students Important Dates Participating Employers 
 CSE Co-op Program 
 CSE Career Services 
105 Lind Hall 
207 Church St SE 
Minneapolis, MN 55455 
 [email&#160;protected] 
 For Students, Faculty, and Staff 
 One Stop 
 MyU 
 © 2026 Regents of the University of Minnesota . All rights reserved. The University of Minnesota is an equal opportunity educator and employer. Privacy Statement 
 Report Web Accessibility Issues 
 Future students 
 Future undergraduate students 
 Future transfer students 
 Future graduate students 
 Future international students 
 Scholarships and financial aid 
 Beyond the classroom 
 Diversity and Inclusion Opportunities 
 Learn abroad 
 Living Learning Communities 
 Mentor programs 
 Programs for women 
 Research 
 Student groups 
 Current students 
 Information for current students 
 Departments and majors 
 Departments and majors overview 
 Departments 
 Undergraduate majors 
 Graduate programs 
 Integrated Degree Programs 
 Additional degree-granting programs 
 Online learning 
 Academic Advising 
 Academic Advising overview 
 Academic Advising FAQ 
 Academic Advising Blog 
 Appointments 
 Academic support 
 Commencement
################ https://isss.umn.edu/fstudents/employment/on-campus
 
 On-Campus Employment for F-1 Students | ISSS 
 Skip to main content
 On July 17, the Department of Homeland Security published a new rule that will have sweeping impacts on both current and new F and J visa holders. As a result, the information on this website regarding F and J visa status is only valid until the new rule goes into effect. The original implementation date was September 15, 2026, but a lawsuit has paused implementation of the rule. ISSS is monitoring the situation and will provide updates on the Duration of Status Information Hub . 
 Go to the University of Minnesota Twin Cities home page 
 One Stop 
 MyU : For Students, Faculty, and Staff 
 Search 
 Dedicated to serving the University's international community 
 International Student and Scholar Services 
 Submit Requests Contact Us MyISSS 
 Menu 
 Students 
 Scholars 
 Departments 
 News 
 Events 
 Resources 
 Resources 
 Events 
 News 
 New Students 
 Welcome 
 Complete Your ISSS New Student Requirements 
 Confirm Your Enrollment 
 Request Your I-20 or DS-2019 
 Financial Documentation Policies 
 Get a Visa 
 Get a New Visa 
 Transfer Your Visa 
 Dependent Visas 
 Frequently Asked Questions 
 Prepare for Arrival 
 Choose Your Arrival Date 
 Plan Your Expenses 
 Find Housing 
 Arrive in Minnesota 
 Transportation to Campus 
 Graduate Assistantship 
 Complete UMN Requirements 
 Claim Your UMN Email 
 Remove Registration Holds 
 Enroll in Duo 
 Submit Your Final Transcript 
 Submit Your Immunization Form 
 Pay Your Tuition 
 Living in Minnesota 
 Banking 
 Identification Documents 
 Climate and Clothing 
 Health and Insurance 
 Safety 
 Transportation 
 Campus Resources 
 Arrival Guide 
 LGBTQIA+ 
 Disability Resource Center 
 English Language Support 
 Health and Fitness 
 Get Involved 
 Global Gopher Experiences 
 F-1 Advising 
 Maintain Your Legal Status 
 Important Documents 
 Full Course of Study 
 Change of Address 
 Unlawful Presence 
 Special Student Relief 
 Program Extension 
 School and Visa Transfer 
 Change of Visa Status 
 Return to UMN After Leave 
 Departure from U.S. 
 Losing and Regaining F-1 Status 
 Employment 
 Work On Campus 
 Work Off Campus 
 Travel 
 Travel Within the U.S. 
 Travel Outside the U.S. 
 Dependents 
 Visa Renewal 
 Dependents 
 Other Resources 
 Premium Processing for F-1 Students 
 J-1 Advising 
 Maintain Your Legal Status 
 Important Documents 
 Full Course of Study 
 Change of Address 
 Accruing Unlawful Presence 
 Violation of Status 
 12 Month Bar 
 Two-Year Rule 
 Departure from U.S. 
 Healthcare and Insurance 
 Employment 
 Work On Campus 
 Academic Training 
 Travel 
 Travel Within the U.S. 
 Travel Outside the U.S. 
 Dependents 
 Visa Renewal 
 Dependents 
 Other Resources 
 Get Involved 
 Undergraduate Students 
 Graduate Students 
 Support Services 
 Academic Counseling 
 Career Support 
 Funding 
 Academic Financial Support 
 Emergency Funds 
 Colonial Dames of America Scholarship 
 LGBTQIA+ 
 ISSS Services 
 Coming Out, Safety, and Health 
 Resources 
 Personal Counseling 
 Taxes 
 Breadcrumb 
 Home 
 Students 
 F-1 Advising 
 Employment 
 Work On Campus
 Main navigation 
 Employment 
 Work On Campus 
 Work Off Campus 
 Expand Work Off Campus menu --> 
 Curricular Practical Training 
 Expand Curricular Practical Training menu --> 
 Basics of CPT 
 Applying for CPT 
 Special CPT Situations 
 Optional Practical Training 
 Expand Optional Practical Training menu --> 
 Basics of Pre-Completion OPT 
 Basics of Post-Completion OPT 
 Applying for OPT 
 Requirements During OPT 
 Travel, Study, and More 
 STEM OPT Extension 
 Expand STEM OPT Extension menu --> 
 Eligibility 
 Application Process 
 Reporting Requirements 
 Using the SEVP Portal 
 Off Campus Employment Based on Unforeseen Financial Change 
 On-Campus Employment for F-1 Students 
 Students with F-1 visas are allowed to work on campus in a wide variety of roles. When beginning work on campus, it is important for international students to familiarize themselves with the regulations related to their visa status. To be considered on-campus employment, a position must be one of the following: Work performed on the school’s premises (including on-location commercial firms that provide services for students on campus, such as the school bookstore or cafeteria). Work at an off-campus location that is educationally affiliated with the school. The educational affiliation must be associated with the school’s established curriculum or related to contractually funded research projects. International students cannot: Be employed in "work-study" positions. Work on-site for a commercial firm if the firm does not provide direct student services (an example would be a a construction company building a school building). Rules and Procedures 
 Expand all 
 + 
 Eligibility 
 Students in possession of a University of Minnesota I-20 adjudicated by the Department of Homeland Security or a University of Minnesota I-20 generated by ISSS for degree/major change, school transfer, program extension, or replacement are eligible to work on the University of Minnesota Twin Cities campus. F-1 students who enroll at the University of Minnesota but who are on another school’s I-20 program are not eligible to work on the University campus unless: (a) they have off-campus work permission or Optional Practical Training authorized by DHS or (b) they have Curricular Practical Training to work at the University authorized by their international student adviser. Information for Transfer Students Students transferring to begin a program of study must obtain a University of Minnesota I-20 and completed their ISSS Check-In to be eligible for employment (including assistantships). Students transferring away from the University of Minnesota will not be eligible to work on the campus of the UMN as of the “transfer release date” on which their SEVIS record is transferred to the new school. 
 + 
 Limitations of Employment 
 On-campus employment is limit
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
echo "#### on-campus limits"; get "https://isss.umn.edu/fstudents/employment/on-campus" | grep -a -o "Limitations of Employment.\{0,1500\}" | head -c 1700; echo
echo "#### travel outside US (work/remote/abroad mentions)"; get "https://isss.umn.edu/fstudents/travel/outside-us" | grep -a -i -o ".\{200\}\(remote\|work abroad\|working abroad\|five months\|5 months\|internship\).\{250\}" | head -8
echo "#### last updated on-campus"; get "https://isss.umn.edu/fstudents/employment/on-campus" | grep -a -o "Last updated[^.]*20[0-9][0-9]"`
```
#### on-campus limits
Limitations of Employment 

#### travel outside US (work/remote/abroad mentions)
 University purposes. This requirement applies even if you travel to your home country for University purposes (for example, a University-sanctioned research trip). If you will be working or learning remotely while in a country subject to trade sanctions , or are planning to take any University-owned technology or equipment with you, consult the university’s Export Controls and Research Security team ( [email&#160;protected] ) prior to travel. Arrest
#### last updated on-campus
Last updated: February 25, 2025
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
get "https://isss.umn.edu/fstudents/employment/on-campus" | tr '\n' ' ' | grep -a -o "On-campus employment is limit.\{0,1200\}"
echo; echo "### 8 CFR 214.2(f)(9)(i) on-campus (eCFR)"; awk '/\(9\) Employment/{f=1} f{print} /\(ii\) Off-campus employment/{exit}' ecfr.txt | head -c 2500`
```
On-campus employment is limited to a total of 20 hours per week while school is in session and up to full-time during semester breaks and the summer vacation period. Students are in violation of their F-1 status if they work more than 20 hours a week while school is in session. Students holding employment in more than one UMN department should inform their employers of the other position(s). Students new to the University and admitted to begin a program of study during the Summer Session are required to enroll full-time over the summer of admission and are limited to 20 hours/week on-campus employment. Maximum hours per week by campus   +   Work Authorization End Date   On-campus work eligibility ends on the day a student completes all of their degree requirements. Students who have applied for post-completion Optional Practical Training (OPT) but fail to complete by the date specified on their OPT application are not eligible to continue on-campus work unless the job is related to their field of study and the student has received the OPT authorization for employment.   +   Finding a Job   The UMN Job Search webpage has postings of on-campus positions (such as data entry, clerical, grounds maintenance, food se

### 8 CFR 214.2(f)(9)(i) on-campus (eCFR)
 (9) Employment 
 
 
 (10) Practical training 
 
 
 (11) OPT application and approval process 
 
 
 (12) Reporting while on optional practical training 
 
 
 (13) Temporary absence from the United States of F-1 student granted employment authorization 
 
 
 (14) Effect of strike or other labor dispute 
 
 
 (15) Spouse and children of F-1 student 
 
 
 (16) Reinstatement to student status 
 
 
 (17) Current name and address 
 
 
 (18) Special rules for certain border commuter students 
 
 
 (19) Remittance of the fee 
 
 
 (20) Severability 
 
 
 
 
 (1) Admission of student —(i) Eligibility for admission. A nonimmigrant student may be admitted into the United States in nonimmigrant status under section 101(a)(15)(F) of the Act, if: 
 (A) The student presents a Form I-20 or successor form issued in the student's name by a school certified by the Student and Exchange Visitor Program (SEVP) for attendance by F-1 foreign students; 
 (B) The student has documentary evidence of financial support in the amount indicated on the Form I-20 or successor form; 
 (C) For students seeking initial admission only, the student intends to attend the school specified in the student's visa (or, where the student is exempt from the requirement for a visa, the school indicated on the Form I-20 or successor form); and 
 (D) In the case of a student who intends to study at a public secondary school, the student has demonstrated that he or she has reimbursed the local educational agency that administers the school for the full, unsubsidized per capita cost of providing education at the school for the period of the student's attendance. 
 (ii) Form I-20 or successor form requirements at the port-of-entry. When an F-1 student applies for admission with a complete Form I-20 or successor form, the inspecting officer will: 
 (A) Transcribe the student's admission number from Form I-94 onto the student's Form I-20 or successor form (for students seeking initial admission only); 
 (B) Endorse the Form I-20 or successor form; and 
 (C) Return the Form I-20 or successor form to the student. 
 (iii) Use of the Student and Exchange Visitor Information System (SEVIS). Schools must issue a Form I-20 or successor form in SEVIS to any current student requiring a reportable action ( e.g., extension of stay, practical training, and requests for employment authorization), or to any alien who must obtain a new nonimmigrant student visa. 
 (2) Student maintenance of Form I-20 or successor form. An
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `Bash` -- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
echo "### FR weighted selection"; curl -sL --compressed -m 40 -G "https://www.federalregister.gov/api/v1/documents.json" --data-urlencode "conditions[term]=\"Weighted Selection Process\" H-1B" --data-urlencode "conditions[type][]=RULE" -d "fields[]=title" -d "fields[]=citation" -d "fields[]=publication_date" -d "fields[]=effective_on" -d "fields[]=html_url" | head -c 800; echo
echo "### Colorado ISSS Oct 7 2026"; get "https://www.colorado.edu/isss/2026/10/07/100000-h-1b-fee-current-status" | tr '\n' ' ' | grep -a -o "\$100,000 H-1B fee.\{0,3200\}" | head -c 3400`
```
### FR weighted selection
{"description":"Documents matching '\"Weighted Selection Process\" H-1B' and of type Rule","count":1,"total_pages":1,"results":[{"title":"Weighted Selection Process for Registrants and Petitioners Seeking To File Cap-Subject H-1B Petitions","citation":"90 FR 60864","publication_date":"2025-12-29","effective_on":"2026-02-27","html_url":"https://www.federalregister.gov/documents/2025/12/29/2025-23853/[REDACTED]"}]}
### Colorado ISSS Oct 7 2026
$100,000 H-1B fee – Current status | International Student and Scholar Services | University of Colorado Boulder Skip to main content Search Enter the terms you wish to search for. This site All of Colorado.edu Other ways to search: Events Calendar Campus Map International Student and Scholar Services Office of Global Affairs Home Students Scholars CU Departments ISSS News & Updates Programs & Events Resources & Support Forms & Handouts About Us Advising Services MyISSS Portal Departmental Services Immigration Alerts & FAQs $100,000 H-1B fee – Current status Published:10/7/2026 10/7/2026 This summary is based on currently available information. It does not relate to any specific situation and is not legal advice. In September 2025, President Trump issued a Presidential Proclamation requiring payment of an additional $100,000 filing fee for certain H-1B applications, specifically for individuals who are outside the United States and need H-1B visas to enter the country.   The fee has been challenged in federal court . On June 8, 2026, a federal court in Massachusetts ruled that the fee was unlawful and ordered the government to stop collecting it. After the government appealed, the fee was temporarily restored. On July 24, 2026, the U.S. Court of Appeals for the First Circuit reinstated the June 8 ruling, and the $100,000 fee is currently not required.   The Trump administration recently issued a new proclamation extending the $100,000 fee payment requirement through September 21, 2027. However, the court order blocking collection of the $100,000 fee remains in effect, which means that this extension currently has no practical effect. However, the government’s appeal is still pending. As well, on September 30, 2027, another federal court in California also found the rule to be unlawful and invalidated the Trump administration’s recent proclamation extending the fee payment.   Frequently Asked Questions Does the $100,000 fee currently apply for H-1B petitions for people outside of the U.S.? No. The fee is currently not required. Are the Presidential Proclamations still in effect?  Yes. The underlying presidential proclamations requiring the payment of the fee are still in effect. However, the $100,000 payment requirement is currently blocked by the court order. Could the $100,000 fee be reinstated? Yes. The government’s appeal is still pending, and the fee could be reinstated depending on the outcome of the litigation. Does this affect all H-1B petitions?   No. The $100,000 filing fee applies to certain H-1B petitions, specifically those involving individuals outside the United States who require H-1B visas to enter. Where can I find updates?  ISSS will continue to monitor the litigation and provide updates on this page as additional information becomes available. As always,  ISSS is here  to answer questions and support you!  Tags: Immigration Alert International Student and Scholar Services Location: Center for Community, S355 2249 Willard Loop Drive Mailing Address: International Student & Scholar Services University of Colorado Boulder 123 UCB Boulder, CO 80309-0123 Tel: +1 (303) 492-8057 Fax: +1 (303) 492-5185 isss@colorado.edu spons
Shell cwd was reset to D:\_Anant\20_Progress\Documents\Jarvis
```
- `WebSearch` -- `{"query":"uscis.gov H-1B $100,000 payment Proclamation 10973 change of status exempt guidance","mode":"standard","allowed_domains":["uscis.gov"]}`
- `Glob` -- pattern `30_Order/**/{Note Type Registry,Frontmatter Standard,Reference Standard,Reference,Vault Lint,Conformance on Touch}*.md` path ``
- `Glob` -- pattern `30_Order/Templates/**/*.md` path ``
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/10_Areas/Career/VISAs & Work Auth" && wc -c *.md && head -30 "H1B Visa.md"`
```
0 CPT Program.md
0 Current News.md
0 H1B Visa.md
0 Junior Year Internship Decision.md
0 OPT Program.md
0 VISA Plan.md
0 total
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Templates\Knowledge\Reference Template.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Standards\Enrich\Reference Standard.md`
- `Grep` -- pattern `Reference|Current News|Resource` path `D:\_Anant\20_Progress\Documents\Jarvis\30_Order\Note Type Registry.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\HUMAN_WRITING.md`
- `Glob` -- pattern `**/Jarvis Writing and Formatting.md` path `D:\_Anant\20_Progress\Documents\Jarvis`
- `Bash` -- `cd "D:/_Anant/20_Progress/Documents/Jarvis/10_Areas/Career" && ls | head -30; echo ---; grep -rl "reference_kind: link-hub" /d/_Anant/20_Progress/Documents/Jarvis/40_Resources /d/_Anant/20_Progress/Documents/Jarvis/10_Areas 2>/dev/null | head -3`
```
Certifications
Engineer Edge Roadmap.md
Finance
Freelancing.md
Hackathon
Internships
Mentors
Useful Links.md
VISAs & Work Auth
---
```
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\60_Claude\07_AI_Information\Jarvis Writing and Formatting.md`
- `Read` -- `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\Useful Links.md`
- `Grep` -- pattern `^area:` path `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas`
- `Bash` -- `curl -sL --compressed -m 40 -A "Mozilla/5.0" "https://www.uscis.gov/newsroom/alerts/presidential-proclamation-on-restriction-on-entry-of-certain-nonimmigrant-workers" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g' | tr '\n' ' ' | grep -a -o -i ".\{0,300\}\(change of status\|outside the United States\|June 8\|vacat\).\{0,500\}" | head -c 4500`
```
timony   Social Media Directory   Breadcrumb   Home   Newsroom   All News   Presidential Proclamation on Restriction on Entry of Certain Nonimmigrant Workers   Presidential Proclamation on Restriction on Entry of Certain Nonimmigrant Workers   Release Date  10/20/2025   Alert Type info   ALERT : On June 8, 2026, the U.S. District Court for the District of Massachusetts issued an order that vacated agency guidance implementing the $100,000 payment requirement for certain H-1B petitions. See State of California v. Mullin, 1:25-cv-13829 (D. Mass.). DHS strongly disagrees with the court’s order and filed a motion to stay pending appeal with the United States Court of Appeals for the First Circuit (First Circuit). The District Court order was administratively stayed while the government pursued its
```
- `Bash` -- `curl -sL --compressed -m 40 -A "Mozilla/5.0" "https://www.uscis.gov/newsroom/alerts/presidential-proclamation-on-restriction-on-entry-of-certain-nonimmigrant-workers" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g' | tr '\n' ' ' | grep -a -o "ALERT : On June 8.\{0,4500\}" | head -c 4800`
```
ALERT : On June 8, 2026, the U.S. District Court for the District of Massachusetts issued an order that vacated agency guidance implementing the $100,000 payment requirement for certain H-1B petitions. See State of California v. Mullin, 1:25-cv-13829 (D. Mass.). DHS strongly disagrees with the court’s order and filed a motion to stay pending appeal with the United States Court of Appeals for the First Circuit (First Circuit). The District Court order was administratively stayed while the government pursued its motion to stay pending appeal with the First Circuit. On July 24, 2026, the First Circuit denied the government’s motion. DHS strongly disagrees with the First Circuit’s order denying the stay request but will comply with the court’s order while DHS considers next steps. If this order is later lifted, DHS still plans to collect the payment.   On September 19, 2025, the President issued a Proclamation, Restriction on Entry of Certain Nonimmigrant Workers , an important initial step to reform the H-1B nonimmigrant visa program. Under the Proclamation, new H-1B petitions filed at or after 12:01 a.m. eastern daylight time on September 21, 2025 must be accompanied by an additional $100,000 payment as a condition of eligibility. In accordance with section 1(c) of the Proclamation, for H-1B petitions subject to the Proclamation, petitioners must submit a copy of the proof of the payment from pay.gov or evidence of an exception from the fee from the Secretary of Homeland Security at the time of filing the H-1B petition. Petitions subject to the $100,000 payment that are filed without evidence of payment or the grant of an exception will be denied. For additional information on the requirements of the Proclamation and how to pay the $100,000 payment, see the H-1B Specialty Occupation Webpage .   Last Reviewed/Updated:   06/15/2026   Was this page helpful?   Yes   No   This page was not helpful because the content:   Select a reason has too little information has too much information is confusing is out of date other   How can the content be improved?   0 / 2000 To protect your privacy, please do not include any personal information in your feedback. Review our Privacy Policy .   Return to top   Topics   Forms   Newsroom   Citizenship   Green Card   Laws   Tools   Contact USCIS   Agency description   USCIS.gov   An official website of the U.S. Department of Homeland Security   Important links   About USCIS   Accessibility   Budget and Performance   DHS Components   Freedom of Information Act   No FEAR Act Data   Privacy and Legal Disclaimers   Site Map   Office of the Inspector General   The White House   USA.gov   Looking for U.S. government information and services?   Visit USA.gov
```
- `Write` -- `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\VISAs & Work Auth\Current News.md`
```
---
type: reference
status: seed
created: 2026-10-23
updated: 2026-10-23
reviewed: 2026-10-23
tags:
  - career
  - visa
  - cpt
  - opt
  - h1b
reference_kind: link-hub
area:
  - career
notes:
  - "[[VISA Plan]]"
  - "[[CPT Program]]"
  - "[[OPT Program]]"
  - "[[H1B Visa]]"
  - "[[Junior Year Internship Decision]]"
---
# Current News
Primary sources only for the F-1 to OPT to STEM OPT to H-1B track: agency documents, court filings, the Federal Register, and UMN's own pages. This vault uses it as the place to re-check facts before [[VISA Plan]] or [[Junior Year Internship Decision]] relies on them. Read it when a plan note cites a rule, a date, or a dollar figure, and re-verify anything older than a few weeks.
> [!WARNING]
> Everything below was true on 2026-10-23 and most of it is moving: two lawsuits, three open comment periods, and a UMN pause that has not been updated since 2026-09-03. Law firm blogs and news sites were used to find documents, never as the source of a claim.
## The Short Version
==ICE did not change the CPT regulation. It changed how DSOs must read it, through two broadcast messages, and UMN stopped approving CPT in response.==
- *What changed:* [[#CPT guidance]]. CPT is allowed only if the training is required of every student in the degree, so an elective or for-credit-but-optional internship no longer qualifies.
- *What did not change:* the text of 8 CFR 214.2(f)(10), the 12 months of OPT, and the 24-month STEM OPT extension. A CS degree at UMN is on the STEM list route, but check the CIP code on the I-20.
- *What is proposed but not law:* a $70,000 then $30,000 per-student OPT fee charged to schools ([[#OPT fee proposal]]).
- *What is blocked by a court:* the duration of status rule and the $100,000 H-1B payment.
## CPT guidance
==SEVP now says CPT is valid only when its absence would make a degree impossible and the work is required of all students in that degree.==
1. **BCM 2608-01, August 12, 2026** ([ICE PDF](https://www.ice.gov/doclib/sevis/pdf/bcm260801.pdf))
	Read the operative paragraph yourself: "Only authorize CPT if its absence would make the attainment of a degree an impossibility and if the work associated with CPT is required for all students pursuing that degree." It also warns of withdrawal of a school's SEVP certification and perjury exposure for the DSO who signs the I-20.
2. **BCM 2608-02, August 24, 2026** ([ICE PDF](https://www.ice.gov/doclib/sevis/pdf/bcm_260802.pdf))
	The Q&A that closes the elective loophole. Question 3: "In any instance where an elective course is optional, making the CPT optional, the integral and required aspects of CPT would not be met." Question 4 says all students, foreign and American, must complete the training. Question 6 says employers need cooperative agreements with the school.
3. **8 CFR 214.2(f)(10)** ([eCFR](https://www.ecfr.gov/current/title-8/section-214.2))
	The regulation both sides argue about. Its CPT text is one sentence: training "that is an integral part of an established curriculum." Same paragraph holds the OPT rules, including the 24-month STEM extension and the two-extension lifetime cap.
4. **Both broadcast messages carry a disclaimer** that they are not "a rule or a final action by SEVP." That sentence is the legal hook for the lawsuit below.
## Lawsuit over CPT
==The plaintiffs argue the government has read "integral" as "credit OR required" for 35 years, and that a broadcast message cannot reverse that without rulemaking.==
1. **Complaint, AAU v. DHS, No. 1:26-cv-14520 (D. Mass.), filed October 5, 2026** ([PDF hosted by NAFSA](https://www.nafsa.org/sites/default/files/media/document/CPT%20Complaint%20AAU%20v.%20DHS%20.pdf))
	The best single read for what the old rule was. Paragraph 5 states it: CPT was allowed when the training earns academic credit, or, when it earns none, when it is mandatory. The Broadcasts graft the second test onto the first. Counts are Administrative Procedure Act claims: arbitrary and capricious, impermissibly retroactive, contrary to law, and no notice-and-comment.
2. **Memorandum supporting the preliminary injunction and stay** ([AAU PDF](https://www.aau.edu/uploads/files/general/Memo-in-Support-of-PI-and-Stay-AAU-v-DHS.pdf))
	56 pages, Document 9-1. Longer legal argument and the harm evidence. I skimmed it for the case number and dates, not line by line.
3. **NAFSA litigation page** ([nafsa.org](https://www.nafsa.org/legal-defense-CPT))
	Plaintiffs are AAU, Presidents' Alliance, NAFSA, and AICUM, represented by Jenner & Block. States a hearing on the injunction motion on November 6. Page last updated October 8. No ruling or TRO found in any source through October 22.
## OPT fee proposal
==The $70,000 fee triggers on the school's first OPT recommendation of any kind, so using pre-completion OPT would spend it early.==
1. **Federal Register, "Optional Practical Training Fees," 91 FR 64566** ([notice](https://www.federalregister.gov/documents/2026/10/08/2026-20660/optional-practical-training-fees))
	Proposed rule, docket ICEB-2026-0100, RIN 1653-AB01, published October 8. Comments due November 9, 2026. The paperwork-collection comments are due December 7. The notice itself says the fee applies "irrespective of whether it is pre-completion OPT or post-completion OPT," the later $30,000 applies to "another pre-completion OPT, post-completion OPT, or STEM OPT extension," and the example given is a student who pays $70,000 for pre-completion OPT and $30,000 for post-completion OPT. Proposed effective date: 60 days after a final rule, applied to recommendations dated on or after it.
2. **DHS press release, October 7** ([dhs.gov](https://www.dhs.gov/news/2026/10/07/dhs-proposes-fees-foreign-student-work-program-protect-american-jobs))
	The government's stated reason: schools should "exercise greater oversight and selectivity." The school pays, and USCIS will not grant the EAD if it has not.
> [!NOTE]
> The fee is charged to the school, but nothing in the notice says the school must pay it. Whether UMN would pay, pass it on, or stop recommending OPT is not answered anywhere I found.
## Duration of status rule
==A final rule ends duration of status for F-1 students, but a nationwide injunction has kept it from taking effect.==
1. **Federal Register final rule, 91 FR 44976, published July 17, 2026** ([notice](https://www.federalregister.gov/documents/2026/07/17/2026-14439/establishing-a-fixed-time-period-of-admission-and-an-extension-of-stay-procedure-for-nonimmigrant))
	Fixed admission up to the I-20 end date, capped at four years, extension of stay to go longer or to do OPT. Original effective date September 15, 2026.
2. **Presidents' Alliance litigation tracker** ([page](https://www.presidentsalliance.org/duration-of-status-litigation/))
	Case 1:26-cv-13799. Judge Saylor granted nationwide preliminary relief on September 14. The government appealed to the First Circuit on September 30 and that appeal does not revive the rule. Summary judgment briefs run through November 2.
3. **Study in the States FAQ** ([dhs.gov](https://studyinthestates.dhs.gov/elimination-of-duration-of-status-frequently-asked-questions))
	The agency's own answers on OPT and STEM OPT filings under the rule. Dated August 31, so it predates the injunction. ISSS gives a March 18, 2027 transition cutoff while six months from September 15 is March 15, 2027. I did not resolve which is right in the rule text.
## What UMN says
==ISSS is pausing every CPT application and its only exception is an experience "required for their degree."==
1. **ISSS off-campus work page** ([isss.umn.edu](https://isss.umn.edu/fstudents/employment/off-campus))
	Updated September 3. The pause paragraph, and a list showing that unpaid-for-pay arrangements and summer work all count as employment needing authorization.
2. **ISSS pre-completion OPT page** ([isss.umn.edu](https://isss.umn.edu/fstudents/employment/opt/pre-completion-opt))
	Updated September 18. Every month of pre-completion OPT comes out of the 12. Using all 12 before graduation forfeits the STEM extension, which needs post-completion OPT first. Not available with 12 months of full-time CPT. It does not mention the CPT pause.
3. **ISSS on-campus employment page** ([isss.umn.edu](https://isss.umn.edu/fstudents/employment/on-campus))
	Updated February 2025. 20 hours a week in session, full-time in breaks. "On-campus" includes an off-campus site "educationally affiliated" through the curriculum or contractually funded research.
4. **CSE Co-op international students page** ([cse.umn.edu](https://cse.umn.edu/coop/international-students))
	Carries the same pause banner. Shows that co-op CPT runs through the course CSE 4896, so the pause reaches it.
5. **ISSS Duration of Status hub** ([isss.umn.edu](https://isss.umn.edu/duration-of-status))
	Where UMN will post rule updates. The detailed ISSS FAQ still says the rule "goes into effect on September 15," which contradicts the hub banner. Trust the hub and the court tracker.
## H-1B side
==The $100,000 payment is not being collected today, and the real filters are the weighted lottery and the wage rule.==
1. **Proclamation 11069, September 18, 2026** ([Federal Register](https://www.federalregister.gov/documents/2026/09/23/2026-19554/restriction-on-entry-of-certain-nonimmigrant-workers))
	Extends the entry restriction to September 21, 2027. It reports FY2027 registrations for beneficiaries with a U.S. master's rising from 45.1 to 66.1 percent, a number worth knowing as a bachelor's holder.
2. **Weighted selection final rule, 90 FR 60864** ([Federal Register](https://www.federalregister.gov/documents/2025/12/29/2025-23853/[REDACTED]))
	Published December 29, 2025, effective February 27, 2026. Selection favors higher wage levels.
3. **Proposed $103,265 fee on cap-subject petitions, 91 FR 54817** ([Federal Register](https://www.federalregister.gov/documents/2026/08/25/2026-17324/[REDACTED]))
	Docket USCIS-2026-0298. Comments closed September 24. The abstract says it covers all cap-subject petitions including the advanced degree exemption. Not final.
4. **DOL prevailing wage proposal, 91 FR 15454** ([Federal Register](https://www.federalregister.gov/documents/2026/03/27/2026-06017/improving-wage-protections-for-the-temporary-and-permanent-employment-of-certain-foreign-nationals))
	Raises wage levels used for H-1B and PERM. Comments closed May 26. Not final.
5. **USCIS alert on the $100,000 payment** ([uscis.gov](https://www.uscis.gov/newsroom/alerts/presidential-proclamation-on-restriction-on-entry-of-certain-nonimmigrant-workers))
	Court status as of its June 15 update: vacated June 8 in State of California v. Mullin, First Circuit denied a stay July 24. It does not say whether an F-1 student changing status inside the U.S. owes the payment. See Open Questions.
6. **CU Boulder ISSS status page, October 7** ([colorado.edu](https://www.colorado.edu/isss/2026/10/07/[REDACTED]))
	University summary adding the later California ruling and the pending appeal. Secondary, and its text mistypes one date as 2027.
7. **Proposed removal of the 60-day grace period, 91 FR 57807** ([Federal Register](https://www.federalregister.gov/documents/2026/09/11/2026-18631/[REDACTED]))
	Comments due November 10. Its list covers E, H-1B, L-1, O-1, and TN. It does not list F-1, so it matters after the H-1B starts, not during OPT.
## Dates That Will Move This
| Date | Event |
| --- | --- |
| 2026-11-06 | Hearing on the CPT injunction, D. Mass. |
| 2026-11-09 | OPT fee comments close |
| 2026-11-10 | 60-day grace period comments close |
| 2026-12-07 | OPT fee paperwork comments close |
| Pending | First Circuit: duration of status appeal, and $100,000 H-1B appeal |
| 2027-09-21 | Proclamation 11069 restriction ends unless renewed |
## Open Questions
- [ ] Ask ISSS in writing whether any non-required CPT for a CS major is possible while the pause stands, and whether the CS department has a required experience 📅 2026-10-30
- [ ] Ask ISSS whether remote work for a foreign employer, done while outside the U.S. over the summer, is allowed under the pause; no source I read answers this
- [ ] Check the District of Massachusetts docket for 1:26-cv-14520 after the November 6 hearing
- [ ] Find where USCIS or a court states whether the $100,000 payment reaches an F-1 change of status; only law firm and university commentary says it does not
- [ ] Decide whether to file a comment on the OPT fee by November 9
- [ ] Re-check ISSS CPT page; its text said it would "be updated soon" on September 3 and was unchanged on October 23

```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\VISAs & Work Auth\Current News.md`
```diff
- A CS degree at UMN is on the STEM list route, but check the CIP code on the I-20.
+ STEM OPT still depends on the degree's CIP code being on the STEM Designated Degree Program List, so check the code printed on the I-20.
```
- `Edit` -- `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\VISAs & Work Auth\Current News.md`
```diff
- and a list showing that unpaid-for-pay arrangements and summer work all count as employment needing authorization.
+ and a list showing that summer work and positions paid in a benefit instead of money (free rent for caretaking) count as employment needing authorization.
```
- `Grep` -- pattern `—|–` path `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\VISAs & Work Auth\Current News.md`

## Actions Taken

**Files created:**
- `D:\_Anant\20_Progress\Documents\Jarvis\10_Areas\Career\VISAs & Work Auth\Current News.md`

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `cd "C:/Users/anant/.claude/projects/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/tool-results/" && ls -la *.pdf && which pdftotext; python -I -c "import pypdf;print(pypdf.__version__)" 2>&1 | head -1; python -I -c "import fitz;print('fitz ok')" 2>&1 | head -1`
- `SRC="C:/Users/anant/.claude/projects/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/tool-results"; OUT="C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; mkdir -p "$OUT"; for f in 4jgrdi 9olqkx qpd0h7; do pdftotext -layout "$SRC/webfetch-"*"-$f.pdf" "$OUT/$f.txt"; echo "== $f"; wc -c "$OUT/$f.txt"; head -8 "$OUT/$f.txt"; done`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL -m 30 -o fr1.json -w "FR 2026-14439: %{http_code} %{size_download}\n" "https://www.federalregister.gov/api/v1/documents/2026-14439.json?fields[]=title&fields[]=citation&fields[]=publication_date&fields[]=effective_on&fields[]=html_url&fields[]=document_number&fields[]=docket_ids&fields[]=regulation_id_numbers"
curl -sL -m 30 -o ecfr.json -w "eCFR: %{http_code} %{size_download}\n" "https://www.ecfr.gov/api/versioner/v1/full/2026-10-01/title-8.xml?part=214&section=214.2"
head -c 600 fr1.json; echo; head -c 300 ecfr.json`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 40 "https://www.federalregister.gov/api/v1/documents/2026-20660.json?fields[]=title&fields[]=citation&fields[]=publication_date&fields[]=effective_on&fields[]=html_url&fields[]=docket_ids&fields[]=regulation_id_numbers&fields[]=comments_close_on&fields[]=type&fields[]=abstract&fields[]=dates&fields[]=agencies&fields[]=page_length" | head -c 2500; echo; echo ----;
curl -sL --compressed -m 60 -o ecfr.xml -w "eCFR: %{http_code} %{size_download}\n" "https://www.ecfr.gov/api/versioner/v1/full/2026-10-01/title-8.xml?part=214&section=214.2"; head -c 200 ecfr.xml`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 60 -o nprm.html "https://www.federalregister.gov/documents/full_text/html/2026/10/08/2026-20660.html" -w "%{http_code} %{size_download}\n"; 
curl -sL --compressed -m 60 -o nprm.json "https://www.federalregister.gov/api/v1/documents/2026-20660.json?fields[]=raw_text_url&fields[]=body_html_url"; cat nprm.json; echo
RT=$(sed -n 's/.*"raw_text_url":"\([^"]*\)".*/\1/p' nprm.json); echo $RT; curl -sL --compressed -m 60 -o nprm.txt "$RT" -w "%{http_code} %{size_download}\n"
grep -n -i -E "STEM|pre-completion|curricular|CPT|effective|post-completion|employer|E-Verify" nprm.txt | head -60`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
sed -e 's/<[^>]*>/ /g' ecfr.xml | tr -s ' \n' > ecfr.txt; wc -c ecfr.txt
grep -n -o -E "\(10\) Practical training\..{0,100}" ecfr.txt | head; 
awk '/\(10\) Practical training\./{f=1} f{print} /\(11\) Reinstatement/{exit}' ecfr.txt | head -c 9000`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
grep -a -n -i -E "STEM|pre-completion|curricular|effective date|proposed .*§|214\.2\(f\)" nprm.txt | head -50; echo ====; grep -a -n -i -B1 -A3 "Executive Summary\|II. Background" nprm.txt | head -40`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
grep -a -n -i -E "subsequent OPT|initial OPT|each F-1|extension" nprm.txt | head -40; echo ===; grep -a -n "List of Subjects\|Regulatory Text\|PART 214\|§ 214" nprm.txt | head`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; sed -n '1645,1760p' nprm.txt`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
q() { curl -sL --compressed -m 40 -G "https://www.federalregister.gov/api/v1/documents.json" --data-urlencode "conditions[term]=$1" --data-urlencode "conditions[publication_date][gte]=$2" --data-urlencode "order=newest" --data-urlencode "per_page=15" -d "fields[]=title" -d "fields[]=type" -d "fields[]=publication_date" -d "fields[]=citation" -d "fields[]=html_url" -d "fields[]=comments_close_on" -d "fields[]=effective_on" | tr '{' '\n' | grep -o '"title":"[^"]*"\|"type":"[^"]*"\|"publication_date":"[^"]*"\|"html_url":"[^"]*"\|"comments_close_on":[^,]*\|"effective_on":[^,]*' | paste -sd' ' | sed 's/"title"/\n"title"/g'; echo; }
echo "### H-1B"; q '"H-1B" "specialty occupation"' 2026-01-01
echo "### practical training"; q '"practical training" F-1' 2026-01-01
echo "### cap-subject fee"; q '"cap-subject" H-1B fee' 2026-06-01`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
for d in 2026-18631 2026-17324 2026-11285 2026-19554 2026-19555 2026-06017 2026-14439; do echo "######## $d"; curl -sL --compressed -m 40 "https://www.federalregister.gov/api/v1/documents/$d.json?fields[]=title&fields[]=citation&fields[]=publication_date&fields[]=effective_on&fields[]=comments_close_on&fields[]=abstract&fields[]=dates&fields[]=docket_ids&fields[]=regulation_id_numbers&fields[]=agencies&fields[]=executive_order_number&fields[]=signing_date" | sed 's/"agencies":\[[^]]*\]/"agencies":"..."/' | head -c 2200; echo; done`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
for d in "2026/09/23/2026-19554" "2026/09/23/2026-19555" "2026/09/11/2026-18631" "2026/08/25/2026-17324"; do n=$(basename $d); curl -sL --compressed -m 60 -o "t_$n.txt" "https://www.federalregister.gov/documents/full_text/text/$d.txt"; echo "$n $(wc -c < t_$n.txt)"; done
echo "=== 19554 (proclamation)"; sed -n '1,200p' t_2026-19554.txt | grep -a -v '^\s*$' | head -120`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
echo "=== PROC 11069 operative"; sed -n '/Sec. 1/,$p' t_2026-19554.txt | grep -a -v '^\s*$' | head -70
echo; echo "=== EO 14431"; grep -a -v '^\s*$' t_2026-19555.txt | sed -n '20,110p'`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
echo "=== 103,265 NPRM: change of status / F-1"; grep -a -n -i -E "change of status|F-1|cap-gap|already in the United States|effective" t_2026-17324.txt | head -30
echo "=== 60-day grace: classes / F-1"; grep -a -n -i -E "F-1|H-1B|classification" t_2026-18631.txt | head -25`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; grep -a -v '^\s*$' t_2026-19554.txt | sed -n '100,175p'; echo; echo "=== 17324 how applied"; grep -a -n -i -E "all H-1B cap-subject|petitions filed|in-country|consular|apply to|exempt" t_2026-17324.txt | head -20`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 90 -o ds.txt "https://www.federalregister.gov/documents/full_text/text/2026/07/17/2026-14439.txt" -w "ds rule: %{http_code} %{size_download}\n"
grep -a -n -i -E "delayed (effective|implementation)|SEVIS functionality|OPT.*(effective|implementation)|effective.*OPT|six months after|180 days" ds.txt | head -30
echo ===; curl -sL -m 30 -A "Mozilla/5.0" -o pa.html -w "PA page: %{http_code} %{size_download}\n" "https://www.presidentsalliance.org/duration-of-status-litigation/"; sed -e 's/<script.*<\/script>//g' -e 's/<[^>]*>/ /g' pa.html | tr -s ' \n' | grep -i -E "first circuit|appeal|injunction|saylor|stay" | head -15`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
curl -sL --compressed -m 40 -A "Mozilla/5.0" -o nafsa_cpt.html -w "nafsa: %{http_code} %{size_download}\n" "https://www.nafsa.org/legal-defense-CPT"; sed -e 's/<script[^>]*>.*<\/script>//g' -e 's/<[^>]*>/ /g' nafsa_cpt.html | tr -s ' \n' | grep -i -E "hearing|november|updated|judge|ruling" | head -10
curl -sL --compressed -m 60 -A "Mozilla/5.0" -o memo.pdf -w "memo: %{http_code} %{size_download}\n" "https://www.aau.edu/uploads/files/general/Memo-in-Support-of-PI-and-Stay-AAU-v-DHS.pdf"; file memo.pdf | head -1; pdftotext -layout memo.pdf memo.txt 2>&1 | head -2; wc -c memo.txt
grep -n -i -E "computer science|November 6|hearing|Judge|1:26-cv|paused|halt|survey|schools have" memo.txt | head -40`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/&#039;|&rsquo;/'"'"'/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
for u in "https://isss.umn.edu/immigration-updates" "https://cse.umn.edu/coop/international-students" "https://isss.umn.edu/fstudents/employment/on-campus"; do echo "################ $u"; get "$u" | head -c 6000; echo; done`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
echo "#### on-campus limits"; get "https://isss.umn.edu/fstudents/employment/on-campus" | grep -a -o "Limitations of Employment.\{0,1500\}" | head -c 1700; echo
echo "#### travel outside US (work/remote/abroad mentions)"; get "https://isss.umn.edu/fstudents/travel/outside-us" | grep -a -i -o ".\{200\}\(remote\|work abroad\|working abroad\|five months\|5 months\|internship\).\{250\}" | head -8
echo "#### last updated on-campus"; get "https://isss.umn.edu/fstudents/employment/on-campus" | grep -a -o "Last updated[^.]*20[0-9][0-9]"`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
get "https://isss.umn.edu/fstudents/employment/on-campus" | tr '\n' ' ' | grep -a -o "On-campus employment is limit.\{0,1200\}"
echo; echo "### 8 CFR 214.2(f)(9)(i) on-campus (eCFR)"; awk '/\(9\) Employment/{f=1} f{print} /\(ii\) Off-campus employment/{exit}' ecfr.txt | head -c 2500`
- `cd "C:/Users/anant/AppData/Local/Temp/claude/D---Anant-20-Progress-Documents-Jarvis/a8711819-664b-4922-952b-4190546bfc01/scratchpad"; 
get() { curl -sL --compressed -m 40 -A "Mozilla/5.0" "$1" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g'; }
echo "### FR weighted selection"; curl -sL --compressed -m 40 -G "https://www.federalregister.gov/api/v1/documents.json" --data-urlencode "conditions[term]=\"Weighted Selection Process\" H-1B" --data-urlencode "conditions[type][]=RULE" -d "fields[]=title" -d "fields[]=citation" -d "fields[]=publication_date" -d "fields[]=effective_on" -d "fields[]=html_url" | head -c 800; echo
echo "### Colorado ISSS Oct 7 2026"; get "https://www.colorado.edu/isss/2026/10/07/100000-h-1b-fee-current-status" | tr '\n' ' ' | grep -a -o "\$100,000 H-1B fee.\{0,3200\}" | head -c 3400`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/10_Areas/Career/VISAs & Work Auth" && wc -c *.md && head -30 "H1B Visa.md"`
- `cd "D:/_Anant/20_Progress/Documents/Jarvis/10_Areas/Career" && ls | head -30; echo ---; grep -rl "reference_kind: link-hub" /d/_Anant/20_Progress/Documents/Jarvis/40_Resources /d/_Anant/20_Progress/Documents/Jarvis/10_Areas 2>/dev/null | head -3`
- `curl -sL --compressed -m 40 -A "Mozilla/5.0" "https://www.uscis.gov/newsroom/alerts/presidential-proclamation-on-restriction-on-entry-of-certain-nonimmigrant-workers" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g' | tr '\n' ' ' | grep -a -o -i ".\{0,300\}\(change of status\|outside the United States\|June 8\|vacat\).\{0,500\}" | head -c 4500`
- `curl -sL --compressed -m 40 -A "Mozilla/5.0" "https://www.uscis.gov/newsroom/alerts/presidential-proclamation-on-restriction-on-entry-of-certain-nonimmigrant-workers" | perl -0pe 's/<script.*?<\/script>//gs; s/<style.*?<\/style>//gs; s/<[^>]+>/ /g; s/&nbsp;/ /g; s/&amp;/&/g; s/[ \t]+/ /g; s/\n\s*\n+/\n/g' | tr '\n' ' ' | grep -a -o "ALERT : On June 8.\{0,4500\}" | head -c 4800`


