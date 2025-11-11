-- 左侧目录树展示
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        sort_by = "case_sensitive",
        actions = {
            open_file = {
                quit_on_open = false,
            },
        },
        -- 是否显示 git 状态
        git = {
            enable = true,
        },
        -- 过滤文件
        filters = {
            dotfiles = false, -- 过滤 dotfile
            custom = {}, -- 其他过滤目录
        },
        view = {
            -- 文件浏览器展示位置，左侧：left, 右侧：right
            side = "left",
            -- 行号是否显示
            number = true,
            relativenumber = true,
            signcolumn = "yes", -- 显示图标
            width = 30,
        },
        renderer = {
            group_empty = true,
        },
    },
    keys = {
        { "<leader>e", ":NvimTreeToggle<CR>" },
    },
}
