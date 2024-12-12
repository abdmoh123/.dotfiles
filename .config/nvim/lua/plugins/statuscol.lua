printed = false

return {
  'luukvbaal/statuscol.nvim',
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      -- configuration goes here, for example:
      -- relculright = true,
      ft_ignore = { 'neo-tree' },
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
        -- fold column
        { text = { builtin.foldfunc, ' ' }, colwidth = 2, maxwidth = 2, click = 'v:lua.ScFa' },
        -- git signs
        {
          sign = { namespace = { 'gitsigns' } },
          click = 'v:lua.ScSa',
        },
      },
    }
  end,
}
