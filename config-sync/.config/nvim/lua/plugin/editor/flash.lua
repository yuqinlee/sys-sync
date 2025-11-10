-- 快速定位
return {
	"folke/flash.nvim",
	event = "VeryLazy",
	vscode = true,
	opts = {},
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				-- 直接跳转
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			mode = { "n", "o", "x" },
			function()
				-- 括号等依赖 treesitter 选择
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		{
			"R",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		{
			"<c-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
		-- Simulate nvim-treesitter incremental selection
		{
			"<c-space>",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter({
					actions = {
						["<c-space>"] = "next",
						["<BS>"] = "prev",
					},
				})
			end,
			desc = "Treesitter Incremental Selection",
		},
	},
}
