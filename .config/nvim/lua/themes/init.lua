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
    opts = {
      transparent_mode = true,
      inverse = false,
    },
  },
  {
    -- gruvbox material theme
    'sainnhe/gruvbox-material',
  },
  {
    'sainnhe/everforest',
  },
  {
    'folke/tokyonight.nvim',
  },
  {
    'savq/melange-nvim',
  },
  {
    'maxmx03/fluoromachine.nvim',
    opts = {
      glow = true,
      theme = 'fluoromachine',
    },
  },
  {
    'nyngwang/nvimgelion',
  },
}

-- apply global properties to all themes
for _, theme in ipairs(M.themes) do
  theme.priority = 1000
  theme.lazy = false
end

return M
