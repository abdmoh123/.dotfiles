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

-- auto enable preview on oil.nvim window
vim.api.nvim_create_autocmd('User', {
  pattern = 'OilEnter',
  callback = vim.schedule_wrap(function(args)
    local oil = require 'oil'
    if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
      oil.open_preview()
    end
  end),
})
