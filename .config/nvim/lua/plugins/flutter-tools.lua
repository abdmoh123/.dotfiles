return {
  'nvim-flutter/flutter-tools.nvim',
  ft = 'dart',
  dependencies = 'nvim-lua/plenary.nvim',
  config = function(_, opts)
    -- for some reason the lsp doesn't work unless this line is added
    vim.lsp.enable 'dartls'

    require('flutter-tools').setup(opts)
  end,
  opts = {
    flutter_lookup_cmd = 'dirname $(which flutter)',
  },
}
