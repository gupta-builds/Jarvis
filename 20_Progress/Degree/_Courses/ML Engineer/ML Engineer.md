---
type: class
status: sprout
created: 2026-09-07
updated: 2026-09-08
tags:
  - class
  - fall2026
  - courses
  - ml-engineer
  - mlops
notes:
  - "[[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]]"
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]]"
  - "[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]]"
next: "Name and scaffold the shared local repo both tracks build into - the open task blocking the real deliverable"
---
# ML Engineer — DataCamp Career Track + DataTalksClub MLOps Zoomcamp (Merged Track)
==User decision 2026-09-08: this is one merged learning track, not two parallel ones - DataCamp's Machine Learning Engineer career track and DataTalksClub's MLOps Zoomcamp run simultaneously, "almost as one course," because they cover the same MLOps gap from two angles at once.==
## What This Is
Two resources, run together:
- DataCamp's **Machine Learning Engineer** career track (https://www.datacamp.com/tracks/machine-learning-engineer) - 12 courses, ~44 hours, video + interactive coding exercises in-browser, Python throughout. States itself as intermediate, not for beginners - requires prior ability to manipulate data and train/evaluate ML models. Targets junior ML engineer roles, distinct from DataCamp's "Machine Learning Scientist with Python" track (model-building itself).
- DataTalksClub's **MLOps Zoomcamp** (https://github.com/DataTalksClub/mlops-zoomcamp, FAQ at https://datatalksclub.github.io/faq/mlops-zoomcamp.html) - free, repo-based, 6 modules plus a capstone, roughly a 9-week pace if followed as designed. Everything lives in a public GitHub repo - homework, code, video links per module, not a locked platform.
This folder previously tracked these as two separate `_Courses` entries (`ML Engineer` and `ML Ops`). The `ML Ops` note is retired as of 2026-09-08 and folded in here - this is now the single note for both.
## DataCamp Track — Machine Learning Engineer (12 Courses, Chapter-Level)
Pulled directly from the user's own enrolled track page 2026-09-08 - the real in-app curriculum. Instructor across the track: **Folkert Stijnman**. Two courses are marked "optional / go further" in the app - **Introduction to Shell** sits before the first optional marker and **MLOps Deployment and Life Cycling** and **ETL and ELT in Python** are the two flagged as go-further material, extending rather than gating the track.
1. **Supervised Learning with scikit-learn** (core, skippable via placement test) - Classification (800 XP), Regression (1100 XP), Fine-Tuning Your Model (800 XP), Preprocessing and Pipelines (1350 XP). The one course here that's model-building rather than MLOps mechanics.
2. **MLOps Concepts** (core, skippable via placement test) - Introduction to MLOps (600 XP), Design and Development (750 XP), Deploying Machine Learning into Production (750 XP), Maintaining Machine Learning in Production (850 XP).
3. **Introduction to Shell** (core, skippable via placement test) - Manipulating files and directories (1000 XP), Manipulating data (1000 XP), Combining tools (1100 XP), Batch processing (750 XP), Creating new tools (800 XP). Project: agriculture crop-cultivation feature selection.
4. **MLOps Deployment and Life Cycling** (optional/go-further) - MLOps in a Nutshell (800 XP), Develop for Deployment (1000 XP), Deploy and Run (850 XP), Monitor and Maintain (1000 XP).
5. **Introduction to MLflow** (core) - Introduction to MLflow (700 XP), MLflow Models (1000 XP), MLflow Model Registry (900 XP), MLflow Projects (1150 XP). Project: London temperature prediction experiment.
6. **ETL and ELT in Python** (optional/go-further) - Introduction to Data Pipelines (650 XP), Building ETL Pipelines (1400 XP), Advanced ETL Techniques (1300 XP), Deploying and Maintaining a Data Pipeline (1100 XP).
7. **Introduction to Data Quality with Great Expectations** (core) - Connecting to Data (850 XP), Establishing Expectations (1000 XP), GX in Practice (850 XP), All About Expectations (800 XP).
8. **Introduction to Data Versioning with DVC** (core) - Introduction to DVC (600 XP), DVC Configuration and Data Management (900 XP), Pipelines in DVC (1000 XP).
9. **Monitoring Machine Learning Concepts** (core) - What is ML Monitoring (700 XP), Theoretical Concepts of Monitoring (600 XP), Covariate Shift and Concept Drift Detection (750 XP).
10. **Monitoring Machine Learning in Python** (core) - Data Preparation and Performance Estimation (900 XP), Monitoring Performance and Business Value (800 XP), Root Cause Analysis and Issue Resolution (1100 XP).
11. **Introduction to Docker** (core) - Using Docker Containers (900 XP), Writing Your Own Docker Images (1450 XP), Creating Secure Docker Images (1050 XP).
12. **CI/CD for Machine Learning** (core) - Introduction to CI/CD and YAML (700 XP), GitHub Actions (950 XP), Continuous Integration in Machine Learning (1000 XP), Comparing training runs and Hyperparameter (HP) tuning (850 XP).
## DataTalksClub Track — MLOps Zoomcamp (6 Modules + Capstone)
Confirmed via the repo README and FAQ, re-verified 2026-09-08:

| Module | Title | Covers |
|---|---|---|
| 1 | Introduction | MLOps maturity model, environment setup, NY Taxi dataset walkthrough |
| 2 | Experiment Tracking & Model Management | MLflow, model saving/loading, model registry |
| 3 | Orchestration & ML Pipelines | Workflow orchestration (specific tool not named in the fetched FAQ/README - verify inside the module itself, likely Mage or Prefect given Module 5 also uses Prefect, but that's a guess) |
| 4 | Model Deployment | Online deployment via a Flask web service; offline/batch deployment; AWS Kinesis + Lambda for streaming |
| 5 | Model Monitoring | Web-service monitoring with Prometheus, Evidently, and Grafana; batch-job monitoring with Prefect and MongoDB |
| 6 | Best Practices | Unit/integration testing, linting, pre-commit hooks, CI/CD via GitHub Actions, Infrastructure as Code via Terraform |
| 7 | Final Project | End-to-end pipeline integrating everything above |

*Cohort status, confirmed 2026-09-08:* "We don't plan to run a live cohort in 2026" - self-paced only this year. That matters concretely: the Zoomcamp's certificate requires completing the capstone **during a live cohort** with peer review; homework is optional and there's no fixed weekly deadline. With no 2026 cohort, **the certificate isn't obtainable this year regardless of effort** - which fits the plan below, since the local-repo deliverable was already the actual target, not the certificate.
*Prerequisites the course states:* Python proficiency, Docker basics, command-line fundamentals, prior ML knowledge (their own ML Zoomcamp covers this), roughly a year of programming experience - none of these are a gap here given [[CSCI 4041 Board|CSCI 4041]], [[CSCI 2033 Board|CSCI 2033]], and the DataCamp track above already cover the ML/Python side.
*Module 1 specifics* (mostly environment setup, not conceptual): Jupyter-in-VSCode, WSL instructions, Anaconda/Miniforge/`uv` package-manager choices, AWS EC2 setup with real cost guidance ("~$0.40 for a 5-hour work day if you stop the instance after"). Documented common failure points: missing `pandas`/`scikit-learn`/`pyarrow` dependencies, categorical-encoding mismatches between `DictVectorizer` and `OneHotEncoder`, memory issues in Jupyter on the taxi dataset - worth reading before starting, not after hitting the same errors.
## Why This Combo
On its own, a DataCamp completion badge isn't portfolio evidence, and a Zoomcamp certificate isn't obtainable in 2026 anyway. What both are actually for, per [[10_Areas/Life/Plans/Fall 2026/Fall 2026 - The One Thing|Fall 2026 - The One Thing]]: closing a specific, real gap - most self-taught ML work stops at "the model trains and scores well," and everything here is about what happens after that (packaging, deploying, watching it drift, versioning the data that produced it). Running both at once instead of sequentially is deliberate reinforcement on the same subject from two different teaching styles - DataCamp is structured and certified, the Zoomcamp is open-source and project-driven with a real end-to-end capstone shape - as long as the local-repo deliverable actually gets built instead of two separate, unused completion states.
[[10_Areas/Life/Plans/Fall 2026/Fall 2026 Builds|Fall 2026 Builds]] names a "self-improving ingestion system" as TradingView's Fall target - that phrase only means something if the ingestion pipeline tracks its own data-quality drift and retrains or re-audits itself on a schedule, which is exactly Zoomcamp Module 5 (monitoring) and Module 3 (orchestration) applied to a real system already in progress, not a toy dataset.
## How They Run Together
Self-authored mapping, 2026-09-08, to study the overlapping subject once instead of twice - not an official pairing from either provider:
- *Tracking/experiments:* DataCamp's **Introduction to MLflow** pairs directly with Zoomcamp **Module 2**.
- *Deployment:* DataCamp's **MLOps Deployment and Life Cycling** pairs with Zoomcamp **Module 4**.
- *Data pipelines/versioning:* DataCamp's **ETL and ELT in Python** and **Introduction to Data Versioning with DVC** pair with Zoomcamp **Module 3** (orchestration) - the closest available overlap even though the tools differ (DVC vs. whatever Module 3 uses).
- *Monitoring:* DataCamp's **Monitoring Machine Learning Concepts/in Python** pairs directly with Zoomcamp **Module 5**.
- *CI/CD and containers:* DataCamp's **Introduction to Docker** and **CI/CD for Machine Learning** pair with Zoomcamp **Module 6**.
- Zoomcamp **Module 1** (environment setup) and DataCamp's **Introduction to Shell** and **MLOps Concepts** are the natural starting pair - do these first regardless of the rest of the order.
Practical cadence: work a DataCamp course and its paired Zoomcamp module in the same week, then apply both immediately to the shared repo below before moving to the next pair - not two full separate passes through both curricula back to back.
## The Real Deliverable
Per the user directly: the deliverable is implementing this material in a real local repo, not either provider's completion state. **That repo doesn't exist yet - naming and scaffolding it is the open task**, tracked at the top of this note's frontmatter. Natural shape given the combined curriculum above: one real model (could be TradingView-adjacent, could be standalone), wrapped with an MLflow-tracked training run (DataCamp course 5 + Zoomcamp Module 2), a Docker container (DataCamp course 11), a CI/CD pipeline that redeploys on push (DataCamp course 12 + Zoomcamp Module 6), and a monitoring check for drift (DataCamp courses 9-10 + Zoomcamp Module 5) - i.e., actually build the pipeline both curricula describe, once per major topic, against a real dataset. The strongest version connects this directly to TradingView's ingestion pipeline once the material reaches orchestration/monitoring, rather than a disconnected practice project.
## Resources
- DataCamp track page: https://www.datacamp.com/tracks/machine-learning-engineer - course list, hours, confirmed 2026-09-07; chapter-level detail confirmed 2026-09-08 from the user's own enrolled page.
- Login-walled DataCamp app URL (https://app.datacamp.com/learn/career-tracks/machine-learning-engineer) redirects to sign-in - use only once logged in to track real per-course progress.
- [MLOps Zoomcamp repo](https://github.com/DataTalksClub/mlops-zoomcamp) - syllabus, homework, code for all 6 modules plus capstone.
- [MLOps Zoomcamp FAQ](https://datatalksclub.github.io/faq/mlops-zoomcamp.html) - practical troubleshooting per module; Module 1's section is almost entirely environment/setup issues.
- [YouTube playlist](https://www.youtube.com/playlist?list=PL3MmuxUbc_hIUISrluw_A7wDSmfOhErJK) - handed over as this course's likely video companion in an earlier session, but its title/uploader/contents were never confirmed by fetch (YouTube's page returned only footer text) - open it directly before relying on it.
## Relation to _Courses Board
Runs with no fixed end date, per [[20_Progress/Degree/_Courses/_Courses Board|_Courses Board]] - underneath the certification sequence (GitHub Foundations → AI Associate Engineer → System Design) without blocking or being blocked by it. Previously listed as two separate rows (`ML Engineer` and `ML Ops`) in that board's Status table and Map - both now collapse into this single entry, and the Board needs its own edit to match.
## Verification Notes
Confirmed via direct WebFetch of both public pages 2026-09-07: DataCamp course count (12), total hours (44), skill level, prerequisites; Zoomcamp's 6-module + capstone structure, module titles/topics, prerequisites. 2026-09-08: the user pasted the real in-app DataCamp track page (chapter-level breakdown, XP values, project descriptions, instructor, optional/go-further flags) - this superseded the earlier one-line-description version and is now the DataCamp section's source. A same-day re-fetch of the Zoomcamp FAQ and GitHub repo confirmed "no live cohort planned in 2026" (self-paced only, no certificate obtainable via this route this year) and the same module structure as the original 2026-09-07 pass. Not confirmed: the specific orchestration tool in Zoomcamp Module 3, whether DataCamp's in-app curriculum matches this public marketing-page structure exactly, and anything about the YouTube playlist beyond its URL.
