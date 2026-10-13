#!/usr/bin/env bash
# 34-miniconda-jupyter-base.sh (Build 5, E6). Matches the Acer WSL: ~/miniconda3, conda-forge only, strict priority,
# auto_activate off, changeps1 off, env jupyter-base = python 3.12 + the nine packages from the Acer spec.
# Usage: 34-miniconda-jupyter-base.sh --estimate   (throwaway install under ~/.cache, dry-run solve, then removes it)
#        34-miniconda-jupyter-base.sh --install    (real install; backs up ~/.condarc and ~/.bashrc first; runs `conda init bash`)
set -euo pipefail
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin"
URL=https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
PKGS=(python=3.12 ipykernel ipywidgets numpy pandas pyarrow scipy scikit-learn matplotlib seaborn)
MODE="${1:---estimate}"
write_condarc() {
  cat > "$1" <<'RC'
channels:
  - conda-forge
channel_priority: strict
auto_activate: false
changeps1: false
RC
}
case "$MODE" in
  --estimate)
    W="$HOME/.cache/b5-conda-estimate"; rm -rf "$W"; mkdir -p "$W"; trap 'rm -rf "$W"' EXIT
    curl -fsSL -m 600 "$URL" -o "$W/mc.sh"
    echo "installer download: $(( $(stat -c %s "$W/mc.sh") / 1048576 )) MB"
    bash "$W/mc.sh" -b -p "$W/mc" >/dev/null
    echo "bare Miniconda installed size: $(du -sm "$W/mc" | cut -f1) MB"
    write_condarc "$W/condarc"
    CONDARC="$W/condarc" "$W/mc/bin/conda" create -n jb --dry-run --json --override-channels -c conda-forge "${PKGS[@]}" > "$W/solve.json" 2>"$W/solve.err" || { cat "$W/solve.err"; exit 1; }
    python3 - "$W/solve.json" <<'PY'
import json,sys
d=json.load(open(sys.argv[1])); a=d.get("actions",{}); f=a.get("FETCH",[]); l=a.get("LINK",[])
dl=sum(x.get("size",0) for x in f)/1048576
print(f"jupyter-base: {len(l)} packages to link, download {dl:.0f} MB (compressed), installed size about {dl*3.2:.0f} MB (3.2x rule of thumb)")
print("python:", next((x["version"] for x in l if x["name"]=="python"),"?"), "numpy:", next((x["version"] for x in l if x["name"]=="numpy"),"?"), "pandas:", next((x["version"] for x in l if x["name"]=="pandas"),"?"))
PY
    echo "target disk: / inside the VHDX (901 GiB free). Throwaway files removed."
    ;;
  --install)
    [ -d "$HOME/miniconda3" ] && { echo "~/miniconda3 already exists: stop"; exit 1; }
    TS=$(date +%Y%m%d-%H%M%S); BK="$HOME/.config/.toolkit-backups/conda-$TS"; mkdir -p "$BK"
    [ -f "$HOME/.condarc" ] && cp -p "$HOME/.condarc" "$BK/"; cp -p "$HOME/.bashrc" "$BK/"
    T=$(mktemp -d); trap 'rm -rf "$T"' EXIT
    curl -fsSL -m 600 "$URL" -o "$T/mc.sh"; bash "$T/mc.sh" -b -p "$HOME/miniconda3"
    write_condarc "$HOME/.condarc"
    "$HOME/miniconda3/bin/conda" create -y -n jupyter-base --override-channels -c conda-forge "${PKGS[@]}"
    "$HOME/miniconda3/bin/conda" init bash
    mkdir -p "$HOME/conda/specs"; "$HOME/miniconda3/bin/conda" env export -n jupyter-base > "$HOME/conda/specs/jupyter-base.yml"
    echo "conda: $("$HOME/miniconda3/bin/conda" --version); envs:"; "$HOME/miniconda3/bin/conda" env list
    echo "backup: $BK ; spec: ~/conda/specs/jupyter-base.yml ; open a new shell to pick up conda init"
    ;;
  *) echo "usage: $0 --estimate | --install"; exit 2 ;;
esac
