---
type: concept
status: sprout
created: 2026-06-12
tags: [portfolio, sanity, groq, queries]
---

> [!warning] Correction pass 2026-11-19 — verified against repo `post-frontend` @ `5f29675` + uncommitted working tree
> Graph-derived snapshot (stale); see INDEX correction + repo `graphify-out/GRAPH_REPORT.md`.
>
> | This note says | Repo reality |
> |---|---|
> | "All queries defined in `src/sanity/lib/queries.ts`" | `queries.ts` exports 13 `*_QUERY` consts (`PROFILE:4`, `SITE_SETTINGS:42`, `NAVIGATION:58`, `PROJECTS:73`, `SKILLS:99`, `EXPERIENCE:112`, `EDUCATION:150`, `CERTIFICATIONS:156`, `ACHIEVEMENTS:162`, `BLOG:168`, `PROJECT_BY_SLUG:174`, `EXPERIENCE_BY_ID:182`, `CHAT_CATALOG:190`). `ABOUT_QUERY`, `CONTACT_QUERY`, `EDUCATION_SECTION_QUERY`, `CERTS_SECTION_QUERY`, `ACHIEVEMENTS_SECTION_QUERY`, `BLOG_SECTION_QUERY` are inline in `src/components/sections/*Section.tsx` (`About:7`, `Contact:5`, `Education:7`, `Certifications:12`, `Achievements:9`, `Blog:8`) |
> | PROFILE_QUERY: `*[_type == "profile"][0]{ firstName, lastName, headline, bio, avatar …, socialLinks, skills, ... }` | Real (`queries.ts:4-40`): `coalesce(*[_type=="profile" && _id=="singleton-profile"][0], *[_type=="profile"][0]){ _id, firstName, …, shortBio, fullBio, profileImage, …, socialLinks{…}, yearsOfExperience, stats[]{label,value,summary} }` — no `bio`, `avatar`, `skills` projected. The `longBio` / `highlights` example does not match the schema (`fullBio`, `profile.ts:76`) |
> | EXPERIENCE_QUERY: `order(startDate desc){ _id, company, role, startDate, endDate, current, description, tags, category }` | Real (`queries.ts:112-148`): `order(order asc, startDate desc)`; fields `position`, `employmentType`, `tenure`, computed `current`, `responsibilities[]`, `achievements[]`, `technologies[]->{…}`, `companyLogo`, `companyWebsite` |
> | PROJECTS_QUERY: `order(order asc){ _id, title, slug, description, techStack, … }` | Real (`queries.ts:73-97`): `order(order asc, title asc)`; `slug{ current }`, `tagline`, `summary`, `coverImage`, `technologies[]->{…}`, `category`, `liveUrl`, `githubUrl`, `"featured": coalesce(featured, false)`, `order` |
> | SKILLS_QUERY: `order(order asc){ _id, name, category, proficiency, icon, featured }` | Real (`queries.ts:99-110`): `order(category asc, name asc)`; `percentage`, `yearsOfExperience`, `"tone": coalesce(tone, "neutral")`, `color` — no `icon` / `featured` / `order` projected |
> | EDUCATION_QUERY: `order(endDate desc){ _id, institution, degree, field, … }` | Real (`queries.ts:150-154`): `order(startDate desc)`; field is `fieldOfStudy`; also `current`, `gpa`, `logo` |
> | SITE_SETTINGS_QUERY: `*[_type == "siteSettings"][0]{ siteTitle, siteDescription, email, resumeUrl, socialLinks }` | Real (`queries.ts:42-56`): `coalesce` over three singleton ids; projects `siteTitle`, `siteDescription`, `siteLogo`, `showBlog`, `_createdAt`, `_updatedAt` |
> | NAVIGATION_QUERY: `*[_type == "navigation"][0]{ items[]{ label, href, external } }` | Real (`queries.ts:58-71`): `*[_type=="navigation"] \| order(order asc){ _id, title, href, icon, "isExternal": select(…), order }` — one doc per link |
> | "Contact Queries" (`_type == "contact"`, `status == "new"`, `priority == "high"`) | No `contact` document type (`schemaTypes/index.ts:13-26`); the real `CONTACT_QUERY` (`ContactSection.tsx:5`) projects the `profile` singleton (`email`, `location`, `socialLinks{…}`) |
> | CHAT_CATALOG_QUERY: `{ "profile": …, "experience": … }` | Real keys (`queries.ts:190-211`): `projects`, `experience`, `skills`, `education`, `certifications`, `achievements` — no `profile` |
> | Blog examples using `content`, `featured == true`, `author->` | `blog.ts` has no `content`, `featured`, or `author` field (it has `externalUrl`, `readTime`, `featuredImage`, `tags`); real `BLOG_QUERY` is `order(publishedAt desc)[0...6]` (`queries.ts:168-172`) |

# GROQ Queries Reference

> [[../INDEX|← Back to Index]] · [[../architecture/02-sanity-cms|Sanity CMS]]

All queries defined in `src/sanity/lib/queries.ts` (Community 15).

## Profile Queries (Community 62)

```groq
// PROFILE_QUERY — main profile
*[_type == "profile"][0]{
  firstName, lastName, headline, bio,
  avatar { asset->{ url } },
  socialLinks, skills, ...
}

// Get profile with full bio
*[_type == "profile"][0]{
  ...,
  longBio,
  highlights
}
```

## Experience Queries (Community 65)

```groq
// EXPERIENCE_QUERY — all work experience (newest first)
*[_type == "experience"] | order(startDate desc){
  _id, company, role, startDate, endDate,
  current, description, tags, category
}

// Get current position
*[_type == "experience" && current == true][0]{
  company, role, startDate
}

// EXPERIENCE_BY_ID_QUERY — single experience (used by chat tool)
*[_type == "experience" && _id == $id][0]{ ... }
```

## Project Queries (Community 43)

```groq
// PROJECTS_QUERY — all projects
*[_type == "project"] | order(order asc){
  _id, title, slug, description, techStack,
  liveUrl, githubUrl, featured, category, coverImage
}

// Featured projects only
*[_type == "project" && featured == true] | order(order asc)

// PROJECT_BY_SLUG_QUERY — single project
*[_type == "project" && slug.current == $slug][0]{ ... }

// Get projects by category
*[_type == "project" && category == "ai-ml"]{ ... }
```

## Skills Queries (Community 42)

```groq
// SKILLS_QUERY — all skills
*[_type == "skill"] | order(order asc){
  _id, name, category, proficiency, icon, featured
}

// Featured skills only
*[_type == "skill" && featured == true] | order(order asc){ ... }

// Skills by category
*[_type == "skill" && category == "frontend"] | order(name asc){ ... }

// Group skills by category
{ "frontend": *[_type == "skill" && category == "frontend"], ... }
```

## Education Queries

```groq
// EDUCATION_QUERY — newest first
*[_type == "education"] | order(endDate desc){
  _id, institution, degree, field, startDate, endDate, description
}
```

## Certifications Queries (Community 63)

```groq
// CERTS_SECTION_QUERY — all certs
*[_type == "certification"] | order(issueDate desc){
  _id, name, issuer, issueDate, expiryDate, credentialId, credentialUrl
}

// Active certifications (not expired)
*[_type == "certification" && (expiryDate == null || expiryDate > now())]{ ... }
```

## Achievements Queries (Community 64)

```groq
// ACHIEVEMENTS_SECTION_QUERY — all achievements
*[_type == "achievement"] | order(date desc){
  _id, title, description, date, featured, icon
}

// Featured achievements
*[_type == "achievement" && featured == true] | order(date desc){ ... }
```

## Blog Queries (Community 38)

```groq
// BLOG_SECTION_QUERY — all posts
*[_type == "blog"] | order(publishedAt desc){
  _id, title, slug, publishedAt, excerpt, category, tags, featured, coverImage
}

// Get blog post by slug
*[_type == "blog" && slug.current == $slug][0]{
  ...,
  content   // portable text
}

// Featured posts
*[_type == "blog" && featured == true] | order(publishedAt desc){ ... }

// Posts by category
*[_type == "blog" && category == "tutorial"] | order(publishedAt desc){ ... }

// Posts by tag
*[_type == "blog" && "React" in tags] | order(publishedAt desc){ ... }
```

## Site Settings Query (Community 62)

```groq
// SITE_SETTINGS_QUERY
*[_type == "siteSettings"][0]{
  siteTitle, siteDescription, email, resumeUrl, socialLinks
}
```

## Navigation Query

```groq
// NAVIGATION_QUERY
*[_type == "navigation"][0]{
  items[]{ label, href, external }
}
```

## Contact Queries (Community 51)

```groq
// All contact submissions (newest first)
*[_type == "contact"] | order(submittedAt desc){ ... }

// Unread contacts
*[_type == "contact" && status == "new"] | order(submittedAt desc){ ... }

// High priority
*[_type == "contact" && priority == "high"] | order(submittedAt desc){ ... }
```

## Chat Catalog Query

```groq
// CHAT_CATALOG_QUERY — full data for Orby's system prompt
// Fetches profile + all experiences + all projects + skills + education + certs + achievements
{ "profile": *[_type == "profile"][0]{...}, "experience": *[_type=="experience"]{...}, ... }
```

## Complex / Combined Queries (Community 50)

```groq
// Homepage data (everything you need for a homepage)
{
  "profile": *[_type == "profile"][0]{...},
  "featuredProjects": *[_type == "project" && featured == true]{...},
  "skills": *[_type == "skill" && featured == true]{...}
}

// About page data
{ "profile": ..., "education": ..., "achievements": ... }

// Portfolio page data
{ "projects": ..., "experience": ..., "skills": ... }
```

## Count & Statistics (Community 61)

```groq
// Count all documents
count(*)

// Count documents by type
count(*[_type == "project"])

// Count with filter
count(*[_type == "blog" && featured == true])
```

## Pro Tips (Community 56)

```groq
// Use projections to minimize payload:
*[_type == "project"]{ title, slug, description }   // only what you need

// Get image with metadata:
*[_type == "project"]{ coverImage{ asset->{ url, metadata } } }

// Reference resolution with ->:
*[_type == "blog"][0]{ author->{ name, avatar } }

// Count references:
count(*[_type == "blog" && featured == true])
```

## See Also
- [[00-sanity-schemas|Sanity Schemas]]
- [[../architecture/02-sanity-cms|Sanity CMS Layer]]
