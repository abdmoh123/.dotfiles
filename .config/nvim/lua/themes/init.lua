-- File: lua/custom/themes/init.lua

-- import any theme configs
require 'themes.configs'

local M = {}

-- apply the default theme
function M.init()
  vim.cmd.colorscheme 'everforest'
  vim.cmd.hi 'Comment gui=none'
end

-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
-- list of themes shown below
M.themes = {
  {
    -- gruvbox dark and light theme
    'ellisonleao/gruvbox.nvim',
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
  },
  {
    'sainnhe/everforest',
    priority = 1000,
    lazy = false,
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'savq/melange-nvim',
  },
}

return M
