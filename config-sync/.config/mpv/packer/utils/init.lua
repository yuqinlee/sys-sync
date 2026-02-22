SysEnum = require("utils.enum.SysEnum")

local utils = {}

utils.os = {}
-- get what current os
function utils.os.get_os()
	-- Windows
	if package.config:sub(1, 1) == "\\" then
		return SysEnum.windows
	end

	-- Unix-like
	local f = io.popen("uname -s 2>/dev/null")
	if f then
		local uname = f:read("*l")
		f:close()
		if uname == "Darwin" then
			return SysEnum.macos
		elseif uname == "Linux" then
			return SysEnum.linux
		else
			return nil
		end
	end
	return nil
end

function utils.os.dirname(path)
	return path:match("(.*/)")
end

-- 极简 JSON（只支持简单对象）
utils.json = {}
function utils.json.encode(tbl)
	local parts = { "{" }
	for k, v in pairs(tbl) do
		table.insert(parts, string.format('"%s":{"source":"%s","installed_at":%d},', k, v.source, v.installed_at))
	end
	if #parts > 1 then
		parts[#parts] = parts[#parts]:sub(1, -2)
	end
	table.insert(parts, "}")
	return table.concat(parts)
end
-- TODO: add decode function
function utils.json.decode(str)
	return {}
end

return utils
