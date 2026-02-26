-- 代码补全引擎
return {
    "saghen/blink.cmp",
    version = "1.*",
    enabled = not vim.g.vscode, -- 在vscode-neovim禁用
    dependencies = {
        "rafamadriz/friendly-snippets",
        "Kaiser-Yang/blink-cmp-avante",
    },
    opts = {
        cmdline = {
            keymap = {
                preset = "none",

                ["<Tab>"] = {
                    function(cmp)
                        if cmp.is_visible() then
                            return cmp.accept()
                        else
                            return cmp.show()
                        end
                    end,
                    "fallback",
                },

                ["<S-Tab>"] = { "select_prev", "fallback" },

                ["<C-j>"] = { "select_next", "fallback" },
                ["<C-k>"] = { "select_prev", "fallback" },

                ["<Down>"] = { "select_next", "fallback" },
                ["<Up>"] = { "select_prev", "fallback" },
            },
            completion = {
                -- 不预选第一个项目，选中后自动插入该项目文本
                list = { selection = { preselect = true, auto_insert = false } },
                -- 自动显示补全窗口，仅在输入命令时显示菜单，而搜索或使用其他输入菜单时则不显示
                menu = {
                    auto_show = function(_)
                        return vim.fn.getcmdtype() == ":"
                        -- enable for inputs as well, with:
                        -- or vim.fn.getcmdtype() == '@'
                    end,
                },
                -- 不在当前行上显示所选项目的预览
                ghost_text = { enabled = false },
            },
        },

        keymap = {
            preset = "none",

            ["<leader>Tab"] = { "show", "show_documentation", "hide_documentation" },

            -- Tab 接受补全
            ["<Tab>"] = { "accept", "fallback" },

            -- Ctrl+j / Ctrl+k 控制选择
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },

            -- 方向键支持
            ["<Down>"] = { "select_next", "fallback" },
            ["<Up>"] = { "select_prev", "fallback" },

            -- 保留 Shift-Tab 作为向上选择
            ["<S-Tab>"] = { "select_prev", "fallback" },

            -- 文档滚动
            ["<C-p>"] = { "scroll_documentation_up", "fallback" },
            ["<C-n>"] = { "scroll_documentation_down", "fallback" },

            -- snippet 跳转（避免冲突）
            ["<C-l>"] = { "snippet_forward", "fallback" },
            ["<C-h>"] = { "snippet_backward", "fallback" },
        },

        completion = {
            -- 示例：使用'prefix'对于'foo_|_bar'单词将匹配'foo_'(光标前面的部分),使用'full'将匹配'foo__bar'(整个单词)
            keyword = { range = "full" },
            -- 选择补全项目时显示文档(0秒延迟)
            documentation = { auto_show = true, auto_show_delay_ms = 0 },
            -- 预选第一个项目，选中后自动插入该项目文本
            list = { selection = { preselect = true, auto_insert = false } },
            -- 针对菜单的外观配置
            menu = {
                min_width = 15,
                max_height = 10,
                border = "single", -- Defaults to `vim.o.winborder` on nvim 0.11+
                auto_show = true,
            },
        },

        -- 指定文件类型启用/禁用
        enabled = function()
            return not vim.tbl_contains({
                -- "lua",
                -- "markdown"
            }, vim.bo.filetype) and vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
        end,

        appearance = {
            -- 将后备高亮组设置为 nvim-cmp 的高亮组
            -- 当您的主题不支持blink.cmp 时很有用
            -- 将在未来版本中删除
            use_nvim_cmp_as_default = true,
            -- 将“Nerd Font Mono”设置为“mono”，将“Nerd Font”设置为“normal”
            -- 调整间距以确保图标对齐
            nerd_font_variant = "mono",
        },

        -- 已定义启用的提供程序的默认列表，以便您可以扩展它
        sources = {
            default = {
                "buffer",
                "lsp",
                "path",
                "snippets",
                "avante",
            },
            providers = {
                -- score_offset设置优先级数字越大优先级越高
                buffer = { score_offset = 5 },
                path = { score_offset = 3 },
                lsp = { score_offset = 2 },
                snippets = { score_offset = 1 },
                cmdline = {
                    min_keyword_length = function(ctx)
                        -- when typing a command, only show when the keyword is 3 characters or longer
                        if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                            return 3
                        end
                        return 0
                    end,
                },
                avante = {
                    module = "blink-cmp-avante",
                    name = "Avante",
                    opts = {
                        -- options for blink-cmp-avante
                    },
                },
            },
        },
    },
    -- 由于“opts_extend”，您的配置中的其他位置无需重新定义它
    opts_extend = { "sources.default" },
}
