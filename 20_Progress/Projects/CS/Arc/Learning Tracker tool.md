---
type: project
status: sprout
deadline: 2026-02-01
related_progress:
  - "[[Plan - Ahnaf]]"
  - "[[Winter Break]]"
  - "[[Useful Links]]"
tags:
  - "#progress"
  - "#evergreen"
next:
---
# Full Stack + Gen AI
## Minimum Viable Product(MVP)
### Data model (simple, scalable)
- `Language` (JavaScript, Python, Rust…)
- `Module` (Basics, OOP, Async, Memory…)
- `Lesson` (concept page: explanation, examples, visuals)
- `Quiz` (optional)
- `UserProgress` (completed lessons, streak, XP)
- `Questions` (what user asked the agent)
- `Embeddings` (vector rows for lessons)
### Data model (minimal)
- `User` (from auth provider)
- `Course` (name, goal, startDate)
- `Topic` (courseId, name, difficulty, tags)
- `StudySession` (topicId, date, minutes, note)
- `WeeklyRecap` (userId, weekStart, recapText, nextStepsText)
### API surface (simple)
- `/api/courses` CRUD
- `/api/topics` CRUD
- `/api/sessions` CRUD
- `/api/recap/generate` (calls LLM, stores result)
### Core features (MVP)
- Browse languages → modules → lessons
- Mark lesson complete + streak/XP
- Dashboard: progress + weekly chart
- Ask AI: “Explain closures like I’m 12” (RAG over your lesson content)
## Stack (keep it simple, ship fast)
- **Next.js + TypeScript**
- **Tailwind CSS + shadcn/ui**
- *3D on the website*:
	- **react-three-fiber** (React renderer for three.js) [Poimandres Documentation+1](https://r3f.docs.pmnd.rs/?utm_source=chatgpt.com)
	- **@react-three/drei** helper components (cameras, controls, loaders, etc.) [Poimandres Documentation](https://drei.docs.pmnd.rs/?utm_source=chatgpt.com)
	- Optional animation: **react-spring** for physically-realistic motion in R3F scenes [React Spring](https://react-spring.dev/docs/guides/react-three-fiber?utm_source=chatgpt.com)
- **Postgres** (Neon / Supabase / Railway): Database
- **Prisma** ORM or Drizzle ORM
- **Auth**: Clerk (fastest)
- Charts: Recharts
- Deploy: Vercel
- **OpenAI API** for chat + embeddings: **pgvector inside Neon Postgres** as your vector store (RAG)
- *Tool decisions for the AI feature (keep it simple)*: Vector store: start with Postgres, not Pinecone. Your earlier stack already includes **Neon Postgres**. So instead of adding Pinecone, you can store vectors in Postgres (pgvector) and keep one database.
	- Why this matters: fewer services = less confusion. If later you need huge scale, you can switch to Pinecone. For your sprint, one DB wins.
	- *Streaming chat Vercel AI SDK*: Your summary called it “Versa AI SDK,” but what’s widely used in Next.js is **Vercel AI SDK** with `useChat` + server-side streaming helpers. [AI SDK+2Vercel+2](https://ai-sdk.dev/cookbook/next/stream-text-with-chat-prompt?utm_source=chatgpt.com)
## Repo
**Repo layout (single mono-repo)**:
```bash
/app                  # Next.js app
  /app                # routes (App Router)
  /components          # UI components
  /lib                 # db, auth, ai, utils
  /scripts             # ingestion: embed lessons -> pgvector
  /db                  # drizzle schema + migrations
  /content             # lesson source (markdown/json) OR seed scripts
/docs                 # roadmap + architecture + decisions
/internships          # CSV trackers
/interview            # practice logs, STARs
```
Obsidian layout (Sprint HQ):
- `00_Dashboard` (Sprint HQ, links to GitHub board + weekly plan)
- `Decisions/` (Decision notes: tool choices, tradeoffs)
- `Daily/` (MITs + shipped + blockers)
- `Mentor/` (agenda + shipped/blockers/asks)
- `Build-Notes/` (how you solved bugs + commands).
## Roadmap (5 sprints, weekly) — with tools + deliverables
### Sprint 1 (Week 1): Foundation + Data Model + Auth
**Goal:** you can sign in and view a protected dashboard; DB schema exists.
1. *Tools used (exact)*:
	- Next.js + TS
	- Tailwind + shadcn/ui
	- Clerk middleware route protection [Clerk+1](https://clerk.com/docs/reference/nextjs/clerk-middleware?utm_source=chatgpt.com)
	- Neon Postgres
	- Drizzle schema + migrations
2. *Deliverables*
	- ✅ Clerk auth wired (login/logout)
	- ✅ Protected routes (Dashboard only accessible signed-in)
	- ✅ DB tables created (minimum):
	    - `languages`
	    - `modules`
	    - `lessons`
	    - `user_progress` (completed lessons, xp, streak)
	- ✅ GitHub board created:
	    - Backlog / This Sprint / In Progress / Review / Done
3. *Scrum cadence*
	- Create **Sprint backlog** (10–15 issues)
	- Every issue has: _acceptance criteria + estimate + link to doc/decision_
## Sprint 2 (Week 2): Core Learning Tracker MVP
**Goal:** browse learning content and track progress.
1. *Tools used*
	- Next.js routing + server actions/API routes
	- Drizzle queries
	- UI components from shadcn/ui
2. *Deliverables*:
	- ✅ Browse: Language → Module → Lesson
	- ✅ Lesson page displays content + “Mark complete”
	- ✅ Progress updates in DB
	- ✅ Dashboard shows:
	    - completed count
	    - streak
	    - weekly minutes chart (simple chart is fine)
**No AI yet**. Make the base product real first.
## Sprint 3 (Week 3): AI Tutor (RAG) + Chat UX
**Goal:** “Ask AI” answers questions grounded in your lesson content.
1. *Tools used*
	- For chat streaming UI + server route: **Vercel AI SDK** `useChat` [AI SDK+1](https://ai-sdk.dev/docs/reference/ai-sdk-ui/use-chat?utm_source=chatgpt.com)    
	- OpenAI model calls via AI SDK provider
	- pgvector in Neon for embeddings + similarity search [Neon+1](https://neon.com/docs/extensions/pgvector?utm_source=chatgpt.com)
2. *Deliverables*
	- ✅ Embeddings table in Postgres (pgvector)
	- ✅ Ingestion script:
	    - reads lesson content
	    - chunks it
	    - generates embeddings
	    - stores them with metadata `{lessonId, moduleId, languageId}`
	- ✅ `/api/chat` (or server action) does:
	    1. embed user question
	    2. similarity search top-k chunks (filter by language/module)
	    3. build prompt with context
	    4. stream response
	- ✅ Chat messages persisted (per user + per language/module)
**This is your “GenAI artifact.”**
## Sprint 4 (Week 4): 3D Components + Deploy + CI
**Goal:** your app is live, stable, and visually differentiating.
1. *Tools used*
	- react-three-fiber + drei [Poimandres Documentation+2Poimandres Documentation+2](https://r3f.docs.pmnd.rs/?utm_source=chatgpt.com)
	- Vercel deploy
	- GitHub Actions basic CI (lint/typecheck/build)
2. *Deliverables*
	- ✅ 3D Hero (or 3D lesson visual component) integrated _without tanking performance_
	- ✅ Vercel deployment live URL
	- ✅ Runbook.md: deploy steps + env vars + DB migrations
	- ✅ CI pipeline (minimum):
	    - `npm run lint`
	    - `npm run typecheck`
	    - `npm run build`
## Sprint 5 (Week 5): Polish + Content Scale + Portfolio Packaging
**Goal:** recruiter-ready story + demo.
1. *Tools used*
	- Obsidian for final write-up drafts + decision logs
	- GitHub Releases (optional) for tagging v1.0
2. *Deliverables*
	- ✅ Project write-up:
	    - architecture diagram
	    - 3 key decisions (with rationale)
	    - “what I’d do next”
	- ✅ 3–5 minute demo video
	- ✅ Resume bullets
	- ✅ 15–30 languages content seeded (can be curated, not massive)
## Do now
**GitHub Issues + GitHub Project board**: Sprint backlog, “In Progress,” “Review,” “Done”. Every feature is an Issue; every PR references an Issue.
1. **Open GitHub board** → pick 1–3 “MIT” issues
2. **Obsidian Daily Note**
    - MITs
    - Shipped
    - Blockers
    - Decision needed
3. **Code + commit** at least once daily
4. End of day:
    - move issues across columns
    - write 2–3 bullet recap in Obsidian
    - log any decision (Decision template)
## Weekly workflow
- Monday: Sprint planning (choose 10–15 issues)
- Midweek: scope cuts (if behind)
- Sunday: Sprint review + retrospective:
    - what shipped
    - what blocked
    - decisions
    - next sprint plan
## Videos to follow
Nice programming website: [Coddy](https://coddy.tech/)
### [Codebox-style fullstack SaaS](https://youtu.be/rdaSPdCkoFQ?si=Zt9YNRQzVVUIUQZI)
**Follow it for:**
1. **Auth + protected routes (copy pattern, not UI)**: Clerk login + middleware-protected routes is a great “ship fast” move and looks legit on resume. 
2. **Postgres + ORM + schema relationships**: Neon Postgres + a typed ORM is perfect for your tracker (users → goals/topics → sessions → recaps). If the video uses *Drizzle*, that’s fine; if you prefer Prisma, also fine. The important part is **relational modeling + migrations + clean queries**.
	- (Neon + Clerk + Drizzle is a known combo and even has example repos you can reference.) [GitHub+1](https://github.com/raoufchebri/neon-clerk-drizzle-nextjs?utm_source=chatgpt.com)
3. **Progress tracking, streaks, XP (gamification-lite)**: For Learning Tracker, keep this minimal:
	- streak = “days with ≥1 session”
	- XP = minutes or session count
	- weekly chart = minutes/day
4. **Deployment discipline**: The “deploy with env vars + verify local build” workflow is exactly what makes your project look real.
**Skip:**
- billing/subscriptions
- code editor playground
- anything “SaaS monetization” (excess for sprint)
### ["Chat with PDF” SaaS (Elliot)](https://youtu.be/bZFedu-0emE?si=uKTI6QTVs7aQyoiD)
**Follow it for:**
- the RAG pipeline architecture: chunk → embed → retrieve → answer
- streaming chat UI structure
- message persistence patterns(so chats are saved per user / per lesson or per language)
- **Auth-protected routes** (Clerk pattern)
That video is literally the “RAG app wiring” pattern in Next.js.
**Don’t follow literally:**
- S3 uploads (not needed unless users upload PDFs)
- Pinecone (skip for MVP; use pgvector in Neon instead)
- Stripe subscriptions (skip)
### [Semantic search repo (dabit3)](https://youtu.be/6_mfYPPcZ60?si=-mS8ykz2lDNrTEUk)
**Use it as a reference** (not a “follow along”):
- chunking best practices
- simple indexing workflow (load docs → embed → upsert vectors)
- query workflow (embed query → similarity search → feed to LLM)
It’s a clean “minimum viable semantic search” reference. [GitHub](https://github.com/dabit3/semantic-search-nextjs-pinecone-langchain-chatgpt?utm_source=chatgpt.com)
**Do NOT follow**:
- treating this like a separate app; you’re embedding this inside your Learning Tracker, not building a standalone demo.