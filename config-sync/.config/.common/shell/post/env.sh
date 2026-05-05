# ==============================================================================
#                           system base tools
# ==============================================================================
# sys editor
export EDITOR='nvim'

# ==============================================================================
#                               proxy config
# ==============================================================================
# proxy config based v2ray
PROXY_ICON_ON=""  # nf-fa-globe
PROXY_ICON_OFF="" # nf-md-lan_disconnect
pon() {
    export http_proxy="http://127.0.0.1:20171"
    export https_proxy="http://127.0.0.1:20171"
    export ALL_PROXY="socks5://127.0.0.1:20170"
}
pof() {
    unset http_proxy https_proxy ALL_PROXY
}
proxy_status() {
    if [[ -n "$http_proxy" || -n "$HTTP_PROXY" ]]; then
        echo "%F{green}$PROXY_ICON_ON%f"
    else
        echo "%F{red}$PROXY_ICON_OFF%f"
    fi
}
_update_proxy_prompt() {
    RPROMPT="$(proxy_status)"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_proxy_prompt

# ==============================================================================
#                               brew config
# ==============================================================================
# brew
export PATH=/opt/homebrew/bin:$PATH
# 用API拉取数据替代Git拉仓库以减少依赖 update
export HOMEBREW_INSTALL_FROM_API=1
bcn() {
    # bottle 国内源
    export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
    export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
    export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
    export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
}
bcom() {
    # Homebrew 官方源配置
    export HOMEBREW_API_DOMAIN="https://formulae.brew.sh/api"
    export HOMEBREW_BOTTLE_DOMAIN="https://ghcr.io/v2/homebrew/core"
    export HOMEBREW_BREW_GIT_REMOTE="https://github.com/Homebrew/brew"
    export HOMEBREW_CORE_GIT_REMOTE="https://github.com/Homebrew/homebrew-core"
}
# 关闭自动更新防止每次 install 更新
export HOMEBREW_NO_AUTO_UPDATE=1
# 并行编译对于从源码编译软件提升
if [[ "$OSTYPE" == linux-gnu* ]]; then
    HOMEBREW_MAKE_JOBS=$(nproc)
else
    HOMEBREW_MAKE_JOBS=$(sysctl -n hw.ncpu)
fi
export HOMEBREW_MAKE_JOBS
# 关闭提示信息
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_ANALYTICS=1
# 自动清理旧版本节省空间
export HOMEBREW_INSTALL_CLEANUP=1
# 关闭 emoji 🍺 显示
export HOMEBREW_NO_EMOJI=1
# 对于自动更新的、latest 等软件纳入更新
export HOMEBREW_UPGRADE_GREEDY=1

# ==============================================================================
#                               dev tools
# ==============================================================================
# java
if JAVA_HOME=$(mise where java) >/dev/null 2>&1; then
    export JAVA_HOME
    export PATH=$JAVA_HOME/bin:$PATH
fi

# maven
if MAVEN_VER=$(mise where maven) >/dev/null 2>&1; then
    MAVEN_HOME=$(find "$MAVEN_VER" -maxdepth 1 -type d -name 'apache-maven-*' | head -1)
    export MAVEN_HOME
    export M2_HOME=$MAVEN_HOME
    export PATH=$MAVEN_HOME/bin:$PATH
    export MAVEN_REPOSITORY=$XDG_DATA_HOME/maven/repository
fi
