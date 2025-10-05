-- =============================================================================
--                            标题栏配置
-- =============================================================================
-- 标题栏显示主机名与用户名
Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)

-- =============================================================================
--                            状态栏配置
-- =============================================================================
-- 状态栏显示符号连接
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- 状态栏显示组属用户属
Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	})
end, 500, Status.RIGHT)

-- =============================================================================
--                             功能函数配置
--=============================================================================
-- 修改时间展示
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.modified or 0)
	if time == 0 then
		time = ""
	elseif os.date("%Y", time) == os.date("%Y") then
		time = os.date("%b %d %H:%M", time)
	else
		time = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return ui.Line(string.format("%s %s", size and ya.readable_size(size) or "-", time))
end

-- =============================================================================
--                              插件配置
-- =============================================================================
-- 显示 git 状态
require("git"):setup()
-- require("yaziline"):setup({
--
--   color = "#98c379",
--   secondary_color = "#5A6078",
--   default_files_color = "darkgray", -- color of the file counter when it's inactive
--   selected_files_color = "white",
--   yanked_files_color = "green",
--   cut_files_color = "red",
--
--   separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
--   separator_open = "",
--   separator_close = "",
--   separator_open_thin = "",
--   separator_close_thin = "",
--   separator_head = "",
--   separator_tail = "",
--
--   select_symbol = "",
--   yank_symbol = "󰆐",
--
--   filename_max_length = 24, -- truncate when filename > 24
--   filename_truncate_length = 6, -- leave 6 chars on both sides
--   filename_truncate_separator = "..."
-- })
