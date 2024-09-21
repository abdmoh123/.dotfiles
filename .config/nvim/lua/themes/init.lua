-- File: lua/custom/themes/init.lua

-- import any theme configs
require 'themes.configs'

-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
-- list of themes shown below
local themes = {
  {
    -- gruvbox dark and light theme
    'ellisonleao/gruvbox.nvim',
    event = 'VeryLazy',
    config = function()
      require('gruvbox').setup {
        transparent_mode = true,
        inverse = false,
      }
    end,
  },
  {
    -- gruvbox material theme
    'sainnhe/gruvbox-material',
    event = 'VeryLazy',
  },
  {
    'sainnhe/everforest',
    priority = 1000,
    lazy = false,
    init = function()
      vim.cmd.colorscheme 'everforest'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'folke/tokyonight.nvim',
    event = 'VeryLazy',
  },
  {
    'savq/melange-nvim',
    event = 'VeryLazy',
  },
}

return themes
