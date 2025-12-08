# README

系统同步配置 `sys-sync` 项目放置路径

```bash
~/.local/data/data-sync/public/sys-sync
```
```bash
sys-sync master ➜ tree -L 2
 .
├──  config-sync               # .config 配置文件
│   ├──  etc                   # /etc 配置文件
│   ├──  stow-off.sh           # 取消 stow 对 .config 的连接
│   └──  stow-on.sh            # 开启 stow 对 .config 的连接
├──  LICENSE
├──  package.list
├── 󰂺 README.md
└──  script-sync               # 系统使用的脚本
    └──  keepass.sh
```

## 通用

- zsh                       shell
    - starship              通用 prompt 配置 https://starship.rs/zh-CN/
- kitty                     终端模拟器
- foot                      终端模拟器
- neovim                    文本编辑器
- mpv                       视频播放器
- stow                      GNU stow
- fzf                       模糊查找
- eza                       文件与目录展示
- zoxide                    目录跳转
- yazi                      文件管理器
    - trash-cli             文件回收站
- keyd                      按键映射工具


## 窗口管理

- hyprland                  窗口管理器
- hyprpaper                 壁纸
- waybar                    状态栏

## TUI

- bluetui                   蓝牙管理tui
- pulsemixer                音频管理tui
- lazygit                   git管理tui
- serie                     git commit tui
- btop                      进程管理tui
- isd                       systemd tui
- impala                    iwctl tui
- wofi                      程序起动器
- fuzzel                    程序起动器

## aur 软件包

- zotero                    文献管理

