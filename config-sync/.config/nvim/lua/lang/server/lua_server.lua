return {
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
            -- NOTE:
            -- opts 这里放的是 lsp 的所有顶层的配置，如 settings、cmd 等
            -- 进行配置时是完全覆盖默认配置项，而不会逐一合并
            opts = {
                settings = {
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
    },

    -- 除了lspconfig 外其他工具是采用的 mason 方式命名
    formatter = {
        stylua = {
            enable = true, -- 是否启用
            mason = true,
            opts = {
                -- 自定义选项，定义如 conform 等配置
                conform = {
                    formatters_by_ft = { "stylua" },
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
}
