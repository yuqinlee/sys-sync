-- theme plugin
return {
    "folke/tokyonight.nvim",
    opts = {
        style = "moon",
    },
    -- 这里以 函数 形式启动了这个插件，这样在启动之余可以做额外操作
    -- 如果这里不配置这个函数，lazy 会自动执行 `require('tokyonight').setup(opts)`
    -- 自动加载有一个前提就是设置了 opts 属性或者 config 属性
    config = function (_, opts)
        require("tokyonight").setup(opts)
        -- 这里是打开 vim 时候执行主题修改
        vim.cmd("colorscheme tokyonight")  
    end
}

