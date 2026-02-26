-- 语言服务器
local parser = require("lsp").Parser

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        -- 解析 lsp 配置
        local configs = parser.lsp_opts()
        for server, conf in pairs(configs) do
            vim.lsp.config(server, conf)
            vim.lsp.enable(server)
        end
    end,
}
