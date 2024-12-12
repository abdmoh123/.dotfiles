-- File: lua/options.lua

-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- [[ General UI settings ]]
vim.opt.background = 'dark'

vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- Make line numbers relative to cursor
vim.opt.signcolumn = 'yes:1' -- Keep signcolumn on by default

vim.opt.termguicolors = true -- Enable termguicolors to fix visual issues

vim.opt.cursorline = false -- Show which line your cursor is on
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Disable line wrapping
vim.opt.wrap = false
-- Set code margin
vim.opt.colorcolumn = '120'

vim.opt.fillchars = {
  -- thicker window separators
  horiz = '━',
  horizup = '┻',
  horizdown = '┳',
  vert = '┃',
  vertleft = '┫',
  vertright = '┣',
  verthoriz = '╋',
  -- code folding icons
  foldopen = '',
  foldclose = '',
  foldsep = '▕',
  -- remove end of line ~ character
  eob = ' ',
}

-- [[ Control settings ]]
vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mousemoveevent = true -- Enable mouse move event, useful for hover events like in bufferline plugin

vim.opt.scrolloff = 10 -- Minimal number of screen lines to keep above and below the cursor

vim.opt.breakindent = true -- Enable break indent

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.tabstop = 4 -- tab = 4 spaces
vim.opt.shiftwidth = 4 -- auto indented tabs = 4 spaces
vim.opt.expandtab = true -- tabs are replaced with 4 spaces (override with CTRL-V <tab>)

-- Code folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = 'auto' -- Only 1 column max (can be 0) for code folding icons
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldtext = ''

-- [[ Utils and convenience ]]
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.opt.undofile = true -- Save undo history

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true -- Set highlight on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlighting on pressing <Esc> in normal mode
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!

vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time (displays which key sooner)
vim.opt.updatetime = 250 -- Decrease update time
