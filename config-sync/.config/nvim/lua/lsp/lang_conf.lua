local M = {}

M.languages = {

    lua = {
        meta = {
            name = "lua",
            ft = { "lua" },
        },
        -- 这里的 lsp 名字以 lspconfig 为准
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        lsp = {
            -- lua_ls 就是 lspconfig 的名字
            lua_ls = {
                enable = true, --是否启用
                mason = true, -- 是否使用 mason 安装
                opts = {
                    Lua = {
                        hint = { -- Lua开启hints
                            enable = true, -- necessary
                        },
                        -- 忽略掉vim配置时一些全局变量语言服务器找不到的警告
                        diagnostics = {
                            globals = { "vim", "require" },
                        },
                    },
                },
            },
        },
        -- 除了lspconfig 外其他工具是采用的 mason 方式命名
        formatter = {
            stylua = {
                enable = true, -- 是否启用
                mason = true,
                opts = {
                    -- 自定义选项，定义如 conform 等配置
                    conform = {
                        fmt_ft = { "stylua" },
                        lsp_fallback = true,
                    },
                },
            },
        },
        lint = {},
        dap = {},
        treesitter = {
            enable = true,
            ensure_installed = { "lua" },
        },
    },

    python = {
        meta = {
            name = "python",
            ft = { "python" },
        },

        lsp = {
            basedpyright = {
                enable = true,
                mason = true,
                opts = {
                    -- 这里可以放 strict 等配置
                    settings = {
                        basedpyright = {
                            analysis = {
                                typeCheckingMode = "strict",
                            },
                        },
                    },
                },
            },
        },

        formatter = {
            ruff = {
                enable = true,
                mason = true,
                opts = {
                    conform = {
                        -- conform 内置 formatter 名称
                        fmt_ft = { "ruff_format" },
                        lsp_fallback = false,
                    },
                },
            },
        },

        -- lint 也改为具名结构（统一模型）
        lint = {
            ruff = {
                enable = true,
                mason = true,
                opts = {},
            },
        },

        dap = {},

        treesitter = {
            enable = true,
            ensure_installed = { "python" },
        },
    },

    vim = {
        meta = {
            name = "vim",
            ft = { "vim" },
        },
        treesitter = {
            enable = true,
            ensure_installed = { "vim", "vimdoc" },
        },
    },

    markdown = {
        meta = {
            name = "markdown",
            ft = { "markdown" },
        },
        treesitter = {
            enable = true,
            ensure_installed = { "markdown", "markdown_inline" },
        },
    },
}

return M
