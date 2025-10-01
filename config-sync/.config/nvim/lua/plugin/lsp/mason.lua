-- LSP config
return {
	"mason-org/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		-- mason 只提供 lsp 安装，而 lsconfig 仅对 lsp 进行配置
		"neovim/nvim-lspconfig",
		-- 用于解决 mason 中 lsp 名字与 lsconfig 中名字不一致问题
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")

		local function setup(name, config)
			-- registry.get_package("lua-language-server") 方法返回可能传入参数有问题
			-- 因此这里使用 pcall 去做判断，仅当存在这个包且未安装才进行 install
			local success, package = pcall(registry.get_package, name)
			if success and not package:is_installed() then
				package:install()
			end

			-- 在使用 mascon-lspconfig 后可使用与 mason 中 lsp 相同格式命名
			-- 这里实际上做了一个映射
			local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]

			-- 这里添加的 blink.cmp 去获取了 capabilities 是
			config.capabilities = require("blink.cmp").get_lsp_capabilities()
			-- 告诉这里的 lsp 不要负责格式化
			config.on_attach = function(server)
				server.server_capabilities.documentFormattingProvider = false
				server.server_capabilities.documentRangeFormattingProvider = false
			end

			-- 这里将 nvim_lsp 进行配置，则在启动 nvim 时能获取 lsp 支持
			vim.lsp.config(lsp, config)
		end

		local servers = {
			["lua-language-server"] = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
			["pyright"] = {},
			["html-lsp"] = {},
			["css-lsp"] = {},
			["typescript-language-server"] = {},
			["emmet-ls"] = {},
		}

		for server, config in pairs(servers) do
			setup(server, config)
		end

		-- 这里需要手动启动一下，因为 lazy 加载时先进行文件 fileTye（ft）检测
		-- 后启动 mason 不手动启动 lsp 不会被激活
		-- vim.cmd("LspStart")

		local function lsp_start()
			-- Do not directly call `LspStart` (although the code below is pretty much word-to-word copied from the command)
			-- The reason is that `LspStart` would raise an error if no matching server is configured. This becomes an issue
			-- when the first file we open does not have a matching server. Therefore, we gotta check whether a server
			-- exists first.
			local servers = {}
			local filetype = vim.bo.filetype
			---@diagnostic disable-next-line: invisible
			for name, _ in pairs(vim.lsp.config._configs) do
				local filetypes = vim.lsp.config[name].filetypes
				if filetypes and vim.tbl_contains(filetypes, filetype) then
					table.insert(servers, name)
				end
			end

			if #servers > 0 then
				vim.lsp.enable(servers)
			end
		end

		lsp_start()

		-- 显示错误信息
		vim.diagnostic.config({
			virtual_text = true, -- 允许虚拟文本显示
			-- virtual_lines = true, -- 以行的形式展示错误
			update_in_insert = true, -- 允许 insert 模式下实时更新警告错误信息
		})
	end,
}
