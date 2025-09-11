return {
  'FabijanZulj/blame.nvim',
  lazy = false,
  config = function()
    require('blame').setup {}
    vim.keymap.set('n', '<leader>gb', '<cmd>BlameToggle<cr>', { desc = 'Toggle Git Blame' })
  end,
  opts = {
    blame_options = { '-w' },
  },
}
