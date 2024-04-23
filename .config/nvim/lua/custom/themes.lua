-- File: lua/custom/plugins/themes.lua

return {
  {
    -- gruvbox dark and light theme
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1001,
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
  },
}
