-- File: lua/kickstart/plugins/gitsigns.lua

-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do

-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {},
  keys = {
    { '<leader>gK', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview [G]it hunk' },
    { '<leader>gd', '<cmd>Gitsigns diffthis<cr>', desc = '[G]it [D]iff current buffer' },
    { '<leader>ga', '<cmd>Gitsigns stage_hunk<cr>', desc = '[G]it [A]dd/stage current hunk' },
    { '<leader>gA', '<cmd>Gitsigns stage_buffer<cr>', desc = '[G]it [A]dd/stage current buffer' },
    { '<leader>gr', '<cmd>Gitsigns reset_hunk<cr>', desc = '[G]it [R]eset current hunk' },
    { '<leader>gR', '<cmd>Gitsigns reset_buffer<cr>', desc = '[G]it [R]eset current buffer' },
    { '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', desc = 'Toggle [G]it [B]lame' },
    { ']h', '<cmd>Gitsigns next_hunk<cr>', desc = 'Next Git [H]unk' },
    { '[h', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Previous Git [H]unk' },
    { 'gh', '<cmd>Gitsigns next_hunk<cr>', desc = '[G]oto next Git [H]unk' },
    { 'gH', '<cmd>Gitsigns prev_hunk<cr>', desc = '[G]oto previous Git [H]unk' },
  },
}
