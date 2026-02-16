return {
  'nickjvandyke/opencode.nvim',
  dependencies = {
    ---@module 'snacks'
    'folke/snacks.nvim',
  },
  config = function(_, opts)
    local opencode = require 'opencode'

    ---@type opencode.Opts
    vim.g.opencode_opts = opts
    vim.o.autoread = true

    -- ask opencode
    vim.keymap.set({ 'n', 'x' }, '<C-a>', function()
      opencode.ask('@this: ', { submit = true })
    end, { desc = 'Ask opencode…' })

    -- execute opencode action
    vim.keymap.set({ 'n', 'x' }, '<C-x>', function()
      opencode.select()
    end, { desc = 'Execute opencode action…' })

    -- toggle opencode window
    vim.keymap.set({ 'n', 't' }, '<C-.>', function()
      opencode.toggle()
    end, { desc = 'Toggle opencode' })

    -- adding selection to opencode supports ranges and dot-repeats
    vim.keymap.set({ 'n', 'x' }, 'go', function()
      return opencode.operator '@this '
    end, { desc = 'Add range to opencode', expr = true })
    vim.keymap.set('n', 'goo', function()
      return opencode.operator '@this ' .. '_'
    end, { desc = 'Add line to opencode', expr = true })

    -- scroll opencode up and down
    vim.keymap.set('n', '<S-C-u>', function()
      opencode.command 'session.half.page.up'
    end, { desc = 'Scroll opencode up' })
    vim.keymap.set('n', '<S-C-d>', function()
      opencode.command 'session.half.page.down'
    end, { desc = 'Scroll opencode down' })

    -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above
    -- otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap).
    vim.keymap.set('n', '+', '<C-a>', { desc = 'Increment under cursor', noremap = true })
    vim.keymap.set('n', '-', '<C-x>', { desc = 'Decrement under cursor', noremap = true })
  end,
}
