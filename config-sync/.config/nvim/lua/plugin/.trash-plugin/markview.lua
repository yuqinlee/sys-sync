-- 不能懒加载
return {
	"OXY2DEV/markview.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts={},
    event="VeryLazy",
	ft = "markdown",
}
