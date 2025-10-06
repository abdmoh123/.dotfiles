return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'ibl',
  config = function()
    local rainbow_highlight_colours = {
      'RainbowDelimiterRed',
      'RainbowDelimiterOrange',
      'RainbowDelimiterYellow',
      'RainbowDelimiterGreen',
      'RainbowDelimiterCyan',
      'RainbowDelimiterBlue',
      'RainbowDelimiterViolet',
    }

    require('ibl').setup {
      indent = { char = '▏' },
      scope = { highlight = rainbow_highlight_colours },
    }

    -- makes the scope colour match with the indentation level and rainbow delimiters
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  end,
}
