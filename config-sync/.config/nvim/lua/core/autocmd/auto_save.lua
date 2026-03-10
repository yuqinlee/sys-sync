-- 自动保存
local function clear_cmdarea()
    vim.defer_fn(function()
        vim.api.nvim_echo({}, false, {})
    end, 800)
end

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function()
        local buf = vim.api.nvim_get_current_buf()

        -- 不保存空文件（无路径）
        local name = vim.api.nvim_buf_get_name(buf)
        if name == "" then
            return
        end

        -- 不保存非普通文件类型
        local bt = vim.bo[buf].buftype
        if bt ~= "" then
            -- 例如 "nofile", "terminal", "prompt", "help", "quickfix"
            return
        end

        -- 不保存不可写文件
        if not vim.bo[buf].modifiable or vim.bo[buf].readonly then
            return
        end

        -- 不保存某些特定 filetype（如 LspInfo、TelescopePrompt、help 等）
        local ft = vim.bo[buf].filetype
        local ignored = {
            "lspinfo",
            "TelescopePrompt",
            "help",
            "gitcommit",
            "NvimTree",
            "lazy",
            "mason",
            "checkhealth",
        }
        if vim.tbl_contains(ignored, ft) then
            return
        end

        -- 不保存未列入 buffer 列表的
        if not vim.bo[buf].buflisted then
            return
        end

        -- 一切正常：执行保存逻辑
        vim.cmd "silent w"

        local time = os.date "%I:%M %p"
        vim.api.nvim_echo({
            { " 󰄳 ", "LazyProgressDone" },
            { " file autosaved at " .. time },
        }, false, {})

        clear_cmdarea()
    end,
})
