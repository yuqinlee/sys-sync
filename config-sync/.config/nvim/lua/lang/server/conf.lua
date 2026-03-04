return {
    meta = {
        name = "conf",
        ft = { "conf", "ini", "cfg" },
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
    },
}
