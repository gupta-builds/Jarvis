---
type: input
input_kind: ai-conversation
source_app: claude-code
source_os: windows
title: "GitHub app installation and $100 credit setup"
started_at: 2026-09-26T13:21:26
ended_at: 2026-09-26T13:51:42
exported_at: 2026-10-17T21:06:39
duration_minutes: 30.3
project: Home
cwd: 'C:\Users\anant'
session_id: e27b39f0-1bed-44bd-8bd7-8d1814a91e8f
status: raw
turn_count: 14
tools_used:
  Bash: 1
  PowerShell: 3
  ToolSearch: 1
  WebFetch: 4
  WebSearch: 2
tokens:
  input: 54
  output: 19386
  cache_creation: 156377
  cache_read: 1659220
  total: 1835037
cost_usd: null
model:
  - "claude-opus-5-5"
files_touched: []
tags:
  - input
  - ai-conversation
  - claude-code
  - windows
---

# GitHub app installation and $100 credit setup

## You

I am facing some issues trying to install the github app [Image #1] [Image #2]. So, I ran the command - /install-github-app. To install the github app, for this procedure to take place, i had to login to github and install the gh cli. I have done everything required for this procedure to take place. In a new session I ran the command after doing everything that was required: ```

<pasted_content id="0fcc">

 ▐▛███▛█   Claude Code v2.1.283
▝▜██████▀  Opus 5.5 · Claude Pro
 ▝▝   ▝▝   C:\Users\anant

  Get to finished work sooner with Opus 5.5. Switch anytime with /model.

● agents-md: no CLAUDE.md found; AGENTS.md loaded: C:\Users\anant\AGENTS.md













▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔▔
   Install GitHub App
   Select GitHub repository

   > Enter repository

     Enter a repo as owner/repo or https://github.com/owner/repo…

   Enter to continue · Esc to cancel
</pasted_content id="0fcc">

```

What repo do i exactly as the owner repo? i have a readme that renders on my github all the time. Should I add that repo? I do not have a specific - "owner repo", what exactly does that even mean? What should i add over there? Use some gh cli commands to look through all the 15+ repos that I own, especially the readme one. Dig through some onfirmation on the installation to redeem the $100 credit [Image #4] - Cloud session credits
Applies automatically to cloud sessions. After it’s used or expires, your plan’s regular usage applies. I am doing so that on the new update i get the free $100 credit. What exactly can this credit be used for? This is the latest update that claude has launched. Go through your own research for the new update and tell me how exactly to proceed regarding everything over here to redeem the $100 for use. How to use it also explained, can this be used when i exceed over my limit? Is this for cloud, does that mean for api calls? Directly provided on anthropic api? I am unsure of what this means. Let's get this clear and do the work perfectly.

[image attached]

[image attached]

[image attached]

## You

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\C--Users-anant\[REDACTED]\images\1.png]

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\C--Users-anant\[REDACTED]\images\2.png]

[Image: source: C:\Users\anant\AppData\Local\Temp\claude\C--Users-anant\[REDACTED]\images\4.png]

## Claude

I'll start by checking your GitHub account and repos, then look into the credit.

Short version: you probably don't need `/install-github-app` for the $100 credit at all. That command does something else, which is why it's asking you for a repo.

## 1. What "owner/repo" means for you

Every GitHub repo is named `owner/repo`. You're logged into `gh` as **gupta-builds**, so the owner is `gupta-builds` and the repo is one of these 17:

| Repo | Visibility |
|---|---|
| `gupta-builds/gupta-builds` | Public. This is your profile README repo. |
| `gupta-builds/Jarvis`, `second-brain-claudekit`, `internship-research-loop`, `TradingView`, `Portfolio`, `Resq`, `opspilot`, `safereach`, `Arc`, `Resq-lovable` | Public |
| `gupta-builds/Obsidian-SecondBrain`, `assisto-website`, `boom-tracer`, `opspilot-lovable` | Private |
| `gupta-builds/CausalOps`, `boom` | Public forks |

**Don't use the README repo (`gupta-builds/gupta-builds`).** It's just a profile page, so Claude has nothing to work on there.

## 2. Why `/install-github-app` isn't what you want

The terminal command `/install-github-app` sets up a **GitHub Actions workflow** in one repo. It lets you tag `@claude` in issues and PRs, and it runs on the Actions runners. It is not how you get cloud sessions, and it has nothing to do with the credit. Press **Esc** to cancel it.

For cloud sessions, the thing that matters is the **Claude GitHub App** connection on the claude.ai page in your third screenshot. Your GitHub account already shows as connected. According to the docs, the app is only needed for three things: **pushing** changes, working in **private** repos, and PR **Auto-fix**. Cloud sessions can clone public repos without it.

## 3. Fixing the 404

You landed on `github.com/apps/claude/installations/new/permissions`. That page needs extra parameters, and it returns a 404 without them. I checked with `gh`: the app itself exists (`anthropics/claude`). So:

1. Open **https://github.com/apps/claude/installations/new** directly, without `/permissions` on the end.
2. Choose the **gupta-builds** account.
3. Pick **Only select repositories**, choose the repos you want Claude to work in (Jarvis or Obsidian-SecondBrain, for example), and install.
4. Back on claude.ai, use the **Check repository status** dropdown to confirm, e.g. `gupta-builds/Jarvis`.

**Alternative that skips the app:** run `/web-setup` in Claude Code. It sends your local `gh` token to your Claude account, and cloud sessions can then reach any repo that token can access. You'd still need the app for Auto-fix.

## 4. The $100 credit: what it is and how to use it

Anthropic took cloud sessions out of research preview on **Sept 23, 2026**. Existing subscribers got a one-time credit: **$100 on Pro**, $250 on Max.

- **Claiming:** run `/claim-credit` in Claude Code, or claim it from the page at claude.ai. The deadline is **Oct 7, 2026, 11:59pm PT**, and you need a linked GitHub account. Your 4th screenshot says "Applies automatically to cloud sessions", which suggests you've already claimed it. Running `/claim-credit` once more will confirm.
- **Expiry:** Nov 4, 2026, 11:59pm PT. Unused credit disappears after that.
- **What it pays for:** only Claude Code **cloud sessions**, meaning Claude running in an Anthropic-hosted VM instead of on your PC. You can start one from:
  - claude.ai/code in a browser
  - the Code tab in the Claude mobile app
  - "Cloud" in the desktop app
  - `claude --cloud "your task"` from inside a git repo
- **What it doesn't cover:** local Claude Code (like this session), regular claude.ai chat, Projects, Routines, and **the Anthropic API**. "Cloud" here means Anthropic's hosted sandbox, not API calls. The credit won't appear in the API Console and can't be spent with an API key.
- **Going past your limit:** yes, this is the main use. The credit is separate from your normal Pro limits. Anthropic's wording is "If you hit a limit locally, keep going in the cloud until your credit runs out." Once the credit is used up or expires, cloud sessions count against your normal plan limits again.

**Suggested flow:** when you hit your Pro limit locally, commit and push your work. Then run `claude --cloud "continue X"` from that repo, or start a session at claude.ai/code, and it will draw from the $100. Push first because the cloud VM clones from GitHub, not from your local folder. If the repo doesn't have the app installed, Claude Code uploads your local repo instead, but then the session can't push back unless your GitHub connection has access.

One caveat: two of the blogs I read disagreed on some details, so I relied on Anthropic's docs and BleepingComputer. Your claim page at claude.ai shows the terms for your own account and is the final word.

Sources:
- [Claude Code docs: Use Claude Code in the cloud](https://code.claude.com/docs/en/claude-code-on-the-web)
- [BleepingComputer: up to $250 in free Claude Code credits](https://www.bleepingcomputer.com/news/artificial-intelligence/[REDACTED]/)
- [ClaudeDevs on X announcement](https://x.com/ClaudeDevs/status/2102871550974427462)
- [MadRobot: How to claim](https://madrobot.blog/2026/09/24/claude-code-cloud-sessions-free-credit-how-to-claim/)
- [SmartScope: Cloud sessions credit](https://smartscope.blog/en/blog/[REDACTED]/)

### Tool Calls

- `PowerShell` -- `{"command":"gh auth status; gh repo list --limit 100 --json nameWithOwner,visibility,isFork,updatedAt,description | ConvertFrom-Json | Format-Table nameWithOwner,visibility,isFork,updatedAt -AutoSize | Out-String -Width 200","description":"Check gh login and list owned repos"}`
- `ToolSearch` -- `{"query":"select:WebSearch,WebFetch","max_results":2}`
- `WebSearch` -- `{"query":"Claude Code cloud session credits $100 Pro"}`
- `PowerShell` -- `{"command":"gh api /user/installations --jq \u0027.installations[] | {app_slug, account: .account.login, repository_selection}\u0027; gh api repos/gupta-builds/gupta-builds --jq \u0027{default_branch, size, description}\u0027","description":"Check installed GitHub Apps and profile README repo"}`
- `WebFetch` -- `{"url":"https://www.bleepingcomputer.com/news/artificial-intelligence/[REDACTED]/","prompt":"Extract every concrete fact about the credit: eligibility, how to claim, deadlines, expiry, what it covers and excludes, whether it applies to API, whether it applies after hitting usage limits, GitHub requirements."}`
- `WebFetch` -- `{"url":"https://smartscope.blog/en/blog/[REDACTED]/","prompt":"Extract every concrete fact about the credit: eligibility, claim steps, deadlines, expiry, coverage/exclusions, API applicability, behavior when usage limits are exceeded, GitHub app requirements, cost per session."}`
- `PowerShell` -- `{"command":"gh api /apps/claude --jq \u0027{slug, name, html_url, owner: .owner.login}\u0027","description":"Look up the Claude GitHub App"}`
- `WebFetch` -- `{"url":"https://code.claude.com/docs/en/claude-code-on-the-web","prompt":"Summarize: GitHub app requirements and how to install, how cloud sessions are started (web, CLI --remote, teleport), credits/promotional credit info, usage limits, and anything about /install-github-app or claim-credit."}`
- `WebFetch` -- `{"url":"https://madrobot.blog/2026/09/24/claude-code-cloud-sessions-free-credit-how-to-claim/","prompt":"Extract exact claim steps, claim URL/command, what the credit covers and excludes, API applicability, what happens after local limits hit."}`

## You

1. Open https://github.com/apps/claude/installations/new directly, without /permissions on the end. - still 404

## Claude

I tested the URL from here. **The link is valid.** Opened anonymously, `github.com/apps/claude/installations/new` redirects to GitHub's login page as it should, and `github.com/apps/claude` loads normally (HTTP 200). So the 404 comes from something in your logged-in browser session, not from a broken link. I couldn't find a known bug that matches this exactly. Try these in order:

**1. Check whether the app is already installed.** Open **https://github.com/settings/installations**. If "Claude" is listed there, the app is already installed and GitHub won't show a "new install" page. Click **Configure** next to it and add the repos you want. I can't check this from here, because your `gh` token type isn't allowed to list app installations.

**2. Start from the app's public page.** Open **https://github.com/apps/claude** and click the green **Install** (or **Configure**) button there. Don't paste the deeper URL.

**3. Try a private window.** Open a private or incognito window, log in as `gupta-builds`, and repeat step 2. Your toolbar has a VPN and several extensions, and any of those can interfere with GitHub's pages. If it works in private mode, one of them is the cause.

**4. Check that your email is verified.** Go to https://github.com/settings/emails. GitHub restricts some actions for accounts whose email isn't verified. I'm not certain this causes a 404 specifically, but it only takes a moment to check.

**If none of that works, skip the app.** Run `/web-setup` in Claude Code. It connects cloud sessions using your existing `gh` login, so they can clone and push to all 17 of your repos, private ones included. The $100 credit works the same way either way. The only thing you'd lose without the app is PR Auto-fix.

After you check step 1, tell me what `github.com/settings/installations` shows and I'll help from there.

Sources:
- [Claude Code docs: Use Claude Code in the cloud](https://code.claude.com/docs/en/claude-code-on-the-web)
- [anthropics/claude-code #94046: repo access not detected after reinstall](https://github.com/anthropics/claude-code/issues/94046)
- [anthropics/claude-code #3031: Cannot install Claude GitHub App](https://github.com/anthropics/claude-code/issues/3031)

### Tool Calls

- `Bash` -- `for u in https://github.com/apps/claude https://github.com/apps/claude/installations/new https://github.com/apps/claude/installations/select_target; do echo "$u -> $(curl -s -o /dev/null -w '%{http_code} %{redirect_url}' "$u")"; done; gh api /apps/claude --jq '{id, slug, installations_count, events: (.events|length)}'`
```
Exit code 1
https://github.com/apps/claude -> 200 
https://github.com/apps/claude/installations/new -> 302 https://github.com/login?integration=claude&return_to=%2Fapps%2Fclaude%2Finstallations%2Fnew
https://github.com/apps/claude/installations/select_target -> 302 https://github.com/login?integration=claude&return_to=%2Fapps%2Fclaude%2Finstallations%2Fselect_target
invalid API endpoint: "C:/Program Files/Git/apps/claude". Your shell might be rewriting URL paths as filesystem paths. To avoid this, omit the leading slash from the endpoint argument
```
- `WebSearch` -- `{"query":"github.com/apps/claude/installations/new 404 Claude GitHub App install"}`

## You

Open https://github.com/apps/claude and click the green Install (or Configure) button there. Don't paste the deeper URL. - returned 404 on clickiding install

## Claude

That's useful to know. The public page loads, but GitHub returns a 404 when your logged-in account clicks Install. That rules out a bad link. The cause is tied to your account or your browser. I can't check any further from here, because your `gh` token isn't allowed to see app installations. These two checks should find it:

**1. See whether Claude is already installed (most likely cause).** Open **https://github.com/settings/installations**.
- If **Claude** is listed, the app is already installed, possibly from an earlier attempt. That can make the "new install" page fail. Click **Configure** and choose which repos it can access. That's all you need to do.
- If the list is empty or Claude isn't there, go to check 2.

**2. Try without your extensions.** Open an incognito/private window, sign in to GitHub as `gupta-builds`, go to `github.com/apps/claude`, and click Install. If it works there, one of your extensions or the VPN is blocking it.

**If both fail, don't spend more time on the app.** Type `/web-setup` in Claude Code. It connects cloud sessions to GitHub through your existing `gh` login, and I confirmed that login can reach all 17 of your repos, private ones included. You can clone, push, and spend the $100 credit without the app. The only thing you lose is PR Auto-fix. You can also report the 404 with the "Report a GitHub connection issue" link at the bottom of your claude.ai GitHub page.

What does `github.com/settings/installations` show?

## You

Ain't no way, a 404 on the install again

## Claude

That's frustrating. Stop fighting the app for now, because you don't need it to use the $100 credit.

**Do this instead.** In any Claude Code session, type:

```
/web-setup
```

This sends your `gh` login token to your Claude account, and cloud sessions use it to reach GitHub. I confirmed earlier that this login is `gupta-builds` and has `repo` access, which covers all 17 repos, private ones included. You have to run it yourself because I can't trigger slash commands.

**Then test it.** Run `claude --cloud "say hi and list the files"` from a local clone of one of your repos, or start a session at claude.ai/code and pick a repo. Your "Cloud session credits" card should start going down.

**Losing the app costs you only one thing:** PR Auto-fix, where Claude automatically responds to CI failures and review comments. Cloning, pushing, private repos, and the credit all work through `/web-setup`.

**Tracking down the 404 later (optional):**
- If `github.com/settings/installations` *also* gave you a 404, the problem is your GitHub account, not the Claude app. Check https://github.com/settings/emails for an unverified email, and make sure the avatar in the top right really is `gupta-builds`.
- Report it with **"Report a GitHub connection issue"** at the bottom of your claude.ai GitHub page. Include the exact URL and say it also returns 404 in incognito.

Tell me what `/web-setup` shows and I'll walk you through the first cloud session.

## You

<local-command-caveat>Caveat: The messages below were generated by the user while running local commands. DO NOT respond to these messages or otherwise consider them in your response unless the user explicitly asks you to.</local-command-caveat>

## You

<command-name>/web-setup</command-name>
            <command-message>web-setup</command-message>
            <command-args></command-args>

## You

<local-command-stdout>Connected as gupta-builds. Opened https://claude.ai/code</local-command-stdout>

## You

Yea still 404

## Claude

`/web-setup` worked. It says **"Connected as gupta-builds"**, so cloud sessions can now reach your repos, and the app's 404 doesn't block you anymore. You can drop the app entirely and nothing you need is lost.

**Here's what you have now:**

| Feature | Works? |
|---|---|
| Cloud sessions on any of your 17 repos, public and private | Yes |
| Cloning, pushing branches, opening PRs | Yes |
| The $100 credit | Yes, it applies automatically to cloud sessions |
| PR Auto-fix | No, it needs the app |
| Claude Projects (the multi-session coordinator) | No, it needs the app on each repo. The credit doesn't cover Projects anyway. |

**Next step: run a first cloud session.** The claude.ai/code tab that just opened is where you start. Pick a repo (Jarvis, say), give it a small task, and send it. Or, from the terminal inside a local clone of that repo:

```
claude --cloud "Read the README and summarize what this repo does"
```

Afterward, look at your **Cloud session credits** card. The balance should have dropped slightly below $100. That confirms the credit is being used and not your Pro limit.

**About the 404:** I've ruled out the link itself, so the problem sits on GitHub's side for your account. Use **"Report a GitHub connection issue"** at the bottom of the claude.ai GitHub page. Include the URL `github.com/apps/claude/installations/new`, say it returns 404 even in incognito, and mention that `/web-setup` works. You only need this fixed if you want Auto-fix later.

I can also start that test cloud session for you from here if you tell me which repo. Keep in mind it would use a little of the credit.

## Actions Taken

**Files created:**
_None_

**Files modified:**
_None_

**Files deleted (heuristic, from Bash commands):**
_None detected_

**Commands run:**
- `for u in https://github.com/apps/claude https://github.com/apps/claude/installations/new https://github.com/apps/claude/installations/select_target; do echo "$u -> $(curl -s -o /dev/null -w '%{http_code} %{redirect_url}' "$u")"; done; gh api /apps/claude --jq '{id, slug, installations_count, events: (.events|length)}'`


