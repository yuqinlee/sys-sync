return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>ft", "<cmd>Neotree reveal  toggle<CR>", desc = "Toggle NeoTree" },
        { "<leader>ff", "<cmd>Neotree reveal  focus<CR>", desc = "Focus to Neotree" },
    },
    opts = {
        close_if_last_window = true,
        filesystem = {
            follow_current_file = true,
            use_libuv_file_watcher = true,
            hijack_netrw_behavior = "open_default",
            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        },
        window = {
            position = "left",
            width = 40,
        },
        default_component_configs = {
            name = {
                path_display = function(_, path)
                    return vim.fn.fnamemodify(path, ":t") -- 只显示名字
                end,
            },
            git_status = {
                symbols = {
                    added = "✚",
                    modified = "",
                    removed = "✖",
                },
            },
        },
    },
}
