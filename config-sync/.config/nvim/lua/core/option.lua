-- Tips: use `:h <option>` to figure out the meaning if needed

-- ============================================================================
--                           advantage
-- ============================================================================
-- clipboard use system
vim.opt.clipboard = "unnamedplus"
-- mouse
vim.opt.completeopt = { "menu", "menuone", "noselect" }
-- allow mouse to be used in nvim
vim.opt.mouse = "a"
-- terminal color
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
-- make it case sensitive if an uppercase is entered
vim.opt.smartcase = true

-- cmd line
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 1

-- allow hiding modified buffer
vim.opt.hidden = true

-- ============================================================================
--                              editor
-- ============================================================================
-- tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- line number
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side

-- cursor
vim.opt.cursorline = true

-- break line
vim.opt.wrap = false -- disable soft break line

-- split
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right

vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- auto read
vim.opt.autoread = true -- file when modified externally

-- space show
vim.opt.list = false
vim.opt.listchars = {
    space = "·",
    tab = "»·",
    trail = "•",
    extends = ">",
    precedes = "<",
    nbsp = "␣",
}
-- ============================================================================
--                               mode
-- ============================================================================
-- lualine instead
vim.opt.showmode = false

-- virtual
vim.opt.virtualedit = "block" -- `ctrl + v` make virtual mode over line end

-- command
vim.opt.inccommand = "split" -- preview matched word in command mode

-- ============================================================================
--                          code & function
-- ============================================================================
-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- disable highlight for search matches
vim.opt.ignorecase = true -- ignore case in searches by default
