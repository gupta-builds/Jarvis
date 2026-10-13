# ~/.config/toolkit/env.sh - golden, Build 5b. Sourced from ~/.bashrc by ONE guarded line (TOOLKIT_ENV_BLOCK).
# Holds no secrets. Safe to source twice. Interactive shells only.
case $- in *i*) ;; *) return 0 2>/dev/null ;; esac

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/config"

if command -v fd >/dev/null 2>&1; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi
# Tokyo Night Storm colours for fzf
export FZF_DEFAULT_OPTS='--height=40% --layout=reverse --border --info=inline --color=fg:#c0caf5,bg:#24283b,hl:#7aa2f7,fg+:#c0caf5,bg+:#292e42,hl+:#7dcfff,info:#7aa2f7,prompt:#7dcfff,pointer:#bb9af7,marker:#9ece6a,spinner:#bb9af7,header:#565f89,border:#565f89'

# fzf shell integration (fzf >= 0.48): Ctrl-T files, Alt-C directories. Ctrl-R is left to atuin (FZF_CTRL_R_COMMAND= disables fzf's binding).
if command -v fzf >/dev/null 2>&1 && fzf --bash >/dev/null 2>&1; then
  FZF_CTRL_R_COMMAND= eval "$(fzf --bash)"
fi
