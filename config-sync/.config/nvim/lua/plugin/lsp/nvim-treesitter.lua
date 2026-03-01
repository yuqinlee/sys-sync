-- 语法树分析
local configParser = require("lsp").Parser

return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup {
                -- 自动安装 parser
                ensure_installed = configParser.treesitter_ensure(),
                auto_install = true,
                sync_install = false,

                -- 高亮
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },

                -- 缩进
                indent = {
                    enable = false,
                    disable = { "python", "yaml" },
                },

                -- 增量选择
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        scope_incremental = "<S-CR>",
                        node_decremental = "<BS>",
                    },
                },
            }
        end,
    },

    -- 文本对象
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        event = "BufReadPost",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },

        opts = {
            textobjects = {
                move = {
                    enable = true,
                    set_jumps = true,

                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]c"] = "@class.outer",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]C"] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[c"] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[C"] = "@class.outer",
                    },
                },

                select = {
                    enable = true,
                    lookahead = true,

                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = "@class.inner",
                    },
                },
            },
        },
    },
}
