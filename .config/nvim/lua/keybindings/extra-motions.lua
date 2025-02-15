-- File: lua/keybindings/extra-motions.lua

vim.keymap.set('i', '<A-BS>', '<C-w>', { desc = 'Delete word before the cursor' })
vim.keymap.set('i', '<A-Delete>', '<C-o>dw', { desc = 'Delete word after the cursor' })
vim.keymap.set('i', '<C-Delete>', '<C-o>dw', { desc = 'Delete word after the cursor' })
