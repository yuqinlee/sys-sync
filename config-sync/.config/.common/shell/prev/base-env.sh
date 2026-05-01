# environment variables for base system
#
# @author: yuchin
# @version: 2026/04/25

# ==============================================================================
#                           System base tools
# ==============================================================================
# sys editor
export EDITOR='nvim'

# ==============================================================================
#                                   XDG
# ==============================================================================
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_DESKTOP_DIR="$HOME"/Desktop
export XDG_DOWNLOAD_DIR="$HOME"/Downloads
export XDG_TEMPLATES_DIR="$HOME"/Templates
export XDG_PUBLICSHARE_DIR="$HOME"/Public
export XDG_DOCUMENTS_DIR="$HOME"/Documents
export XDG_MUSIC_DIR="$HOME"/Music
export XDG_PICTURES_DIR="$HOME"/Pictures
export XDG_VIDEOS_DIR="$HOME"/Videos
export XDG_RUNTIME_DIR=/run/user/$UID
# ==============================================================================
#                           FHS config for software
# ==============================================================================
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
export PATH="$CARGO_HOME"/bin:$PATH
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
# volta
export VOLTA_HOME="$XDG_DATA_HOME"/volta
export PATH="$VOLTA_HOME"/bin:"$PATH"
# starship
export STARSHIP_CONFIG="$XDG_CONFIG_HOME"/starship/starship.toml
# cuda
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
# ffmpeg
export FFMPEG_DATADIR="$XDG_CONFIG_HOME"/ffmpeg
# java
# export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
# jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# kde
export KDEHOME="$XDG_CONFIG_HOME"/kde
# uv
export UV_TOOL_BIN_DIR="$XDG_DATA_HOME"/uv/bin
export UV_PYTHON_BIN_DIR="$XDG_DATA_HOME"/uv/bin
export UV_TOOL_DIR="$XDG_DATA_HOME"/uv/tools
export UV_PYTHON_INSTALL_DIR="$XDG_DATA_HOME"/uv/python
export PATH="$PATH":"$XDG_DATA_HOME"/uv/bin
# kimi
export KIMI_SHARE_DIR="$XDG_STATE_HOME"/kimi
