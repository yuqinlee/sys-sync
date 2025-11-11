-- 大纲
return {
    "stevearc/aerial.nvim",
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        -- Priority list of preferred backends for aerial.
        -- This can be a filetype map (see :help aerial-filetype-map)
        backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },

        layout = {
            -- These control the width of the aerial window.
            -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
            -- min_width and max_width can be a list of mixed types.
            -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
            max_width = { 60, 0.5 },
            width = nil,
            min_width = 40,

            -- key-value pairs of window-local options for aerial window (e.g. winhl)
            win_opts = {},

            -- Determines the default direction to open the aerial window. The 'prefer'
            -- options will open the window in the other direction *if* there is a
            -- different buffer in the way of the preferred direction
            -- Enum: prefer_right, prefer_left, right, left, float
            default_direction = "prefer_right",

            -- Determines where the aerial window will be opened
            --   edge   - open aerial at the far right/left of the editor
            --   window - open aerial to the right/left of the current window
            placement = "window",

            -- When the symbols change, resize the aerial window (within min/max constraints) to fit
            resize_to_content = true,

            -- Preserve window size equality with (:help CTRL-W_=)
            preserve_equality = false,
        },

        show_guides = true,

        -- Determines how the aerial window decides which buffer to display symbols for
        --   window - aerial window will display symbols for the buffer in the window from which it was opened
        --   global - aerial window will display symbols for the current window
        attach_mode = "window",

        -- List of enum values that configure when to auto-close the aerial window
        --   unfocus       - close aerial when you leave the original source window
        --   switch_buffer - close aerial when you change buffers in the source window
        --   unsupported   - close aerial when attaching to a buffer that has no symbol source
        close_automatic_events = {},
    },
    keys = {
        { "<leader>o", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial Outline" },
    },
}
