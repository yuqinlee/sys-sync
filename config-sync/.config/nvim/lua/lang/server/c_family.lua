return {
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
                                -- '-style={"BasedOnStyle":"LLVM","IndentWidth":4,"BreakBeforeBraces":"Attach","PointerAlignment":"Left"}',
                                '-style={"BasedOnStyle":"LLVM","IndentWidth":4,"PointerAlignment":"Left","BreakBeforeBraces":"Attach","AllowShortFunctionsOnASingleLine":"None","AllowShortIfStatementsOnASingleLine":false,"AllowShortLoopsOnASingleLine":false,"SpaceBeforeParens":"Custom","SpaceBeforeParensOptions":{"AfterFunctionDeclarationName":true,"AfterFunctionDefinitionName":true}}',
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
}
