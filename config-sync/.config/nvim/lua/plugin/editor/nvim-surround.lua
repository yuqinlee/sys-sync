-- 添加括号 / 引号 / tag
-- 01 <ys><i><w>+" 使用引号包裹
-- 02 <ys><i><w>t+tag 使用 tag 包裹 
-- 03 visual 选中后 shift+s 即可添加包裹
-- 04 cs/ds + 包裹符号 修改或删除
return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    opts = {},
}

