local uosc{
    install = local ok, exit_type, code = os.execute("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)\"")
}


local utils = require "utils.common"
local SysEnum = require "enum.SysEnum"

cur_os = utils.get_os()
if cur_os == SysEnum.windows then
    -- windows
    print("current system = "..SysEnum.windows.." not support")
elseif cur_os == SysEnum.linux or cur_os ==SysEnum.macos then
    -- linux or macos
    print("here")
    -- local ok, exit_type, code = os.execute("/bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)\"")
else
    print("unknow system")
end

