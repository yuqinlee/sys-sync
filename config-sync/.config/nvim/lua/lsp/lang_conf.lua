local M = {}

M.languages = {

    lua = {
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
                        fmt_ft = { "stylua" },
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
    },

    python = {
        meta = {
            name = "python",
            ft = { "python" },
        },

        lsp = {
            basedpyright = {
                enable = true,
                mason = true,
                opts = {
                    -- 这里可以放 strict 等配置
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
                        fmt_ft = { "ruff_format" },
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
    },

    vim = {
        meta = {
            name = "vim",
            ft = { "vim" },
        },
        treesitter = {
            enable = true,
            ensure_installed = { "vim", "vimdoc" },
        },
    },

    markdown = {
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
                        fmt_ft = { "prettier" },
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
    },

    shell = {
        meta = {
            name = "shell",
            ft = { "sh", "bash", "zsh" },
        },

        lsp = {
            -- bash-language-server
            bashls = {
                enable = true,
                mason = true,
                opts = {},
            },
        },

        formatter = {
            shfmt = {
                enable = true,
                mason = true,
                opts = {
                    conform = {
                        fmt_ft = { "shfmt" },
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
    },

    c_family = {
        meta = {
            name = "c_family",
            ft = { "c", "cpp", "objc", "objcpp" },
        },

        lsp = {
            clangd = {
                enable = true,
                mason = true,
                opts = {
                    cmd = {
                        "clangd",
                        "--background-index",
                        "--clang-tidy",
                        "--completion-style=detailed",
                        "--header-insertion=never",
                    },
                    init_options = {
                        clangdFileStatus = true,
                    },
                },
            },
            -- WARN:
            -- 2026-02-22 使用 mason 安装报错，提示依赖 python 版本需要小于 3.14
            -- 暂时先不使用 cmake 的 lsp，本身 clangd 里边其实是带的
            cmake = {
                enable = true,
                mason = false,
                opts = {},
            },
        },

        formatter = {
            ["clang-format"] = {
                enable = true,
                mason = true,
                opts = {
                    conform = {
                        -- INFO:
                        -- 外层的是由 mason 等安装的基本工具
                        -- 这里的 formatters 是给 confom 重包装的
                        -- 根本原因是 confom 可以使用自定义 formatter
                        formatters = {
                            ["clang-format-with-args"] = {
                                command = "clang-format",
                                args = {
                                    '-style={"BasedOnStyle":"LLVM","IndentWidth":4,"BreakBeforeBraces":"Attach","PointerAlignment":"Left"}',
                                    "-assume-filename=dummy.cpp",
                                },
                                stdin = true,
                            },
                        },
                        -- INFO:
                        -- 同样对应 confom 的 formatters_by_ft 配置
                        -- 这里就是选择一个 formatter
                        formatters_by_ft = { "clang-format-with-args" },
                        lsp_fallback = false,
                    },
                },
            },
        },

        -- 交由 clangd 处理
        lint = {},

        dap = {},

        treesitter = {
            enable = true,
            ensure_installed = { "c", "cpp", "cmake" },
        },
    },
}

return M
