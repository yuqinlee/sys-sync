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
require("recycle-bin"):setup({
  -- Optional: Override automatic trash directory discovery
  -- trash_dir = "~/.local/share/Trash/",  -- Uncomment to use specific directory
})
require("restore"):setup({
    -- Set the position for confirm and overwrite prompts.
    -- Don't forget to set height: `h = xx`
    -- https://yazi-rs.github.io/docs/plugins/utils/#ya.input
    position = { "center", w = 70, h = 40 }, -- Optional

    -- Show confirm prompt before restore.
    -- NOTE: even if set this to false, overwrite prompt still pop up
    show_confirm = true,  -- Optional

    -- Suppress success notification when all files or folder are restored.
    suppress_success_notification = true,  -- Optional

    -- colors for confirm and overwrite prompts
    theme = { -- Optional
      -- Default using style from your flavor or theme.lua -> [confirm] -> title.
      -- If you edit flavor or theme.lua you can add more style than just color.
      -- Example in theme.lua -> [confirm]: title = { fg = "blue", bg = "green"  }
      title = "blue", -- Optional. This value has higher priority than flavor/theme.lua

      -- Default using style from your flavor or theme.lua -> [confirm] -> content
      -- Sample logic as title above
      header = "green", -- Optional. This value has higher priority than flavor/theme.lua

      -- header color for overwrite prompt
      -- Default using color "yellow"
      header_warning = "yellow", -- Optional
      -- Default using style from your flavor or theme.lua -> [confirm] -> list
      -- Sample logic as title and header above
      list_item = { odd = "blue", even = "blue" }, -- Optional. This value has higher priority than flavor/theme.lua
    },
})

-- require("yaziline"):setup({
--
-- 	color = "#ffffff",
-- 	-- secondary_color = "#5A6078",
-- 	default_files_color = "darkgray", -- color of the file counter when it's inactive
-- 	selected_files_color = "white",
-- 	yanked_files_color = "green",
-- 	cut_files_color = "red",
--
-- 	separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
-- 	separator_open = "",
-- 	separator_close = "",
-- 	separator_open_thin = "",
-- 	separator_close_thin = "",
-- 	separator_head = "",
-- 	separator_tail = "",
--
-- 	select_symbol = "",
-- 	yank_symbol = "󰆐",
--
-- 	filename_max_length = 24, -- truncate when filename > 24
-- 	filename_truncate_length = 6, -- leave 6 chars on both sides
-- 	filename_truncate_separator = "...",
-- })
