local utils = require "utils.common"
local SysEnum = require "enum.SysEnum"

cur_os = utils.get_os()
if cur_os == SysEnum.windows then
    -- windows
    print("current system = "..SysEnum.windows)
else
    if cur_os == SysEnum.linux then
        -- linux
        local ok, exit_type, code = os.execute("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)\"")
        -- /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)"
    else
        -- macos
    end
end

