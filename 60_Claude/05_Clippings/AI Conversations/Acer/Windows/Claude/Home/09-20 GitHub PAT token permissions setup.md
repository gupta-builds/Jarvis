---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "GitHub PAT token permissions setup"
started_at: 2026-09-20T13:55:48
ended_at: 2026-09-20T14:24:24
exported_at: 2026-10-17T21:06:38
duration_minutes: 28.6
project: Home
cwd: 'C:\Users\anant'
session_id: 3d4d0510-69c5-44f5-9616-3237da5c9ba2
status: raw
turn_count: 2
tools_used: {}
tokens:
  input: 4
  output: 3600
  cache_creation: 31432
  cache_read: 84490
  total: 119526
cost_usd: 0.178634
model:
  - "claude-sonnet-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# GitHub PAT token permissions setup

## You

I am currently setting up a global github fine tuned token as a PAT token. It's going to be inside this .env file globally for all ai platforms to access. I am in the middle of giving permissions and i am cofused with what to provide to the ai permission to. Provide me a list of permissions that I should enable in chronological order that mentions read and write, read only.

## Claude

Here's a practical breakdown for a fine-grained PAT meant to be used by AI coding assistants (Claude Code, Codex, etc.) across your repos. I'm listing them in the order you'll typically encounter them in GitHub's token creation UI, under "Repository permissions."

**Mandatory / always on**
- **Metadata** — Read-only. GitHub forces this on for any fine-grained token; you can't disable it.

**Core, almost every AI coding tool needs these**
- **Contents** — Read and write. Lets the tool read files, clone, and push commits/branches.
- **Pull requests** — Read and write. Lets it open, update, comment on, and read PRs.
- **Issues** — Read and write. Lets it read, create, comment on, and close issues.

**Needed only if the tool touches CI or workflow files**
- **Workflows** — Read and write. Required specifically if the AI will ever edit files under `.github/workflows/`. Contents write alone will fail on workflow file pushes without this.
- **Actions** — Read-only is usually enough (viewing run status/logs). Only grant write if you want it to trigger, re-run, or cancel workflows.
- **Commit statuses / Checks** — Read-only unless the tool itself needs to report a status back (e.g., a custom check).

**Optional, situational**
- **Discussions** — Read and write, only if you use GitHub Discussions and want the AI to participate there.
- **Deployments / Environments / Pages** — Leave unset unless you specifically want the AI managing deploys or Pages builds; most coding assistants never need these.

**Never grant to an AI tool's token**
- **Secrets** (repo/environment/org) — no read or write. A token with this scope could exfiltrate every other secret in the repo.
- **Administration** — no access. This covers repo deletion, branch protection rules, collaborator management — too much blast radius for routine coding work.
- **Webhooks** — no access unless you're specifically automating webhook setup.

**Account permissions tab** (separate from repo permissions) — leave all of these unset for a coding-assistant token. None of them are needed for reading/writing repo content, and things like "Account: Read and write" or "Email addresses" only add exposure.

**Repository access scope**: prefer "Only select repositories" over "All repositories" so a leaked or misused token doesn't reach your entire account. Set an expiration (90 days is a reasonable default) rather than "No expiration."

So the minimal effective set for most AI coding use is: **Contents (R/W), Pull requests (R/W), Issues (R/W)**, plus **Workflows (R/W)** only if it'll edit `.github/workflows/`.

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
_None_


