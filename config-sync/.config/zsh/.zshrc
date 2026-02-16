# =============================================================================
#                       导入通用 shell 环境
# =============================================================================
[[ -s "$XDG_CONFIG_HOME/.common/shell/alias.main.sh" ]] && source "$XDG_CONFIG_HOME/.common/shell/alias.main.sh"
[[ -s "$XDG_CONFIG_HOME/.common/shell/func.main.sh"  ]] && source "$XDG_CONFIG_HOME/.common/shell/func.main.sh"

# =============================================================================
#                           基本设置
# =============================================================================
bindkey -v                                  # vim 模式
export KEYTIMEOUT=1                         # 使用 vi 模式配置后不会有延迟
setopt AUTO_CD                              # 自动切换目录
setopt AUTO_PARAM_SLASH                     # 自动补全路径
setopt CORRECT                              # 启用命令自动纠错
setopt NOMATCH                              # 展开通配符失败时报错
setopt NO_CASE_GLOB                         # 忽略大小写匹配文件名

# =============================================================================
#                          历史记录设置
# =============================================================================
HISTFILE="$XDG_CACHE_HOME"/zsh/zsh_history  # 历史文件路径
HISTSIZE=1000                               # 当前 session 保存条数
SAVEHIST=1000                               # 写入文件的条数
setopt HIST_REDUCE_BLANKS                   # 删除多余空格
setopt HIST_IGNORE_SPACE                    # 忽略以空格开头的命令
setopt HIST_SAVE_NO_DUPS                    # 保存时去重
setopt HIST_VERIFY                          # 回车前先显示命令
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS                 # 删除旧的重复项
setopt APPEND_HISTORY                       # 追加历史
setopt EXTENDED_HISTORY                     # 扩展历史记录
setopt INC_APPEND_HISTORY                   # 命令执行后立即写入历史文件

# =============================================================================
#                          补全
# =============================================================================
# autoload -Uz compinit
# compinit
# zmodload zsh/complist
# zstyle ':completion:*' menu select
# zstyle ':completion:*' format '%F{cyan}%d%f'
#
# bindkey -M menuselect 'h' backward-char
# bindkey -M menuselect 'l' forward-char
# bindkey -M menuselect 'j' down-line-or-history
# bindkey -M menuselect 'k' up-line-or-history
#
# bindkey '^I' menu-complete
#
# > 原生补全使用 fzf 代替

# =============================================================================
#                            插件 
# =============================================================================
# Download Znap, if it's not there yet.
PLUGIN_HOME="$XDG_CONFIG_HOME"/zsh/plugin
if [[ ! -f "$PLUGIN_HOME/znap/znap.zsh" ]]; then
  git clone --depth 1 https://github.com/marlonrichert/zsh-snap.git "$PLUGIN_HOME/znap"
fi
source "$PLUGIN_HOME"/znap/znap.zsh  # Start Znap
zstyle ':znap:*' repos-dir "$PLUGIN_HOME"

# znap source zsh-users/zsh-completions

# fzf-tab
# 1. it must be load before zsh-autosuggestions and so on
# 2. run cmd: `fzf --zsh > "$XDG_CONFIG_HOME"/zsh/external/fzf.zsh` after installed fzf
# 3. source "$XDG_CONFIG_HOME"/zsh/.fzf.zsh
znap source Aloxaf/fzf-tab      # fzf tab 补全
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
# If you're using tmux >= 3.2, we provide a script ftb-tmux-popup to make full use of it's "popup" feature.
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

# znap source zsh-users/zsh-autosuggestions
# znap source zsh-users/zsh-history-substring-search
znap source zdharma-continuum/fast-syntax-highlighting

# =============================================================================
#                       Prompt & 工具初始化
# =============================================================================
# prompt powered by starship instead `znap prompt romkatv/powerlevel10k`
znap eval startship "starship init zsh"         # starship
znap eval zoxide "zoxide init zsh --cmd cd"     # zoxide

# =============================================================================
#                           zsh 外部依赖
# =============================================================================
# ctrl+t: search file
# alt+c: search file and cd to dir
# ctrl+r: search history
# ctrl+i: completions
source "$XDG_CONFIG_HOME"/zsh/external/fzf.zsh # fzf 按键绑定

