return {
    meta = {
        name = "markdown",
        ft = { "markdown" },
    },

    lsp = {
        marksman = {
            enable = true,
            mason = true,
            opts = {
                -- 这里专门制定该文件类型对应 markdown
                -- 不指定 lsp 会默认带有 markdown.mdx 类型警告，这是 nvim 没有的
                filetypes = { "markdown" },
            },
        },
    },

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

    lint = {
        markdownlint = {
            enable = true,
            mason = true,
            opts = {
                -- 这里使用了 nvim_lint 的是 cli 类 lint，而不是 lsp 类
                -- 置空就不会注册进 nvim-lint
                nvim_lint = {
                    cmd = { "markdownlint" },
                },
            },
        },
    },

    dap = {},

    treesitter = {
        enable = true,
        ensure_installed = { "markdown", "markdown_inline" },
    },
}
