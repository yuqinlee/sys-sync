return {
    meta = {
        name = "json",
        ft = { "json", "jsonc" },
    },

    lsp = {},

    formatter = {
        prettier = {
            enable = true,
            mason = true,
            opts = {
                conform = {
                    formatters_by_ft = { "prettier" },
                    lsp_fallback = false,
                },
            },
        },
    },

    lint = {},

    dap = {},

    treesitter = {
        enable = true,
        ensure_installed = { "json" },
    },
}
