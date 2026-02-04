local system={

    -- Do not use vim.version as it loads the vim.version module
    -- Using vim.fn.api_info().version is no good either as api_info also consumes much time
    version = vim.fn.matchstr(vim.fn.execute "version", "NVIM v\\zs[^\\n]*"),

    -- which system
    is_linux = vim.uv.os_uname().sysname == "Linux",
    is_mac = vim.uv.os_uname().sysname == "Darwin",
    is_windows = vim.uv.os_uname().sysname == "Windows_NT",
    is_wsl = string.find(vim.uv.os_uname().release, "WSL") ~= nil,
}

return system

