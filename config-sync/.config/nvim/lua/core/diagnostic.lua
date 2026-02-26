local symbol = require "comm.const.symbol"

-- 自定义诊断显示
vim.diagnostic.config {
    -- 虚拟文本显示
    virtual_text = {
        prefix = function(diagnostic)
            return symbol.icons[diagnostic.severity]
        end,
        spacing = 4,
        source = "if_many",
        -- 自定义格式，显示来源
        format = function(diagnostic)
            -- 可以自定义显示格式，比如显示来源
            if diagnostic.source then
                return string.format("[%s] %s", diagnostic.source, diagnostic.message)
            end
        end,
    },

    -- 行号旁符号
    signs = {
        active = false,
        text = {
            [vim.diagnostic.severity.ERROR] = symbol.icons.ERROR,
            [vim.diagnostic.severity.WARN] = symbol.icons.WARN,
            [vim.diagnostic.severity.INFO] = symbol.icons.INFO,
            [vim.diagnostic.severity.HINT] = symbol.icons.HINT,
        },
    },

    -- 下划线
    underline = {
        severity = { min = vim.diagnostic.severity.WARN },
    },

    -- 更新策略
    update_in_insert = false,
    severity_sort = true, -- 按严重程度排序

    -- 浮动窗口
    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = function(diagnostic)
            return symbol.icons[diagnostic.severity]
        end,
        format = function(diagnostic)
            local location =
                string.format("%s:%d:%d", diagnostic.source or "unknown", diagnostic.lnum + 1, diagnostic.col + 1)
            return string.format("[%s] %s\n%s", diagnostic.source or "unknown", diagnostic.message, location)
        end,
    },

    jump = {
        -- 可以自定义跳转逻辑
    },
}

-- 自定义高亮
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff0000" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffae00" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#00aaff" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#aaaaaa" })

-- 打开所有诊断
vim.api.nvim_set_keymap("n", "<Leader>da", ":lua vim.diagnostic.setloclist()<CR>", { noremap = true, silent = true })
-- 打开浮动窗口
vim.api.nvim_set_keymap("n", "<Leader>df", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
-- 跳转到上一个诊断
vim.api.nvim_set_keymap("n", "<Leader>dk", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = true })
-- 跳转到下一个诊断
vim.api.nvim_set_keymap("n", "<Leader>dj", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = true })
