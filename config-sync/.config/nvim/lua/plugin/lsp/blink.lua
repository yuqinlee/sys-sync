-- LSP 等补全信息选择
return {
    "saghen/blink.cmp",
    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- optional: provides snippets for the snippet source
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        snippets = {
            preset = "default",
        },
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "super-tab",

            ["<C-k>"] = { "select_prev", "fallback" },
            ["<C-j>"] = { "select_next", "fallback" },

            -- show with a list of providers
            ["<leader>cc"] = {
                function(cmp)
                    cmp.show { providers = { "snippets" } }
                end,
            },
        },
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        appearance = {
            -- sets the fallback highlight groups to nvim-cmp's highlight groups
            -- useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release, assuming themes add support
            use_nvim_cmp_as_default = false,
            -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono",
        },
        completion = {
            accept = {
                -- experimental auto-brackets support
                auto_brackets = {
                    enabled = true,
                },
            },
            menu = {
                border = "single",
                draw = {
                    treesitter = { "lsp" },
                    padding = { 0, 1 }, -- padding only on right side
                    components = {
                        kind_icon = {
                            text = function(ctx)
                                return " " .. ctx.kind_icon .. ctx.icon_gap .. " "
                            end,
                        },
                    },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 100,
                window = { border = "single" },
            },
            ghost_text = {
                enabled = vim.g.ai_cmp,
            },
        },
        signature = { window = { border = "single" } },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = {
                providers = {
                    path = {
                        opts = {
                            get_cwd = function(_)
                                return vim.fn.getcwd()
                            end,
                        },
                    },
                },
                "path",
                "lsp",
                "buffer",
                "snippets",
            },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = {
            sorts = {
                "exact",
                -- defaults
                "score",
                "sort_text",
            },
            implementation = "prefer_rust_with_warning",
        },
        cmdline = {
            enabled = true,
            keymap = {
                preset = "super-tab",
            },
            sources = function()
                local cmd_type = vim.fn.getcmdtype()
                if cmd_type == "/" or cmd_type == "?" then
                    return { "buffer" }
                end
                if cmd_type == ":" then
                    return { "cmdline" } -- cmdline 是 blink 自己提供的一个 source
                end
                return {}
            end,
            completion = {
                menu = {
                    auto_show = true,
                },
            },
        },
    },
}
