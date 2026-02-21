-- monitor_matcher.lua
-- 用于根据 Hyprland monitor description 在指定目录中做模糊匹配

local MonitorMatcher = {}
MonitorMatcher.__index = MonitorMatcher

-------------------------------------------------
-- 构造函数
-------------------------------------------------
function MonitorMatcher.new(opts)
	opts = opts or {}

	local self = setmetatable({}, MonitorMatcher)

	self.ws_dir = opts.ws_dir or (os.getenv("HOME") .. "/ws")
	self.monitor_index = opts.monitor_index or 1 -- 默认第一个显示器
	self.strict = opts.strict or false

	return self
end

-------------------------------------------------
-- 工具函数：执行命令并获取输出
-------------------------------------------------
local function exec(cmd)
	local handle = io.popen(cmd)
	if not handle then
		return nil
	end
	local result = handle:read("*a")
	handle:close()
	return result
end

-------------------------------------------------
-- 工具函数：字符串 trim
-------------------------------------------------
local function trim(s)
	return (s:gsub("^%s*(.-)%s*$", "%1"))
end

-------------------------------------------------
-- 工具函数：归一化字符串
-- 小写 + 去除空格/连字符/下划线
-------------------------------------------------
local function normalize(str)
	str = str:lower()
	str = str:gsub("[%s%-%_]", "")
	return str
end

-------------------------------------------------
-- 获取 monitor description
-------------------------------------------------
function MonitorMatcher:get_monitor_description()
	local cmd = "hyprctl monitors -j"
	local output = exec(cmd)
	if not output then
		return nil, "Failed to execute hyprctl"
	end

	-- 直接匹配 JSON 中的 description
	local descriptions = {}
	for desc in output:gmatch('"description"%s*:%s*"([^"]+)"') do
		table.insert(descriptions, desc)
	end

	if #descriptions == 0 then
		return nil, "No monitor description found"
	end

	return descriptions[self.monitor_index]
end

-------------------------------------------------
-- 提取关键字（前两个字段）
-------------------------------------------------
function MonitorMatcher:extract_key(description)
	local words = {}
	for w in description:gmatch("%S+") do
		table.insert(words, w)
	end

	if #words < 2 then
		return description
	end

	return words[1] .. " " .. words[2]
end

-------------------------------------------------
-- 匹配目录
-------------------------------------------------
function MonitorMatcher:match_directory()
	local desc, err = self:get_monitor_description()
	if not desc then
		return nil, err
	end

	local key = self:extract_key(desc)
	local key_norm = normalize(key)

	for entry in io.popen('ls -1 "' .. self.ws_dir .. '"'):lines() do
		local full_path = self.ws_dir .. "/" .. entry

		-- 判断是否目录
		local attr = io.popen('test -d "' .. full_path .. '" && echo dir'):read("*l")
		if attr == "dir" then
			local dir_norm = normalize(entry)

			if self.strict then
				if dir_norm == key_norm then
					return full_path
				end
			else
				if string.find(dir_norm, key_norm, 1, true) then
					return full_path
				end
			end
		end
	end

	return nil, "No match found"
end

-------------------------------------------------
-- 便捷调用
-------------------------------------------------
function MonitorMatcher:run()
	local path, err = self:match_directory()
	if not path then
		return nil, err
	end
	return path
end

return MonitorMatcher
