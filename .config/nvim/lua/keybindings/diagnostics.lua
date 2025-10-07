-- File: lua/keybindings/diagnostics.lua

local M = {}

M.keymaps = {
  {
    mode = 'n',
    lhs = '[d',
    rhs = function()
      vim.diagnostic.jump { count = -1, float = true }
    end,
    opts = { desc = 'Go to previous [D]iagnostic message' },
  },
  {
    mode = 'n',
    lhs = ']d',
    rhs = function()
      vim.diagnostic.jump { count = 1, float = true }
    end,
    opts = { desc = 'Go to next [D]iagnostic message' },
  },
  {
    mode = 'n',
    lhs = '<leader>e',
    rhs = vim.diagnostic.open_float,
    opts = { desc = 'Show diagnostic [E]rror messages' },
  },
  {
    mode = 'n',
    lhs = '<leader>q',
    rhs = vim.diagnostic.setloclist,
    opts = { desc = 'Open diagnostic [Q]uickfix list' },
  },
}

return M
