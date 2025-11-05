# 导入通用 shell 环境
# load alias
[[ -f "$HOME/.config/.env-comm/alias.main.sh" ]] && source "$HOME/.config/.env-comm/alias.main.sh"
# load function
[[ -f "$HOME/.config/.env-comm/func.main.sh" ]] && source "$HOME/.config/.env-comm/func.main.sh"

# 历史记录设置
HISTFILE="$XDG_CACHE_HOME"/zsh/zsh_history # 历史文件路径
HISTSIZE=1000         # 当前 session 保存条数
SAVEHIST=1000         # 写入文件的条数
setopt APPEND_HISTORY
setopt HIST_FIND_NO_DUPS
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS       # 忽略重复命令
setopt HIST_IGNORE_ALL_DUPS   # 删除旧的重复项
setopt HIST_IGNORE_SPACE      # 忽略以空格开头的命令
setopt HIST_SAVE_NO_DUPS      # 保存时去重
setopt HIST_REDUCE_BLANKS     # 删除多余空格
setopt HIST_VERIFY            # 回车前先显示命令
setopt INC_APPEND_HISTORY     # 命令执行后立即写入历史文件
setopt SHARE_HISTORY          # 让不同终端共享历史

# 基本设置
bindkey -v              # vim 模式
setopt CORRECT          # 启用命令自动纠错
setopt AUTO_CD          # 自动切换目录
setopt AUTO_PARAM_SLASH # 自动补全路径
setopt NOMATCH          # 展开通配符失败时报错
setopt NO_CASE_GLOB     # 忽略大小写匹配文件名

# plugin manager
PLUGIN_HOME="$XDG_CONFIG_HOME"/zsh/plugin
[[ -r  "$PLUGIN_HOME"/znap/znap.zsh ]] ||
git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git "$PLUGIN_HOME"/znap # Download Znap, if it's not there yet.
source "$PLUGIN_HOME"/znap/znap.zsh  # Start Znap

zstyle ':znap:*' repos-dir "$PLUGIN_HOME"

# `znap prompt` makes your prompt visible in just 15-40ms!
znap prompt sindresorhus/pure

# fzf-tab
# it must be load before zsh-autosuggestions and so on
# run cmd: `fzf --zsh > "$XDG_CONFIG_HOME"/zsh/fzf.zsh` after installed fzf
# source "$XDG_CONFIG_HOME"/zsh/fzf.zsh
# ctrl+t: search file
# alt+c: search file and cd to dir
# ctrl+r: search history
# ctrl+i: completions
znap source Aloxaf/fzf-tab
source "$XDG_CONFIG_HOME"/zsh/fzf.zsh

# base tools
znap source zsh-users/zsh-completions
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source zdharma-continuum/fast-syntax-highlighting

eval "$(zoxide init zsh --cmd cd)"

