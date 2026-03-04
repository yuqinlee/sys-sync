return {
    meta = {
        name = "python",
        ft = { "python" },
    },

    lsp = {
        basedpyright = {
            enable = true,
            mason = true,
            opts = {
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
                    formatters_by_ft = { "ruff_import", "ruff_format" },
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
}
