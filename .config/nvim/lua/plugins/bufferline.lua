-- File: lua/custom/plugins/bufferline.lua

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  event = 'VimEnter',
  opts = {
    highlights = {
      -- Make offset separator match the pane border
      offset_separator = {
        bg = {
          attribute = 'bg',
          highlight = 'FloatBoarder',
        },
      },
    },
    options = {
      mode = 'buffers',
      themable = true,
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
      diagnostics = 'nvim_lsp',
      close_comand = function(buf)
        require('snacks').bufdelete(buf)
      end,
      right_mouse_comand = function(buf)
        require('snacks').bufdelete(buf)
      end,
    },
  },
  keys = {
    { 'gb', '<Cmd>BufferLineCycleNext<CR>', desc = '[G]oto next [B]uffer' },
    { 'gB', '<Cmd>BufferLineCyclePrev<CR>', desc = '[G]oto previous [B]uffer' },
    { '<leader>b>', '<Cmd>BufferLineMoveNext<CR>', desc = 'Move current [B]uffer right' },
    { '<leader>b<', '<Cmd>BufferLineMovePrev<CR>', desc = 'Move current [B]uffer left' },
    { '<leader>bdr', '<Cmd>BufferLineCloseRight<CR>', desc = '[D]elete all visible [B]uffers to the [R]ight' },
    { '<leader>bdl', '<Cmd>BufferLineCloseLeft<CR>', desc = '[D]elete all visible [B]uffers to the [L]eft' },
    { '<leader>bdd', '<Cmd>BufferLineCloseOthers<CR>', desc = '[D]elete all other visible [B]uffers' },
    { '<leader>bp', '<Cmd>BufferLinePick<CR>', desc = '[P]ick a [B]uffer' },
    { '<leader>bD', '<Cmd>BufferLinePickClose<CR>', desc = 'Pick a [B]uffer to [D]elete' },
  },
}
