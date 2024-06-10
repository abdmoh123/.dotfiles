return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    -- smart-splits resizing (more intuitive resizing)
    vim.keymap.set('n', '<A-H>', require('smart-splits').resize_left, { desc = 'Reize window left' })
    vim.keymap.set('n', '<A-L>', require('smart-splits').resize_right, { desc = 'Reize window right' })
    vim.keymap.set('n', '<A-J>', require('smart-splits').resize_down, { desc = 'Reize window down' })
    vim.keymap.set('n', '<A-K>', require('smart-splits').resize_up, { desc = 'Reize window up' })
    -- swapping buffers between windows
    vim.keymap.set('n', '<C-W><A-h>', require('smart-splits').swap_buf_left, { desc = 'Swap with window to left' })
    vim.keymap.set('n', '<C-W><A-l>', require('smart-splits').swap_buf_right, { desc = 'Swap with window to right' })
    vim.keymap.set('n', '<C-W><A-j>', require('smart-splits').swap_buf_down, { desc = 'Swap with window below' })
    vim.keymap.set('n', '<C-W><A-k>', require('smart-splits').swap_buf_up, { desc = 'Swap with window above' })
  end,
}
