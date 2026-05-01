return {
    meta = {
        name = "xml",
        ft = { "xml" },
    },
    -- 这里的 lsp 名字以 lspconfig 为准
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    lsp = {
        -- lemminx 是 XML 的 LSP 服务器
        lemminx = {
            enable = true, -- 是否启用
            mason = true, -- 是否使用 mason 安装
            -- NOTE:
            -- opts 这里放的是 lsp 的所有顶层的配置，如 settings、cmd 等
            -- 进行配置时是完全覆盖默认配置项，而不会逐一合并
            opts = {
                capabilities = {
                    textDocument = {
                        completion = {
                            completionItem = {
                                commitCharactersSupport = false,
                                deprecatedSupport = true,
                                documentationFormat = { "markdown", "plaintext" },
                                insertReplaceSupport = true,
                                insertTextModeSupport = {
                                    valueSet = { 1 },
                                },
                                labelDetailsSupport = true,
                                preselectSupport = false,
                                resolveSupport = {
                                    properties = { "documentation", "detail", "additionalTextEdits", "command", "data" },
                                },
                                snippetSupport = true,
                                tagSupport = {
                                    valueSet = { 1 },
                                },
                            },
                            completionList = {
                                itemDefaults = {
                                    "commitCharacters",
                                    "editRange",
                                    "insertTextFormat",
                                    "insertTextMode",
                                    "data",
                                },
                            },
                            contextSupport = true,
                            insertTextMode = 1,
                        },
                    },
                },
                cmd = { "lemminx" },
                root_markers = { ".git" },
                filetypes = { "xml", "xsd", "xslt", "svg" },
                settings = {
                    xml = {
                        server = {
                            workDir = vim.fn.stdpath "cache" .. "/lemminx",
                        },
                        -- 格式化
                        format = {
                            enabled = true,
                            -- 每一级的缩进空格数
                            tabSize = 4,
                            -- 使用空格而不是制表符
                            insertSpaces = true,
                            -- 每行最大长度防止自动换行
                            maxLineWidth = 120,
                            -- 每行最大长度防止自动换行
                            lineWidth = 120,
                            -- 修剪尾随空格
                            trimTrailingWhitespace = true,
                            -- 文件末尾保留一个新行
                            insertFinalNewline = true,
                        },
                    },
                },
            },
        },
    },

    -- 除了 lspconfig 外其他工具是采用的 mason 方式命名
    formatter = {
        -- XML 的格式化工具，可以使用 xmllint 或其他
        xmllint = {
            enable = false, -- 是否启用
            mason = false, -- xmllint 是本地的工具
            opts = {
                -- 自定义选项，定义如 conform 等配置
                conform = {
                    formatters_by_ft = { "xmllint" },
                    lsp_fallback = true,
                },
            },
        },
    },

    lint = {},
    dap = {},
    treesitter = {
        enable = true,
        ensure_installed = { "xml" },
    },
}
