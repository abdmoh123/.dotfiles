return {
  'luukvbaal/statuscol.nvim',
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      -- configuration goes here, for example:
      ft_ignore = {
        'neo-tree',
        'undotree',
        'diff',
        'alpha',
        'dapui_scopes',
        'dapui_watches',
        'dapui_breakpoints',
        'dapui_console',
        'dapui_stacks',
        'dap-repl',
      },
      segments = {
        -- diagnostic signs
        {
          sign = { namespace = { 'diagnostic.signs' }, colwidth = 2, maxwidth = 1, auto = true, foldclosed = true },
          click = 'v:lua.ScSa',
        },
        -- debug icons (e.g. breakpoint)
        {
          sign = { name = { 'Dap*' }, maxwidth = 1 },
          click = 'v:lua.ScLa',
        },
        -- line numbers
        {
          text = { builtin.lnumfunc, ' ' },
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
