return {
    "nvimdev/dashboard-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "VimEnter",
    config = function()
        local logo = [[
\ \ / /   _  ___| |__ (_)_ __   | \ | |_   _(_)_ __ ___  
 \ V / | | |/ __| '_ \| | '_ \  |  \| \ \ / / | '_ ` _ \ 
  | || |_| | (__| | | | | | | | | |\  |\ V /| | | | | | |
  |_| \__,_|\___|_| |_|_|_| |_| |_| \_| \_/ |_|_| |_| |_|
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
