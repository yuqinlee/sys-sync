# ==============================================================================
#             				uchin zsh config
# ==============================================================================
# zsh-plugins:
# 		- zsh-autosuggestions
# 		- zsh-syntax-highlighting
# 
# dependencies：
# 		- lazygit
# 		- yazi
# 
# dependencies-opt：
# 		- VSCode
# 
# ==============================================================================

# ==============================================================================
# Chapter1. system base config and zsh config
# ==============================================================================
# alias
# alias ls='ls --color=auto'
# alias ll='ls -lah --color=auto'
# alias l='ls -lh --color=auto'

# ==============================================================================
# Chapter2. zsh config
# ==============================================================================
# enable color
autoload -U colors && colors

# prompt config
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[green]%}%1|%~ %{$reset_color%}%#>"
# return last command status on line tail
RPROMPT="[%{$fg_bold[yellow]%}%?%{$reset_color%}]"

export TERM="xterm-256color"

#  plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ==============================================================================
# Chater3. config for dependencies
# ==============================================================================
# alias dependencies by pacman
alias lg='/usr/bin/lazygit'
alias ff='fastfetch'

alias ls='eza -Bbh --icons=auto'
alias l='eza -lBbgh --icons=auto'
alias ll='eza -lBbgha --icons=auto'

# dependencies for /opt
# alias code='/opt/code/VSCode/bin/code --ozone-platform-hint=auto --enable-wayland-ime'

export EDITOR='/usr/bin/nvim'

# java
export JAVA_HOME='/opt/java/jdk-24.0.2'
export PATH=$JAVA_HOME/bin:$PATH

# maven
export MAVEN_HOME='/opt/maven/apache-maven-3.9.9'
export PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_REPOSITORY='/opt/maven/maven-repository'

# XDG config env
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID

export XDG_PICTURES_DIR=$HOME/Pictures

export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history

export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export GVIMINIT='let $MYGVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/gvimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYGVIMRC'
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.lua" | so $MYVIMRC'

export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# yazi wrapper
function f() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# nvm cotroller
[ -z "$NVM_DIR" ] && export NVM_DIR="/opt/nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
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
