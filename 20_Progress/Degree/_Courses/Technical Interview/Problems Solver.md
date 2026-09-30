---
type: evergreen
status: sprout
created: 2026-09-29
tags:
  - technical-interview
  - leetcode
notes:
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems|How to Solve Problems]]"
  - "[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]"
  - "[[40_Resources/CS/Repos]]"
next: "Run the first real week against this plan and see whether 7/day actually survives contact with the course's own workload before treating the number as fixed"
---
# Problems Solver — TIP103 Problem-Solving Plan
==Every day, 7 problems minimum: 5 from LeetCode (3 hard, 1 easy, 1 medium) and 2 from real interview-question resources - this is the generic plan for the whole course, not a weekly document.==
This is the course-wide map of what gets solved and where it comes from, till the end of TIP103. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]] pulls a specific week's problems from this same pool; [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems|How to Solve Problems]] governs how each one actually gets solved once picked. This note doesn't repeat either — it's the resource map and the daily rule they both draw on.
## The Daily Rule
At least **7 problems solved every day**: 5 from LeetCode (3 hard, 1 easy, 1 medium) plus 2 from interview-question resources outside LeetCode's own problem set. The 3-hard/1-easy/1-medium split on the LeetCode side is deliberate — hard problems build real depth, the easy and medium keep the daily habit from stalling on a single hard problem that won't yield. This is the number to hold the course to; the earlier looser "20+ problems over about 4 days" estimate in [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]]'s Status table is superseded by this daily rule and should be read as roughly what 3 days at this rate already produces.
## The Pareto Problem Set — Easy/Medium Backbone
[[60_Claude/10_Source_Summaries/Github Ingestion/Jobs Starred/tech-interview-handbook|Tech Interview Handbook]]'s [Grind 75](https://www.techinterviewhandbook.org/grind75/) is the Pareto set: a time-parameterized successor to Blind 75 that generates a filtered easy/medium problem list by topic and time budget, built by the same author, rather than solving LeetCode's full catalogue at random. Use its topic filter to match the current week's [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]] topic-block (e.g. filter to Trees while that block is the one-unit-ahead target) and pull the easy and medium problems for that topic from there rather than searching LeetCode cold. The same source's [algorithm cheatsheets](https://www.techinterviewhandbook.org/algorithms/study-cheatsheet/) are the right pre-solve refresher when a topic's complexity table is needed fast.
## The Hard-Question Playlist — Real Interview Questions, Still LeetCode
[[60_Claude/10_Source_Summaries/Github Ingestion/Jobs Starred/interview-company-wise-problems|Interview Company-wise Problems]] supplies the 3 hard problems: real LeetCode questions tagged by which company actually asked them, one CSV per company. Pick a company relevant to the current internship search, filter that company's list to hard difficulty, and work down it by frequency where the CSV gives one. This keeps the hard-problem daily quota anchored to real interview surface area instead of LeetCode's hard tag in the abstract, which skews toward puzzle-difficulty rather than interview-difficulty.
## Interview-Based Questions — the Other 2 a Day
The 2 daily non-LeetCode problems come from the same interview-prep resource base, used for question *style* rather than a raw problem count: [[60_Claude/10_Source_Summaries/Github Ingestion/Jobs Starred/coding-interview-university|Coding Interview University]]'s topic checklist (data structures, trees/graphs, complexity, sorting sections specifically — the OS/networking/compiler sections are out of scope here) supplies conceptual interview questions and mental-model prompts that don't reduce to a single LeetCode-style problem, and [[60_Claude/10_Source_Summaries/Github Ingestion/Jobs Starred/tech-interview-handbook|Tech Interview Handbook]]'s own non-Grind-75 material (behavioral questions, algorithm cheatsheet self-checks) fills the same role when the day's topic calls for it. [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]] names the specific 2 for that week rather than leaving the choice open every day.
## Deprioritized For Now
[[60_Claude/10_Source_Summaries/Github Ingestion/Jobs Starred/system-design-primer|System Design Primer]] is not part of the daily 7 — system design rounds target new-grad/senior interviews, not the internship-level interviews TIP103 and this problem set are built for, per that note's own guidance. Revisit only if a specific application explicitly asks for it.
## How This Plan Is Used
[[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/Weekly Set|Weekly Set]] is rewritten each week: it names the live topic-block from [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]], then lists that week's actual pulled problems with direct links, sourced from the resources above. Every problem actually solved is logged as its own note (destination folder still to be decided — the next build item once this plan is running for a real week) and follows [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041/Problems/How to Solve Problems|How to Solve Problems]]'s three rules without exception. Once enough solved-problem notes exist, they get surfaced here and from [[20_Progress/Degree/_Courses/Technical Interview/CSCI 4041 Relation|CSCI 4041 Relation]] through a Dataview query rather than a hand-maintained list, since the volume will make manual linking impractical.
## Status
| Item | State |
|---|---|
| Daily rule | Set 2026-09-29, not yet run against a real week |
| Solved-problem note location/template | Not yet decided — next build item |
| Dataview surfacing of solved problems | Planned, not yet built — waiting on enough real notes to query |
