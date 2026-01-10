-- File: lua/kickstart/plugins/mini.lua

-- Collection of various small independent plugins/modules
return {
  'nvim-mini/mini.nvim',
  version = false,
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

    require('mini.pairs').setup {
      modes = { insert = true, command = true, terminal = false },
    }

    require('mini.move').setup {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<M-h>',
        right = '<M-l>',
        down = '<M-j>',
        up = '<M-k>',

        -- Disable move line in normal mode (use V to select line in visual mode)
        line_left = '',
        line_right = '',
        line_down = '',
        line_up = '',
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    }

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
      options = {
        use_as_default_explorer = false, -- use oil.nvim
      },
      windows = {
        preview = true,
        width_focus = 50,
        width_preview = 80, -- follows the standard 80 column rule
      },
    }

    -- open MiniFiles at current file directory like oil.nvim
    vim.keymap.set('n', '-', function()
      MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
      MiniFiles.reveal_cwd()
    end, { desc = 'Open MiniFiles tree' })

    -- add relative numbers to MiniFiles window
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowUpdate',
      callback = function(args)
        vim.wo[args.data.win_id].relativenumber = true
        vim.wo[args.data.win_id].number = true
      end,
    })

    -- make '_' key reset to project cwd like oil.nvim
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesExplorerOpen',
      callback = function()
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
