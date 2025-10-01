require("core.keymap")
require("core.basic")
-- 仅在 Linux 且安装了 fcitx5-remote 时启用
if vim.fn.has("unix") == 1 and vim.fn.executable("fcitx5-remote") == 1 then
  local fcitx5_last_status = 1

  -- 进入 Normal 模式时，强制切到英文，并保存之前的状态
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*:n",  -- 进入 normal
    callback = function()
      fcitx5_last_status = tonumber(vim.fn.system("fcitx5-remote"))
      vim.fn.system("fcitx5-remote -c")  -- 强制英文
    end,
  })

  -- 离开 Normal 模式时（进入 insert/visual/cmdline 等），恢复原状态
  vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "n:*",  -- 从 normal 切到其他模式
    callback = function()
      if fcitx5_last_status == 2 then
        vim.fn.system("fcitx5-remote -o")  -- 恢复中文
      end
    end,
  })
else
  vim.notify("fcitx5 integration disabled: not Linux or fcitx5-remote not found", vim.log.levels.INFO)
end
