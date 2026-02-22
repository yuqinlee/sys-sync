-- 注册器管理
local Register = {}

function Register.get(name)
	local path = "registry/" .. name .. ".lua"
	local chunk = loadfile(path)
	if not chunk then
		error("Plugin spec not found: " .. name)
	end
	return chunk()
end

return Register
