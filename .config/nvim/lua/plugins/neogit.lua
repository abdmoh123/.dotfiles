return {
  'NeogitOrg/neogit',
  cmd = { 'Neogit' },
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration

    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
  },
  config = true,
  opts = {
    graph_style = 'unicode',
    disable_signs = true,
  },
  keys = {
    { '<leader>gn', '<CMD>Neogit<CR>', desc = 'Open Neogit' },
  },
}
