-- File: lua/keybindings/file-explorer.lua

-- Set Neotree toggle keymap
vim.keymap.set('n', '<leader><Tab>', ':Neotree float<CR>', { desc = 'Reveal Explorer', silent = true })
-- Set oil.nvim keymap
vim.keymap.set('n', '<leader>-', ':Oil<CR>', { desc = 'Open directory in oil.nvim' })
