-- File: lua/kickstart/plugins/treesitter.lua

-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  cmd = { 'TSUpdate', 'TSInstall', 'TSLog', 'TSUninstall' },
  event = { 'BufReadPre', 'BufNewFile' },
  main = 'nvim-treesitter.config', -- Sets main module to use for opts
  -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'json',
      'jsonc',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'python',
      'query',
      'toml',
      'vim',
      'vimdoc',
      'xml',
      'yaml',
    },
    -- Autoinstall languages that are not installed
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
    folds = { enable = true },
  },
  init = function()
    require('vim.treesitter.query').add_predicate('is-mise?', function(_, _, bufnr, _)
      local filepath = vim.api.nvim_buf_get_name(tonumber(bufnr) or 0)
      local filename = vim.fn.fnamemodify(filepath, ':t')
      return string.match(filename, '.*mise.*%.toml$') ~= nil
    end, { force = true, all = false })
  end,
  -- There are additional nvim-treesitter modules that you can use to interact
  -- with nvim-treesitter. You should go explore a few and see what interests you:
  --
  --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
  --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
  --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
}
