return {
  'akinsho/git-conflict.nvim',
  version = false,
  opts = {
    default_mappings = {
      ours = 'o',
      theirs = 't',
      none = '0',
      both = 'b',
      next = 'n',
      prev = 'p',
    },
  },
  config = true,
  init = function()
    vim.keymap.set('n', '<leader>gc', '<cmd>GitConflictListQf<cr>', { desc = 'Open Git conflict quick fix list' })
  end,
}
