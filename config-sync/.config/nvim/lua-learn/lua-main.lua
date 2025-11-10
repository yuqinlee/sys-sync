YuchinNVIM = { plugin = {} }

local function require_all_in_dir(dir)
	local current_file = debug.getinfo(1, "S").source:sub(2)
	local p = io.popen('find "' .. dir .. '" -type f -name "*.lua"')
	if not p then
		io.stderr:write("❌ 无法打开目录: " .. dir .. "\n")
		return
	end

	for file in p:lines() do
		if file ~= current_file then
			-- 转为模块路径
			local mod = file:gsub("%.lua$", ""):gsub("^%./", ""):gsub("/", ".")
			-- 将路径按"."分割为表
			local parts = {}
			for part in mod:gmatch("[^%.]+") do
				table.insert(parts, part)
			end

			-- 从 YuchinNVIM.plugin 开始逐级创建表
			local cursor = YuchinNVIM.plugin
			for i = 1, #parts - 1 do
				local key = parts[i]
				cursor[key] = cursor[key] or {}
				cursor = cursor[key]
			end

			-- 最后一级模块赋值为 require 结果
			local last_key = parts[#parts]
			local ok, module = pcall(require, mod)
			if ok then
				cursor[last_key] = module
			else
				io.stderr:write("⚠️ 加载模块失败: " .. mod .. "\n")
			end
		end
	end

	p:close()
end

-- 加载 req 目录
require_all_in_dir("req")

-- 测试访问
-- 假设存在 req/l1.lua 导出 { a = 123 }
print(YuchinNVIM.plugin.req.l1.a)
print(YuchinNVIM.plugin.req.l1.b)
