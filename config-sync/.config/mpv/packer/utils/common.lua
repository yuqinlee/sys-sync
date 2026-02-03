SysEnum = require "enum.SysEnum"

local utils = {}

-- get what current os
function utils.get_os()
    -- Windows
    if package.config:sub(1,1) == '\\' then
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
            return SysEnum.macos
        else
            return nil
        end
    end
    return nil
end

return utils

