return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    interactions = {
      chat = {
        adapter = 'opencode',
        opts = {
          completion_provider = 'blink',
        },
      },
      inline = {
        adapter = 'opencode',
        keymaps = {
          accept_change = {
            modes = { n = '<leader>ady' },
          },
          reject_change = {
            modes = { n = '<leader>adx' },
          },
          always_accept = {
            modes = { n = '<leader>adY' },
          },
        },
      },
      cmd = {
        adapter = 'opencode',
      },
    },
    adapters = {
      acp = {
        gemini_cli = function()
          return require('codecompanion.adapters').extend('gemini_cli', {
            defaults = {
              auth_method = 'gemini-api-key',
            },
          })
        end,
      },
    },
    opts = {
      log_level = 'DEBUG',
    },
  },
}
