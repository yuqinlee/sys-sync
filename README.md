# README

系统同步配置 `sys-sync` 项目放置路径

```bash
/data/data-exchange/sync/public/sys-sync
├── .gitignore
├── config-sync
│   ├── .config
│   ├── .zshenv
│   ├── etc
│   ├── stow-off.sh
│   └── stow-on.sh
├── LICENSE
└── README.md
```

## 新增用户

```bash
sudo useradd -u 1024 -g 1024 -m -s /bin/zsh yuchin
sudo usermod -aG wheel yuchin
sudo passwd yuchin
```

## 基本依赖

- btrfs-progs 默认 arch 没有安装此包，不安装有 no fsck helpers found
- udiskie
- ntfs-3g

## 网络与软件源

网络

- dhcpc
- iwd
  - systemctl enable --now dhcpcd iwd
- networkmanager
  - systemctl enable --now iwd 使用 nm+iwd 即可，dhcpcd与nm不兼容

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

- v2raya v2ray front
  - systemctl enable --now v2raya

- net-tools 使用 ifconfig等工具
  cn源

- archlinuxcn-keyring archlinux china source

## 音频

- pipewire 音频/视频核心
- pipewire-jack 兼容 jack
- pipewire-pulse 兼容 pulseaudio
- pipewire-alsa alsa 走 pipewire
- wireplumber 会话管理
  - systemctl --user enable start pipewire pipewire-pulse wireplumber
- alsa-utils 声卡工具（可选，使用 alsamixer 控制音量，使用 aplay -L 查看声卡）
- pavucontrol 基于gtk 的 gui 管理音量（可选）

## 字体与输入法

- noto-fonts
- noto-fonts-cjk

- ## fcitx5-im
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

- libva-nvidia-driver 硬件视频解码器
- vulkan-icd-loader vulkan 支持,游戏相关
- nvidia-settings 图形化设置
- lib32-nvidia-utils 可选，游戏相关

> 笔记本额外安装 optimus 用以切换显卡

> 显卡相关安装完后需要重启

## 通用

- zsh shell
  - starship 通用 prompt 配置 https://starship.rs/zh-CN/
- kitty 终端模拟器
- foot 终端模拟器
- neovim 文本编辑器
- mpv 视频播放器
- stow GNU stow
- fzf 模糊查找
- eza 文件与目录展示
- zoxide 目录跳转
- yazi 文件管理器
  - trash-cli 文件回收站
- keyd 按键映射工具
- bluetui 蓝牙管理tui
- pulsemixer 音频管理tui
- lazygit git管理tui
- serie git commit tui
- btop 进程管理tui
- isd systemd tui
- impala iwctl tui
- calcurse TUI 日历
- wofi 程序起动器
- fuzzel 程序起动器
- wl-paste
- cliphist
- speech-dispatcher 语音合成相关，firefox使用
- fastfetch

- qbittorrant-nox web界面，systemctl start qbittorrant-nox 启动，软件安装过程中会自动创建 qbt 用户
- syncthing
- kleopatra
- brightnessctl 亮度控制
- ddcutil ddc接口显示器亮度控制

- mpd 音乐播放服务器守护进程
- ncmpcpp TUI 客户端
- mpc CLI 客户端
- ymuse GUI 客户端

- less

- lua
- openssh
- git

## hypr 生态

- waybar 状态栏
- hyprland 窗口管理器
- hyprpaper 壁纸
- hyprpolkitagent 权限认证
- hyprlock 锁屏
- hypridle idel
- hyprshot 截图
- xdg-desktop-portal 接口
- xdg-desktop-portal-hyprland 实现
- aur/xdg-desktop-portal-termfilechooser-hunkyburrito-git
  - firefox about:config xdg-desktop-portal.file-picker 修改为1
  - systemctl --user restart xdg-desktop-portal.service

## aur 软件包

- zotero 文献管理
- wechat 微信
- QQ qq

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

```bash
sudo pacman -S qt5-wayland qt6-wayland
```

- avahi mDNS daemon
- nss-mdns 让系统支持 .local 解析

```bash
sudo systemctl enable --now avahi-daemon
```

---

## mac config only

```bash
brew install nvim
brew install stow
brew install yazi
brew install eza
brew install starship
brew install font-jetbrains-mono-nerd-fon
brew install zoxide
brew install fzf
brew install lazygit
brew install fastfetch
brew install mpv
brew install xdg-ninja

brew tap v2raya/v2raya
brew install v2raya/v2raya/v2raya
brew services start v2raya/v2raya/v2raya

brew install volta

```

创建/data目录

```bash
# 1. 创建真实目录
sudo mkdir -p /System/Volumes/Data/data

# 2. 设置权限
sudo chown $(whoami):staff /System/Volumes/Data/data

# 3. 建立入口
sudo nano /etc/synthetic.conf
添加映射，但是中间是 tab 而不是空格
data    System/Volumes/Data/data
```

- [brew安装完全指南：多系统适配与国内源配置技巧](https://www.trae.cn/article/660492802)
- [Mac 下安装和使用 Homebrew](https://www.wulicode.com/os/mac/homebrew.html)

macfuse安装+ rclone 自建仓

- [](https://www.cnblogs.com/zxhoo/p/19639636)

---

```bash
==> Fetching downloads for: yabai
✔︎ Formula yabai (7.1.18)                                                   Verified    787.5KB/787.5KB
==> Installing yabai from koekeishiya/formulae
==> Caveats
Copy the example configuration into your home directory:
  cp /opt/homebrew/opt/yabai/share/yabai/examples/yabairc ~/.yabairc
  cp /opt/homebrew/opt/yabai/share/yabai/examples/skhdrc ~/.skhdrc

If you want yabai to be managed by launchd (start automatically upon login):
  yabai --start-service

When running as a launchd service logs will be found in:
  /tmp/yabai_<user>.[out|err].log

If you are using the scripting-addition; remember to update your sudoers file:
  sudo visudo -f /private/etc/sudoers.d/yabai

Build the configuration row by running:
  echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa"

README: https://github.com/asmvik/yabai/wiki/Installing-yabai-(latest-release)#configure-scripting-addition
==> Summary
🍺  /opt/homebrew/Cellar/yabai/7.1.18: 7 files, 1.8MB, built in 0 seconds
==> Running `brew cleanup yabai`...
Disable this behaviour by setting `HOMEBREW_NO_INSTALL_CLEANUP=1`.
Hide these hints with `HOMEBREW_NO_ENV_HINTS=1` (see `man brew`).
~ 12s ➜ yabai
```

```bash
==> Fetching downloads for: skhd
✔︎ Formula skhd (0.3.9)
==> Installing skhd from
==> make -j1 install
==> codesign -fs - /private/tmp/skhd-2026
==> Caveats
Copy the example configuration into yourhome directory:
  cp /opt/homebrew/opt/skhd/share/skhd/examples/skhdrc ~/.skhdrc

If you want skhd to be managed by launchd (start automatically upon login):
  skhd --start-service

When running as a launchd service logs will be found in:
  /tmp/skhd_<user>.[out|err].log
==> Summary
🍺  /opt/homebrew/Cellar/skhd/0.3.9: 7 files, 131.6KB, built in 2 seconds
==> Running `brew cleanu
Disable this behaviour by setting `HOMEBREW_NO_INSTALL_CLEANUP=1`.
Hide these hints with `HOMEBREW_NO_ENV_HINTS=1` (see `man brew`).
```

for pdf overview

```bash
Installing dependencies for pdftoipe: gmp, libtasn1, nettle, p11-kit, libevent, libnghttp2, unbound, gnutls, libgpg-error, libassuan, libgcrypt, libksba, libusb, npth, pinentry, gnupg, gpgme, gpgmepp, nspr, nss, openjpeg and poppler
```
