local Const = require("hyprland.constants")

-- 截窗口
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
-- 截屏显示器
hl.bind(Const.mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
-- 区域截屏
hl.bind(Const.mainModCtrl .. " + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- 从剪切板中复制
hl.bind(Const.mainModShift .. " + P", hl.dsp.exec_cmd("cliphist list | wofi | cliphist decode | wl-copy"))

-- 重载waybar
hl.bind(
	Const.mainModShift .. " + R",
	hl.dsp.exec_cmd(
		"pkill waybar && pkill hyprpaper && hyprctl dispatch exec waybar && hyprctl dispatch exec hyprpaper"
	)
)

-- 锁屏
hl.bind(Const.mainModCtrlAlt .. " + L", hl.dsp.exec_cmd("hyprlock"))
