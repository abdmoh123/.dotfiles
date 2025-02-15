return {
  'github/copilot.vim',
  init = function()
    -- Tab is used to accept copilot suggestion
    -- Allow ALT-P and ALT-N to navigate through copilot suggestions
    vim.keymap.set(
      'i',
      '<A-n>',
      'copilot#Next()',
      { desc = 'Next copilot suggestion', replace_keycodes = false, expr = true, silent = true, noremap = false }
    )
    vim.keymap.set(
      'i',
      '<A-p>',
      'copilot#Previous()',
      { desc = 'Next copilot suggestion', replace_keycodes = false, expr = true, silent = true, noremap = false }
    )
  end,
}
