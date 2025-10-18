# load alias
[ -f "$HOME/.config/.env-comm/alias.main.sh" ] && . "$HOME/.config/.env-comm/alias.main.sh"
# load function
[ -f "$HOME/.config/.env-comm/func.main.sh" ] && . "$HOME/.config/.env-comm/func.main.sh"
# load environment
# [ -f "$HOME/.config/.env-comm/env.main.sh" ] && . "$HOME/.config/.env-comm/env.main.sh"


# history setting
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
bindkey -v

# Download Znap, if it's not there yet.
PLUGIN_HOME="$XDG_CONFIG_HOME"/zsh/plugin
[[ -r  "$PLUGIN_HOME"/znap/znap.zsh ]] ||
git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git "$PLUGIN_HOME"/znap
source "$PLUGIN_HOME"/znap/znap.zsh  # Start Znap

zstyle ':znap:*' repos-dir "$PLUGIN_HOME"

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# fzf-tab
# it must be load before zsh-autosuggestions and so on
# run cmd: `fzf --zsh > "$XDG_CONFIG_HOME"/zsh/fzf.zsh` after installed fzf
# source `fzf.zsh` file
# ctrl+t: search file
# alt+c: search file and cd to dir
# ctrl+r: search history
znap source Aloxaf/fzf-tab
source "$XDG_CONFIG_HOME"/zsh/fzf.zsh


# base tools
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source zdharma-continuum/fast-syntax-highlighting

eval "$(zoxide init zsh --cmd cd)"
# nvm cotroller
# [ -z "$NVM_DIR" ] && export NVM_DIR="/opt/nvm"
# source /usr/share/nvm/nvm.sh
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec # old


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
conda deactivate
# # <<< conda initialize <<<
