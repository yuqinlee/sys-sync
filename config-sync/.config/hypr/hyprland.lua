-- =============================================================================
--                              Hyprland main config
-- =============================================================================
-- Lua 配置入口 (Hyprland >= 0.55)
-- 结构镜像旧的 hyprlang 模块化配置:
--   core     - 核心配置 (环境 / 外观 / 输入 / 键位 / 窗口 / 显示器)
--   base     - 系统基础服务 (环境 / 自启 / 键位)
--   external - 特定应用配置 (自启 / 窗口规则 / 显示器)
-- 每个模块通过 require() 加载，独立作用域。

-- core config
require("hyprland.core.env")
require("hyprland.core.apparence")
require("hyprland.core.input")
require("hyprland.core.keybind")
require("hyprland.core.window")
require("hyprland.core.monitor")

-- system base service
require("hyprland.base.env")
require("hyprland.base.exec")
require("hyprland.base.keybind")

-- specific config for every app
require("hyprland.external.exec")
require("hyprland.external.window")
require("hyprland.external.monitor")
