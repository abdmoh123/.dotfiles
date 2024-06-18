-- File: lua/keybindings/git.lua

-- [[ Gitsigns keybindings ]]
vim.keymap.set('n', '<leader>gK', '<cmd>Gitsigns preview_hunk<cr>', { desc = 'Preview [G]it hunk' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gitsigns diffthis<cr>', { desc = '[G]it [D]iff current buffer' })

vim.keymap.set('n', '<leader>ga', '<cmd>Gitsigns stage_hunk<cr>', { desc = '[G]it [A]dd/stage current hunk' })
vim.keymap.set('n', '<leader>gA', '<cmd>Gitsigns stage_buffer<cr>', { desc = '[G]it [A]dd/stage current buffer' })

vim.keymap.set('n', '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', { desc = '[G]it [R]eset current hunk' })
vim.keymap.set('n', '<leader>gR', '<cmd>Gitsigns reset_buffer<cr>', { desc = '[G]it [R]eset current buffer' })

vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', { desc = 'Toggle [G]it [B]lame' })

-- git hunk navigation
vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<cr>', { desc = 'Next Git [H]unk' })
vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<cr>', { desc = 'Previous Git [H]unk' })
vim.keymap.set('n', 'gh', '<cmd>Gitsigns next_hunk<cr>', { desc = '[G]oto next Git [H]unk' })
vim.keymap.set('n', 'gH', '<cmd>Gitsigns prev_hunk<cr>', { desc = '[G]oto previous Git [H]unk' })

-- [[ LazyGit keybinding ]]
vim.keymap.set('n', '<leader>gg', '<cmd>LazyGit<cr>', { desc = 'Open Lazy[G]it' })
