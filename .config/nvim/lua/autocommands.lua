-- File: lua/autocommands.lua

--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
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
