-- File: lua/custom/plugins/gruvbox.lua

return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1001,
  config = function()
    require('gruvbox').setup {
      transparent_mode = true,
      inverse = false,
    }
  end,
}
