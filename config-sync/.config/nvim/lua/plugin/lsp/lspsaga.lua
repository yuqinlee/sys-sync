-- 跳转与重命名等功能
return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	dependencies = {
		"nvim-treesitter/nvim-treesitter", -- 用于语法高亮
		"neovim/nvim-lspconfig", -- LSP 支持
		"nvim-tree/nvim-web-devicons", -- 图标支持（可选）
	},
	opts = {
		ui = {
			code_action = "",
		},
		lightbulb = {
			enable = false,
			virtual_text = false,
		},
		-- 面包屑功能
		symbol_in_winbar = {
			enable = true, -- 开启面包屑
			separator = " > ", -- 分隔符，可改为 " > "
			ignore_patterns = {}, -- 忽略哪些文件类型
			hide_keyword = true, -- 隐藏关键字，如 function/class
			show_file = true, -- 在最前面显示文件名
			folder_level = 1, -- 文件夹层级深度
			color_mode = true, -- 是否使用高亮颜色
		},
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
	},
	keys = {
		{ "<leader>lr", ":Lspsaga rename<CR>" },
		{ "<leader>lc", ":Lspsaga code_action<CR>" },
		{ "<leader>ld", ":Lspsaga goto_definition<CR>" },
		{ "<leader>lh", ":Lspsaga hover_doc<CR>" },
		{ "<leader>lR", ":Lspsaga finder<CR>" },
		{ "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>" },
		{ "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>" },
	},
}
