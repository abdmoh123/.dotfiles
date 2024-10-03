-- File: lua/custom/plugins/bufferline.lua

return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
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
      -- groups = {
      --   options = {
      --     -- reopens hidden buffer groups when in use
      --     toggle_hidden_on_enter = true,
      --   },
      --   items = {
      --     {
      --       name = 'Terminals',
      --       matcher = function(buf)
      --         -- stylua: ignore start
      --         return buf.name:match 'pwsh.EXE'
      --                or buf.name:match 'cmd'
      --                or buf.name:match 'bash'
      --                or buf.name:match 'zsh'
      --         -- stylua: ignore end
      --       end,
      --     },
      --     {
      --       name = 'C source files',
      --       matcher = function(buf)
      --         -- stylua: ignore start
      --         return buf.name:match '%.c'
      --                or buf.name:match '%.cpp'
      --                or buf.name:match '%.cc'
      --                or buf.name:match '%.cxx'
      --         -- stylua: ignore end
      --       end,
      --     },
      --     {
      --       name = 'C headers',
      --       matcher = function(buf)
      --         return buf.name:match '%.h' or buf.name:match '%.hpp'
      --       end,
      --     },
      --     {
      --       name = 'XML files',
      --       matcher = function(buf)
      --         return buf.name:match '%.xml' or buf.name:match '%.xaml' or buf.name:match '%.fxml'
      --       end,
      --     },
      --   },
      -- },
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
    },
  },
}
