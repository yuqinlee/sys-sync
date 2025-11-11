-- 打开浮动的终端
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup {
            size = 15,
            open_mapping = [[<leader>`]],
            shade_terminals = true,
            direction = "float", -- 浮动
        }
    end,
}
