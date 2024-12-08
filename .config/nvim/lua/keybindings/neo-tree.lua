-- File: lua/keybindings/neo-tree.lua

-- Set Neotree toggle keymap
vim.keymap.set('n', '<leader><Tab>', ':Neotree float<CR>', { desc = 'Reveal Explorer', silent = true })
