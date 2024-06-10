-- File: lua/custom/themes/init.lua

-- import any theme configs
require 'themes.configs'

-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
-- list of themes shown below
local themes = {
  {
    -- gruvbox dark and light theme
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
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
    priority = 1000,
    init = function()
      -- Set default theme to gruvbox-material
      vim.cmd.colorscheme 'gruvbox-material'
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  {
    'sainnhe/everforest',
    priority = 1000,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
  },
  {
    'savq/melange-nvim',
    priority = 1000,
  },
}

return themes
