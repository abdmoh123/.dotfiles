-- File: lua/autocommands.lua

--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- disable ufo on neotree
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'neo-tree' },
  callback = function()
    require('ufo').detach()
    vim.opt_local.foldenable = false
  end,
})

-- enable spell checker on markdown and text files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.opt_local.spell = true
    vim.opt.spelllang:append 'en_us'
  end,
})
