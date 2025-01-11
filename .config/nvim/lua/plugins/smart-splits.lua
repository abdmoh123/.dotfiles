return {
  'mrjones2014/smart-splits.nvim',
  config = function()
    require('smart-splits').setup {
      multiplexer_integration = 'wezterm',
    }

    -- smart-splits window navigation including terminal integration
    vim.keymap.set(
      { 'n', 't' },
      '<A-h>',
      require('smart-splits').move_cursor_left,
      { desc = 'Move focus to the left window' }
    )
    vim.keymap.set(
      { 'n', 't' },
      '<A-l>',
      require('smart-splits').move_cursor_right,
      { desc = 'Move focus to the right window' }
    )
    vim.keymap.set(
      { 'n', 't' },
      '<A-j>',
      require('smart-splits').move_cursor_down,
      { desc = 'Move focus to the lower window' }
    )
    vim.keymap.set(
      { 'n', 't' },
      '<A-k>',
      require('smart-splits').move_cursor_up,
      { desc = 'Move focus to the upper window' }
    )

    -- smart-splits resizing (more intuitive resizing) including terminal integration
    vim.keymap.set({ 'n', 't' }, '<A-H>', require('smart-splits').resize_left, { desc = 'Reize window left' })
    vim.keymap.set({ 'n', 't' }, '<A-L>', require('smart-splits').resize_right, { desc = 'Reize window right' })
    vim.keymap.set({ 'n', 't' }, '<A-J>', require('smart-splits').resize_down, { desc = 'Reize window down' })
    vim.keymap.set({ 'n', 't' }, '<A-K>', require('smart-splits').resize_up, { desc = 'Reize window up' })

    -- swapping buffers between windows (not possible in terminal mode)
    vim.keymap.set('n', '<C-W><A-h>', require('smart-splits').swap_buf_left, { desc = 'Swap with window to left' })
    vim.keymap.set('n', '<C-W><A-l>', require('smart-splits').swap_buf_right, { desc = 'Swap with window to right' })
    vim.keymap.set('n', '<C-W><A-j>', require('smart-splits').swap_buf_down, { desc = 'Swap with window below' })
    vim.keymap.set('n', '<C-W><A-k>', require('smart-splits').swap_buf_up, { desc = 'Swap with window above' })
  end,
}
