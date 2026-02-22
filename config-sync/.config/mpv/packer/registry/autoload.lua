return {
    name = "autoload",

    source = {
        type = "git",
        url = "https://github.com/mpv-player/mpv-autoload.git",
        branch = "master",
    },

    install = {
        type = "copy",
        from = "autoload.lua",
        to = "~/.config/mpv/scripts/autoload.lua",
    },
}
