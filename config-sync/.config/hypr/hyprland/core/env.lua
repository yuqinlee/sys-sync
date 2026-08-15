-- =============================================================================
--                  Hyprland Environment Variables
-- =============================================================================

-- =============================================================================
--                   Toolkit Backend Variables
-- =============================================================================
-- 如果可用 Wayland, 不可用尝试 X11 和其他 GDK 后端
hl.env("GDK_BACKEND", "wayland,x11,*")
-- 如果可用则使用 Wayland，否则回退到 X11
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
-- 在 Wayland 上运行 SDL2 应用程序。移除或设置为 x11 如果提供旧版本 SDL 的游戏导致兼容性问题
hl.env("SDL_VIDEODRIVER", "wayland")
-- Clutter 包已启用 Wayland，此变量将强制 Clutter 应用程序尝试使用 Wayland 后端。
hl.env("CLUTTER_BACKEND", "wayland")

-- =============================================================================
--                           Application Env
-- =============================================================================
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("_JAVA_AWT_WM_NONEREPARENTING", "1")

-- =============================================================================
--                       XDG Specifications
-- =============================================================================
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- =============================================================================
--                           Qt Variables
-- =============================================================================
-- 告诉基于 Qt 的应用程序从 qt5ct 中选择你的主题，与 Kvantum 一起使用
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
-- 禁用 Qt 应用程序的窗口装饰
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
-- 可根据显示器的像素密度启用自动缩放
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")

-- =============================================================================
--                           NVIDIA Specific
-- =============================================================================
-- NVIDIA GPU 上的硬件加速
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- ==============================================================================
--                           环境同步
-- > 在现代 Linux（systemd 架构）中
-- > 1. Wayland compositor（如 Hyprland）有自己的进程环境
-- > 2. systemd --user 有自己的一份环境
-- > 3. DBus activation 有自己的一份环境
-- > 这三者默认不同步，因此需要 import
-- ==============================================================================
hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY")
	hl.exec_cmd("systemctl --user import-environment XDG_CURRENT_DESKTOP")
	hl.exec_cmd("systemctl --user import-environment XDG_MENU_PREFIX")
	hl.exec_cmd("dbus-update-activation-environment XDG_MENU_PREFIX")
	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
end)
