---
type: class
input_kind: board
status: sprout
created: 2026-09-07
updated: 2026-09-28
area:
  - "[[Fall'26 Syllabus]]"
  - "[[APAS]]"
tags:
  - "#class"
next: "Set up the csci-5304 conda environment (fix the missing scikit-learn dependency first), then confirm the Week 6 date collision and midterm date on Canvas"
---
# CSCI 5304 — Computational Aspects of Matrix Theory
==Full syllabus and schedule captured 2026-09-08 from the two PDFs in the source folder - this is now the single place everything about this course lives, per the source-of-truth path below.== This course runs a **zero-AI-tools policy** - stated plainly in the syllabus, not a general disclaimer - so read the Academic Integrity section before using this note, or any AI tool, anywhere near actual homework, quizzes, or exam work.
## Source of Truth
> [!IMPORTANT] Read before trusting anything about this course
> Real source folder:
> - `D:\_Anant\10_Areas\UMN\Classes\CSCI\CSCI 5304`. 
> - As of 2026-09-08 it holds: `Syllabus/` (the two PDFs this note is built from), `Lecture/`, `Midterm/`, `Textbook/` (all three currently empty, ready for material as it arrives), `.conda/` (a local conda environment already created), `environment.yml`, and `README.md` (environment setup instructions). 
> - This Board note is the readable distillation - not a replacement for checking Canvas directly, especially given the three real date anomalies flagged in the Schedule section below (midterm date, Thanksgiving-week status). Desktop shortcut: `CSCI 5304.lnk` in `D:\_Anant\Inbox\`.
## Instructor & Logistics
**Dr. Joy Upton-Azzam, PhD** (she/her/hers) - azzam@umn.edu - Lind Hall 300B - office hours Tuesday/Thursday 9:30-11:00 AM. The syllabus does not state the actual class meeting time anywhere in its text - only the day pattern is inferable from the schedule table (Tuesday and Thursday sessions, Wednesday reserved for homework due dates, no regular Wednesday class). Confirm the real meeting time via Canvas or registration records.
## Required Materials
- **Canvas** (https://canvas.umn.edu/) - course documents and coding examples are maintained there, not in this syllabus.
- **Numerical Linear Algebra, Twenty-fifth Anniversary Edition** by Lloyd N. Trefethen & David Bau, III - ISBN-13 978-1611977158 - https://epubs.siam.org/doi/book/10.1137/1.9781611977165. Physical text, required.
- **Anaconda** - https://www.anaconda.com/download/success - the Python distribution programming is done in (see Environment Setup below for how this vault's copy is actually configured).
## Course Description
Background in Linear Algebra: subspaces, ranks, vector and matrix norms. Perturbation theory for linear systems and eigenvalue problems. Solution methods of linear systems and least-squares problems. Matrix factorizations. Computation of eigenvalues/eigenvectors. Singular value decomposition. MATLAB and/or Python/numpy for demonstrating algorithms. Introduction to sparse matrix methods.
*Prerequisite:* CSCI 2033 or MATH 2142 or MATH 2243 or MATH 2373 or MATH 4242. [[CSCI 2033 Board|CSCI 2033]] (Fall'25, grade A) satisfies this directly - already done.
## Course Content & Textbook Structure
The instructor lectures on **Parts I-V (Lectures 1-31)** of the Trefethen & Bau text - the book itself is organized into numbered "Lectures" (its own term for chapters), not conventional chapter numbers, and this course's own schedule below reuses that exact numbering (its "Lecture 24" *is* the textbook's Lecture 24). The book evidently extends past Lecture 31 into further parts not covered by this course - the exact part-by-part chapter list is deferred, per plan, until the textbook itself is read chapter by chapter.
## Learning Objectives
Addressed across lecture, homework, quizzes, and exams:
- Use the singular value decomposition to compute norms and state properties of matrices.
- Describe the solution to least squares problems in terms of projectors and reflectors.
- Determine the condition number of a mathematical problem.
- Apply backwards error-analysis to a numerical algorithm.
- Demonstrate the instability of a numerical algorithm such as Gaussian elimination.
- Implement and analyze various versions of eigenvalue/eigenvector and singular value algorithms.
- Determine the convergence of numerical algorithms and give proof of the rate.
## Grading Breakdown
| Component | Weight |
|---|---|
| Attendance & Participation | 10% |
| Homework | 20% |
| Quizzes | 30% |
| Exams (midterm + final) | 40% |

*Scale:* 92-100% A · 90-91% A- · 88-89% B+ · 82-87% B · 80-81% B- · 78-79% C+ · 72-77% C · 70-71% C- · 68-69% D+ · 60-67% D · 0-59% F.
*Attendance & Participation:* consistent attendance required. Daily attendance itself isn't monitored, but participation is judged via in-class discussion, assignments, quizzes, and other activities.
*Late Policy:* unexcused late work gets a zero. For a valid reason known in advance (sports trip, illness), you **must** contact the instructor or TA ahead of the due date to arrange a late submission - after-the-fact excuses aren't described as accepted.
*Quizzes:* every other Thursday in class, per the schedule below - average quiz score is 30% of the grade.
*Homework:* regular written and coding homework from the text, 20% of the grade - selected problem sets go through Gradescope via a Canvas assignment.
*Exams:* one midterm, one final, each worth 20% (40% combined) - covering code, topics, and applications from lecture, homework, coding, and quizzes.
## Conduct & Courtesy
Limit cell phone/laptop use to course tasks. Limit discussion to course business. Arrive on time.
## Suggestions for Success
Listed resources, in the syllabus's own order: classmates, people who've taken the course before, the instructor (office visits or by-appointment), the TAs, the Canvas modules, the authors' own site (https://people.maths.ox.ac.uk/trefethen/), and - since much of this theory was developed in the 1960s-1990s - alternate reference texts covering the same material with different emphasis: Golub & Van Loan's *Matrix Computations*, Wilkinson's *The Algebraic Eigenvalue Problem*, Householder's *The Theory of Matrices in Numerical Analysis*, Higham's *Accuracy and Stability of Numerical Algorithms*, Demmel's *Applied Numerical Linear Algebra*.
## Other University Policies
*Accessibility:* contact the Disability Resource Center (drc@umn.edu, 612-626-1333) to establish accommodations for any physical or academic barrier tied to disability.
*Non-Discrimination:* equal access regardless of race, color, creed, religion, national origin, gender, age, marital status, disability, public assistance status, veteran status, sexual orientation, gender identity, or gender expression.
*Sexual Misconduct / Title IX:* the University prohibits sexual misconduct; report or seek confidential support through the campus Title IX office. Instructors must share information they learn about possible misconduct with that office, though they'll keep it private otherwise where possible.
*Mental Health:* university confidential mental-health services exist for the usual range of student stressors (anxiety, motivation, concentration, relationships) - see the Student Mental Health Website.
*Academic Freedom:* students can take reasoned exception to views offered in the course and reserve judgment on matters of opinion, but remain responsible for learning the enrolled course's actual content.
## Weekly Schedule (Definitive Dates)
Computed from the syllabus's own week labels, cross-checked against a calendar 2026-09-08 - Tuesday/Thursday are class days, Wednesday is homework-due only (no regular Wednesday class).

| Week | Tuesday | Wednesday | Thursday |
|---|---|---|---|
| 1 | **Tue 9/8** - Day #1: Ethical Computing | - | **Thu 9/10** - Part I: Fundamentals. Lecture 1, Matrix "Action" |
| 2 | **Tue 9/15** - Lectures 2, 3: Orthogonality and Norms | - | **Thu 9/17** - Quiz #1. Lecture 4, Singular Value Decomposition |
| 3 | **Tue 9/22** - Lecture 5: More on the SVD | **Wed 9/23** - HW #1 due 11:59 PM | **Thu 9/24** - Part II: QR and Least Squares. Lectures 6,7, Projection and QR |
| 4 | **Tue 9/29** - Lectures 7,8: QR and Gram-Schmidt | - | **Thu 10/1** - Quiz #2. Lecture 10, Householder Triangularization |
| 5 | **Tue 10/6** - Lecture 11: Least-Squares Problems | **Wed 10/7** - HW #2 due 11:59 PM | **Thu 10/8** - Part III: Conditioning & Stability. Lecture 12, Conditioning |
| 6 | **Tue 10/6*** - Lectures 13,14: Floating Point Arithmetic & Stability | - | **Thu 10/8*** - Quiz #3. Lecture 15, More on Stability |
| 7 | **Tue 10/13** - Lecture 16: Stability of Householder | - | **Thu 10/15*** - Midterm Exam (syllabus's own explicit text says "Thursday, October 22nd" - see warning below) |
| 8 | **Tue 10/20** - Lecture 17: Stability of Back Substitution | **Wed 10/21** - HW #3 due 11:59 PM | **Thu 10/22** - Lecture 18, Conditioning of Least Squares Problems |
| 9 | **Tue 10/27** - Lecture 19: Stability of Least Squares Algorithms | **Wed 10/28** - Part IV: Systems of Equations (transition, no due item) | **Thu 10/29** - Quiz #4. Lecture 20, Gaussian Elimination |
| 10 | **Tue 11/3** - Lectures 21,22: Pivoting & Stability of GE | **Wed 11/4** - HW #4 due 11:59 PM | **Thu 11/5** - Lecture 23, Cholesky Factorization |
| 11 | **Tue 11/10** - Part V: Eigenvalues. Lecture 24, E-val Problems | - | **Thu 11/12** - Quiz #5. Lecture 25, Eigenvalue Algorithms |
| 12 | **Tue 11/17** - Lecture 26: Reduction to Hessenberg | **Wed 11/18** - HW #5 due 11:59 PM | **Thu 11/19*** - No Class, "Holiday Break" (syllabus's own label - see warning below) |
| 13 | **Tue 11/24** - Lecture 27: Rayleigh Quotient, Inverse Iteration | - | **Thu 11/26*** - Lecture 28, Pure QR (without shifts) - lands on actual UMN Thanksgiving Day |
| 14 | **Tue 12/1** - Lecture 29: QR with shifts | - | **Thu 12/3** - Quiz #6. Lecture 30, Other Algorithms |
| 15 | **Tue 12/8** - Lecture 31: Computing the SVD | **Wed 12/9** - HW #6 due 11:59 PM | **Thu 12/10** - No Class, Study Days |

**Final Exam:** Lecture section 001 - Tuesday, December 22, 10:30 AM - 12:30 PM (per https://onestop.umn.edu/calendar/final-exam-times).
> [!WARNING] Three date anomalies in the printed syllabus, all pointing the same direction
> 1. **Week 5 and Week 6 land on the identical Tuesday (10/6).** The syllabus prints weeks 1-5 as a Sunday-before-the-week date and weeks 6-15 as the Tuesday date directly - both conventions are internally consistent on their own, but they collide exactly at the week 5/6 boundary, which is not possible for two rows with genuinely different lecture content (11-12 vs. 13-15).
> 2. **The midterm's own explicit text says "Thursday, October 22nd,"** but that date falls on printed-Week-8's Thursday, not printed-Week-7's Thursday (10/15) where the row actually sits.
> 3. **"No Class, Holiday Break" sits on printed-Week-12's Thursday (11/19),** which isn't a recognized UMN holiday - while the real, confirmed UMN Thanksgiving Thursday (11/26) falls on printed-Week-13's Thursday, which the table instead shows as a normal lecture (Lecture 28).
> All three point to the same likely cause: everything from Week 6 onward may be running one row "behind" its real calendar week, the same kind of leftover-template artifact caught earlier this session in TIP103's stale "Spring break" line. Dates marked * above are the ones this affects.
> **Cross-verified 2026-09-15 against a live Canvas scrape** (`.firecrawl/syllabus.md` and `.firecrawl/schedule.md` in the source folder, pulled 2026-09-08) - all three anomalies are present there too, identically. This is not a PDF-copy or vault-ingestion artifact; it's baked into the professor's own Canvas page. **Confirm the real midterm date and the real Thanksgiving-week class status directly with the instructor or TA** - Canvas itself won't self-correct this.
> **A fourth, live anomaly, confirmed 2026-09-28 from the lecture transcripts themselves:** Quiz #1 did **not** happen in class on Thu 9/17 as the printed schedule shows - the professor hadn't written it. It became an ungraded-cadence take-home, posted the morning of Tue 9/22 and due that same day at 11:59 PM. Treat the printed "every other Thursday in class" quiz cadence as the intent, not a guarantee - confirm each quiz actually happened in class before assuming the schedule table above is current.
## Environment Setup
Already scaffolded in the source folder, confirmed 2026-09-08. Local conda environment at `.conda/csci-5304` inside the course folder (not a global conda env) - open a notebook in VS Code, pick the kernel **Python (csci-5304)**, run cells normally.
*To recreate,* from the course folder in Anaconda Prompt or PowerShell:
```powershell
conda env create --prefix .\.conda\csci-5304 --file environment.yml
conda run --prefix .\.conda\csci-5304 python -m ipykernel install --user --name csci-5304 --display-name "Python (csci-5304)"
```
*Packages in `environment.yml`:* python 3.12, jupyterlab, notebook, ipykernel, numpy, pandas, scipy, matplotlib, seaborn, sympy.
> [!WARNING] The README's own verify command will fail as written
> `README.md`'s verify step imports `sklearn` (`import numpy, pandas, scipy, matplotlib, seaborn, sympy, sklearn`), but `scikit-learn` is not listed anywhere in `environment.yml`. Either add `scikit-learn` to the environment file before running verify, or drop `sklearn` from the verify command if the course never actually needs it - the syllabus itself never mentions scikit-learn, only "Matlab and/or Python/numpy," so this may just be a leftover from a different course's template.
## Must-Reads / Immediate Next Steps
- Fix the `environment.yml` scikit-learn gap before the first coding homework, not after hitting the import error.
- Confirm the real midterm date and Thanksgiving-week status on Canvas (see schedule warning above).
- Confirm the actual class meeting time - not stated anywhere in this syllabus.
- Textbook part/chapter breakdown for Parts I-V - deferred by plan, to be filled in as each part is actually read.
## Weekly Note-Building Workflow (repeatable, set up 2026-09-28)
No lecture slides exist for this course at all - the only real lecture source is the raw transcript files in `Lecture/Transcripts/`, so both the textbook layer and the weekly synthesis layer have to be built by running two sets of AI prompts against them, in order, every week:
1. **Notebook prompts** (Gemini Notebook, one per lecture, sometimes split into parts for length) - upload `Textbook & Resources/CSCI 5304 Textbook.pdf` plus that lecture's transcript excerpt, land the output as `Textbook/Lecture - N.md`.
2. **Codex prompts** (`codex` CLI, one single prompt per week, not per lecture) - once that week's Lecture notes exist, run the week's prompt against the full transcript(s) plus the landed Lecture notes; it writes the finished week note directly into `Weekly/Week - N.md`.

Both prompt sets' **reusable master templates** live in [[20_Progress/Degree/Repetitive Things|Repetitive Things]] (§ Notebook, § Codex) - written to be filled in for any future course, not just this one. The **filled-in, course-specific versions for Weeks 2-3** are staged in [[20_Progress/Degree/CSCI 5304/Weekly/Week - 2 & 3 (Prompts)|Week - 2 & 3 (Prompts)]], along with the real source manifest (which transcript covers which lecture, and which weeks/lectures don't have a transcript yet). Week 1 is skipped on purpose (nothing was captured for it); each future week should get its own manifest-plus-filled-prompts entry following that same file's shape rather than reinventing the process.
## Resources
- Course text: Trefethen & Bau, *Numerical Linear Algebra* (25th Anniversary Ed.) - https://epubs.siam.org/doi/book/10.1137/1.9781611977165
- Author's own site: https://people.maths.ox.ac.uk/trefethen/
- Alternate references (per Suggestions for Success): Golub & Van Loan *Matrix Computations*; Wilkinson *The Algebraic Eigenvalue Problem*; Householder *The Theory of Matrices in Numerical Analysis*; Higham *Accuracy and Stability of Numerical Algorithms*; Demmel *Applied Numerical Linear Algebra*.
- Canvas: https://canvas.umn.edu/
## Verification Notes
Both source PDFs (`CSCI 5304 Syllabus.pdf`, 5 pages; `CSCI 5304 Syllabus Schedule.pdf`, 1 page - a duplicate of the syllabus's own final page) were read in full 2026-09-08 and cross-checked against their own rendered page images, which matched the extracted text exactly. Every section above (materials, description, prerequisites, objectives, grading, all named policies, the full schedule, environment setup) is captured from those two files or the course folder's `README.md`/`environment.yml`, not inferred. The three schedule anomalies were found by computing literal calendar dates from the syllabus's own printed week-anchors and checking them against each other and against the independently-confirmed UMN Fall'26 Thanksgiving date (Thu 11/26) from earlier this session - not assumed, computed and cross-checked. Not verified: the actual class meeting time, and whether Canvas's live schedule matches this PDF exactly (the anomalies above suggest it may not, at least around the midterm/Thanksgiving weeks).
