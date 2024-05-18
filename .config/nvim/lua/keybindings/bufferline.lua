-- File: lua/keybindings/bufferline.lua

vim.keymap.set('n', 'gb', '<Cmd>BufferLineCycleNext<CR>', { desc = '[G]oto next [B]uffer' })
vim.keymap.set('n', 'gB', '<Cmd>BufferLineCyclePrev<CR>', { desc = '[G]oto previous [B]uffer' })
vim.keymap.set('n', '<leader>b>', '<Cmd>BufferLineMoveNext<CR>', { desc = 'Move current [B]uffer right' })
vim.keymap.set('n', '<leader>b<', '<Cmd>BufferLineMovePrev<CR>', { desc = 'Move current [B]uffer left' })
vim.keymap.set('n', '<leader>bdr', '<Cmd>BufferLineCloseRight<CR>', { desc = '[D]elete all visible [B]uffers to the [R]ight' })
vim.keymap.set('n', '<leader>bdl', '<Cmd>BufferLineCloseLeft<CR>', { desc = '[D]elete all visible [B]uffers to the [L]eft' })
vim.keymap.set('n', '<leader>bdd', '<Cmd>BufferLineCloseOthers<CR>', { desc = '[D]elete all other visible [B]uffers' })
vim.keymap.set('n', '<leader>bP', '<Cmd>BufferLinePick<CR>', { desc = '[P]ick a [B]uffer' })
vim.keymap.set('n', '<leader>bD', '<Cmd>BufferLinePickClose<CR>', { desc = 'Pick a [B]uffer to [D]elete' })
