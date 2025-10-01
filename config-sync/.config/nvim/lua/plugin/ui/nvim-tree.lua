-- 左侧目录树展示
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        actions = {
            open_file = {
                quit_on_open = false,
            },
        },
    },
    keys = {
        { "<leader>uf", ":NvimTreeToggle<CR>" },
    },
}

