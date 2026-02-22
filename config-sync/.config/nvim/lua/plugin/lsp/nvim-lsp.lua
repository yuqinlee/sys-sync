-- 语言服务器
local parser = require "lsp.lang_conf_parser"

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
        -- 诊断信息的图标
        vim.diagnostic.config {
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = " ", -- nf-fa-times_circle
                    [vim.diagnostic.severity.WARN] = " ", -- nf-fa-warning
                    [vim.diagnostic.severity.HINT] = "󰌵 ", -- nf-md-lightbulb_on_outline
                    [vim.diagnostic.severity.INFO] = " ", -- nf-fa-info_circle
                },
            },
        }

        -- 解析 lsp 配置
        local configs = parser.lsp_opts()
        for server, conf in pairs(configs) do
            vim.lsp.config(server, conf)
            vim.lsp.enable(server)
        end
    end,
}
