# lazygit
alias lg='lazygit'

# fastfetch
alias ff='fastfetch'

# eza
alias ls='eza -Bbh --icons=auto'
alias l='eza -lBbgh --icons=auto'
alias ll='eza -lBbgha --icons=auto'
alias tree="exa --tree --icons"

# python
alias py='python'

SCRIPT_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)

[ -f "$SCRIPT_DIR/alias.opt.sh" ] && . "$SCRIPT_DIR/alias.opt.sh"

