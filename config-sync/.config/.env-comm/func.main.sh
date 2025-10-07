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

[ -f "./func.opt.sh" ] && . "./func.opt.sh"
