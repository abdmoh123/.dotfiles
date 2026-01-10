-- File: lua/custom/plugins/lualine.lua

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      icons_enabled = true,
      component_separators = { left = '│', right = '│' },
      section_separators = { left = '', right = '' },
      globalstatus = true,
    },
    sections = {
      lualine_c = {
        { 'filename' },
        { 'filesize' },
      },
    },
  },
}
