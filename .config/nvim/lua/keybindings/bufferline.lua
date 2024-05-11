-- File: lua/keybindings/bufferline.lua

vim.keymap.set('n', '<leader>bn', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Switch to next buffer' })
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Switch to previous buffer' })
