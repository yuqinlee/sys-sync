--  格式化
return {
    "stevearc/conform.nvim",
    dependencies = {
        "mason-org/mason.nvim",
        -- mason 只提供 lsp 安装，而 lsconfig 仅对 lsp 进行配置
        "neovim/nvim-lspconfig",
        -- 用于解决 mason 中 lsp 名字与 lsconfig 中名字不一致问题
        "mason-org/mason-lspconfig.nvim",
    },
    cmd = "ConformInfo", -- 执行该命令加载
    event = "BufWritePre", -- 保存文件前加载
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "black", "isort" },
            bash = { "shellcheck", "beautysh" },
            sh = { "shellcheck", "shfmt" },
            zsh = { "shellcheck", "beautysh" },
            fish = { "fish_indent" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
    config = function(_, opts)
        require("conform").setup(opts)

        local registry = require "mason-registry"

        local function setup(name)
            -- registry.get_package("lua-language-server") 方法返回可能传入参数有问题
            -- 因此这里使用 pcall 去做判断，仅当存在这个包且未安装才进行 install
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end
        end
        -- 将当前语言使用到的 fmt 全部安装
        for _, val in pairs(opts.formatters_by_ft) do
            for i = 1, #val, 1 do
                setup(val[i])
            end
        end
    end,

    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format { lsp_format = true, timeout_ms = 500 }
            end,
            mode = { "n", "x" },
            desc = "format file",
        },
    },
}
