# FHS config for software by xdg-ninja
function wget() {
    command wget --hsts-file="$XDG_DATA_HOME/wget-hsts" "$@"
}

# yazi wrapper
function f() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd" || exit
    fi
    rm -f -- "$tmp"
}

# proxy config based v2ray
proxy_on() {
    export http_proxy="http://127.0.0.1:20171"
    export https_proxy="http://127.0.0.1:20171"
    export ALL_PROXY="socks5://127.0.0.1:20170"
}

proxy_off() {
    unset http_proxy https_proxy ALL_PROXY
}
# 在右侧显示代理状态
PROXY_ICON_ON=""     # nf-fa-globe
PROXY_ICON_OFF=""    # nf-md-lan_disconnect
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

[ -f "./func.opt.sh" ] && . "./func.opt.sh"
