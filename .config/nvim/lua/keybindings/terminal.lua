-- File: lua/keybindings/terminal.lua

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds for starting a terminal window
vim.keymap.set('n', '<C-t>s', '<Cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Open [T]erminal' })
vim.keymap.set('n', '<C-t>v', '<Cmd>ToggleTerm direction=vertical<CR>', { desc = 'Open [T]erminal [V]ertically' })
vim.keymap.set('n', '<C-t>f', '<Cmd>ToggleTerm direction=float<CR>', { desc = 'Open [F]loating [T]erminal' })
vim.keymap.set('n', '<C-t>t', '<Cmd>ToggleTerm direction=tab<CR>', { desc = 'Open [T]erminal in new [T]ab' })
