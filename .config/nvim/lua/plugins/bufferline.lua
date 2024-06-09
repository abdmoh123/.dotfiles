-- File: lua/custom/plugins/bufferline.lua

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options = {
      mode = 'buffers',
      themable = true,
      numbers = 'buffer_id',
      indicator = {
        icon = '▌',
        style = 'icon',
      },
      offsets = {
        {
          filetype = 'neo-tree',
          text = '󰙅 Explorer',
          text_align = 'left',
          separator = '┃',
        },
      },
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
      separator_style = { '', '' }, -- disable separators
      always_show_bufferline = false,
      auto_toggle_bufferline = true,
    },
  },
}
