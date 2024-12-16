return {
  'HiPhish/rainbow-delimiters.nvim',
  dependencies = { 'lukas-reineke/indent-blankline.nvim' },
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
        'rainbowcol1',
        'rainbowcol2',
        'rainbowcol3',
        'rainbowcol4',
        'rainbowcol5',
        'rainbowcol6',
        'rainbowcol7',
      },
      blacklist = { 'c', 'cpp' },
    }
  end,
}
