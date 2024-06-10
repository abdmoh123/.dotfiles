-- File: lua/options.lua

-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Set default shell to powershell if possible (windows only)
if vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1 then
  vim.opt.shell = vim.fn.executable 'pwsh' and 'pwsh' or 'powershell'
  vim.opt.shellcmdflag =
    '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
  vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
  vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
  vim.opt.shellquote = ''
  vim.opt.shellxquote = ''
end

-- [[ General UI settings ]]
vim.opt.background = 'dark'

vim.opt.number = true -- Make line numbers default
vim.opt.relativenumber = true -- Make line numbers relative to cursor
vim.opt.signcolumn = 'auto:1-3' -- Keep signcolumn on by default
vim.opt.foldcolumn = 'auto' -- Only 1 column max (can be 0) for code folding icons

vim.opt.termguicolors = true -- Enable termguicolors to fix visual issues

vim.opt.cursorline = false -- Show which line your cursor is on
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

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
  fold = ' ', -- no numbers
  foldopen = '',
  foldclose = '',
  foldsep = ' ',
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

-- [[ Utils and convenience ]]
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.opt.undofile = true -- Save undo history

vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.smartcase = true -- Become case sensitive if a captial letter is included in the search term
vim.opt.hlsearch = true -- Set highlight on search
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlighting on pressing <Esc> in normal mode
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!

vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.opt.updatetime = 250 -- Decrease update time
