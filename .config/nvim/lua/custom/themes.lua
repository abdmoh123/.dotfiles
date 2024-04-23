-- File: lua/custom/plugins/themes.lua

-- gruvbox material settings
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'mix'
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_statusline_style = 'mix'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_better_performance = 1

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
