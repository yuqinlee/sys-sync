# >>> conda lazy load >>>
_conda_lazy_load() {
    unset -f conda
    local conda_sh="/opt/conda/miniconda3/etc/profile.d/conda.sh"
    if [ -f "$conda_sh" ]; then
        . "$conda_sh"
        conda "$@"
    else
        echo "Conda not found at $conda_sh" >&2
        return 127
    fi
}
conda() {
    _conda_lazy_load "$@"
}
# <<< conda lazy load <<<

# nvm cotroller
# [ -z "$NVM_DIR" ] && export NVM_DIR="/opt/nvm"
# source /usr/share/nvm/nvm.sh
# source /usr/share/nvm/bash_completion
# source /usr/share/nvm/install-nvm-exec # old

