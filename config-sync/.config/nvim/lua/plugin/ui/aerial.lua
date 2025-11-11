-- 大纲
return {
    "stevearc/aerial.nvim",
    opts = {
        layout = {
            default_direction = "prefer_right",
        },
        show_guides = true,
    },
    keys = {
        { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial Outline" },
    },
}
