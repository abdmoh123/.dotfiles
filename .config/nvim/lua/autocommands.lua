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

-- enable tree sitter on file open
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter-enable', { clear = true }),
  callback = function(args)
    -- skip if file doesn't have a file type
    local lang = vim.treesitter.language.get_lang(args.match)
    if not lang then
      return
    end

    -- enable highlights if file supports it and the parser is installed
    if vim.treesitter.query.get(lang, 'highlights') then
      vim.treesitter.start(args.buf)
    end

    -- enable indentation if file supports it and the parser is installed
    if vim.treesitter.query.get(lang, 'indents') then
      vim.opt_local.indentexpr = 'v:lua.require("nvim-treesitter").indentexpr()'
    end

    -- NOTE: Folds are not enabled as that will be handled by nvim-ufo
  end,
})
