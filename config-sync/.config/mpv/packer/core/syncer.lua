-- 同步器管理
local util = require("utils")

local Syncer = {}

local function expand_home(path)
	return path:gsub("^~", os.getenv("HOME"))
end

function Syncer.install(spec)
	local src = spec.source

	if src.type == "git" then
		local tmp = "/tmp/" .. spec.name
		os.execute("rm -rf " .. tmp)
		os.execute("git clone " .. src.url .. " " .. tmp)

		if src.branch then
			os.execute("cd " .. tmp .. " && git checkout " .. src.branch)
		end

		if spec.install.type == "copy" then
			local from = tmp .. "/" .. spec.install.from
			local to = expand_home(spec.install.to)

			os.execute("mkdir -p " .. util.os.dirname(to))
			os.execute("cp " .. from .. " " .. to)
		end

		os.execute("rm -rf " .. tmp)
	else
		error("Unsupported source type")
	end
end

return Syncer
