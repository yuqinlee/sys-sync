# FHS config for software by xdg-ninja
function wget() {
    command wget --hsts-file="$XDG_DATA_HOME/wget/wget-hsts" "$@"
}

# yazi wrapper
function f() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd <"$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
}

# proxy config based v2ray
pon() {
    export http_proxy="http://127.0.0.1:20171"
    export https_proxy="http://127.0.0.1:20171"
    export ALL_PROXY="socks5://127.0.0.1:20170"
}
pof() {
    unset http_proxy https_proxy ALL_PROXY
}
PROXY_ICON_ON=""  # nf-fa-globe
PROXY_ICON_OFF="" # nf-md-lan_disconnect
proxy_status() {
    if [[ -n "$http_proxy" || -n "$HTTP_PROXY" ]]; then
        echo "%F{green}$PROXY_ICON_ON%f"
    else
        echo "%F{red}$PROXY_ICON_OFF%f"
    fi
}
precmd() {
    RPROMPT="$(proxy_status)"
}

# conda lazy load
_conda_lazy_load() {
    unset -f conda
    local conda_sh="/opt/conda/miniconda3/etc/profile.d/conda.sh"
    if [ -f "$conda_sh" ]; then
        . "$conda_sh"
        conda "$@"
    else
        echo "ERROR: Conda start script not found [$conda_sh]" >&2
        return 127
    fi
}
conda() {
    _conda_lazy_load "$@"
}
