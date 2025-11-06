# =============================================================================
#                       导入通用 shell 环境
# =============================================================================
[[ -s "$XDG_CONFIG_HOME/.env-comm/alias.main.sh" ]] && source "$XDG_CONFIG_HOME/.env-comm/alias.main.sh"
[[ -s "$XDG_CONFIG_HOME/.env-comm/func.main.sh"  ]] && source "$XDG_CONFIG_HOME/.env-comm/func.main.sh"

# =============================================================================
#                           基本设置
# =============================================================================
bindkey -v              # vim 模式
setopt AUTO_CD          # 自动切换目录
setopt AUTO_PARAM_SLASH # 自动补全路径
setopt CORRECT          # 启用命令自动纠错
setopt NOMATCH          # 展开通配符失败时报错
setopt NO_CASE_GLOB     # 忽略大小写匹配文件名

# =============================================================================
#                          历史记录设置
# =============================================================================
HISTFILE="$XDG_CACHE_HOME"/zsh/zsh_history  # 历史文件路径
HISTSIZE=1000                               # 当前 session 保存条数
SAVEHIST=1000                               # 写入文件的条数
HISTTIMEFORMAT="%F %T "                     # 启用带时间的历史记录
setopt HIST_REDUCE_BLANKS                   # 删除多余空格
setopt HIST_IGNORE_SPACE                    # 忽略以空格开头的命令
setopt HIST_IGNORE_DUPS                     # 忽略重复命令
setopt HIST_SAVE_NO_DUPS                    # 保存时去重
setopt HIST_VERIFY                          # 回车前先显示命令
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS                 # 删除旧的重复项
setopt APPEND_HISTORY                       # 追加历史
setopt EXTENDED_HISTORY                     # 扩展历史记录
setopt INC_APPEND_HISTORY                   # 命令执行后立即写入历史文件
setopt SHARE_HISTORY                        # 让不同终端共享历史

# =============================================================================
#                            插件 
# =============================================================================
PLUGIN_HOME="$XDG_CONFIG_HOME"/zsh/plugin
[[ -r  "$PLUGIN_HOME"/znap/znap.zsh ]] ||
git clone --depth 1 -- \
    https://github.com/marlonrichert/zsh-snap.git "$PLUGIN_HOME"/znap # Download Znap, if it's not there yet.
source "$PLUGIN_HOME"/znap/znap.zsh  # Start Znap
zstyle ':znap:*' repos-dir "$PLUGIN_HOME"

znap source zsh-users/zsh-completions
# fzf-tab
# it must be load before zsh-autosuggestions and so on
# run cmd: `fzf --zsh > "$XDG_CONFIG_HOME"/zsh/fzf.zsh` after installed fzf
# source "$XDG_CONFIG_HOME"/zsh/.fzf.zsh
# ctrl+t: search file
# alt+c: search file and cd to dir
# ctrl+r: search history
# ctrl+i: completions
znap source Aloxaf/fzf-tab      # fzf tab 补全
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source zdharma-continuum/fast-syntax-highlighting

# =============================================================================
#                       Prompt & 工具初始化
# =============================================================================
# prompt powered by starship instead `znap prompt romkatv/powerlevel10k`
znap eval startship "starship init zsh"         # starship
znap eval zoxide "zoxide init zsh --cmd cd"     # zoxide

# =============================================================================
#                       zsh 外部依赖
# =============================================================================
source "$XDG_CONFIG_HOME"/zsh/.fzf.zsh # fzf 按键绑定

