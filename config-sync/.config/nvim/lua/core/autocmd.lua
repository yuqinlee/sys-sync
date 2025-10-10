-- 自动保存
local function clear_cmdarea()
	vim.defer_fn(function()
		vim.api.nvim_echo({}, false, {})
	end, 800)
end
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
	callback = function()
		if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
			vim.cmd("silent w")

			local time = os.date("%I:%M %p")

			-- print nice colored msg
			vim.api.nvim_echo({ { " 󰄳 ", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})

			clear_cmdarea()
		end
	end,
})

-- fcitx5 输入法切换
if vim.fn.has("unix") == 1 and vim.fn.executable("fcitx5-remote") == 1 then
	local fcitx5_last_status = tonumber("1")

	-- insert 模式进入任何模式都会切换英文并记录原状态
	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "i:*", -- 进入 normal 模式
		callback = function()
			fcitx5_last_status = tonumber(vim.fn.system("fcitx5-remote"))
			vim.fn.system("fcitx5-remote -c") -- 切英文
		end,
	})

	-- 任何模式进入 insert 模式后都会恢复原先 insert 模式状态
	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "*:i", -- 仅限从 normal 到 insert
		callback = function()
			if fcitx5_last_status == 2 then
				vim.fn.system("fcitx5-remote -o") -- 恢复中文
			end
		end,
	})
end
