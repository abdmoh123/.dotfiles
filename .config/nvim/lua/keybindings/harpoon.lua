-- File: lua/keybindings/harpoon.lua

vim.keymap.set('n', '<leader>m', '<Cmd>lua require("harpoon.mark").add_file()<CR>', { desc = 'Add current file to [M]ark list' })
vim.keymap.set('n', '<leader>h', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = 'Open [H]arpoon menu' })
vim.keymap.set('n', '<leader>n', '<Cmd>lua require("harpoon.ui").nav_next()<CR>', { desc = '[N]avigate to next mark' })
vim.keymap.set('n', '<leader>N', '<Cmd>lua require("harpoon.ui").nav_prev()<CR>', { desc = '[N]avigate to previous mark' })
