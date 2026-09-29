---
type: class
input_kind: homework
status: sprout
created: 2026-09-28
updated: 2026-09-28
area:
  - "[[MGMT 3015 Board]]"
deadline: 2026-09-25
tags:
  - "#class"
  - "#Homework"
next: "Format the Submission record below into a PDF or Word document (12pt Times New Roman, double-spaced, max 2 pages) and draft the 60-90s elevator-pitch script for Wed 9/30 — not done yet, user asked to focus on the written content first"
---
# Business Idea For A New Company
## Overview
Individual, 1 page, 5% of the course grade, stated due date 9/25 (Session 6 — already past; per [[MGMT 3015 Board]]'s Schedule and Session 6/16 date-anomaly warning). Prompt: imagine you've decided to create a company — what type, and why. Shared informally in small groups on 9/25, then presented to the class in a **2-minute** presentation on **9/30 or 10/5** — the user's own presentation slot is Wed 9/30 (Session 7, per the Board's Schedule row: "Present Your Idea to the Class - 2-minute presentations"), and the user plans a tighter **60-90 second elevator-pitch cut** of that 2-minute slot. Upload as PDF or Word to Canvas.
## Requirements
Preserving the instructor's own six questions verbatim:
**Must cover**
- What is your idea for the company you plan to create? What products will your company offer? Who are likely to be your customers? What is your market?
- Are there companies doing the same thing in the same market? How do they compete?
- What makes your business idea unique relative to existing companies?
- Why do you think this idea will work?
- What challenges do you think you will encounter? How will you address them?
- What steps will you take to turn this idea into a reality?
**Must submit**
- One page as a PDF or Word document, uploaded to Canvas. User's own formatting constraint (matches the [[20_Progress/Degree/MGMT 3015/Assignments/Profile of a Successful Entrepreneur|Profile]] assignment's format, applied here as a hard cap even though this prompt doesn't state a page limit as explicitly): 12pt Times New Roman, double-spaced, **not to exceed 2 pages**, target 1 page.
**Must not do**
- Treat the passed due date as blocking — the user has explicitly said not to worry about lateness; the goal is a real, well-researched idea and a genuine 60-90s pitch for Wed 9/30, not a rushed Canvas resubmission.
## Candidate directions considered
Three rounds of research before landing on the chosen idea:
1. **User-characteristics-driven ideas** (a lecture-to-study-kit agent, a "Jarvis-as-a-service" personal AI OS, an AI internship copilot) — rejected outright by the user as "too personal" and not backed by real market research; no data was gathered for these before they were dropped.
2. **AI voice-agent for a "boring" home-services trade** (HVAC, then pest control) — real market gap data existed (44-point micro-business AI adoption gap; pest control is a $29.9B, 31,307-company, highly fragmented US industry), but direct research found the space already crowded: Housecall Pro, ServiceTitan, and Jobber all ship built-in AI voice/dispatch agents, and standalone players (Smith.ai, Goodcall, Avoca, Phonely, AgentZap, Dapta, Sameday) already sell AI answering specifically to pest control and HVAC companies. Dropped for lack of real differentiation.
3. **Chosen: an AI citation-verification tool for law firms ("CiteGuard")** — landed on after confirming a real, quantified, still-open gap: Harvey AI ($15.6B valuation) and Thomson Reuters' CoCounsel dominate BigLaw, but solo/small firms (75% of the profession) are priced out and have the lowest AI adoption of any group, while the specific task of citation-checking is now a documented, sanctionable failure point across firms of every size (see Submission record below for the full citation trail). The user then redirected the scope from "a legal research assistant" (too broad, would compete head-on with Harvey/CoCounsel) to the single most tedious, universal task underneath the whole problem — verifying that every citation in a filing is real — after asking specifically what task a lawyer would need a "software based machine" to take off their hands. A further research pass confirmed direct standalone competitors already exist here too (Sentinel Citation, Sapphire Legal, Paxton AI, Lexis+ with Protégé), all priced near $330-500/month — which sharpened, rather than killed, the idea: the differentiation is price and focus (a single-purpose, pay-per-brief tool) for the solo/small-firm segment that can't justify that price floor, not "nobody else does this."
## Work log
- 2026-09-28: Read [[20_Progress/Degree/MGMT 3015/MGMT 3015 Board|MGMT 3015 Board]], [[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 1 & 2|Chapter - 1 & 2]], and [[20_Progress/Degree/MGMT 3015/Textbook/Chapter - 3 & 4|Chapter - 3 & 4]] in full to ground brainstorming in the course's own frameworks (Timmons Framework, Bygrave's Nine Fs, the Five Dimensions of Opportunity Space, the Opportunity Checklist) rather than generic business-idea advice.
- 2026-09-28: Ran real web research across three candidate directions (see Candidate directions considered above) before drafting. Verified every competitor, price point, and statistic in the Submission record below against a live source at write time rather than relying on prior knowledge, since this is a live 2026 market and prices/players change fast.
- 2026-09-28: Drafted the full one-page submission text below, organized around the assignment's six required questions and a why/who/what structure, anchored on the Mata v. Avianca (2023) ChatGPT-hallucination case as the opening problem-statement hook, per the user's explicit request to use one of the real "scary AI in the courtroom" news stories as the supporting point.
## Concepts used
<!-- Link only to concepts actually used in the solution. -->
-
## Submission record
### Business Idea: CiteGuard — an AI Citation-Verification Tool for Law Firms
Every lawyer is obliged to perform one boring but essential task for the court: to verify that every citation in a submitted document refers to a real case and uses the quoted language, before submitting the brief. This arduous procedure is now the process waiting to catch any AI-assisted lawyer to sanction. In June 2023, a New York attorney named Steven Schwartz filed a federal brief that cited six court decisions fabricated by ChatGPT and was ordered to pay a $5,000 fine (Mata v. Avianca), one of 2046 US court cases so far a public tracker has tallied involving AI-fabricated citations as of September 2026.

CiteGuard is a citation-verification tool. A lawyer submits a brief, and within minutes it will have cross-referenced every citation against actual case law to find out any case that does not exist and any quotation that does not match cited case. Any firm operating in court are potential customers but best is to cut into the roughly 75% of the 975000 US lawyers that operate as solo practitioners or as 2-5 attorney firms: this segment has the lowest AI adoption and highest confidentiality concerns of any segment.

Sentinel Citation already verifies citations in federal filings but Sapphire Legal and Paxton AI represent direct competitors that offer broader AI compliance tools, commonly priced near $499/month. CiteGuard's differentiation is its combination of price and specialization: a single-purpose, pay-per-brief tool that directly undercuts the floor, targeted at a segment that lacks the budget and, according to the adoption figures, the trust to invest in an enterprise-suite legal-AI tool.

This approach will succeed because the pain is quantified - CiteGuard can promise the reliability that general tools like Westlaw cannot (given their own 33% hallucination rate). The challenge is building trust in a highly skeptical buyer segment: every check is performed against a third-party database, rather than a model's memory, and the tool publishes its own error rate. Solo practices and small-firm attorneys should be interviewed to confirm that citation-checking represents the process they would most want to eliminate, and a limited one-state roll-out through a bar association's small-firm council should follow before any wider launches.

*Sources: Mata v. Avianca (Seyfarth Shaw); AI hallucination-sanctions tracker (gc.ai, vaquill.ai); Stanford/Westlaw hallucination-rate study (Sonomos); Harvey/CoCounsel data (Bloomberg, costbench.com); solo/small-firm and AI-adoption statistics (Embroker, Virginia Lawyers Weekly); competitor pricing (nexlaw.ai).*

> [!NOTE] Word count and page-fit estimate
> ~360 words (down from ~525) after the 2026-09-28 trim pass — cut for length by removing whole sentences/clauses from the original draft rather than rewriting surviving ones, per the user's explicit instruction. At ~250-275 words/page (12pt Times New Roman, double-spaced, per the [[20_Progress/Degree/MGMT 3015/Assignments/Profile of a Successful Entrepreneur|Profile]] assignment's own calibration), this should land right around 1.5 pages — comfortably under the 2-page hard cap. Not yet verified in an actual Word document.

<!-- Fill in once submitted: timestamp, destination, file format, any Canvas receipt. -->
## Post-submit reflection
<!-- After submission, record the first failure, the underlying pattern, and what to change next time. -->
- What failed first?
- What pattern repeats?
