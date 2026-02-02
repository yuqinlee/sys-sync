local utils = {}

-- 判断什么系统
function utils.get_os()
    -- Windows
    if package.config:sub(1,1) == '\\' then
        return "windows"
    end

    -- Unix-like
    local f = io.popen("uname -s 2>/dev/null")
    if f then
        local uname = f:read("*l")
        f:close()
        if uname == "Darwin" then
            return "macos"
        elseif uname == "Linux" then
            return "linux"
        else
            return "unix"
        end
    end

    return "unknown"
end

return utils

