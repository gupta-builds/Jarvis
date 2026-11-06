#!/usr/bin/env node
// Order health: a read-only weekly report on how well the vault fits 30_Order.
// Usage: node order-health.js [--top N] [--root DIR]
// It runs vault-lint.js (fit) and vault-lint.js --kit (kit consistency) with --json into the OS temp folder,
// reads 30_Order/Note Type Registry.md, and prints one Markdown report to stdout. It writes nothing into the vault
// and never passes --fix. The caller decides where the text goes (the weekly review pastes it under Vault Health).
const fs = require('fs');
const os = require('os');
const path = require('path');
const { spawnSync } = require('child_process');

const args = process.argv.slice(2);
const opt = (n, d) => { const i = args.indexOf('--' + n); return i < 0 ? d : args[i + 1]; };
const ROOT = path.resolve(opt('root', path.join(__dirname, '..', '..', '..')));
const TOP = parseInt(opt('top', '3'), 10) || 3;
const TARGET = 90;
const LINT = path.join(__dirname, 'vault-lint.js');
const tmp = fs.mkdtempSync(path.join(os.tmpdir(), 'order-health-'));

function runLint(extra, jsonName) {
  const jsonFile = path.join(tmp, jsonName);
  const r = spawnSync(process.execPath, [LINT, '--root', ROOT, ...extra, '--json', jsonFile], { encoding: 'utf8', maxBuffer: 64 * 1024 * 1024 });
  if (!fs.existsSync(jsonFile)) { console.error('vault-lint produced no JSON.\n' + (r.stderr || r.stdout || '')); process.exit(2); }
  return { data: JSON.parse(fs.readFileSync(jsonFile, 'utf8')), status: r.status };
}

const fit = runLint([], 'fit.json');
const kit = runLint(['--kit'], 'kit.json');
fs.rmSync(tmp, { recursive: true, force: true });

// ---- fit per family ----
const detailed = /^(duplicate-key|missing-key|empty-key|not-list|bad-date|bad-number|placeholder-in-value|missing-heading|empty-heading|type-off-vocab|status-off-vocab|kind-off-vocab|hr-in-body|extra-blank-lines|dead-body-links|dead-frontmatter-links|legacy-generated-type|checkbox-outside-todo|todo-lines|missing-subheading):/;
const reasonKey = (f) => { const m = f.match(detailed); return m ? m[1] : f.replace(/:\d+$/, ''); };
const fam = {};
for (const r of fit.data.results) {
  const t = fam[r.family] = fam[r.family] || { n: 0, pass: 0, reasons: {} };
  t.n++; if (r.pass) t.pass++;
  for (const f of r.fails) { const k = reasonKey(f); t.reasons[k] = (t.reasons[k] || 0) + 1; }
}
const pct = (a, b) => (b ? (100 * a / b).toFixed(1) : '-') + '%';
const failing = Object.entries(fam).filter(([, t]) => t.pass < t.n).sort((a, b) => (b[1].n - b[1].pass) - (a[1].n - a[1].pass));

// ---- families with a Spec but no notes in the scan ----
const specFamilies = kit.data.specs;
const withoutFiles = specFamilies.filter((s) => !fam[s]).sort();

// ---- kit files with no registry row ----
const regPath = path.join(ROOT, '30_Order', 'Note Type Registry.md');
const regText = fs.existsSync(regPath) ? fs.readFileSync(regPath, 'utf8') : '';
const inRegistry = new Set();
for (const m of regText.matchAll(/\[\[([^\]|#]+)/g)) inRegistry.add(path.basename(m[1].trim()).toLowerCase());
const kitFiles = [];
(function walk(d) {
  for (const e of fs.readdirSync(d, { withFileTypes: true })) {
    const p = path.join(d, e.name);
    if (e.isDirectory()) walk(p);
    else if (e.name.endsWith('.md') && fs.statSync(p).size > 0) kitFiles.push(path.relative(ROOT, p).split(path.sep).join('/'));
  }
})(path.join(ROOT, '30_Order'));
const kitDirs = ['30_Order/Standards/', '30_Order/Templates/', '30_Order/Workflows/'];
const noRow = kitFiles
  .filter((f) => kitDirs.some((d) => f.startsWith(d)))
  .filter((f) => !/^00_/.test(path.basename(f)))
  .filter((f) => !inRegistry.has(path.basename(f, '.md').toLowerCase()))
  .sort();

// ---- files git cannot add (Windows reserved names and unsafe names) ----
// A stray file named nul, con or aux, or one with a trailing dot or space, makes `git add -A` fail on
// Windows and stops git-auto-sync for every later run until it is removed. Read-only: this only lists them.
const RESERVED = /^(con|prn|aux|nul|com[1-9]|lpt[1-9])(\..*)?$/i;
const unsafe = [];
(function scan(d) {
  let entries;
  try { entries = fs.readdirSync(d, { withFileTypes: true }); } catch { return; }
  for (const e of entries) {
    const p = path.join(d, e.name);
    let why = null;
    if (RESERVED.test(e.name)) why = 'reserved Windows name';
    else if (/[. ]$/.test(e.name)) why = 'trailing dot or space';
    else if (/[<>:"|?*\x00-\x1f]/.test(e.name)) why = 'illegal character';
    else if (p.length >= 260) why = `path is ${p.length} characters (limit 259 without long-path support)`;
    if (why) unsafe.push(`${path.relative(ROOT, p).split(path.sep).join('/')}: ${why}`);
    if (e.isDirectory() && !['.git', '.stversions', 'node_modules'].includes(e.name)) scan(p);
  }
})(ROOT);

// ---- print ----
const out = [];
const now = new Date();
const today = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`; // local date, not UTC
const total = fit.data.total, passN = fit.data.fit;
out.push(`### Order health (${today})`);
out.push('');
out.push(`Read-only: \`node vault-lint.js\` and \`node vault-lint.js --kit\`, plus \`30_Order/Note Type Registry.md\`. Nothing was fixed.`);
out.push('');
out.push(`**Fit:** ${passN}/${total} = ${pct(passN, total)} (target ${TARGET}%). ${parseFloat(pct(passN, total)) >= TARGET ? 'At or above target.' : 'Below target.'}`);
out.push('');
const errs = kit.data.issues.filter((i) => i.sev === 'error'), warns = kit.data.issues.filter((i) => i.sev === 'warn');
out.push(`**Kit consistency:** ${errs.length} errors, ${warns.length} warnings (exit ${kit.status}).`);
for (const e of errs) out.push(`- error: ${e.file}: ${e.msg}`);
out.push('');
out.push(`**Families below 100% fit (${failing.length}), with the top ${TOP} failure reasons:**`);
out.push('');
if (failing.length) {
  out.push('| Family | Fit | Failing | Top reasons |');
  out.push('|---|---|---|---|');
  for (const [k, t] of failing) {
    const top = Object.entries(t.reasons).sort((a, b) => b[1] - a[1]).slice(0, TOP).map(([r, c]) => `${r} (${c})`).join(', ');
    out.push(`| ${k} | ${t.pass}/${t.n} = ${pct(t.pass, t.n)} | ${t.n - t.pass} | ${top} |`);
  }
} else out.push('None.');
out.push('');
out.push(`**Families with a Spec and no notes (${withoutFiles.length}):** ${withoutFiles.length ? withoutFiles.join(', ') : 'none'}.`);
out.push('');
out.push(`**Standards, Templates and Workflows with no row in the Note Type Registry (${noRow.length}):**`);
if (noRow.length) { out.push(''); for (const f of noRow) out.push(`- ${f}`); } else out.push(' none.');
out.push('');
out.push(`**Files git cannot add (${unsafe.length}):**${unsafe.length ? '' : ' none.'}`);
if (unsafe.length) { out.push(''); for (const u of unsafe.slice(0, 20)) out.push(`- ${u}`); if (unsafe.length > 20) out.push(`- and ${unsafe.length - 20} more`); }
out.push('');
out.push('**Proposed, not applied:**');
const gap = failing.find(([k]) => k !== '(unmapped)');
if (gap) out.push(`- For the largest gap in a mapped family (${gap[0]}), run \`node 30_Order/System/vault-lint/vault-lint.js --family ${gap[0]} --list 20\` and fix the top reason by hand.`);
if (errs.length) out.push('- Resolve each kit error above before the next Standard change.');
if (withoutFiles.length) out.push('- For each family with no notes, confirm the Standard is still needed or that its `match.path` still points at real notes.');
if (noRow.length) out.push('- For each file with no registry row, add a row to the Note Type Registry or link it from an existing row.');
if (unsafe.length) out.push('- Remove or rename each file git cannot add before the next git-auto-sync run (a reserved name needs the `\\\\?\\` form of its path to delete), because one such file stops the sync.');
if (!failing.length && !errs.length && !withoutFiles.length && !noRow.length && !unsafe.length) out.push('- Nothing to propose.');
console.log(out.join('\n'));
