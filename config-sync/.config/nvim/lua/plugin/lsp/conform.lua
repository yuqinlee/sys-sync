-- 代码格式化
local parser = require("lsp").Parser

-- 动态生成 lsp_format 规则
local function resolve_lsp_fallback(bufnr)
    -- 获取允许 LSP fallback 的 ft
    local fallback_ft = parser.lsp_fallback_ft()
    local ft = vim.bo[bufnr].filetype
    if fallback_ft[ft] then
        return "fallback"
    end
    return false
end

return {
    "stevearc/conform.nvim",

    opts = {
        -- 自定义的格式化工具
        formatters = parser.formatters(),
        -- 文件类型对应的格式化工具（来自语言注册表）
        formatters_by_ft = parser.formatters_by_ft(),

        -- 修改调用 conform.format() 时的默认选项
        -- 同样会影响 format_on_save / format_after_save 的默认值
        default_format_opts = {
            -- 是否使用 LSP 作为 fallback 由语言配置决定
            lsp_format = function(bufnr)
                return resolve_lsp_fallback(bufnr)
            end,
        },

        -- 如果设置该项，保存文件时将自动运行格式化
        -- 会将该表作为参数传递给 conform.format()
        -- 也可以设置为函数并返回一个表
        format_on_save = function(bufnr)
            return {
                -- 是否 fallback 由语言能力控制
                lsp_format = resolve_lsp_fallback(bufnr),
                timeout_ms = 500,
            }
        end,

        -- 如果设置该项，保存文件后将异步运行格式化
        -- 会将该表作为参数传递给 conform.format()
        -- 也可以设置为函数并返回一个表
        format_after_save = function(bufnr)
            return {
                lsp_format = resolve_lsp_fallback(bufnr),
            }
        end,

        -- 设置日志级别，可使用 :ConformInfo 查看日志文件位置
        log_level = vim.log.levels.ERROR,

        -- 当格式化工具执行出错时通知
        notify_on_error = true,

        -- 当当前缓冲区没有可用格式化工具时通知
        notify_no_formatters = true,
    },

    config = function(_, opts)
        require("conform").setup(opts)

        -- 手动格式化快捷键
        vim.keymap.set("n", "<leader>ff", function()
            require("conform").format {
                -- 是否 fallback 由语言能力控制
                lsp_format = resolve_lsp_fallback(vim.api.nvim_get_current_buf()), -- 0 为当前 buffer
                async = false,
                timeout_ms = 2000,
            }
        end, { desc = "Format file" })
    end,
}
