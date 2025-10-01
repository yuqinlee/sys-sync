-- 快速跳转插件
return {
    "smoka7/hop.nvim",
    opts = {
        hint_position = 3,
    },
    -- hint_position = 3 中 3 是 HintPosition.End 常数值，由于 lazy 加载机制
    -- 如果要写成 End 这种形式需要在 config 中配置，如下
    -- config = function() {
    --     hint_position = require("hop.hint").HintPosition.End
    -- }
    keys = {
        { "<leader>hp", "<Cmd>HopWord<CR>", desc = "hop word", silent = true },
    },
}

