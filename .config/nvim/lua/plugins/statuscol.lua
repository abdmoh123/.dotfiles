return {
  'luukvbaal/statuscol.nvim',
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      -- configuration goes here, for example:
      ft_ignore = { 'neo-tree', 'undotree' },
      bt_ignore = { 'neo-tree' },
      segments = {
        -- diagnostic signs
        {
          sign = { namespace = { 'diagnostic/signs' }, colwidth = 2, maxwidth = 1, auto = true, foldclosed = true },
          click = 'v:lua.ScSa',
        },
        -- line numbers
        {
          text = { ' ', builtin.lnumfunc, ' ' },
          click = 'v:lua.ScLa',
        },
        -- git signs
        {
          sign = { namespace = { 'gitsigns' }, colwidth = 1, auto = true },
          click = 'v:lua.ScSa',
        },
        -- fold column
        {
          text = { builtin.foldfunc, ' ' },
          colwidth = 2,
          maxwidth = 2,
          click = 'v:lua.ScFa',
        },
      },
    }
  end,
}
