-- File: lua/custom/plugins/neotree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      source_selector = {
        winbar = false,
        statusline = true,
        separator = { left = '', right = '' },
      },
      filesystem = {
        group_empty_dirs = true,
      },
      buffers = {
        group_empty_dirs = true,
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
        },
      },
    }
  end,
}
