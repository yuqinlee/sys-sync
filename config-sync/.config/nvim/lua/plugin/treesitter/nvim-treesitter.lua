-- 语法树分析
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",
        "toml",
        "yaml",
        "markdown",
        "markdown_inline",
        "python",
        "java",
        "sql",
      },

      -- 有 parser 缺失时自动安装
      auto_install = true,

      -- 安装时使用 git（比 curl 稳定）
      prefer_git = true,

      highlight = {
        enable = true,

        -- 避免大文件卡死
        disable = function(lang, buf)
          local max_filesize = 200 * 1024 -- 200 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,

        -- 如果你用传统 syntax，也可以关掉
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
        disable = { "yaml" }, -- yaml 缩进偶尔抽风
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          node_decremental = "grm",
          scope_incremental = "grc",
        },
      },
    })
  end,
}

