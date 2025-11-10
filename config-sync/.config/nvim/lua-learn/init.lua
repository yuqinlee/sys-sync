-- Define global namespace
YuchinNVIM = {}

------------------------------------------------------------
-- YuPlugin class
------------------------------------------------------------
local YuPlugin = {}
YuPlugin.__index = YuPlugin

--- Create a new plugin instance
--- @param name string
--- @param module any
--- @param is_active boolean|nil
function YuPlugin.new(name, module, is_active)
	local self = setmetatable({}, YuPlugin)
	self.name = name
	self.module = module
	self.is_active = is_active or true
	return self
end

--- Activate plugin
function YuPlugin:activate()
	self.is_active = true
end

--- Deactivate plugin
function YuPlugin:deactivate()
	self.is_active = false
end

--- Print debug info
function YuPlugin:info()
	print(string.format("[Plugin] %s (active: %s)", self.name, tostring(self.is_active)))
end

------------------------------------------------------------
-- YuchinNVIM manager
------------------------------------------------------------
YuchinNVIM.plugin = {}

--- Load all Lua plugins from a directory
--- @param dir string
function YuchinNVIM.get_plugin(dir)
	local current_file = debug.getinfo(1, "S").source:sub(2)
	local p = io.popen('find "' .. dir .. '" -type f -name "*.lua"')
	if not p then
		io.stderr:write("Error: cannot open directory " .. dir .. "\n")
		return
	end

	for file in p:lines() do
		if file ~= current_file then
			-- Convert to module name
			local mod = file:gsub("%.lua$", ""):gsub("^%./", ""):gsub("/", ".")
            print(mod)
			local ok, module = pcall(require, string.format(mod))
			if ok then
				local plugin = YuPlugin.new(mod, module, true)
				table.insert(YuchinNVIM.plugin, plugin)
				print("Loaded plugin: " .. mod)
			else
				io.stderr:write("Failed to load module: " .. mod .. "\n")
			end
		end
	end

	p:close()
end

------------------------------------------------------------
-- Example usage
------------------------------------------------------------

YuchinNVIM.get_plugin("req")

for _, plugin in ipairs(YuchinNVIM.plugin) do
	plugin:info()
end

print(YuchinNVIM.plugin[2].name)
print(YuchinNVIM.plugin[2].module.a)
print(YuchinNVIM.plugin[2].is_active)

