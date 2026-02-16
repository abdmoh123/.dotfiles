local M = {}

-- Clear highlighting on pressing <Esc> in normal mode
M.keymaps = {
  { mode = 'n', lhs = '<Esc>', rhs = '<cmd>nohlsearch<CR>', opts = {} },
}

return M
