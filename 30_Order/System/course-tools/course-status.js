#!/usr/bin/env node
// Course Status: one compact report per course, computed from the notes so an agent never has to read them.
// Usage: node course-status.js "CSCI 4521" [--week N] [--json]
// Reads 20_Progress/Degree/<course>/. Writes nothing. See "Course Status.md".
const fs = require('fs');
const path = require('path');
const cp = require('child_process');

const args = process.argv.slice(2);
const course = args.find((a) => !a.startsWith('--') && !/^\d+$/.test(a)) || 'CSCI 4521';
const wi = args.indexOf('--week');
const ROOT = path.resolve(__dirname, '..', '..', '..');
const DIR = path.join(ROOT, '20_Progress', 'Degree', course);
if (!fs.existsSync(DIR)) { console.error('No course folder: ' + DIR); process.exit(1); }

const START = new Date('2026-09-07T00:00:00');
const nowWeek = wi >= 0 ? parseInt(args[wi + 1], 10) : Math.max(1, Math.min(16, Math.floor((Date.now() - START.getTime()) / 604800000) + 1));

const walk = (d) => fs.readdirSync(d, { withFileTypes: true }).flatMap((e) => e.isDirectory() ? walk(path.join(d, e.name)) : [path.join(d, e.name)]);
const files = walk(DIR).filter((f) => f.toLowerCase().endsWith('.md'));
const rel = (f) => path.relative(DIR, f).split(path.sep).join('/');

function parse(f) {
  const t = fs.readFileSync(f, 'utf8').replace(/\r\n/g, '\n');
  const m = t.match(/^---\n([\s\S]*?)\n---\n?/);
  const fm = {};
  if (m) for (const l of m[1].split('\n')) { const k = l.match(/^([A-Za-z_]+):\s*(.*)$/); if (k) fm[k[1]] = k[2].replace(/^["']|["']$/g, ''); }
  const body = m ? t.slice(m[0].length) : t;
  return { fm, body, words: (body.match(/\S+/g) || []).length };
}
function section(body, title) {
  const re = new RegExp('^## ' + title.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + '\\s*$', 'm');
  const i = body.search(re); if (i < 0) return '';
  const rest = body.slice(i).split('\n').slice(1);
  const out = []; for (const l of rest) { if (/^## /.test(l)) break; out.push(l); }
  return out.join('\n');
}
const tasks = (s) => ({ open: (s.match(/^\s*- \[ \]/gm) || []).length, done: (s.match(/^\s*- \[[xX]\]/gm) || []).length });
const cards = (s) => (s.match(/#cards\//g) || []).length;

const R = { course, week: nowWeek, weeks: [], textbook: [], quizzes: [], cards: { total: 0, reviewed: 0, textbook: 0 }, lint: '' };
for (const f of files) {
  const r = rel(f); const p = parse(f); const kind = p.fm.class_kind || p.fm.input_kind;
  const c = cards(p.body), sr = (p.body.match(/<!--SR:/g) || []).length;
  if (kind === 'textbook' && /^Textbook\/.+\/Chapter/.test(r)) {
    const guide = tasks(section(p.body, 'Reading Guide'));
    R.textbook.push({ note: r.replace(/^Textbook\//, '').replace(/\.md$/, ''), words: p.words, cards: c, guide: guide.done + '/' + (guide.done + guide.open), explain: (p.body.match(/\[!EXPLAIN\]/g) || []).length, status: p.fm.status });
    R.cards.textbook += c;
  } else {
    R.cards.total += c; R.cards.reviewed += sr;
  }
  const wm = r.match(/^Weekly\/Week - (\d+)\.md$/);
  if (wm) { const t = tasks(section(p.body, 'Takeaways (questions to resolve)')); R.weeks.push({ n: +wm[1], status: p.fm.status, words: p.words, takeaways: t.done + '/' + (t.done + t.open), cards: c, live: /^#{2,4} Live lecture capture/m.test(p.body) }); }
  const qm = r.match(/^Quizzes\/Quiz - (\d+)\.md$/);
  if (qm) { const t = tasks(section(p.body, 'Mistakes and Gaps')); R.quizzes.push({ n: +qm[1], status: p.fm.status, score: p.fm.score || 'unknown', gaps: t.done + '/' + (t.done + t.open) }); }
}
R.weeks.sort((a, b) => a.n - b.n); R.quizzes.sort((a, b) => a.n - b.n);
const have = new Set(R.weeks.map((w) => w.n)); R.missingWeeks = []; for (let i = 1; i <= nowWeek; i++) if (!have.has(i)) R.missingWeeks.push(i);
try {
  const out = cp.execFileSync('node', [path.join(ROOT, '30_Order', 'System', 'vault-lint', 'vault-lint.js'), '--path', '20_Progress/Degree/' + course], { encoding: 'utf8' });
  R.lint = (out.match(/FIT: .*/) || [''])[0];
} catch (e) { R.lint = 'lint failed'; }

if (args.includes('--json')) { console.log(JSON.stringify(R, null, 1)); process.exit(0); }
const L = [];
L.push(`${course}, calendar week ${R.week}. Lint ${R.lint}`);
L.push(`Weeks written: ${R.weeks.map((w) => w.n).join(',') || 'none'}. Missing up to week ${R.week}: ${R.missingWeeks.join(',') || 'none'}. Live capture present: ${R.weeks.filter((w) => w.live).map((w) => w.n).join(',') || 'none'}.`);
L.push('Week takeaways done/total: ' + (R.weeks.map((w) => `W${w.n} ${w.takeaways}`).join(', ') || 'none'));
L.push(`Textbook notes ${R.textbook.length}, over 3000 words: ${R.textbook.filter((t) => t.words > 3000).map((t) => t.note + ' ' + t.words).join('; ') || 'none'}. With a Reading Guide: ${R.textbook.filter((t) => t.guide !== '0/0').length}. With EXPLAIN callouts: ${R.textbook.filter((t) => t.explain).length}. Textbook cards (should be 0): ${R.cards.textbook}.`);
L.push('Reading Guide done/total: ' + (R.textbook.filter((t) => t.guide !== '0/0').map((t) => `${t.note} ${t.guide}`).join('; ') || 'none'));
L.push('Quizzes: ' + (R.quizzes.map((q) => `Q${q.n} ${q.status} score ${q.score} gaps ${q.gaps}`).join('; ') || 'none'));
L.push(`Cards on week/concept/quiz notes: ${R.cards.total}. Reviewed (SR markers): ${R.cards.reviewed}.`);
console.log(L.join('\n'));
