-- 引入 lazyvim 管理 nvim 插件,没有安装 lazy 则后会自动安装
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    spec = {
        {import = "plugin.ui"},
        {import = "plugin.treesitter"},
        {import = "plugin.lsp"},
        {import = "plugin.tools"},
    },
})

