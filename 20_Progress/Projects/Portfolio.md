---
type: project
status: sprout
deadline: 2026-01-10
related_progress:
  - "[[Winter Break]]"
  - "[[Plan]]"
  - "[[Useful Links]]"
  - "[[Cheat Sheet's & Notes]]"
tags:
  - "#progress"
  - "#evergreen"
next:
---
## Dev / Data Portfolio Website with Embedded AI Agent
_(Smaller “side” project that’s fast to build and good for branding)_
**Inspiration from blog:**
- PDF-based Q&A system
- LangChain Chatbot with Memory
### [[Cheat Sheet's & Notes#Nextjs|Nextjs Ebook]]
### What it does
Your personal portfolio website that:
- Shows your projects, resume, skills
- Includes an **AI agent that can answer questions about you**:
    - “What projects has Anant done with Rust?”
    - “How did they implement RAG?”
- Powered by:
    - Embeddings of your resume, README files, project docs
    - LLM Q&A interface
### Tech stack
- Next.js + Tailwind
- Embedded chat widget using:
    - LangChain or direct embeddings + LLM
    - Does RAG over your own materials
- Use GitHub as a working directory where i will learn git commands.
### Extensions
1. **Biome**:
	- Before commits:`pnpm lint      # biome check`, `pnpm format    # biome format --write`.
	- *Pro tip*: If you’re going all-in on Biome, don’t rely on ESLint extension for this project (it can conflict). Keep Biome as the single source of truth.
	- `pnpm lint` returns clean, 
	- Your code auto-formats when you save
2. 
## Repo
```bash
ai-portfolio/
  sanity/
    schemaTypes/
      index.ts
      profile.ts
      projects.ts
      experience.ts
      skills.ts
      siteSettings.ts
  src/
    app/
      (site)/
        page.tsx
        layout.tsx
      studio/
        [[...index]]/
          page.tsx
      api/
        chatkit/
          session/
            route.ts
    components/
      nav/
      sections/
      chat/
      ui/              # shadcn
    lib/
      sanity.client.ts
      sanity.queries.ts
      env.ts
  runbook.md
  .env.local
```
## Model
Example minimal model:
- **Profile (singleton):** name, headline, bio, heroImage, socialLinks, email
- **Projects:** title, slug, description, tech stack, repoUrl, liveUrl, images, featured
- **Experience:** company, role, start/end, bullets
- **Education:** school, degree, start/end, bullets
- **Skills:** name, category, level
- **SiteSettings (singleton):** site title, SEO description, og image, nav links
### UI Enhancement
Make sure that in each of the components i have groq queries at the top. I have also shown you exactly what my portfolio looks like currently. I need to fix these things about my portfolio: 
1. The buttons on the website throughout should appear 3d upon hovering currently they are just having a pop up upon hovering effect. The glass buttons should have an effect that tracks the mouse movement and shimmers upon hovering at the specific mouse location. The color should be of light meaning it should have all the colors that a rainbow does. The buttons at the landing screen should be my social links just below the content like it is(I need to update the links), then the other buttons above should be View projects, view experience and contact. They are currently in bold, remove that. 
2. The experience should have a timeline to the left of each card which is represented as a line which stops at the experience, draws a dot and then continues to the next one forms another dot. I also want the card of the experience to be slightly blurry because the user should pay attention to the experience. I want each of the card to have the comet card effect like the certifications. The cards should hover like that but comparatively lesser than the certification cards. I want a cool effect upon mouse hovering as well. The card should track the mouse movement and do something unique and cool.
3. The projects card should be bigger in the center and i will add much more detail to the card. Upon hovering the card becomes much more bigger but in general the center card should appear bigger than the left and right card. Without hovering there should be a short description of what the project is and upon hovering it will appear the details that i need for it to appear. The link's should work to live hosted website or project link. It should have a github source link as well. The cards on the left and the right of the project are the perfect size. 
4. I want to add a graph for all the skills that i have, i could copy that component from accentric ui but i am not sure if i already have a ui component installed for displaying this graph. I want to reduce the number of skills, the skills should be displayed upon clicking a dropdown for the specifications it has like front end or back end or ai. The graph should appear above these drop downs for my skills, these dropdowns for the details skills buttons should appear in a 4x4 box. One specification on the left another on the right. It should have a dropdown menu but just above the dropdown should be a description that is always seen. All the effects that the buttons currently have can be discarded and removed from the `globals.css` file as well. 
	- I currently have only two effects taking place to the skills box/button. I need your help adding more effects to the skills. I want in total 4 effects to the cards
5. Education card's should also have the comet effect about the same as the experience section but not as much as the certifications. I want the card to have a mouse effect as well. The card should slightly shine with the light color concept that i have explained to you above. 
6. Achievement and Awards should be a smaller heading with smaller boxes. Maybe not even boxes. The achievements should be something that's in a list not in boxes and there are not much features to it except the comet card effect. I want to remove the emoji's from the cards list the achievements in a unique manner. this should be different from all the above components that are in cards and next to each other. I want this to be completely unique. 
7. Latest posts should be something that i found interesting to read and i have mentioned that just below the heading. I have attached links to these reading's. This should be something that i can continue on adding as we progress in time. Make sure that these posts are set up in such a way, there should be a option to see all the posts that i have not yet archived. The heading should be: "What I Read or Do", the subheading should be: "Resources, updates and second brain". I want to add my github repo as the first thing over there. 
8. The Contact section should not have a contact form cause no one fill's that shit out anymore. I need to add a single box which has the comet card effect with my email and my socials available as button's and displayed in text in that card. It should also have the location, the heading should be something catchy like: "Tired of chatting to my AI Twin?". Just below the header should be my email that can be copied to the clipboard and below that my socials as 3d comet buttons with links. 
9. I want a footer that appears at the very bottom of the screen just below the contact section it should just be something catchy to read in the center of the screen and something cool at the edges of the screen. The footer should be transparent, something catchy to read in the center, the date published on the left corner with a cool symbol. 
10. The sidebar ui could be better. Adjust the theme based on the theme of my portfolio maybe modify the content to match my portfolio. Make sure that the ui is clean. 

I have provided you with a lot of details about everything that i need to correct about my ui. I need your help completely implementing these steps one by one. This is going to be a long chat and we don't need to jump at everything. Let's start with the most important things here like the landing screen and the cards. Create a plan to follow, I just need you to analyze my entire codebase and help me make my ui better.
## Git
- `git config` - Configure Git
- `git init` - Initialize Git repository
- `git status` - Check the status of a Git repository
- `git add` - Track files
- `git commit` - Commit tracked files
- `git push` - Upload files
- `git pull` - Download files
### Repository: Project
```bash
echo "# projects" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/gupt0479-ctrl/projects.git
git push -u origin main
```
…or push an existing repository from the command line:
```bash
git remote add origin https://github.com/gupt0479-ctrl/projects.git
git branch -M main
git push -u origin main
```