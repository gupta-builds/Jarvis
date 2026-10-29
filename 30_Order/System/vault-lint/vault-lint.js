#!/usr/bin/env node
// Vault Lint: measures how many notes fit their Standard (see 30_Order/Standards/Conformance Standard.md).
// Usage: node vault-lint.js [--root DIR] [--path PREFIX] [--family ID] [--kit] [--specs] [--json FILE] [--list N]
const fs = require('fs');
const path = require('path');

const args = process.argv.slice(2);
const opt = (n, d) => { const i = args.indexOf('--' + n); return i < 0 ? d : (args[i + 1] && !args[i + 1].startsWith('--') ? args[i + 1] : true); };
const ROOT = path.resolve(opt('root', path.join(__dirname, '..', '..', '..')));
const ONLY_PATH = opt('path', '');
const ONLY_FAMILY = opt('family', '');
const KIT = !!opt('kit', false);
const SPECS_ONLY = !!opt('specs', false);
const LIST_N = parseInt(opt('list', '0'), 10) || 0;
const JSON_OUT = opt('json', '');
const cfgFile = path.join(__dirname, 'vault-lint.config.json');
const CFG = fs.existsSync(cfgFile) ? JSON.parse(fs.readFileSync(cfgFile, 'utf8')) : { out_of_scope: [], tier4: [], template_paths: [] };
const re = (a) => (a || []).map((s) => new RegExp(s));
const OUT = re(CFG.out_of_scope), T4 = re(CFG.tier4), TPL = re(CFG.template_paths);
const SKIP_DIRS = new Set(['.git', 'node_modules', '.stversions', '__pycache__', '.obsidian']);

// ---------- file walk ----------
const files = []; // {rel, abs}
(function walk(d) {
  for (const e of fs.readdirSync(d, { withFileTypes: true })) {
    const p = path.join(d, e.name);
    if (e.isDirectory()) { if (SKIP_DIRS.has(e.name)) continue; walk(p); continue; }
    files.push({ rel: path.relative(ROOT, p).split(path.sep).join('/'), abs: p });
  }
})(ROOT);
const dirSet = new Set(); for (const f of files) { const sg = f.rel.split('/'); for (let k = 1; k < sg.length; k++) dirSet.add(sg.slice(0, k).join('/').toLowerCase()); }
const mdFiles = files.filter((f) => f.rel.toLowerCase().endsWith('.md'));

// ---------- link resolution ----------
const suffixSet = new Set();
for (const f of files) {
  const noExt = f.rel.replace(/\.md$/i, '');
  const segs = noExt.split('/');
  for (let k = 0; k < segs.length; k++) suffixSet.add(segs.slice(k).join('/').toLowerCase());
  if (!/\.md$/i.test(f.rel)) { const s2 = f.rel.split('/'); for (let k = 0; k < s2.length; k++) suffixSet.add(s2.slice(k).join('/').toLowerCase()); }
}
const resolves = (raw) => {
  let t = raw.split('|')[0].split('#')[0].trim().replace(/\\$/, '');
  if (!t) return true;
  t = t.replace(/\.md$/i, '').toLowerCase();
  return suffixSet.has(t) || suffixSet.has(t + '.md');
};

// ---------- parsing ----------
function parseNote(text) {
  const out = { bom: false, hasFm: false, keys: {}, order: [], dups: [], body: text, bodyLines: [], fmLines: [] };
  if (text.charCodeAt(0) === 0xFEFF) { out.bom = true; text = text.slice(1); }
  text = text.replace(/\r\n/g, '\n');
  out.body = text;
  if (!text.startsWith('---\n')) { out.bodyLines = text.split('\n'); return out; }
  const end = text.indexOf('\n---', 3);
  if (end < 0) { out.bodyLines = text.split('\n'); return out; }
  const fm = text.slice(4, end);
  const after = text.slice(end + 4);
  out.hasFm = true;
  out.fmLines = fm.split('\n');
  let cur = null;
  for (const l of out.fmLines) {
    const m = l.match(/^([A-Za-z_][\w-]*):\s*(.*)$/);
    if (m) {
      const k = m[1];
      if (out.keys[k]) out.dups.push(k);
      const raw = m[2].trim();
      cur = out.keys[k] = { raw, items: [], isList: false, quoted: /^["']/.test(raw) };
      if (/^\[.*\]$/.test(raw)) { cur.isList = true; cur.items = raw.slice(1, -1).split(',').map((s) => s.trim()).filter(Boolean); }
      out.order.push(k);
    } else if (cur && /^\s+-\s*/.test(l)) {
      cur.isList = true; cur.items.push(l.replace(/^\s+-\s*/, '').trim());
    }
  }
  out.bodyStartsWithNewline = after.startsWith('\n');
  out.bodyLines = (after.startsWith('\n') ? after.slice(1) : after).split('\n');
  return out;
}
const val = (n, k) => (n.keys[k] ? n.keys[k].raw.replace(/^["']|["']$/g, '') : undefined);
function stripCode(lines) { // remove fenced code, return {lines (with fenced replaced by null), }
  let inF = false; const r = [];
  for (const l of lines) {
    if (/^\s*```/.test(l)) { inF = !inF; r.push(null); continue; }
    r.push(inF ? null : l);
  }
  return r;
}
function cleanProse(lines) {
  const s = stripCode(lines).map((l) => (l === null ? '' : l)).join('\n');
  return s.replace(/<!--[\s\S]*?-->/g, '').replace(/%%[\s\S]*?%%/g, '').replace(/`[^`\n]*`/g, '');
}
function h2s(lines) {
  const sc = stripCode(lines); const hs = [];
  sc.forEach((l, i) => { if (l !== null && /^##\s+/.test(l)) hs.push({ title: l.replace(/^##\s+/, '').trim(), i }); });
  return { hs, sc };
}
const norm = (s) => s.toLowerCase().replace(/[:\s]+$/g, '').trim();
function sectionBody(sc, hs, idx) {
  const start = hs[idx].i + 1; let end = sc.length;
  for (let j = start; j < sc.length; j++) { if (sc[j] !== null && /^#{1,2}\s+/.test(sc[j])) { end = j; break; } }
  return sc.slice(start, end);
}

// Tables and dataview blocks need a blank line above them when text sits directly over them, or Obsidian does not render them.
// Starts a table at a header row followed by a delimiter row; ignores fenced code, HTML comments, and frontmatter (not in lines).
// A heading, a closing code fence, a callout title, or the end of an HTML comment above is a block edge and needs no blank line.
function formatSpots(lines) {
  const strip = (s) => s.replace(/^\s*(?:>\s?)*/, '');
  const DELIM = /^\s*\|?\s*:?-+:?\s*(\|\s*:?-+:?\s*)*\|?\s*$/;
  const tables = [], dvs = []; let inF = false, inC = false;
  for (let i = 0; i < lines.length; i++) {
    const l = lines[i];
    if (inC) { if (l.includes('-->')) inC = false; continue; }
    if (/^\s*```/.test(l)) { if (!inF && /^\s*```dataview(js)?\s*$/i.test(l)) dvs.push(i); inF = !inF; continue; }
    if (inF) continue;
    if (l.includes('<!--') && !l.includes('-->')) { inC = true; continue; }
    const s = strip(l);
    if (s.includes('|') && s.trim() !== '' && i + 1 < lines.length) {
      const nx = strip(lines[i + 1]);
      if (nx.includes('|') && nx.includes('-') && DELIM.test(nx)) tables.push(i);
    }
  }
  const edgeOk = (i) => {
    if (i === 0) return true;
    const p = lines[i - 1]; const ps = strip(p).trim();
    return ps === '' || /^#{1,6}\s/.test(ps) || /^\s*```\s*$/.test(p) || (/^\s*>/.test(p) && /^\[![^\]]+\]/.test(ps)) || p.trim().endsWith('-->');
  };
  return { tables, dvs, badTables: tables.filter((i) => !edgeOk(i)), badDvs: dvs.filter((i) => !edgeOk(i)) };
}

// ---------- vocabulary from Frontmatter Standard ----------
function loadVocab() {
  const f = mdFiles.find((x) => x.rel === '30_Order/Standards/Frontmatter Standard.md');
  const V = { types: {}, statusByType: {}, ok: false };
  if (!f) return V;
  const lines = fs.readFileSync(f.abs, 'utf8').replace(/\r\n/g, '\n').split('\n');
  let sec = '';
  for (const l of lines) {
    if (/^##\s+/.test(l)) { sec = l.replace(/^##\s+/, '').trim(); continue; }
    if (!l.startsWith('|') || /^\|\s*-/.test(l)) continue;
    const c = l.split('|').slice(1, -1).map((s) => s.trim());
    if (sec === 'type' && c.length >= 4 && c[0].startsWith('`')) {
      const t = c[0].replace(/`/g, '');
      V.types[t] = { kindKey: /none/i.test(c[2]) ? null : c[2].replace(/`/g, ''), kinds: /^none$/i.test(c[3]) ? [] : c[3].split(',').map((s) => s.trim()).filter(Boolean) };
    }
    if (sec === 'status' && c.length >= 3 && c[0].startsWith('`')) {
      const ts = (c[0].match(/`([^`]+)`/g) || []).map((s) => s.replace(/`/g, ''));
      const allowed = /no .?status/i.test(c[1]) ? [] : c[1].split(',').map((s) => s.trim()).filter(Boolean);
      for (const t of ts) V.statusByType[t] = allowed;
    }
  }
  V.ok = Object.keys(V.types).length >= 15;
  return V;
}
const VOCAB = loadVocab();

// ---------- specs ----------
const SPECS = []; const specErrors = [];
for (const f of mdFiles.filter((x) => x.rel.startsWith('30_Order/Standards/'))) {
  const n = parseNote(fs.readFileSync(f.abs, 'utf8'));
  const sc = stripCode(n.bodyLines); // find ## Spec and gather fenced json in raw lines
  let inSpec = false, inF = false, buf = []; const raw = n.bodyLines;
  for (const l of raw) {
    if (!inF && /^##\s+/.test(l)) { inSpec = /^##\s+Spec\s*$/.test(l); continue; }
    if (inSpec && /^\s*```json/.test(l)) { inF = true; buf = []; continue; }
    if (inSpec && inF && /^\s*```\s*$/.test(l)) {
      inF = false;
      try { const s = JSON.parse(buf.join('\n')); s._file = f.rel; SPECS.push(s); } catch (e) { specErrors.push(`${f.rel}: Spec JSON invalid (${e.message})`); }
      continue;
    }
    if (inSpec && inF) buf.push(l);
  }
}
const famSeen = {};
for (const s of SPECS) { if (famSeen[s.family]) specErrors.push(`${s._file}: duplicate family id ${s.family} (also ${famSeen[s.family]})`); famSeen[s.family] = s._file; }

function matchSpec(note, rel) {
  const type = val(note, 'type');
  const cand = SPECS.filter((s) => {
    const m = s.match || {};
    if (m.type && m.type !== type) return false;
    if (m.strict_path && m.path && rel !== undefined && !new RegExp(m.path).test(rel)) return false;
    if (m.kind !== null && m.kind !== undefined && VOCAB.types[type] && VOCAB.types[type].kindKey) {
      if (val(note, VOCAB.types[type].kindKey) !== m.kind) return false;
    } else if (m.kind) return false;
    for (const [k, v] of Object.entries(m.where || {})) if (val(note, k) !== v) return false;
    for (const [k, v] of Object.entries(m.where_not || {})) if (val(note, k) === v) return false;
    return true;
  });
  return cand;
}
function legacyMatch(note, rel) {
  let best = null, bestScore = -1;
  for (const s of SPECS) {
    for (const lm of s.legacy_match || []) {
      if (lm.type && lm.type !== val(note, 'type')) continue;
      if (lm.path && !new RegExp(lm.path).test(rel)) continue;
      let ok = true;
      for (const [k, v] of Object.entries(lm.where || {})) { const x = val(note, k); if (v === '*' ? x === undefined : x !== v) ok = false; }
      for (const k of lm.absent || []) if (note.keys[k]) ok = false;
      if (!ok) continue;
      const sc = (lm.path ? lm.path.length : 0) + Object.keys(lm.where || {}).length * 50 + (lm.type ? 5 : 0);
      if (sc > bestScore) { best = s; bestScore = sc; }
    }
  }
  return best;
}
const specificity = (s, rel) => ((s.match.path && new RegExp(s.match.path).test(rel)) ? 10000 + s.match.path.length : 0) + (s.match.kind ? 1000 : 0) + Object.keys(s.match.where || {}).length * 500 + Object.keys(s.match.where_not || {}).length * 100;

// ---------- checks ----------
const PLACEHOLDER = /<%|%>|\{\{|\}\}|YYYY-MM-DD|==\s*==|\[\[\s*\]\]/;
const GEN_LEGACY = new Set(['code', 'rationale', 'document', 'community']);
function check(rel, text) {
  const n = parseNote(text);
  const r = { path: rel, family: null, tier: null, fails: [], warns: [], notes: [] };
  const type = val(n, 'type');
  // tier 3 by legacy type
  let cand = type ? matchSpec(n, rel) : [];
  let spec = null;
  if (cand.length > 1) {
    cand.sort((a, b) => specificity(b, rel) - specificity(a, rel));
    if (specificity(cand[0], rel) === specificity(cand[1], rel)) { r.fails.push('6:ambiguous'); r.notes.push('ambiguous: ' + cand.map((c) => c.family).join(', ')); }
    spec = cand[0];
  } else if (cand.length === 1) spec = cand[0];
  if (spec && spec.match.path && !new RegExp(spec.match.path).test(rel) && !r.fails.includes('6:ambiguous')) { const lg = legacyMatch(n, rel); if (lg && lg !== spec) { spec = lg; r.legacy = true; r.fails.push('6:legacy-shape'); } }
  if (!spec) { const lg = legacyMatch(n, rel); if (lg) { spec = lg; r.legacy = true; r.fails.push('6:legacy-shape'); } }
  if (!spec) {
    if (type && VOCAB.types[type] === undefined && GEN_LEGACY.has(type)) r.tier = 3;
    else r.tier = 1;
    r.family = '(unmapped)';
    r.fails.push('6:unmapped');
  } else { r.family = spec.family; r.tier = spec.tier || 1; }
  const tier = r.tier;
  const add = (c, why) => { r.fails.push(c + ':' + why); };
  // F1 frontmatter
  if (!n.hasFm) add(1, 'no-frontmatter');
  else {
    if (n.bom) add(1, 'bom');
    for (const d of n.dups) add(1, 'duplicate-key:' + d);
    if (!type) add(1, 'no-type');
    else if (!VOCAB.types[type] && type !== 'generated' && !GEN_LEGACY.has(type)) add(1, 'type-off-vocab:' + type);
    else if (GEN_LEGACY.has(type)) add(1, 'legacy-generated-type:' + type);
    if (type && VOCAB.types[type] && VOCAB.types[type].kindKey) {
      const kv = val(n, VOCAB.types[type].kindKey);
      if (kv && VOCAB.types[type].kinds.length && !VOCAB.types[type].kinds.includes(kv)) add(1, `kind-off-vocab:${VOCAB.types[type].kindKey}=${kv}`);
    }
    const st = val(n, 'status');
    if (spec && tier !== 3) {
      const allowed = (spec.status && spec.status.length) ? spec.status : (VOCAB.statusByType[type] || []);
      if (!st) add(1, 'no-status'); else if (allowed.length && !allowed.includes(st)) add(1, 'status-off-vocab:' + st);
    }
    if (spec) {
      for (const k of spec.required_keys || []) {
        const e = n.keys[k]; const kt0 = (spec.key_types || {})[k] || ''; const opt = kt0.endsWith('?'); const kt = opt ? kt0.slice(0, -1) : kt0;
        if (!e) { add(1, 'missing-key:' + k); continue; }
        if (kt === 'list') { if (!e.isList) add(1, 'not-list:' + k); }
        else if (!opt && !e.raw && !e.isList) add(1, 'empty-key:' + k);
      }
      for (const [k, kt0] of Object.entries(spec.key_types || {})) {
        const e = n.keys[k]; if (!e) continue;
        const opt = kt0.endsWith('?'); const kt = opt ? kt0.slice(0, -1) : kt0;
        const v = e.raw.replace(/^["']|["']$/g, '');
        if (opt && !v && !e.isList) continue;
        if (kt === 'date' && (e.quoted || !/^\d{4}-\d{2}-\d{2}$/.test(v))) add(1, 'bad-date:' + k);
        if (kt === 'number' && (e.quoted || !/^-?\d+(\.\d+)?$/.test(v))) add(1, 'bad-number:' + k);
        if (kt === 'bool' && !/^(true|false)$/.test(e.raw)) add(1, 'bad-bool:' + k);
        if (kt === 'wikilink' && !/^"\[\[.*\]\]"$/.test(e.raw)) add(1, 'bad-wikilink:' + k);
      }
    }
    if (n.keys.tags) for (const t of n.keys.tags.items) if (/^["']?#/.test(t)) { add(1, 'hash-in-tags'); break; }
    for (const k of n.order) { const e = n.keys[k]; const all = [e.raw, ...e.items].join(' '); if (PLACEHOLDER.test(all)) { add(1, 'placeholder-in-value:' + k); break; } }
  }
  // F2 headings (tier 1 only)
  const body = n.bodyLines;
  if (tier === 1 && spec && (spec.headings || []).length) {
    const { hs, sc } = h2s(body); const want = spec.headings; let pos = -1; let ok = true;
    for (const w of want) {
      const idx = hs.findIndex((h, i) => i > pos && norm(h.title) === norm(w));
      if (idx < 0) { add(2, 'missing-heading:' + w); ok = false; continue; }
      pos = idx;
      const sb = sectionBody(sc, hs, idx).map((l) => (l === null ? 'CODE' : l)).join('\n').replace(/<!--[\s\S]*?-->/g, '').replace(/%%[\s\S]*?%%/g, '').trim();
      if (!sb) add(2, 'empty-heading:' + w);
    }
  }
  // F7 action shape (Action Standard: To Do callout, checkboxes only inside it, Open Threads subsections)
  if (spec && spec.family === 'action' && (spec.todo_callout || spec.open_threads_subheadings)) {
    const sc7 = stripCode(body);
    if (spec.todo_callout) {
      const maxL = spec.todo_callout.max_lines || 3;
      const CB = /^\s*(?:>\s*)*[-*+]\s+\[[ xX\/\->]\]/;
      const h1 = sc7.findIndex((l) => l !== null && /^#\s+/.test(l));
      let open = -1;
      if (h1 >= 0) for (let j = h1 + 1; j < sc7.length; j++) { if (sc7[j] !== null && sc7[j].trim() !== '' && !/^\s*<!--/.test(sc7[j])) { open = j; break; } }
      let tStart = -1, tEnd = -1;
      if (open >= 0 && sc7[open + 1] != null && /^>\s*\[!todo\]/i.test(sc7[open + 1])) {
        tStart = open + 1; tEnd = tStart;
        while (tEnd + 1 < sc7.length && sc7[tEnd + 1] != null && /^>/.test(sc7[tEnd + 1])) tEnd++;
      }
      if (tStart < 0) add(7, sc7.some((l) => l !== null && /^>\s*\[!todo\]/i.test(l)) ? 'todo-not-under-opening' : 'todo-missing');
      else {
        const items = []; for (let j = tStart; j <= tEnd; j++) { const m = sc7[j].match(/^>\s*[-*+]\s+\[[ xX\/\->]\]\s*(.*)$/); if (m) items.push(m[1].trim()); }
        if (items.length < 1 || items.length > maxL) add(7, 'todo-lines:' + items.length);
        const flat = (s) => s.replace(/\s+/g, ' ').trim();
        let nx = n.keys.next ? n.keys.next.raw : ''; if (/^(["']).*\1$/.test(nx)) nx = nx.slice(1, -1);
        if (items.length && flat(items[0]) !== flat(nx)) add(7, 'todo-next-mismatch');
      }
      let outside = 0;
      for (let j = 0; j < sc7.length; j++) { if (sc7[j] === null || (j >= tStart && j <= tEnd && tStart >= 0)) continue; if (CB.test(sc7[j])) outside++; }
      if (outside) add(7, 'checkbox-outside-todo:' + outside);
    }
    if (spec.open_threads_subheadings) {
      const { hs: hs7, sc: scx } = h2s(body); const oi = hs7.findIndex((h) => norm(h.title) === 'open threads');
      if (oi >= 0) {
        const sec = sectionBody(scx, hs7, oi); const subs = sec.filter((l) => l !== null && /^###\s+/.test(l)).map((l) => norm(l.replace(/^###\s+/, '')));
        for (const w of spec.open_threads_subheadings) if (!subs.includes(norm(w))) add(7, 'missing-subheading:' + w);
      }
    }
  }
  // F3 links
  const linkSrc = [];
  for (const k of n.order) { const e = n.keys[k]; linkSrc.push({ where: 'fm:' + k, text: [e.raw, ...e.items].join('\n') }); }
  const bodyClean = stripCode(body).map((l) => (l === null ? '' : l)).join('\n').replace(/<!--[\s\S]*?-->/g, '').replace(/%%[\s\S]*?%%/g, '').replace(/`[^`\n]*`/g, '');
  const bodyLinesClean = bodyClean.split('\n');
  for (const l of bodyLinesClean) linkSrc.push({ where: 'body', text: l, tc: /\(to create\)/i.test(l) });
  let dead = 0, deadFm = 0; const deadNames = [];
  for (const s of linkSrc) {
    for (const m of s.text.matchAll(/\[\[([^\]\n]*)\]\]/g)) {
      if (!m[1].trim()) continue;
      if (!resolves(m[1])) { if (s.where.startsWith('fm:')) { deadFm++; deadNames.push(m[1]); } else if (!s.tc) { dead++; deadNames.push(m[1]); } }
    }
  }
  if (deadFm) add(3, 'dead-frontmatter-links:' + deadFm);
  if (dead) add(3, 'dead-body-links:' + dead);
  if (deadNames.length) r.dead = [...new Set(deadNames)].slice(0, 6);
  // dead dataview FROM paths
  { let inDv = false; const deadFrom = [];
    for (const l of body) {
      if (/^\s*```dataview(js)?\s*$/i.test(l)) { inDv = !/js/i.test(l); continue; }
      if (/^\s*```\s*$/.test(l)) { inDv = false; continue; }
      if (inDv && /^\s*FROM\b/i.test(l)) for (const m of l.matchAll(/"([^"]+)"/g)) { const p = m[1].replace(/\/$/, '').toLowerCase(); if (!dirSet.has(p) && !suffixSet.has(p.replace(/\.md$/, ''))) deadFrom.push(m[1]); }
    }
    if (deadFrom.length) { add(3, 'dead-dataview-from:' + deadFrom.length); r.dead = (r.dead || []).concat(deadFrom.slice(0, 3)); } }
  // F4 placement
  if (spec && spec.match.path && !new RegExp(spec.match.path).test(rel)) add(4, 'wrong-folder');
  // F5 hygiene (tier 1, 2)
  if (tier !== 3) {
    if (n.hasFm && n.bodyStartsWithNewline && body[0] === '') { /* blank right after frontmatter */ add(5, 'blank-after-frontmatter'); }
    const spots = formatSpots(body); const lineOff = text.replace(/^﻿/, '').replace(/\r\n/g, '\n').split('\n').length - body.length;
    const startSet = new Set([...spots.tables, ...spots.dvs]);
    let blanks = 0, hr = 0; let inF = false;
    for (let i = 0; i < body.length; i++) {
      const l = body[i];
      if (/^\s*```/.test(l)) { inF = !inF; continue; }
      if (inF) continue;
      if (l.trim() === '---') hr++;
      if (l.trim() === '' && i !== body.length - 1) {
        let p = i - 1; while (p >= 0 && body[p].trim() === '') p--;
        let q = i + 1; while (q < body.length && body[q].trim() === '') q++;
        const okCallout = p >= 0 && q < body.length && /^\s*>/.test(body[p]) && !/^\s*>/.test(body[q]) && body[i - 1].trim() !== '';
        // the one blank line a table or dataview block needs above it, when text sits directly over it
        const okSpot = i > 0 && body[i - 1].trim() !== '' && !/^\s*#{1,6}\s/.test(body[i - 1]) && startSet.has(i + 1);
        if (!okCallout && !okSpot) blanks++;
      }
    }
    if (hr) add(5, 'hr-in-body:' + hr);
    if (blanks) add(5, 'extra-blank-lines:' + blanks);
    // warnings only: they never fail a note or change the fit percentage
    if (spots.badTables.length) r.warns.push('table-no-blank-above:' + spots.badTables.map((i) => 'L' + (lineOff + i + 1)).join(','));
    if (spots.badDvs.length) r.warns.push('dataview-no-blank-above:' + spots.badDvs.map((i) => 'L' + (lineOff + i + 1)).join(','));
    if (text.replace(/\r\n/g, '\n').endsWith('\n\n')) add(5, 'trailing-blank');
    const pl = cleanProse(body);
    if (PLACEHOLDER.test(pl)) add(5, 'unresolved-placeholder');
  }
  if (spec && Array.isArray(spec.skip_checks) && spec.skip_checks.length) { r.fails = r.fails.filter((f) => !spec.skip_checks.includes(parseInt(f, 10))); if (spec.skip_checks.includes(5)) r.warns = []; }
  r.pass = r.fails.length === 0;
  // which checks failed
  r.failed = [...new Set(r.fails.map((f) => f.split(':')[0]))].sort();
  return r;
}

// ---------- scope ----------
const inScope = (rel) => !OUT.some((x) => x.test(rel)) && !TPL.some((x) => x.test(rel)) && !T4.some((x) => x.test(rel)) && (!ONLY_PATH || rel.startsWith(ONLY_PATH));
const results = [];
let tier4n = 0, tplN = 0, outN = 0;
if (!SPECS_ONLY && !KIT) {
  for (const f of mdFiles) {
    if (OUT.some((x) => x.test(f.rel))) { outN++; continue; }
    if (TPL.some((x) => x.test(f.rel))) { tplN++; continue; }
    if (T4.some((x) => x.test(f.rel))) { tier4n++; continue; }
    if (ONLY_PATH && !f.rel.startsWith(ONLY_PATH)) continue;
    let t; try { t = fs.readFileSync(f.abs, 'utf8'); } catch { continue; }
    const r = check(f.rel, t);
    if (!ONLY_FAMILY || r.family === ONLY_FAMILY) results.push(r);
  }
}

// ---------- kit mode ----------
const kitIssues = [];
function kitCheck() {
  const add = (sev, file, msg) => kitIssues.push({ sev, file, msg });
  const o30 = mdFiles.filter((f) => f.rel.startsWith('30_Order/') && !f.rel.startsWith('30_Order/System/'));
  const nameMap = {};
  for (const f of o30) {
    const size = fs.statSync(f.abs).size;
    if (size === 0) add('error', f.rel, 'empty file');
    const b = path.basename(f.rel, '.md').toLowerCase();
    (nameMap[b] = nameMap[b] || []).push(f.rel);
  }
  for (const [b, arr] of Object.entries(nameMap)) if (arr.length > 1) add('error', arr.join(' | '), 'duplicate file name (wikilinks cannot tell them apart)');
  for (const e of specErrors) add('error', e.split(':')[0], e);
  if (!VOCAB.ok) add('error', '30_Order/Standards/Frontmatter Standard.md', 'could not read the type vocabulary table');
  const stds = mdFiles.filter((f) => f.rel.startsWith('30_Order/Standards/') && fs.statSync(f.abs).size > 0);
  const registry = mdFiles.find((f) => f.rel === '30_Order/Note Type Registry.md');
  const regText = registry ? fs.readFileSync(registry.abs, 'utf8') : '';
  for (const f of stds) {
    const text = fs.readFileSync(f.abs, 'utf8'); const n = parseNote(text);
    const fam = val(n, 'family'); const isPolicy = fam === 'policy';
    const specs = SPECS.filter((s) => s._file === f.rel);
    if (n.keys.system_kind === undefined) add('warn', f.rel, 'no system_kind (legacy Standard)');
    if (!isPolicy && fam && !specs.length) add('error', f.rel, 'family Standard without a Spec block');
    for (const s of specs) {
      if (fam && !isPolicy && s.family !== fam && specs.length === 1) add('error', f.rel, `frontmatter family "${fam}" differs from Spec family "${s.family}"`);
      if (registry && !regText.includes(s.family)) add('warn', f.rel, `family ${s.family} has no row in Note Type Registry`);
    }
    const g = n.keys.gold_standard;
    if (g && g.raw && g.raw !== 'none') { const m = g.raw.match(/\[\[([^\]]+)\]\]/); if (!m || !resolves(m[1])) add('error', f.rel, 'gold_standard does not resolve'); }
    if (!isPolicy && fam && !/\n\|[^\n]*\|/.test(text.slice(text.search(/^##\s+Legacy Shapes/m) >= 0 ? text.search(/^##\s+Legacy Shapes/m) : text.length))) add('error', f.rel, 'Legacy Shapes has no table');
    const prose = stripCode(n.bodyLines).filter((l) => l !== null && !l.startsWith('|')).join(' ').replace(/<!--[\s\S]*?-->/g, '');
    const words = (prose.match(/\S+/g) || []).length;
    if (words > 700) add('warn', f.rel, `prose is ${words} words (limit 700)`);
    const ms = (n.keys.maps_to && n.keys.maps_to.items) || [];
    for (const m of ms) {
      const mm = m.match(/\[\[([^\]|#]+)/); if (!mm) continue;
      const tf = files.find((x) => x.rel.replace(/\.md$/i, '').toLowerCase().endsWith(mm[1].trim().toLowerCase()));
      if (!tf) { add('error', f.rel, `maps_to ${m} does not resolve`); continue; }
      const tt = fs.readFileSync(tf.abs, 'utf8'); const tn = parseNote(tt);
      if (/\{\{/.test(tt)) add('error', tf.rel, 'uses {{ }} date syntax (use Templater)');
      let pair = specs;
      if (specs.length > 1) {
        const ty = tn.keys.type ? tn.keys.type.raw : null;
        const kk = ty && VOCAB.types[ty] ? VOCAB.types[ty].kindKey : null;
        const tk = kk && tn.keys[kk] ? tn.keys[kk].raw : (tn.keys.system_kind ? tn.keys.system_kind.raw : null);
        pair = specs.filter((s) => s.match && s.match.kind === tk);
        if (pair.length > 1) pair = pair.filter((s) => !Object.keys(s.match.where || {}).length);
        const named = specs.filter((s) => s.template && s.template.toLowerCase() === path.basename(tf.rel, '.md').toLowerCase());
        if (named.length) pair = named;
        if (!pair.length) pair = specs;
      }
      for (const s of pair) {
        for (const k of s.required_keys || []) if (!tn.keys[k]) add('error', tf.rel, `template missing key ${k} from ${s.family}`);
        const { hs, sc } = h2s(tn.bodyLines); const got = hs.map((h) => norm(h.title));
        const want = (s.headings || []).map(norm);
        const allowed = new Set([...want, ...(s.optional_headings || []).map(norm)]);
        for (const w of want) if (!got.includes(w)) add('error', tf.rel, `template missing heading ${w}`);
        for (const g2 of got) if (!allowed.has(g2) && specs.length === 1) add('warn', tf.rel, `template has heading not in spec: ${g2}`);
        hs.forEach((h, i) => {
          const sb = sectionBody(sc, hs, i).join('\n');
          const subN = (sb.match(/^###\s+/gm) || []).length; // ### subheadings are allowed; each may carry its own comment
          const stripped = sb.replace(/<!--[\s\S]*?-->/g, '').replace(/^###\s+.*$/gm, '').replace(/^\s*```[\s\S]*?```/gm, '').trim();
          if (stripped && !/^(Spec)$/i.test(h.title) && !/^(Log)$/i.test(h.title)) add('warn', tf.rel, `template section "${h.title}" has body text beyond a comment`);
          const cm = (sb.match(/<!--[\s\S]*?-->/g) || []);
          if (cm.length > 1 + subN) add('warn', tf.rel, `template section "${h.title}" has ${cm.length} comments (limit ${1 + subN})`);
          if (cm[0] && cm[0].length > 160) add('warn', tf.rel, `template comment under "${h.title}" is long (${cm[0].length} chars)`);
        });
      }
    }
    const us = (n.keys.used_by && n.keys.used_by.items) || [];
    for (const u of us) {
      const mm = u.match(/\[\[([^\]|#]+)/); if (!mm) continue;
      const wf = mdFiles.find((x) => path.basename(x.rel, '.md').toLowerCase() === mm[1].trim().toLowerCase().split('/').pop());
      if (!wf) { add('error', f.rel, `used_by ${u} does not resolve`); continue; }
      const wn = parseNote(fs.readFileSync(wf.abs, 'utf8')); const sv = wn.keys.serves ? wn.keys.serves.raw : '';
      if (!isPolicy && wn.hasFm && wn.keys.system_kind && !sv.toLowerCase().includes(path.basename(f.rel, '.md').toLowerCase())) add('warn', wf.rel, `serves does not point back to ${path.basename(f.rel, '.md')}`);
    }
  }
  for (const f of mdFiles.filter((x) => x.rel.startsWith('30_Order/Templates/') && fs.statSync(x.abs).size > 0)) {
    const tn = parseNote(fs.readFileSync(f.abs, 'utf8'));
    if (!tn.hasFm) { add('warn', f.rel, 'template has no frontmatter'); continue; }
    const ty = val(tn, 'type');
    if (!ty) { add('warn', f.rel, 'template has no type'); continue; }
    if (!VOCAB.types[ty] && ty !== 'generated') { add('error', f.rel, `template type "${ty}" is not in the vocabulary`); continue; }
    const kk = VOCAB.types[ty] && VOCAB.types[ty].kindKey;
    const kv = kk ? val(tn, kk) : undefined;
    if (kv && VOCAB.types[ty].kinds.length && !VOCAB.types[ty].kinds.includes(kv)) add('error', f.rel, `template ${kk}="${kv}" is not in the vocabulary`);
    const st = val(tn, 'status'); const okSt = VOCAB.statusByType[ty] || [];
    if (st && okSt.length && !okSt.includes(st)) add('error', f.rel, `template status "${st}" is not allowed for type ${ty}`);
    if (/\{\{date/.test(fs.readFileSync(f.abs, 'utf8'))) add('error', f.rel, 'template uses {{date}} (use Templater)');
  }
  const wfs = mdFiles.filter((f) => f.rel.startsWith('30_Order/Workflows/') && fs.statSync(f.abs).size > 0);
  for (const f of wfs) {
    const text = fs.readFileSync(f.abs, 'utf8'); const n = parseNote(text);
    if (!n.keys.system_kind) { add('warn', f.rel, 'legacy Workflow (no system_kind)'); continue; }
    if (val(n, 'system_kind') !== 'workflow') continue;
    const sv = n.keys.serves ? n.keys.serves.raw : ''; const m = sv.match(/\[\[([^\]|#]+)/);
    if (!m || !resolves(m[1])) add('error', f.rel, 'serves does not resolve');
    const prose = stripCode(n.bodyLines).filter((l) => l !== null).join(' ').replace(/<!--[\s\S]*?-->/g, '');
    const words = (prose.match(/\S+/g) || []).length; if (words > 350) add('warn', f.rel, `workflow is ${words} words (limit 350)`);
    const steps = (n.body.match(/^\d+\.\s/gm) || []).length; if (steps > 9) add('warn', f.rel, `workflow has ${steps} numbered lines (limit 9)`);
  }
}
if (KIT || SPECS_ONLY) { kitCheck(); }

// ---------- report ----------
const pct = (a, b) => (b ? (100 * a / b).toFixed(1) : '-') + '%';
if (SPECS_ONLY || KIT) {
  console.log(`Specs loaded: ${SPECS.length} from ${new Set(SPECS.map((s) => s._file)).size} Standards. Vocabulary parsed: ${VOCAB.ok}`);
  const errs = kitIssues.filter((i) => i.sev === 'error'), warns = kitIssues.filter((i) => i.sev === 'warn');
  const only = typeof opt('only', '') === 'string' ? opt('only', '') : '';
  const show = kitIssues.filter((i) => !only || i.file.includes(only));
  for (const i of show.sort((a, b) => a.sev.localeCompare(b.sev) || a.file.localeCompare(b.file))) console.log(`${i.sev.toUpperCase()}  ${i.file}  ${i.msg}`);
  console.log(`\n${errs.length} errors, ${warns.length} warnings`);
  if (JSON_OUT) fs.writeFileSync(JSON_OUT, JSON.stringify({ specs: SPECS.map((s) => s.family), issues: kitIssues }, null, 1));
  process.exit(errs.length ? 1 : 0);
}
const fit = results.filter((r) => r.pass).length;
console.log(`Scanned ${results.length} notes in scope (excluded: ${outN} out of scope, ${tier4n} tier 4, ${tplN} templates). Specs: ${SPECS.length}. Vocabulary parsed: ${VOCAB.ok}`);
if (specErrors.length) specErrors.forEach((e) => console.log('SPEC ERROR ' + e));
console.log(`FIT: ${fit}/${results.length} = ${pct(fit, results.length)}\n`);
const tiers = {}; for (const r of results) { const t = tiers[r.tier] = tiers[r.tier] || { n: 0, f: 0 }; t.n++; if (r.pass) t.f++; }
console.log('By tier:'); Object.keys(tiers).sort().forEach((t) => console.log(`  tier ${t}: ${tiers[t].f}/${tiers[t].n} = ${pct(tiers[t].f, tiers[t].n)}`));
const fam = {}; for (const r of results) { const t = fam[r.family] = fam[r.family] || { n: 0, f: 0, near: 0, checks: {} }; t.n++; if (r.pass) t.f++; if (r.failed.length === 1) t.near++; for (const c of r.failed) t.checks[c] = (t.checks[c] || 0) + 1; }
console.log('\nBy family (fit / total, near-fit, failing checks):');
Object.entries(fam).sort((a, b) => b[1].n - a[1].n).forEach(([k, t]) => console.log(`  ${k.padEnd(28)} ${String(t.f).padStart(5)}/${String(t.n).padEnd(5)} ${pct(t.f, t.n).padStart(6)}  near ${String(t.near).padStart(4)}  ${Object.entries(t.checks).sort().map(([c, v]) => 'F' + c + ':' + v).join(' ')}`));
const reasons = {}; for (const r of results) for (const f of r.fails) { const k = f.replace(/:\d+$/, '').replace(/(duplicate-key|missing-key|empty-key|not-list|bad-date|bad-number|placeholder-in-value|missing-heading|empty-heading|type-off-vocab|status-off-vocab|kind-off-vocab|hr-in-body|extra-blank-lines|table-no-blank-above|dataview-no-blank-above|checkbox-outside-todo|todo-lines|missing-subheading|dead-body-links|dead-frontmatter-links|legacy-generated-type):.*/, '$1'); reasons[k] = (reasons[k] || 0) + 1; }
console.log('\nTop failure reasons:'); Object.entries(reasons).sort((a, b) => b[1] - a[1]).slice(0, 15).forEach(([k, v]) => console.log(`  ${String(v).padStart(5)}  ${k}`));
if (LIST_N) { console.log(`\nFirst ${LIST_N} failing notes:`); results.filter((r) => !r.pass).slice(0, LIST_N).forEach((r) => console.log(`  ${r.path}  [${r.family}]  ${r.fails.join('; ')}${r.dead ? '  DEAD: ' + r.dead.join(' | ') : ''}`)); }
// warnings never affect FIT; they print with line numbers (first 20, or --list N)
{ const wc = {}; const wn = results.filter((r) => r.warns && r.warns.length);
  for (const r of wn) for (const w of r.warns) { const k = w.split(':')[0]; wc[k] = (wc[k] || 0) + 1; }
  if (wn.length) {
    console.log('\nWarnings (do not affect FIT):'); Object.entries(wc).sort().forEach(([k, v]) => console.log('  ' + String(v).padStart(5) + '  notes with ' + k));
    console.log('  First ' + Math.min(wn.length, LIST_N || 20) + ' notes with warnings:'); wn.slice(0, LIST_N || 20).forEach((r) => console.log('    ' + r.path + '  ' + r.warns.join('; ')));
  } }
if (JSON_OUT) fs.writeFileSync(JSON_OUT, JSON.stringify({ fit, total: results.length, results }, null, 1));
