---
type: evergreen
status: sprout
created: 2026-09-06
updated: 2026-09-06
tags:
  - internship
  - resume
  - ats
  - github-source
notes:
  - "[[Resume Alteration Standard]]"
  - "[[Resume & Cover Letter - ATS Research Log]]"
next: "Cross-check the deduction rules (no-link penalty, generic-name penalty) against a real (a)/(b) source if one ever surfaces one; right now this is the only source that quantifies them at all."
---
# HackerRank Hiring-Agent Scoring Rubric
==A real, working resume-scoring rubric pulled directly out of `interviewstreet/hiring-agent`'s source — HackerRank's own open-sourced automated screening tool. This is not advisory content (a blog, a university handout, a vendor's public docs): it is the literal prompt/logic a real recruiting-tech company's tool uses to score a Software Engineering Intern resume, read out of `roles/software_engineering_intern/{criteria.jinja,role.json}` in the cloned repo (`sandbox/hiring-agent/` in `second-brain-claudekit`). Reviewed 2026-09-06 — full evidence and the honest "wrong direction as software" verdict live at `tests/agents/hiring-agent/2026-09-06-test-log.md` in that repo; this note keeps only the rubric content itself, since the pipeline around it isn't the right vehicle for a self-audit.==

## A new tier, not quite (a)/(b)/(c) — call it (d) real screening-tool source

[[Resume & Cover Letter - ATS Research Log]]'s tiering covers *advisory* content (official guidance, university pages, third-party blogs). This is a different kind of evidence: not anyone's advice about what an ATS does, but the actual, runnable scoring logic one real hiring-tech company (HackerRank, via its `interviewstreet` GitHub org) ships. Higher confidence than any (c)-tier blog for "what does a screener actually weight," because there's no interpretation layer between this and the real thing — but scoped to one company's one tool for one role, not a cross-platform standard the way Greenhouse's or Ashby's own docs are. Treat it as strong evidence for *what screening logic tends to look like*, not as proof any specific target company's ATS scores this exact way.

## The four categories (120 points max, plus bonuses, minus deductions)

| Category | Max | What scores high | What scores low |
|---|---|---|---|
| **Open Source** | 35 | Contributions to *other people's* popular projects (1000+ stars), GSoC participation, real community involvement | Only personal repos (capped at ≤10 pts even with lots of them), Hacktoberfest alone (3–5 pts max), no GitHub presence |
| **Self Projects** | 30 | Complex projects with real-world impact, advanced architecture, multiple technologies, real users | Tutorial projects (todo apps, calculators, weather apps, basic CRUD) — capped low even with several of them |
| **Production Experience** | 25 | Real work/internship/production experience; extra credit for founder/co-founder roles or being an early (first 10–20) hire at a startup | Classroom-only, no real-world work history |
| **Technical Skills** | 10 | Breadth shown in skills, languages, and problem-solving evidence across projects/work | Vague or unsubstantiated skill lists |

## The rule that matters most: personal repos ≠ open source

**Having your own GitHub repos does not count as open-source contribution** in this rubric. It explicitly caps "open source" at 10/35 if every project is self-authored — real credit requires contributing to *someone else's* project. If a GitHub profile is all solo repos, this category won't carry the score no matter how many there are; the effort is better spent on Production or Self Projects, or on finding a real external project to contribute to.

## What actively hurts a project's score

- **Generic tutorial-shaped projects** — todo lists, calculators, weather apps, basic CRUD, recipe apps, "Hello World." Named explicitly in the rubric, not just implied. Each one beyond the first costs points.
- **No link** — a project with no GitHub URL or live demo loses 30–50% of its potential score. A broken link loses 20–30%.
- **Generic naming** — a project literally named "Calculator" or "Todo App" gets docked, independent of what it does.

## Bonus points (capped at 20 total, on top of the 120)

- +5 — Google Summer of Code (GSoC) — the rubric is explicit that GSoC and Girl Script Summer of Code are scored as different things (+3 for the latter); don't conflate them when describing the experience.
- +3–5 — startup founder/co-founder experience
- +2–3 — early-stage engineer (first 10–20 employees) at a startup
- +2 — a real portfolio site linked from the resume
- +1 — LinkedIn profile present
- +1–3 — genuinely high-quality technical blog writing

## How this feeds [[Resume Alteration Standard]] / [[Resume Alteration]]

A self-audit checklist, not a tool to run — nothing here should get wired in as software (see the test log for why the pipeline itself failed to even complete a run). Before a resume goes through [[Resume Alteration]]'s drafting flow, it's worth holding the content plan up against this table: is "open source" actually external contributions or just personal repos labeled generously? Do the "self projects" read as distinguishable from a tutorial, and do they all have working links? Is anything in the bonus list (GSoC, a portfolio site, blog writing) true of the candidate but currently missing from the draft?
