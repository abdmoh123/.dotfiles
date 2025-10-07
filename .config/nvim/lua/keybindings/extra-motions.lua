-- File: lua/keybindings/extra-motions.lua

local M = {}

M.keymaps = {
  { mode = 'i', lhs = '<A-BS>', rhs = '<C-w>', opts = { desc = 'Delete word before the cursor' } },
  { mode = 'i', lhs = '<A-Delete>', rhs = '<C-o>dw', opts = { desc = 'Delete word after the cursor' } },
  { mode = 'i', lhs = '<C-Delete>', rhs = '<C-o>dw', opts = { desc = 'Delete word after the cursor' } },
}

return M
