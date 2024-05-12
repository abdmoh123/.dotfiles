-- File: lua/keybindings/bufferline.lua

vim.keymap.set('n', '<leader>bn', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Switch to previous buffer' })
vim.keymap.set('n', '<leader>b>', '<Cmd>BufferLineMoveNext<CR>', { desc = 'Move current buffer right' })
vim.keymap.set('n', '<leader>b<', '<Cmd>BufferLineMovePrev<CR>', { desc = 'Move current buffer left' })
vim.keymap.set('n', '<leader>bdr', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Close all visible buffers to the right' })
vim.keymap.set('n', '<leader>bdl', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Close all visible buffers to the left' })
vim.keymap.set('n', '<leader>bdd', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Close all other visible buffers' })
vim.keymap.set('n', '<leader>bP', '<Cmd>BufferLinePick<CR>', { desc = 'Pick a buffer' })
vim.keymap.set('n', '<leader>bD', '<Cmd>BufferLinePickClose<CR>', { desc = 'Pick a buffer to close' })
