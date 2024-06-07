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
        { text = { '%s' }, click = 'v:lua.ScSa' },
        {
          text = { builtin.lnumfunc, ' ' },
          condition = { true, builtin.not_empty },
          click = 'v:lua.ScLa',
        },
        { text = { builtin.foldfunc, ' ' }, click = 'v:lua.ScFa' },
      },
    }
  end,
}
