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
# gtk
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
# calc
export CALCHISTFILE="$XDG_CACHE_HOME"/calc_history
# texlive
export TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
# gnupg
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
export PYTHON_HISTORY="$XDG_STATE_HOME"/python/history # python v3.13.0a3 or later
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc 
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
# npm & nvm
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc 
export NPM_CONFIG_INIT_MODULE="$XDG_CONFIG_HOME"/npm/config/npm-init.js
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export NVM_DIR="$XDG_DATA_HOME"/nvm
# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship/starship.toml
# cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
# ffmpeg
export FFMPEG_DATADIR="$XDG_CONFIG_HOME"/ffmpeg
# java
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
# jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# kde
export KDEHOME="$XDG_CONFIG_HOME"/kde

# source out env
SCRIPT_DIR=$(cd "$(dirname "$0")" || exit 1; pwd)

[ -f "$SCRIPT_DIR/env.opt.sh" ] && . "$SCRIPT_DIR/env.opt.sh"

