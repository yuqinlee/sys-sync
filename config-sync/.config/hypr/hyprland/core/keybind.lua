local Const = require("hyprland.constants")

-- =============================================================================
--                               opener control
--                                   快速打开
-- =============================================================================
-- 打开终端
hl.bind(Const.mainMod .. " + RETURN", hl.dsp.exec_cmd(Const.terminal))

-- 打开一个浮动终端
hl.bind(
	Const.mainModShift .. " + RETURN",
	hl.dsp.exec_cmd(Const.terminal, { float = true, size = { 1500, 800 }, center = true })
)

-- 打开文件管理器
hl.bind(
	Const.mainMod .. " + E",
	hl.dsp.exec_cmd(
		Const.terminal .. " -- " .. Const.fileManager,
		{ float = true, size = { 1500, 800 }, center = true }
	)
)

-- 打开浏览器
hl.bind(Const.mainMod .. " + B", hl.dsp.exec_cmd(Const.browser))

-- 打开 menu
hl.bind(Const.mainMod .. " + R", hl.dsp.exec_cmd("fuzzel"))

-- 关闭窗口
hl.bind(Const.mainMod .. " + Q", hl.dsp.window.close())

-- 退出 hyprland
hl.bind(Const.mainMod .. " + M", hl.dsp.exit())

-- =============================================================================
--                           workspace control
--                               控制工作区
-- =============================================================================
-- 切换与移动窗口至对应 workspace
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(Const.mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(Const.mainModShift .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- magic workspace
hl.bind(Const.mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(Const.mainModShift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- 移动窗口到左边工作区但不切换过去(silent)
hl.bind(Const.mainModShift .. " + H", hl.dsp.window.move({ workspace = "r-1", follow = false }))
-- 移动窗口到右边工作区但不切换过去(silent)
hl.bind(Const.mainModShift .. " + L", hl.dsp.window.move({ workspace = "r+1", follow = false }))

-- =============================================================================
--                       application window control
--                           控制应用窗口
-- =============================================================================
-- 窗口属性控制
-- 浮动与平铺转换 (原 setfloating + resizeactive exact + centerwindow 三条绑键合并)
hl.bind(Const.mainMod .. " + SPACE", function()
	hl.dispatch(hl.dsp.window.float({ action = "set" }))
	hl.dispatch(hl.dsp.window.resize({ x = 1800, y = 900, relative = false }))
	hl.dispatch(hl.dsp.window.center())
end)
hl.bind(Const.mainModShift .. " + SPACE", hl.dsp.window.float({ action = "unset" }))

-- hypr 窗口工作区铺满（两个参数，第一个控制 hypr，第二个控制应用内）
hl.bind(Const.mainMod .. " + F", hl.dsp.window.fullscreen_state({ internal = 1, client = 0 }))
-- hypr 窗口全屏（waybar等组件被覆盖）
hl.bind(Const.mainModShift .. " + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 0 }))
-- hypr 全屏 + 应用自身全屏
hl.bind(Const.mainModShiftCtrl .. " + F", hl.dsp.window.fullscreen_state({ internal = 2, client = 2 }))

-- pin窗口: 最顶层固定窗口，仅 float
hl.bind(Const.mainMod .. " + G", hl.dsp.window.pin({ action = "toggle" }))

-- 修改活动窗口大小
hl.bind(Const.mainModCtrl .. " + H", hl.dsp.window.resize({ x = -15, y = 0 }), { repeating = true })
hl.bind(Const.mainModCtrl .. " + L", hl.dsp.window.resize({ x = 15, y = 0 }), { repeating = true })
hl.bind(Const.mainModCtrl .. " + K", hl.dsp.window.resize({ x = 0, y = -15 }), { repeating = true })
hl.bind(Const.mainModCtrl .. " + J", hl.dsp.window.resize({ x = 0, y = 15 }), { repeating = true })

-- dwindle
hl.bind(Const.mainMod .. " + P", hl.dsp.window.pseudo(), { repeating = true })
hl.bind(Const.mainMod .. " + V", hl.dsp.layout("togglesplit"), { repeating = true })

-- Move focus with HYPR_MOD + arrow keys
hl.bind(Const.mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(Const.mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(Const.mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(Const.mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Scroll through existing workspaces with HYPR_MOD + scroll
hl.bind(Const.mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Const.mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(Const.mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Const.mainModShift .. " + TAB", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with HYPR_MOD + LMB/RMB and dragging
hl.bind(Const.mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true }) -- 鼠标左键
hl.bind(Const.mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- 鼠标右键

-- 统一窗口切换 - ALT+TAB / ALT+SHIFT+TAB
local function cycle_focus(next)
	hl.dispatch(hl.dsp.window.cycle_next({ next = next }))
	local win = hl.get_active_window()
	if win and win.floating then
		hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
	end
end
hl.bind(Const.alt .. " + TAB", function()
	cycle_focus(true)
end)
hl.bind(Const.altShift .. " + TAB", function()
	cycle_focus(false)
end)

-- 切换浮动与平铺
hl.bind(Const.mainMod .. " + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/hypr_enhance/toggle_float.sh"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })
