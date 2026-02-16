-- File: lua/custom/keybindings/init.lua

local M = {}

--  See `:help vim.keymap.set()`

M.apply_keymap = function(keymap_tables)
  for _, keymap_table in pairs(keymap_tables) do
    local opts = keymap_table.opts or {}
    vim.keymap.set(keymap_table.mode, keymap_table.lhs, keymap_table.rhs, opts)
  end
end

M.setup = function()
  local diagnostic_keymaps = require('keybindings.diagnostics').keymaps
  local extra_motions_keymaps = require('keybindings.extra-motions').keymaps
  local miscellaneous_keymaps = require('keybindings.miscellaneous').keymaps

  M.apply_keymap(diagnostic_keymaps)
  M.apply_keymap(extra_motions_keymaps)
  M.apply_keymap(miscellaneous_keymaps)
end

return M
