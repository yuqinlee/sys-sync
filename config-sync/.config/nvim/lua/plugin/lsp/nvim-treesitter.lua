-- 语法树分析
local configParser = require("lang").Parser

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },

        opts = {
            highlight = { enable = true },
            indent = { enable = true },
        },

        config = function()
            local treesitter = require "nvim-treesitter"
            treesitter.install(configParser)

            -- 自动安装缺失 parser
            local install = require "nvim-treesitter.install"
            local parsers = require "nvim-treesitter.parsers"

            local missing = {}
            for _, lang in ipairs(configParser) do
                if not parsers.has_parser(lang) then
                    table.insert(missing, lang)
                end
            end

            if #missing > 0 then
                install.update { with_sync = false }()
            end

            -- fold
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    vim.opt_local.foldmethod = "expr"
                    vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
                end,
            })
        end,
    },
}
