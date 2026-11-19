---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, sanity, schemas, CMS]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "// 11 document types registered:" incl. `import { contact } from './contact'` | 10 types; `src/sanity/schemaTypes/index.ts:13-26` has no `contact`; `contact.ts` does not exist |
> | "### contact … Fields: name, email, message, submittedAt, status, priority" | No `contact` document type (see above); no Server Action writes submissions |
> | profile: "Main bio, headline, avatar, about text, social links" | Fields: `shortBio` (`profile.ts:66`), `fullBio` (`:76`), `aboutSummary` (`:82`), `profileImage` (`:90`), `stats[]` (`:159`); no `avatar` field |
> | experience: "Fields: company, role, startDate, endDate, current (bool), description, tags, category" | `position` (`experience.ts:16`, not `role`), `tenure` (`:51`), `description` (`:67`), `technologies` refs (`:85`); no `role`, `current`, `tags` or `category` field in the schema |
> | project: "Fields: title, slug, description, techStack, liveUrl, githubUrl, featured, category, order, coverImage" | `summary` (`project.ts:34`) and `technologies` refs (`:52`) replace `description`/`techStack`; also `tagline` (`:26`) |
> | skill: "Fields: name, category, proficiency, icon, featured, order" | No `icon`/`featured`/`order`; adds `percentage` (`skill.ts:55`), `yearsOfExperience` (`:64`), `tone` (`:71`), `color` (`:91`) |
> | education: "Fields: institution, degree, field, …" | `fieldOfStudy` (`education.ts:21`); also `current` (`:34`), `gpa` (`:39`), `achievements` (`:48`) |
> | achievement: "Fields: title, description, date, featured, icon" | No `icon`; has `type` (`achievement.ts:16`), `issuer` (`:37`), `image` (`:51`), `url` (`:56`), `order` (`:65`) |
> | blog: "Fields: title, slug, publishedAt, excerpt, content (portable text), category, tags, featured, coverImage" | No `content` or `featured`; has `externalUrl` (`blog.ts:29`), `readTime` (`:50`), `featuredImage` (`:55`) — posts are external links |
> | siteSettings: "Fields: siteTitle, siteDescription, email, resumeUrl, socialLinks" | Only `siteTitle` (`siteSettings.ts:11`), `siteDescription` (`:16`), `siteLogo` (`:23`), `showBlog` (`:28`) |
> | navigation: "Fields: items (array of { label, href, external })" | One document per link: `title` (`navigation.ts:11`), `href` (`:18`), `isExternal` (`:34`), `linkType` (`:41`), plus `icon` (`:26`), `order` (`:59`) |
> | "type SanityQueries = Record<string, unknown>" (Generated Types) | `SanityQueries` is an `interface` inside a `declare module "@sanity/client"` augmentation (`src/sanity/types/index.ts:1109-1110`) keyed by query string → `*_QUERYResult`, not a `Record<string, unknown>` alias |

# Sanity Schemas

> [[../INDEX|← Back to Index]] · [[../architecture/02-sanity-cms|Sanity CMS]]

All schemas live in `src/sanity/schemaTypes/`. All are Community 2.

## Schema Registry

`src/sanity/schemaTypes/index.ts` exports `schema` — the array of all document types passed to `sanity.config.ts`.

```typescript
// 11 document types registered:
import { profile } from './profile'
import { experience } from './experience'
import { project } from './project'
import { skill } from './skill'
import { education } from './education'
import { certifications } from './certifications'
import { achievement } from './achievement'
import { blog } from './blog'
import { siteSettings } from './siteSettings'
import { navigation } from './navigation'
import { contact } from './contact'
```

## Document Types

### profile
**File:** `profile.ts`  
**Type name:** `"profile"`  
Main bio, headline, avatar, about text, social links. Typically a singleton (only one profile document).

### experience
**File:** `experience.ts`  
**Type name:** `"experience"`  
Work history entries. Fields: company, role, startDate, endDate, current (bool), description, tags, category.

### project
**File:** `project.ts`  
**Type name:** `"project"`  
Portfolio projects. Fields: title, slug, description, techStack, liveUrl, githubUrl, featured, category, order, coverImage.

### skill
**File:** `skill.ts`  
**Type name:** `"skill"`  
Individual skills. Fields: name, category, proficiency, icon, featured, order.  
Categories: `"frontend"`, `"backend"`, `"ai-ml"`, `"devops"`, etc.

### education
**File:** `education.ts`  
**Type name:** `"education"`  
Degrees and institutions. Fields: institution, degree, field, startDate, endDate, description.

### certifications
**File:** `certifications.ts`  
**Type name:** `"certification"`  
Certifications with validity. Fields: name, issuer, issueDate, expiryDate, credentialId, credentialUrl.

### achievement
**File:** `achievement.ts`  
**Type name:** `"achievement"`  
Awards and milestones. Fields: title, description, date, featured, icon.

### blog
**File:** `blog.ts`  
**Type name:** `"blog"`  
Blog posts. Fields: title, slug, publishedAt, excerpt, content (portable text), category, tags, featured, coverImage.

### siteSettings
**File:** `siteSettings.ts`  
**Type name:** `"siteSettings"`  
Global config singleton. Fields: siteTitle, siteDescription, email, resumeUrl, socialLinks.

### navigation
**File:** `navigation.ts`  
**Type name:** `"navigation"`  
Navigation link list. Fields: items (array of { label, href, external }).

### contact
**File:** `contact.ts`  
**Type name:** `"contact"`  
Contact form submissions (written by Server Action). Fields: name, email, message, submittedAt, status, priority.

## Generated Types

`src/sanity/types/index.ts` — **never edit manually**, generated by `pnpm typegen`.

Key generated types:
```typescript
type Navigation = { ... }
type Achievement = { ... }
type Certification = { ... }
type Education = { ... }
type Project = { ... }
type Blog = { ... }
type SanityImageMetadata = { dimensions: SanityImageDimensions; palette: SanityImagePalette; ... }
type SanityImageDimensions = { width: number; height: number; aspectRatio: number }
type SanityImagePalette = { ... }
type Geopoint = { lat: number; lng: number; alt: number }
type SanityQueries = Record<string, unknown>

// Query result types (one per GROQ query):
type PROFILE_QUERYResult = { ... }
type PROJECTS_QUERYResult = Project[]
type EXPERIENCE_QUERYResult = { ... }
type SKILLS_QUERYResult = { ... }
type EDUCATION_SECTION_QUERYResult = { ... }
type CERTS_SECTION_QUERYResult = { ... }
type ACHIEVEMENTS_SECTION_QUERYResult = { ... }
type BLOG_SECTION_QUERYResult = { ... }
type NAVIGATION_QUERYResult = { ... }
type ABOUT_QUERYResult = { ... }
type CONTACT_QUERYResult = { ... }
type SITE_SETTINGS_QUERYResult = { ... }
type PROJECT_BY_SLUG_QUERYResult = Project | null
type EXPERIENCE_BY_ID_QUERYResult = { ... }
```

## Sanity Studio Structure

`src/sanity/structure.ts` — `structure()` function defines the Studio sidebar layout. Groups document types into logical sections.

## See Also
- [[../architecture/02-sanity-cms|Sanity CMS Layer]]
- [[01-groq-queries|GROQ Queries]]
