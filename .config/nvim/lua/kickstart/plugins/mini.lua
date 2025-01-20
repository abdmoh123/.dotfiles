-- File: lua/kickstart/plugins/mini.lua

-- Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [']quote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Parentheses
    -- - sd'   - [S]urround [D]elete [']quotes
    -- - sr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup()

    -- mini files
    require('mini.files').setup {
      mappings = {
        close = 'q',
        go_in = '<Enter>',
        go_in_plus = 'L',
        go_out = '-',
        go_out_plus = 'H',
        mark_goto = "'",
        mark_set = 'm',
        reset = '_',
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
      windows = { preview = true },
    }

    vim.keymap.set('n', '-', function()
      MiniFiles.open()
    end, { desc = 'Open MiniFiles tree' })
  end,
}
