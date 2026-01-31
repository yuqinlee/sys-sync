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
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
# cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# donet
export DOTNET_CLI_HOME="$XDG_DATA_HOME"/dotnet
# go
export GOPATH="$XDG_DATA_HOME"/go
# libice
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
# python
export PYTHON_HISTORY="$XDG_CACHE_HOME"/python # python v3.13.0a3 or later
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc 
# npm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc 
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship/starship.toml

# source out env
SCRIPT_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)

[ -f "$SCRIPT_DIR/env.opt.sh" ] && . "$SCRIPT_DIR/env.opt.sh"

