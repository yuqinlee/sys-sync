-- fcitx5
-- hl.env("GTK_IM_MODULE", "fcitx")
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("INPUT_METHOD", "fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "fcitx")

hl.on("hyprland.start", function()
	hl.exec_cmd("fcitx5 --replace -d")

	-- foot-server
	-- hl.exec_cmd("/usr/bin/foot --server")

	-- 壁纸服务
	hl.exec_cmd("hyprpaper")

	-- hypridle
	-- hl.exec_cmd("hypridle")

	-- 状态栏
	hl.exec_cmd("waybar")

	-- 通知
	hl.exec_cmd("dunst")

	-- xdg-file-picker
	hl.exec_cmd("systemctl --user restart xdg-desktop-portal.service")

	-- 权限弹窗确认
	-- hl.exec_cmd("systemctl --user start plasma-polkit-agent")
	-- hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("systemctl --user start hyprpolkitagent")

	-- 音频服务
	hl.exec_cmd("systemctl --user start pipewire")
	hl.exec_cmd("systemctl --user start pipewire-pulse")
	hl.exec_cmd("systemctl --user start wireplumber")

	-- 蓝牙
	-- 注意开启蓝牙服务，`systemctl enable --now bluetooth`
	-- hl.exec_cmd("blueman-applet")

	-- 剪切板
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")

	-- U 盘自动挂载
	hl.exec_cmd("udiskie")

	-- 网络控制
	hl.exec_cmd("nm-applet --indicator")
end)

-- 主题
-- hl.exec_cmd("hyprctl $HYPRCURSOR_THEME HYPRCURSOR_SIZE")
