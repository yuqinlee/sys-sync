# environment variables of system inner

# sys editor
export EDITOR='/usr/bin/nvim'

# XDG config env
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_PICTURES_DIR=$HOME/Pictures
export XDG_RUNTIME_DIR=/run/user/$UID

# FHS config for software by xdg-ninja
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

[ -f "./env.opt.sh" ] && . "./env.opt.sh"

