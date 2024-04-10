-- File: lua/custom/plugins/gruvbox.lua

return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require('gruvbox').setup {
      transparent_mode = true,
    }
  end,
}
