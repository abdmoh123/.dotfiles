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

    -- mini files (oil.nvim like file tree)
    require('mini.files').setup {
      mappings = {
        close = 'q',
        go_in = 'L', -- doesn't open files
        go_in_plus = '<Enter>', -- opens files
        go_out = 'H',
        go_out_plus = '-',
        mark_goto = "'",
        mark_set = 'm',
        reset = '', -- disable in favour of autocmd below
        reveal_cwd = '@',
        show_help = 'g?',
        synchronize = '=',
        trim_left = '<',
        trim_right = '>',
      },
      windows = { preview = true },
    }

    -- open MiniFiles at current file directory like oil.nvim
    vim.keymap.set('n', '-', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
      vim.defer_fn(function()
        MiniFiles.reveal_cwd()
      end, 30)
    end, { desc = 'Open MiniFiles tree' })

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowUpdate',
      callback = function(args)
        -- add relative numbers to MiniFiles window
        vim.wo[args.data.win_id].relativenumber = true

        -- make '_' key reset to project cwd like oil.nvim
        vim.keymap.set('n', '_', function()
          MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        end, { desc = 'Reset to project cwd' })
      end,
    })

    -- make window border round
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id = args.data.win_id

        local config = vim.api.nvim_win_get_config(win_id)
        config.border = 'rounded'
        vim.api.nvim_win_set_config(win_id, config)
      end,
    })
  end,
}
