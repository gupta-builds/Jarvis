#!/usr/bin/env node
// web.mjs - one command for reading and searching the web from an agent shell.
//
//   node web.mjs read   <url>   [options]    page -> clean markdown (Jina Reader, Firecrawl fallback)
//   node web.mjs search <query> [options]    web search -> titles, urls, snippets (Jina, Firecrawl fallback)
//   node web.mjs map    <url>   [options]    list URLs on a site (Firecrawl only)
//   node web.mjs credits                     Firecrawl credits left
//   node web.mjs status                      which keys are set and whether they work (never prints a key)
//
// Why a script and not an MCP server: an MCP server puts its tool schemas and
// instructions into every session. This file costs zero context until it is run,
// and it prints a capped result (a few thousand tokens), not a whole page.
//
// Engines
//   jina       r.jina.ai (read) and s.jina.ai (search). Primary. Key: JINA_API_KEY.
//              Reading works without a key at a low rate limit; search needs the key.
//   firecrawl  api.firecrawl.dev/v2. Fallback for pages Jina cannot render or is
//              blocked on, and when Jina is out of quota. Key: FIRECRAWL_API_KEY.
//   auto       (default) Jina first, then Firecrawl when Jina fails in a way Firecrawl
//              could fix (quota, rate limit, 5xx, network, bot wall, empty page).
//              A real 404 is reported as is and never retried.
//
// Keys are read from the environment only. They are sent in an Authorization header
// to the engine's own host and are never printed, logged or written to a file.
// Windows: set with sync-mcp.ps1 -SetSecret NAME (also shares it to WSL via WSLENV).
//
// Output: a one-line header, then the content. Content over --max-chars is cut at a
// paragraph boundary and the full text is saved under the OS temp folder (web-out),
// with the path printed, so it can be read in pieces without refetching. Saved files
// older than 3 days are removed on the next run.
//
// Exit codes: 0 ok, 1 fetch failed, 2 bad usage or refused URL, 3 required key missing.
// Needs Node 18+ (global fetch). No dependencies.

import { mkdirSync, writeFileSync, readdirSync, statSync, unlinkSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join, resolve, dirname } from 'node:path';
import { createHash } from 'node:crypto';

const JINA_READ = 'https://r.jina.ai/';
const JINA_SEARCH = 'https://s.jina.ai/';
const FC_BASE = 'https://api.firecrawl.dev/v2';
const UA = 'web.mjs/1.0';

const DEFAULTS = {
  engine: 'auto',
  maxChars: 12000, // printed characters (about 3,000 tokens)
  maxTokens: 30000, // Jina server-side guardrail so one huge page cannot drain the quota
  timeout: 60, // seconds
  links: 'text',
  images: 'none',
  limit: 5,
};

class Fail extends Error {
  constructor(message, code = 1) {
    super(message);
    this.code = code;
  }
}

const note = (m) => console.error(`web: ${m}`);
const clip = (s, n) => (s.length > n ? s.slice(0, n - 3) + '...' : s);
const oneLine = (s) => String(s ?? '').replace(/\s+/g, ' ').trim();

// ---------- keys ----------
function readKey(name) {
  const v = (process.env[name] || '').trim();
  if (!v) return '';
  // Header values must be visible ASCII. A stray quote, space or newline from a bad paste
  // would make fetch throw, so treat it as unusable without ever echoing the value.
  if (!/^[\x21-\x7e]+$/.test(v)) {
    note(`${name} contains characters that are not valid in a header; ignoring it. Re-set it with sync-mcp.ps1 -SetSecret ${name}.`);
    return '';
  }
  return v;
}

// ---------- args ----------
const STRING_OPTS = new Set(['engine', 'selector', 'wait', 'wait-ms', 'timeout', 'max-chars', 'max-tokens', 'links', 'images', 'out', 'site', 'limit', 'search']);
const BOOL_OPTS = new Set(['js', 'full', 'fresh', 'content', 'help']);

function parseArgs(argv) {
  const pos = [];
  const raw = { site: [] };
  for (let i = 0; i < argv.length; i++) {
    const a = argv[i];
    if (a === '--') {
      pos.push(...argv.slice(i + 1));
      break;
    }
    if (!a.startsWith('--')) {
      pos.push(a);
      continue;
    }
    const eq = a.indexOf('=');
    const key = eq === -1 ? a.slice(2) : a.slice(2, eq);
    if (BOOL_OPTS.has(key)) {
      if (eq !== -1) throw new Fail(`--${key} takes no value`, 2);
      raw[key] = true;
    } else if (STRING_OPTS.has(key)) {
      let val;
      if (eq !== -1) val = a.slice(eq + 1);
      else {
        if (i + 1 >= argv.length) throw new Fail(`--${key} needs a value`, 2);
        val = argv[++i];
      }
      if (key === 'site') raw.site.push(val);
      else raw[key] = val;
    } else {
      throw new Fail(`unknown option --${key} (run: node web.mjs --help)`, 2);
    }
  }
  return { pos, raw };
}

function toInt(name, v, min, max) {
  if (!/^\d+$/.test(String(v))) throw new Fail(`--${name} must be a whole number`, 2);
  const n = Number(v);
  if (n < min || n > max) throw new Fail(`--${name} must be between ${min} and ${max}`, 2);
  return n;
}

function buildOptions(raw) {
  const o = { ...DEFAULTS };
  if (raw.engine !== undefined) {
    if (!['auto', 'jina', 'firecrawl'].includes(raw.engine)) throw new Fail('--engine must be auto, jina or firecrawl', 2);
    o.engine = raw.engine;
  }
  if (raw.links !== undefined) {
    if (!['text', 'all', 'summary'].includes(raw.links)) throw new Fail('--links must be text, all or summary', 2);
    o.links = raw.links;
  }
  if (raw.images !== undefined) {
    if (!['none', 'alt', 'all'].includes(raw.images)) throw new Fail('--images must be none, alt or all', 2);
    o.images = raw.images;
  }
  if (raw['max-chars'] !== undefined) o.maxChars = toInt('max-chars', raw['max-chars'], 500, 400000);
  if (raw['max-tokens'] !== undefined) o.maxTokens = toInt('max-tokens', raw['max-tokens'], 500, 500000);
  if (raw.timeout !== undefined) o.timeout = toInt('timeout', raw.timeout, 5, 180);
  o.limitSet = raw.limit !== undefined;
  if (o.limitSet) o.limit = toInt('limit', raw.limit, 1, 100);
  if (raw['wait-ms'] !== undefined) o.waitMs = toInt('wait-ms', raw['wait-ms'], 0, 30000);
  o.js = !!raw.js;
  o.full = !!raw.full;
  o.fresh = !!raw.fresh;
  o.content = !!raw.content;
  o.selector = raw.selector || '';
  o.wait = raw.wait || '';
  o.out = raw.out || '';
  o.site = raw.site || [];
  o.search = raw.search || '';
  return o;
}

// ---------- url guard ----------
// Third-party readers cannot reach private addresses, and sending an internal or
// credential-bearing URL to them would leak it, so refuse before any request.
function checkUrl(input) {
  let u;
  try {
    u = new URL(input);
  } catch {
    throw new Fail(`not a valid URL: ${clip(input, 120)}`, 2);
  }
  if (u.protocol !== 'http:' && u.protocol !== 'https:') throw new Fail('only http and https URLs are supported', 2);
  if (u.username || u.password) throw new Fail('refusing a URL that carries a username or password', 2);
  const h = u.hostname.toLowerCase().replace(/^\[|\]$/g, '');
  const isIPv4 = /^\d{1,3}(\.\d{1,3}){3}$/.test(h);
  const isIPv6 = h.includes(':');
  const privateHost =
    h === 'localhost' ||
    h.endsWith('.localhost') ||
    h.endsWith('.local') ||
    h.endsWith('.internal') ||
    h.endsWith('.lan') ||
    (!isIPv4 && !isIPv6 && !h.includes('.')) || // single-label names such as "intranet"
    (isIPv4 && /^(127\.|10\.|0\.|169\.254\.|192\.168\.|172\.(1[6-9]|2\d|3[01])\.)/.test(h)) ||
    (isIPv6 && (h === '::1' || h === '::' || /^(fc|fd|fe80|::ffff:)/.test(h)));
  if (privateHost) throw new Fail('refusing a local or private address; web readers cannot reach it and it should not be sent to a third party', 2);
  return u.href;
}

// ---------- http ----------
async function http(url, { method = 'GET', headers = {}, body, timeoutMs }) {
  const signal = AbortSignal.timeout(timeoutMs);
  try {
    const res = await fetch(url, { method, headers: { 'User-Agent': UA, ...headers }, body, signal, redirect: 'follow' });
    const text = await res.text();
    let json = null;
    try {
      json = JSON.parse(text);
    } catch {
      /* not json */
    }
    return { status: res.status, headers: res.headers, text, json };
  } catch (e) {
    const timedOut = e && (e.name === 'TimeoutError' || e.name === 'AbortError');
    return { status: 0, netError: timedOut ? 'timeout' : oneLine((e && e.cause && e.cause.code) || (e && e.message) || 'network error') };
  }
}

const apiMessage = (r) => clip(oneLine(r.json?.readableMessage || r.json?.message || r.json?.error || r.text || ''), 160);

// ---------- markdown shaping (used for Firecrawl output; Jina shapes server-side) ----------
const IMG_RE = /!\[([^\]]*)\]\((?:[^()\s]|\([^()]*\))*(?:\s+"[^"]*")?\)/g;
const LINK_RE = /\[([^\]]*)\]\(((?:[^()\s]|\([^()]*\))*)(?:\s+"[^"]*")?\)/g;

function shapeMarkdown(md, o) {
  let out = md;
  if (o.images !== 'all') out = out.replace(IMG_RE, (m, alt) => (o.images === 'alt' ? alt : ''));
  if (o.links === 'all') return out;
  const seen = new Map();
  out = out.replace(LINK_RE, (m, text, url) => {
    if (o.links === 'summary' && /^https?:\/\//i.test(url) && !seen.has(url)) seen.set(url, text);
    return text;
  });
  if (o.links === 'summary' && seen.size) {
    const lines = [...seen].slice(0, 100).map(([url, text]) => `- ${clip(oneLine(text) || 'link', 60)}: ${url}`);
    out += `\n\n## Links\n${lines.join('\n')}`;
  }
  return out;
}

// ---------- Jina: read ----------
const BOT_WALL = /just a moment|enable javascript and cookies|verify you are (a )?human|attention required|access denied|are you a robot|captcha|checking your browser|pardon our interruption/i;

async function jinaRead(url, o) {
  const key = readKey('JINA_API_KEY');
  const headers = {
    'Content-Type': 'application/json',
    Accept: 'application/json',
    'X-Retain-Images': o.images,
    'X-Retain-Links': o.links === 'all' ? 'all' : 'text',
    'X-Max-Tokens': String(o.maxTokens),
  };
  if (key) headers.Authorization = `Bearer ${key}`;
  if (o.links === 'summary') headers['X-With-Links-Summary'] = 'true';
  if (o.full) headers['X-Respond-With'] = 'markdown';
  if (o.selector) headers['X-Target-Selector'] = o.selector;
  if (o.wait) headers['X-Wait-For-Selector'] = o.wait;
  if (o.js) {
    headers['X-Engine'] = 'browser';
    headers['X-Timeout'] = String(Math.min(o.timeout, 60));
  }
  if (o.fresh) headers['X-No-Cache'] = 'true';

  const r = await http(JINA_READ, { method: 'POST', headers, body: JSON.stringify({ url }), timeoutMs: (o.timeout + 15) * 1000 });
  const fail = (reason, retryable) => ({ ok: false, engine: 'jina', reason, retryable });

  if (r.status === 0) return fail(`network: ${r.netError}`, true);
  if (r.status === 401) return fail(key ? 'key rejected (401)' : 'authentication required (401)', true);
  if (r.status === 402) return fail('token balance exhausted (402)', true);
  if (r.status === 403) return fail(key ? `blocked (403): ${apiMessage(r)}` : 'anonymous access blocked for this domain (403); set JINA_API_KEY', true);
  if (r.status === 422) return fail(`cannot fetch: ${apiMessage(r)}`, false);
  if (r.status === 429) return fail('rate limited (429)', true);
  if (r.status >= 500) return fail(`server error (${r.status})`, true);
  if (r.status !== 200 || !r.json || !r.json.data) return fail(`unexpected response (${r.status}): ${apiMessage(r)}`, r.status === 200);

  const d = r.json.data;
  const upstream = Number(d.httpStatus) || 200;
  if (upstream === 404 || upstream === 410) return fail(`page not found (HTTP ${upstream})`, false);
  if (upstream >= 400) return fail(`page returned HTTP ${upstream}`, true);

  const content = String(d.content ?? '').trim();
  if (content.length < 50) return fail('page came back empty (likely needs JavaScript or is blocked)', true);
  if (content.length < 2500 && BOT_WALL.test(content)) return fail('bot-protection page instead of content', true);

  const tokens = Number(d.usage?.tokens ?? r.headers.get('x-usage-tokens')) || 0;
  const remaining = r.headers.get('x-ratelimit-remaining');
  return { ok: true, engine: 'jina', url: d.finalUrl || d.url || url, title: oneLine(d.title), content, tokens, rateRemaining: remaining === null ? null : Number(remaining) };
}

// ---------- Firecrawl ----------
function fcHeaders(key) {
  return { 'Content-Type': 'application/json', Authorization: `Bearer ${key}` };
}

function fcStatusReason(r) {
  if (r.status === 0) return `network: ${r.netError}`;
  if (r.status === 401) return 'key rejected (401)';
  if (r.status === 402) return 'credits exhausted (402)';
  if (r.status === 408) return 'timed out (408)';
  if (r.status === 429) return 'rate limited (429)';
  if (r.status >= 500) return `server error (${r.status})`;
  return `HTTP ${r.status}: ${apiMessage(r)}`;
}

async function fcScrape(url, o) {
  const key = readKey('FIRECRAWL_API_KEY');
  if (!key) return { ok: false, engine: 'firecrawl', reason: 'FIRECRAWL_API_KEY not set', missingKey: true };
  const body = { url, formats: ['markdown'], onlyMainContent: !o.full, timeout: o.timeout * 1000 };
  if (o.fresh) body.maxAge = 0;
  if (o.selector) body.includeTags = [o.selector];
  if (o.waitMs) body.waitFor = o.waitMs;
  const r = await http(`${FC_BASE}/scrape`, { method: 'POST', headers: fcHeaders(key), body: JSON.stringify(body), timeoutMs: (o.timeout + 20) * 1000 });
  const fail = (reason) => ({ ok: false, engine: 'firecrawl', reason });
  if (r.status !== 200 || !r.json || r.json.success === false) return fail(fcStatusReason(r));
  const d = r.json.data || {};
  const code = Number(d.metadata?.statusCode) || 200;
  if (code === 404 || code === 410) return fail(`page not found (HTTP ${code})`);
  if (code >= 400) return fail(`page returned HTTP ${code}`);
  const md = String(d.markdown ?? '').trim();
  if (!md) return fail('page came back empty');
  return { ok: true, engine: 'firecrawl', url: d.metadata?.sourceURL || d.metadata?.url || url, title: oneLine(d.metadata?.title), content: shapeMarkdown(md, o), tokens: 0, rateRemaining: null };
}

// ---------- output ----------
function tidy(text) {
  return text.replace(/\r\n/g, '\n').replace(/[ \t]+\n/g, '\n').replace(/\n{3,}/g, '\n\n').trim();
}

function cutAtBoundary(text, limit) {
  if (text.length <= limit) return text;
  const slice = text.slice(0, limit);
  const nl = slice.lastIndexOf('\n');
  return (nl > limit * 0.7 ? slice.slice(0, nl) : slice).trimEnd();
}

function saveFull(text, label, explicitPath) {
  if (explicitPath) {
    const p = resolve(explicitPath);
    mkdirSync(dirname(p), { recursive: true });
    writeFileSync(p, text + '\n', 'utf8');
    return p;
  }
  const dir = join(tmpdir(), 'web-out');
  mkdirSync(dir, { recursive: true });
  try {
    const cutoff = Date.now() - 3 * 24 * 3600 * 1000;
    for (const f of readdirSync(dir)) {
      if (!f.endsWith('.md')) continue;
      const fp = join(dir, f);
      if (statSync(fp).mtimeMs < cutoff) unlinkSync(fp);
    }
  } catch {
    /* cleanup is best effort */
  }
  const slug = label.replace(/^https?:\/\//i, '').replace(/[^A-Za-z0-9]+/g, '-').replace(/^-|-$/g, '').slice(0, 50) || 'page';
  const hash = createHash('sha1').update(label + text.length).digest('hex').slice(0, 8);
  const p = join(dir, `${slug}-${hash}.md`);
  writeFileSync(p, text + '\n', 'utf8');
  return p;
}

function emit(headerBits, bodyRaw, o, label) {
  const body = tidy(bodyRaw);
  let savedTo = '';
  if (o.out) savedTo = saveFull(body, label, o.out);
  const shown = cutAtBoundary(body, o.maxChars);
  const truncated = shown.length < body.length;
  if (truncated && !savedTo) savedTo = saveFull(body, label, '');
  const lines = [`[${headerBits.filter(Boolean).join(' | ')}]`, '', shown];
  if (truncated) lines.push('', `[truncated: showing ${shown.length} of ${body.length} chars. Full text: ${savedTo} (read it in pieces with offset and limit, or search it with rg)]`);
  else if (savedTo) lines.push('', `[full text saved to ${savedTo}]`);
  process.stdout.write(lines.join('\n') + '\n');
}

// ---------- commands ----------
async function cmdRead(urlArg, o) {
  const url = checkUrl(urlArg);
  const problems = [];
  let result = null;

  if (o.engine !== 'firecrawl') {
    if (!readKey('JINA_API_KEY')) note('JINA_API_KEY is not set in this process: using anonymous Jina (low rate limit, some domains blocked). Set it with sync-mcp.ps1 -SetSecret JINA_API_KEY, then restart the terminal.');
    const r = await jinaRead(url, o);
    if (r.ok) result = r;
    else {
      problems.push(`jina: ${r.reason}`);
      if (!r.retryable) throw new Fail(`read failed for ${url}\n  ${problems.join('\n  ')}`, 1);
      if (o.engine === 'jina') throw new Fail(`read failed for ${url}\n  ${problems.join('\n  ')}`, 1);
      note(`jina failed (${r.reason}); trying firecrawl`);
    }
  }
  if (!result) {
    const r = await fcScrape(url, o);
    if (r.ok) result = r;
    else {
      problems.push(`firecrawl: ${r.reason}`);
      throw new Fail(`read failed for ${url}\n  ${problems.join('\n  ')}`, r.missingKey && o.engine === 'firecrawl' ? 3 : 1);
    }
  }
  const bits = [result.engine, result.url, result.title ? `"${clip(result.title, 80)}"` : '', result.tokens ? `${result.tokens} tokens` : ''];
  if (result.rateRemaining !== null && result.rateRemaining <= 3) bits.push(`rate limit nearly used (${result.rateRemaining} left this minute)`);
  emit(bits, result.content, o, result.url);
}

async function jinaSearch(query, o) {
  const key = readKey('JINA_API_KEY');
  if (!key) return { ok: false, engine: 'jina', reason: 'JINA_API_KEY not set (search needs a key)', missingKey: true };
  const headers = { Authorization: `Bearer ${key}`, Accept: 'application/json', 'X-Retain-Images': 'none' };
  if (!o.content) headers['X-Respond-With'] = 'no-content';
  let url = `${JINA_SEARCH}?q=${encodeURIComponent(query)}`;
  for (const s of o.site) url += `&site=${encodeURIComponent(s)}`;
  const r = await http(url, { headers, timeoutMs: (o.timeout + 15) * 1000 });
  const fail = (reason) => ({ ok: false, engine: 'jina', reason });
  if (r.status === 0) return fail(`network: ${r.netError}`);
  if (r.status === 401) return fail('key rejected (401)');
  if (r.status === 402) return fail('token balance exhausted (402)');
  if (r.status === 429) return fail('rate limited (429)');
  if (r.status >= 500) return fail(`server error (${r.status})`);
  if (r.status !== 200 || !r.json || !Array.isArray(r.json.data)) return fail(`unexpected response (${r.status}): ${apiMessage(r)}`);
  const items = r.json.data.map((x) => ({ title: oneLine(x.title), url: String(x.url || ''), snippet: oneLine(x.description), content: o.content ? String(x.content || '') : '' }));
  return { ok: true, engine: 'jina', items };
}

async function fcSearch(query, o) {
  const key = readKey('FIRECRAWL_API_KEY');
  if (!key) return { ok: false, engine: 'firecrawl', reason: 'FIRECRAWL_API_KEY not set', missingKey: true };
  const body = { query, limit: o.limit };
  if (o.site.length) body.includeDomains = o.site;
  if (o.content) body.scrapeOptions = { formats: ['markdown'], onlyMainContent: true };
  const r = await http(`${FC_BASE}/search`, { method: 'POST', headers: fcHeaders(key), body: JSON.stringify(body), timeoutMs: (o.timeout + 20) * 1000 });
  const fail = (reason) => ({ ok: false, engine: 'firecrawl', reason });
  if (r.status !== 200 || !r.json || r.json.success === false) return fail(fcStatusReason(r));
  const web = r.json.data?.web;
  if (!Array.isArray(web)) return fail('unexpected response shape');
  const items = web.map((x) => ({ title: oneLine(x.title), url: String(x.url || ''), snippet: oneLine(x.description), content: o.content ? shapeMarkdown(String(x.markdown || ''), o) : '' }));
  return { ok: true, engine: 'firecrawl', items };
}

async function cmdSearch(query, o) {
  if (!query.trim()) throw new Fail('search needs a query', 2);
  const problems = [];
  let result = null;
  if (o.engine !== 'firecrawl') {
    const r = await jinaSearch(query, o);
    if (r.ok) result = r;
    else {
      problems.push(`jina: ${r.reason}`);
      if (o.engine === 'jina') throw new Fail(`search failed\n  ${problems.join('\n  ')}`, r.missingKey ? 3 : 1);
      note(`jina search unavailable (${r.reason}); trying firecrawl`);
    }
  }
  if (!result) {
    const r = await fcSearch(query, o);
    if (r.ok) result = r;
    else {
      problems.push(`firecrawl: ${r.reason}`);
      throw new Fail(`search failed\n  ${problems.join('\n  ')}`, r.missingKey && o.engine === 'firecrawl' ? 3 : 1);
    }
  }
  const items = result.items.slice(0, o.limit);
  if (!items.length) {
    process.stdout.write(`[${result.engine} | search "${clip(query, 80)}" | 0 results]\n`);
    return;
  }
  const perItem = o.content ? 1500 : 300;
  const blocks = items.map((x, i) => {
    const lines = [`${i + 1}. ${x.title || '(no title)'}`, `   ${x.url}`];
    if (x.snippet) lines.push(`   ${clip(x.snippet, 300)}`);
    if (x.content) lines.push('', clip(tidy(x.content), perItem));
    return lines.join('\n');
  });
  emit([result.engine, `search "${clip(query, 80)}"`, `${items.length} results`], blocks.join('\n\n'), o, `search-${query}`);
}

async function cmdMap(urlArg, o) {
  const url = checkUrl(urlArg);
  const key = readKey('FIRECRAWL_API_KEY');
  if (!key) throw new Fail('map uses Firecrawl and FIRECRAWL_API_KEY is not set', 3);
  const body = { url, limit: o.limitSet ? o.limit : 50 };
  if (o.search) body.search = o.search;
  const r = await http(`${FC_BASE}/map`, { method: 'POST', headers: fcHeaders(key), body: JSON.stringify(body), timeoutMs: (o.timeout + 20) * 1000 });
  if (r.status !== 200 || !r.json || r.json.success === false || !Array.isArray(r.json.links)) throw new Fail(`map failed: ${fcStatusReason(r)}`, 1);
  const lines = r.json.links.map((l) => (l.title ? `${l.url}  (${clip(oneLine(l.title), 60)})` : l.url));
  emit(['firecrawl', `map ${url}`, `${lines.length} urls`], lines.join('\n'), o, `map-${url}`);
}

async function cmdCredits() {
  const key = readKey('FIRECRAWL_API_KEY');
  if (!key) throw new Fail('FIRECRAWL_API_KEY is not set', 3);
  const r = await http(`${FC_BASE}/team/credit-usage`, { headers: fcHeaders(key), timeoutMs: 30000 });
  if (r.status !== 200 || !r.json || !r.json.data) throw new Fail(`credit check failed: ${fcStatusReason(r)}`, 1);
  const d = r.json.data;
  const end = d.billingPeriodEnd ? ` | period ends ${String(d.billingPeriodEnd).slice(0, 10)}` : '';
  process.stdout.write(`firecrawl credits: ${d.remainingCredits} remaining of ${d.planCredits} plan credits${end}\n`);
}

async function cmdStatus() {
  const out = [];
  const jk = readKey('JINA_API_KEY');
  out.push(`JINA_API_KEY: ${jk ? 'set' : 'NOT set in this process'}`);
  const r = await http(JINA_READ, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json', Accept: 'application/json', 'X-Retain-Images': 'none', ...(jk ? { Authorization: `Bearer ${jk}` } : {}) },
    body: JSON.stringify({ url: 'https://example.com/' }),
    timeoutMs: 45000,
  });
  if (r.status === 200) out.push(`  jina read: ok (${jk ? 'authenticated' : 'anonymous'}), rate limit ${r.headers.get('x-ratelimit-limit') || 'n/a'}, remaining ${r.headers.get('x-ratelimit-remaining') || 'n/a'}`);
  else out.push(`  jina read: ${r.status === 0 ? r.netError : `HTTP ${r.status} ${apiMessage(r)}`}`);
  if (jk) {
    const s = await http(`${JINA_SEARCH}?q=test`, { headers: { Authorization: `Bearer ${jk}`, Accept: 'application/json', 'X-Respond-With': 'no-content' }, timeoutMs: 45000 });
    out.push(`  jina search: ${s.status === 200 ? 'ok' : s.status === 0 ? s.netError : `HTTP ${s.status} ${apiMessage(s)}`}`);
  }
  const fk = readKey('FIRECRAWL_API_KEY');
  out.push(`FIRECRAWL_API_KEY: ${fk ? 'set' : 'NOT set in this process'}`);
  if (fk) {
    const c = await http(`${FC_BASE}/team/credit-usage`, { headers: fcHeaders(fk), timeoutMs: 30000 });
    out.push(c.status === 200 && c.json?.data ? `  firecrawl: ok, ${c.json.data.remainingCredits} credits remaining` : `  firecrawl: ${fcStatusReason(c)}`);
  }
  process.stdout.write(out.join('\n') + '\n');
}

const HELP = `web.mjs - read and search the web (Jina first, Firecrawl fallback)

  node web.mjs read   <url>   [options]   page to markdown
  node web.mjs search <query> [options]   titles, urls, snippets
  node web.mjs map    <url>   [--search term] [--limit N]   site URL list (Firecrawl)
  node web.mjs credits | status

read options
  --engine auto|jina|firecrawl   default auto (Jina, then Firecrawl on failure)
  --js                  force a real browser render (JavaScript pages)
  --selector <css>      only this part of the page
  --wait <css>          wait for this element first (Jina)   --wait-ms N  wait N ms (Firecrawl)
  --full                skip main-content filtering (docs, tables, layouts)
  --links text|all|summary   default text (anchor text only, about 55% fewer tokens)
  --images none|alt|all      default none
  --fresh               bypass the cache      --timeout <sec>  default 60
  --max-chars N         printed limit, default 12000; the rest is saved to a temp file
  --max-tokens N        Jina server cap, default 30000
  --out <file>          also save the full text here

search options
  --limit N (default 5)   --site domain (repeatable)   --content (include page text, token heavy)

Exit: 0 ok, 1 failed, 2 bad usage or refused URL, 3 key missing.
Keys come from JINA_API_KEY and FIRECRAWL_API_KEY in the environment and are never printed.
`;

async function main() {
  const major = Number(process.versions.node.split('.')[0]);
  if (major < 18) throw new Fail(`Node 18 or newer is required (this is ${process.versions.node})`, 2);
  const argv = process.argv.slice(2);
  if (!argv.length || argv[0] === '--help' || argv[0] === '-h' || argv[0] === 'help') {
    process.stdout.write(HELP);
    if (!argv.length) process.exitCode = 2;
    return;
  }
  const cmd = argv[0];
  const { pos, raw } = parseArgs(argv.slice(1));
  if (raw.help) {
    process.stdout.write(HELP);
    return;
  }
  const o = buildOptions(raw);
  switch (cmd) {
    case 'read':
      if (pos.length !== 1) throw new Fail('read needs exactly one URL (quote it if it contains & or #)', 2);
      return cmdRead(pos[0], o);
    case 'search':
      return cmdSearch(pos.join(' '), o);
    case 'map':
      if (pos.length !== 1) throw new Fail('map needs exactly one URL', 2);
      return cmdMap(pos[0], o);
    case 'credits':
      return cmdCredits();
    case 'status':
      return cmdStatus();
    default:
      throw new Fail(`unknown command "${cmd}" (read, search, map, credits, status)`, 2);
  }
}

main().catch((e) => {
  if (e instanceof Fail) {
    console.error(`web: ${e.message}`);
    process.exitCode = e.code;
  } else {
    console.error(`web: unexpected error: ${oneLine(e && e.message)}`);
    process.exitCode = 1;
  }
});
