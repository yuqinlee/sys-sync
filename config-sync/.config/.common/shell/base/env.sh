# java
export JAVA_HOME=$(mise where java)
export PATH=$JAVA_HOME/bin:$PATH

# maven
export MAVEN_HOME=$(mise where maven)
export M2_HOME=$MAVEN_HOME
export PATH=$MAVEN_HOME/bin:$PATH
export MAVEN_REPOSITORY=$MAVEN_HOME/../maven-repository

# brew
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_API_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles/api"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
