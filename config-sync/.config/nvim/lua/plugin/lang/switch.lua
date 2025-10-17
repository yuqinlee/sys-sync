-- 切换 checkbox 状态、表格圆角等
return {
	"AndrewRadev/switch.vim",
	ft = { "markdown" },
	config = function()
		vim.keymap.set("n", "`", function()
			vim.cmd([[Switch]])
		end, { desc = "Switch strings" })
		vim.g.switch_custom_definitions = {
			{ "> [!TODO]", "> [!WIP]", "> [!DONE]", "> [!FAIL]" },
			{ "height", "width" },
		}
	end,
}
