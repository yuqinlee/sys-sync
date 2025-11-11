-- theme plugin
return {
    "olimorris/onedarkpro.nvim",
    opts = {
        options = {
            transparency = true,
        },
    },
    -- 这里以 函数 形式启动了这个插件，这样在启动之余可以做额外操作
    -- 如果这里不配置这个函数，lazy 会自动执行 `require('tokyonight').setup(opts)`
    -- 自动加载有一个前提就是设置了 opts 属性或者 config 属性
    config = function(_, opts)
        require("onedarkpro").setup(opts)
        -- 这里是打开 vim 时候执行主题修改
        vim.cmd "colorscheme onedark"

        -- 关闭 nvim 的背景颜色 该方式配置并没有办法保证完美的透明
        -- vim.cmd("hi Normal ctermbg=NONE guibg=NONE")
        -- vim.cmd("hi NonText ctermbg=NONE guibg=NONE")
    end,
}
