return {
    "nvimdev/dashboard-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VimEnter",
    config = function()
        local logo = [[
            yuchin's neovim  
        ]]

        logo = string.rep("\n", 8) .. logo .. "\n\n"

        local opts = {
            theme = "doom",
            config = {
                header = vim.split(logo, "\n"),
            },
        }
        require("dashboard").setup(opts)
    end,
}
