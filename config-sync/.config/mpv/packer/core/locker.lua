local json = require("utils").json

local Lock = {}
local lockfile = "packer-lock.json"

local function read()
	local f = io.open(lockfile, "r")
	if not f then
		return {}
	end
	local content = f:read("*a")
	f:close()
	return json.decode(content) or {}
end

local function write(tbl)
	local f = io.open(lockfile, "w")
	f:write(json.encode(tbl))
	f:close()
end

function Lock.add(name, url)
	local data = read()
	data[name] = {
		source = url,
		installed_at = os.time(),
	}
	write(data)
end

function Lock.remove(name)
	local data = read()
	data[name] = nil
	write(data)
end

function Lock.list()
	local data = read()
	for k, v in pairs(data) do
		print(k, v.source)
	end
end

return Lock
