return {
  'HiPhish/rainbow-delimiters.nvim',
  dependencies = { 'lukas-reineke/indent-blankline.nvim' },
  event = { 'BufReadPost', 'BufNewFile' },
  ---@type rainbow_delimiters.config
  config = function()
    local rainbow_delimiters = require 'rainbow-delimiters'

    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        commonlisp = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterOrange',
        'RainbowDelimiterYellow',
        'RainbowDelimiterGreen',
        'RainbowDelimiterCyan',
        'RainbowDelimiterBlue',
        'RainbowDelimiterViolet',
      },
      blacklist = { 'c', 'cpp' },
    }
  end,
}
