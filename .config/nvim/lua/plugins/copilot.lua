return {
  'github/copilot.vim',
  init = function()
    -- Allow CTRL-Y to accept copilot suggestions
    vim.keymap.set(
      'i',
      '<C-y>',
      'copilot#Accept()',
      { desc = 'Accept copilot', replace_keycodes = false, expr = true, silent = true, noremap = false }
    )

    -- Allow CTRL-P and CTRL-N to navigate through copilot suggestions
    vim.keymap.set(
      'i',
      '<C-n>',
      'copilot#Next()',
      { desc = 'Next copilot suggestion', replace_keycodes = false, expr = true, silent = true, noremap = false }
    )
    vim.keymap.set(
      'i',
      '<C-p>',
      'copilot#Previous()',
      { desc = 'Next copilot suggestion', replace_keycodes = false, expr = true, silent = true, noremap = false }
    )
  end,
}
