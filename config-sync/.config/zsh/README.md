# zsh

## zsh 配置文件定位

### 加载顺序

- /etc/zsh/zshenv
- $ZDOTDIR/.zshenv
- /etc/zsh/zprofile
- $ZDOTDIR/.zprofile
- /etc/zsh/zshrc
- $ZDOTDIR/.zshrc
- /etc/zsh/zlogin
- $ZDOTDIR/.zlogin

```shell
~/.config/zsh/
    .zshenv    # 仅环境变量
    .zprofile  # 登录初始化
    .zshrc     # 交互配置
```

### zshenv

所有 zsh 的实例都会加载,最早加载的 zsh 文件

- 交互 shell
- 非交互 shell（脚本）
- zsh -c
- scp/rsync 远程执行
- cron 中调用 zsh

适合存放

- 环境变量（export）
- ZDOTDIR 本身（如果你用它）
- PATH 基础拼接
- XDG 变量

例如

```shell
export EDITOR=nvim
export PAGER=less
export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$HOME/.local/bin:$PATH"
```

不要放任何复杂逻辑、插件、输出等,这些会污染非交互式环境

### zprofile

仅在登陆的 shell 加载 1 次,其触发时刻（当然，写入的环境变量是会在登陆后生效的）

- tty 登录
- ssh 登录
- 图形登录管理器（取决于系统）
- zsh -l

适合

- 登录时只需执行一次的初始化
- 启动图形会话（startx）
- 启动代理
- systemd user 相关
- keychain / gpg-agent 初始化

###  zshrc

仅在交互式 shell 启动触发

- 打开终端
- 新建 tab
- SSH 进入交互
- zsh（默认是交互）

