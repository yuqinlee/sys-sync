return {
    meta = {
        name = "shell",
        ft = { "sh", "bash", "zsh" },
    },

    lsp = {
        -- bash-language-server
        bashls = {
            enable = true,
            mason = true,
            opts = {
                filetypes = { "sh", "bash", "zsh" },
            },
        },
    },

    formatter = {
        shfmt = {
            enable = true,
            mason = true,
            opts = {
                conform = {
                    formatters_by_ft = { "shfmt" },
                    lsp_fallback = false,
                },
            },
        },
    },

    lint = {
        shellcheck = {
            enable = true,
            mason = true,
            opts = {},
        },
    },

    dap = {},

    treesitter = {
        enable = true,
        ensure_installed = { "bash" },
    },
}
