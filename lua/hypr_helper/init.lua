
local MonitorMatcher = require("monitor_matcher")

local matcher = MonitorMatcher.new({
    -- ws_dir = os.getenv("HOME") .. "/ws",
    ws_dir = "../config-sync/multi",
    monitor_index = 1,
    strict = false
})

local result, err = matcher:run()

if result then
    print(result)
else
    print("Error:", err)
end

