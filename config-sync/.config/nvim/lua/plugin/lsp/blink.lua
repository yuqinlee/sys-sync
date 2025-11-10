-- LSP 等补全信息选择
return {
	"saghen/blink.cmp",
	version = "*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		snippets = {
			preset = "default",
		},
		appearance = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = false,
			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = vim.g.ai_cmp,
			},
		},
		sources = {
			default = { "path", "snippets", "buffer", "lsp" },
		},

		keymap = {
			preset = "super-tab",
		},

		cmdline = {
			enabled = true,
			keymap = {
				preset = "super-tab",
			},
			sources = function()
				local cmd_type = vim.fn.getcmdtype()
				if cmd_type == "/" or cmd_type == "?" then
					return { "buffer" }
				end
				if cmd_type == ":" then
					return { "cmdline" } -- cmdline 是 blink 自己提供的一个 source
				end
				return {}
			end,
			completion = {
				menu = {
					auto_show = true,
				},
			},
		},
	},
}
