# java
JAVA_HOME=$(mise where java)
export JAVA_HOME
export PATH=$JAVA_HOME/bin:$PATH

# maven
MAVEN_HOME=$(mise where maven)
export MAVEN_HOME
export M2_HOME=$MAVEN_HOME
export PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_REPOSITORY=$XDG_DATA_HOME/maven/repository

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
HOMEBREW_MAKE_JOBS=$(sysctl -n hw.ncpu)
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
