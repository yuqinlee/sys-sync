# =============================================================================
#                       导入通用 shell 环境
# =============================================================================
[[ -s "$XDG_CONFIG_HOME/.common/shell/alias.main.sh" ]] && source "$XDG_CONFIG_HOME/.common/shell/alias.main.sh"
[[ -s "$XDG_CONFIG_HOME/.common/shell/func.main.sh" ]] && source "$XDG_CONFIG_HOME/.common/shell/func.main.sh"

# =============================================================================
#                           基本设置
# =============================================================================
bindkey -v              # vi 模式
export KEYTIMEOUT=1     # vi 模式配置后不会有延迟
setopt AUTO_CD          # 自动切换目录
setopt AUTO_PARAM_SLASH # 自动补全路径
setopt CORRECT          # 启用命令自动纠错
setopt NOMATCH          # 展开通配符失败时报错
setopt NO_CASE_GLOB     # 忽略大小写匹配文件名

# =============================================================================
#                          历史记录设置
# =============================================================================
HISTFILE="$XDG_CACHE_HOME"/zsh/zsh_history # 历史文件路径
HISTSIZE=1000                              # 当前 session 保存条数
SAVEHIST=1000                              # 写入文件的条数
setopt HIST_REDUCE_BLANKS                  # 删除多余空格
setopt HIST_IGNORE_SPACE                   # 忽略以空格开头的命令
setopt HIST_SAVE_NO_DUPS                   # 保存时去重
setopt HIST_VERIFY                         # 回车前先显示命令
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS # 删除旧的重复项
setopt APPEND_HISTORY       # 追加历史
setopt EXTENDED_HISTORY     # 扩展历史记录
setopt INC_APPEND_HISTORY   # 命令执行后立即写入历史文件

# =============================================================================
#                              补全
# =============================================================================
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION           # 指定 zcompdump 缓存目录，补全函数索引缓存
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache # 指定运行期缓存，只影响补全阶段
zstyle ':completion:*:git-checkout:*' sort false                   # disable sort when completing `git checkout`
zstyle ':completion:*:descriptions' format '[%d]'                  # set descriptions format to enable group support, %d = description
zstyle ':completion:*' format '%F{cyan}%d%f'                       # 设置分组标题颜色

# > 原生补全已使用 fzf-tab 代替
# zmodload zsh/complist                                             # 提供交互式菜单,支持 `menuselect` keymap
# zstyle ':completion:*' menu select                                #  启用菜单补全，需要 complist 支持
# bindkey '^I' menu-complete                                        # ^I = TAB
# bindkey -M menuselect 'h' backward-char
# bindkey -M menuselect 'l' forward-char
# bindkey -M menuselect 'j' down-line-or-history
# bindkey -M menuselect 'k' up-line-or-history
zstyle ':completion:*' menu no # force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix

# =============================================================================
#                            插件
# =============================================================================
PLUGIN_HOME="$XDG_CONFIG_HOME"/zsh/plugin
if [[ ! -f "$PLUGIN_HOME/znap/znap.zsh" ]]; then
    # Download Znap, if it's not there yet.
    git clone --depth 1 \
        https://github.com/marlonrichert/zsh-snap.git \
        "$PLUGIN_HOME/znap"
fi
source "$PLUGIN_HOME"/znap/znap.zsh       # Start Znap
zstyle ':znap:*' repos-dir "$PLUGIN_HOME" # 为 Znap 设定仓库存储路径

# zsh-completions
# > enhance build-in completion
znap source zsh-users/zsh-completions

# fzf-tab
# > completion-ui for completion
# > 1. it must be load before zsh-autosuggestions and so on
# > 2. run cmd: `fzf --zsh > "$XDG_CONFIG_HOME"/zsh/external/fzf.zsh` after installed fzf
# > 3. source "$XDG_CONFIG_HOME"/zsh/.fzf.zsh
znap source Aloxaf/fzf-tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath' # preview directory's content with eza when completing cd
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2                              # custom fzf flags `fzf-flags --color=fg:1,fg+:2 --bind=tab:accept` 则使用 tab 选择
zstyle ':fzf-tab:*' use-fzf-default-opts yes                                  # To make fzf-tab follow FZF_DEFAULT_OPTS.
zstyle ':fzf-tab:*' switch-group '<' '>'                                      # switch group using `<` and `>`
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup                                # If you're using tmux >= 3.2, we provide a script ftb-tmux-popup to make full use of it's "popup" feature.

# zsh-autosuggestions
# > completion a line command totally
znap source zsh-users/zsh-autosuggestions

# zsh-history-substring-search
# > substring match in history
znap source zsh-users/zsh-history-substring-search
bindkey -M viins '^K' history-substring-search-up
bindkey -M viins '^J' history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# fast-syntax-highlighting
znap source zdharma-continuum/fast-syntax-highlighting

# =============================================================================
#                       Prompt & 终端工具增强
# =============================================================================
# prompt powered by starship instead `znap prompt romkatv/powerlevel10k`
znap eval startship "starship init zsh"     # starship
znap eval zoxide "zoxide init zsh --cmd cd" # zoxide

# fzf keybind
# > ctrl+t search file
# > alt+c  search file and cd to dir
# > ctrl+r search history
# > ctrl+i completions
source "$XDG_CONFIG_HOME"/zsh/external/fzf.zsh
