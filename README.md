# README

系统同步配置 `sys-sync` 项目放置路径

```bash
 /data/data-exchange/sync/public/sys-sync
├── 󰊢 .gitignore
├──  config-sync
│   ├──  .config
│   ├── 󱆃 .zshenv
│   ├──  etc
│   ├──  stow-off.sh
│   └──  stow-on.sh
├──  LICENSE
└── 󰂺 README.md
```

## 基本依赖
- btrfs-progs               默认 arch 没有安装此包，不安装有 no fsck helpers found
- udiskie
- ntfs-3g

## 网络与软件源

网络

- dhcpc
- iwd
    - systemctl enable --now dhcpcd iwd
- networkmanager
    - systemctl enable --now iwd            使用 nm+iwd 即可，dhcpcd与nm不兼容
    ```bash
    sudo mkdir -p /etc/NetworkManager/conf.d
    sudo nano /etc/NetworkManager/conf.d/wifi_backend.conf # 配置iwd作为nm 后端

    [device]
    wifi.backend=iwd

    sudo systemctl disable --now wpa_supplicant # nm 默认是依赖wpa的，卸载不了，移除服务
    ps -ef | grep -E 'iwd|wpa_supplicant' # 查看是否使用 iwd作为后端
    ```
    - nmcli
    - nmtui
    - network-manager-applet # nm-applet &

- v2raya                    v2ray front
    - systemctl enable --now v2raya

- net-tools                     使用 ifconfig等工具
cn源

- archlinuxcn-keyring       archlinux china source

## 音频

- pipewire                      音频/视频核心
- pipewire-jack                 兼容 jack 
- pipewire-pulse                兼容 pulseaudio
- pipewire-alsa                 alsa 走 pipewire
- wireplumber                   会话管理
    - systemctl --user enable start pipewire pipewire-pulse wireplumber 
- alsa-utils                    声卡工具（可选，使用 alsamixer 控制音量，使用 aplay -L 查看声卡）
- pavucontrol                   基于gtk 的 gui 管理音量（可选）


## 字体与输入法

- noto-fonts
- noto-fonts-cjk

- fcitx5-im
    - 
    - only install fcitx5
- fcitx5-chinese-addons

## 蓝牙

- bluez
    - systemctl enable --now bluetooth
- bluez-utils
- blueman

## 显卡（nvidia）

驱动

- linux-headers
- nvidia-open
- nvidia-utils

硬件编解码

- libva-nvidia-driver       硬件视频解码器
- vulkan-icd-loader         vulkan 支持,游戏相关
- nvidia-settings           图形化设置
- lib32-nvidia-utils        可选，游戏相关

> 笔记本额外安装 optimus 用以切换显卡

> 显卡相关安装完后需要重启

## 通用

- zsh                       shell
  - starship                通用 prompt 配置 https://starship.rs/zh-CN/
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
- bluetui                   蓝牙管理tui
- pulsemixer                音频管理tui
- lazygit                   git管理tui
- serie                     git commit tui
- btop                      进程管理tui
- isd                       systemd tui
- impala                    iwctl tui
- calcurse                  TUI 日历
- wofi                      程序起动器
- fuzzel                    程序起动器
- wl-paste
- cliphist
- speech-dispatcher         语音合成相关，firefox使用
- fastfetch

- qbittorrant-nox     web界面，systemctl start qbittorrant-nox 启动，软件安装过程中会自动创建 qbt 用户
- syncthing
- kleopatra
- brightnessctl       亮度控制
- ddcutil             ddc接口显示器亮度控制

- mpd                 音乐播放服务器守护进程
- ncmpcpp             TUI 客户端
- mpc                 CLI 客户端
- ymuse               GUI 客户端

- less

- lua
- openssh
- git


## hypr 生态
- waybar                    状态栏
- hyprland                  窗口管理器
- hyprpaper                 壁纸
- hyprpolkitagent           权限认证
- hyprlock                  锁屏
- hypridle                  idel
- hyprshot                  截图
- xdg-desktop-portal          接口
- xdg-desktop-portal-hyprland 实现
- aur/xdg-desktop-portal-termfilechooser-hunkyburrito-git
    - firefox about:config xdg-desktop-portal.file-picker 修改为1
    - systemctl --user restart xdg-desktop-portal.service
## aur 软件包

- zotero                    文献管理
- wechat                    微信
- QQ                        qq

---

`/etc/systemd/logind.conf` 配置笔记本盒盖关机
```conf
# 笔记本合盖即关机
HandleLidSwitch=lock
HandleLidSwitchExternalPower=lock
HandleLidSwitchDocked=ignore
```

idea 缩放问题

`/opt/dev-kit/jetbrain/idea-IC-252.28539.33/bin`编辑

```idea64.vmoptions
-Dsun.java2d.uiScale.enabled=true
-Dawt.toolkit.name=WLToolkit
```
> 目前使用 idea 25.2 版本上述解决方式输入法将无法切换中文，使用官方源的包安装后能正常运行输入法

微信缩放问题

```~/.Xresources

! https://wiki.archlinux.org/title/HiDPI#X_Resources
Xft.dpi: 256

! These might also be useful depending on your monitor and personal preference:
Xft.autohint: 0
Xft.lcdfilter:  lcddefault
Xft.hintstyle:  hintfull
Xft.hinting: 1
Xft.antialias: 1
Xft.rgba: rgb
```

```bash
# 安装 x11 依赖
sudo pacman -S xorg-xrdb
exec-once = xrdb -merge ~/.Xresources
```

qt与 wayland
sudo pacman -S qt5-wayland qt6-wayland
