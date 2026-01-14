local colours = require 'utils.colours'

return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = { 'HiPhish/rainbow-delimiters.nvim' },
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = { char = '▏' },
    scope = { highlight = colours.rainbow_highlights },
  },
  ---@param opts ibl.config
  config = function(_, opts)
    -- makes the scope colour match with the indentation level and rainbow delimiters
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    require('ibl').setup(opts)
  end,
}
