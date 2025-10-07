-- File: lua/custom/keybindings/init.lua

--  See `:help vim.keymap.set()`

local diagnostic_keymaps = require('keybindings.diagnostics').keymaps
local extra_motions_keymaps = require('keybindings.extra-motions').keymaps

local function apply_keymap(keymap_tables)
  for _, keymap_table in pairs(keymap_tables) do
    local opts = keymap_table.opts or {}
    vim.keymap.set(keymap_table.mode, keymap_table.lhs, keymap_table.rhs, opts)
  end
end

apply_keymap(diagnostic_keymaps)
apply_keymap(extra_motions_keymaps)
