-- File: lua/custom/plugins/lualine.lua

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      component_separators = { left = '│', right = '│' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = { 'neo-tree' },
      },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' }, right_padding = 2 },
      },
      lualine_c = {
        { 'filename' },
        { 'filesize' },
      },
      lualine_z = {
        { 'location', separator = { right = '' }, left_padding = 2 },
      },
    },
  },
}
