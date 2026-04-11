# 自动激活/退出 Python venv
autoload -U add-zsh-hook

# 记录当前激活的 venv 路径
export _AUTO_VENV_PATH=""

auto_venv() {
    # 当前目录或父目录查找 .venv
    local venv_path=$(pwd)
    while [[ "$venv_path" != "/" ]]; do
        if [[ -d "$venv_path/.venv" ]]; then
            break
        fi
        venv_path=$(dirname "$venv_path")
    done

    # 找不到 .venv
    if [[ ! -d "$venv_path/.venv" ]]; then
        # 如果之前激活过，则退出
        if [[ -n "$VIRTUAL_ENV" ]]; then
            deactivate
            export _AUTO_VENV_PATH=""
        fi
        return
    fi

    # 如果已经激活的是当前 venv，就不重复操作
    if [[ "$_AUTO_VENV_PATH" == "$venv_path/.venv" ]]; then
        return
    fi

    # 如果已有别的 venv，先退出
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    fi

    # 激活新的
    source "$venv_path/.venv/bin/activate"
    export _AUTO_VENV_PATH="$venv_path/.venv"
}

add-zsh-hook chpwd auto_venv
auto_venv
