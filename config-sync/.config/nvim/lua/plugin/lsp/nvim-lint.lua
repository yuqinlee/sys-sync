-- lint 提示
local parser = require "lsp.lang_conf_parser"

return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPost", "BufNewFile" },

    config = function()
        local lint = require "lint"

        -- 指定不同 filetype 使用的 linter
        lint.linters_by_ft = parser.nvim_lint_linters_by_ft()
        -- 自动触发 lint
        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })
    end,
}
