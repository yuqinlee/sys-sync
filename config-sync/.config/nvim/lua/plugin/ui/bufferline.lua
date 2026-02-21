-- 标签页
return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- 给每个 buffer 增加好看的图标
    },
    event = "VeryLazy",
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local indicator = " "
                for level, number in pairs(diagnostics_dict) do
                    local symbol
                    if level == "error" then
                        symbol = " "
                    elseif level == "warning" then
                        symbol = " "
                    else
                        symbol = " "
                    end
                    indicator = indicator .. number .. symbol
                end
                return indicator
            end,
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                },
                {
                    filetype = "neo-tree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true,
                },
            },
        },
    },

    -- lazy 提供的快捷键绑定方式
    keys = {
        -- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
        -- { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
        -- { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
        -- { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
        { "<leader>q", "<Cmd>bdelete<CR>", desc = "Delete current buffer" },
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        -- { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        -- { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
        -- { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
        -- { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
}
