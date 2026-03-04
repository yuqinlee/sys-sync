return {
    meta = {
        name = "toml",
        ft = { "toml" },
    },

    lsp = {
        taplo = {
            enable = true,
            mason = true,
            opts = {},
        },
    },

    formatter = {
        taplo = {
            enable = true,
            mason = true,
            opts = {
                conform = {
                    formatters_by_ft = { "taplo" },
                    lsp_fallback = false,
                },
            },
        },
    },

    lint = {},

    dap = {},

    treesitter = {
        enable = true,
        ensure_installed = { "toml" },
    },
}
