return {
  'nvim-flutter/flutter-tools.nvim',
  ft = { 'dart' },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = true,
  init = function()
    require('flutter-tools').setup()
  end,
}
