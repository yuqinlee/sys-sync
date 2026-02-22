-- 语言服务器、格式化工具、调试工具等安装框架
local parser = require "lsp.lang_conf_parser"

return {
    {
        "mason-org/mason.nvim",
        opts = {},
    },

    {
        -- 通过 mason 来自动安装语言服务器并启用
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = parser.mason_lsp(),
            automatic_enable = true,
        },
    },

    {
        -- 通过 mason 安装其他工具
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = parser.mason_tools(),
            run_on_start = true,
        },
    },
}
