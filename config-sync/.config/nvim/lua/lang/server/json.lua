---@type LangConf
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
                    -- 自定义 prettier 变体：JSON 使用 4 空格缩进
                    formatters = {
                        ["prettier-4"] = {
                            command = "prettier",
                            args = {
                                "--stdin-filepath",
                                "$FILENAME",
                                "--tab-width",
                                "4",
                            },
                            stdin = true,
                        },
                    },
                    formatters_by_ft = { "prettier-4" },
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
