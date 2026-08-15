local C = require("hyprland.constants")

-- 截窗口
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
-- 截屏显示器
hl.bind(C.mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m output"))
-- 区域截屏
hl.bind(C.mainModCtrl .. " + S", hl.dsp.exec_cmd("hyprshot -m region"))

-- 从剪切板中复制
hl.bind(C.mainModShift .. " + P", hl.dsp.exec_cmd("cliphist list | wofi | cliphist decode | wl-copy"))

-- 重载waybar
hl.bind(
	C.mainModShift .. " + R",
	hl.dsp.exec_cmd(
		"pkill waybar && pkill hyprpaper && hyprctl dispatch exec waybar && hyprctl dispatch exec hyprpaper"
	)
)

-- 锁屏
hl.bind(C.mainModCtrlAlt .. " + L", hl.dsp.exec_cmd("hyprlock"))
