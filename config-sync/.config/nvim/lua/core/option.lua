-- Tips: use `:h <option>` to figure out the meaning if needed

-- ============================================================================
--                           advantage
-- ============================================================================
-- clipboard
vim.opt.clipboard = "unnamedplus" -- use system clipboard
-- mouse
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim
-- terminal color
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
-- make it case sensitive if an uppercase is entered
vim.opt.smartcase = true 
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
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
-- break line
vim.opt.wrap = false -- disable soft break line
-- split
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- ============================================================================
--                               mode 
-- ============================================================================
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.virtualedit = "block" -- `ctrl + v`make virtual mode over line end
-- command
vim.opt.inccommand = "split" -- preview matched word in command mode

-- ============================================================================
--                          code & function 
-- ============================================================================
-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
