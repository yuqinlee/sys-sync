-- 打开浮动的终端
return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup {
            size = 10,
            open_mapping = [[<leader>`]],
            shade_terminals = true,
            direction = "float", -- 浮动
        }
    end,
}
