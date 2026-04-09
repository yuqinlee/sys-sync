return {
    meta = {
        name = "frontend",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "vue",
            "css",
            "scss",
            "less",
            "html",
            "json",
        },
    },

    lsp = {
        -- TypeScript / JavaScript
        ts_ls = {
            enable = true,
            mason = true,
            opts = {},
        },

        -- Vue3（推荐 Volar）
        vue_ls = {
            enable = true,
            mason = true,
            opts = {},
        },

        -- HTML
        html = {
            enable = true,
            mason = true,
            opts = {},
        },

        -- CSS / SCSS / LESS
        cssls = {
            enable = true,
            mason = true,
            opts = {},
        },

        -- ESLint（作为 LSP）
        eslint = {
            enable = true,
            mason = true,
            opts = {
                settings = {
                    format = false, -- 交给 prettier
                },
            },
        },
    },

    formatter = {
        prettier = {
            enable = true,
            mason = true,
            opts = {
                conform = {
                    formatters_by_ft = {
                        javascript = { "prettier" },
                        javascriptreact = { "prettier" },
                        typescript = { "prettier" },
                        typescriptreact = { "prettier" },
                        vue = { "prettier" },
                        css = { "prettier" },
                        scss = { "prettier" },
                        less = { "prettier" },
                        html = { "prettier" },
                        json = { "prettier" },
                    },
                    lsp_fallback = true,
                },
            },
        },
    },

    lint = {
        eslint_d = {
            enable = true,
            mason = true,
            opts = {},
        },
    },

    dap = {},

    treesitter = {
        enable = true,
        ensure_installed = {
            "javascript",
            "typescript",
            "tsx",
            "vue",
            "html",
            "css",
            "json",
            "scss",
        },
    },
}
