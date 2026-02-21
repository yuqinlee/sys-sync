-- fzf
return {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    opts = {},
    keys = {
        { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
        { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
        {
            "<leader>fb",
            "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
            desc = "Switch Buffer",
        },
    },
}
