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

