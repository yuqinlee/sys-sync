return {
    meta = {
        name = "vim",
        ft = { "vim" },
    },
    treesitter = {
        enable = true,
        ensure_installed = { "vim", "vimdoc" },
    },
}
