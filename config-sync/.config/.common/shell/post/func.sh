# yazi wrapper
function f() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    command yazi "$@" --cwd-file="$tmp"
    IFS= read -r -d '' cwd <"$tmp"
    [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
    rm -f -- "$tmp"
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
