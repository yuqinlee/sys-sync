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

## 系统安装

- btrfs-progs               默认 arch 没有安装此包，不安装有 no fsck helpers found

- udiskie
- ntfs-3g
- wl-paste
- cliphist
- speech-dispatcher         语音合成相关，firefox使用

## 网络与软件源

网络

- dhcpc
- iwd
    - systemctl enable --now dhcpcd iwd
-networkmanager
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

---

- syncthing
- kleopatra

---

lua
openssh
git
brightnessctl       亮度控制
ddcutil             ddc接口显示器亮度控制
xdg-desktop-portal   接口
xdg-desktop-portal-hyprland 实现
xdg-desktop-portal-termfilechooser yazi
aur/xdg-desktop-portal-termfilechooser-hunkyburrito-git

