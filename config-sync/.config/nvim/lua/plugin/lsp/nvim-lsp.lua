-- 语言服务器
local R = require "lsp.lang_registry"

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
        local settings = R.lsp_settings()
        for server, conf in pairs(settings) do
            vim.lsp.config(server, { settings = conf })
            vim.lsp.enable(server)
        end
    end,
}
