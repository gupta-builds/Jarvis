---
type: class
input_kind: preparation
status: sprout
created: 2026-09-09
updated: 2026-10-13
area:
  - "[[CSCI 4511W Board]]"
tags:
  - "#class"
next: "Complete the Week 1 closed-note check, then review Weeks 2-6 through Lecture 10 and build the permitted two-page notes"
---
# CSCI 4511W — Preparation
==Problem Sets and Long Quizzes together are 60% of the grade; verify each assessment's collaboration and resource rules separately.==
## October 13 setup and source inventory
Primary source root: `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W`. Coding working directory: its `Code` folder. Canonical notes remain under `20_Progress/Degree/CSCI 4511W` in Jarvis. The inventory below records what is locally available; it does not assert that every Canvas item has been retrieved or every topic mastered.
### AIMA environment verification
Checked 2026-10-13 in the existing course `.venv`, using Python 3.12.14. The checkout is `Code/aima-python`, remote `https://github.com/aimacode/aima-python.git`, commit `f104e03fdc1582f014b3a4c93f1a9b7d2da70114`.
- `numpy`, `ipythonblocks`, `sortedcontainers`, and `pytest` were already installed.
- Initialized and downloaded `aima-data` at the checkout's pinned commit `f4bbabd1962c5022fa8c803abe9aa7edce1ea2a9`. Previously the dataset directory was empty and Boggle's word-list test failed.
- Reinstalled the existing checkout in editable mode with `--no-deps --no-build-isolation`. Its prior installation could not import `aima` from the requested `Code` directory. Imports now resolve to this local checkout from outside the repository.
- Professor-required doctests: agents, 61 attempted and 0 failures; search, 1 attempted and 0 failures. Both verbose file-based commands ended with `Test passed.`
- Targeted `tests/test_agents.py` and `tests/test_search.py`: 52 passed after repair. `pip check`: no broken requirements. Repository source worktree remains clean.
- Smoke checks: dirty-room reflex action returns `Suck`; UCS from Arad to Bucharest returns path cost 418.
The search doctest contains only one example, so its passing result is a limited check. The 52 module tests provide additional evidence. Optional GUI/notebook rendering and the full repository test suite were not validated.
### Commands for this Windows machine
Run from PowerShell. Use the course interpreter explicitly so commands do not select the Windows Store alias or another Python installation.
```powershell
Set-Location -LiteralPath 'D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 4511W\Code'
& '.\.venv\Scripts\python.exe' -c "from aima import agents, search; print(agents.__file__); print(search.__file__)"
& '.\.venv\Scripts\python.exe' '.\Homework\ps1.py'
& '.\.venv\Scripts\python.exe' '.\Homework\ps2.py'
Set-Location -LiteralPath '.\aima-python'
& '..\.venv\Scripts\python.exe' -m doctest -v aima/agents.py
& '..\.venv\Scripts\python.exe' -m doctest -v aima/search.py
& '..\.venv\Scripts\python.exe' -m pytest -q tests/test_agents.py tests/test_search.py
```
The assignment commands are documented entry points, not a claim that assignment answers were regraded in this setup pass. In VS Code, select `Code\.venv\Scripts\python.exe` as the Python interpreter. The current checkout uses imports such as `from aima.search import astar_search`; keep the professor's `aima/agents.py` and `aima/search.py` file paths.
### Textbooks and exercises
One locally stored textbook was found: Russell and Norvig, *Artificial Intelligence: A Modern Approach*, fourth edition, `CSCI 4511W Textbook.pdf` (2,145 PDF pages). Chapter 1 is background; assigned material through Lecture 10 is Chapter 2 §2.1-2.4, Chapter 3 §3.1-3.6, and Chapter 4 §4.1-4.4. [[20_Progress/Degree/CSCI 4511W/Textbook/Textbook Map|Textbook Map]] links all four existing chapter notes. Vector Semantics is a later supplementary reading, outside this quiz's covered lectures.
The preface, PDF pp. 11-12, says exercises moved online. Verified author-linked banks:
| Bank | Numbered entries | Status |
|---|---|---|
| [Chapter 1](https://aimacode.github.io/aima-exercises/intro-exercises/) | 1.1-1.20 | Full inventory in [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week 1]] |
| [Agents](https://aimacode.github.io/aima-exercises/agents-exercises/) | 2.1-2.16 | Located; solving not recorded |
| [Search](https://aimacode.github.io/aima-exercises/search-exercises/) | 3.1-3.40 | Located; solving not recorded |
| [Beyond Classical Search](https://aimacode.github.io/aima-exercises/advanced-search-exercises/) | 4.1-4.17 | Located; contains topics beyond assigned §4.4 |
These are 93 numbered entries, including repeated/legacy material, not 93 confirmed course assignments. Match exercises by topic and prompt, not assumed fourth-edition numbering. Course-specific exercises also occur in PS1, PS2, lecture slides, discussions, and the sample quiz.
### Lectures through Week 6
All paths in this table are relative to the primary source root. Dates come from PDF title slides and the Board schedule.
| Week | Lecture sources | Textbook connection | Canonical notes |
|---|---|---|---|
| 1 | September 9 live capture; no Lecture 01 PDF found | Chapter 1 background; Turing §1-7 | [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 1|Week 1]], source-checked this session |
| 2 | `Lecture/CSCI4511W Lecture 02.pdf` (9/14, 11 slides); Lecture 03 (9/16, 17 slides) | §2.1-2.4; §3.1-3.2 | [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 2|Week 2]], exists |
| 3 | Lecture 04 (9/21, 20 slides); Lecture 05 (9/23, 22 slides) | §3.3-3.4.4 | [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 3|Week 3]], exists |
| 4 | Lecture 06 (9/28, 32 slides); Lecture 07 (9/30, 25 slides) | §3.5-3.6 | [[20_Progress/Degree/CSCI 4511W/Weekly/Week - 4|Week 4]], needs Lecture 07 reconciliation |
| 5 | Lecture 08 (10/5, 34 slides); Lecture 09 (10/7, 30 slides) | §4.1-4.2 | Week 5 note missing |
| 6 | Lecture 10 (10/12, 38 slides) | §4.3-4.4 | Week 6 note missing; October 14 is the quiz |
Lecture 02 is Week 2. Do not relabel it as the Week 1 introductory lecture. Lectures 02-10 total 229 slides; extracted text is available for review, but later decks have only been inventoried in this Week 1 pass.
### Discussions, assignments, quizzes, and concepts
| Category | Every locally located item | Remaining gap |
|---|---|---|
| Discussions | `Discussion/turing.pdf` (22 pages); `Discussion 2.pdf` (14, AI use); `Discussion 3.pdf` (22, AI in the world); `Discussion 4.pdf` (39, search/heuristics); `Discussion 5.pdf` (15, Long Quiz 1 review) | Only Discussion 1 has a canonical discussion note; actual TA contributions are not reconstructed |
| Homework | `HW & Exams/HW/ps1.pdf`, `ps2.pdf` (3 pages each); `CSCI_4511W_Writing___1.pdf` (2 pages); citation guide (8 pages); `wa1_template.tex` | Compare instructor prompts with existing written assignment notes; do not assume completion from a polished note |
| Assignment code | `Code/Homework/ps1.py`, `ps2.py`, `wa1_template.tex`; vault mirrors in `Assignments/Code` | External Code folder is the requested working copy |
| Practice quiz | `HW & Exams/longquiz1-f24.pdf`, 5 pages, 6 problems, 40 points | Historical practice, not tomorrow's paper |
| Short quizzes | Board records Short Quizzes 01-04 before Lecture 10 | Actual questions/answers not found locally; retrieve from Gradescope/Canvas |
| Short Quiz 05 | Older Board schedule lists October 12 | Lecture 10 slide 2 explicitly says no short quiz today; follow the later announcement |
| Existing concepts | [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - PEAS Framework|PEAS]], [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Rational Agent|Rational Agent]], [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Uninformed Search|Uninformed Search]], [[20_Progress/Degree/CSCI 4511W/Concepts/Concept - Informed Search|Informed Search]] | Definitions and AI Concept Board are empty; local search and complex-environment concepts need their own source-grounded treatment |
### Long Quiz 1 verified scope and constraints
Lecture 10, slide 2, states October 14, 45 minutes, two pages of notes, and all topics including that lecture. The user confirms this scope on October 13. The Board states individual effort and no collaboration. The Fall 2024 sample permits any notes and textbook access; that historical rule does not override the current two-page limit. Whether current textbook access, calculators, electronic notes, or printed-sheet sides are permitted remains unverified.
Discussion 5 is an explicit review source. Its worked examples cover vacuum-agent scoring, IDDFS versus BFS/UCS, admissibility constraints, five-queens hill climbing, randomness/simulated annealing, and eight-puzzle heuristics. This is useful practice coverage, not evidence that nondeterministic and partially observable search are excluded; Lecture 10 explicitly includes them.
The user's stated constraints are asleep by 11 p.m., wake at 8 a.m., begin review around noon, quiz at 1 p.m. Noon to the quiz leaves one hour. At the user's stated 7 p.m. starting point, the quiz is about 18 hours away, not 24. No additional morning study blocks have been committed. Readiness cannot be inferred from the time available or the existence of notes.
### Completion gates for the review
- [x] Repair and verify the course AIMA environment in the requested Code directory.
- [x] Locate the textbook, local lecture decks through Lecture 10, discussions, assignments, and sample long quiz.
- [x] Check Week 1 sources, repair misleading claims, link existing concepts, and list its textbook exercises.
- [ ] Answer the eight Week 1 closed-note questions and record actual misses.
- [ ] Reconcile Lecture 07 into Week 4, then write source-grounded Week 5 and Week 6 notes from Lectures 08-10 and Chapter 4.
- [ ] Review all remaining lectures, discussions, assignment mistakes, and available short quizzes; retain a question-level error list.
- [ ] Solve the sample long quiz under current 45-minute/two-page conditions, then check Discussion 5's explanations.
- [ ] Prepare the permitted two-page notes after the concept/practice pass and verify the remaining resource rules.
No authenticated Canvas or Gradescope session was used. This environment has no connected course-browser login tool, and no course URL was supplied. Online completeness remains unresolved.
## Where the Points Actually Are
Problem Sets (36%) and Long Quizzes (24%) are 60% combined - Short Quizzes (12%), Writing (12%), Final Project (10%), and Discussion Attendance (6%) make up the rest. The real asymmetry: Short Quizzes are open-book and open-collaboration, but Long Quizzes are individual-only with a hard 45-minute limit and a 2-page note cap - treat them as the closest thing this course has to a proctored exam, not as "just another quiz."
## Cheapest Points
Discussion Attendance & Participation (6%) and the Recommended Readings category (0% but tracked) are the lowest-effort-to-secure lines - showing up and engaging in discussion sections captures the 6% with no separate assessment to prepare for.
## The Real Traps
- **Coding problem-set portions may require a TA code review within 10 days of the due date** - missing that window is a real, separate deadline from the assignment due date itself, easy to lose track of if only the submission deadline gets calendared.
- **Short Quizzes and Long Quizzes have opposite collaboration rules** - Short Quizzes are open-resource and open-collaboration; Long Quizzes are individual-only with collaboration during the quiz window treated as a violation. Don't let Short Quiz habits carry into Long Quiz week.
- **Late work beyond one day requires contacting course staff** - the complete September 15 syllabus capture in [[CSCI 4511W Board]] resolves the earlier truncated text. Gradescope does not accept it automatically; credit is not guaranteed.
- **This course replaced [[20_Progress/Degree/CSCI 3081W/CSCI 3081W Board|CSCI 3081W]] for a real degree requirement** - whether it closes the same major upper-division WI bucket 3081W did is unconfirmed; see [[Fall'26 Syllabus]]'s Path to Graduation section before assuming the degree math is unaffected.
## Study Cadence
With 12-14 Short Quizzes across the semester (roughly one a week), the natural cadence is: read the assigned Russell & Norvig chapter before its lecture, since Short Quizzes are described as covering "recent material" and are open-book - the prep that matters is having the material available and understood, not memorized. For the three Long Quizzes, budget real closed-book review time beforehand, since the open-collaboration habit built for weekly quizzes doesn't transfer.
## Weekly Study Plan
> [!TIP] Full 15-week schedule now real - see [[CSCI 4511W Board]]'s Schedule section
> Estimated at **~12 hours/week total** via the standard 3 hrs/credit convention (4 credits assumed, unconfirmed - see [[Fall'26 Syllabus]]) - not a stated figure. Of that, ~2.5 hrs is the two weekly lectures; discussion section adds more (day well-evidenced as Friday, length still unknown). The rhythm is now clear and repeatable: read the assigned AIMA sections before Monday's lecture (Short Quiz same day, 6pm, open-book), read the next section before Wednesday's lecture, then Friday's discussion. Every 2-3 weeks a Long Quiz (individual, closed-collaboration, 45 min, 2-page note limit) replaces the normal quiz rhythm - budget real review time before those specifically, since the open-collaboration habit built for weekly quizzes doesn't transfer.
Full week-by-week table (all 15 weeks, real dates) lives in [[CSCI 4511W Board]] - not duplicated here to avoid drift. Assessment count is now fully confirmed: 13 Short Quizzes, 3 Long Quizzes (10/14, 11/11, 12/9), 4 Problem Sets (Code+Written each), 4 Writing Assignments, 12 graded Discussion Participation sessions, 1 Final Project (due 12/18, no final exam).
## Open Question
- [ ] Confirm the exact discussion-section meeting time - the day (Friday) is now well-evidenced from due-date clustering, the time is not stated anywhere.
- [x] ~~Pull the remaining week-by-week schedule from Canvas~~ - resolved 2026-09-15, full syllabus and Modules page pasted.
- [x] ~~Get the complete late-work policy~~ - resolved 2026-09-15, see [[CSCI 4511W Board]].
- [x] ~~Confirm what textbook the Chapter 7.3-7.6 readings come from~~ - resolved 2026-09-15: they're real AIMA Chapter 7 (Propositional Logic), the earlier "second uncited text" concern was a scrambled-paste artifact.
- [x] ~~Confirm what happens in the Wed 11/25 session~~ - resolved 2026-09-15: no new reading, it's the Writing 4 (Literature Review) deadline, the day before Thanksgiving.
