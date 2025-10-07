-- 状态栏
return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "VeryLazy",
	opts = {
		options = {
			theme = "auto",
			-- component_separators = { left = "", right = "" },
			-- section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		extensions = { "nvim-tree" },
		sections = {
			lualine_a = {
				{
					"mode",
					icons_enabled = true,
				},
			},
			lualine_b = {
				"filename",
			},
			lualine_c = {
				"branch",
				"diff",
			},
			lualine_x = {},
			lualine_y = {
				"filesize",
				{
					"fileformat",
					symbols = {
						unix = "", -- e712
						dos = "", -- e70f
						mac = "", -- e711
					},
				},
				"encoding",
				"filetype",
			},
			lualine_z = {
				"progress",
			},
		},
	},
}
